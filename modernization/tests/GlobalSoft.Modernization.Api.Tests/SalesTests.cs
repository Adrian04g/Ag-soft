using System.Net;
using System.Net.Http.Json;
using GlobalSoft.Modernization.Api.Contracts;
using GlobalSoft.Modernization.Api.Data;
using GlobalSoft.Modernization.Api.Domain.Entities;
using Microsoft.Extensions.DependencyInjection;

namespace GlobalSoft.Modernization.Api.Tests;

public sealed class SalesTests : IClassFixture<ApiFactory>
{
    private readonly ApiFactory _factory;

    public SalesTests(ApiFactory factory)
    {
        _factory = factory;
    }

    [Fact]
    public async Task Sale_Is_Calculated_And_Stored_Idempotently()
    {
        var product = new Product { Sku = $"SKU-{Guid.NewGuid():N}", Name = "Test product", Price = 10m, TaxRate = 19m };
        var register = new CashRegister { Name = "Test register", SiteId = Guid.NewGuid() };
        var session = new CashSession { CashRegisterId = register.Id, OpenedByUserId = Guid.NewGuid(), OpeningAmount = 0m };
        using (var scope = _factory.Services.CreateScope())
        {
            var db = scope.ServiceProvider.GetRequiredService<GlobalSoftDbContext>();
            db.Products.Add(product);
            db.CashRegisters.Add(register);
            db.CashSessions.Add(session);
            await db.SaveChangesAsync();
        }

        var operationId = Guid.NewGuid();
        var request = new CreateSaleRequest
        {
            OperationId = operationId,
            SiteId = register.SiteId,
            DeviceId = Guid.NewGuid(),
            CashSessionId = session.Id,
            UserId = session.OpenedByUserId,
            Number = $"SALE-{Guid.NewGuid():N}",
            Lines = [new CreateSaleLineRequest { ProductId = product.Id, Quantity = 2 }],
            Payments = [new CreatePaymentRequest { Method = "Cash", Amount = 23.80m }]
        };

        var client = _factory.CreateClient();
        var first = await client.PostAsJsonAsync("/api/v1/sales", request);
        var second = await client.PostAsJsonAsync("/api/v1/sales", request);

        Assert.Equal(HttpStatusCode.Created, first.StatusCode);
        Assert.Equal(HttpStatusCode.OK, second.StatusCode);
        var response = await first.Content.ReadFromJsonAsync<SaleResponse>();
        Assert.NotNull(response);
        Assert.Equal(23.80m, response.Total);
    }
}
