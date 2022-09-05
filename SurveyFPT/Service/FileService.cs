using OfficeOpenXml;
using SurveyFPT.DTO;
using SurveyFPT.DTO.Responsed;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using System.Web;

namespace SurveyFPT.Service
{
    public class FileService
    {
        public string UploadImages(HttpPostedFileBase file, string direction)
        {
            if (file.ContentLength > 0)
            {
                Guid guid = Guid.NewGuid();
                var extenstion = Path.GetExtension(file.FileName);
                Random rd = new Random();
                int rand_num = rd.Next(0, 100);

                string fileName = "i_" + guid + "_" + rand_num + extenstion;

                if (!Directory.Exists(direction)) Directory.CreateDirectory(direction);
                string savedFileName = (direction + fileName);
                file.SaveAs(savedFileName);

                return fileName;

            }
            return null;

        }
        public void SendMail(List<AssignedStudent> accounts, int survey_id, string survey_name, string htmlPath)
        {
            try
            {
                String title = "FPT send mail";
                String message = "Pls fill survey";
                SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
                var smtpClient = new SmtpClient(smtpSection.Network.Host)
                {
                    Port = smtpSection.Network.Port,
                    Credentials = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password),
                    EnableSsl = smtpSection.Network.EnableSsl,

                };
                MailMessage mailMessage = new MailMessage
                {
                    From = new MailAddress(smtpSection.From),
                    Subject = title,
                    IsBodyHtml = true
                };
                string body = CreateEmailBody("", title, message, survey_id, survey_name, htmlPath);
                mailMessage.Body = body;
                foreach (AssignedStudent acc in accounts)
                {
                    mailMessage.To.Add(new MailAddress(acc.Email));
                }
                smtpClient.Send(mailMessage);

            }
            catch (Exception)
            {

            }
        }


        public string CreateEmailBody(string userName, string title, string message, int survey_id, string survey_name, string htmlPath)
        {
            string body = string.Empty;
            try
            {
                //using streamreader for reading my htmltemplate   

                using (StreamReader reader = new StreamReader(htmlPath))

                {

                    body = reader.ReadToEnd();

                }
                body = body.Replace("{id}", survey_id.ToString());
                body = body.Replace("{Title}", title);
                body = body.Replace("{message}", message);
                body = body.Replace("{survey}", survey_name);
                body = body.Replace("{link}", ConfigurationManager.AppSettings["LinkFillSurvey"]);

                return body;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public String UpdateImage(String tempImage, HttpPostedFileBase imagefile)
        {
            if (tempImage != null && !tempImage.Equals(""))
            {
                return tempImage;
            }
            else if (imagefile != null && imagefile.ContentLength != 0)
            {
                string var = HttpContext.Current.Server.MapPath("/Content/Img/SurveyImage/");
                string s = new ImageService().UploadImages(imagefile, var);
                return s;
            }
            return null;
        }

        public void ExportSampleExcel()
        {
            try
            {
                ExcelPackage pck = new ExcelPackage();
                ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Report");
                ws.Cells[1, 1].Value = "Email";
                ws.Cells[2, 1].Value = "Cuonghphe141628@fpt.edu.vn";
                ws.Cells[3, 1].Value = "Heilvhe141628@fpt.edu.vn";
                ws.Cells[4, 1].Value = "Longndhe141628@fpt.edu.vn";

                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                HttpContext.Current.Response.AddHeader("content-disposition", "attachment: filename=SampleAssign.xlsx");
                HttpContext.Current.Response.BinaryWrite(pck.GetAsByteArray());
                HttpContext.Current.Response.End();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<AssignedStudent> ImportExcel(HttpPostedFileBase excelFile)
        {
            if (excelFile != null && excelFile.ContentLength != 0)
            {
                if (excelFile.FileName.EndsWith(".xls") || excelFile.FileName.EndsWith(".xlsx"))
                {

                    try
                    {
                        List<AssignedStudent> asts = new List<AssignedStudent>();
                        ExcelPackage package = new ExcelPackage(excelFile.InputStream);
                        int ok = package.Workbook.Worksheets.Count;
                        ExcelWorksheets worksheets = package.Workbook.Worksheets;
                        ExcelWorksheet worksheet = worksheets[1];//Get the reference of second worksheet

                        // get number of rows and columns in the sheet
                        int rows = worksheet.Dimension.Rows; // 20
                        int columns = worksheet.Dimension.Columns; // 7

                        // loop through the worksheet rows and columns

                        for (int j = 2; j <= rows; j++)
                        {
                            string content = worksheet.Cells[j, 1].Text;
                            if (!content.Trim().Equals("") && content.Contains("@"))
                            {
                                AssignedStudent ast = new AssignedStudent();
                                ast.Email = content;
                                asts.Add(ast);
                            }
                        }
                        return asts;
                        //assignStudentService.saveAssignStudentToSurvey(asts, survey_id, id);
                        //var jobId = BackgroundJob.Schedule(() => new FileService().SendMail(asts, survey_id, Server.MapPath("/Views/Shared/HtmlEmailTemplate.html")), TimeSpan.FromSeconds(1));
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                }
            }
            return null;
        }

        public void ExportAssignStudentToExcel(List<AssignedStudentDTO> assignedStudents)
        {
            try
            {
                ExcelPackage pck = new ExcelPackage();
                ExcelWorksheet ws = pck.Workbook.Worksheets.Add("AssignStudent");
                ws.Cells[1, 1].Value = "Email";

                for (int i = 1; i < 2; i++)
                {
                    int k = 2;
                    for (int j = 0; j < assignedStudents.Count; j++)
                    {
                        ws.Cells[k, i].Value = assignedStudents[j].Email;
                        k++;
                    }
                }
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                HttpContext.Current.Response.AddHeader("content-disposition", "attachment: filename=AssignStudent.xlsx");
                HttpContext.Current.Response.BinaryWrite(pck.GetAsByteArray());
                HttpContext.Current.Response.End();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void ExportResponseToExcel(ExportDataDTO exportData)
        {
            try
            {
                ExcelPackage pck = new ExcelPackage();
                ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Answer");
                
                ws.Cells[1, 2].RichText.Add("Email").Bold=true;
                for (int i = 0; i < exportData.Question.Count; i++)
                {
                    ws.Cells[1,(i+3)].RichText.Add( exportData.Question[i]).Bold=true;
                }
                for (int i = 0; i < exportData.Answers.Count; i++)
                {
                    ws.Cells[(i + 2),1].Value=exportData.Answers[i].ResponseTime.ToString();
                    ws.Cells[(i + 2), 2].Value = exportData.Answers[i].Email;
                    for (int j = 0; j < exportData.Answers[i].Answer.Count; j++)
                    {
                        ws.Cells[(i + 2), (j + 3)].Value = exportData.Answers[i].Answer[j];
                    }
                }
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                HttpContext.Current.Response.AddHeader("content-disposition", "attachment: filename=AssignStudent.xlsx");
                HttpContext.Current.Response.BinaryWrite(pck.GetAsByteArray());
                HttpContext.Current.Response.End();
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}