using SurveyFPT.DTO.StatisticDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Service
{
    public class ChartService
    {
        public List<Chart> Read(SurveyStatisticDTO survey)
        {
            List<Chart> charts = new List<Chart>();
            foreach (var section in survey.Sections)
            {
                if (section.Questions != null)
                {
                    foreach (var question in section.Questions)
                    {
                        List<string> labels = new List<string>();
                        List<int> counts = new List<int>();
                        if (question.QuestionCatagory != 3)
                        {
                            if (question.QuestionCatagory == 1 || question.QuestionCatagory == 2)
                            {
                                if (question.ChoiceStatistics != null)
                                {
                                    foreach (var item in question.ChoiceStatistics)
                                    {
                                        if (!item.IsOtherChoice)
                                        {
                                            labels.Add(item.Label);
                                            counts.Add(item.Count);
                                        }
                                        else
                                        {
                                            if (item.OtherChoiceStatistics != null && item.OtherChoiceStatistics.Count > 0)
                                                foreach (var otheritem in item.OtherChoiceStatistics)
                                                {
                                                    labels.Add(otheritem.Response);
                                                    counts.Add(otheritem.ResponseCount);
                                                }
                                            if (item.Count == 0)
                                            {
                                                labels.Add(item.Label);
                                                counts.Add(item.Count);
                                            }

                                        }
                                    }
                                }
                            }
                            if (question.QuestionCatagory == 4)
                            {
                                if (question.LinearScaleStatistics != null)
                                {
                                    foreach (var item in question.LinearScaleStatistics)
                                    {
                                        labels.Add(item.ScaleLabel);
                                        counts.Add(item.Count);
                                    }
                                }
                            }
                            List<TextStatisticDTO> textStatisticDTO;
                            if (question.TextStatistics.Item1 == 0)
                            {
                                textStatisticDTO = null;
                            }
                            else textStatisticDTO = question.TextStatistics.Item2;
                            charts.Add(new Chart
                            {
                                Question = question.Questions,
                                QuestionCategoryId = question.QuestionCatagory,
                                Labels = labels,
                                Counts = counts,
                                Texts = textStatisticDTO
                            });

                        }

                    }

                }
            }

            return charts;
        }
    }
}