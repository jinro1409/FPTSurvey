USE [FinalFUSurvey]
GO
/****** Object:  Table [dbo].[AssignedStudent]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedStudent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[survey_id] [int] NOT NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[status] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[choice_label] [nvarchar](50) NOT NULL,
	[is_other_choice] [bit] NOT NULL,
	[order] [int] NOT NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[status] [bit] NOT NULL,
	[question_id] [int] NOT NULL,
 CONSTRAINT [PK_Choice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinearScale]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinearScale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[scale_number] [int] NOT NULL,
	[scale_label] [nvarchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NOT NULL,
	[updated_by] [datetime] NULL,
	[status] [bit] NOT NULL,
	[question_id] [int] NOT NULL,
 CONSTRAINT [PK_LinearScale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](200) NOT NULL,
	[description] [nvarchar](400) NULL,
	[require] [bit] NOT NULL,
	[point_scale] [float] NOT NULL,
	[question_category_id] [int] NOT NULL,
	[order] [int] NOT NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
	[section_id] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[description] [nvarchar](300) NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_QuestionCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponsedChoiceAnswer]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsedChoiceAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[survey_response_id] [int] NOT NULL,
	[choice_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_ReponsedChoiceAnswer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponsedLinearScaleAnswer]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsedLinearScaleAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[survey_response_id] [int] NOT NULL,
	[linear_scale_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_ReponsedLinearScaleAnswer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponsedOtherChoiceAnswer]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsedOtherChoiceAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reponsed_choice_answer_id] [int] NOT NULL,
	[text] [nvarchar](300) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_ResponsedOtherChoiceAnswer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponsedTextAnswer]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsedTextAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[survey_response_id] [int] NOT NULL,
	[text] [nvarchar](400) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
	[text_answer_id] [int] NOT NULL,
 CONSTRAINT [PK_ResponseTextAnswer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](20) NOT NULL,
	[permission] [nvarchar](100) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](300) NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[survey_id] [int] NOT NULL,
	[order] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nchar](10) NOT NULL,
	[description] [nvarchar](300) NULL,
	[open_time] [datetime] NOT NULL,
	[close_time] [datetime] NOT NULL,
	[survey_category_id] [int] NOT NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[is_require] [bit] NOT NULL,
	[is_score_taken] [bit] NOT NULL,
	[is_public] [bit] NOT NULL,
	[is_changing_allow] [bit] NOT NULL,
	[background_color] [nchar](10) NULL,
	[background_image] [varchar](400) NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyCategory]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[description] [nvarchar](200) NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_SurveyCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyResponse]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyResponse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[survey_id] [int] NOT NULL,
	[created_at] [date] NOT NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_SurveyResponse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextAnswer]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[label] [nvarchar](20) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[created_by] [int] NOT NULL,
	[updated_by] [int] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_TextAnswer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/14/2022 9:22:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Choice] ON 

INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (1, N'A', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (2, N'B', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (3, N'C', 1, 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (4, N'AA', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (5, N'BB', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (6, N'MC', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (7, N'MA', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (8, N'C', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (9, N'F', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (10, N'Y', 0, 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 4)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (11, N'R', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (12, N'E', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (13, N'U', 0, 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (14, N'Y', 1, 4, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (15, N'RR', 0, 1, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 6)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (16, N'EE', 0, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 6)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (18, N'Nhẹ nhàng', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (19, N'Vừa đủ', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (20, N'Rất nặng', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (22, N'Other:', 1, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 9)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (23, N'Chuyên nghiệp', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (24, N'Thiếu chuyên nghiệp', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (25, N'Bình thường', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (26, N'Kém', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 13)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (27, N'Gắt gỏng', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (28, N'Cư xử không đúng mực
', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (29, N'Thái độ làm việc chậm chạp', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (30, N'Phong cách làm việc thiếu chuyên nghiệp', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 19)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (31, N'Rất hiệu quả ', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (32, N'Không hiệu quả', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (34, N'Bình thường', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (35, N'Còn nhiều thiếu sót', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (36, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 24)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (37, N'Có ', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 28)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (38, N'Không', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 28)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (39, N'Lý do', 1, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 28)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (41, N'Nhiệt tình', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (42, N'Thân thiện', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (43, N'Hài hước', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (44, N'Tương tác với sinh viên
', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (46, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 18)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (47, N'Xây dựng nguyên lý đạo đức nghề nghiệp
', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (48, N'Các vấn đề đạo đức nghề nghiệp', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (49, N'Các kiến thức căn bản của khóa học đó', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (50, N'Cách làm việc', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (51, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 26)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (52, N'Rèn luyện sức khỏe', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (53, N'Nâng cao tinh thần võ đạo', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (54, N'Tự vệ', 0, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (55, N'Biểu diễn các bài võ đẹp mắt', 0, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (56, N'Other', 1, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 27)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (57, N'Cách chơi nhạc cụ', 0, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 30)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (58, N'Lịch sử nhạc cụ', 0, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 30)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (59, N'Other', 1, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 30)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (60, N'test', 0, 1, 1, CAST(N'2022-07-14T20:39:12.650' AS DateTime), NULL, NULL, 1, 31)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (61, N'test', 0, 2, 1, CAST(N'2022-07-14T20:39:12.650' AS DateTime), NULL, NULL, 1, 31)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (62, N'test', 0, 3, 1, CAST(N'2022-07-14T20:39:12.650' AS DateTime), NULL, NULL, 1, 31)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (63, N'test', 0, 1, 1, CAST(N'2022-07-14T20:39:12.653' AS DateTime), NULL, NULL, 1, 32)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (64, N'test', 0, 2, 1, CAST(N'2022-07-14T20:39:12.653' AS DateTime), NULL, NULL, 1, 32)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (65, N'test', 0, 1, 1, CAST(N'2022-07-14T20:49:29.490' AS DateTime), NULL, NULL, 1, 33)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (66, N'test', 0, 2, 1, CAST(N'2022-07-14T20:49:29.490' AS DateTime), NULL, NULL, 1, 33)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (67, N'test', 0, 1, 1, CAST(N'2022-07-14T20:49:29.493' AS DateTime), NULL, NULL, 1, 34)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (68, N'test', 0, 2, 1, CAST(N'2022-07-14T20:49:29.493' AS DateTime), NULL, NULL, 1, 34)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (69, N'a', 0, 1, 1, CAST(N'2022-07-14T20:51:55.253' AS DateTime), NULL, NULL, 1, 36)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (70, N'a', 0, 2, 1, CAST(N'2022-07-14T20:51:55.253' AS DateTime), NULL, NULL, 1, 36)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (71, N'a', 0, 3, 1, CAST(N'2022-07-14T20:51:55.253' AS DateTime), NULL, NULL, 1, 36)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (72, N'a', 0, 1, 1, CAST(N'2022-07-14T20:51:55.257' AS DateTime), NULL, NULL, 1, 37)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (73, N'a', 0, 2, 1, CAST(N'2022-07-14T20:51:55.257' AS DateTime), NULL, NULL, 1, 37)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (74, N'a', 0, 1, 1, CAST(N'2022-07-14T20:51:55.260' AS DateTime), NULL, NULL, 1, 38)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (75, N'a', 0, 2, 1, CAST(N'2022-07-14T20:51:55.263' AS DateTime), NULL, NULL, 1, 38)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (76, N'a', 0, 1, 1, CAST(N'2022-07-14T20:51:55.263' AS DateTime), NULL, NULL, 1, 39)
INSERT [dbo].[Choice] ([id], [choice_label], [is_other_choice], [order], [created_by], [created_at], [updated_at], [updated_by], [status], [question_id]) VALUES (77, N'a', 0, 2, 1, CAST(N'2022-07-14T20:51:55.263' AS DateTime), NULL, NULL, 1, 39)
SET IDENTITY_INSERT [dbo].[Choice] OFF
SET IDENTITY_INSERT [dbo].[LinearScale] ON 

INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (1, 1, N'A', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 8)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (2, 2, N'B', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 8)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (3, 3, N'C', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 8)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (4, 1, N'Nhiều thiếu sót', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (5, 2, N'Không đảm bảo ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (6, 3, N' Bình thường ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (7, 4, N'Tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (8, 5, N' Rất tốt
', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 12)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (10, 1, N'Rất tệ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (11, 2, N'Tệ  ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (12, 3, N' Bình thường  ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (13, 4, N'Tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (14, 5, N'Rất tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 20)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (15, 1, N'Rất ít', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (16, 2, N'  Ít', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (17, 3, N'Bình thường ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (18, 4, N'Nhiều', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (19, 5, N' Rất nhiều', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 21)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (20, 1, N'Rất tệ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (22, 2, N'Tệ ', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (23, 3, N'Bình thường', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (24, 4, N'Tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (25, 5, N'Rất tốt', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 22)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (26, 1, N'a', CAST(N'2022-07-14T20:51:55.270' AS DateTime), NULL, 1, NULL, 1, 42)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (27, 2, N'a', CAST(N'2022-07-14T20:51:55.270' AS DateTime), NULL, 1, NULL, 1, 42)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (28, 1, N'a', CAST(N'2022-07-14T20:51:55.270' AS DateTime), NULL, 1, NULL, 1, 43)
INSERT [dbo].[LinearScale] ([id], [scale_number], [scale_label], [created_at], [updated_at], [created_by], [updated_by], [status], [question_id]) VALUES (29, 2, N'a', CAST(N'2022-07-14T20:51:55.270' AS DateTime), NULL, 1, NULL, 1, 43)
SET IDENTITY_INSERT [dbo].[LinearScale] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (1, N'Đồ ăn được chế biến tại căng tin của nhà trường có ngon miệng không', N'abc', 1, 0, 1, 1, 1, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (2, N'Bạn có thường xuyên gặp tình trạng tắc đường ở bãi gửi xe lúc bắt đầu giờ học và lúc kết thúc giờ học không
', N'abc', 1, 0, 1, 2, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (3, N'Giá cả đồ ăn ở căng tin như thế nào ?', N'abc', 1, 0, 1, 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (4, N'Bạn muốn nhà trường cải thiện cơ sở vật chất nào ?
', N'abc', 1, 0, 2, 4, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (5, N'Thái độ phục vụ ở căng tin ?', N'abc', 1, 0, 2, 5, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (6, N'Điểm tốt về giáo viên giảng dạy tại trường', N'abc', 1, 0, 2, 6, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (7, N'Thời gian giáo viên phản hồi các thắc mắc của bạn là bao lâu?
', N'abc', 1, 0, 3, 7, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (8, N'Khối lượng kiến thức của bài giảng giáo viên truyền tải như thế nào', N'abc', 0, 0, 4, 8, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1, 2)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (9, N'Khối lượng bài tập về nhà của giảng viên như thế nào
', N'abc', 0, 0, 1, 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (12, N'Khối lượng kiến thức của bài giảng giáo viên truyền tải như thế nào', N'abc', 0, 0, 4, 2, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (13, N'Bạn thấy phương pháp giảng dạy của thầy/cô như thế nào
', N'abc', 0, 0, 1, 3, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (14, N'Bạn thường liên lạc với giáo viên ngoài giờ học như thế nào?', N'abc', 0, 0, 3, 4, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (15, N'Thời gian giáo viên phản hồi các thắc mắc của bạn là bao lâu?
', N'abc', 0, 0, 3, 5, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (18, N'Điểm tốt về giáo viên giảng dạy tại trường
', N'abc', 0, 0, 2, 7, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (19, N'Điểm chưa tốt về giáo viên trong trường', N'abc', 0, 0, 1, 8, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (20, N'Bạn thấy chuyên môn giảng dạy của các giảng viên trong trường như thế nào
', N'abc', 0, 0, 4, 9, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (21, N'Khối lượng kiến thức của 1 môn học như thế nào', N'abc', 0, 0, 4, 10, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (22, N'Chất lượng của các khóa học coursera có đảm bảo không', N'abc', 0, 0, 4, 11, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (23, N'Bạn có điều gì chưa hài lòng về coursera', N'abc', 0, 0, 3, 12, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (24, N'Bạn thấy check đạo văn của coursera như thế nào
', N'abc', 0, 0, 1, 13, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (26, N'Những gì bạn đã tiếp thu được sau những khóa học như thế nào
', N'abc', 0, 0, 2, 14, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (27, N'Theo bạn, lợi ích của việc học môn vovinam là gì', N'abc', 0, 0, 2, 15, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (28, N'Bạn có muốn trường mở rộng thêm môn võ không,lý do
', N'abc', 0, 0, 1, 16, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (29, N'Bạn có cảm nhận gì về môn nhạc cụ truyền thống
', N'abc', 0, 0, 3, 17, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (30, N'Bạn đạt được gì sau khi học môn nhạc cụ truyền thống
', N'abc', 0, 0, 2, 18, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 5)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (31, N'Multiple 1 answer', NULL, 1, 0, 1, 1, 1, CAST(N'2022-07-14T20:39:12.647' AS DateTime), NULL, NULL, 1, 7)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (32, N'Multiple 1 answer', NULL, 0, 0, 1, 1, 1, CAST(N'2022-07-14T20:39:12.650' AS DateTime), NULL, NULL, 1, 7)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (33, N'Multiple 1 answer', NULL, 1, 0, 1, 1, 1, CAST(N'2022-07-14T20:49:29.487' AS DateTime), NULL, NULL, 1, 8)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (34, N'Multiple 1 answer', NULL, 0, 0, 1, 1, 1, CAST(N'2022-07-14T20:49:29.490' AS DateTime), NULL, NULL, 1, 8)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (35, N'abc', NULL, 1, 0, 2, 1, 1, CAST(N'2022-07-14T20:49:29.497' AS DateTime), NULL, NULL, 1, 8)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (36, N'abc', NULL, 1, 0, 1, 1, 1, CAST(N'2022-07-14T20:51:55.250' AS DateTime), NULL, NULL, 1, 9)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (37, N'abc', NULL, 0, 0, 1, 1, 1, CAST(N'2022-07-14T20:51:55.257' AS DateTime), NULL, NULL, 1, 9)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (38, N'abc', NULL, 1, 0, 2, 1, 1, CAST(N'2022-07-14T20:51:55.260' AS DateTime), NULL, NULL, 1, 9)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (39, N'abc', NULL, 0, 0, 2, 1, 1, CAST(N'2022-07-14T20:51:55.263' AS DateTime), NULL, NULL, 1, 9)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (40, N'abc', NULL, 1, 0, 3, 2, 1, CAST(N'2022-07-14T20:51:55.263' AS DateTime), NULL, NULL, 1, 10)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (41, N'abc', NULL, 0, 0, 3, 2, 1, CAST(N'2022-07-14T20:51:55.267' AS DateTime), NULL, NULL, 1, 10)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (42, N'abc', NULL, 1, 0, 4, 2, 1, CAST(N'2022-07-14T20:51:55.267' AS DateTime), NULL, NULL, 1, 10)
INSERT [dbo].[Question] ([id], [question], [description], [require], [point_scale], [question_category_id], [order], [created_by], [created_at], [updated_by], [updated_at], [status], [section_id]) VALUES (43, N'abc', NULL, 0, 0, 4, 2, 1, CAST(N'2022-07-14T20:51:55.270' AS DateTime), NULL, NULL, 1, 10)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionCategory] ON 

INSERT [dbo].[QuestionCategory] ([id], [name], [description], [status]) VALUES (1, N'SingleChoice', N'This is multiple 1 answer', NULL)
INSERT [dbo].[QuestionCategory] ([id], [name], [description], [status]) VALUES (2, N'MultipleChoice', N'This is multiple choice many answers', NULL)
INSERT [dbo].[QuestionCategory] ([id], [name], [description], [status]) VALUES (3, N'TextAnswer', N'This is text answer', NULL)
INSERT [dbo].[QuestionCategory] ([id], [name], [description], [status]) VALUES (4, N'LinearScale', N'This is ranking answer', NULL)
SET IDENTITY_INSERT [dbo].[QuestionCategory] OFF
SET IDENTITY_INSERT [dbo].[ResponsedChoiceAnswer] ON 

INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (1, 5021, 1, CAST(N'2022-07-13T19:45:06.173' AS DateTime), CAST(N'2022-07-13T19:45:06.173' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (2, 5021, 5, CAST(N'2022-07-13T19:45:06.177' AS DateTime), CAST(N'2022-07-13T19:45:06.177' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (3, 5021, 7, CAST(N'2022-07-13T19:45:06.177' AS DateTime), CAST(N'2022-07-13T19:45:06.177' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (4, 5021, 8, CAST(N'2022-07-13T19:45:06.177' AS DateTime), CAST(N'2022-07-13T19:45:06.177' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (5, 5021, 9, CAST(N'2022-07-13T19:45:06.177' AS DateTime), CAST(N'2022-07-13T19:45:06.177' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (6, 5021, 13, CAST(N'2022-07-13T19:45:06.177' AS DateTime), CAST(N'2022-07-13T19:45:06.177' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (7, 5021, 14, CAST(N'2022-07-13T19:45:06.177' AS DateTime), CAST(N'2022-07-13T19:45:06.177' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (8, 5021, 16, CAST(N'2022-07-13T19:45:06.180' AS DateTime), CAST(N'2022-07-13T19:45:06.180' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (9, 5020, 2, CAST(N'2022-07-13T20:02:13.480' AS DateTime), CAST(N'2022-07-13T20:02:13.480' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (10, 5020, 5, CAST(N'2022-07-13T20:02:13.480' AS DateTime), CAST(N'2022-07-13T20:02:13.480' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (11, 5020, 6, CAST(N'2022-07-13T20:02:13.480' AS DateTime), CAST(N'2022-07-13T20:02:13.480' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (12, 5020, 8, CAST(N'2022-07-13T20:02:13.487' AS DateTime), CAST(N'2022-07-13T20:02:13.487' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (13, 5020, 9, CAST(N'2022-07-13T20:02:13.487' AS DateTime), CAST(N'2022-07-13T20:02:13.487' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (14, 5020, 12, CAST(N'2022-07-13T20:02:13.487' AS DateTime), CAST(N'2022-07-13T20:02:13.487' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (15, 5020, 13, CAST(N'2022-07-13T20:02:13.487' AS DateTime), CAST(N'2022-07-13T20:02:13.487' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (16, 5020, 14, CAST(N'2022-07-13T20:02:13.487' AS DateTime), CAST(N'2022-07-13T20:02:13.487' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (17, 5020, 15, CAST(N'2022-07-13T20:02:13.490' AS DateTime), CAST(N'2022-07-13T20:02:13.490' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (18, 5022, 22, CAST(N'2022-07-13T20:19:49.743' AS DateTime), CAST(N'2022-07-13T20:21:34.873' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (19, 5022, 23, CAST(N'2022-07-13T20:19:49.743' AS DateTime), CAST(N'2022-07-13T20:19:49.743' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (20, 5022, 44, CAST(N'2022-07-13T20:19:49.747' AS DateTime), CAST(N'2022-07-13T20:19:49.747' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (21, 5022, 27, CAST(N'2022-07-13T20:19:49.747' AS DateTime), CAST(N'2022-07-13T20:19:49.747' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (22, 5022, 36, CAST(N'2022-07-13T20:19:49.747' AS DateTime), CAST(N'2022-07-13T20:21:34.873' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (23, 5022, 47, CAST(N'2022-07-13T20:19:49.750' AS DateTime), CAST(N'2022-07-13T20:19:49.750' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (25, 5022, 49, CAST(N'2022-07-13T20:19:49.750' AS DateTime), CAST(N'2022-07-13T20:19:49.750' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (26, 5022, 52, CAST(N'2022-07-13T20:19:49.750' AS DateTime), CAST(N'2022-07-13T20:19:49.750' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (27, 5022, 54, CAST(N'2022-07-13T20:19:49.750' AS DateTime), CAST(N'2022-07-13T20:19:49.750' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (28, 5022, 38, CAST(N'2022-07-13T20:19:49.750' AS DateTime), CAST(N'2022-07-13T20:19:49.750' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (29, 5022, 57, CAST(N'2022-07-13T20:19:49.750' AS DateTime), CAST(N'2022-07-13T20:19:49.750' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (30, 5022, 46, CAST(N'2022-07-13T20:21:34.877' AS DateTime), CAST(N'2022-07-13T20:21:34.877' AS DateTime), 1)
INSERT [dbo].[ResponsedChoiceAnswer] ([id], [survey_response_id], [choice_id], [created_at], [updated_at], [status]) VALUES (31, 5022, 51, CAST(N'2022-07-13T20:21:34.917' AS DateTime), CAST(N'2022-07-13T20:21:34.917' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ResponsedChoiceAnswer] OFF
SET IDENTITY_INSERT [dbo].[ResponsedLinearScaleAnswer] ON 

INSERT [dbo].[ResponsedLinearScaleAnswer] ([id], [survey_response_id], [linear_scale_id], [created_at], [updated_at], [status]) VALUES (1, 5021, 1, CAST(N'2022-07-13T19:45:06.180' AS DateTime), CAST(N'2022-07-13T19:45:06.180' AS DateTime), 1)
INSERT [dbo].[ResponsedLinearScaleAnswer] ([id], [survey_response_id], [linear_scale_id], [created_at], [updated_at], [status]) VALUES (2, 5020, 3, CAST(N'2022-07-13T20:02:13.487' AS DateTime), CAST(N'2022-07-13T20:02:13.487' AS DateTime), 1)
INSERT [dbo].[ResponsedLinearScaleAnswer] ([id], [survey_response_id], [linear_scale_id], [created_at], [updated_at], [status]) VALUES (3, 5022, 8, CAST(N'2022-07-13T20:19:49.753' AS DateTime), CAST(N'2022-07-13T20:19:49.753' AS DateTime), 1)
INSERT [dbo].[ResponsedLinearScaleAnswer] ([id], [survey_response_id], [linear_scale_id], [created_at], [updated_at], [status]) VALUES (4, 5022, 14, CAST(N'2022-07-13T20:19:49.753' AS DateTime), CAST(N'2022-07-13T20:19:49.753' AS DateTime), 1)
INSERT [dbo].[ResponsedLinearScaleAnswer] ([id], [survey_response_id], [linear_scale_id], [created_at], [updated_at], [status]) VALUES (5, 5022, 19, CAST(N'2022-07-13T20:19:49.753' AS DateTime), CAST(N'2022-07-13T20:19:49.753' AS DateTime), 1)
INSERT [dbo].[ResponsedLinearScaleAnswer] ([id], [survey_response_id], [linear_scale_id], [created_at], [updated_at], [status]) VALUES (6, 5022, 23, CAST(N'2022-07-13T20:19:49.753' AS DateTime), CAST(N'2022-07-13T20:19:49.753' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ResponsedLinearScaleAnswer] OFF
SET IDENTITY_INSERT [dbo].[ResponsedOtherChoiceAnswer] ON 

INSERT [dbo].[ResponsedOtherChoiceAnswer] ([id], [reponsed_choice_answer_id], [text], [created_at], [updated_at], [status]) VALUES (1, 7, N'ád', CAST(N'2022-07-13T19:45:06.180' AS DateTime), CAST(N'2022-07-13T19:45:06.180' AS DateTime), 1)
INSERT [dbo].[ResponsedOtherChoiceAnswer] ([id], [reponsed_choice_answer_id], [text], [created_at], [updated_at], [status]) VALUES (2, 16, N'abc', CAST(N'2022-07-13T20:02:13.490' AS DateTime), CAST(N'2022-07-13T20:02:13.490' AS DateTime), 1)
INSERT [dbo].[ResponsedOtherChoiceAnswer] ([id], [reponsed_choice_answer_id], [text], [created_at], [updated_at], [status]) VALUES (3, 22, N'abc', CAST(N'2022-07-13T20:19:49.750' AS DateTime), CAST(N'2022-07-13T20:19:49.750' AS DateTime), 1)
INSERT [dbo].[ResponsedOtherChoiceAnswer] ([id], [reponsed_choice_answer_id], [text], [created_at], [updated_at], [status]) VALUES (4, 28, N'abc', CAST(N'2022-07-13T20:19:49.750' AS DateTime), CAST(N'2022-07-13T20:19:49.750' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ResponsedOtherChoiceAnswer] OFF
SET IDENTITY_INSERT [dbo].[ResponsedTextAnswer] ON 

INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (1, 5021, N'abc', CAST(N'2022-07-13T19:45:06.183' AS DateTime), CAST(N'2022-07-13T19:45:06.183' AS DateTime), 1, 2)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (2, 5021, N'ád', CAST(N'2022-07-13T19:45:06.183' AS DateTime), CAST(N'2022-07-13T19:45:06.183' AS DateTime), 1, 3)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (3, 5021, N'abc', CAST(N'2022-07-13T19:45:06.183' AS DateTime), CAST(N'2022-07-13T19:45:06.183' AS DateTime), 1, 1)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (4, 5020, N'abc', CAST(N'2022-07-13T20:02:13.483' AS DateTime), CAST(N'2022-07-13T20:02:13.483' AS DateTime), 1, 2)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (5, 5020, N'abc', CAST(N'2022-07-13T20:02:13.483' AS DateTime), CAST(N'2022-07-13T20:02:13.483' AS DateTime), 1, 3)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (6, 5020, N'abc', CAST(N'2022-07-13T20:02:13.483' AS DateTime), CAST(N'2022-07-13T20:02:13.483' AS DateTime), 1, 1)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (7, 5022, N'abc', CAST(N'2022-07-13T20:19:49.757' AS DateTime), CAST(N'2022-07-13T20:19:49.757' AS DateTime), 1, 4)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (8, 5022, N'abc', CAST(N'2022-07-13T20:19:49.757' AS DateTime), CAST(N'2022-07-13T20:19:49.757' AS DateTime), 1, 5)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (9, 5022, N'abc', CAST(N'2022-07-13T20:19:49.757' AS DateTime), CAST(N'2022-07-13T20:19:49.757' AS DateTime), 1, 11)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (10, 5022, N'abc', CAST(N'2022-07-13T20:19:49.757' AS DateTime), CAST(N'2022-07-13T20:19:49.757' AS DateTime), 1, 6)
INSERT [dbo].[ResponsedTextAnswer] ([id], [survey_response_id], [text], [created_at], [updated_at], [status], [text_answer_id]) VALUES (11, 5022, N'abc', CAST(N'2022-07-13T20:19:49.757' AS DateTime), CAST(N'2022-07-13T20:19:49.757' AS DateTime), 1, 7)
SET IDENTITY_INSERT [dbo].[ResponsedTextAnswer] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [role_name], [permission], [status]) VALUES (1, N'admin', N'abc', 1)
INSERT [dbo].[Role] ([id], [role_name], [permission], [status]) VALUES (2, N'user', N'view', 1)
INSERT [dbo].[Role] ([id], [role_name], [permission], [status]) VALUES (3, N'creator', N'1', 1)
INSERT [dbo].[Role] ([id], [role_name], [permission], [status]) VALUES (4, N'result', N'2', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (1, N'section1', N'abc', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 3, 1)
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (2, N'section 2', N'abc', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1, 4, 1)
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (3, N'Khảo sát về giảng viên', N'Khảo sát về giảng viên', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 2, 1, 1)
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (5, N'Khảo sát về môn học', N'Khảo sát về giảng viên', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, NULL, 2, 2, 1)
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (6, N'Section test 1', N'test ', 1, CAST(N'2022-07-14T20:34:19.203' AS DateTime), NULL, NULL, 3, 1, 1)
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (7, N'Section test 1', N'test ', 1, CAST(N'2022-07-14T20:39:12.643' AS DateTime), NULL, NULL, 4, 1, 1)
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (8, N'Section test 1', N'test ', 1, CAST(N'2022-07-14T20:49:29.483' AS DateTime), NULL, NULL, 5, 1, 1)
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (9, N'Section test 1', N'test ', 1, CAST(N'2022-07-14T20:51:55.247' AS DateTime), NULL, NULL, 6, 1, 1)
INSERT [dbo].[Section] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [survey_id], [order], [status]) VALUES (10, N'Section 2', N'test', 1, CAST(N'2022-07-14T20:51:55.263' AS DateTime), NULL, NULL, 6, 2, 1)
SET IDENTITY_INSERT [dbo].[Section] OFF
SET IDENTITY_INSERT [dbo].[Survey] ON 

INSERT [dbo].[Survey] ([id], [name], [code], [description], [open_time], [close_time], [survey_category_id], [created_by], [created_at], [is_require], [is_score_taken], [is_public], [is_changing_allow], [background_color], [background_image], [updated_by], [updated_at], [status]) VALUES (1, N'khao sat', N'1         ', N'abc', CAST(N'2022-06-27T00:00:00.000' AS DateTime), CAST(N'2022-06-30T00:00:00.000' AS DateTime), 1, 1, CAST(N'2022-04-09T00:00:00.000' AS DateTime), 0, 0, 1, 0, N'abc       ', N'abc', NULL, NULL, 1)
INSERT [dbo].[Survey] ([id], [name], [code], [description], [open_time], [close_time], [survey_category_id], [created_by], [created_at], [is_require], [is_score_taken], [is_public], [is_changing_allow], [background_color], [background_image], [updated_by], [updated_at], [status]) VALUES (2, N'Khảo sát sinh viên FU', N'2         ', N'Khảo sát về quá trình học tập của sinh viên FU', CAST(N'2022-02-02T00:00:00.000' AS DateTime), CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 0, 0, 1, 0, N'abc       ', N'abc', NULL, NULL, 1)
INSERT [dbo].[Survey] ([id], [name], [code], [description], [open_time], [close_time], [survey_category_id], [created_by], [created_at], [is_require], [is_score_taken], [is_public], [is_changing_allow], [background_color], [background_image], [updated_by], [updated_at], [status]) VALUES (3, N'Test', N'GTN0000001', N'survey test', CAST(N'2022-07-08T20:29:00.000' AS DateTime), CAST(N'2022-07-15T20:29:00.000' AS DateTime), 1, 1, CAST(N'2022-07-14T20:34:19.200' AS DateTime), 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Survey] ([id], [name], [code], [description], [open_time], [close_time], [survey_category_id], [created_by], [created_at], [is_require], [is_score_taken], [is_public], [is_changing_allow], [background_color], [background_image], [updated_by], [updated_at], [status]) VALUES (4, N'Test', N'GTN0000001', N'test survey', CAST(N'2022-07-04T20:36:00.000' AS DateTime), CAST(N'2022-07-14T20:36:00.000' AS DateTime), 1, 1, CAST(N'2022-07-14T20:39:12.643' AS DateTime), 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Survey] ([id], [name], [code], [description], [open_time], [close_time], [survey_category_id], [created_by], [created_at], [is_require], [is_score_taken], [is_public], [is_changing_allow], [background_color], [background_image], [updated_by], [updated_at], [status]) VALUES (5, N'Test', N'GTN0000001', N'survey test', CAST(N'2022-07-07T20:47:00.000' AS DateTime), CAST(N'2022-07-16T20:47:00.000' AS DateTime), 1, 1, CAST(N'2022-07-14T20:49:29.480' AS DateTime), 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Survey] ([id], [name], [code], [description], [open_time], [close_time], [survey_category_id], [created_by], [created_at], [is_require], [is_score_taken], [is_public], [is_changing_allow], [background_color], [background_image], [updated_by], [updated_at], [status]) VALUES (6, N'Test', N'GTN0000001', N'survey test', CAST(N'2022-07-07T20:51:00.000' AS DateTime), CAST(N'2022-07-15T20:51:00.000' AS DateTime), 1, 1, CAST(N'2022-07-14T20:51:55.243' AS DateTime), 0, 0, 0, 0, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Survey] OFF
SET IDENTITY_INSERT [dbo].[SurveyCategory] ON 

INSERT [dbo].[SurveyCategory] ([id], [name], [description], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (1, N'Khao sat', N'abc', 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SurveyCategory] OFF
SET IDENTITY_INSERT [dbo].[SurveyResponse] ON 

INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (3020, N'cuonghphel140309@fpt.edu.vn', 1, CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11T22:48:15.747' AS DateTime), 1)
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (3021, N'cuonghphe140l3l09@fpt.edu.vn', 2, CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11T23:20:58.033' AS DateTime), 1)
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (4020, N'chuongnnhe140285q@fpt.edu.vn', 1, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T08:23:09.420' AS DateTime), 1)
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (4021, N'chuongnnhe14028q5@fpt.edu.vn', 2, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T08:24:53.203' AS DateTime), 1)
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (4023, N'chuongnnhe1402qqq85@fpt.edu.vn', 2, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T08:49:02.370' AS DateTime), 1)
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (4024, N'chuongnnhe1402805@fpt.edu.vn', 1, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T09:44:48.060' AS DateTime), 1)
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (5020, N'chuongnnhe140285@fpt.edu.vn', 1, CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12T15:00:57.587' AS DateTime), 1)
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (5021, N'truonghdhe140305@fpt.edu.vn', 1, CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13T19:45:06.170' AS DateTime), 1)
INSERT [dbo].[SurveyResponse] ([id], [email], [survey_id], [created_at], [updated_at], [status]) VALUES (5022, N'truonghdhe140305@fpt.edu.vn', 2, CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13T20:19:49.743' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SurveyResponse] OFF
SET IDENTITY_INSERT [dbo].[TextAnswer] ON 

INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (1, 7, N'abc', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (2, 3, N'abc', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (3, 6, N'abc', CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (4, 14, N'abc', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (5, 15, N'abc', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, 1, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (6, 23, N'abc', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (7, 29, N'abc', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (11, 19, N'abc1', CAST(N'2022-02-02T00:00:00.000' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (12, 34, NULL, CAST(N'2022-07-14T20:49:29.493' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (13, 37, NULL, CAST(N'2022-07-14T20:51:55.257' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (14, 40, NULL, CAST(N'2022-07-14T20:51:55.267' AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[TextAnswer] ([id], [question_id], [label], [created_at], [updated_at], [created_by], [updated_by], [status]) VALUES (15, 41, NULL, CAST(N'2022-07-14T20:51:55.267' AS DateTime), NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[TextAnswer] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [email], [role_id], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (1, N'an', N'anntdhe140298@fpt.edu.vn', 3, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[User] ([id], [name], [email], [role_id], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (7, N'1', N'hieumthe141628@fpt.edu.vn', 4, 1, CAST(N'2022-06-27T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[User] ([id], [name], [email], [role_id], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (8, N'hailvhe141667@fpt.edu.vn', N'hailvhe141667@fpt.edu.vn', 3, 7, CAST(N'2022-06-30T22:07:04.900' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[User] ([id], [name], [email], [role_id], [created_by], [created_at], [updated_by], [updated_at], [status]) VALUES (9, N'cuonghphe140309@fpt.edu.vn', N'cuonghphe140309@fpt.edu.vn', 2, 7, CAST(N'2022-06-30T22:57:47.910' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[AssignedStudent]  WITH CHECK ADD  CONSTRAINT [FK_Assigned_Student_Survey] FOREIGN KEY([survey_id])
REFERENCES [dbo].[Survey] ([id])
GO
ALTER TABLE [dbo].[AssignedStudent] CHECK CONSTRAINT [FK_Assigned_Student_Survey]
GO
ALTER TABLE [dbo].[Choice]  WITH CHECK ADD  CONSTRAINT [FK_Choice_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_Question]
GO
ALTER TABLE [dbo].[LinearScale]  WITH CHECK ADD  CONSTRAINT [FK_LinearScale_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[LinearScale] CHECK CONSTRAINT [FK_LinearScale_Question]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionCategory] FOREIGN KEY([question_category_id])
REFERENCES [dbo].[QuestionCategory] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionCategory]
GO
ALTER TABLE [dbo].[ResponsedChoiceAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ReponsedChoiceAnswer_Choice] FOREIGN KEY([choice_id])
REFERENCES [dbo].[Choice] ([id])
GO
ALTER TABLE [dbo].[ResponsedChoiceAnswer] CHECK CONSTRAINT [FK_ReponsedChoiceAnswer_Choice]
GO
ALTER TABLE [dbo].[ResponsedChoiceAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ReponsedChoiceAnswer_SurveyResponse] FOREIGN KEY([survey_response_id])
REFERENCES [dbo].[SurveyResponse] ([id])
GO
ALTER TABLE [dbo].[ResponsedChoiceAnswer] CHECK CONSTRAINT [FK_ReponsedChoiceAnswer_SurveyResponse]
GO
ALTER TABLE [dbo].[ResponsedLinearScaleAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ReponsedLinearScaleAnswer_LinearScale] FOREIGN KEY([linear_scale_id])
REFERENCES [dbo].[LinearScale] ([id])
GO
ALTER TABLE [dbo].[ResponsedLinearScaleAnswer] CHECK CONSTRAINT [FK_ReponsedLinearScaleAnswer_LinearScale]
GO
ALTER TABLE [dbo].[ResponsedLinearScaleAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ReponsedLinearScaleAnswer_SurveyResponse] FOREIGN KEY([survey_response_id])
REFERENCES [dbo].[SurveyResponse] ([id])
GO
ALTER TABLE [dbo].[ResponsedLinearScaleAnswer] CHECK CONSTRAINT [FK_ReponsedLinearScaleAnswer_SurveyResponse]
GO
ALTER TABLE [dbo].[ResponsedOtherChoiceAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ResponsedOtherChoiceAnswer_ReponsedChoiceAnswer] FOREIGN KEY([reponsed_choice_answer_id])
REFERENCES [dbo].[ResponsedChoiceAnswer] ([id])
GO
ALTER TABLE [dbo].[ResponsedOtherChoiceAnswer] CHECK CONSTRAINT [FK_ResponsedOtherChoiceAnswer_ReponsedChoiceAnswer]
GO
ALTER TABLE [dbo].[ResponsedTextAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ResponseTextAnswer_SurveyResponse1] FOREIGN KEY([survey_response_id])
REFERENCES [dbo].[SurveyResponse] ([id])
GO
ALTER TABLE [dbo].[ResponsedTextAnswer] CHECK CONSTRAINT [FK_ResponseTextAnswer_SurveyResponse1]
GO
ALTER TABLE [dbo].[ResponsedTextAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ResponseTextAnswer_TextAnswer1] FOREIGN KEY([text_answer_id])
REFERENCES [dbo].[TextAnswer] ([id])
GO
ALTER TABLE [dbo].[ResponsedTextAnswer] CHECK CONSTRAINT [FK_ResponseTextAnswer_TextAnswer1]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Survey] FOREIGN KEY([survey_id])
REFERENCES [dbo].[Survey] ([id])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Survey]
GO
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_User] FOREIGN KEY([created_by])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_User]
GO
ALTER TABLE [dbo].[SurveyResponse]  WITH CHECK ADD  CONSTRAINT [FK_SurveyResponse_Survey] FOREIGN KEY([survey_id])
REFERENCES [dbo].[Survey] ([id])
GO
ALTER TABLE [dbo].[SurveyResponse] CHECK CONSTRAINT [FK_SurveyResponse_Survey]
GO
ALTER TABLE [dbo].[TextAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TextAnswer_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[TextAnswer] CHECK CONSTRAINT [FK_TextAnswer_Question]
GO
