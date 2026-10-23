namespace GlobalSoft.Modernization.Api.Domain.Enums;

public enum SyncOperationStatus
{
    Pending = 0,
    Sending = 1,
    Applied = 2,
    Rejected = 3,
    Conflict = 4,
    Cancelled = 5
}
