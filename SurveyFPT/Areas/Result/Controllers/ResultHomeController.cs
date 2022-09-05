using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SurveyFPT.DTO;
using SurveyFPT.DTO.Responsed;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Models;
using SurveyFPT.Service;

namespace SurveyFPT.Areas.Result.Controllers
{
    [AdminAuthorize("result")]
    public class ResultHomeController : Controller
    {

        static public int PAGE_SIZE = 10;
        // GET: Result/ResultHome
        public ActionResult Index()
        {
            try
            {
                string tempPage = Request["page"];
                string search = Request["search"];
                string tempCategoryId = Request["categoryid"];
                int page = 1;
                int categoryid = -1;
                if (tempPage != null)
                {
                    page = Int32.Parse(tempPage);
                }
                if (search == null || search.Trim().Equals(""))
                {
                    search = "";
                }
                if (tempCategoryId != null)
                {
                    categoryid = Int32.Parse(tempCategoryId);
                }

                SurveyCategoryService surveyCategoryService = new SurveyCategoryService();
                List<SurveyCategoryDTO> surveyCategoryDTOs = surveyCategoryService.FindAllSurveyCategory();
                SurveyService surveyService = new SurveyService();
                var tuple = surveyService.FindAllSurveyResultSearch(page, PAGE_SIZE, search.Trim(), categoryid);
                List<SurveyStatisticDTO> surveyDTOs = tuple.Item1;
                int total_record = tuple.Item2;
                int total_page = total_record % PAGE_SIZE == 0 ? total_record / PAGE_SIZE : total_record / PAGE_SIZE + 1;



                ViewBag.surveyDTOs = surveyDTOs;
                ViewBag.surveyCategoryDTOs = surveyCategoryDTOs;
                ViewBag.categoryid = categoryid;
                ViewBag.totalpage = total_page;
                ViewBag.page = page;
                ViewBag.search = search;
                return View();
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }

        }
        public ActionResult Read(int? id)
        {
            try
            {
                var a = new SurveyService().Statistic(id.Value);
                if (a == null)
                {
                    return View("~/Views/Shared/Error404.cshtml");
                }
                return View(a);
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
        }
        public ActionResult Individual(int? id)
        {

            try
            {
                if (!id.HasValue || id.Value <= 0)
                {
                    return View("~/Views/Shared/Error404.cshtml");
                }
                ResponsedSurveyDTO data = new SurveyService().ReadIndividual(id.Value);
                if (data != null)
                    return View(data);
                else
                {
                    return View("~/Views/Shared/Error404.cshtml");
                }
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
        }
        
        public void ExportExcel(int? id)
        {

            try
            {
                if (!id.HasValue || id.Value <= 0)
                {
                    Redirect("~/Views/Shared/Error404.cshtml");
                }
               var data= new SurveyService().ExportResult(id.Value);


                if (data != null)
                    new FileService().ExportResponseToExcel(data);
                else
                {
                    Redirect("~/Views/Shared/Error404.cshtml");
                }
            }
            catch (Exception ex)
            {
                RedirectToActionPermanent("~/Views/Shared/Error500.cshtml",ex);
            }
        }
    }
}