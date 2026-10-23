using System.Text.Json;
using Microsoft.Data.Sqlite;

namespace GlobalSoft.Modernization.Local;

public sealed record LocalSaleLine(Guid ProductId, decimal Quantity, decimal UnitPrice, decimal TaxRate);

public sealed record LocalSale(
    Guid OperationId,
    Guid SiteId,
    Guid DeviceId,
    Guid CashSessionId,
    Guid UserId,
    string Number,
    IReadOnlyList<LocalSaleLine> Lines,
    IReadOnlyList<LocalPayment> Payments);

public sealed record LocalPayment(string Method, decimal Amount);

public sealed class LocalStore
{
    private readonly string _connectionString;

    public LocalStore(string databasePath)
    {
        var directory = Path.GetDirectoryName(databasePath);
        if (!string.IsNullOrWhiteSpace(directory))
        {
            Directory.CreateDirectory(directory);
        }

        _connectionString = new SqliteConnectionStringBuilder
        {
            DataSource = databasePath,
            Mode = SqliteOpenMode.ReadWriteCreate
        }.ToString();
    }

    public async Task InitializeAsync(CancellationToken cancellationToken = default)
    {
        await using var connection = await OpenAsync(cancellationToken);
        var command = connection.CreateCommand();
        command.CommandText = """
            PRAGMA foreign_keys = ON;

            CREATE TABLE IF NOT EXISTS sales (
                id TEXT PRIMARY KEY,
                operation_id TEXT NOT NULL UNIQUE,
                site_id TEXT NOT NULL,
                device_id TEXT NOT NULL,
                cash_session_id TEXT NOT NULL,
                user_id TEXT NOT NULL,
                number TEXT NOT NULL,
                subtotal NUMERIC NOT NULL,
                tax_total NUMERIC NOT NULL,
                total NUMERIC NOT NULL,
                status TEXT NOT NULL,
                created_at_utc TEXT NOT NULL
            );

            CREATE TABLE IF NOT EXISTS sale_lines (
                id TEXT PRIMARY KEY,
                sale_id TEXT NOT NULL REFERENCES sales(id),
                product_id TEXT NOT NULL,
                quantity NUMERIC NOT NULL,
                unit_price NUMERIC NOT NULL,
                tax_rate NUMERIC NOT NULL,
                total NUMERIC NOT NULL
            );

            CREATE TABLE IF NOT EXISTS payments (
                id TEXT PRIMARY KEY,
                sale_id TEXT NOT NULL REFERENCES sales(id),
                method TEXT NOT NULL,
                amount NUMERIC NOT NULL
            );

            CREATE TABLE IF NOT EXISTS sync_queue (
                operation_id TEXT PRIMARY KEY,
                device_id TEXT NOT NULL,
                site_id TEXT NOT NULL,
                entity TEXT NOT NULL,
                entity_id TEXT NOT NULL,
                operation_type TEXT NOT NULL,
                payload TEXT NOT NULL,
                sequence INTEGER NOT NULL,
                created_at_utc TEXT NOT NULL,
                status TEXT NOT NULL DEFAULT 'Pending',
                retry_count INTEGER NOT NULL DEFAULT 0,
                last_error TEXT NULL
            );
            """;
        await command.ExecuteNonQueryAsync(cancellationToken);
    }

