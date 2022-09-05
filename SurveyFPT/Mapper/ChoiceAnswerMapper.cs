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
    public class ChoiceAnswerMapper
    {
        public ChoiceAnswer SQLDataReadertoChoiceAnswer(SqlDataReader sdr)
        {
            ChoiceAnswer ChoiceAnswer;
            try
            {
                ChoiceAnswer = new ChoiceAnswer
                {
                    ID = Convert.ToInt32(sdr["id"]),
                    CreatedBy = Convert.ToInt32(sdr["created_by"]),
                    CreatedAt = Convert.ToDateTime(sdr["created_at"]),
                    UpdatedAt = sdr["updated_at"] == null ? Convert.ToDateTime(sdr["updated_at"]) : DateTime.Now,
                    UpdatedBY = sdr["updated_by"] == null ? Convert.ToInt32(sdr["updated_by"]) : 0,
                    Order = Convert.ToInt32(sdr["order"]),
                    Status = Convert.ToBoolean(sdr["status"]),
                    IsOtherChoice= Convert.ToBoolean(sdr["is_other_choice"]),
                    Label=Convert.ToString(sdr["choice_label"]),
                    QuestionID=Convert.ToInt32(sdr["question_id"])
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            return ChoiceAnswer;
        }
        public ChoiceAnswerDTO ChoiceAnswertoChoiceAnserDTO(ChoiceAnswer choice)
        {
            return new ChoiceAnswerDTO
            {
                ID = choice.ID,
                Label = choice.Label,
                IsOtherChoice = choice.IsOtherChoice
            };
        }
        public ChoiceCreateDTO ChoiceAnswertoChoiceCreateDTO(ChoiceAnswer choice)
        {
            return new ChoiceCreateDTO
            {
                ID = choice.ID,
                Label = choice.Label,
                IsOtherChoice = choice.IsOtherChoice
            };
        }
        public ChoiceStatisticDTO SQLDataReadertoChoiceStatistic(SqlDataReader sdr, int index)
        {
            ChoiceStatisticDTO ChoiceAnswer;
            try
            {
                ChoiceAnswer = new ChoiceStatisticDTO
                {
                    Index = index,
                    ID = Convert.ToInt32(sdr["id"]),
                    Label = Convert.ToString(sdr["choice_label"]),
                    Count = Convert.ToInt32(sdr["count"]),
                    IsOtherChoice= Convert.ToBoolean(sdr["is_other_choice"]),
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            return ChoiceAnswer;
        }
    }
}