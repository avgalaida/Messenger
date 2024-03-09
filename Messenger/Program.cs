using Messenger.Repository;
using Messenger.GraphQL;
using Messenger.Service;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

var context = builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseNpgsql("Server=bubble.db.elephantsql.com;Port=5432;Database=uzxkfkdx;User Id=uzxkfkdx;Password=VNH3xRL8Izj5OC9FEG2siap2ZUgj-on3;");
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