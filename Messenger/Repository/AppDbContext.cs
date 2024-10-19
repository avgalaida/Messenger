using Messenger.Domain;
using Microsoft.EntityFrameworkCore;

namespace Messenger.Repository;

public class AppDbContext : DbContext
{
    public DbSet<User> users => Set<User>();
    public DbSet<Message> messages => Set<Message>();
    
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }
}