using System;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using SurveyFPT.DAL.UserDAO;
using SurveyFPT.Models;

namespace SurveyFPT.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public AccountController()
        {
        }

        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager )
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set 
            { 
                _signInManager = value; 
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        //
        // GET: /Account/Index
        [AllowAnonymous]
        public ActionResult Index()
        {
            Account acc = (Account)Session["acc"];
            if(acc==null)
            {
                string err1 = TempData["err1"] as string;
                ViewBag.Err1 = err1;
                return View();
            } else
            {
                Object[] toAction;
                toAction = SwitchUrl();
                return RedirectToAction(toAction[0].ToString(), toAction[1].ToString(), new { area = toAction[2] });
            }
               
        }

        // POST: /Account/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            // Request a redirect to the external login provider
            return new ChallengeResult(provider, Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/ExternalLoginCallback
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                TempData["err1"] = "Login Google service fail!";
                return RedirectToAction("Index", "Home", new { area = "" });
            }
            String checkFpt = ConfigurationManager.AppSettings["CheckFPT"];
            String checkFe = ConfigurationManager.AppSettings["CheckFE"];
            if (loginInfo.Email.Contains(checkFpt) || loginInfo.Email.Contains(checkFe))
            {
                Object[] toAction ;
                // Sign in the user with this external login provider if the user already has a login
                var result =
                   // SignInStatus.Success;
                    await SignInManager.ExternalSignInAsync(loginInfo, isPersistent: false);
                switch (result)
                {      
                    case SignInStatus.Success:
                        AddAccount(loginInfo.Email, loginInfo.Email);
                        toAction = SwitchUrl();
                        return RedirectToAction(toAction[0].ToString(), toAction[1].ToString(), new { area = toAction[2] });
                    //return RedirectToLocal(returnUrl);
                    default:
                        ApplicationUser au = new ApplicationUser
                        {
                            UserName = loginInfo.Email,
                            Email = loginInfo.Email
                        };
                        var user = au;
                        var result1 = await UserManager.CreateAsync(user);
                        if (result1.Succeeded)
                        {
                            result1 = await UserManager.AddLoginAsync(user.Id, loginInfo.Login);
                            if (result1.Succeeded)
                            {
                                await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                                AddAccount(loginInfo.Email, loginInfo.Email);
                                toAction = SwitchUrl();
                                return RedirectToAction(toAction[0].ToString(), toAction[1].ToString(), new { area = toAction[2] });
                            }
                        }
                        // If the user does not have an account, then prompt the user to create an account
                        ViewBag.ReturnUrl = returnUrl;
                        ViewBag.LoginProvider = loginInfo.Login.LoginProvider;
                        ViewBag.nameLogin = loginInfo.Email;
                        AddAccount(loginInfo.Email, loginInfo.Email);
                        toAction = SwitchUrl();
                        return RedirectToAction(toAction[0].ToString(), toAction[1].ToString(), new { area = toAction[2] });
                }
            }
            else
            {
                ViewBag.Err1 = "Please login by email FPT";
                return View("Index");
            }
            
        }
        //
        // POST: /Account/LogOff
        [HttpPost]
        public ActionResult LogOff(ExternalLoginConfirmationViewModel model)
        {
            if (model is null)
            {
                throw new ArgumentNullException(nameof(model));
            }

            Session["acc"] = null;
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Index", "Account");
        }


        public bool CheckStudent(string nameMail)
        {
            char[] gmail = nameMail.ToCharArray();
            int lastLength = gmail.Length - 11;
            int startLength = lastLength - 6;
            string temp = "";
            for (int i = startLength; i < lastLength; i++)
            {
                temp += gmail[i];
            }
            if (IsNumber(temp))
            {
                return true;
            }
            return false;
        }

        public bool IsNumber(string pValue)
        {
            foreach (Char c in pValue)
            {
                if (!Char.IsDigit(c))
                    return false;
            }
            return true;
        }

        public Object[] SwitchUrl()
        {
            Object[] a = new object[3];
            a[0] = "Index";
            a[1] = "Home";
            a[2] = "";
        
            Account acc = (Account)Session["acc"];
            if (acc == null)
            {
                return a;
            }
            else if (acc.Role.Name.Equals("admin"))
            {
                a[0] = "Index";
                a[1] = "AdminHome";
                a[2] = "Admin";
            }
           
            else if (acc.Role.Name.Equals("result"))
            {
                a[0] = "Index";
                a[1] = "ResultHome";
                a[2] = "Result";
            }
            else if (acc.Role.Name.Equals("creator"))
            {
                a[0] = "Index";
                a[1] = "CreatorHome";
                a[2] = "Creator";
            }
            return a;
        }

        public void AddAccount(string nameUser, string nameMail)
        {
            UserDAO u = new UserDAO();
            Account a = u.FindUserByEmail(nameMail);
            if (a == null)
            {            
                    a = new Account
                    {
                        Name = nameUser,
                        Mail = nameMail
                    };
                    Role r = new Role
                    {
                        Name = "user",
                        Id = 0
                    };
                    a.Role = r;
            }
            Session["acc"] = a;
            Session["Username"] = nameUser;
            Session["role"] = a.Role.Name;
        }

        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (_userManager != null)
                {
                    _userManager.Dispose();
                    _userManager = null;
                }

                if (_signInManager != null)
                {
                    _signInManager.Dispose();
                    _signInManager = null;
                }
            }

            base.Dispose(disposing);
        }

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }

        internal class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}