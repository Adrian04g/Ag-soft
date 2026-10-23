using System.ComponentModel.DataAnnotations;

namespace GlobalSoft.Modernization.Api.Contracts;

public class NameRequest
{
    [Required, StringLength(160, MinimumLength = 1)]
    public string Name { get; set; } = string.Empty;
}

public sealed class SiteRequest : NameRequest
{
    [Required]
    public Guid CompanyId { get; set; }
}

public sealed class DeviceRequest : NameRequest
{
    [Required]
    public Guid SiteId { get; set; }
}

public sealed class ProductRequest : NameRequest
{
    [Required, StringLength(80, MinimumLength = 1)]
    public string Sku { get; set; } = string.Empty;
    [Range(typeof(decimal), "0", "1000000000")]
    public decimal Price { get; set; }
    [Range(typeof(decimal), "0", "100")]
    public decimal TaxRate { get; set; }
}

public sealed class ThirdPartyRequest : NameRequest
{
    [Required, StringLength(80, MinimumLength = 1)]
    public string TaxIdentifier { get; set; } = string.Empty;
}

public sealed class UserRequest : NameRequest
{
    [Required, StringLength(80, MinimumLength = 1)]
    public string UserName { get; set; } = string.Empty;
    [Required]
    public Guid RoleId { get; set; }
}
