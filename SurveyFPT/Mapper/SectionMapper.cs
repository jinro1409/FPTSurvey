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
    public class SectionMapper
    {
        public Section SQLDataReadertoSection(SqlDataReader sdr)
        {
            Section surveyCategory = null;
            try
            {
                surveyCategory = new Section
                {
                    ID = Convert.ToInt32(sdr["id"]),
                    Name = Convert.ToString(sdr["name"]),
                    Description = Convert.ToString(sdr["description"]),
                    CreatedBy = Convert.ToInt32(sdr["created_by"]),
                    CreatedAt = Convert.ToDateTime(sdr["created_at"]),
                    UpdatedAt = sdr["updated_at"] == null ? Convert.ToDateTime(sdr["updated_at"]) : DateTime.Now,
                    UpdatedBY = sdr["updated_by"] == null ? Convert.ToInt32(sdr["updated_at"]) : 0,
                    Order = Convert.ToInt32(sdr["order"]),
                    SurveyID= Convert.ToInt32(sdr["survey_id"]),
                    Status=Convert.ToBoolean(sdr["status"])
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
            return surveyCategory;
        }
        public SectionDTO SectiontoSectionDTO(Section section, List<QuestionDTO> questionDTOs)
        {
            return new SectionDTO
            {
                ID = section.ID,
                Name = section.Name,
                Description = section.Description,
                Questions=questionDTOs
            };
        }
        public SectionCreateDTO SectiontoSectionCreateDTO(Section section, List<QuestionCreateDTO> questionDTOs)
        {
            var s = new SectionCreateDTO
            {
                ID = section.ID,
                Name = section.Name,
                Description = section.Description,
                Questions = new Dictionary<string, QuestionCreateDTO>()
            };

            if (questionDTOs != null)
            {
                for (int i = 0; i < questionDTOs.Count; i++)
                {
                    s.Questions.Add(i.ToString(), questionDTOs[i]);
                }

            }
            return s;
        }
        public SectionStatisticDTO SectiontoSectionStatisticDTO(Section section, List<QuestionStatisticDTO> questionDTOs)
        {
            return new SectionStatisticDTO
            {
                Name = section.Name,
                Description = section.Description,
                Questions = questionDTOs
            };
        }
    }
}