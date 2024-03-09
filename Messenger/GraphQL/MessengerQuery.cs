using Messenger.Domain;
using Messenger.Service;

namespace Messenger.GraphQL;

public class MessengerQuery
{
    private readonly MessengerService _messengerService;

    public MessengerQuery(MessengerService messengerService)
    {
        _messengerService = messengerService;
    }
    
    public async Task<List<User>> GetUsers()
    {
        return await _messengerService.GetAllUsers();
    }
    
    public async Task<List<Message>> GetMessages(int from, int to)
    {
        return await _messengerService.GetMessages(from, to);
    }
}