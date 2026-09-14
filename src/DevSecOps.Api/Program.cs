var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.MapGet("/", () => new
{
    service = "DevSecOps.Api",
    status = "running"
});

app.MapGet("/health", () => Results.Ok(new
{
    status = "healthy"
}));

app.Run();

public partial class Program { }
