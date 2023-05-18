using BUSINESS.Services.BizUser;
using INFRASTRUCTURE;
using INFRASTRUCTURE.EFRepository;
using INFRASTRUCTURE.Repositories.BizUser;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace BizsolAssessment.Helper
{
    public static class RegisterServices
    {
        public static void ConfigureApplicationServices(this IServiceCollection services, IConfiguration configuration)
        {
            // Add services to the container.
            services.AddRazorPages();

            #region [-- REGISTERING SERVICES --]

            #endregion

            #region [-- REGISTERING DB CONTEXT SERVICE --]
            //this resolved the circular issue -- separate DBcontexts
            services.AddDbContext<ApplicationDbContext>(options => options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));

            #endregion

            #region [-- REGISTER REPOS AND SERVICES --]
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));

            //repos
            services.AddScoped<IBizUserRepository, BizUserRepository>();
            
            //services
            services.AddScoped<IBizUserService, BizUserService>();
            #endregion


        }
    }
}
