using HotChocolate.Subscriptions;
using Messenger.Domain;
using Messenger.GraphQL;

namespace Messenger.Service;

public class MessengerEventPublisher
{
    private readonly ITopicEventSender _sender;
    
    public MessengerEventPublisher(ITopicEventSender sender)
    {
        _sender = sender;
    }
    
    public async Task<User?> PublishUserCreated(User? user)
    {
        await _sender.SendAsync(nameof(MessengerSubscribtion.OnUserReg), user);
        return user;
    }
    
    public async Task<Message?> PublishMessageSended(Message? message)
    {
        await _sender.SendAsync(nameof(MessengerSubscribtion.OnMessageSend), message);
        return message;
    }
}