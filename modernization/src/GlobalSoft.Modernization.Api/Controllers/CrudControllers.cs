using GlobalSoft.Modernization.Api.Contracts;
using GlobalSoft.Modernization.Api.Data;
using GlobalSoft.Modernization.Api.Domain.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GlobalSoft.Modernization.Api.Controllers;

[ApiController]
[Authorize]
[Route("api/v1/roles")]
public sealed class RolesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<object>> Get() => db.Roles.AsNoTracking().OrderBy(x => x.Name)
        .Select(x => new { x.Id, x.Name, x.CreatedAtUtc }).Cast<object>().ToListAsync();

    [HttpPost]
    public async Task<ActionResult<Role>> Create(NameRequest request)
    {
        var role = new Role { Name = request.Name.Trim() };
        db.Roles.Add(role);
        await db.SaveChangesAsync();
        return Created($"/api/v1/roles/{role.Id}", new { role.Id, role.Name });
    }
}

[ApiController]
[Authorize]
[Route("api/v1/users")]
public sealed class UsersController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<object>> Get() => db.Users.AsNoTracking()
        .OrderBy(x => x.UserName)
        .Select(x => new { x.Id, x.UserName, x.RoleId, x.CreatedAtUtc })
        .Cast<object>()
        .ToListAsync();

    [HttpPost]
    public async Task<IActionResult> Create(UserRequest request)
    {
        var user = new User { UserName = request.UserName.Trim(), RoleId = request.RoleId };
        db.Users.Add(user);
        await db.SaveChangesAsync();
        return Created($"/api/v1/users/{user.Id}", new { user.Id, user.UserName, user.RoleId, user.CreatedAtUtc });
    }
}

[ApiController]
[Authorize]
[Route("api/v1/companies")]
public sealed class CompaniesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<object>> Get() => db.Companies.AsNoTracking()
        .OrderBy(x => x.Name)
        .Select(x => new { x.Id, x.Name, x.CreatedAtUtc })
        .Cast<object>()
        .ToListAsync();

    [HttpPost]
    public async Task<IActionResult> Create(NameRequest request)
    {
        var company = new Company { Name = request.Name.Trim() };
        db.Companies.Add(company);
        await db.SaveChangesAsync();
        return Created($"/api/v1/companies/{company.Id}", new { company.Id, company.Name, company.CreatedAtUtc });
    }
}

[ApiController]
[Authorize]
[Route("api/v1/sites")]
public sealed class SitesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<object>> Get() => db.Sites.AsNoTracking()
        .OrderBy(x => x.Name)
        .Select(x => new { x.Id, x.Name, x.CompanyId, x.CreatedAtUtc })
        .Cast<object>()
        .ToListAsync();

    [HttpPost]
    public async Task<IActionResult> Create(SiteRequest request)
    {
        var site = new Site { Name = request.Name.Trim(), CompanyId = request.CompanyId };
        db.Sites.Add(site);
        await db.SaveChangesAsync();
        return Created($"/api/v1/sites/{site.Id}", new { site.Id, site.Name, site.CompanyId, site.CreatedAtUtc });
    }
}

[ApiController]
[Authorize]
[Route("api/v1/devices")]
public sealed class DevicesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<object>> Get() => db.Devices.AsNoTracking()
        .OrderBy(x => x.Name)
        .Select(x => new { x.Id, x.Name, x.SiteId, x.CreatedAtUtc })
        .Cast<object>()
        .ToListAsync();

    [HttpPost]
    public async Task<IActionResult> Create(DeviceRequest request)
    {
        var device = new Device { Name = request.Name.Trim(), SiteId = request.SiteId };
        db.Devices.Add(device);
        await db.SaveChangesAsync();
        return Created($"/api/v1/devices/{device.Id}", new { device.Id, device.Name, device.SiteId, device.CreatedAtUtc });
    }
}

[ApiController]
[Authorize]
[Route("api/v1/products")]
public sealed class ProductsController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<object>> Get() => db.Products.AsNoTracking()
        .OrderBy(x => x.Sku)
        .Select(x => new { x.Id, x.Sku, x.Name, x.Price, x.TaxRate, x.CreatedAtUtc })
        .Cast<object>()
        .ToListAsync();

    [HttpPost]
    public async Task<IActionResult> Create(ProductRequest request)
    {
        var product = new Product { Sku = request.Sku.Trim(), Name = request.Name.Trim(), Price = request.Price, TaxRate = request.TaxRate };
        db.Products.Add(product);
        await db.SaveChangesAsync();
        return Created($"/api/v1/products/{product.Id}", new { product.Id, product.Sku, product.Name, product.Price, product.TaxRate, product.CreatedAtUtc });
    }
}

[ApiController]
[Authorize]
[Route("api/v1/third-parties")]
public sealed class ThirdPartiesController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<object>> Get() => db.ThirdParties.AsNoTracking()
        .OrderBy(x => x.Name)
        .Select(x => new { x.Id, x.Name, x.TaxIdentifier, x.CreatedAtUtc })
        .Cast<object>()
        .ToListAsync();

    [HttpPost]
    public async Task<IActionResult> Create(ThirdPartyRequest request)
    {
        var thirdParty = new ThirdParty { Name = request.Name.Trim(), TaxIdentifier = request.TaxIdentifier.Trim() };
        db.ThirdParties.Add(thirdParty);
        await db.SaveChangesAsync();
        return Created($"/api/v1/third-parties/{thirdParty.Id}", new { thirdParty.Id, thirdParty.Name, thirdParty.TaxIdentifier, thirdParty.CreatedAtUtc });
    }
}

[ApiController]
[Authorize]
[Route("api/v1/audit-events")]
public sealed class AuditEventsController(GlobalSoftDbContext db) : ControllerBase
{
    [HttpGet]
    public Task<List<object>> Get() => db.AuditEvents.AsNoTracking()
        .OrderByDescending(x => x.CreatedAtUtc).Take(500)
        .Select(x => new { x.Id, x.CreatedAtUtc })
        .Cast<object>()
        .ToListAsync();
}
