namespace GlobalSoft.Modernization.Api.Domain.Entities;

public sealed class ThirdParty : BaseEntity
{
    public required string Name { get; set; }
    public required string TaxIdentifier { get; set; }
}
