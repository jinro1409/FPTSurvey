using SurveyFPT.DAL;
using SurveyFPT.DTO;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Mapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Service
{
    public class SectionService
    {
        private readonly SectionDAO sectionDAO;
        private readonly SectionMapper mapper;
        public SectionService()
        {
            sectionDAO = new SectionDAO();
            mapper = new SectionMapper();
        }
        public bool Create(Dictionary<string, SectionCreateDTO> sections, int surveyId)
        {
            SectionDAO sectionDAO = new SectionDAO();
            QuestionServices questionServices = new QuestionServices();
            foreach (var item in sections)
            {
                int sectionID = sectionDAO.Create(item.Value, surveyId);
                if (sectionID > 0)
                {
                    questionServices.Create(item.Value.Questions, sectionID);

                }
                else return false;
            }

            return true;
        }
        public List<SectionStatisticDTO> Statistic(int id)
        {
            var sections = sectionDAO.Read(id);
            if (sections.Count == 0) return null;
            List<SectionStatisticDTO> result = new List<SectionStatisticDTO>();
            QuestionServices questionServices = new QuestionServices();
            foreach (var item in sections)
            {
                result.Add(mapper.SectiontoSectionStatisticDTO(item, questionServices.Statistic(item.ID)));
            }

            return result;
        }
        public List<SectionDTO> Read(int id)
        {
            var sections = sectionDAO.Read(id);
            List<SectionDTO> sectionsDTOs = new List<SectionDTO>();

            if (sections.Count > 0)
                foreach (var item in sections)
                {
                    var questionDTOs = new QuestionServices().Read(item.ID);

                    sectionsDTOs.Add(mapper.SectiontoSectionDTO(item, questionDTOs));

                }
            return sectionsDTOs;
        }
        public List<SectionCreateDTO> ReadofCreate(int id)
        {
            var sections = sectionDAO.Read(id);
            if (sections.Count == 0) return null;
            List<SectionCreateDTO> sectionsDTOs = new List<SectionCreateDTO>();
            foreach (var item in sections)
            {
                var questionDTOs = new QuestionServices().ReadofCreate(item.ID);

                sectionsDTOs.Add(mapper.SectiontoSectionCreateDTO(item, questionDTOs));

            }
            return sectionsDTOs;
        }
        public bool Update(Dictionary<string, SectionCreateDTO> sections, int surveyId)
        {
            SectionDAO sectionDAO = new SectionDAO();
            QuestionServices questionServices = new QuestionServices();
            int sectionID;
            bool check=false;
            Dictionary<string, SectionCreateDTO> newSections = new Dictionary<string, SectionCreateDTO>();
            foreach (var item in sections)
            {
                sectionID = 0;
                if (!item.Value.Status.HasValue || item.Value.Status.Value == true)
                {
                    if (item.Value.ID != 0)
                    {
                        sectionDAO.Update(item.Value);
                        sectionID = item.Value.ID;
                        check=questionServices.Update(item.Value.Questions, sectionID);
                    }
                    else
                    {
                        newSections.Add(item.Key, item.Value);
                        
                    }
                }else
                {
                   if( sectionDAO.Delete(item.Value.ID)<=0) return false;
                }

               
            }
            if (newSections.Count > 0) { 
                check=Create(newSections, surveyId); 
            }
            return check;
        }
    }
}