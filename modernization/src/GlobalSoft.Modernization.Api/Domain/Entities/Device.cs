namespace GlobalSoft.Modernization.Api.Domain.Entities;

public sealed class Device : BaseEntity
{
    public required string Name { get; set; }
    public Guid SiteId { get; set; }
    public Site? Site { get; set; }
}
