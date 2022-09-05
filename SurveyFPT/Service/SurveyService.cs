using Hangfire;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Math;
using SurveyFPT.DAL;
using SurveyFPT.DAL.SurveyDAO;
using SurveyFPT.DTO;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.OutPutDTO;
using SurveyFPT.DTO.Responsed;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Mapper;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SurveyFPT.Service
{
    public class SurveyService
    {
        private readonly SurveyDAO surveyDAO;
        private readonly SurveyMapper surveyMapper;
        public SurveyService()
        {
            surveyDAO = new SurveyDAO();
            surveyMapper = new SurveyMapper();
        }

        public int Delete(int id)
        {
            Survey survey = new SurveyDAO().Read(id);
            if (survey != null)
            {
                return new SurveyDAO().Delete(id);
            }
            else
            {
                return 0;
            }
        }

        public SurveyDTO Read(int id)
        {
            SurveyDTO surveyDTO;
            Survey survey = new SurveyDAO().Read(id);
            //if(survey.OpenTime>=DateTime.Now||survey.CloseTime<=DateTime.Now) return surveyDTO = surveyMapper.SurveytoSurveyDTO(survey, null, null);
            if (survey != null)
            {
                SurveyCategory surveyCategory = new SurveyCategoryDAO().Read(survey.SurveyCategoryID);
                SurveyCategoryDTO surveyCategoryDTO = new SurveyCategoryMapper().SurveyCategorytoSurveyCategoryDTO(surveyCategory);
                surveyDTO = surveyMapper.SurveytoSurveyDTO(survey, new SectionService().Read(id), surveyCategoryDTO);
                return surveyDTO;
            }
            else
                return null;

        }

        public Tuple<List<SurveyDTO>, int> FindAllSurveySearch(int page, int pagesize, string search, int categoryid)
        {
            List<SurveyDTO> listSurvey = new List<SurveyDTO>();
            int total_page;
            try
            {
                SurveyDAO surveyDAO = new SurveyDAO();
                var surveys = surveyDAO.FindAllSurveySearch(page, pagesize, search, categoryid);
                total_page = surveys.Item2;
                foreach (var s in surveys.Item1)
                {
                    SurveyCategory surveyCategory = new SurveyCategoryDAO().Read(s.SurveyCategoryID);
                    SurveyCategoryDTO surveyCategoryDTO = new SurveyCategoryMapper().SurveyCategorytoSurveyCategoryDTO(surveyCategory);
                    SurveyDTO surveyDTO = new SurveyMapper().SurveytoSurveyDTO(s, null, surveyCategoryDTO);
                    listSurvey.Add(surveyDTO);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message); ;
                throw;
            }
            return new Tuple<List<SurveyDTO>, int>(listSurvey, total_page); ;
        }

        public Tuple<List<SurveyStatisticDTO>, int> FindAllSurveyResultSearch(int page, int pagesize, string search, int categoryid)
        {
            List<SurveyStatisticDTO> listSurvey = new List<SurveyStatisticDTO>();
            int total_page;
            try
            {
                SurveyDAO surveyDAO = new SurveyDAO();
                var surveys = surveyDAO.FindAllSurveyResultSearch(page, pagesize, search, categoryid);
                total_page = surveys.Item2;
                foreach (var s in surveys.Item1)
                {

                    listSurvey.Add(s);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message); ;
                throw;
            }
            return new Tuple<List<SurveyStatisticDTO>, int>(listSurvey, total_page); ;
        }

        public List<SurveyDTO> FindAllSurvey()
        {
            List<SurveyDTO> listSurvey = new List<SurveyDTO>();
            try
            {
                SurveyDAO surveyDAO = new SurveyDAO();
                List<Survey> surveys = surveyDAO.FindAllSurvey();

                foreach (var s in surveys)
                {
                    SurveyCategory surveyCategory = new SurveyCategoryDAO().Read(s.SurveyCategoryID);
                    SurveyCategoryDTO surveyCategoryDTO = new SurveyCategoryMapper().SurveyCategorytoSurveyCategoryDTO(surveyCategory);
                    SurveyDTO surveyDTO = new SurveyMapper().SurveytoSurveyDTO(s, null, surveyCategoryDTO);
                    listSurvey.Add(surveyDTO);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message); ;
                throw;
            }
            return listSurvey;
        }

        public Tuple<List<SurveyDTO>, int> FindAllSurveyByEmailSearch(int isResponse, string email, int page, int pagesize, string search)
        {
            List<SurveyDTO> listSurvey = new List<SurveyDTO>();
            int total_page;
            try
            {
                SurveyDAO surveyDAO = new SurveyDAO();
                var surveys = surveyDAO.FindAllSurveyByEmailSearch(isResponse, email, page, pagesize, search);
                total_page = surveys.Item2;
                foreach (var s in surveys.Item1)
                {
                    SurveyCategory surveyCategory = new SurveyCategoryDAO().Read(s.SurveyCategoryID);
                    SurveyCategoryDTO surveyCategoryDTO = new SurveyCategoryMapper().SurveyCategorytoSurveyCategoryDTO(surveyCategory);
                    SurveyDTO surveyDTO = new SurveyMapper().SurveytoSurveyDTO(s, null, surveyCategoryDTO);
                    listSurvey.Add(surveyDTO);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("findAllSurveyByEmail : " + e.Message); ;
                throw;
            }
            return new Tuple<List<SurveyDTO>, int>(listSurvey, total_page);
        }

        public List<SurveyDTO> FindAllSurveyByEmail(int isResponse, string email)
        {
            List<SurveyDTO> listSurvey = new List<SurveyDTO>();
            try
            {
                SurveyDAO surveyDAO = new SurveyDAO();
                List<Survey> surveys = surveyDAO.FindAllSurveyByEmail(isResponse, email);

                foreach (var s in surveys)
                {
                    SurveyCategory surveyCategory = new SurveyCategoryDAO().Read(s.SurveyCategoryID);
                    SurveyCategoryDTO surveyCategoryDTO = new SurveyCategoryMapper().SurveyCategorytoSurveyCategoryDTO(surveyCategory);
                    SurveyDTO surveyDTO = new SurveyMapper().SurveytoSurveyDTO(s, null, surveyCategoryDTO);
                    listSurvey.Add(surveyDTO);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("findAllSurveyByEmail : " + e.Message); ;
                throw;
            }
            return listSurvey;
        }


        public bool Create(ResponseSurveyDTO responeSurveyDTO)
        {
            ResponsedSurveyDAO surveyDAO = new ResponsedSurveyDAO();
            int id = surveyDAO.Create(responeSurveyDTO.Email, responeSurveyDTO.Survey.ID);
            List<ResponseChoiceAnswerDTO> answerDTOs = responeSurveyDTO.ResponsedChoiceAnswerDTOs;
            List<ResponseLinearScaleAnswerDTO> linearScaleAnswerDTOs = responeSurveyDTO.ResponsedLinearScaleAnswers;
            List<ResponseTextAnswerDTO> responsedTextAnswerDTOs = responeSurveyDTO.TextAnswerDTOs;
            ResponsedChoiceAnswerDAO choiceAnswerDAO = new ResponsedChoiceAnswerDAO();
            ResponsedLinearScaleDAO responsedLinearScaleDAO = new ResponsedLinearScaleDAO();
            ResponsedIsOtherChoiceAnswerDAO responseIsOtherChoiceAnswerDAO = new ResponsedIsOtherChoiceAnswerDAO();
            ResponesedTextAnswerDAO responesedTextAnswerDAO = new ResponesedTextAnswerDAO();
            int rs;
            if (answerDTOs != null && answerDTOs.Count > 0)
            {
                foreach (var item in answerDTOs)
                {
                    if (item.Choice != null && item.IsChecked)
                    {
                        int choice = choiceAnswerDAO.Create(item.Choice.ID, id);
                        if (choice == 0) return false;
                        if (item.IsOtherChoiceText != null && item.IsOtherChoiceText.Text != null)
                        {
                            rs = responseIsOtherChoiceAnswerDAO.Create(choice, item.IsOtherChoiceText.Text.Trim());
                            if (rs <= 0) return false;
                        }
                    }
                    else continue;
                }
            }
            if (linearScaleAnswerDTOs != null && linearScaleAnswerDTOs.Count > 0)
            {
                foreach (var item in linearScaleAnswerDTOs)
                {
                    if (item.LinearAnswer != null)
                    {
                        rs = responsedLinearScaleDAO.Create(id, item.LinearAnswer.ID);
                        if (rs <= 0) return false;
                    }
                    else continue;
                }
            }

            if (responsedTextAnswerDTOs != null && responsedTextAnswerDTOs.Count > 0)
            {
                foreach (var item in responsedTextAnswerDTOs)
                {
                    if (item.Response != null && item.Response.Trim() != "")
                    {
                        rs = responesedTextAnswerDAO.Create(item.Response, id, item.TextAnswerDTO.ID);
                        if (rs <= 0) return false;
                    }
                    else continue;
                }
            }
            return true;
        }
        public int CheckSubmitedSurvey(int id, string email)
        {
            var rs = new SurveyResponeseDAO().Read(id, email);
            return rs;
        }
        public ResponsedSurveyDTO ReadIndividual(int id)
        {
            var infor = new SurveyResponeseDAO().ReadIndividual(id);
            if (infor == null) return null;
            else
            {
                return Read(infor.Survey.ID, infor.Email);
            }
        }
        public ResponsedSurveyDTO Read(int id, string email)
        {
            SurveyDTO surveDTO = Read(id);
            int sid = new SurveyResponeseDAO().Read(id, email);
            if (sid == 0 || surveDTO == null) return null;

            List<ResponseTextAnswerDTO> textAnswers = new ResponesedTextAnswerDAO().Read(sid);
            List<ResponseChoiceAnswerDTO> choiceAnswers = new ResponsedChoiceAnswerDAO().Read(sid);
            List<ResponseLinearScaleAnswerDTO> linearScaleAnswers = new ResponsedLinearScaleDAO().Read(sid);
            List<ResponsedQuestionDTO> responsedQuestionDTOs;
            ResponsedQuestionDTO responsedQuestionDTO;
            List<ResponsedSectionDTO> responsedSectionDTOs = new List<ResponsedSectionDTO>();
            ResponsedSectionDTO responsedSectionDTO;
            LinearScaleService linearScaleService = new LinearScaleService();
            ChoiceService choiceService = new ChoiceService();
            TextAnswerService textAnswerService = new TextAnswerService();
            foreach (var section in surveDTO.Sections)
            {
                responsedQuestionDTOs = new List<ResponsedQuestionDTO>();

                foreach (var question in section.Questions)
                {

                    responsedQuestionDTO = new ResponsedQuestionDTO()
                    {
                        ID = question.ID,
                        QuestionCategory = question.QuestionCategory,
                        IsRequire = question.IsRequire,
                        QuestionLabel = question.QuestionLabel,
                        Description = question.Description,
                        LinearAnswers = linearScaleService.Read(question.LinearAnswers, linearScaleAnswers),
                        ChoiceAnswers = choiceService.Read(question.ChoiceAnswers, choiceAnswers, question.QuestionCategory.ID),
                        TextAnswer = textAnswerService.Read(question.TextAnswer, textAnswers)
                    };
                    responsedQuestionDTOs.Add(responsedQuestionDTO);
                }
                responsedSectionDTO = new ResponsedSectionDTO
                {
                    ID = section.ID,
                    Name = section.Name,
                    Description = section.Description,
                    Questions = responsedQuestionDTOs,
                };
                responsedSectionDTOs.Add(responsedSectionDTO);

            }
            ResponsedSurveyDTO responsedSurveyDTO = new ResponsedSurveyDTO()
            {
                ID = sid,
                Name = surveDTO.Name,
                Description = surveDTO.Description,
                OpenTime = surveDTO.OpenTime,
                CloseTime = surveDTO.CloseTime,
                SurveyCategory = surveDTO.SurveyCategory,
                IsScoreTaken = surveDTO.IsScoreTaken,
                IsAllowChanging = surveDTO.IsAllowChanging,
                BackgroundColor = surveDTO.BackgroundColor,
                BackgroundImage = surveDTO.BackgroundImage,
                Sections = responsedSectionDTOs,
                Email = email,
            };
            return responsedSurveyDTO;

        }
        public bool Update(ResponsedSurveyUpdateDTO updateResponsedSurvey)
        {
            ChoiceService choiceService = new ChoiceService();
            if (!choiceService.Update(updateResponsedSurvey.SingleChoiceDTOs, updateResponsedSurvey.ID)) return false;
            if (!choiceService.Update(updateResponsedSurvey.MultipleChoiceDTOs, updateResponsedSurvey.ID)) return false;
            if (!new LinearScaleService().Update(updateResponsedSurvey.LinearScaleDTOs, updateResponsedSurvey.ID)) return false;
            if (!new TextAnswerService().Update(updateResponsedSurvey.TextDTOs, updateResponsedSurvey.ID)) return false;
            return true;
        }
        public int Create(SurveyCreateDTO responeSurveyDTO, int id)
        {
            int secorder = 0;
            responeSurveyDTO.CreatedBy = id;
            var prefix = new SurveyCategoryDAO().Read(responeSurveyDTO.SurveyCategory.ID).Prefix;
            prefix += "_" + Guid.NewGuid();
            responeSurveyDTO.Code = prefix;
            foreach (var item in responeSurveyDTO.Sections)
            {
                secorder++;
                item.Value.Order = secorder;
                item.Value.CreatedBy = id;
                int qorder = 0;
                foreach (var question in item.Value.Questions)
                {
                    qorder++;
                    question.Value.Order = secorder;
                    question.Value.CreatedBy = id;
                    int corder = 0;
                    if (question.Value.ChoiceAnswers != null && question.Value.ChoiceAnswers.Count > 0)
                        foreach (var choice in question.Value.ChoiceAnswers)
                        {
                            if (choice.Value.IsOtherChoice) choice.Value.Order = question.Value.ChoiceAnswers.Count;
                            else
                            {
                                corder++;
                                choice.Value.Order = corder;
                            }
                            choice.Value.CreatedBy = id;

                        }
                    if (question.Value.LinearAnswers != null && question.Value.LinearAnswers.Count > 0)
                        foreach (var linear in question.Value.LinearAnswers)
                        {
                            linear.CreatedBy = id;

                        }
                    if (question.Value.TextAnswer != null)
                        question.Value.TextAnswer.CreatedBy = id;
                }
            }
            SectionService sectionService = new SectionService();
            int surveyID = surveyDAO.Create(responeSurveyDTO);
            if (surveyID == 0) return surveyID;
            else
            {
                if (!sectionService.Create(responeSurveyDTO.Sections, surveyID)) return surveyID;
            }

            return surveyID;
        }
        public SurveyStatisticDTO Statistic(int id)
        {
            var survey = surveyDAO.Statistic(id);

            if (survey != null)
            {
                survey.Sections = new SectionService().Statistic(id);
                survey.Charts = new ChartService().Read(survey);
                survey.Response = new SurveyResponeseDAO().Read(id);
            }
            return survey;
        }
        public SurveyCreateDTO ReadofCreate(int id)
        {
            SurveyCreateDTO surveyDTO;
            Survey survey = new SurveyDAO().Read(id);
            if (survey != null)
            {
                SurveyCategory surveyCategory = new SurveyCategoryDAO().Read(survey.SurveyCategoryID);
                SurveyCategoryDTO surveyCategoryDTO = new SurveyCategoryMapper().SurveyCategorytoSurveyCategoryDTO(surveyCategory);
                surveyDTO = surveyMapper.SurveytoSurveyCreateDTO(survey, new SectionService().ReadofCreate(id), surveyCategoryDTO);
                return surveyDTO;
            }
            else
                return null;

        }
        public bool Update(SurveyCreateDTO surveyCreate, int id)
        {
            int secorder = 0;
            surveyCreate.UpdatedBY = id;
            foreach (var item in surveyCreate.Sections)
            {
                if (!item.Value.Status.HasValue || item.Value.Status.Value)
                {
                    secorder++;
                    item.Value.Order = secorder;
                    item.Value.UpdatedBY = id;
                    item.Value.CreatedBy = id;
                }
                int qorder = 0;
                foreach (var question in item.Value.Questions)
                {
                    if (!question.Value.Status.HasValue || question.Value.Status.Value)
                    {
                        qorder++;
                        question.Value.Order = qorder;
                        question.Value.UpdatedBY = id;
                        question.Value.CreatedBy = id;
                    }
                    int corder = 0;
                    if (question.Value.ChoiceAnswers != null && question.Value.ChoiceAnswers.Count > 0)
                        foreach (var choice in question.Value.ChoiceAnswers)
                        {
                            if (!choice.Value.Status.HasValue || choice.Value.Status.Value != false)
                            {
                                if (choice.Value.IsOtherChoice) choice.Value.Order = question.Value.ChoiceAnswers.Count;
                                else
                                {
                                    corder++;
                                    choice.Value.Order = corder;
                                }
                            }
                            choice.Value.UpdatedBY = id;
                            choice.Value.CreatedBy = id;
                        }
                    if (question.Value.LinearAnswers != null && question.Value.LinearAnswers.Count > 0)
                    {
                        foreach (var linear in question.Value.LinearAnswers)
                        {
                            linear.UpdatedBY = id;
                            linear.CreatedBy = id;

                        }
                    }

                    if (question.Value.TextAnswer != null)
                    {
                        question.Value.TextAnswer.UpdatedBY = id;
                        question.Value.TextAnswer.CreatedBy = id;
                    }
                }
            }


            SectionService sectionService = new SectionService();
            int rs = surveyDAO.Update(surveyCreate);
            if (rs == 0) return false;
            else
            {
                if (!sectionService.Update(surveyCreate.Sections, surveyCreate.ID)) return false;
            }
            return true;
        }
        public List<AssignedRequireSurveyDTO> Read(string email)
        {
            var result = new AssignedStudentDAO().Read($"{email}@fpt.edu.vn".ToLower());
            if (result != null && result.Count > 0)
            {
                return result;
            }
            else
                return null;

        }
        public ExportDataDTO ExportResult(int id)
        {

            var survey = Read(id);
            List<QuestionDTO> questions = new List<QuestionDTO>();
            if (survey.Sections != null)
                foreach (var section in survey.Sections)
                {
                    if (section.Questions != null) questions.AddRange(section.Questions);
                }
            SurveyResponeseDAO surveyDAO = new SurveyResponeseDAO();
            var responses = surveyDAO.Read(id);
            var responseAnswers = surveyDAO.ReadtoExport(id);
            List<SurveyResultSumaryDTO> surveyResultSumaries = new List<SurveyResultSumaryDTO>();
            SurveyResultSumaryDTO surveyResultSumary = null;
            List<List<ResponsedAnswerDTO>> responseSurveyDTOss = new List<List<ResponsedAnswerDTO>>();
            List<ResponsedAnswerDTO> responseSurveyDTOs;
            foreach (var item in responses)
            {
                responseSurveyDTOs = new List<ResponsedAnswerDTO>();
                int i = 0;
                foreach (var responsed in responseAnswers)
                {

                    if (i == 0)
                    {
                        i = responsed.Id;
                        surveyResultSumary = new SurveyResultSumaryDTO
                        {
                            Id = i,
                            Email = item.Email,
                            ResponseTime=item.CreatedAt ?? DateTime.MinValue
                        };
                    }

                    if (item.ID == responsed.Id)
                    {
                        responseSurveyDTOs.Add(responsed);

                    }
                    if ((i!=0&&i != responsed.Id)||(responsed== responseAnswers.Last()))
                    {
                        List<string> strings = new List<string>();
                        string b = "";
                        responseAnswers.RemoveRange(0, responseSurveyDTOs.Count);

                        for (int j = 0; j < questions.Count();)
                        {
                            
                            var a = binarySearch(responseSurveyDTOs, 0, responseSurveyDTOs.Count - 1, questions[j].ID);
                            if (a == null)
                            {
                                j++;
                                strings.Add(b);
                                b = "";
                            }
                            else
                            {
                                responseSurveyDTOs.Remove(a);
                                if (questions[j].QuestionCategory.ID == 3) b += a.Text;
                                else if (questions[j].QuestionCategory.ID == 4) b += a.LinearID;
                                else
                                {
                                    if (a.IsOtherChoice) a.ChoiceLabel = a.OtherText;
                                    if (questions[j].QuestionCategory.ID == 2)
                                    {
                                        b += a.ChoiceLabel + ", " ;
                                    }
                                    else
                                    {
                                        b += a.ChoiceLabel;
                                    }
                                }
                            }
                        }
                        if (surveyResultSumary != null)
                        {
                            surveyResultSumary.Answer = strings;
                            surveyResultSumaries.Add(surveyResultSumary);
                        }
                        break;


                    }

                }
            }
            ExportDataDTO exportDataDTO = new ExportDataDTO
            {
                Question = new List<string>()
            };
            foreach (var item in questions)
            {
                exportDataDTO.Question.Add(item.QuestionLabel);
            }
            exportDataDTO.Answers = surveyResultSumaries;
            return exportDataDTO;
        }
        private ResponsedAnswerDTO binarySearch(List<ResponsedAnswerDTO> arr, int l, int r, int x)
        {
            if (r >= l)
            {
                int mid = l + (r - l) / 2;

                // If the element is present at the
                // middle itself
                if (arr[mid].QuestionID == x)
                    return arr[mid];

                // If element is smaller than mid, then
                // it can only be present in left subarray
                if (arr[mid].QuestionID > x)
                    return binarySearch(arr, l, mid - 1, x);

                // Else the element can only be present
                // in right subarray
                return binarySearch(arr, mid + 1, r, x);
            }

            // We reach here when element is not present
            // in array
            return null;
        }
        public object BinarySearchDisplay(int[] arr, int key)
        {
            int minNum = 0;
            int maxNum = arr.Length - 1;

            while (minNum <= maxNum)
            {
                int mid = (minNum + maxNum) / 2;
                if (key == arr[mid])
                {
                    return ++mid;
                }
                else if (key < arr[mid])
                {
                    maxNum = mid - 1;
                }
                else
                {
                    maxNum = mid + 1;
                }
            }
            return "None";
        }

    }
}