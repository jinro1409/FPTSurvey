using SurveyFPT.DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.Mapper
{
    public class ReponseChoiceMapper
    {
        public ResponseChoiceAnswerDTO fromSDR(SqlDataReader sdr)
        {
           
            int.TryParse(sdr["id"].ToString(), out int id);
            int.TryParse(sdr["choice_id"].ToString(), out int choiceId);
            int.TryParse(sdr["other_id"].ToString(), out int otherChoiceid);
            string text= sdr["text"].ToString();
            ResponseChoiceAnswerDTO responseChoiceAnswerDTO = new ResponseChoiceAnswerDTO()
            {
                ID = id,
                IsOtherChoiceText = new ResponseIsOtherChoiceDTO { ID = otherChoiceid, Text = text },
                Choice = new ChoiceAnswerDTO { ID=choiceId },
            };
            return responseChoiceAnswerDTO;


        }
    }
}