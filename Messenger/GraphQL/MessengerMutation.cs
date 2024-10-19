using Messenger.Domain;
using Messenger.Service;

namespace Messenger.GraphQL;

public class MessengerMutation
{
    private readonly MessengerService _messengerService;
    private readonly MessengerEventPublisher _messengerEventPublisher;

    public MessengerMutation(MessengerService messengerService, MessengerEventPublisher messengerEventPublisher)
    {
        _messengerService = messengerService;
        _messengerEventPublisher = messengerEventPublisher;
    }
    
    public async Task<User?> CreateUser(string username, string password)
    {
        var user = await _messengerService.RegUser(username, password);
        await _messengerEventPublisher.PublishUserCreated(user);
        
        return user;
    }
    public async Task<User?> Authorize(string username, string password)
    {
        var user = await _messengerService.Auth(username, password);
        return user;
    }

    public async Task<Message?> SendMessage(int from, int to, string text)
    {
        var message = await _messengerService.SendMessage(from, to, text);
        await _messengerEventPublisher.PublishMessageSended(message);
        
        return message;
    }
    
}