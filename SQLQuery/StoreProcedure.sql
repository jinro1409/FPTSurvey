create procedure findAll_Role
as
begin
	select * from [Role]

	end
GO


create PROCEDURE [dbo].[Save_User](
		@mail nvarchar(100),
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
						   (@mail
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
				   SET [name] = @mail
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
create procedure [dbo].[findAll_User](
	@page int,
	@pagesize int
)
as
begin
	select * from
( select u.id as uid, u.name as uname, email, r.id as rid, r.role_name as rname,
ROW_NUMBER() over(order by u.id) as row_num 
from [Role] r inner join [User] u on r.id = u.role_id) as t 
where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)

	end;
		go


create PROCEDURE [dbo].[spGetAllSurvey]
AS
	BEGIN
	SELECT * FROM Survey 
-- ORDER BY SE.[order] ASC,Q.[order] ASC, C.[order], L.scale_number
END


GO
/****** Object:  StoredProcedure [dbo].[spGetChoiceByQuestionID]    Script Date: 6/30/2022 8:52:07 AM ******/
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
  WHERE question_id=@id
  ORDER BY [order]
GO
/****** Object:  StoredProcedure [dbo].[spGetLinearScaleByQuestionId]    Script Date: 6/30/2022 8:52:07 AM ******/
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
  WHERE question_id=@ID
  ORDER BY [scale_number] ASC
GO
/****** Object:  StoredProcedure [dbo].[spGetQuestionBySectionId]    Script Date: 6/30/2022 8:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetQuestionBySectionId](@id int)
AS
BEGIN
SELECT TOP (1000) [id]
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
  WHERE section_id=@id
  ORDER BY [order]
 END
GO
/****** Object:  StoredProcedure [dbo].[spGetQuestionCategoryById]    Script Date: 6/30/2022 8:52:07 AM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetSectionsBySurveyId]    Script Date: 6/30/2022 8:52:07 AM ******/
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
  WHERE survey_id=@id
  ORDER BY [order]
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSurveyByID]    Script Date: 6/30/2022 8:52:07 AM ******/
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
WHERE S.ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSurveyCategorybyID]    Script Date: 6/30/2022 8:52:07 AM ******/
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
      ,[created_by]
      ,[created_at]
      ,[updated_by]
      ,[updated_at]
  FROM [dbo].[SurveyCategory]
  WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTextAnswerbyQuestionID]    Script Date: 6/30/2022 8:52:07 AM ******/
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
  WHERE question_id=@id
GO
USE [FinalFUSurvey]
GO
CREATE PROCEDURE spInsertSurveyResponse(@email varchar(50),@id int,@rsurvey_id int out)
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

CREATE PROCEDURE spInsertLinearResponse(@rsurvey_id int,@ln_choice int)
AS
INSERT INTO [dbo].[ReponsedLinearScaleAnswer]
           ([survey_response_id]
           ,[linear_scale_id]
           ,[created_by]
           ,[updated_by]
           ,[status])
     VALUES
           (@rsurvey_id
           ,@ln_choice
           ,GETDATE()
           ,GETDATE()
           ,1)
CREATE PROCEDURE spInsertResponseText(@rsurvey_id int,@response nvarchar(400),@text_answer_id int)
AS
INSERT INTO [dbo].[ResponseTextAnswer]
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

		   
CREATE PROCEDURE spInsertOtherChoiceTextResponse(@rsurvey_id int,@text nvarchar(300))
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
CREATE PROCEDURE spInsertChoiceResponse(@rsurvey_id int,@choice_id int,@Id int out)
AS
INSERT INTO [dbo].[ReponsedChoiceAnswer]
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
