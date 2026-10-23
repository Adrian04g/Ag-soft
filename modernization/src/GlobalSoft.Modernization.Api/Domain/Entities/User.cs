namespace GlobalSoft.Modernization.Api.Domain.Entities;

public sealed class User : BaseEntity
{
    public required string UserName { get; set; }
    public Guid RoleId { get; set; }
    public Role? Role { get; set; }
}