    public async Task<Guid> SaveSaleAsync(LocalSale sale, CancellationToken cancellationToken = default)
    {
        ArgumentException.ThrowIfNullOrWhiteSpace(sale.Number);
        if (sale.Lines.Count == 0 || sale.Payments.Count == 0)
        {
            throw new ArgumentException("A sale requires at least one line and one payment.", nameof(sale));
        }

        await InitializeAsync(cancellationToken);
        await using var connection = await OpenAsync(cancellationToken);
        await using var transaction = await connection.BeginTransactionAsync(cancellationToken);

        var existingCommand = connection.CreateCommand();
        existingCommand.Transaction = transaction;
        existingCommand.CommandText = "SELECT id FROM sales WHERE operation_id = $operationId";
        existingCommand.Parameters.AddWithValue("$operationId", sale.OperationId.ToString("D"));
        var existing = await existingCommand.ExecuteScalarAsync(cancellationToken);
        if (existing is not null)
        {
            await transaction.CommitAsync(cancellationToken);
            return Guid.Parse((string)existing);
        }

        var saleId = Guid.NewGuid();
        var subtotal = sale.Lines.Sum(x => decimal.Round(x.Quantity * x.UnitPrice, 2));
        var taxTotal = decimal.Round(sale.Lines.Sum(x => x.Quantity * x.UnitPrice * x.TaxRate / 100m), 2);
        var total = subtotal + taxTotal;
        if (sale.Payments.Sum(x => x.Amount) != total)
        {
            throw new ArgumentException("Payment total must equal sale total.", nameof(sale));
        }

        var insertSale = connection.CreateCommand();
        insertSale.Transaction = transaction;
        insertSale.CommandText = """
            INSERT INTO sales
                (id, operation_id, site_id, device_id, cash_session_id, user_id, number,
                 subtotal, tax_total, total, status, created_at_utc)
            VALUES
                ($id, $operationId, $siteId, $deviceId, $cashSessionId, $userId, $number,
                 $subtotal, $taxTotal, $total, 'PendingSync', $createdAtUtc)
            """;
        AddSaleParameters(insertSale, saleId, sale, subtotal, taxTotal, total);
        await insertSale.ExecuteNonQueryAsync(cancellationToken);

        foreach (var line in sale.Lines)
        {
            var command = connection.CreateCommand();
            command.Transaction = transaction;
            command.CommandText = """
                INSERT INTO sale_lines
                    (id, sale_id, product_id, quantity, unit_price, tax_rate, total)
                VALUES ($id, $saleId, $productId, $quantity, $unitPrice, $taxRate, $total)
                """;
            command.Parameters.AddWithValue("$id", Guid.NewGuid().ToString("D"));
            command.Parameters.AddWithValue("$saleId", saleId.ToString("D"));
            command.Parameters.AddWithValue("$productId", line.ProductId.ToString("D"));
            command.Parameters.AddWithValue("$quantity", line.Quantity);
            command.Parameters.AddWithValue("$unitPrice", line.UnitPrice);
            command.Parameters.AddWithValue("$taxRate", line.TaxRate);
            command.Parameters.AddWithValue("$total", decimal.Round(line.Quantity * line.UnitPrice, 2));
            await command.ExecuteNonQueryAsync(cancellationToken);
        }

        foreach (var payment in sale.Payments)
        {
            var command = connection.CreateCommand();
            command.Transaction = transaction;
            command.CommandText = """
                INSERT INTO payments (id, sale_id, method, amount)
                VALUES ($id, $saleId, $method, $amount)
                """;
            command.Parameters.AddWithValue("$id", Guid.NewGuid().ToString("D"));
            command.Parameters.AddWithValue("$saleId", saleId.ToString("D"));
            command.Parameters.AddWithValue("$method", payment.Method);
            command.Parameters.AddWithValue("$amount", payment.Amount);
            await command.ExecuteNonQueryAsync(cancellationToken);
        }

        var queue = connection.CreateCommand();
        queue.Transaction = transaction;
        queue.CommandText = """
            INSERT INTO sync_queue
                (operation_id, device_id, site_id, entity, entity_id, operation_type,
                 payload, sequence, created_at_utc)
            VALUES ($operationId, $deviceId, $siteId, 'Sale', $entityId, 'Create',
                    $payload, $sequence, $createdAtUtc)
            """;
        queue.Parameters.AddWithValue("$operationId", sale.OperationId.ToString("D"));
        queue.Parameters.AddWithValue("$deviceId", sale.DeviceId.ToString("D"));
        queue.Parameters.AddWithValue("$siteId", sale.SiteId.ToString("D"));
        queue.Parameters.AddWithValue("$entityId", saleId.ToString("D"));
        queue.Parameters.AddWithValue("$payload", JsonSerializer.Serialize(sale));
        queue.Parameters.AddWithValue("$sequence", DateTimeOffset.UtcNow.ToUnixTimeMilliseconds());
        queue.Parameters.AddWithValue("$createdAtUtc", DateTime.UtcNow.ToString("O"));
        await queue.ExecuteNonQueryAsync(cancellationToken);

        await transaction.CommitAsync(cancellationToken);
        return saleId;
    }

    private static void AddSaleParameters(
        SqliteCommand command,
        Guid saleId,
        LocalSale sale,
        decimal subtotal,
        decimal taxTotal,
        decimal total)
    {
        command.Parameters.AddWithValue("$id", saleId.ToString("D"));
        command.Parameters.AddWithValue("$operationId", sale.OperationId.ToString("D"));
        command.Parameters.AddWithValue("$siteId", sale.SiteId.ToString("D"));
        command.Parameters.AddWithValue("$deviceId", sale.DeviceId.ToString("D"));
        command.Parameters.AddWithValue("$cashSessionId", sale.CashSessionId.ToString("D"));
        command.Parameters.AddWithValue("$userId", sale.UserId.ToString("D"));
        command.Parameters.AddWithValue("$number", sale.Number);
        command.Parameters.AddWithValue("$subtotal", subtotal);
        command.Parameters.AddWithValue("$taxTotal", taxTotal);
        command.Parameters.AddWithValue("$total", total);
        command.Parameters.AddWithValue("$createdAtUtc", DateTime.UtcNow.ToString("O"));
    }

    private async Task<SqliteConnection> OpenAsync(CancellationToken cancellationToken)
    {
        var connection = new SqliteConnection(_connectionString);
        await connection.OpenAsync(cancellationToken);
        return connection;
    }
}
