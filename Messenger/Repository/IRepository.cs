using Messenger.Domain;

namespace Messenger.Repository;

public interface IRepository
{
    Task<List<User>> GetAllUsers();
    Task<User?> GetUserByUsername(string username);
    Task<int> GetUserCount();
    Task<User> AddUser(User user);
    Task<List<Message>> GetChat(int a, int b);
    Task<int> GetMessageCount();
    Task<Message> AddMessage(Message message);
    
    
}