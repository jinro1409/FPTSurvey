using SurveyFPT.DTO;
using SurveyFPT.DTO.Responsed;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Service
{
    public class AnswerService
    {
        public ResponsedTextDTO GetTextAnswer(List<ResponseTextAnswerDTO> list , int id)
        {
            foreach (var item in list)
            {
                if (id == item.TextAnswerDTO.ID) return new ResponsedTextDTO { ID = item.ID, Text = item.Response };
            }
            return null;    
        }
        public ResponseLinearScaleAnswerDTO GetLineartAnswer(List<ResponseLinearScaleAnswerDTO> list, int id)
        {
            foreach (var item in list)
            {
                if (id == item.LinearAnswer.ID) return new ResponseLinearScaleAnswerDTO {
                ID = item.ID,
                LinearAnswer = item.LinearAnswer,
                };
            }
            return null;
        }
        public ResponseChoiceAnswerDTO GetChoiceAnswer(List<ResponseChoiceAnswerDTO> list, int id)
        {
             if(list.Count == 0) return null;
            foreach (var item in list)
            {
                if(item.Choice.ID==id)
                {
                   return item;
                }
            }
            return null;
        }
    }
}