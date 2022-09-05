
USE [FinalFUSurvey]
GO
SET IDENTITY_INSERT [dbo].[QuestionCategory] ON 
GO
INSERT [dbo].[QuestionCategory] ([id], [name], [description], [status]) VALUES (1, N'SingleChoice', N'This is multiple 1 answer', NULL)
GO
INSERT [dbo].[QuestionCategory] ([id], [name], [description], [status]) VALUES (2, N'MultipleChoice', N'This is multiple choice many answers', NULL)
GO
INSERT [dbo].[QuestionCategory] ([id], [name], [description], [status]) VALUES (3, N'TextAnswer', N'This is text answer', NULL)
GO
INSERT [dbo].[QuestionCategory] ([id], [name], [description], [status]) VALUES (4, N'LinearScale', N'This is ranking answer', NULL)
GO
SET IDENTITY_INSERT [dbo].[QuestionCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[SurveyCategory] ON 
GO
INSERT [dbo].[SurveyCategory] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (1, N'Khao sat', N'abc', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[SurveyCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([id], [role_name], [permission], [status]) VALUES (1, N'admin', N'abc', 1)
GO
INSERT [dbo].[Role] ([id], [role_name], [permission], [status]) VALUES (2, N'user', N'view', 1)
GO
INSERT [dbo].[Role] ([id], [role_name], [permission], [status]) VALUES (3, N'creator', N'1', 1)
GO
INSERT [dbo].[Role] ([id], [role_name], [permission], [status]) VALUES (4, N'result', N'2', 1)
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([id], [name], [email], [role_id], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (1, N'an', N'anntdhe140298@fpt.edu.vn', 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[User] ([id], [name], [email], [role_id], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (7, N'1', N'hieumthe141628@fpt.edu.vn', 4, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[User] ([id], [name], [email], [role_id], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (8, N'hailvhe141667@fpt.edu.vn', N'hailvhe141667@fpt.edu.vn', 3, 7, CAST(N'2022-06-30T22:07:04.900' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([id], [name], [email], [role_id], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (9, N'cuonghphe140309@fpt.edu.vn', N'cuonghphe140309@fpt.edu.vn', 2, 7, CAST(N'2022-06-30T22:57:47.910' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Survey] ON 
GO
INSERT [dbo].[Survey] ([id], [name], [code], [description], [open_time], [close_time], [survey_category_id], [created_by], [created_at], [is_require], [is_score_taken], [is_public], [is_changing_allow], [background_color], [background_image], [updated_by], [updated_at], [status]) VALUES (1, N'khao sat', N'1         ', N'abc', CAST(N'2022-06-27T00:00:00.000' AS DateTime), CAST(N'2022-06-30T00:00:00.000' AS DateTime), 1, 1, CAST(N'2022-04-09T00:00:00.000' AS DateTime), 0, 0, 1, 0, N'abc       ', N'abc', NULL, NULL, 1)
GO
INSERT [dbo].[Survey] ([id], [name], [code], [description], [open_time], [close_time], [survey_category_id], [created_by], [created_at], [is_require], [is_score_taken], [is_public], [is_changing_allow], [background_color], [background_image], [updated_by], [updated_at], [status]) VALUES (2, N'Khảo sát sinh viên FU', N'2         ', N'Khảo sát về quá trình học tập của sinh viên FU', CAST(N'2022-02-02T00:00:00.000' AS DateTime), CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 0, 0, 0, 0, N'abc       ', N'abc', NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Survey] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 
GO
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (1, N'section1', N'abc', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3, 1)
GO
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (2, N'section 2', N'abc', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 4, 1)
GO
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (3, N'Khảo sát về giảng viên', N'Khảo sát về giảng viên', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 2, 1, 1)
GO
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (5, N'Khảo sát về môn học', N'Khảo sát về giảng viên', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 2, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (1, N'Đồ ăn được chế biến tại căng tin của nhà trường có ngon miệng không', N'abc', 1, 0, 1, 1, 1, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (2, N'Bạn có thường xuyên gặp tình trạng tắc đường ở bãi gửi xe lúc bắt đầu giờ học và lúc kết thúc giờ học không
', N'abc', 1, 0, 1, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (3, N'Giá cả đồ ăn ở căng tin như thế nào ?', N'abc', 1, 0, 1, 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (4, N'Bạn muốn nhà trường cải thiện cơ sở vật chất nào ?
', N'abc', 1, 0, 2, 4, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (5, N'Thái độ phục vụ ở căng tin ?', N'abc', 1, 0, 2, 5, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (6, N'Điểm tốt về giáo viên giảng dạy tại trường', N'abc', 1, 0, 2, 6, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (7, N'Thời gian giáo viên phản hồi các thắc mắc của bạn là bao lâu?
', N'abc', 1, 0, 3, 7, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (8, N'Khối lượng kiến thức của bài giảng giáo viên truyền tải như thế nào', N'abc', 0, 0, 4, 8, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (9, N'Khối lượng bài tập về nhà của giảng viên như thế nào
', N'abc', 0, 0, 1, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (12, N'Khối lượng kiến thức của bài giảng giáo viên truyền tải như thế nào', N'abc', 0, 0, 4, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (13, N'Bạn thấy phương pháp giảng dạy của thầy/cô như thế nào
', N'abc', 0, 0, 1, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (14, N'Bạn thường liên lạc với giáo viên ngoài giờ học như thế nào?', N'abc', 0, 0, 3, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (15, N'Thời gian giáo viên phản hồi các thắc mắc của bạn là bao lâu?
', N'abc', 0, 0, 3, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (18, N'Điểm tốt về giáo viên giảng dạy tại trường
', N'abc', 0, 0, 2, 7, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (19, N'Điểm chưa tốt về giáo viên trong trường', N'abc', 0, 0, 1, 8, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (20, N'Bạn thấy chuyên môn giảng dạy của các giảng viên trong trường như thế nào
', N'abc', 0, 0, 4, 9, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (21, N'Khối lượng kiến thức của 1 môn học như thế nào', N'abc', 0, 0, 4, 10, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (22, N'Chất lượng của các khóa học coursera có đảm bảo không', N'abc', 0, 0, 4, 11, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (23, N'Bạn có điều gì chưa hài lòng về coursera', N'abc', 0, 0, 3, 12, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (24, N'Bạn thấy check đạo văn của coursera như thế nào
', N'abc', 0, 0, 1, 13, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (26, N'Những gì bạn đã tiếp thu được sau những khóa học như thế nào
', N'abc', 0, 0, 2, 14, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (27, N'Theo bạn, lợi ích của việc học môn vovinam là gì', N'abc', 0, 0, 2, 15, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (28, N'Bạn có muốn trường mở rộng thêm môn võ không,lý do
', N'abc', 0, 0, 1, 16, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (29, N'Bạn có cảm nhận gì về môn nhạc cụ truyền thống
', N'abc', 0, 0, 3, 17, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (30, N'Bạn đạt được gì sau khi học môn nhạc cụ truyền thống
', N'abc', 0, 0, 2, 18, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Choice] ON 
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (1, N'A', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (2, N'B', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (3, N'C', 1, 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (4, N'AA', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (5, N'BB', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (6, N'MC', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (7, N'MA', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (8, N'C', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (9, N'F', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (10, N'Y', 0, 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (11, N'R', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (12, N'E', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (13, N'U', 0, 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (14, N'Y', 1, 4, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (15, N'RR', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 6)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (16, N'EE', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 6)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (18, N'Nhẹ nhàng', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (19, N'Vừa đủ', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (20, N'Rất nặng', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (22, N'Other:', 1, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (23, N'Chuyên nghiệp', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (24, N'Thiếu chuyên nghiệp', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (25, N'Bình thường', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (26, N'Kém', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (27, N'Gắt gỏng', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (28, N'Cư xử không đúng mực
', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (29, N'Thái độ làm việc chậm chạp', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (30, N'Phong cách làm việc thiếu chuyên nghiệp', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (31, N'Rất hiệu quả ', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (32, N'Không hiệu quả', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (34, N'Bình thường', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (35, N'Còn nhiều thiếu sót', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (36, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (37, N'Có ', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 28)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (38, N'Không', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 28)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (39, N'Lý do', 1, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 28)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (41, N'Nhiệt tình', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (42, N'Thân thiện', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (43, N'Hài hước', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (44, N'Tương tác với sinh viên
', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (46, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (47, N'Xây dựng nguyên lý đạo đức nghề nghiệp
', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (48, N'Các vấn đề đạo đức nghề nghiệp', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (49, N'Các kiến thức căn bản của khóa học đó', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (50, N'Cách làm việc', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (51, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (52, N'Rèn luyện sức khỏe', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (53, N'Nâng cao tinh thần võ đạo', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (54, N'Tự vệ', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (55, N'Biểu diễn các bài võ đẹp mắt', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (56, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (57, N'Cách chơi nhạc cụ', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 30)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (58, N'Lịch sử nhạc cụ', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 30)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (59, N'Other', 1, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 30)
GO
SET IDENTITY_INSERT [dbo].[Choice] OFF
GO
SET IDENTITY_INSERT [dbo].[SurveyResponse] ON 
GO
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (3020, N'cuonghphel140309@fpt.edu.vn', 1, CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11T22:48:15.747' AS DateTime), 1)
GO
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (3021, N'cuonghphe140l3l09@fpt.edu.vn', 2, CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11T23:20:58.033' AS DateTime), 1)
GO
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (4020, N'chuongnnhe140285q@fpt.edu.vn', 1, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T08:23:09.420' AS DateTime), 1)
GO
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (4021, N'chuongnnhe14028q5@fpt.edu.vn', 2, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T08:24:53.203' AS DateTime), 1)
GO
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (4023, N'chuongnnhe1402qqq85@fpt.edu.vn', 2, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T08:49:02.370' AS DateTime), 1)
GO
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (4024, N'chuongnnhe1402805@fpt.edu.vn', 1, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T09:44:48.060' AS DateTime), 1)
GO
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (5020, N'chuongnnhe140285@fpt.edu.vn', 1, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T15:00:57.587' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[SurveyResponse] OFF
GO
SET IDENTITY_INSERT [dbo].[LinearScale] ON 
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (1, 1, N'A', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 8)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (2, 2, N'B', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 8)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (3, 3, N'C', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 8)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (4, 1, N'Nhiều thiếu sót', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (5, 2, N'Không đảm bảo ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (6, 3, N' Bình thường ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (7, 4, N'Tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (8, 5, N' Rất tốt
', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (10, 1, N'Rất tệ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (11, 2, N'Tệ  ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (12, 3, N' Bình thường  ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (13, 4, N'Tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (14, 5, N'Rất tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (15, 1, N'Rất ít', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (16, 2, N'  Ít', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (17, 3, N'Bình thường ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (18, 4, N'Nhiều', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (19, 5, N' Rất nhiều', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (20, 1, N'Rất tệ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (22, 2, N'Tệ ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (23, 3, N'Bình thường', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (24, 4, N'Tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (25, 5, N'Rất tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
GO
SET IDENTITY_INSERT [dbo].[LinearScale] OFF
GO
SET IDENTITY_INSERT [dbo].[TextAnswer] ON 
GO
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (1, 7, N'abc', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
GO
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (2, 3, N'abc', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
GO
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (3, 6, N'abc', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
GO
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (4, 14, N'abc', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
GO
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (5, 15, N'abc', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, 1, 1)
GO
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (6, 23, N'abc', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
GO
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (7, 29, N'abc', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
GO
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (11, 19, N'abc1', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[TextAnswer] OFF
GO
