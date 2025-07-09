
using CNHReman.SyteLine.MESMaterialsAPI.Helpers;
using CNHReman.SyteLine.MESMaterialsAPI.IRepository;
using CNHReman.SyteLine.MESMaterialsAPI.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;

namespace CNHReman.SyteLine.MESMaterialsAPI
{
    /// <summary>
    /// This is the entry point for the program.
    /// The large majority of this file is registering services with the framework
    /// No real business logic
    /// </summary>
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // add the DbContext for EF Core
            string connection = Constants.SL_VERSION == 9 ? builder.Configuration.GetConnectionString("SyteLine") : builder.Configuration.GetConnectionString("SyteLine10");

            builder.Services.AddDbContext<SytelineContext>(options =>
                options.UseSqlServer(connection));


            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "MES Materials API", Version = "v1" });

                // Configure Swagger to accept an API key in the header
                c.AddSecurityDefinition("ApiKey", new OpenApiSecurityScheme
                {
                    Description = "API Key needed to access the endpoints.",
                    In = ParameterLocation.Header,
                    Name = Constants.API_KEY_HEADER,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "ApiKeyScheme"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "ApiKey"
                            },
                            Scheme = "ApiKeyScheme",
                            Name = Constants.API_KEY_HEADER,
                            In = ParameterLocation.Header
                        },
                        new List<string>()
                    }
                });
            });

            // register DAL classes for DI
            builder.Services.AddScoped<IInternalAPIAccess, InternalAPIAccess>();
            builder.Services.AddScoped<IMESMaterialsAccess, MESMaterialsAccess>();
            builder.Services.AddScoped<IMESBuildStatusAccess, MESBuildStatusAccess>();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (Constants.SWAGGER_ENABLED)
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
