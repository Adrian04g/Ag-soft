namespace GlobalSoft.Modernization.Api.Domain.Entities;

public sealed class AuditEvent : BaseEntity
{
    public required string Entity { get; set; }
    public required string Action { get; set; }
    public required string PerformedBy { get; set; }
    public required string Payload { get; set; }
}
