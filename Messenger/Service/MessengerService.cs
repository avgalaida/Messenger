using Messenger.Domain;
using Messenger.Repository;

namespace Messenger.Service;

public class MessengerService
{
    private readonly IRepository _repository;

    public MessengerService(AppDbContext context)
    {
        _repository = new PostgresRepository(context);
    }

    public async Task<List<User>> GetAllUsers()
    {
        var users = await _repository.GetAllUsers();
        return users;

    }
    public async Task<List<Message>> GetMessages(int from, int to)
    {
        var messages = await _repository.GetMessages(from, to);
        return messages;

    }
    public async Task<User?> RegUser(string username, string password)
    {
        var existingUser = await _repository.GetUserByUsername(username);
        if (existingUser != null)
        {
            return null;
        }
        
        int userCount = await _repository.GetUserCount();
        
        var user = new User
        {
            id = userCount + 1,
            username = username,
            password = password 
        };
        
        await _repository.AddUser(user);
        
        return user;
    }
    
    public async Task<User?> Auth(string username, string password)
    {
        var user = await _repository.GetUserByUsername(username);
        
        if (user == null)
        {
            return null;
        }
        
        if (ValidatePassword(password, user.password))
        {
            return user;
        }
        
        return null;
    }
    
    private bool ValidatePassword(string providedPassword, string? storedPassword)
    {
        return string.Equals(providedPassword, storedPassword);
    }
    
    public async Task<Message?> SendMessage(int from, int to, string text)
    {
        int messageCount = await _repository.GetMessageCount();
        
        var message = new Message
        {
            Id = messageCount + 1,
            SenderId = from,
            ReceiverId = to,
            Text = text
        };
        
        await _repository.AddMessage(message);
        
        return message;
    }

}