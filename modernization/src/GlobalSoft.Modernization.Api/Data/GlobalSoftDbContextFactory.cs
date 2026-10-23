using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace GlobalSoft.Modernization.Api.Data;

public sealed class GlobalSoftDbContextFactory : IDesignTimeDbContextFactory<GlobalSoftDbContext>
{
    public GlobalSoftDbContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<GlobalSoftDbContext>();
        optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=globalsoft_modernization;Username=globalsoft");
        return new GlobalSoftDbContext(optionsBuilder.Options);
    }
}
