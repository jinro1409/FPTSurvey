using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SurveyFPT.DAL;
using SurveyFPT.DTO;
using SurveyFPT.Mapper;
using SurveyFPT.Models;

namespace SurveyFPT.Service
{
    public class SurveyCategoryService
    {
        public List<SurveyCategoryDTO> FindAllSurveyCategory()
        {
            List<SurveyCategory> surveyCategories = new List<SurveyCategory>();
            SurveyCategoryDAO surveyCategoryDAO = new SurveyCategoryDAO();

            //getdata
            surveyCategories = surveyCategoryDAO.findAllSurveyCategory();

            List<SurveyCategoryDTO> categoryDTOs = new List<SurveyCategoryDTO>();
            foreach(var sc in surveyCategories)
            {
                SurveyCategoryDTO categoryDTO = new SurveyCategoryMapper().SurveyCategorytoSurveyCategoryDTO(sc);
                categoryDTO.Status = sc.Status;
                categoryDTO.UpdatedAt = sc.UpdatedAt;
                categoryDTO.UpdatedBY = sc.UpdatedBY;
                categoryDTO.CreatedAt = sc.CreatedAt;
                categoryDTO.CreatedBy = sc.CreatedBy;
                categoryDTOs.Add(categoryDTO);
            }
            return categoryDTOs;
        }

        public Tuple<List<SurveyCategoryDTO>,int> FindAllSurveyCategorySearch(int page, int pagesize, String search)
        {
            int total_page = 0;
            try
            {
                List<SurveyCategory> surveyCategories = new List<SurveyCategory>();
                SurveyCategoryDAO surveyCategoryDAO = new SurveyCategoryDAO();

                //getdata
                var tuple = surveyCategoryDAO.findAllSurveyCategorySearch(page, pagesize, search);
                surveyCategories = tuple.Item1;
                total_page = tuple.Item2;
                List<SurveyCategoryDTO> categoryDTOs = new List<SurveyCategoryDTO>();
                foreach (var sc in surveyCategories)
                {
                    SurveyCategoryDTO categoryDTO = new SurveyCategoryMapper().SurveyCategorytoSurveyCategoryDTO(sc);
                    categoryDTO.Status = sc.Status;
                    categoryDTO.UpdatedAt = sc.UpdatedAt;
                    categoryDTO.UpdatedBY = sc.UpdatedBY;
                    categoryDTO.CreatedAt = sc.CreatedAt;
                    categoryDTO.CreatedBy = sc.CreatedBy;
                    categoryDTOs.Add(categoryDTO);
                }
                return new Tuple<List<SurveyCategoryDTO>, int>(categoryDTOs,total_page);
            } catch (Exception )
            {
                throw;
            }
            
        }

        public SurveyCategoryDTO FindSurveyCategoryByID(int id)
        {
            SurveyCategoryDAO surveyCategoryDAO = new SurveyCategoryDAO();
            if (id > 0)
            {
                SurveyCategory sc = surveyCategoryDAO.Read(id);
                SurveyCategoryDTO categoryDTO = new SurveyCategoryMapper().SurveyCategorytoSurveyCategoryDTO(sc);
                categoryDTO.Status = sc.Status;
                categoryDTO.UpdatedAt = sc.UpdatedAt;
                categoryDTO.UpdatedBY = sc.UpdatedBY;
                categoryDTO.CreatedAt = sc.CreatedAt;
                categoryDTO.CreatedBy = sc.CreatedBy;
                return categoryDTO;
            }

            return null;
        }

        public string saveSurveyCategory(SurveyCategory sc, Account admin)
        {
            return new SurveyCategoryDAO().saveSurveyCategory(sc, admin);
        }
    }
}