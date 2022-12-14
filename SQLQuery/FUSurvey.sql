USE [FinalFUSurvey1]
GO
/****** Object:  Table [dbo].[AssignedStudent]    Script Date: 9/5/2022 10:39:22 PM ******/
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
/****** Object:  Table [dbo].[Choice]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[choice_label] [nvarchar](500) NOT NULL,
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
/****** Object:  Table [dbo].[LinearScale]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinearScale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[scale_number] [int] NOT NULL,
	[scale_label] [nvarchar](500) NOT NULL,
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
/****** Object:  Table [dbo].[Question]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[QuestionCategory]    Script Date: 9/5/2022 10:39:22 PM ******/
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
/****** Object:  Table [dbo].[ResponsedChoiceAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
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
/****** Object:  Table [dbo].[ResponsedLinearScaleAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
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
/****** Object:  Table [dbo].[ResponsedOtherChoiceAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsedOtherChoiceAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reponsed_choice_answer_id] [int] NOT NULL,
	[text] [nvarchar](500) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_ResponsedOtherChoiceAnswer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponsedTextAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponsedTextAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[survey_response_id] [int] NOT NULL,
	[text] [nvarchar](500) NOT NULL,
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
/****** Object:  Table [dbo].[Role]    Script Date: 9/5/2022 10:39:22 PM ******/
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
/****** Object:  Table [dbo].[Section]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[survey_id] [int] NOT NULL,
	[order] [int] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[code] [varchar](20) NOT NULL,
	[description] [nvarchar](2000) NULL,
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
/****** Object:  Table [dbo].[SurveyCategory]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NULL,
	[created_by] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
	[code_prefix] [varchar](16) NULL,
 CONSTRAINT [PK_SurveyCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyResponse]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyResponse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[survey_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_SurveyResponse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[label] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[User]    Script Date: 9/5/2022 10:39:22 PM ******/
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
ALTER TABLE [dbo].[AssignedStudent]  WITH NOCHECK ADD  CONSTRAINT [FK_Assigned_Student_Survey] FOREIGN KEY([survey_id])
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
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Section] FOREIGN KEY([section_id])
REFERENCES [dbo].[Section] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Section]
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
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_SurveyCategory] FOREIGN KEY([survey_category_id])
REFERENCES [dbo].[SurveyCategory] ([id])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_SurveyCategory]
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
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  StoredProcedure [dbo].[findAll_Role]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findAll_Role]
as
begin
	select * from [Role]

	end
