using Microsoft.Data.Sqlite;

var dataDirectory = Path.Combine(
    Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
    "GlobalSoft",
    "data");
Directory.CreateDirectory(dataDirectory);

var databasePath = Path.Combine(dataDirectory, "globalsoft-local.db");
await using var connection = new SqliteConnection($"Data Source={databasePath}");
await connection.OpenAsync();

var command = connection.CreateCommand();
command.CommandText = """
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
await command.ExecuteNonQueryAsync();

Console.WriteLine($"GlobalSoft local store ready: {databasePath}");
