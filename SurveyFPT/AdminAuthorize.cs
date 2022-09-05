using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Filters;
using System.Web.Routing;
using Microsoft.Owin.Security;
using SurveyFPT.Models;

namespace SurveyFPT
{

    public class AdminAuthorize : AuthorizeAttribute, IAuthenticationFilter
    {
      


        private readonly string[] allowedroles;
        public AdminAuthorize(params string[] roles)
        {
            this.allowedroles = roles;
        }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            bool authorize = false;
            Account acc = (Account)httpContext.Session["acc"];
            if (acc != null)
                foreach (var role in allowedroles)
                {
                    
                    if (role.ToLower().Equals(acc.Role.Name)) return true;
                }

            return authorize;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new RedirectToRouteResult(
               new RouteValueDictionary
               {
                    { "controller", "Home" },
                    { "action", "UnAuthorized" },
                   {"area","" }
               });

        }

        public void OnAuthentication(AuthenticationContext filterContext)
        {
            if (filterContext.HttpContext.Session["acc"] == null)
            {
                filterContext.Result = new HttpUnauthorizedResult();
            }
        }
        public void OnAuthenticationChallenge(AuthenticationChallengeContext filterContext)
        {

            string controller = "Account";
            string action = "Index";
            string area = "";
            if (filterContext.Result == null || filterContext.Result is HttpUnauthorizedResult)
            {
                //Redirecting the user to the Login View of Account Controller  
                filterContext.Result = new RedirectToRouteResult(
               new RouteValueDictionary
               {
                     { "controller", controller },
                     { "action", action },
                    {"area",area }
               });

            }


            
             
        }

    }
}