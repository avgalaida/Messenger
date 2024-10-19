namespace Messenger.Domain;

public class Message
{
    public int id { get; set; }
    public int senderid { get; set; }
    public int receiverid { get; set; }
    public string? text { get; set; }
}