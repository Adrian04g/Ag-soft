using System.Net;
using System.Net.Http.Json;
using GlobalSoft.Modernization.Api.Contracts;

namespace GlobalSoft.Modernization.Api.Tests;

public sealed class HealthAndSyncTests : IClassFixture<ApiFactory>
{
    private readonly ApiFactory _factory;

    public HealthAndSyncTests(ApiFactory factory)
    {
        _factory = factory;
    }

    [Fact]
    public async Task Health_Endpoint_Returns_Ok()
    {
        var client = _factory.CreateClient();
        var response = await client.GetAsync("/health");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
    }

    [Fact]
    public async Task Sync_Post_Is_Idempotent_By_OperationId()
    {
        var client = _factory.CreateClient();
        var request = new CreateSyncOperationRequest
        {
            OperationId = Guid.NewGuid(),
            DeviceId = Guid.NewGuid(),
            SiteId = Guid.NewGuid(),
            Entity = "Sale",
            EntityId = "sale-001",
            OperationType = "Create",
            Payload = "{\"total\":100.0}",
            Sequence = 1,
            CreatedAtUtc = DateTime.UtcNow
        };

        var first = await client.PostAsJsonAsync("/api/v1/sync/operations", request);
        var second = await client.PostAsJsonAsync("/api/v1/sync/operations", request);

        Assert.Equal(HttpStatusCode.Accepted, first.StatusCode);
        Assert.True(second.StatusCode == HttpStatusCode.OK || second.StatusCode == HttpStatusCode.Accepted);

        var operations = await client.GetFromJsonAsync<List<SyncOperationResponse>>("/api/v1/sync/operations");
        Assert.NotNull(operations);

        var count = operations.Count(x => x.OperationId == request.OperationId);
        Assert.Equal(1, count);
    }
}
