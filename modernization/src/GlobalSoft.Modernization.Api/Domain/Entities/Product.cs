namespace GlobalSoft.Modernization.Api.Domain.Entities;

public sealed class Product : BaseEntity
{
    public required string Sku { get; set; }
    public required string Name { get; set; }
    public decimal Price { get; set; }
    public decimal TaxRate { get; set; }
}
