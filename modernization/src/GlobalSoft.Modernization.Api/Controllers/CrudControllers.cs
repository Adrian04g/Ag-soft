using GlobalSoft.Modernization.Api.Contracts;
using GlobalSoft.Modernization.Api.Data;
using GlobalSoft.Modernization.Api.Domain.Entities;
using GlobalSoft.Modernization.Api.Domain.Enums;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GlobalSoft.Modernization.Api.Controllers;

[ApiController]
[Route("api/v1/roles")]
public sealed class RolesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<Role>> Get() => db.Roles.OrderBy(x => x.Name).ToListAsync();

    [HttpPost]
    public async Task<ActionResult<Role>> Create([FromBody] Role role)
    {
        db.Roles.Add(role);
        await db.SaveChangesAsync();
        return Created($"/api/v1/roles/{role.Id}", role);
    }
}

[ApiController]
[Route("api/v1/users")]
public sealed class UsersController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<User>> Get() => db.Users.OrderBy(x => x.UserName).ToListAsync();

    [HttpPost]
    public async Task<ActionResult<User>> Create([FromBody] User user)
    {
        db.Users.Add(user);
        await db.SaveChangesAsync();
        return Created($"/api/v1/users/{user.Id}", user);
    }
}

[ApiController]
[Route("api/v1/companies")]
public sealed class CompaniesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<Company>> Get() => db.Companies.OrderBy(x => x.Name).ToListAsync();

    [HttpPost]
    public async Task<ActionResult<Company>> Create([FromBody] Company company)
    {
        db.Companies.Add(company);
        await db.SaveChangesAsync();
        return Created($"/api/v1/companies/{company.Id}", company);
    }
}

[ApiController]
[Route("api/v1/sites")]
public sealed class SitesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<Site>> Get() => db.Sites.OrderBy(x => x.Name).ToListAsync();

    [HttpPost]
    public async Task<ActionResult<Site>> Create([FromBody] Site site)
    {
        db.Sites.Add(site);
        await db.SaveChangesAsync();
        return Created($"/api/v1/sites/{site.Id}", site);
    }
}

[ApiController]
[Route("api/v1/devices")]
public sealed class DevicesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<Device>> Get() => db.Devices.OrderBy(x => x.Name).ToListAsync();

    [HttpPost]
    public async Task<ActionResult<Device>> Create([FromBody] Device device)
    {
        db.Devices.Add(device);
        await db.SaveChangesAsync();
        return Created($"/api/v1/devices/{device.Id}", device);
    }
}

[ApiController]
[Route("api/v1/products")]
public sealed class ProductsController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<Product>> Get() => db.Products.OrderBy(x => x.Sku).ToListAsync();

    [HttpPost]
    public async Task<ActionResult<Product>> Create([FromBody] Product product)
    {
        db.Products.Add(product);
        await db.SaveChangesAsync();
        return Created($"/api/v1/products/{product.Id}", product);
    }
}

[ApiController]
[Route("api/v1/third-parties")]
public sealed class ThirdPartiesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<ThirdParty>> Get() => db.ThirdParties.OrderBy(x => x.Name).ToListAsync();

    [HttpPost]
    public async Task<ActionResult<ThirdParty>> Create([FromBody] ThirdParty thirdParty)
    {
        db.ThirdParties.Add(thirdParty);
        await db.SaveChangesAsync();
        return Created($"/api/v1/third-parties/{thirdParty.Id}", thirdParty);
    }
}

[ApiController]
[Route("api/v1/audit-events")]
public sealed class AuditEventsController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<AuditEvent>> Get() => db.AuditEvents.OrderByDescending(x => x.CreatedAtUtc).Take(500).ToListAsync();

    [HttpPost]
    public async Task<ActionResult<AuditEvent>> Create([FromBody] AuditEvent auditEvent)
    {
        db.AuditEvents.Add(auditEvent);
        await db.SaveChangesAsync();
        return Created($"/api/v1/audit-events/{auditEvent.Id}", auditEvent);
    }
}

[ApiController]
[Route("api/v1/sync/operations")]
public sealed class SyncOperationsController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<SyncOperation>> Get() => db.SyncOperations.OrderBy(x => x.CreatedAt).Take(1000).ToListAsync();

    [HttpPost]
    public async Task<ActionResult<SyncOperation>> Enqueue([FromBody] CreateSyncOperationRequest request)
    {
        var existing = await db.SyncOperations.FirstOrDefaultAsync(x => x.OperationId == request.OperationId);
        if (existing is not null)
        {
            return Ok(existing);
        }

        var operation = new SyncOperation
        {
            OperationId = request.OperationId,
            DeviceId = request.DeviceId,
            SiteId = request.SiteId,
            Entity = request.Entity,
            EntityId = request.EntityId,
            OperationType = request.OperationType,
            Payload = request.Payload,
            Sequence = request.Sequence,
            CreatedAt = request.CreatedAtUtc,
            Status = SyncOperationStatus.Pending,
            RetryCount = 0
        };

        db.SyncOperations.Add(operation);
        await db.SaveChangesAsync();
        return Accepted(operation);
    }
}
