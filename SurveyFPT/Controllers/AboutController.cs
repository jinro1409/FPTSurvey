using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SurveyFPT.Controllers
{
    public class AboutController : Controller
    {
        // GET: About
        public ActionResult Index()
        {
            int year = DateTime.Now.Year;
            ViewBag.Year = year;
            return View();
        }
    }
}