using SurveyFPT.DTO;
using SurveyFPT.Models;
using SurveyFPT.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SurveyFPT.Controllers
{
    public class HomeController : Controller
    {
        static public int PAGE_SIZE = 10;
        [AdminAuthorize("user")]
        // GET: Home
        public ActionResult Index(int? response)
        {
            try
            {
                string tempPage = Request["page"];
                string search = Request["search"];
                int page = 1;
                string isresponse = Request["response"];
                if (tempPage != null)
                {
                    page = Int32.Parse(tempPage);
                }
                if (search == null)
                {
                    search = "";
                }

                string message = TempData["mydata"] as string;
                Account acc = (Account)Session["acc"];
                SurveyService surveyService = new SurveyService();
                var temp = surveyService.FindAllSurveyByEmailSearch(0, acc.Mail, page, PAGE_SIZE, search);
                if (!response.HasValue || response.Value != 1)
                {
                    ViewBag.response = 0;
                }
                else
                {
                    temp = surveyService.FindAllSurveyByEmailSearch(1, acc.Mail, page, PAGE_SIZE, search);
                    ViewBag.response = 1;
                }

                int total_record = temp.Item2;
                int total_page = total_record % PAGE_SIZE == 0 ? total_record / PAGE_SIZE : total_record / PAGE_SIZE + 1;
                ViewBag.totalpage = total_page;
                ViewBag.page = page;
                ViewBag.search = search;

                ViewBag.surveyDTOs = temp.Item1;
                ViewBag.Message = message;
                return View();
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }

        }

        public ActionResult UnAuthorized()
        {
            return View();
        }
    }
}