using System.ComponentModel.DataAnnotations;

namespace GlobalSoft.Modernization.Api.Contracts;

public sealed class AcknowledgeSyncRequest
{
    [Required, MinLength(1), MaxLength(100)]
    public List<Guid> OperationIds { get; set; } = [];
}
