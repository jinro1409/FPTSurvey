using SurveyFPT.DTO;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.Mapper
{
    public class TextAnswerMapper
    {
        public TextAnswer SQLDataReadertoTextAnswer(SqlDataReader sdr)
        {
            TextAnswer textAnswer = null;
            try
            {
                textAnswer = new TextAnswer
                {
                    ID = Convert.ToInt32(sdr["id"]),
                    CreatedBy = Convert.ToInt32(sdr["created_by"]),
                    CreatedAt = Convert.ToDateTime(sdr["created_at"]),
                    UpdatedAt = sdr["updated_at"] == null ? Convert.ToDateTime(sdr["updated_at"]) : DateTime.Now,
                    UpdatedBY = sdr["updated_by"] == null ? Convert.ToInt32(sdr["updated_by"]) : 0,
                    Status = Convert.ToBoolean(sdr["status"]),
                    Label = Convert.ToString(sdr["label"]),
                    QuestionID = Convert.ToInt32(sdr["question_id"])
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
            return textAnswer;
        }
        public TextAnswerDTO TextAnswertoTextAnswerDTO(TextAnswer textAnswer)
        {
            return new TextAnswerDTO
            {
                ID = textAnswer.ID,
                Label = textAnswer.Label
            };
        }
        public TextAnswerCreateDTO TextAnswertoTextAnswerCreateDTO(TextAnswer textAnswer)
        {
            return new TextAnswerCreateDTO
            {
                ID = textAnswer.ID,
                Label = textAnswer.Label
            };
        }
        public TextStatisticDTO SQLDataReadertoTextSatistcDTO(SqlDataReader sdr,int index)
        {
            
            return new TextStatisticDTO
            {
                Index=index,
                Response = Convert.ToString(sdr["text"]),
                ResponseCount= Convert.ToInt32(sdr["count"])
            };
        }
    }
}