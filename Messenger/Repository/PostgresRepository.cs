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

        public async Task<List<Message>> GetChat(int a, int b)
        {
            return await _context.messages
                .Where(message => (message.senderid == a && message.receiverid == b) ||
                                  (message.senderid == b && message.receiverid == a))
                .ToListAsync();
        }

        public async Task<int> GetMessageCount()
        {
            return await _context.messages.CountAsync();
        }

        public async Task<Message> AddMessage(Message message)
        {
            _context.messages.Add(message);
            await _context.SaveChangesAsync();

            return message;
        }
    }
}