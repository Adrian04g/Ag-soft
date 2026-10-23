using GlobalSoft.Modernization.Api.Domain.Enums;

namespace GlobalSoft.Modernization.Api.Domain.Entities;

public sealed class SyncOperation : BaseEntity
{
    public Guid OperationId { get; set; }
    public Guid DeviceId { get; set; }
    public Guid SiteId { get; set; }
    public required string Entity { get; set; }
    public required string EntityId { get; set; }
    public required string OperationType { get; set; }
    public required string Payload { get; set; }
    public long Sequence { get; set; }
    public DateTime CreatedAt { get; set; }
    public SyncOperationStatus Status { get; set; } = SyncOperationStatus.Pending;
    public int RetryCount { get; set; }
    public string? LastError { get; set; }
}
