using SurveyFPT.DAL;
using SurveyFPT.DTO;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.Responsed;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Mapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Service
{
    public class TextAnswerService
    {
        private readonly TextAnswerDAO answerDAO;
        private readonly TextAnswerMapper mapper;
        public TextAnswerService()
        {
            answerDAO = new TextAnswerDAO();
            mapper = new TextAnswerMapper();
        }
        public bool Create(TextAnswerCreateDTO text, int questionId)
        {

            if (answerDAO.Create(text, questionId) == 0) return false;
            return true;
        }
        public bool Update(TextAnswerCreateDTO text)
        {
            if (answerDAO.Update(text) <= 0) return false;
            return true;
        }
        public bool Delete(int textid)
        {
            if (answerDAO.Delete(textid) <= 0) return false;
            return true;
        }
        public List<TextStatisticDTO> Statistic(int id, bool isOtherChoice)
        {

            var result = answerDAO.Statistic(id, isOtherChoice);
            if (result.Count > 0)
                return result;
            return null;
        }
        public TextAnswerDTO Read(int id)
        {
            var textAnswer = answerDAO.Read(id);
            var textAnswerDTO = textAnswer == null ? null : mapper.TextAnswertoTextAnswerDTO(textAnswer);
            return textAnswerDTO;
        }
        public ResponsedTextAnswerDTO Read(TextAnswerDTO textAnswerDTO, List<ResponseTextAnswerDTO> textAnswers)
        {
            ResponsedTextAnswerDTO responsedTextAnswerDTO;
            if (textAnswerDTO != null)
            {
                AnswerService answerService = new AnswerService();
                var responsedText = answerService.GetTextAnswer(textAnswers, textAnswerDTO.ID);
                responsedTextAnswerDTO = new ResponsedTextAnswerDTO
                {
                    ResponsedText = responsedText ?? new ResponsedTextDTO(),
                    Label = textAnswerDTO.Label,
                    ID = textAnswerDTO.ID,
                    ResponsedID = responsedText == null ? 0 : responsedText.ID
                };
            }
            else responsedTextAnswerDTO = null;
            return responsedTextAnswerDTO;
        }
        public bool Update(List<ResponsedTextUpdateDTO> list, int responseId)
        {
            ResponesedTextAnswerDAO responesedTextAnswerDAO = new ResponesedTextAnswerDAO();
            if (list != null && list.Count > 0)
            {
                foreach (var item in list)
                {
                    if (item.ID != 0)
                    {
                        if (string.IsNullOrEmpty(item.Response) || item.Response.Trim() == "")
                            responesedTextAnswerDAO.Delete(item.ID);
                        else if (item.ResponsedText.Trim() != item.Response.Trim())
                            responesedTextAnswerDAO.Update(item.Response.Trim(), item.ID);

                    }
                    else
                        if (!string.IsNullOrEmpty(item.Response))
                        responesedTextAnswerDAO.Create(item.Response, responseId, item.ResponsedTextID);

                }
            }
            return true;
        }
        public TextAnswerCreateDTO ReadofCreate(int id)
        {
            var textAnswer = answerDAO.Read(id);
            var textAnswerDTO = textAnswer == null ? null : mapper.TextAnswertoTextAnswerCreateDTO(textAnswer);
            return textAnswerDTO;
        }
    }
}