using SurveyFPT.DTO;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.Mapper
{
    public class QuestionCategoryMapper
    {
        public QuestionCategory SQLDataReadertoQuestionCategory(SqlDataReader sdr)
        {
            QuestionCategory questionCategory = null;
            try
            {
                questionCategory = new QuestionCategory
                {
                    ID = Convert.ToInt32(sdr["id"]),
                    Name = Convert.ToString(sdr["name"]),
                    Description = Convert.ToString(sdr["description"]),
                  };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
            return questionCategory;
        }
        public QuestionCategoryDTO QuestionCategorytoQuestionCategoryDTO(QuestionCategory questionCategory)
        {
            return new QuestionCategoryDTO
            {
                ID=questionCategory.ID,
                Name=questionCategory.Name
            };
        }
    }
}