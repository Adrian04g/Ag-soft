using System.ComponentModel.DataAnnotations;

namespace GlobalSoft.Modernization.Api.Contracts;

public sealed class CreateSyncOperationRequest
{
    [Required]
    public Guid OperationId { get; set; }

    [Required]
    public Guid DeviceId { get; set; }

    [Required]
    public Guid SiteId { get; set; }

    [Required, MinLength(1), MaxLength(120)]
    public string Entity { get; set; } = string.Empty;

    [Required, MinLength(1), MaxLength(120)]
    public string EntityId { get; set; } = string.Empty;

    [Required, MinLength(1), MaxLength(40)]
    public string OperationType { get; set; } = string.Empty;

    [Required, MinLength(2)]
    public string Payload { get; set; } = string.Empty;

    [Range(1, long.MaxValue)]
    public long Sequence { get; set; }

    [Required]
    public DateTime CreatedAtUtc { get; set; }
}
