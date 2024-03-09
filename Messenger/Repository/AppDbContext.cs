using Messenger.Domain;
using Microsoft.EntityFrameworkCore;

namespace Messenger.Repository;

public class AppDbContext : DbContext
{
    public DbSet<User> users => Set<User>();
    public DbSet<Message> Messages => Set<Message>();
    // public DbSet<BaseAggregate> BaseAggregate => Set<BaseAggregate>();
    // public DbSet<BaseEvent> BaseEvent => Set<BaseEvent>();
    
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }
}