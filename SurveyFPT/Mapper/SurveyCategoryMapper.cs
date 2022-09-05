using SurveyFPT.DTO;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.Mapper
{
    public class SurveyCategoryMapper
    {
        public SurveyCategory SQLDataReadertoSurveyCategory(SqlDataReader sdr)
        {
            SurveyCategory surveyCategory = null;
            try
            {
                surveyCategory = new SurveyCategory
                {
                    ID = Convert.ToInt32(sdr["id"]),
                    Name = Convert.ToString(sdr["name"]),
                    Description = Convert.ToString(sdr["description"]),
                    Prefix = Convert.ToString(sdr["code_prefix"]),
                    CreatedBy = Convert.ToInt32(sdr["created_by"]),
                    CreatedAt = Convert.ToDateTime(sdr["created_at"]),
                    UpdatedAt = sdr["updated_at"] == null ? Convert.ToDateTime(sdr["updated_at"]) : DateTime.Now,
                    UpdatedBY = sdr["updated_by"] == null ? Convert.ToInt32(sdr["updated_at"]) : 0,
                    Status = (bool)sdr["status"] 
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            return surveyCategory;
        }
        public SurveyCategoryDTO SurveyCategorytoSurveyCategoryDTO(SurveyCategory surveyCategory)
        {
            return new SurveyCategoryDTO
            {
                ID = surveyCategory.ID,
                Name = surveyCategory.Name,
                Description = surveyCategory.Description,
                Prefix = surveyCategory.Prefix
            };
        }
    }
}