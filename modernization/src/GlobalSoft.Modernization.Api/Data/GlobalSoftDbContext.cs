using GlobalSoft.Modernization.Api.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace GlobalSoft.Modernization.Api.Data;

public sealed class GlobalSoftDbContext(DbContextOptions<GlobalSoftDbContext> options) : DbContext(options)
{
    public DbSet<User> Users => Set<User>();
    public DbSet<Role> Roles => Set<Role>();
    public DbSet<Company> Companies => Set<Company>();
    public DbSet<Site> Sites => Set<Site>();
    public DbSet<Device> Devices => Set<Device>();
    public DbSet<Product> Products => Set<Product>();
    public DbSet<ThirdParty> ThirdParties => Set<ThirdParty>();
    public DbSet<AuditEvent> AuditEvents => Set<AuditEvent>();
    public DbSet<SyncOperation> SyncOperations => Set<SyncOperation>();
    public DbSet<CashRegister> CashRegisters => Set<CashRegister>();
    public DbSet<CashSession> CashSessions => Set<CashSession>();
    public DbSet<Sale> Sales => Set<Sale>();
    public DbSet<SaleLine> SaleLines => Set<SaleLine>();
    public DbSet<Payment> Payments => Set<Payment>();
    public DbSet<InventoryMovement> InventoryMovements => Set<InventoryMovement>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Role>().HasIndex(x => x.Name).IsUnique();
        modelBuilder.Entity<User>().HasIndex(x => x.UserName).IsUnique();
        modelBuilder.Entity<Product>().HasIndex(x => x.Sku).IsUnique();
        modelBuilder.Entity<ThirdParty>().HasIndex(x => x.TaxIdentifier).IsUnique();
        modelBuilder.Entity<SyncOperation>().HasIndex(x => x.OperationId).IsUnique();
        modelBuilder.Entity<Sale>().HasIndex(x => new { x.SiteId, x.Number }).IsUnique();
        modelBuilder.Entity<Sale>().HasIndex(x => x.OperationId).IsUnique();
        modelBuilder.Entity<Sale>().HasIndex(x => x.CreatedAtUtc);
        modelBuilder.Entity<SaleLine>().HasOne(x => x.Sale).WithMany(x => x.Lines).HasForeignKey(x => x.SaleId);
        modelBuilder.Entity<Payment>().HasOne(x => x.Sale).WithMany(x => x.Payments).HasForeignKey(x => x.SaleId);
        modelBuilder.Entity<CashRegister>().HasOne(x => x.Site).WithMany().HasForeignKey(x => x.SiteId).OnDelete(DeleteBehavior.Restrict);
        modelBuilder.Entity<CashSession>().HasOne(x => x.CashRegister).WithMany().HasForeignKey(x => x.CashRegisterId).OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<Site>()
            .HasOne(x => x.Company)
            .WithMany()
            .HasForeignKey(x => x.CompanyId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<Device>()
            .HasOne(x => x.Site)
            .WithMany()
            .HasForeignKey(x => x.SiteId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<User>()
            .HasOne(x => x.Role)
            .WithMany()
            .HasForeignKey(x => x.RoleId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
