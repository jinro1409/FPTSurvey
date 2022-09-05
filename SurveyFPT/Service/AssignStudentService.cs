using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Grpc.Core;
using Hangfire;
using SurveyFPT.DAL;
using SurveyFPT.DTO;
using SurveyFPT.Models;

namespace SurveyFPT.Service
{
    public class AssignStudentService
    {
        public void saveAssignStudentToSurvey(List<AssignedStudent> arrAst, int survey_id, int admin_id, String survey_name)
        {
            if(arrAst!=null && arrAst.Count > 0)
            {
                AssignedStudentDAO assignedStudentDAO = new AssignedStudentDAO();
                
                List<AssignedStudentBulkModel> items = new List<AssignedStudentBulkModel>();

                foreach (AssignedStudent a in arrAst)
                {
                    items.Add(new AssignedStudentBulkModel()
                    {
                        email = a.Email,
                        survey_id = survey_id,
                        created_by = admin_id,
                        created_at = DateTime.Now
                    }); 
                }
                assignedStudentDAO.assignStudentToSurveyBulk<AssignedStudentBulkModel>(items);
            }
        }

        public List<AssignedStudentDTO> findAllAssignBySurveyID(int survey_id)
        {
            try
            {
                List<AssignedStudentDTO> assignedStudentDTOs = new List<AssignedStudentDTO>();
                List<AssignedStudent> assigneds = new AssignedStudentDAO().findAllAssignBySurveyID(survey_id);
                if (assigneds != null && assigneds.Count > 0)
                {
                    foreach (AssignedStudent assigned in assigneds)
                    {
                        AssignedStudentDTO studentDTO = new AssignedStudentDTO();
                        studentDTO.Email = assigned.Email;
                        studentDTO.SurveyID = assigned.SurveyID;
                        assignedStudentDTOs.Add(studentDTO);
                    }
                    return assignedStudentDTOs;
                }
                return null;
            } catch(Exception )
            {
                throw;
            }
        }
    }
}