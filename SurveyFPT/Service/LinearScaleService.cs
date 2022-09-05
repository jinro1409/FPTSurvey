using SurveyFPT.DAL;
using SurveyFPT.DTO;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.Responsed;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Mapper;
using SurveyFPT.Models;
using System.Collections.Generic;

namespace SurveyFPT.Service
{
    public class LinearScaleService
    {
        private readonly LinearScaleAnswerDAO answerDAO;
        private readonly LinearScaleAnswerMapper mapper;
        public LinearScaleService()
        {
            answerDAO = new LinearScaleAnswerDAO();
            mapper = new LinearScaleAnswerMapper();
        }
        public List<LinearAnswerDTO> Read(int id)
        {
            var linearScaleAnswers = answerDAO.Read(id);
            if (linearScaleAnswers.Count == 0) return null;
            List<LinearAnswerDTO> answerList = new List<LinearAnswerDTO>();
            LinearAnswerDTO answer;
            foreach (var item in linearScaleAnswers)
            {
                answer = mapper.LinearAnswertoLinearChoiceDTO(item);
                answerList.Add(answer);
            }
            return answerList;
        }
        public bool Create(List<LinearScaleCreateDTO> choices, int questionId)
        {
            foreach (var item in choices)
            {
                if (item == null) return false;
                if (answerDAO.Create(item, questionId) == 0) return false;
            }
            return true;
        }
        public bool Update(List<LinearScaleCreateDTO> choices, int questionID)
        {
            foreach (var item in choices)
            {
                if (item.Status.HasValue && !item.Status.Value) Delete(item.ID);
                else
                {
                    if (item == null) return false;
                    if (item.ID != 0) { if (answerDAO.Update(item) <= 0) return false; }
                    else { if (answerDAO.Create(item, questionID) <= 0) return false; }
                }

            }
            return true;
        }
        public bool Delete(int id)
        {

            if (answerDAO.Delete(id) <= 0) return false;
            return true;
        }
        public List<LinearScaleStatisticDTO> Statistic(int id)
        {
            var result = answerDAO.Statistic(id);
            return result;
        }
        public List<ResponsedLinearScaleAnswerDTO> Read(List<LinearAnswerDTO> linears, List<ResponseLinearScaleAnswerDTO> linearScaleAnswers)
        {
            List<ResponsedLinearScaleAnswerDTO> responsedLinearScaleAnswerDTOs = new List<ResponsedLinearScaleAnswerDTO>();
            AnswerService answerService = new AnswerService();
            ResponsedLinearScaleAnswerDTO responsedLinearScaleAnswerDTO;
            int oldChoiceID = 0;
            int responesedID = 0;
            if (linears != null && linears.Count > 0)
            {
                foreach (var item in linears)
                {
                    var responsed = answerService.GetLineartAnswer(linearScaleAnswers, item.ID);
                    responesedID = responsed == null ? responesedID : responsed.ID;
                    oldChoiceID = responsed == null ? oldChoiceID : responsed.LinearAnswer.ID;
                    responsedLinearScaleAnswerDTO = new ResponsedLinearScaleAnswerDTO
                    {
                        ID = item.ID,
                        ScaleLabel = item.ScaleLabel,
                        ScaleNumber = item.ScaleNumber,
                        IsChecked = responsed != null
                    };
                    responsedLinearScaleAnswerDTOs.Add(responsedLinearScaleAnswerDTO);
                }
                if (responesedID != 0)
                {
                    foreach (var item in responsedLinearScaleAnswerDTOs)
                    {
                        item.ResponsedID = responesedID;
                        item.OldSacle = oldChoiceID;
                    }
                }
            }

            return responsedLinearScaleAnswerDTOs;
        }
        public bool Update(List<ResponsedLinearScaleUpdateDTO> list, int responseId)
        {
            ResponsedLinearScaleDAO responsedLinearScaleDAO = new ResponsedLinearScaleDAO();
            if(list != null && list.Count > 0)
            {
                foreach (var item in list)
                {
                    if (item.ID != 0)
                    {
                        if (item.LinearID == 0)
                            responsedLinearScaleDAO.Delete(item.ID);
                        else if (item.OldLinearID != item.LinearID)
                            responsedLinearScaleDAO.Update(item.LinearID, item.ID);
                        
                    }
                    else
                    {
                        if (item.LinearID != 0)
                            responsedLinearScaleDAO.Create(responseId, item.LinearID);

                    }

                }
            }
            return true;
        }
        public List<LinearScaleCreateDTO> ReadofCreate(int id)
        {
            var linearScaleAnswers = answerDAO.Read(id);
            if (linearScaleAnswers.Count == 0) return null;
            List<LinearScaleCreateDTO> answerList = new List<LinearScaleCreateDTO>();
            LinearScaleCreateDTO answer;
            foreach (var item in linearScaleAnswers)
            {
                answer = mapper.LinearAnswertoLinearCreateDTO(item);
                answerList.Add(answer);
            }
            return answerList;
        }
    }
}