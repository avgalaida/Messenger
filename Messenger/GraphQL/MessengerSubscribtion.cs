using Messenger.Domain;

namespace Messenger.GraphQL;

public class MessengerSubscribtion
{
    [Subscribe]
    public User OnUserReg([EventMessage] User user) => user;
    
    [Subscribe]
    public User OnUserAuth([EventMessage] User user) => user;
    
    [Subscribe]
    public Message OnMessageSend([EventMessage] Message message) => message;
}