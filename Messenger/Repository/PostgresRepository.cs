using Messenger.Domain;
using Microsoft.EntityFrameworkCore;

namespace Messenger.Repository
{
    public class PostgresRepository : IRepository
    {
        private readonly AppDbContext _context;

        public PostgresRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<User>> GetAllUsers()
        {
            return await _context.users.ToListAsync();
        }

        public async Task<User?> GetUserByUsername(string username)
        {
            return await _context.users.FirstOrDefaultAsync(u => u.username == username);
        }

        public async Task<int> GetUserCount()
        {
            return await _context.users.CountAsync();
        }

        public async Task<User> AddUser(User user)
        {
            _context.users.Add(user);
            await _context.SaveChangesAsync();

            return user;
        }
        
        public async Task<List<Message>> GetMessages(int from, int to)
        {
            return await _context.Messages
                .Where(message => message.SenderId == from && message.ReceiverId == to)
                .ToListAsync();
        }

        public async Task<int> GetMessageCount()
        {
            return await _context.Messages.CountAsync();
        }

        public async Task<Message> AddMessage(Message message)
        {
            _context.Messages.Add(message);
            await _context.SaveChangesAsync();

            return message;
        }

    }
}