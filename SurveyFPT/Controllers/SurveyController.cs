using SurveyFPT.DAL;
using SurveyFPT.DTO;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.Responsed;
using SurveyFPT.Models;
using SurveyFPT.Service;
using System;
using System.Web.Mvc;

namespace SurveyFPT.Controllers
{
    [AdminAuthorize("user")]
    public class SurveyController : Controller
    {
        // GET: Survey
        [AdminAuthorize("user")]
        public ActionResult Index(int? id)
        {
            try
            {
                if (!id.HasValue || id.Value <= 0)
                {
                    return View("~/Views/Shared/Error404.cshtml"); 
                }//CHECK XEM NO CO DIEN CHUA
                Account account = (Account)Session["acc"];
                SurveyService surveyService = new SurveyService();
                AssignedStudentDAO assignedStudentDAO = new AssignedStudentDAO();
                if (surveyService.CheckSubmitedSurvey(id.Value, account.Mail) == 0 && assignedStudentDAO.Check(id.Value, account.Mail) != 0)
                {
                    var survey = surveyService.Read(id.Value);
                    if (survey != null)
                    {
                        if (DateTime.Now >= survey.OpenTime && DateTime.Now <= survey.CloseTime)
                        {
                            var surveyOutput = new ResponseSurveyDTO() { Survey = survey };
                            return View(surveyOutput);
                        }
                        else
                        {
                            return View("~/Views/Shared/TimeOut.cshtml");

                        }
                    }
                    else
                        return View("~/Views/Shared/Error404.cshtml");
                   
                       
                }
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
        [HttpPost]
        public ActionResult GetSurvey(ResponseSurveyDTO surveyDTO)
        {
            try
            {
                Account account = (Account)Session["acc"];
                surveyDTO.Email = account.Mail;
                if (new SurveyService().CheckSubmitedSurvey(surveyDTO.Survey.ID, account.Mail) == 0)
                {
                    bool check = new SurveyService().Create(surveyDTO);
                    TempData["mydata"] = surveyDTO.Survey.Name;
                    return RedirectToAction("Success", "Survey");
                }
                else return View("~/Views/Shared/Error404.cshtml");
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
        }
        [HttpGet]

        public ActionResult Update(int? id)
        {
            try
            {
                if (!id.HasValue || id.Value <= 0)
                {
                    return View("~/Views/Shared/Error404.cshtml");
                }
                Account account = (Account)Session["acc"];
                ResponsedSurveyDTO data = new SurveyService().Read(id.Value, account.Mail);
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
        [HttpPost]
        public ActionResult Update(ResponsedSurveyDTO responsedSurveyDTO)
        {
            try
            {
                ResponsedSurveyUpdateDTO response = responsedSurveyDTO.UpdateResponsedSurvey;
                bool check = new SurveyService().Update(response);
                TempData["mydata"] = responsedSurveyDTO.Name;
                return RedirectToAction("Success", "Survey");
            }
            catch (Exception ex)
            {
               return View("~/Views/Shared/Error500.cshtml", ex);
            }


        }
        public ActionResult Success()
        {
            string temp = TempData["mydata"] as string;
            if (string.IsNullOrEmpty(temp)) return RedirectToAction("Index", "Home");
            ViewBag.Name = temp;
            return View();
        }

    }
}