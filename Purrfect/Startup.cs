using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Purrfect.Startup))]
namespace Purrfect
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
