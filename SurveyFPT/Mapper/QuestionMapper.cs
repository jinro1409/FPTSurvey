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
    public class QuestionMapper
    {
        public Question SQLDataReadertoQuestion(SqlDataReader sdr)
        {
            Question question = null;
            try
            {
                question = new Question
                {
                    ID = Convert.ToInt32(sdr["id"]),
                    Description = Convert.ToString(sdr["description"]),
                    CreatedBy = Convert.ToInt32(sdr["created_by"]),
                    CreatedAt = Convert.ToDateTime(sdr["created_at"]),
                    UpdatedAt = sdr["updated_at"] == null ? Convert.ToDateTime(sdr["updated_at"]) : DateTime.Now,
                    UpdatedBY = sdr["updated_by"] == null ? Convert.ToInt32(sdr["updated_at"]) : 0,
                    Order = Convert.ToInt32(sdr["order"]),
                    SectionID = Convert.ToInt32(sdr["section_id"]),
                    PointScale = Convert.ToInt32(sdr["point_scale"]),
                    IsRequire = Convert.ToBoolean(sdr["require"]),
                    QuestionCategoryID = Convert.ToInt32(sdr["question_category_id"]),
                    Status = Convert.ToBoolean(sdr["status"]),
                    QuestionLabel = Convert.ToString(sdr["question"]),
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
            return question;
        }
        public QuestionDTO QuestiontoQuestionDTO(Question question, QuestionCategoryDTO categoryDTO,
             List<ChoiceAnswerDTO> choiceAnswers, List<LinearAnswerDTO> linearAnswers, TextAnswerDTO TextAnswer)
        {
            return new QuestionDTO
            {
                ID = question.ID,
                IsRequire = question.IsRequire,
                PointScale = question.PointScale,
                Description = question.Description,
                QuestionLabel = question.QuestionLabel,
                QuestionCategory = categoryDTO,
                ChoiceAnswers = choiceAnswers,
                LinearAnswers = linearAnswers,
                TextAnswer = TextAnswer
            };
        }
        public QuestionCreateDTO QuestiontoQuestionCreateDTO(Question question, QuestionCategoryDTO categoryDTO,
             List<ChoiceCreateDTO> choiceAnswers, List<LinearScaleCreateDTO> linearAnswers, TextAnswerCreateDTO TextAnswer)
        {
            var q = new QuestionCreateDTO
            {
                ID = question.ID,
                IsRequire = question.IsRequire,
                PointScale = question.PointScale,
                Description = question.Description,
                QuestionLabel = question.QuestionLabel,
                ChoiceAnswers = new Dictionary<string, ChoiceCreateDTO>(),
                QuestionCategory = categoryDTO,
                LinearAnswers = linearAnswers,
                TextAnswer = TextAnswer
            };
            if (choiceAnswers != null)
            {
                for (int i = 0; i < choiceAnswers.Count; i++)
                {
                    q.ChoiceAnswers.Add(i.ToString(), choiceAnswers[i]);
                }
            }

            return q;
        }
        public QuestionStatisticDTO QuestiontoQuestionStatisticDTO(Question question,
        List<ChoiceStatisticDTO> choiceAnswers, List<LinearScaleStatisticDTO> linearAnswers, List<TextStatisticDTO> textAnswer)
        {
            int i = 0;
            if (textAnswer != null && textAnswer.Count() > 0) {
                foreach (var item in textAnswer)
                {
                    i += item.ResponseCount;
                }
            }
            Tuple<int, List<TextStatisticDTO>> textStatistic = Tuple.Create(i,textAnswer); 
            return new QuestionStatisticDTO
            {
                ID=question.ID,
              Questions=question.QuestionLabel,
              QuestionCatagory=question.QuestionCategoryID,
              ChoiceStatistics = choiceAnswers,
              LinearScaleStatistics = linearAnswers,
              TextStatistics=textStatistic
            };
        }
    }
}