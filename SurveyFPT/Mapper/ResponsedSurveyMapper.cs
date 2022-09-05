using SurveyFPT.DTO;
using SurveyFPT.DTO.Responsed;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.Mapper
{
    public class ResponsedSurveyMapper
    {
        public ResponseSurveyDTO SQLDataReadertoResponseSurvey(SqlDataReader sdr)
        {
            ResponseSurveyDTO survey;
            try
            {
                survey = new ResponseSurveyDTO
                {
                    ID = Convert.ToInt32(sdr["id"]),
                    Email = Convert.ToString(sdr["email"]),
                    CreatedAt = Convert.ToDateTime(sdr["created_at"]),
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            return survey;
        }

        public List<ResponsedAnswerDTO> SQLDataReadertoResponsedAnsewer(SqlDataReader sdr)
        {
            List<ResponsedAnswerDTO> responsedAnswerDTOs = new List<ResponsedAnswerDTO>();
            if (sdr.HasRows)
            {
                ResponsedAnswerDTO answer;
                string otherText;
                string text;
                string choicelabel;

                try
                {
                    while (sdr.Read())
                    {
                        int.TryParse(sdr["id"].ToString(), out int id);
                        int.TryParse(sdr["question_id"].ToString(), out int questionId);
                        int.TryParse(sdr["linear"].ToString(), out int linearid);
                        bool.TryParse(sdr["is_other_choice"].ToString(), out bool isother);
                        text = sdr["text"].ToString();
                        otherText = sdr["other_text"].ToString();
                        choicelabel = sdr["choice_label"].ToString();
                        answer = new ResponsedAnswerDTO
                        {
                           Id=id,
                           Text=text,
                           QuestionID=questionId,
                           OtherText=otherText,
                           LinearID=linearid,
                           ChoiceLabel=choicelabel,
                           IsOtherChoice=isother
                        };
                        responsedAnswerDTOs.Add(answer);
                    }

                   
                    
                }
                catch (Exception)
                {
                    throw;
                }
            }

            return responsedAnswerDTOs;
        }
    }
}