using System.ComponentModel.DataAnnotations;

namespace GlobalSoft.Modernization.Api.Contracts;

public sealed class CreateCashRegisterRequest
{
    [Required, StringLength(120, MinimumLength = 1)]
    public string Name { get; set; } = string.Empty;
    [Required]
    public Guid SiteId { get; set; }
}

public sealed class CreateSaleRequest
{
    [Required]
    public Guid OperationId { get; set; }
    [Required]
    public Guid SiteId { get; set; }
    [Required]
    public Guid DeviceId { get; set; }
    [Required]
    public Guid CashSessionId { get; set; }
    [Required]
    public Guid UserId { get; set; }
    [Required, StringLength(40, MinimumLength = 1)]
    public string Number { get; set; } = string.Empty;
    [Required, MinLength(1)]
    public List<CreateSaleLineRequest> Lines { get; set; } = [];
    [Required, MinLength(1)]
    public List<CreatePaymentRequest> Payments { get; set; } = [];
}

public sealed class CreateSaleLineRequest
{
    [Required]
    public Guid ProductId { get; set; }
    [Range(typeof(decimal), "0.0001", "1000000000")]
    public decimal Quantity { get; set; }
}

public sealed class CreatePaymentRequest
{
    [Required, StringLength(40, MinimumLength = 1)]
    public string Method { get; set; } = string.Empty;
    [Range(typeof(decimal), "0.01", "1000000000")]
    public decimal Amount { get; set; }
}

public sealed record SaleResponse(
    Guid Id,
    Guid OperationId,
    string Number,
    decimal Subtotal,
    decimal TaxTotal,
    decimal Total,
    string Status);

public sealed record SyncOperationResponse(
    Guid OperationId,
    Guid DeviceId,
    Guid SiteId,
    string Entity,
    string EntityId,
    string OperationType,
    long Sequence,
    string Status,
    DateTime CreatedAtUtc);
