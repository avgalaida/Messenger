using Messenger.Domain;

namespace Messenger.Repository;

public interface IRepository
{
    Task<List<User>> GetAllUsers();
    Task<User?> GetUserByUsername(string username);
    Task<int> GetUserCount();
    Task<User> AddUser(User user);
    Task<List<Message>> GetMessages(int from, int to);
    
    Task<int> GetMessageCount();
    Task<Message> AddMessage(Message message);
    
}