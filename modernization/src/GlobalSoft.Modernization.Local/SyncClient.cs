using System.Net.Http.Json;

namespace GlobalSoft.Modernization.Local;

public sealed record SyncOperationRequest(
    Guid OperationId,
    Guid DeviceId,
    Guid SiteId,
    string Entity,
    string EntityId,
    string OperationType,
    string Payload,
    long Sequence,
    DateTime CreatedAtUtc);

public sealed record SyncOperationResult(Guid OperationId, string Status);
public sealed record AcknowledgeSyncRequest(IReadOnlyList<Guid> OperationIds);

public sealed class SyncClient(HttpClient httpClient, LocalStore store)
{
    public async Task<IReadOnlyList<SyncOperationResult>> PushPendingAsync(
        int batchSize = 100,
        CancellationToken cancellationToken = default)
    {
        var pending = await store.GetPendingOperationsAsync(batchSize, cancellationToken);
        if (pending.Count == 0)
        {
            return [];
        }

        var request = pending.Select(x => new SyncOperationRequest(
            x.OperationId, x.DeviceId, x.SiteId, x.Entity, x.EntityId,
            x.OperationType, x.Payload, x.Sequence, x.CreatedAtUtc)).ToList();

        using var response = await httpClient.PostAsJsonAsync(
            "api/v1/sync/push", request, cancellationToken);
        response.EnsureSuccessStatusCode();
        var result = await response.Content.ReadFromJsonAsync<List<SyncOperationResult>>(cancellationToken)
            ?? throw new InvalidOperationException("The synchronization response was empty.");

        var accepted = result.Select(x => x.OperationId).Distinct().ToArray();
        if (accepted.Length == 0)
        {
            return result;
        }

        using var acknowledgement = await httpClient.PostAsJsonAsync(
            "api/v1/sync/ack",
            new AcknowledgeSyncRequest(accepted),
            cancellationToken);
        acknowledgement.EnsureSuccessStatusCode();
        var acknowledged = await acknowledgement.Content.ReadFromJsonAsync<List<SyncOperationResult>>(cancellationToken)
            ?? throw new InvalidOperationException("The synchronization acknowledgement was empty.");

        var applied = acknowledged.Where(x => x.Status.Equals("Applied", StringComparison.OrdinalIgnoreCase))
            .Select(x => x.OperationId);
        await store.MarkOperationsAsync(applied, "Applied", cancellationToken: cancellationToken);
        return acknowledged;
    }
}
