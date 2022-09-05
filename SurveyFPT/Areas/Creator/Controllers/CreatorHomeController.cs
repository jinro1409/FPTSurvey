using Hangfire;
using OfficeOpenXml;
using SurveyFPT.DTO;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.Models;
using SurveyFPT.Service;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Excel = Microsoft.Office.Interop.Excel;

namespace SurveyFPT.Areas.Creator.Controllers
{
    [AdminAuthorize("Creator")]
    public class CreatorHomeController : Controller
    {
        static public int PAGE_SIZE = 10;

        // GET: Creator/CreatorHome

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
                var tuple = surveyService.FindAllSurveySearch(page, PAGE_SIZE, search, categoryid);
                List<SurveyDTO> surveyDTOs = tuple.Item1;
                int total_record = tuple.Item2;
                int total_page = total_record % PAGE_SIZE == 0 ? total_record / PAGE_SIZE : total_record / PAGE_SIZE + 1;

                ViewBag.surveyDTOs = surveyDTOs;
                ViewBag.surveyCategoryDTOs = surveyCategoryDTOs;
                ViewBag.categoryid = categoryid;
                ViewBag.totalpage = total_page;
                ViewBag.page = page;
                ViewBag.search = search;
                return View("Index");
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
        }

        public ActionResult DeleteSurvey(int? id)
        {
            
            try
            {
                if (!id.HasValue) return View("~/Views/Shared/Error404.cshtml");
                {
                    if(!id.Value.ToString().Equals(""))
                    {
                        int ok = new SurveyService().Delete(id.Value);
                        _ = ok;
                    }
                }
                return RedirectToAction("Index", "CreatorHome", new { area = "Creator" });
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }

        }

        [HttpGet]
        public ActionResult CreateForm()
        {
            try
            {
                SurveyCategoryService surveyCategoryService = new SurveyCategoryService();
                List<SurveyCategoryDTO> surveys = surveyCategoryService.FindAllSurveyCategory();
                ViewBag.ListCategory = surveys;
                return View();
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }

        }
        [HttpPost]
        public ActionResult CreateForm(SurveyCreateDTO survey, HttpPostedFileBase excelFile, HttpPostedFileBase imagefile)
        {
            try
            {
                SurveyCategoryService surveyCategoryService = new SurveyCategoryService();
                List<SurveyCategoryDTO> surveys = surveyCategoryService.FindAllSurveyCategory();
                AssignStudentService assignStudentService = new AssignStudentService();
                ViewBag.ListCategory = surveys;
                Account account = (Account)Session["acc"];
                int id = account.Id;
                FileService fileService = new FileService();

                //hieumt add image
                string tempImage = Request["tempImage"].ToString();
                survey.BackgroundImage = fileService.UpdateImage(tempImage, imagefile);

                SurveyService surveyService = new SurveyService();
                int survey_id = surveyService.Create(survey, id);

                //import excel
                List<AssignedStudent> asts = fileService.ImportExcel(excelFile);

                //assign list students to db
                assignStudentService.saveAssignStudentToSurvey(asts, survey_id, id, survey.Name);

                
                TempData["mydata"] = $"Survey is created - {survey.Name} ";
                return RedirectToAction("Success", "CreatorHome");
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
        }

        public ActionResult ManagerForm()
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
                var tuple = surveyService.FindAllSurveySearch(page, PAGE_SIZE, search, categoryid);
                List<SurveyDTO> surveyDTOs = tuple.Item1;
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

        [HttpGet]
        public ActionResult EditForm(int? id)
        {
            if (!id.HasValue) return View("~/Views/Shared/Error404.cshtml");

            try
            {
                List<AssignedStudentDTO> assignedStudents = new AssignStudentService().findAllAssignBySurveyID(id.Value);
                if (assignedStudents != null)
                {
                    //insertAssignToExcel(assignedStudents);
                    ViewBag.survey_id = id.Value;
                }
                else
                {
                    ViewBag.survey_id = null;
                }
                SurveyService surveyService = new SurveyService();
                SurveyCategoryService surveyCategoryService = new SurveyCategoryService();
                List<SurveyCategoryDTO> surveys = surveyCategoryService.FindAllSurveyCategory();
                ViewBag.ListCategory = surveys;
                var survey = surveyService.ReadofCreate(id.Value);
                if (survey == null) return View("~/Views/Shared/Error404.cshtml");
                return View(survey);
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
        }

        [HttpPost]
        public ActionResult EditForm(SurveyCreateDTO survey, HttpPostedFileBase excelFile, HttpPostedFileBase imagefile)
        {
            try
            {
                AssignStudentService assignStudentService = new AssignStudentService();
                Account account = (Account)Session["acc"];
                int id = account.Id;
                //hieumt add image
                FileService fileService = new FileService();
                string tempImage = Request["tempImage"].ToString();
                survey.BackgroundImage = fileService.UpdateImage(tempImage, imagefile);


                //end hieumt add image

                new SurveyService().Update(survey, id);
                //import excel
                List<AssignedStudent> asts = fileService.ImportExcel(excelFile);

                //assign list students to db
                assignStudentService.saveAssignStudentToSurvey(asts, survey.ID, id,survey.Name);


            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
            TempData["mydata"] = $"Survey is updated - {survey.Name}";
            return RedirectToAction("Success", "CreatorHome");
        }

       

        [HttpGet]
        public ActionResult CreateTemplate(int? id)
        {
            if (!id.HasValue) return View("~/Views/Shared/Error404.cshtml");

            try
            {
                {
                    ViewBag.survey_id = null;
                }
                SurveyService surveyService = new SurveyService();
                SurveyCategoryService surveyCategoryService = new SurveyCategoryService();
                List<SurveyCategoryDTO> surveys = surveyCategoryService.FindAllSurveyCategory();
                ViewBag.ListCategory = surveys;
                var survey = surveyService.ReadofCreate(id.Value);

                if (survey == null) if (!id.HasValue) return View("~/Views/Shared/Error404.cshtml");
                return View(survey);
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
        }
        public ActionResult Success()
        {
            string temp = TempData["mydata"] as string;
            if (string.IsNullOrEmpty(temp)) return RedirectToAction("ManagerForm", "CreatorHome");
            ViewBag.Name = temp;
            return View();
        }

        public void exportSampleExcel()
        {
            new FileService().ExportSampleExcel();
        }

        public void exportExcel(int? id)
        {
            if (!id.HasValue) return;
            List<AssignedStudentDTO> assignedStudents = new AssignStudentService().findAllAssignBySurveyID(id.Value);

            new FileService().ExportAssignStudentToExcel(assignedStudents);

        }


    }
}