GO
/****** Object:  StoredProcedure [dbo].[findAll_User]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[findAll_User](
	@page int,
	@pagesize int,
	@search nvarchar(max) = '',
	@total_record int output
)
as
begin
	select * from
( select u.id as uid, u.name as uname, email, r.id as rid, r.role_name as rname, u.status,
ROW_NUMBER() over(order by u.id) as row_num 
from [Role] r inner join [User] u on r.id = u.role_id where email like '%'+@search+'%') as t 
where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)

	set @total_record = (select count(*) from [Role] r inner join [User] u on r.id = u.role_id where email like '%'+@search+'%')
end;
GO
/****** Object:  StoredProcedure [dbo].[Save_User]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Save_User](
		@mail nvarchar(50),
		@name nvarchar(50),
		@role_id int,
		@active bit,
		@assign int,
		@create_by int,
		@modify_by int = null,
		@ok int output
	)
	as
	begin
		declare @exit_email int = (select count(*) from [User] where email = @mail)
		if(@assign = 1)
			BEGIN
				if (@exit_email =0)
					BEGIN
						INSERT INTO [dbo].[User]
						   ([name]
						   ,[email]
						   ,[role_id]
						   ,[created_by]
						   ,[created_at]
						   ,[status])
					 VALUES
						   (@name
						   ,@mail
						   ,@role_id
						   ,@create_by
						   ,GETDATE()
						   ,@active)

					set @ok =1;
					RETURN
					END
				else 
					BEGIN
						set @ok =2;
						RETURN
					END
			END;

		else
			BEGIN
				if (@exit_email>0) 
				BEGIN
						declare @id_email int = (select id from [User] u where u.email =@mail)
						 UPDATE [dbo].[User]
				   SET [name] = @name
					  ,[email] = @mail
					  ,[role_id] = @role_id
					  ,[updated_by] = @modify_by
					  ,[updated_at] = GETDATE()
					  ,[status] = @active
					 WHERE id = @id_email

					set @ok=3;
				 RETURN
				END;
			else 
				BEGIN
					set @ok = 4;
					RETURN
				END 
			END

		end
GO
/****** Object:  StoredProcedure [dbo].[saveAssignStudent]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[saveAssignStudent](
	@email nvarchar(100),
	@survey_id int,
	@created_by int,
	@status int
)
As 
BEGIN
INSERT INTO [dbo].[AssignedStudent]
           ([email]
           ,[survey_id]
           ,[created_by]
           ,[created_at]
           ,[status])
     VALUES
           (@email
           ,@survey_id
           ,@created_by
           ,GETDATE()
           ,@status)
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckSubmitedResponse]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCheckSubmitedResponse]
(@id int, @email varchar(50))
AS
SELECT * FROM 
SurveyResponse WHERE survey_id=@id AND email=@email
GO
/****** Object:  StoredProcedure [dbo].[spDeleteChoice]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteChoice](@id int)
AS
UPDATE [dbo].[Choice]
   SET status=0
 WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[spDeleteLinearScale]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteLinearScale](@id int)
AS
UPDATE [dbo].[LinearScale]
   SET status=0
   WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[spDeleteQuestion]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[spDeleteQuestion](@id int)
AS
UPDATE [dbo].Question
   SET status=0
    WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[spDeleteResponseChoiceAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteResponseChoiceAnswer](@id int )
AS
DELETE FROM [dbo].[ResponsedChoiceAnswer]
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteResponsedLinear]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteResponsedLinear](@id int)
AS
DELETE FROM [dbo].[ResponsedLinearScaleAnswer]
      WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[spDeleteResponsedText]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create PROCEDURE [dbo].[spDeleteResponsedText](@id int )
AS
DELETE FROM [dbo].ResponsedTextAnswer
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteResponseIsOtherChoiceAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteResponseIsOtherChoiceAnswer](@id int )
AS
DELETE FROM [dbo].[ResponsedOtherChoiceAnswer]
WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteSection]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteSection](@id int)
AS
UPDATE [dbo].Section
   SET status=0
    WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[spDeleteSurvey]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteSurvey](@id int)
AS
UPDATE [dbo].[Survey]
   SET status=0
    WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[spDeleteTextAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteTextAnswer](@id int)
AS
UPDATE [dbo].[TextAnswer]
   SET status=0
 WHERE id=@id

GO
/****** Object:  StoredProcedure [dbo].[spFindAllSurveyCategory]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFindAllSurveyCategory]
AS
BEGIN
	select * from SurveyCategory where status=1 order by created_at desc
END
GO
/****** Object:  StoredProcedure [dbo].[spFindAllSurveyCategorySearch]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[spFindAllSurveyCategorySearch]
(
	@page int,
	@pagesize int,
	@search nvarchar(max) = '',
	@total_record int output
)
AS
BEGIN
		select * from 
			(select *, ROW_NUMBER() over (order by id) as row_num from SurveyCategory where [name] like '%'+@search+'%') as t
		where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize) and status=1
		order by created_at desc
		
		set @total_record = (select count(*) from SurveyCategory
					where [name] like '%'+@search+'%' and status =1)
END

GO
/****** Object:  StoredProcedure [dbo].[spFindSurveyCategoryByID]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spFindSurveyCategoryByID](
	@id int,
	@ok nvarchar(max) output
)
AS
BEGIN
	if @id >0
		BEGIN
			declare @check_exited int = (select count(*) from SurveyCategory where id = @id 
			And status=1
			)
			if @check_exited >0
				BEGIN
					select * from SurveyCategory where id = @id
					set @ok = 'Find succes!'
					return;
				END
			else 
				BEGIN
					set @ok = 'ID does not exited!'
					return;
				END
		END
	else 
		BEGIN
			set @ok = 'ID is number positive!'
		END
	
END

GO
/****** Object:  StoredProcedure [dbo].[spFindUserByEmail]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spFindUserByEmail](
	@email nvarchar(max)
)
AS
BEGIN
	select  u.id as uid, u.name as uname, email, r.id as rid, r.role_name as rname, u.status as ustatus
	from [User] u inner join [Role] r on u.role_id = r.id
	where email =@email and u.status =1
END
GO
/****** Object:  StoredProcedure [dbo].[spFindUserByID]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spFindUserByID](
	@id int
)
AS
BEGIN
	select * from [User] where id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllAssignByEmail]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetAllAssignByEmail](@email nvarchar(50))
AS
SELECT DISTinct(s.id)
      ,[name]
      ,[code]
      
  FROM [dbo].[Survey]  s Join AssignedStudent ass on s.id=ass.survey_id
  where s.is_require=1 and ass.email=@email 
  and GETDATE() BETWEEN open_time and close_time and s.[status]=1
  and s.id not in (SELECT survey_id FROM SurveyResponse SR WHERE SR.email=@email)
GO
/****** Object:  StoredProcedure [dbo].[spGetAllAssignBySurveyID]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllAssignBySurveyID](
	@survey_id int
)
AS  
BEGIN
	Select * from AssignedStudent where survey_id = @survey_id
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurvey]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllSurvey]
AS
	BEGIN
	SELECT * FROM Survey 
	WHERE status=1
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurveyByEmail]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllSurveyByEmail](
@email nvarchar(100),
@is_response int
)
AS
BEGIN
	if @is_response = 1
		
			select DISTINCT s.id,s.name,code,description, open_time,close_time,survey_category_id,s.created_by,s.created_at,is_require,
				is_score_taken,is_public,is_changing_allow,background_color,background_image,s.updated_by,s.updated_at, s.status
			from Survey s inner join SurveyResponse sr on s.id=sr.survey_id where email=@email and s.status=1
			Order by s.created_at desc
	else if @is_response =0
			SELECT * FROM 
						(SELECT * FROM Survey WHERE Survey.ID not in(
							SELECT DISTINCT(S.ID) FROM 
							Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
						WHERE RS.email=@email) and is_public =1 and status =1
						UNION 
						SELECT DISTINCT S.* FROM Survey S JOIN AssignedStudent A ON S.id=A.survey_id
						WHERE A.email=@email anD S.is_public=0 AND S.id not in(
						
							SELECT DISTINCT(S.ID) FROM 
							Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
						WHERE RS.email=@email ) and s.status=1) AS S
						Order by S.created_at desc
						
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurveyByEmailSearch]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllSurveyByEmailSearch](
@email nvarchar(100),
@is_response int,
@page int,
	@pagesize int,
	@search nvarchar(max) = '',
	@total_record int output
)
AS
BEGIN
	if @is_response = 1
		Begin
			select * from 
			(select DISTINCT s.id,s.name,code,description, open_time,close_time,survey_category_id,s.created_by,s.created_at,is_require,
				is_score_taken,is_public,is_changing_allow,background_color,background_image,s.updated_by,s.updated_at, s.status,
				ROW_NUMBER() over(order by s.created_at desc) as row_num 
			from Survey s inner join SurveyResponse sr on s.id=sr.survey_id where email=@email and 
			(s.name like  '%'+@search+'%' or s.code like '%'+@search+'%') 
			 and s.status=1 ) as t
			where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)
			
			set @total_record = (select count(*) from 
			(select DISTINCT s.id,s.name,code,description, open_time,close_time,survey_category_id,s.created_by,s.created_at,is_require,
				is_score_taken,is_public,is_changing_allow,background_color,background_image,s.updated_by,s.updated_at, s.status
			from Survey s inner join SurveyResponse sr on s.id=sr.survey_id where email=@email and 
			(s.name like  '%'+@search+'%' or s.code like '%'+@search+'%')
			AND S.status=1) as t)
			END
	else if @is_response =0
			BEGIN
			select * from (
			select *,ROW_NUMBER() over(order by c.created_at desc) as row_num  from (
						SELECT * FROM Survey WHERE Survey.ID not in(
							SELECT DISTINCT(S.ID) FROM 
							Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
						WHERE RS.email=@email) and is_public =1 and status=1
						UNION 
						SELECT DISTINCT S.* FROM Survey S JOIN AssignedStudent A ON S.id=A.survey_id
						WHERE A.email=@email anD S.is_public=0 and s.status=1 AND S.id not in(
							SELECT DISTINCT(S.ID) FROM 
							Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
						WHERE RS.email=@email 
						)) as c where (c.name like  '%'+@search+'%' or c.code like '%'+@search+'%') and c.status=1) as t
				where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize) 
				

				set @total_record = (	select count(*) from (
				SELECT * FROM Survey WHERE Survey.ID not in(
							SELECT DISTINCT(S.ID) FROM 
							Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
						WHERE RS.email=@email) and status=1 and is_public =1
						UNION 
						SELECT DISTINCT S.* FROM Survey S JOIN AssignedStudent A ON S.id=A.survey_id
						WHERE A.email=@email and s.status=1 anD S.is_public=0 AND S.id not in(
							SELECT DISTINCT(S.ID) FROM 
							Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
						WHERE RS.email=@email and s.status=1
						)
				) as c where (c.name like  '%'+@search+'%' or c.code like '%'+@search+'%'))
			END
						
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurveyResponse]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllSurveyResponse](@id int)
AS
SELECT id, email, created_at FROM SurveyResponse WHERE survey_id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurveyResponseAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllSurveyResponseAnswer](@id int)
AS
SELECT sr.id, q.id as question_id,C.is_other_choice,c.choice_label, roca.text as other_text,rta.text,LS.scale_number as linear 
FROM SurveyResponse sr
LEFT JOIN ResponsedChoiceAnswer rca on rca.survey_response_id=sr.id 
LEFT JOIN ResponsedOtherChoiceAnswer roca on roca.reponsed_choice_answer_id=rca.id
LEFT JOIN Choice c on rca.choice_id=c.id
LEFT JOIN ResponsedLinearScaleAnswer rlsa on rlsa.survey_response_id=sr.id
LEFT JOIN LinearScale ls on rlsa.id=ls.id
LEFT JOIN ResponsedTextAnswer rta on rta.survey_response_id=sr.id
LEFT JOIN TextAnswer t on rta.text_answer_id=t.id
LEFT JOIN Question q on c.question_id=q.id or ls.question_id=q.id or t.question_id=q.id
WHERE SR.survey_id=@id AND
Q.status=1 AND (C.status=1 OR C.status IS NULL) AND (ls.status=1 OR ls.status IS NULL) AND (T.status=1 or T.status IS NULL) 
ORDER BY SR.id ASC, Q.id ASC
GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurveyResultSearch]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllSurveyResultSearch](
@page int,
	@pagesize int,
	@search nvarchar(max) = '',
	@categoryid int,
	@total_record int output
)
AS
	BEGIN
		declare @check_category_exited int = (select count(*) from SurveyCategory sc where sc.id =@categoryid);
		if @check_category_exited >0
			Begin
				select * from (
					SELECT [id] ,[name],[code] ,[description] ,[open_time],[close_time],[survey_category_id]
						  ,[created_by],[created_at],[is_require],[is_score_taken],[is_public],[is_changing_allow],[background_color]
						  ,[background_image] ,[updated_by],[updated_at],[status]
						  ,ROW_NUMBER() over (order by id) as row_num
					  FROM [dbo].[Survey] where ([name] like  '%'+@search+'%' or code like '%'+@search+'%') and survey_category_id = @categoryid) as t 
					  where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)

				set @total_record = (select count(*) from Survey s inner join SurveyCategory sc on s.survey_category_id = sc.id
					where (s.name like '%'+@search+'%' or s.code like '%'+@search+'%') and s.survey_category_id = @categoryid)
			End
		else  
			Begin
				select * from (
					SELECT [id] ,[name],[code] ,[description] ,[open_time],[close_time],[survey_category_id]
						  ,[created_by],[created_at],[is_require],[is_score_taken],[is_public],[is_changing_allow],[background_color]
						  ,[background_image] ,[updated_by],[updated_at],[status]
						  ,ROW_NUMBER() over (order by id) as row_num
					  FROM [dbo].[Survey] where [name] like  '%'+@search+'%' or code like '%'+@search+'%') as t 
					  where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)

				set @total_record = (select count(*) from Survey s where s.name like '%'+@search+'%' or s.code like '%'+@search+'%')
			End
END


GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurveySearch]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAllSurveySearch](
@page int,
	@pagesize int,
	@search nvarchar(max) = '',
	@categoryid int,
	@total_record int output
)
AS
	BEGIN
		declare @check_category_exited int = (select count(*) from SurveyCategory sc where sc.id =@categoryid);
		if @check_category_exited >0
			Begin
				select * from (
					SELECT [id] ,[name],[code] ,[description] ,[open_time],[close_time],[survey_category_id]
						  ,[created_by],[created_at],[is_require],[is_score_taken],[is_public],[is_changing_allow],[background_color]
						  ,[background_image] ,[updated_by],[updated_at],[status]
						  ,ROW_NUMBER() over (order by  created_at desc) as row_num
					  FROM [dbo].[Survey] where [name] like  '%'+@search+'%' and survey_category_id = @categoryid and status=1 ) as t 
					  where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)   Order by created_at desc

				set @total_record = (select count(*) from Survey s inner join SurveyCategory sc on s.survey_category_id = sc.id
					where s.name like '%'+@search+'%' and s.survey_category_id = @categoryid and s.status=1)
			End
		else  
			Begin
				select * from (
					SELECT [id] ,[name],[code] ,[description] ,[open_time],[close_time],[survey_category_id]
						  ,[created_by],[created_at],[is_require],[is_score_taken],[is_public],[is_changing_allow],[background_color]
						  ,[background_image] ,[updated_by],[updated_at],[status]
						  ,ROW_NUMBER() over (order by created_at desc) as row_num
					  FROM [dbo].[Survey] where [name] like  '%'+@search+'%' and status=1 ) as t 
					  where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)
					  Order by created_at desc
				set @total_record = (select count(*) from Survey s where s.name like '%'+@search+'%' and status=1)
			End
-- ORDER BY SE.[order] ASC,Q.[order] ASC, C.[order], L.scale_number
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurveyStatistic]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAllSurveyStatistic](
@page int,
	@pagesize int,
	@search nvarchar(max) = '',
	@categoryid int,
	@total_record int output
)
AS
	BEGIN
		declare @check_category_exited int = (select count(*) from SurveyCategory sc where sc.id =@categoryid);
		if @check_category_exited >0
			Begin
				select * from (
					SELECT s.[id]
      ,s.[name] as [name]
      ,[code]
	  ,sc.id as category_id
	  ,s.description as [description]
	  ,sc.name as category
	  ,s.open_time
	  ,s.close_time
	  , s.created_at 
      ,COUNT(sr.ID) AS count
						  ,ROW_NUMBER() over (order by s.created_at desc) as row_num
					  FROM [dbo].[Survey] s
					   JOIN SurveyCategory sc on s.survey_category_id=sc.id
  LEFT JOIN SurveyResponse SR ON SR.survey_id=S.id
					  where (s.[name] like  '%'+@search+'%' or code like '%'+@search+'%') and s.survey_category_id = @categoryid and s.status=1
					  GROUP BY S.id,S.name,S.code,s.description,sc.id,sc.name,s.open_time,close_time, s.created_at 
					  ) as t 
					  where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize) 
				set @total_record = (select count(*) from Survey s inner join SurveyCategory sc on s.survey_category_id = sc.id
					where (s.name like '%'+@search+'%' or s.code like '%'+@search+'%') and s.survey_category_id = @categoryid and s.status=1) 
			End
		else  
			Begin
				select * from (
					SELECT s.[id]
					,s.[name] as [name]
					,[code]
					,sc.id as category_id
					,s.description as [description]
					,sc.name as category
					,s.open_time
					,s.close_time
					,s.created_at
					,COUNT(sr.ID) AS count
						  ,ROW_NUMBER() over (order by s.created_at desc) as row_num
					  FROM [dbo].[Survey] s
					   JOIN SurveyCategory sc on s.survey_category_id=sc.id
  LEFT JOIN SurveyResponse SR ON SR.survey_id=S.id
  where (s.[name] like  '%'+@search+'%' or code like '%'+@search+'%') and s.status=1
    GROUP BY S.id,S.name,S.code,s.description,sc.id,sc.name,s.open_time,close_time,s.created_at ) as t 
					  where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize) 
					  

				set @total_record = (select count(*) from Survey s where (s.name like '%'+@search+'%' or s.code like '%'+@search+'%') and s.status=1)
			End
END
GO
/****** Object:  StoredProcedure [dbo].[spGetChoiceByQuestionID]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetChoiceByQuestionID](@id int)
AS
SELECT [id]
      ,[choice_label]
      ,[is_other_choice]
      ,[order]
      ,[created_by]
      ,[created_at]
      ,[updated_at]
      ,[updated_by]
      ,[status]
      ,[question_id]
  FROM [dbo].[Choice]
  WHERE question_id=@id AND status=1
  ORDER BY Choice.[order]
GO
/****** Object:  StoredProcedure [dbo].[spGetChoiceStatistic]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetChoiceStatistic](@id int)
AS
SELECT C.id,C.choice_label,c.is_other_choice,COUNT(RSC.ID) AS count
FROM Question Q
		 JOIN Choice C ON Q.ID=C.question_id
		 LEFT JOIN ResponsedChoiceAnswer RSC ON  RSC.choice_id=C.id
		 WHERE Q.ID=@id AND C.status=1 
		 GROUP BY C.id,C.choice_label,C.is_other_choice,C.[order]
		 ORDER BY C.[order]
GO
/****** Object:  StoredProcedure [dbo].[spGetInforByID]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetInforByID](@id int)
AS
SELECT survey_id
      ,[email]
      FROM [dbo].[SurveyResponse]
	  WHERE status=1 AND id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetLinearScaleByQuestionId]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[spGetLinearScaleByQuestionId](@id int)
AS
SELECT  [id]
      ,[scale_number]
      ,[scale_label]
      ,[created_at]
      ,[updated_at]
      ,[created_by]
      ,[updated_by]
      ,[status]
      ,[question_id]
  FROM [dbo].[LinearScale]
  WHERE question_id=@ID AND status=1
  ORDER BY [scale_number] ASC
GO
/****** Object:  StoredProcedure [dbo].[spGetLinearStatistic]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spGetLinearStatistic](@id int)
AS
SELECT C.id,C.scale_number,C.scale_label ,COUNT(RSC.id) AS count
FROM Question Q
		 JOIN LinearScale C ON Q.ID=C.question_id
		 Left  JOIN ResponsedLinearScaleAnswer RSC ON  RSC.linear_scale_id=C.id
		 WHERE Q.ID=@id AND C.status=1
		 GROUP BY C.id,C.scale_number,C.scale_label
		 ORDER BY C.scale_number
GO
/****** Object:  StoredProcedure [dbo].[spGetOtherChoiceStatistic]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetOtherChoiceStatistic](@id int)
AS
SELECT ROCA.text, COUNT(ROCA.id) as count
FROM Choice c  
	JOIN ResponsedChoiceAnswer RCA ON C.id=RCA.choice_id
	JOIN ResponsedOtherChoiceAnswer ROCA ON ROCA.reponsed_choice_answer_id=RCA.id
	
	WHERE C.id=@id AND C.status=1
	GROUP BY ROCA.text
GO
/****** Object:  StoredProcedure [dbo].[spGetQuestionBySectionId]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetQuestionBySectionId](@id int)
AS
BEGIN
SELECT [id]
      ,[question]
      ,[description]
      ,[require]
      ,[point_scale]
      ,[question_category_id]
      ,[order]
      ,[created_by]
      ,[created_at]
      ,[updated_by]
      ,[updated_at]
      ,[status]
      ,[section_id]
  FROM [dbo].[Question]
  WHERE section_id=@id AND status=1
  ORDER BY [Question].[order]
 END
GO
/****** Object:  StoredProcedure [dbo].[spGetQuestionCategoryById]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetQuestionCategoryById](@id int)
AS
SELECT [id]
      ,[name]
      ,[description]
  FROM [dbo].[QuestionCategory]
  WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetResponsesBySurveyID]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[spGetResponsesBySurveyID](@id int)
	AS
	SELECT id,email,created_at FROM SurveyResponse SR WHERE SR.survey_id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetSectionsBySurveyId]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spGetSectionsBySurveyId](@id int)
AS
BEGIN
SELECT [id]
      ,[name]
      ,[description]
      ,[created_by]
      ,[created_at]
      ,[updated_by]
      ,[updated_at]
      ,[survey_id]
      ,[order]
	  ,[status]
      FROM [dbo].[Section]
  WHERE survey_id=@id AND status=1
  ORDER BY [order]
END

GO
/****** Object:  StoredProcedure [dbo].[spGetSubmitedChoiceAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSubmitedChoiceAnswer](@id int)
AS
SELECT RS.id,choice_id,rr.id as other_id,[text] FROM ResponsedChoiceAnswer RS LEFT JOIN ResponsedOtherChoiceAnswer RR
ON RS.ID=RR.reponsed_choice_answer_id
WHERE RS.survey_response_id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetSubmitedLinearAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSubmitedLinearAnswer](@id int)
AS
SELECT * FROM ResponsedLinearScaleAnswer rr where rr.survey_response_id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetSubmitedTextAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSubmitedTextAnswer](@id int)
AS
SELECT * FROM ResponsedTextAnswer WHERE survey_response_id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetSurveyAccessPermission]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSurveyAccessPermission](@id int, @email nvarchar(50))
AS
select A.id from 
assignedStudent A  JOIN Survey S ON S.id= A.survey_id
WHERE survey_id=@id AND email=@email AND S.status=1
union 
select id from Survey s where s.is_public=1 and id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetSurveyByID]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSurveyByID](@ID INT)
AS
	BEGIN
	SELECT 
	[id]
      ,[name]
      ,[code]
      ,[description]
      ,[open_time]
      ,[close_time]
      ,[survey_category_id]
      ,[created_by]
      ,[created_at]
      ,[is_require]
      ,[is_score_taken]
      ,[is_public]
      ,[is_changing_allow]
      ,[background_color]
      ,[background_image]
      ,[updated_by]
      ,[updated_at]
	  ,[status]
	FROM 
Survey S 
WHERE S.ID=@ID AND S.status=1
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSurveyCategorybyID]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSurveyCategorybyID](@id int)
AS
BEGIN
SELECT [id]
      ,[name]
      ,[description]
	  ,[code_prefix]
      ,[created_by]
      ,[created_at]
      ,[updated_by]
      ,[updated_at]
	  ,[status]
  FROM [dbo].[SurveyCategory]
  WHERE id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[spGetSurveyStatistic]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spGetSurveyStatistic](@id int)
AS
SELECT S.[id]
      ,s.[name] as [name]
      ,[code]
	  ,sc.id as category_id
	  ,s.description as [description]
	  ,sc.name as category
	  ,s.open_time
	  ,s.close_time
      ,COUNT(sr.ID) AS count
  FROM [dbo].[Survey] S
  JOIN SurveyCategory sc on s.survey_category_id=sc.id
  LEFT JOIN SurveyResponse SR ON SR.survey_id=S.id
  WHERE s.id=@id AND s.status=1
  GROUP BY S.id,S.name,S.code,s.description,sc.id,sc.name,s.open_time,s.close_time
GO
/****** Object:  StoredProcedure [dbo].[spGetTextAnswerbyQuestionID]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTextAnswerbyQuestionID](@id int)
AS
SELECT [id]
      ,[question_id]
      ,[label]
      ,[created_at]
      ,[updated_at]
      ,[created_by]
      ,[updated_by]
      ,[status]
  FROM [dbo].[TextAnswer]
  WHERE question_id=@id AND status=1
GO
/****** Object:  StoredProcedure [dbo].[spGetTextStatistic]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTextStatistic](@id int)
AS
SELECT RTA.text ,COUNT(RTA.id) AS count
FROM Question Q
		 JOIN TextAnswer C ON Q.ID=C.question_id
		 LEFT JOIN ResponsedTextAnswer RTA ON  RTA.text_answer_id=C.id
		 WHERE Q.ID=@id AND c.status=1 GROUP BY RTA.text 

GO
/****** Object:  StoredProcedure [dbo].[spInsertChoice]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertChoice](
@label nvarchar(500),
@is_other bit,
@order int,
@create_id int,
@question_id int
)
AS
INSERT INTO [dbo].[Choice]
           ([choice_label]
           ,[is_other_choice]
           ,[order]
           ,[created_by]
           ,[created_at]
           ,[status]
           ,[question_id])
     VALUES
           (@label
           ,@is_other
           ,@order
		   ,@create_id
           ,GETDATE()
           ,1
           ,@question_id)
GO
/****** Object:  StoredProcedure [dbo].[spInsertChoiceResponse]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertChoiceResponse](@rsurvey_id int,@choice_id int,@Id int out)
AS
INSERT INTO [dbo].[ResponsedChoiceAnswer]
           ([survey_response_id]
           ,[choice_id]
           ,[created_at]
           ,[updated_at]
           ,[status])
     VALUES
           (@rsurvey_id
           ,@choice_id
           ,GETDATE()
           ,GETDATE()
           ,1)
 SELECT @Id = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[spInsertLinear]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertLinear](
@number int,
@label nvarchar(500),
@create_id int,
@question_id int
)
AS
INSERT INTO [dbo].[LinearScale]
           ([scale_number]
           ,[scale_label]
           ,[created_at]
           ,[created_by]
           ,[status]
           ,[question_id])
     VALUES
           (@number
           ,@label
           ,GETDATE()
           ,@create_id
           ,1
           ,@question_id)
GO
/****** Object:  StoredProcedure [dbo].[spInsertLinearResponse]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertLinearResponse](@rsurvey_id int,@ln_choice int)
AS
INSERT INTO [dbo].[ResponsedLinearScaleAnswer]
           ([survey_response_id]
           ,[linear_scale_id]
           ,[created_at]
           ,[updated_at]
           ,[status])
     VALUES
           (@rsurvey_id
           ,@ln_choice
           ,GETDATE()
           ,GETDATE()
           ,1)
GO
/****** Object:  StoredProcedure [dbo].[spInsertOtherChoiceTextResponse]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertOtherChoiceTextResponse](@rsurvey_id int,@text nvarchar(300))
AS
INSERT INTO [dbo].[ResponsedOtherChoiceAnswer]
           ([reponsed_choice_answer_id]
           ,[text]
           ,[created_at]
           ,[updated_at]
           ,[status])
     VALUES
           (@rsurvey_id
           ,@text
           ,GETDATE()
           ,GETDATE()
           ,1)
GO
/****** Object:  StoredProcedure [dbo].[spInsertQuestion]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertQuestion](
@section_id int,
@question nvarchar(500),
@description nvarchar(500) null,
@require bit,
@point_scale float,
@qc_id int,
@order int,
@create_id int,
@id int out)
AS
INSERT INTO [dbo].[Question]
           ([question]
           ,[description]
           ,[require]
           ,[point_scale]
           ,[question_category_id]
           ,[order]
           ,[created_by]
           ,[created_at]
           ,[status]
           ,[section_id])
     VALUES
           (@question
           ,@description
           ,@require
           ,@point_scale
           ,@qc_id
           ,@order
           ,@create_id
           ,GETDATE()
           ,1
           ,@section_id)
SELECT @id = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[spInsertResponseText]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertResponseText](@rsurvey_id int,@response nvarchar(500),@text_answer_id int)
AS
INSERT INTO [dbo].[ResponsedTextAnswer]
           ([survey_response_id]
           ,[text]
           ,[created_at]
           ,[updated_at]
           ,[status]
           ,[text_answer_id])
     VALUES
           (@rsurvey_id
           ,@response
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@text_answer_id)
GO
/****** Object:  StoredProcedure [dbo].[spInsertSection]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertSection](
@name nvarchar(500),
@description nvarchar(500) null,
@create_id int,
@survey_id int,
@order int,
@id int out)
AS
INSERT INTO [dbo].[Section]
           ([name]
           ,[description]
           ,[created_by]
           ,[created_at]
           ,[survey_id]
           ,[order]
           ,[status])
     VALUES
           (@name
           ,@description
           ,@create_id
           ,GETDATE()
           ,@survey_id
           ,@order
           ,1)
SELECT @id = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[spInsertSurvey]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertSurvey](
@name nvarchar(500),
@code nvarchar(20),
@description nvarchar(2000) null,
@opentime datetime,
@closetime datetime,
@survey_category_id int,
@create_id int,
@is_require bit,
@is_score bit,
@is_public bit,
@is_changing_allow bit,
@background_image nvarchar(200) null,
@id int out

)
AS
INSERT INTO [dbo].[Survey]
           ([name]
		   ,[code]
           ,[description]
           ,[open_time]
           ,[close_time]
           ,[survey_category_id]
           ,[created_by]
		   ,[created_at]
           ,[is_require]
           ,[is_score_taken]
           ,[is_public]
           ,[is_changing_allow]
           ,[background_image]
           ,[status])
     VALUES
           (@name
		   ,@code
           ,@description
           ,@opentime
           ,@closetime
           ,@survey_category_id
		   ,@create_id
           ,GETDATE()
           ,@is_require
           ,@is_score
           ,@is_public
           ,@is_changing_allow
		   ,@background_image
           ,1)
SELECT @id = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[spInsertSurveyResponse]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertSurveyResponse](@email varchar(50),@id int,@rsurvey_id int out)
AS
INSERT INTO [dbo].[SurveyResponse]
           ([email]
           ,[survey_id]
           ,[created_at]
           ,[updated_at]
           ,[status])
     VALUES
           (@email
           ,@id
           ,GETDATE()
		   ,GETDATE()
           ,1)
SELECT @rsurvey_id = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[spInsertTextQ]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertTextQ](@question_id int,@label nvarchar(500) null, @create_id int)
AS
INSERT INTO [dbo].[TextAnswer]
           ([question_id]
           ,[label]
           ,[created_at]
           ,[created_by]
           ,[status])
     VALUES
           (@question_id
           ,@label
           ,GETDATE()
           ,@create_id
           ,1)
GO
/****** Object:  StoredProcedure [dbo].[spSaveSurveyCategory]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSaveSurveyCategory](
	@id int = 0,
	@name nvarchar(20),
	@description nvarchar(200),
	@prefix nvarchar(3),
	@created_by int=null,
	@status int,
	@ok nvarchar(max) output
)
as
BEGIN
	if @id <=0
		BEGIN
			INSERT INTO [dbo].[SurveyCategory]
				   ([name]
				   ,[description]
				   ,[code_prefix]
				   ,[created_by]
				   ,[created_at]
				   ,[status])
			 VALUES
				   (@name
				   ,@description
				   ,@prefix
				   ,@created_by
				   ,getdate()
				   ,@status)
			if @@ERROR <> 0 
				BEGIN
					set @ok = 'error insert spSaveSurveyCategory';
					return;
				END
			set @ok = 'insert success spSaveSurveyCategory';
		END
	else 
		BEGIN
			declare @check_exited int = (select count(*) from SurveyCategory where id = @id)
			if @check_exited >0
				BEGIN
					UPDATE [dbo].[SurveyCategory]
					   SET [name] = @name
						  ,[description] = @description
						  ,[code_prefix] = @prefix
						  ,[updated_by] = @created_by
						  ,[updated_at] = GETDATE()
						  ,[status] = @status
					 WHERE id = @id

					 if @@ERROR <> 0 
					BEGIN
						set @ok = 'error update spSaveSurveyCategory';
						return;
					END
				set @ok = 'update success spSaveSurveyCategory';
				END
			else 
				BEGIN
					set @ok = 'ID not exited!';
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateChoice]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateChoice](@id int, @label nvarchar(500),@order int,@update_id int)
AS
UPDATE [dbo].[Choice]
   SET [choice_label] = @label
      ,[order] = @order
      ,[updated_at] = GETDATE()
      ,[updated_by] = @update_id
 WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateLinearScale]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateLinearScale](@id int, @label nvarchar(500),@update_id int)
AS
UPDATE [dbo].[LinearScale]
   SET [scale_label] = @label
      ,[updated_at] = GETDATE()
      ,[updated_by] = @update_id
 WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateLinearScaleAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateLinearScaleAnswer](@linear_id int,@id int )
AS
UPDATE [dbo].[ResponsedLinearScaleAnswer]
   SET [linear_scale_id] = @linear_id
      ,[updated_at] = GETDATE()
 WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateQuestion]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spUpdateQuestion](
@id int,
@question nvarchar(500),
@description nvarchar(500) null,
@update_id int,
@order int,
@is_require bit,
@point_scale int,
@qc_id int)
AS
UPDATE [dbo].[Question]
   SET [question] = @question
      ,[description] = @description
      ,[require] = @is_require
      ,[point_scale] = @point_scale
      ,[question_category_id] = @qc_id
      ,[order] = @order
      ,[updated_by] = @update_id
      ,[updated_at] = GETDATE()
 WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateResponseChoiceAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateResponseChoiceAnswer](@choice_id int,@id int )
AS
UPDATE [dbo].[ResponsedChoiceAnswer]
   SET [choice_id] = @choice_id
      ,[updated_at] = GETDATE()
 WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateResponseIsOtherChoiceAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateResponseIsOtherChoiceAnswer](@response nvarchar(500),@id int )
AS
UPDATE [dbo].[ResponsedOtherChoiceAnswer]
   SET [text] = @response
      ,[updated_at] = GETDATE()
 WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateResponseTextAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateResponseTextAnswer](@response nvarchar(500),@id int )
AS
UPDATE [dbo].[ResponsedTextAnswer]
   SET [text] = @response
      ,[updated_at] = GETDATE()
 WHERE id =@id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateSection]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spUpdateSection](
@id int,
@name nvarchar(500),
@description nvarchar(500) null,
@update_id int,
@order int)
AS
UPDATE [dbo].[Section]
   SET [name] = @name
      ,[description] = @description
      ,[updated_by] = @update_id
      ,[updated_at] = GETDATE()
      ,[order] = @order
 WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateSurvey]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateSurvey](
@id int,
@name nvarchar(500),
@description nvarchar(2000) null,
@open_time datetime,
@close_time datetime,
@sc_id int,
@is_require bit,
@is_score_taken bit,
@is_public bit,
@is_changing bit,
@image varchar(400) null,
@update_id int)
AS
UPDATE [dbo].[Survey]
   SET [name] = @name
      ,[description] = @description
      ,[open_time] = @open_time
      ,[close_time] = @close_time
      ,[survey_category_id] = @sc_id
      ,[is_require] = @is_require
      ,[is_score_taken] =@is_score_taken
      ,[is_public] = @is_public
      ,[is_changing_allow] = @is_changing
      ,[background_image] = @image
      ,[updated_by] = @update_id
      ,[updated_at] = GETDATE()
 WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateTextAnswer]    Script Date: 9/5/2022 10:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateTextAnswer](@id int, @label nvarchar(500),@update_id int)
AS
UPDATE [dbo].[TextAnswer]
   SET [label] = @label
      ,[updated_at] = GETDATE()
      ,[updated_by] = @update_id
 WHERE id=@id
GO
