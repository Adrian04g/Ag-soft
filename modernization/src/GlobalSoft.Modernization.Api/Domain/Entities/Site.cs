namespace GlobalSoft.Modernization.Api.Domain.Entities;

public sealed class Site : BaseEntity
{
    public required string Name { get; set; }
    public Guid CompanyId { get; set; }
    public Company? Company { get; set; }
}
