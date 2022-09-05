using SurveyFPT.DAL;
using SurveyFPT.DTO;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.Responsed;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Mapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Service
{
    public class QuestionServices
    {
        private readonly QuestionDAO questionDAO;
        private readonly QuestionMapper mapper;
        public QuestionServices()
        {
            mapper = new QuestionMapper();
            questionDAO = new QuestionDAO();
        }
        public bool Create(Dictionary<string, QuestionCreateDTO> questions, int sectionId)
        {
            ChoiceService choiceService = new ChoiceService();
            LinearScaleService linearScaleService = new LinearScaleService();
            TextAnswerService textAnswerService = new TextAnswerService();
            bool check = false;
            foreach (var item in questions)
            {
                int questionId = questionDAO.Create(item.Value, sectionId);
                if (questionId == 0)
                {
                    return false;
                }
                else
                {
                    switch (item.Value.QuestionCategory.ID)
                    {
                        case 1:

                            check = choiceService.Create(item.Value.ChoiceAnswers, questionId);
                            if (item.Value.TextAnswer.CheckTextChoice)
                            {
                                textAnswerService.Create(item.Value.TextAnswer, questionId);
                            }
                            break;
                        case 2:
                            check = choiceService.Create(item.Value.ChoiceAnswers, questionId);
                            if (item.Value.TextAnswer.CheckTextChoice)
                            {
                                textAnswerService.Create(item.Value.TextAnswer, questionId);
                            }
                            break;
                        case 3:
                            item.Value.TextAnswer.Label = "Short answer text";
                            check = textAnswerService.Create(item.Value.TextAnswer, questionId);

                            break;
                        case 4:
                            check = linearScaleService.Create(item.Value.LinearAnswers, questionId);
                            break;
                        default:
                            break;
                    }
                    if (!check) return false;
                }
            }
            return true;
        }
        public List<QuestionStatisticDTO> Statistic(int id)
        {
            var list = questionDAO.Read(id);
            List<QuestionStatisticDTO> result = new List<QuestionStatisticDTO>();
            QuestionStatisticDTO question;
            LinearScaleService linearScaleService = new LinearScaleService();
            ChoiceService choiceService = new ChoiceService();
            TextAnswerService textAnswerService = new TextAnswerService();
            if (list.Count == 0) return null;
            foreach (var item in list)
            {
                if (item.QuestionCategoryID == 4)
                {
                    question = mapper.QuestiontoQuestionStatisticDTO(item, null, linearScaleService.Statistic(item.ID), null);
                }
                else
                {
                    var listText = textAnswerService.Statistic(item.ID, false);

                    if (item.QuestionCategoryID == 1 || item.QuestionCategoryID == 2)
                    {
                        question = mapper.QuestiontoQuestionStatisticDTO(item, choiceService.Statistic(item.ID), null, listText);
                    }
                    else
                        question = mapper.QuestiontoQuestionStatisticDTO(item, null, null, listText);
                }

                result.Add(question);
            }
            return result;
        }
        public List<QuestionDTO> Read(int id)
        {
            var questions = questionDAO.Read(id);
            List<QuestionDTO> questionDTOs = new List<QuestionDTO>();

            if (questions.Count == 0) return questionDTOs;
            QuestionCategoryDAO questionCategoryDAO = new QuestionCategoryDAO();
            QuestionCategoryMapper questionCategoryMapper = new QuestionCategoryMapper();
            List<ChoiceAnswerDTO> choiceAnswerDTOs = null;
            List<LinearAnswerDTO> linearAnswerDTOs = null;
            ChoiceService choiceService = new ChoiceService();
            LinearScaleService linearScaleService = new LinearScaleService();
            TextAnswerService textAnswerService = new TextAnswerService();
            foreach (var question in questions)
            {

                var questionCategory = questionCategoryDAO.Read(question.QuestionCategoryID);
                var questionCategoryDTO = questionCategoryMapper.QuestionCategorytoQuestionCategoryDTO(questionCategory);
                if (questionCategory.ID == 1 || questionCategory.ID == 2)
                {
                    choiceAnswerDTOs = choiceService.Read(question.ID);

                }
                if (questionCategory.ID == 4)
                {

                    linearAnswerDTOs = linearScaleService.Read(question.ID);

                }

                TextAnswerDTO textAnswerDTO = textAnswerService.Read(question.ID);

                var questionDTO = mapper.QuestiontoQuestionDTO(question, questionCategoryDTO, choiceAnswerDTOs, linearAnswerDTOs, textAnswerDTO);
                questionDTOs.Add(questionDTO);
            }
            return questionDTOs;
        }
        public List<QuestionCreateDTO> ReadofCreate(int id)
        {
            var questions = questionDAO.Read(id);
            if (questions.Count == 0) return null;
            List<QuestionCreateDTO> questionDTOs = new List<QuestionCreateDTO>();
            QuestionCategoryDAO questionCategoryDAO = new QuestionCategoryDAO();
            QuestionCategoryMapper questionCategoryMapper = new QuestionCategoryMapper();
            List<ChoiceCreateDTO> choiceAnswerDTOs = null;
            List<LinearScaleCreateDTO> linearAnswerDTOs = null;
            ChoiceService choiceService = new ChoiceService();
            LinearScaleService linearScaleService = new LinearScaleService();
            TextAnswerService textAnswerService = new TextAnswerService();
            foreach (var question in questions)
            {

                var questionCategory = questionCategoryDAO.Read(question.QuestionCategoryID);
                var questionCategoryDTO = questionCategoryMapper.QuestionCategorytoQuestionCategoryDTO(questionCategory);


                TextAnswerCreateDTO textAnswerDTO = textAnswerService.ReadofCreate(question.ID);
                if (questionCategory.ID == 1 || questionCategory.ID == 2)
                {
                    choiceAnswerDTOs = choiceService.ReadofCreate(question.ID);
                    if (textAnswerDTO != null) textAnswerDTO.CheckTextChoice = true;

                }
                if (questionCategory.ID == 4)
                {

                    linearAnswerDTOs = linearScaleService.ReadofCreate(question.ID);
                }
                var questionDTO = mapper.QuestiontoQuestionCreateDTO(question, questionCategoryDTO, choiceAnswerDTOs, linearAnswerDTOs, textAnswerDTO);
                questionDTO.OldLinearAnswers = linearAnswerDTOs;
                questionDTOs.Add(questionDTO);
            }
            return questionDTOs;
        }
        public bool Update(Dictionary<string, QuestionCreateDTO> questions, int sectionId)
        {
            ChoiceService choiceService = new ChoiceService();
            LinearScaleService linearScaleService = new LinearScaleService();
            TextAnswerService textAnswerService = new TextAnswerService();
            Dictionary<string, QuestionCreateDTO> newQuestions = new Dictionary<string, QuestionCreateDTO>();
            bool check = false;
            int questionId;
            foreach (var item in questions)
            {
                questionId = 0;
                if (!item.Value.Status.HasValue || item.Value.Status.Value)
                {
                    if (item.Value == null) return false;
                    if (item.Value.ID == 0)
                    {
                        if (item.Value != null)
                            newQuestions.Add(item.Key, item.Value);

                    }
                    else
                    {
                        if (item.Value == null) return false;
                        questionDAO.Update(item.Value);
                        questionId = item.Value.ID;
                        if (questionId == 0)
                        {
                            return false;
                        }
                        else
                        {
                            if (item.Value.QuestionCategory.ID == item.Value.QuestionCategory.OldId)
                                switch (item.Value.QuestionCategory.ID)
                                {
                                    case 1:

                                        check = choiceService.Update(item.Value.ChoiceAnswers, questionId);
                                        if (item.Value.NewTextAnswer == null)
                                        {
                                            if (item.Value.TextAnswer.Status.HasValue)
                                            {
                                                if (!item.Value.TextAnswer.Status.Value)
                                                    check = textAnswerService.Delete(item.Value.TextAnswer.ID);
                                                else
                                                    check = textAnswerService.Update(item.Value.TextAnswer);
                                            }
                                        }
                                        else
                                        {
                                            if (item.Value.TextAnswer.Status.HasValue)
                                            {
                                                check = textAnswerService.Update(item.Value.TextAnswer);
                                            }
                                            else
                                            {
                                                check = textAnswerService.Create(item.Value.TextAnswer, questionId);
                                            }
                                        }
                                        break;
                                    case 2:
                                        check = choiceService.Update(item.Value.ChoiceAnswers, questionId);
                                        if (item.Value.NewTextAnswer == null)
                                        {
                                            if (item.Value.TextAnswer.Status.HasValue)
                                            {
                                                if (!item.Value.TextAnswer.Status.Value)
                                                    check = textAnswerService.Delete(item.Value.TextAnswer.ID);
                                                else
                                                    check = textAnswerService.Update(item.Value.TextAnswer);
                                            }
                                        }
                                        else
                                        {
                                            if (item.Value.TextAnswer.Status.HasValue)
                                            {
                                                check = textAnswerService.Update(item.Value.TextAnswer);
                                            }
                                            else
                                            {
                                                textAnswerService.Create(item.Value.TextAnswer, questionId);
                                            }
                                        }
                                        break;
                                    case 3:
                                        item.Value.TextAnswer.Label = "Short answer text";
                                        if (item.Value.TextAnswer.ID != 0) check = textAnswerService.Update(item.Value.TextAnswer);
                                        else check = textAnswerService.Create(item.Value.TextAnswer, questionId);
                                        break;
                                    case 4:
                                        if (item.Value.LinearAnswers.First().ID != 0)
                                        {
                                            check = linearScaleService.Update(item.Value.LinearAnswers, questionId);
                                            break;
                                        }
                                        else
                                        {
                                            if (item.Value.LinearAnswers.Count <= item.Value.OldLinearAnswers.Count)
                                            {
                                                int i = 0;
                                                foreach (var linear in item.Value.LinearAnswers)
                                                {
                                                    linear.ID = item.Value.OldLinearAnswers[i].ID;
                                                    i++;
                                                }
                                                for (int j = i; j < item.Value.OldLinearAnswers.Count; j++)
                                                {
                                                    item.Value.LinearAnswers.Add(new LinearScaleCreateDTO { ID = item.Value.OldLinearAnswers[j].ID, Status = false });
                                                }
                                            }
                                            else if (item.Value.LinearAnswers.Count > item.Value.OldLinearAnswers.Count)
                                            {
                                                for (int i = 0; i < item.Value.OldLinearAnswers.Count; i++)
                                                {
                                                    item.Value.LinearAnswers[i].ID = item.Value.OldLinearAnswers[i].ID;
                                                }
                                            }
                                            check = linearScaleService.Update(item.Value.LinearAnswers, questionId);
                                            break;
                                        }
                                    default:
                                        break;
                                }
                            else
                            {
                                switch (item.Value.QuestionCategory.ID)
                                {
                                    case 1:
                                        if (item.Value.QuestionCategory.OldId == 2)
                                        {
                                            check = choiceService.Update(item.Value.ChoiceAnswers, questionId);
                                            if (item.Value.NewTextAnswer == null)
                                            {
                                                if (item.Value.TextAnswer.Status.HasValue)
                                                {
                                                    if (!item.Value.TextAnswer.Status.Value)
                                                        check = textAnswerService.Delete(item.Value.TextAnswer.ID);
                                                    else check = textAnswerService.Update(item.Value.TextAnswer);
                                                }
                                            }
                                            else
                                            {
                                                if (item.Value.TextAnswer.Status.HasValue)
                                                {
                                                    check = textAnswerService.Update(item.Value.TextAnswer);
                                                }
                                                else
                                                {
                                                    check = textAnswerService.Create(item.Value.TextAnswer, questionId);
                                                }
                                            }
                                            break;
                                        }
                                        else
                                        {
                                            check = choiceService.Create(item.Value.ChoiceAnswers, questionId);
                                            if (item.Value.NewTextAnswer != null)
                                            {
                                                check = textAnswerService.Create(item.Value.TextAnswer, questionId);
                                            }
                                            break;
                                        }
                                    case 2:
                                        if (item.Value.QuestionCategory.OldId == 1)
                                        {
                                            check = choiceService.Update(item.Value.ChoiceAnswers, questionId);
                                            if (item.Value.NewTextAnswer == null)
                                            {
                                                if (item.Value.TextAnswer.Status.HasValue)
                                                {
                                                    if (!item.Value.TextAnswer.Status.Value)
                                                        check = textAnswerService.Delete(item.Value.TextAnswer.ID);
                                                    else
                                                        check = textAnswerService.Update(item.Value.TextAnswer);
                                                }
                                            }
                                            else
                                            {
                                                if (item.Value.TextAnswer.Status.HasValue)
                                                {
                                                    check = textAnswerService.Update(item.Value.TextAnswer);
                                                }
                                                else
                                                {
                                                    check = textAnswerService.Create(item.Value.TextAnswer, questionId);
                                                }
                                            }
                                            break;
                                        }
                                        else
                                        {
                                            check = choiceService.Create(item.Value.ChoiceAnswers, questionId);
                                            if (item.Value.NewTextAnswer != null)
                                            {
                                                check = textAnswerService.Create(item.Value.TextAnswer, questionId);
                                            }
                                            break;
                                        }
                                    case 3:
                                        item.Value.TextAnswer.Label = "Short answer text";
                                        check = textAnswerService.Create(item.Value.TextAnswer, questionId);

                                        break;
                                    case 4:
                                        check = linearScaleService.Create(item.Value.LinearAnswers, questionId);
                                        break;
                                    default:
                                        break;
                                }
                                switch (item.Value.QuestionCategory.OldId)
                                {
                                    case 1:
                                        if (item.Value.QuestionCategory.ID != 2)
                                        {
                                            foreach (var choice in item.Value.ChoiceAnswers)
                                            {
                                                check = choiceService.Delete(choice.Value.ID);
                                            }
                                            if (item.Value.TextAnswer.OldIdText != 0) textAnswerService.Delete(item.Value.TextAnswer.OldIdText);
                                            break;
                                        }
                                        else break;
                                    case 2:
                                        if (item.Value.QuestionCategory.ID != 1)
                                        {
                                            foreach (var choice in item.Value.ChoiceAnswers)
                                            {
                                                check = choiceService.Delete(choice.Value.ID);
                                            }
                                            if (item.Value.TextAnswer.OldIdText != 0) textAnswerService.Delete(item.Value.TextAnswer.OldIdText);
                                            break;
                                        }
                                        else break;
                                    case 3:

                                        check = textAnswerService.Delete(item.Value.TextAnswer.ID);

                                        break;
                                    case 4:
                                        if (item.Value.OldLinearAnswers != null && item.Value.OldLinearAnswers.Count > 0)
                                        {
                                            foreach (var linear in item.Value.OldLinearAnswers)
                                            {
                                                check = linearScaleService.Delete(linear.ID);
                                            }
                                        }
                                        break;
                                    default:
                                        break;
                                }
                            }
                            if (!check) return false;
                        }

                    }

                }
                else
                {
                    questionDAO.Delete(item.Value.ID);
                }

            }
            if (newQuestions.Count > 0)
            {
                check = Create(newQuestions, sectionId);
            }
            return check;
        }

    }
}