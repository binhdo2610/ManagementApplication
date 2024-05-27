using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using project.Data;
using Swashbuckle.AspNetCore.SwaggerGen;



namespace project
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            builder.Services.AddAuthorization();
            builder.Services.AddAuthentication("Bearer").AddJwtBearer();

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen(options=>
            {
                options.InferSecuritySchemes();
                options.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference{Type = ReferenceType.SecurityScheme,Id = "Bearer"}
                        },
                        new string[]{ }
                    }
                });
            });
            builder.Services.Configure<SwaggerGeneratorOptions>(options =>
            {
                options.InferSecuritySchemes = true;
            });
            builder.Services.AddDbContext<Datacontext>(options =>
            {
                options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
            });


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
