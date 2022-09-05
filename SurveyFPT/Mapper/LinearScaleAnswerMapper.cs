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
    public class LinearScaleAnswerMapper
    {
        public LinearScaleAnswer SQLDataReadertoLinearScaleAnswer(SqlDataReader sdr)
        {
            LinearScaleAnswer linearScaleAnswer = null;
            try
            {
                linearScaleAnswer = new LinearScaleAnswer
                {

                    ID = Convert.ToInt32(sdr["id"]),
                    CreatedBy = Convert.ToInt32(sdr["created_by"]),
                    CreatedAt = Convert.ToDateTime(sdr["created_at"]),
                    UpdatedAt = sdr["updated_at"] == null ? Convert.ToDateTime(sdr["updated_at"]) : DateTime.Now,
                    UpdatedBY = sdr["updated_by"] == null ? Convert.ToInt32(sdr["updated_by"]) : 0,
                    Status = Convert.ToBoolean(sdr["status"]),
                    ScaleLabel = Convert.ToString(sdr["scale_label"]),
                    ScaleNumber = Convert.ToInt32(sdr["scale_number"]),
                    QuestionID = Convert.ToInt32(sdr["question_id"])
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            return linearScaleAnswer;
        }
        public LinearAnswerDTO LinearAnswertoLinearChoiceDTO( LinearScaleAnswer linearScaleAnswer)
        {
            return new LinearAnswerDTO
            {
                ID = linearScaleAnswer.ID,
                ScaleLabel = linearScaleAnswer.ScaleLabel,
                ScaleNumber = linearScaleAnswer.ScaleNumber
            };

        }
        public ResponseLinearScaleAnswerDTO FromSDR(SqlDataReader sdr)
        {

            int.TryParse(sdr["id"].ToString(), out int id);
            int.TryParse(sdr["linear_scale_id"].ToString(), out int responeseId);
            return new ResponseLinearScaleAnswerDTO
            {
                ID = id,
                LinearAnswer = new LinearAnswerDTO { ID = responeseId },
            };
        }
        public LinearScaleCreateDTO LinearAnswertoLinearCreateDTO(LinearScaleAnswer linearScaleAnswer)
        {
            return new LinearScaleCreateDTO
            {
                ID = linearScaleAnswer.ID,
                ScaleLabel = linearScaleAnswer.ScaleLabel,
                ScaleNumber = linearScaleAnswer.ScaleNumber
            };

        }
        public LinearScaleStatisticDTO SQLDataReadertoLinearScaleStatisticDTO(SqlDataReader sdr,int index)
        {
            LinearScaleStatisticDTO linearScaleAnswer;
            try
            {
                linearScaleAnswer = new LinearScaleStatisticDTO
                {
                    Index = index,
                    ID = Convert.ToInt32(sdr["id"]),
                    ScaleLabel = Convert.ToString(sdr["scale_label"]),
                    ScaleNumber = Convert.ToInt32(sdr["scale_number"]),
                    Count = Convert.ToInt32(sdr["count"]),
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            return linearScaleAnswer;
        }
    }
}