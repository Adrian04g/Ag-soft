using GlobalSoft.Modernization.Api.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;

namespace GlobalSoft.Modernization.Api.Tests;

public sealed class ApiFactory : WebApplicationFactory<Program>
{
    private readonly string _dbName = $"tests-{Guid.NewGuid():N}";

    protected override void ConfigureWebHost(IWebHostBuilder builder)
    {
        builder.UseEnvironment("Testing");
        builder.ConfigureServices(services =>
        {
            services.RemoveAll<DbContextOptions<GlobalSoftDbContext>>();
            services.AddDbContext<GlobalSoftDbContext>(opt =>
                opt.UseInMemoryDatabase(_dbName));
        });
    }
}
