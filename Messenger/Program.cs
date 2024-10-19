using Messenger.Repository;
using Messenger.GraphQL;
using Messenger.Service;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

var context = builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseNpgsql("Server=127.0.0.1;Port=54321;Database=Messenger;User Id=postgres;Password=kokomi;");
});

builder.Services.AddScoped<MessengerService,MessengerService>();
builder.Services.AddTransient<MessengerEventPublisher, MessengerEventPublisher>();
builder.Services.AddScoped<MessengerMutation, MessengerMutation>();
builder.Services.AddScoped<MessengerQuery, MessengerQuery>();

builder.Services
    .AddCors()
    .AddGraphQLServer()
    .AddQueryType<MessengerQuery>()
    .AddMutationType<MessengerMutation>()
    .AddSubscriptionType<MessengerSubscribtion>()
    .AddInMemorySubscriptions();

var app = builder.Build();

app.UseCors(x => x
    .AllowAnyMethod()
    .AllowAnyHeader()
    .SetIsOriginAllowed(origin => true)
    .AllowCredentials());

app.UseWebSockets();
app.MapGraphQL();

app.Run();