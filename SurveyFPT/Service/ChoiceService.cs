using SurveyFPT.DAL;
using SurveyFPT.DTO;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.Responsed;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Mapper;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Service
{
    public class ChoiceService
    {
        private readonly ChoiceAnswerMapper mapper;
        private readonly ChoiceAnswerDAO answerDAO;
        public ChoiceService()
        {
            mapper = new ChoiceAnswerMapper();
            answerDAO = new ChoiceAnswerDAO();
        }
        public List<ChoiceAnswerDTO> Read(int id)
        {
            var choices = answerDAO.Read(id);
            List<ChoiceAnswerDTO> answerList = new List<ChoiceAnswerDTO>();
            ChoiceAnswerDTO answer;

            foreach (var item in choices)
            {
                answer = mapper.ChoiceAnswertoChoiceAnserDTO(item);
                answerList.Add(answer);
            }
            return answerList;
        }
        public bool Create(Dictionary<string, ChoiceCreateDTO> choices, int questionId)
        {
            ChoiceAnswerDAO answerDAO = new ChoiceAnswerDAO();
            if (choices != null && choices.Count > 0)
                foreach (var item in choices)
                {
                    if (item.Value == null) return false;
                    if (item.Value.IsOtherChoice) item.Value.Label = "Other:";
                    if (answerDAO.Create(item.Value, questionId) == 0) return false;
                }
            return true;
        }
        public bool Update(Dictionary<string, ChoiceCreateDTO> choices, int questionId)
        {
            ChoiceAnswerDAO answerDAO = new ChoiceAnswerDAO();
            if (choices != null && choices.Count > 0)
                foreach (var item in choices)
                {
                    if (item.Value == null) return false;
                    if (item.Value.Status.HasValue && !item.Value.Status.Value)
                    {
                        answerDAO.Delete(item.Value.ID);
                    }
                    else
                    {
                        if (item.Value.IsOtherChoice) item.Value.Label = "Other:";
                        if (item.Value.ID == 0) answerDAO.Create(item.Value, questionId);
                        else answerDAO.Update(item.Value);
                    }
                }
            return true;
        }
        public bool Delete(int id)
        {
            if (answerDAO.Delete(id) <= 0) return false;
            return true;
        }
        public List<ChoiceStatisticDTO> Statistic(int id)
        {

            var result = answerDAO.Statistic(id);
            if (result!=null&&result.Count > 0)
            {
                foreach (var item in result)
                {
                    if (item.IsOtherChoice)
                    {
                        item.OtherChoiceStatistics = new TextAnswerService().Statistic(item.ID, true);
                    }
                }
            }else 
                return null;

            return result;
        }
        public List<ResponsedChoiceAnwerDTO> Read(List<ChoiceAnswerDTO> list, List<ResponseChoiceAnswerDTO> choiceAnswers, int questionCategory)
        {
            List<ResponsedChoiceAnwerDTO> responseChoiceAnswerDTOs = new List<ResponsedChoiceAnwerDTO>();
            if (list != null && list.Count > 0)
            {

                AnswerService answerService = new AnswerService();
                ResponsedChoiceAnwerDTO responsedChoiceAnwerDTO;
                int oldChoiceID = 0;
                int responesedID = 0;
                foreach (var item in list)
                {
                    var responsedChoice = answerService.GetChoiceAnswer(choiceAnswers, item.ID);

                    if (responsedChoice != null)
                    {
                        responsedChoiceAnwerDTO = new ResponsedChoiceAnwerDTO
                        {
                            ID = item.ID,
                            Label = item.Label,
                            Ischecked = true,
                            IsOtherChoice = item.IsOtherChoice,
                            ResponsedIsOtherChoice = new ResponsedIsOtherChoiceDTO
                            {
                                ID = responsedChoice.IsOtherChoiceText.ID,
                                Response = responsedChoice.IsOtherChoiceText.Text
                            },
                            ResponsedID = responsedChoice.ID,
                        };
                        oldChoiceID = responsedChoice.Choice.ID;
                        responesedID = responsedChoice.ID;
                    }
                    else
                        responsedChoiceAnwerDTO = new ResponsedChoiceAnwerDTO
                        {
                            ID = item.ID,
                            Label = item.Label,
                            Ischecked = false,
                            IsOtherChoice = item.IsOtherChoice,
                            ResponsedIsOtherChoice = new ResponsedIsOtherChoiceDTO()

                        };
                    responseChoiceAnswerDTOs.Add(responsedChoiceAnwerDTO);

                }
                if (questionCategory == 1 && responesedID != 0)
                    foreach (var responsed in responseChoiceAnswerDTOs)
                    {
                        responsed.ResponsedID = responesedID;
                        responsed.OldResponsedID = oldChoiceID;
                    }

            }
            return responseChoiceAnswerDTOs;
        }
        public bool Update(List<ResponsedSingleChoiceUpdateDTO> list, int id)
        {
            ResponsedIsOtherChoiceAnswerDAO responsedIsOtherChoiceAnswer = new ResponsedIsOtherChoiceAnswerDAO();
            ResponsedChoiceAnswerDAO responsedChoiceAnswerDAO = new ResponsedChoiceAnswerDAO();
            if(list != null && list.Count > 0) {
                foreach (var item in list)
                {
                    if (item.ID != 0)
                    {

                        if (item.ChoiceID == 0)
                        {
                            if (item.ResponsedIsOtherChoiceID.HasValue && item.ResponsedIsOtherChoiceID != 0) responsedIsOtherChoiceAnswer.Delete(item.ResponsedIsOtherChoiceID.Value);
                            responsedChoiceAnswerDAO.Delete(item.ID);
                        }
                        else if (item.ChoiceID != item.OldChoiceID)
                        {
                            responsedChoiceAnswerDAO.Update(item.ChoiceID, item.ID);
                            if (item.ResponsedIsOtherChoiceResponse != null)
                            {
                                if (item.ResponsedIsOtherChoiceID != 0)
                                {
                                    if (item.ResponsedIsOtherChoiceID.HasValue && item.ResponsedIsOtherChoiceID.Value != 0)
                                        responsedIsOtherChoiceAnswer.Delete(item.ResponsedIsOtherChoiceID.Value);
                                }
                                else if (item.ResponsedIsOtherChoiceID == 0)
                                    responsedIsOtherChoiceAnswer.Create(item.ID, item.ResponsedIsOtherChoiceResponse);
                            }
                            else
                            {
                                if (item.ResponsedIsOtherChoiceID.HasValue && item.ResponsedIsOtherChoiceID.Value != 0)
                                    responsedIsOtherChoiceAnswer.Delete(item.ResponsedIsOtherChoiceID.Value);
                            }
                            
                        }
                        else
                        {
                            if (item.ResponsedIsOtherChoiceResponse != null)
                            {
                                if (item.ResponsedIsOtherChoiceID != 0 && item.ResponsedIsOtherChoiceResponse.Equals(item.OldIsOtherChoiceResponse))
                                {
                                    if (!item.ResponsedIsOtherChoiceResponse.Trim().Equals(item.OldIsOtherChoiceResponse))
                                        responsedIsOtherChoiceAnswer.Update(item.ResponsedIsOtherChoiceResponse, item.ResponsedIsOtherChoiceID.Value);
                                }
                             else if (item.ResponsedIsOtherChoiceID == 0)
                                    responsedIsOtherChoiceAnswer.Create(item.ID, item.ResponsedIsOtherChoiceResponse);
                            }
                        }
                    }
                    else
                    {
                        if (item.ChoiceID != 0)
                        {
                            int resId = responsedChoiceAnswerDAO.Create(item.ChoiceID, id);
                            if (item.ResponsedIsOtherChoiceResponse != null) responsedIsOtherChoiceAnswer.Create(resId, item.ResponsedIsOtherChoiceResponse);
                        }
                       
                        else continue;
                    }
                }
            }
            return true;

        }
        public bool Update(List<ResponsedMultipleChoiceUpdateDTO> list, int responseId)
        {
            ResponsedIsOtherChoiceAnswerDAO responsedIsOtherChoiceAnswer = new ResponsedIsOtherChoiceAnswerDAO();
            ResponsedChoiceAnswerDAO responsedChoiceAnswerDAO = new ResponsedChoiceAnswerDAO();
            if(list != null && list.Count > 0)
            {
                foreach (var item in list)
                {
                    if (item.IsChecked)
                    {
                        if (item.ID != 0)
                        {
                            if (item.IsOtherChoice && !string.IsNullOrEmpty(item.ResponsedIsOtherChoiceResponse))
                            {
                                if (item.ResponsedIsOtherChoiceID != 0
                                        && !item.ResponsedIsOtherChoiceResponse.Trim().Equals(item.OldIsOtherChoiceResponse))
                                    responsedIsOtherChoiceAnswer.Update(item.ResponsedIsOtherChoiceResponse.Trim(), item.ResponsedIsOtherChoiceID.Value);
                                else if (item.ResponsedIsOtherChoiceID == 0)
                                    responsedIsOtherChoiceAnswer.Create(item.ID, item.ResponsedIsOtherChoiceResponse);
                            }
                        }
                        else
                        {
                            int id = responsedChoiceAnswerDAO.Create(item.ChoiceID, responseId);
                            if (item.IsOtherChoice) responsedIsOtherChoiceAnswer.Create(id, item.ResponsedIsOtherChoiceResponse);
                        }
                    }
                    else
                    {
                        if (item.ID != 0)
                        {
                            if (item.IsOtherChoice) responsedIsOtherChoiceAnswer.Delete(item.ResponsedIsOtherChoiceID.Value);
                            responsedChoiceAnswerDAO.Delete(item.ID);
                        }
                    }
                }
            }
            return true;

        }
        public List<ChoiceCreateDTO> ReadofCreate(int id)
        {
            var choices = answerDAO.Read(id);
            List<ChoiceCreateDTO> answerList = new List<ChoiceCreateDTO>();
            ChoiceCreateDTO answer;

            foreach (var item in choices)
            {
                answer = mapper.ChoiceAnswertoChoiceCreateDTO(item);
                answerList.Add(answer);
            }
            return answerList;
        }
    }
}