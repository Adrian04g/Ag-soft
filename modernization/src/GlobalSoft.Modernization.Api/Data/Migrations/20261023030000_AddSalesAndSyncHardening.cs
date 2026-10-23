using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace GlobalSoft.Modernization.Api.Data.Migrations;

public partial class AddSalesAndSyncHardening : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "CashRegisters",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                Name = table.Column<string>(type: "text", nullable: false),
                SiteId = table.Column<Guid>(type: "uuid", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
            },
            constraints: table => table.PrimaryKey("PK_CashRegisters", x => x.Id));

        migrationBuilder.CreateTable(
            name: "CashSessions",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                CashRegisterId = table.Column<Guid>(type: "uuid", nullable: false),
                OpenedByUserId = table.Column<Guid>(type: "uuid", nullable: false),
                OpenedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                ClosedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                OpeningAmount = table.Column<decimal>(type: "numeric", nullable: false),
                ClosingAmount = table.Column<decimal>(type: "numeric", nullable: true),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
            },
            constraints: table => table.PrimaryKey("PK_CashSessions", x => x.Id));

        migrationBuilder.CreateTable(
            name: "Sales",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                OperationId = table.Column<Guid>(type: "uuid", nullable: false),
                Number = table.Column<string>(type: "text", nullable: false),
                SiteId = table.Column<Guid>(type: "uuid", nullable: false),
                DeviceId = table.Column<Guid>(type: "uuid", nullable: false),
                CashSessionId = table.Column<Guid>(type: "uuid", nullable: false),
                UserId = table.Column<Guid>(type: "uuid", nullable: false),
                Subtotal = table.Column<decimal>(type: "numeric", nullable: false),
                TaxTotal = table.Column<decimal>(type: "numeric", nullable: false),
                Total = table.Column<decimal>(type: "numeric", nullable: false),
                Status = table.Column<string>(type: "text", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
            },
            constraints: table => table.PrimaryKey("PK_Sales", x => x.Id));

        migrationBuilder.CreateTable(
            name: "InventoryMovements",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                SiteId = table.Column<Guid>(type: "uuid", nullable: false),
                ProductId = table.Column<Guid>(type: "uuid", nullable: false),
                MovementType = table.Column<string>(type: "text", nullable: false),
                Quantity = table.Column<decimal>(type: "numeric", nullable: false),
                Reference = table.Column<string>(type: "text", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
            },
            constraints: table => table.PrimaryKey("PK_InventoryMovements", x => x.Id));

        migrationBuilder.CreateTable(
            name: "Payments",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                SaleId = table.Column<Guid>(type: "uuid", nullable: false),
                Method = table.Column<string>(type: "text", nullable: false),
                Amount = table.Column<decimal>(type: "numeric", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
            },
            constraints: table => table.PrimaryKey("PK_Payments", x => x.Id));

        migrationBuilder.CreateTable(
            name: "SaleLines",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                SaleId = table.Column<Guid>(type: "uuid", nullable: false),
                ProductId = table.Column<Guid>(type: "uuid", nullable: false),
                Quantity = table.Column<decimal>(type: "numeric", nullable: false),
                UnitPrice = table.Column<decimal>(type: "numeric", nullable: false),
                TaxRate = table.Column<decimal>(type: "numeric", nullable: false),
                Total = table.Column<decimal>(type: "numeric", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
            },
            constraints: table => table.PrimaryKey("PK_SaleLines", x => x.Id));

        migrationBuilder.CreateIndex("IX_CashRegisters_SiteId", "CashRegisters", "SiteId");
        migrationBuilder.CreateIndex("IX_CashSessions_CashRegisterId", "CashSessions", "CashRegisterId");
        migrationBuilder.CreateIndex("IX_Sales_OperationId", "Sales", "OperationId", unique: true);
        migrationBuilder.CreateIndex("IX_Sales_SiteId_Number", "Sales", new[] { "SiteId", "Number" }, unique: true);
        migrationBuilder.CreateIndex("IX_SaleLines_SaleId", "SaleLines", "SaleId");
        migrationBuilder.CreateIndex("IX_Payments_SaleId", "Payments", "SaleId");

        migrationBuilder.AddForeignKey("CashRegisters", "SiteId", "Sites", "Id", onDelete: ReferentialAction.Restrict);
        migrationBuilder.AddForeignKey("CashSessions", "CashRegisterId", "CashRegisters", "Id", onDelete: ReferentialAction.Restrict);
        migrationBuilder.AddForeignKey("Sales", "CashSessionId", "CashSessions", "Id", onDelete: ReferentialAction.Restrict);
        migrationBuilder.AddForeignKey("SaleLines", "SaleId", "Sales", "Id", onDelete: ReferentialAction.Cascade);
        migrationBuilder.AddForeignKey("Payments", "SaleId", "Sales", "Id", onDelete: ReferentialAction.Cascade);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable("Payments");
        migrationBuilder.DropTable("SaleLines");
        migrationBuilder.DropTable("Sales");
        migrationBuilder.DropTable("CashSessions");
        migrationBuilder.DropTable("CashRegisters");
        migrationBuilder.DropTable("InventoryMovements");
    }
}
