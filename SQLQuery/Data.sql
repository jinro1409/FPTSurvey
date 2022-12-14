
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
INSERT [dbo].[Survey] ([id], [name], [code], [description], [open_time], [close_time], [survey_category_id], [created_by], [created_at], [is_require], [is_score_taken], [is_public], [is_changing_allow], [background_color], [background_image], [updated_by], [updated_at], [status]) VALUES (2, N'Kh???o s??t sinh vi??n FU', N'2         ', N'Kh???o s??t v??? qu?? tr??nh h???c t???p c???a sinh vi??n FU', CAST(N'2022-02-02T00:00:00.000' AS DateTime), CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 0, 0, 0, 0, N'abc       ', N'abc', NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Survey] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 
GO
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (1, N'section1', N'abc', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3, 1)
GO
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (2, N'section 2', N'abc', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 4, 1)
GO
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (3, N'Kh???o s??t v??? gi???ng vi??n', N'Kh???o s??t v??? gi???ng vi??n', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 2, 1, 1)
GO
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (5, N'Kh???o s??t v??? m??n h???c', N'Kh???o s??t v??? gi???ng vi??n', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 2, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (1, N'????? ??n ???????c ch??? bi???n t???i c??ng tin c???a nh?? tr?????ng c?? ngon mi???ng kh??ng', N'abc', 1, 0, 1, 1, 1, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (2, N'B???n c?? th?????ng xuy??n g???p t??nh tr???ng t???c ???????ng ??? b??i g???i xe l??c b???t ?????u gi??? h???c v?? l??c k???t th??c gi??? h???c kh??ng
', N'abc', 1, 0, 1, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (3, N'Gi?? c??? ????? ??n ??? c??ng tin nh?? th??? n??o ?', N'abc', 1, 0, 1, 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (4, N'B???n mu???n nh?? tr?????ng c???i thi???n c?? s??? v???t ch???t n??o ?
', N'abc', 1, 0, 2, 4, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (5, N'Th??i ????? ph???c v??? ??? c??ng tin ?', N'abc', 1, 0, 2, 5, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (6, N'??i???m t???t v??? gi??o vi??n gi???ng d???y t???i tr?????ng', N'abc', 1, 0, 2, 6, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (7, N'Th???i gian gi??o vi??n ph???n h???i c??c th???c m???c c???a b???n l?? bao l??u?
', N'abc', 1, 0, 3, 7, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (8, N'Kh???i l?????ng ki???n th???c c???a b??i gi???ng gi??o vi??n truy???n t???i nh?? th??? n??o', N'abc', 0, 0, 4, 8, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (9, N'Kh???i l?????ng b??i t???p v??? nh?? c???a gi???ng vi??n nh?? th??? n??o
', N'abc', 0, 0, 1, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (12, N'Kh???i l?????ng ki???n th???c c???a b??i gi???ng gi??o vi??n truy???n t???i nh?? th??? n??o', N'abc', 0, 0, 4, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (13, N'B???n th???y ph????ng ph??p gi???ng d???y c???a th???y/c?? nh?? th??? n??o
', N'abc', 0, 0, 1, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (14, N'B???n th?????ng li??n l???c v???i gi??o vi??n ngo??i gi??? h???c nh?? th??? n??o?', N'abc', 0, 0, 3, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (15, N'Th???i gian gi??o vi??n ph???n h???i c??c th???c m???c c???a b???n l?? bao l??u?
', N'abc', 0, 0, 3, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (18, N'??i???m t???t v??? gi??o vi??n gi???ng d???y t???i tr?????ng
', N'abc', 0, 0, 2, 7, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (19, N'??i???m ch??a t???t v??? gi??o vi??n trong tr?????ng', N'abc', 0, 0, 1, 8, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (20, N'B???n th???y chuy??n m??n gi???ng d???y c???a c??c gi???ng vi??n trong tr?????ng nh?? th??? n??o
', N'abc', 0, 0, 4, 9, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (21, N'Kh???i l?????ng ki???n th???c c???a 1 m??n h???c nh?? th??? n??o', N'abc', 0, 0, 4, 10, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (22, N'Ch???t l?????ng c???a c??c kh??a h???c coursera c?? ?????m b???o kh??ng', N'abc', 0, 0, 4, 11, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (23, N'B???n c?? ??i???u g?? ch??a h??i l??ng v??? coursera', N'abc', 0, 0, 3, 12, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (24, N'B???n th???y check ?????o v??n c???a coursera nh?? th??? n??o
', N'abc', 0, 0, 1, 13, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (26, N'Nh???ng g?? b???n ???? ti???p thu ???????c sau nh???ng kh??a h???c nh?? th??? n??o
', N'abc', 0, 0, 2, 14, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (27, N'Theo b???n, l???i ??ch c???a vi???c h???c m??n vovinam l?? g??', N'abc', 0, 0, 2, 15, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (28, N'B???n c?? mu???n tr?????ng m??? r???ng th??m m??n v?? kh??ng,l?? do
', N'abc', 0, 0, 1, 16, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (29, N'B???n c?? c???m nh???n g?? v??? m??n nh???c c??? truy???n th???ng
', N'abc', 0, 0, 3, 17, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
GO
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (30, N'B???n ?????t ???????c g?? sau khi h???c m??n nh???c c??? truy???n th???ng
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
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (18, N'Nh??? nh??ng', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (19, N'V???a ?????', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (20, N'R???t n???ng', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (22, N'Other:', 1, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (23, N'Chuy??n nghi???p', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (24, N'Thi???u chuy??n nghi???p', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (25, N'B??nh th?????ng', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (26, N'K??m', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (27, N'G???t g???ng', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (28, N'C?? x??? kh??ng ????ng m???c
', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (29, N'Th??i ????? l??m vi???c ch???m ch???p', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (30, N'Phong c??ch l??m vi???c thi???u chuy??n nghi???p', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (31, N'R???t hi???u qu??? ', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (32, N'Kh??ng hi???u qu???', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (34, N'B??nh th?????ng', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (35, N'C??n nhi???u thi???u s??t', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (36, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (37, N'C?? ', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 28)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (38, N'Kh??ng', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 28)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (39, N'L?? do', 1, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 28)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (41, N'Nhi???t t??nh', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (42, N'Th??n thi???n', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (43, N'H??i h?????c', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (44, N'T????ng t??c v???i sinh vi??n
', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (46, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (47, N'X??y d???ng nguy??n l?? ?????o ?????c ngh??? nghi???p
', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (48, N'C??c v???n ????? ?????o ?????c ngh??? nghi???p', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (49, N'C??c ki???n th???c c??n b???n c???a kh??a h???c ????', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (50, N'C??ch l??m vi???c', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (51, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (52, N'R??n luy???n s???c kh???e', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (53, N'N??ng cao tinh th???n v?? ?????o', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (54, N'T??? v???', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (55, N'Bi???u di???n c??c b??i v?? ?????p m???t', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (56, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (57, N'C??ch ch??i nh???c c???', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 30)
GO
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (58, N'L???ch s??? nh???c c???', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 30)
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
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (4, 1, N'Nhi???u thi???u s??t', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (5, 2, N'Kh??ng ?????m b???o ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (6, 3, N' B??nh th?????ng ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (7, 4, N'T???t', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (8, 5, N' R???t t???t
', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (10, 1, N'R???t t???', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (11, 2, N'T???  ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (12, 3, N' B??nh th?????ng  ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (13, 4, N'T???t', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (14, 5, N'R???t t???t', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (15, 1, N'R???t ??t', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (16, 2, N'  ??t', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (17, 3, N'B??nh th?????ng ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (18, 4, N'Nhi???u', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (19, 5, N' R???t nhi???u', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (20, 1, N'R???t t???', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (22, 2, N'T??? ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (23, 3, N'B??nh th?????ng', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (24, 4, N'T???t', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
GO
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (25, 5, N'R???t t???t', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
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
