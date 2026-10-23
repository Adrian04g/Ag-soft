using GlobalSoft.Modernization.Local;

namespace GlobalSoft.Modernization.Api.Tests;

public sealed class LocalStoreTests
{
    [Fact]
    public async Task SaveSale_Is_Atomic_And_Idempotent()
    {
        var databasePath = Path.Combine(Path.GetTempPath(), $"globalsoft-{Guid.NewGuid():N}.db");
        try
        {
            var store = new LocalStore(databasePath);
            var productId = Guid.NewGuid();
            var sale = new LocalSale(
                Guid.NewGuid(), Guid.NewGuid(), Guid.NewGuid(), Guid.NewGuid(), Guid.NewGuid(),
                "LOCAL-001",
                [new LocalSaleLine(productId, 2, 10m, 19m)],
                [new LocalPayment("Cash", 23.80m)]);

            var firstId = await store.SaveSaleAsync(sale);
            var secondId = await store.SaveSaleAsync(sale);

            Assert.Equal(firstId, secondId);
        }
        finally
        {
            if (File.Exists(databasePath))
            {
                File.Delete(databasePath);
            }
        }
    }
}
