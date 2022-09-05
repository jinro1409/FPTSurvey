using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SurveyFPT.Startup))]
namespace SurveyFPT
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
           
            ConfigureAuth(app);
        }
    }
}
