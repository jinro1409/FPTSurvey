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
    public class SurveyMapper
    {
        public Survey SQLDataReadertoSurvey(SqlDataReader sdr)
        {
            Survey survey;
            try
            {
                survey= new Survey
                {
                    ID = Convert.ToInt32(sdr["id"]),
                    Name = Convert.ToString(sdr["name"]),
                    Code = Convert.ToString(sdr["code"]),
                    Description = Convert.ToString(sdr["description"]),
                    OpenTime = Convert.ToDateTime(sdr["open_time"]),
                    CloseTime = Convert.ToDateTime(sdr["close_time"]),
                    SurveyCategoryID = Convert.ToInt32(sdr["survey_category_id"]),
                    CreatedBy = Convert.ToInt32(sdr["created_by"]),
                    CreatedAt = Convert.ToDateTime(sdr["created_at"]),
                    IsRequire = Convert.ToBoolean(sdr["is_require"]),
                    IsScoreTaken = Convert.ToBoolean(sdr["is_score_taken"]),
                    IsAllowChanging = Convert.ToBoolean(sdr["is_changing_allow"]),
                    IsPublic = Convert.ToBoolean(sdr["is_public"]),
                    BackgroundImage = Convert.ToString(sdr["background_image"]),
                    BackgroundColor = Convert.ToString(sdr["background_color"]),
                    UpdatedAt = sdr["updated_at"]==null?Convert.ToDateTime(sdr["updated_at"]) :DateTime.Now,
                    UpdatedBY = sdr["updated_by"]==null? Convert.ToInt32(sdr["updated_at"]):0,
                    Status=Convert.ToBoolean(sdr["status"]),
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            return survey;
        }
        public SurveyDTO SurveytoSurveyDTO(Survey survey,List<SectionDTO> sections,SurveyCategoryDTO surveyCategory)
        {
            return new SurveyDTO
            {
                ID = survey.ID,
                Name = survey.Name,
                Description = survey.Description,
                Code = survey.Code,
                OpenTime = survey.OpenTime,
                CloseTime = survey.CloseTime,
                BackgroundImage = survey.BackgroundImage,
                BackgroundColor = survey.BackgroundColor,
                IsAllowChanging = survey.IsAllowChanging,
                IsScoreTaken = survey.IsScoreTaken,
                IsPublish = survey.IsPublic,
                IsRequire = survey.IsRequire,
                SurveyCategory = surveyCategory,
                Sections = sections
            };
        }
        public SurveyCreateDTO SurveytoSurveyCreateDTO(Survey survey, List<SectionCreateDTO> sections, SurveyCategoryDTO surveyCategory)
        {
            var s = new SurveyCreateDTO
            {
                ID = survey.ID,
                Name = survey.Name,
                Description = survey.Description,
                Code = survey.Code,
                OpenTime = survey.OpenTime,
                CloseTime = survey.CloseTime,
                BackgroundImage = survey.BackgroundImage,
                BackgroundColor = survey.BackgroundColor,
                IsRequire = survey.IsRequire,
                IsPublish = survey.IsPublic,
                IsAllowChanging = survey.IsAllowChanging,
                IsScoreTaken = survey.IsScoreTaken,
                SurveyCategory = surveyCategory,
                Sections = new Dictionary<string, SectionCreateDTO>()
            };

            if (sections != null)
            {
                for (int i = 0; i < sections.Count; i++)
                {
                    s.Sections.Add(i.ToString(), sections[i]);
                }

            }
            return s;
        }
        public SurveyStatisticDTO SQLDataReadertoSurveySatistic(SqlDataReader sdr)
        {
            SurveyStatisticDTO survey;
            try
            {
                survey = new SurveyStatisticDTO
                {
                    ID = Convert.ToInt32(sdr["id"]),
                    Name = Convert.ToString(sdr["name"]),
                    Code = Convert.ToString(sdr["code"]),
                    Description = Convert.ToString(sdr["description"]),
                    Count = Convert.ToInt32(sdr["count"]),
                    OpenTime = Convert.ToDateTime(sdr["open_time"]),
                    CloseTime = Convert.ToDateTime(sdr["close_time"]),
                    SurveyCategory=new SurveyCategoryDTO() { ID = Convert.ToInt32(sdr["category_id"]), Name = Convert.ToString(sdr["category"]) }
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            return survey;
        }

    }
}