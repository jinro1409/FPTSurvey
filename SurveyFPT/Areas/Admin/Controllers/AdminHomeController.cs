using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SurveyFPT.DAL;
using SurveyFPT.DAL.RoleDAO;
using SurveyFPT.DAL.UserDAO;
using SurveyFPT.DTO;
using SurveyFPT.Models;
using SurveyFPT.Service;

namespace SurveyFPT.Areas.Admin.Controllers
{
    
    [AdminAuthorize("Admin")]
    public class AdminHomeController : Controller
    {
        static public int PAGE_SIZE = 10;
        static public string MAIL_FPT = "@fpt.edu.vn";
        readonly UserDAO uDao = new UserDAO();


        // GET: Admin/AdminHome
        public ActionResult Index()
        {
            try
            {
                string tempPage = Request["page"];
                string search = Request["search"];
                int page = 1;
                if (tempPage != null)
                {
                    page = Int32.Parse(tempPage);
                }
                if (search == null)
                {
                    search = "";
                }
                var tuple = new UserService().FindAllUser(page, PAGE_SIZE, search);
                List<Account> acc = tuple.Item1;
                int total_record = tuple.Item2;
                int total_page = total_record % PAGE_SIZE == 0 ? total_record / PAGE_SIZE : total_record / PAGE_SIZE + 1;
                ViewBag.totalpage = total_page;
                ViewBag.page = page;
                ViewBag.search = search;
                ViewBag.list = acc;
                return View();
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
        }

        public ActionResult DetailUser(int? id)
        {
            try
            {
                String[] fpt = { "@fpt.edu.vn", "@fe.edu.vn" };
                if (!id.HasValue || id.Value <= 0)
                {
                    return RedirectToAction("Index", "AdminHome", new { area = "Admin" });
                }

                UserDTO userDTO;
                userDTO = new UserService().FindUserByID((int)id);
                if (userDTO == null)
                {
                    return RedirectToAction("Index", "AdminHome", new { area = "Admin" });
                }
                List<Role> roles = new RoleDAO().FindAllRoleProcedure();
                ViewBag.roles = roles;
                userDTO.Email = userDTO.Email.Split('@')[0];
                ViewBag.userDTO = userDTO;
                for(int i = 0; i < fpt.Count(); i++)
                {
                    if (userDTO.Email.Contains(fpt[i]))
                    {
                        ViewBag.ftp = fpt[i];
                        break;
                    }
                }
                ViewBag.fpt = fpt;
                return View();
            } 
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
            
        }

        public ActionResult ManagerUser()
        {
            try
            {
                String[] fpt = { "@fpt.edu.vn", "@fe.edu.vn" };
                ViewBag.fpt = fpt;
                List<Role> roles = new RoleDAO().FindAllRoleProcedure();
                ViewBag.roles = roles;
                return View("ManagerUser");
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
        }

        [HttpPost]
        public ActionResult AssignRole()
        {
            try
            {
                String fpt = Request.Form["fpt"].ToString();
                String roleid = Request.Form["roleid"].ToString();
                String mail = Request.Form["mail"].ToString().Trim();
                String id = Request.Form["id"].ToString();
                String isa = Request.Form["Active"];
                Boolean active = false;
                if (isa != null && isa.Equals("on")) active = true;
                Account acc = (Account)HttpContext.Session["acc"];
                if (mail != null && !mail.Equals("") && roleid != null && !roleid.Equals(""))
                {
                    Account a = new Account
                    {
                        Id = Convert.ToInt32(id),
                        Mail = mail + fpt,
                        Active = active,
                        Name = mail
                    };
                    Role r = new Role
                    {
                        Id = Int32.Parse(roleid)
                    };
                    a.Role = r;


                    // assign =1 is assign role, =0 is update
                    int assign;
                    if (a.Id > 0)
                    {
                        assign = 0;
                    }
                    else
                    {
                        assign = 1;
                    }
                    var nice = uDao.SaveUserProcedure(a, assign, acc);
                    var ok = nice.Item1;
                    var ok1 = nice.Item2;

                    return Json(ok1, JsonRequestBehavior.AllowGet);

                }

                return Json("error", JsonRequestBehavior.AllowGet);

            } 
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
            
        }

        public ActionResult ListSurveyCategory()
        {
            try
            {
                string tempPage = Request["page"];
                string search = Request["search"];
                string tempCategoryId = Request["categoryid"];
                int page = 1;
                int categoryid = -1;

                if (!string.IsNullOrEmpty(tempPage))
                {
                    page = Int32.Parse(tempPage);
                }
                
                if (string.IsNullOrWhiteSpace(search))
                {
                    search = "";
                }

                if (!string.IsNullOrEmpty(tempCategoryId))
                {
                    categoryid = Int32.Parse(tempCategoryId);
                }

                SurveyCategoryService surveyCategoryService = new SurveyCategoryService();

                var tuple = surveyCategoryService.FindAllSurveyCategorySearch(page, PAGE_SIZE, search);
                List<SurveyCategoryDTO> surveys = tuple.Item1;
                int total_record = tuple.Item2;
                int total_page = total_record % PAGE_SIZE == 0 ? total_record / PAGE_SIZE : total_record / PAGE_SIZE + 1;

                ViewBag.totalpage = total_page;
                ViewBag.page = page;
                ViewBag.search = search;
                ViewBag.surveys = surveys;
                
                return View();
            } 
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
            
        }
        
        public ActionResult DetailSurveyCategory(int? id) {
            try
            {
                SurveyCategoryService surveyCategoryService = new SurveyCategoryService();
                SurveyCategoryDTO categoryDTO;
                if (!id.HasValue || id.Value == 0)
                {
                    categoryDTO = new SurveyCategoryDTO
                    {
                        ID = 0
                    };
                    return View(categoryDTO);
                }
                if (id.Value < 0)
                {
                    return View("~/Views/Shared/Error404.cshtml");
                }
                else
                {
                    categoryDTO = surveyCategoryService.FindSurveyCategoryByID((int)id);
                    if (categoryDTO == null) return RedirectToAction("ListSurveyCategory", "AdminHome");
                    return View(categoryDTO);
                }
            }
            catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
            
        }

        [HttpPost]
        public ActionResult SaveSurveyCategory(SurveyCategory model)
        {
            try
            {
                Account acc = (Account)HttpContext.Session["acc"];
                SurveyCategoryService surveyCategoryService = new SurveyCategoryService();
                if (model.Name.Trim().Equals("") || model.Description.Trim().Equals(""))
                {
                    return RedirectToAction("DetailSurveyCategory", "AdminHome", new { area = "Admin" });
                }
                _ = surveyCategoryService.saveSurveyCategory(model, acc);
                return RedirectToAction("ListSurveyCategory", "AdminHome", new { area = "Admin" });
            } catch (Exception ex)
            {
                return View("~/Views/Shared/Error500.cshtml", ex);
            }
           
        }
    }
}