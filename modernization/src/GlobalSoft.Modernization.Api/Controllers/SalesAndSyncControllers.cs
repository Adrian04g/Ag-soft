using GlobalSoft.Modernization.Api.Contracts;
using GlobalSoft.Modernization.Api.Data;
using GlobalSoft.Modernization.Api.Domain.Entities;
using GlobalSoft.Modernization.Api.Domain.Enums;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GlobalSoft.Modernization.Api.Controllers;

[ApiController]
[Authorize]
[Route("api/v1/sales")]
public sealed class SalesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpPost]
    public async Task<ActionResult<SaleResponse>> Create(CreateSaleRequest request, CancellationToken cancellationToken)
    {
        var existing = await db.Sales.AsNoTracking().SingleOrDefaultAsync(x => x.OperationId == request.OperationId, cancellationToken);
        if (existing is not null)
        {
            return Ok(ToResponse(existing));
        }

        var products = await db.Products
            .Where(x => request.Lines.Select(line => line.ProductId).Contains(x.Id))
            .ToDictionaryAsync(x => x.Id, cancellationToken);

        if (products.Count != request.Lines.Select(x => x.ProductId).Distinct().Count())
        {
            return Problem(statusCode: StatusCodes.Status422UnprocessableEntity, title: "Invalid product", detail: "One or more products do not exist.");
        }

        var lines = request.Lines.Select(line =>
        {
            var product = products[line.ProductId];
            var total = decimal.Round(line.Quantity * product.Price, 2);
            return new SaleLine
            {
                ProductId = line.ProductId,
                Quantity = line.Quantity,
                UnitPrice = product.Price,
                TaxRate = product.TaxRate,
                Total = total
            };
        }).ToList();

        var subtotal = lines.Sum(x => x.Total);
        var tax = decimal.Round(lines.Sum(x => x.Total * x.TaxRate / 100m), 2);
        var total = subtotal + tax;
        if (request.Payments.Sum(x => x.Amount) != total)
        {
            return Problem(statusCode: StatusCodes.Status422UnprocessableEntity, title: "Invalid payment total", detail: "Payment total must equal sale total.");
        }

        await using var transaction = db.Database.IsRelational()
            ? await db.Database.BeginTransactionAsync(cancellationToken)
            : null;
        var sale = new Sale
        {
            OperationId = request.OperationId,
            Number = request.Number.Trim(),
            SiteId = request.SiteId,
            DeviceId = request.DeviceId,
            CashSessionId = request.CashSessionId,
            UserId = request.UserId,
            Subtotal = subtotal,
            TaxTotal = tax,
            Total = total,
            Status = "Confirmed",
            Lines = lines,
            Payments = request.Payments.Select(payment => new Payment { Method = payment.Method.Trim(), Amount = payment.Amount }).ToList()
        };

        db.Sales.Add(sale);
        db.InventoryMovements.AddRange(lines.Select(line => new InventoryMovement
        {
            SiteId = request.SiteId,
            ProductId = line.ProductId,
            MovementType = "Sale",
            Quantity = -line.Quantity,
            Reference = sale.Number
        }));
        await db.SaveChangesAsync(cancellationToken);
        if (transaction is not null)
        {
            await transaction.CommitAsync(cancellationToken);
        }

        return Created($"/api/v1/sales/{sale.Id}", ToResponse(sale));
    }

    [HttpGet]
    public Task<List<SaleResponse>> Get(CancellationToken cancellationToken) =>
        db.Sales.AsNoTracking().OrderByDescending(x => x.CreatedAtUtc).Take(500)
            .Select(x => new SaleResponse(x.Id, x.OperationId, x.Number, x.Subtotal, x.TaxTotal, x.Total, x.Status))
            .ToListAsync(cancellationToken);

    private static SaleResponse ToResponse(Sale sale) =>
        new(sale.Id, sale.OperationId, sale.Number, sale.Subtotal, sale.TaxTotal, sale.Total, sale.Status);
}

