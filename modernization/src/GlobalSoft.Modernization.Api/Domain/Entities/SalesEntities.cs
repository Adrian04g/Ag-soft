namespace GlobalSoft.Modernization.Api.Domain.Entities;

public sealed class CashRegister : BaseEntity
{
    public required string Name { get; set; }
    public Guid SiteId { get; set; }
    public Site? Site { get; set; }
}

public sealed class CashSession : BaseEntity
{
    public Guid CashRegisterId { get; set; }
    public CashRegister? CashRegister { get; set; }
    public Guid OpenedByUserId { get; set; }
    public DateTime OpenedAtUtc { get; set; } = DateTime.UtcNow;
    public DateTime? ClosedAtUtc { get; set; }
    public decimal OpeningAmount { get; set; }
    public decimal? ClosingAmount { get; set; }
}

public sealed class Sale : BaseEntity
{
    public Guid OperationId { get; set; }
    public required string Number { get; set; }
    public Guid SiteId { get; set; }
    public Guid DeviceId { get; set; }
    public Guid CashSessionId { get; set; }
    public Guid UserId { get; set; }
    public decimal Subtotal { get; set; }
    public decimal TaxTotal { get; set; }
    public decimal Total { get; set; }
    public required string Status { get; set; }
    public List<SaleLine> Lines { get; set; } = [];
    public List<Payment> Payments { get; set; } = [];
}

public sealed class SaleLine : BaseEntity
{
    public Guid SaleId { get; set; }
    public Sale? Sale { get; set; }
    public Guid ProductId { get; set; }
    public decimal Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal TaxRate { get; set; }
    public decimal Total { get; set; }
}

public sealed class Payment : BaseEntity
{
    public Guid SaleId { get; set; }
    public Sale? Sale { get; set; }
    public required string Method { get; set; }
    public decimal Amount { get; set; }
}

public sealed class InventoryMovement : BaseEntity
{
    public Guid SiteId { get; set; }
    public Guid ProductId { get; set; }
    public required string MovementType { get; set; }
    public decimal Quantity { get; set; }
    public required string Reference { get; set; }
}
