using SurveyFPT.DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.Mapper
{
    public class TextResponseMapper
    {
        public ResponseTextAnswerDTO fromSDR(SqlDataReader sdr)
        {
            int.TryParse(sdr["id"].ToString(), out int id);
            int.TryParse(sdr["text_answer_id"].ToString(),  out int textAnswerid);
            string textAnswer = sdr["text"].ToString();
            return new ResponseTextAnswerDTO
            {
                ID = id,
                TextAnswerDTO = new TextAnswerDTO { ID = textAnswerid },
                Response = textAnswer
            };
        }
    }
}