[ApiController]
[Authorize]
[Route("api/v1/sync")]
public sealed class SyncController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet("operations")]
    public Task<List<SyncOperationResponse>> GetOperations(CancellationToken cancellationToken) =>
        GetOperationsAsync(cancellationToken);

    private async Task<List<SyncOperationResponse>> GetOperationsAsync(CancellationToken cancellationToken) =>
        (await db.SyncOperations.AsNoTracking().OrderBy(x => x.CreatedAt).Take(1000).ToListAsync(cancellationToken))
            .Select(ToResponse).ToList();

    [HttpPost("operations")]
    public async Task<ActionResult<SyncOperationResponse>> Enqueue(CreateSyncOperationRequest request, CancellationToken cancellationToken)
    {
        var existing = await db.SyncOperations.SingleOrDefaultAsync(x => x.OperationId == request.OperationId, cancellationToken);
        if (existing is not null)
        {
            return Ok(ToResponse(existing));
        }

        var operation = new SyncOperation
        {
            OperationId = request.OperationId,
            DeviceId = request.DeviceId,
            SiteId = request.SiteId,
            Entity = request.Entity.Trim(),
            EntityId = request.EntityId.Trim(),
            OperationType = request.OperationType.Trim(),
            Payload = request.Payload,
            Sequence = request.Sequence,
            CreatedAt = request.CreatedAtUtc,
            Status = SyncOperationStatus.Pending
        };
        db.SyncOperations.Add(operation);
        await db.SaveChangesAsync(cancellationToken);
        return Accepted(ToResponse(operation));
    }

    [HttpPost("push")]
    public async Task<ActionResult<List<SyncOperationResponse>>> Push(List<CreateSyncOperationRequest> requests, CancellationToken cancellationToken)
    {
        if (requests.Count == 0 || requests.Count > 100)
        {
            return Problem(statusCode: StatusCodes.Status400BadRequest, title: "Invalid batch", detail: "A batch must contain between 1 and 100 operations.");
        }

        var operationIds = requests.Select(x => x.OperationId).Distinct().ToList();
        var existing = await db.SyncOperations.Where(x => operationIds.Contains(x.OperationId)).ToDictionaryAsync(x => x.OperationId, cancellationToken);
        foreach (var request in requests.Where(x => !existing.ContainsKey(x.OperationId)))
        {
            var operation = new SyncOperation
            {
                OperationId = request.OperationId,
                DeviceId = request.DeviceId,
                SiteId = request.SiteId,
                Entity = request.Entity.Trim(),
                EntityId = request.EntityId.Trim(),
                OperationType = request.OperationType.Trim(),
                Payload = request.Payload,
                Sequence = request.Sequence,
                CreatedAt = request.CreatedAtUtc,
                Status = SyncOperationStatus.Pending
            };
            db.SyncOperations.Add(operation);
            existing.Add(operation.OperationId, operation);
        }

        await db.SaveChangesAsync(cancellationToken);
        return Accepted(existing.Values.OrderBy(x => x.CreatedAt).Select(ToResponse).ToList());
    }

    [HttpGet("pull")]
    public Task<List<SyncOperationResponse>> Pull(Guid deviceId, long afterSequence = 0, CancellationToken cancellationToken = default) =>
        PullAsync(deviceId, afterSequence, cancellationToken);

    private async Task<List<SyncOperationResponse>> PullAsync(Guid deviceId, long afterSequence, CancellationToken cancellationToken) =>
        (await db.SyncOperations.AsNoTracking()
            .Where(x => x.DeviceId == deviceId && x.Sequence > afterSequence && x.Status == SyncOperationStatus.Applied)
            .OrderBy(x => x.Sequence).Take(1000).ToListAsync(cancellationToken))
            .Select(ToResponse).ToList();

    private static SyncOperationResponse ToResponse(SyncOperation operation) =>
        new(operation.OperationId, operation.DeviceId, operation.SiteId, operation.Entity,
            operation.EntityId, operation.OperationType, operation.Sequence,
            operation.Status.ToString(), operation.CreatedAt);
}
