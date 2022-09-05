USE [FinalFUSurvey]
GO
/****** Object:  StoredProcedure [dbo].[findAll_Role]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[findAll_User]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[findAll_User](
	@page int,
	@pagesize int
)
as
begin
	select * from
( select u.id as uid, u.name as uname, email, r.id as rid, r.role_name as rname, u.status,
ROW_NUMBER() over(order by u.id) as row_num 
from [Role] r inner join [User] u on r.id = u.role_id) as t 
where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)

	end;
GO
/****** Object:  StoredProcedure [dbo].[Save_User]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

go
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
/****** Object:  StoredProcedure [dbo].[spCheckSubmitedResponse]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteResponseChoiceAnswer]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteResponseChoiceAnswer](@id int )
AS
DELETE FROM [dbo].[ResponsedChoiceAnswer]
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteResponseIsOtherChoiceAnswer]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteResponseIsOtherChoiceAnswer](@id int )
AS
DELETE FROM [dbo].[ResponsedOtherChoiceAnswer]
WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spFindAllSurveyCategory]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spFindAllSurveyCategory]
AS
BEGIN
	select * from SurveyCategory
END
GO
/****** Object:  StoredProcedure [dbo].[spFindSurveyCategoryByID]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spFindSurveyCategoryByID](
	@id int,
	@ok nvarchar(max) output
)
AS
BEGIN
	if @id >0
		BEGIN
			declare @check_exited int = (select count(*) from SurveyCategory where id = @id)
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
/****** Object:  StoredProcedure [dbo].[spFindUserByID]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spFindUserByID](
	@id int
)
AS
BEGIN
	select * from [User] where id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurvey]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAllSurvey]
AS
	BEGIN
	SELECT * FROM Survey 
-- ORDER BY SE.[order] ASC,Q.[order] ASC, C.[order], L.scale_number
END


GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurveyByEmail]    Script Date: 7/13/2022 10:41:46 PM ******/
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
			from Survey s inner join SurveyResponse sr on s.id=sr.survey_id where email=@email
	else if @is_response =0
			
						SELECT * FROM Survey WHERE Survey.ID not in(
							SELECT DISTINCT(S.ID) FROM 
							Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
						WHERE RS.email=@email) and is_public =1
						UNION 
						SELECT DISTINCT S.* FROM Survey S JOIN AssignedStudent A ON S.id=A.survey_id
						WHERE A.email=@email anD S.is_public=0 AND S.id not in(
						
							SELECT DISTINCT(S.ID) FROM 
							Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
						WHERE RS.email=@email)
						
END
GO
/****** Object:  StoredProcedure [dbo].[spGetChoiceByQuestionID]    Script Date: 7/13/2022 10:41:46 PM ******/
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
  ORDER BY Choice.[order]
GO
/****** Object:  StoredProcedure [dbo].[spGetLinearScaleByQuestionId]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetQuestionBySectionId]    Script Date: 7/13/2022 10:41:46 PM ******/
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
  ORDER BY [Question].[order]
 END
GO
/****** Object:  StoredProcedure [dbo].[spGetQuestionCategoryById]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetQuestionCategoryById](@id int)
AS
SELECT [id]
      ,[name]
      ,[description]
  FROM [FinalFUSurvey].[dbo].[QuestionCategory]
  WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetSectionsBySurveyId]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetSubmitedChoiceAnswer]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetSubmitedLinearAnswer]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSubmitedLinearAnswer](@id int)
AS
SELECT * FROM ResponsedLinearScaleAnswer rr where rr.survey_response_id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetSubmitedTextAnswer]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSubmitedTextAnswer](@id int)
AS
SELECT * FROM ResponsedTextAnswer WHERE survey_response_id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetSurveyAccessPermission]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSurveyAccessPermission](@id int, @email nvarchar(50))
AS
select id from 
assignedStudent 
WHERE survey_id=@id AND email=@email
union 
select id from Survey s where s.is_public=1 and id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetSurveyByID]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetSurveyCategorybyID]    Script Date: 7/13/2022 10:41:46 PM ******/
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
	  ,[status]
  FROM [dbo].[SurveyCategory]
  WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTextAnswerbyQuestionID]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertChoice]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertChoice](
@label nvarchar(100),
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
/****** Object:  StoredProcedure [dbo].[spInsertChoiceResponse]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertLinear]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertLinear](
@number int,
@label nvarchar(50),
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
/****** Object:  StoredProcedure [dbo].[spInsertLinearResponse]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertOtherChoiceTextResponse]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertQuestion]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertQuestion](
@section_id int,
@question nvarchar(200),
@description nvarchar(400) null,
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
/****** Object:  StoredProcedure [dbo].[spInsertResponseText]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertResponseText](@rsurvey_id int,@response nvarchar(400),@text_answer_id int)
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
/****** Object:  StoredProcedure [dbo].[spInsertSection]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertSection](
@name nvarchar(50),
@description nvarchar(300) null,
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
/****** Object:  StoredProcedure [dbo].[spInsertSurvey]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertSurvey](
@name nvarchar(50),
@code nvarchar(10),
@description nvarchar(300) null,
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
/****** Object:  StoredProcedure [dbo].[spInsertSurveyResponse]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertTextQ]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertTextQ](@question_id int,@label nvarchar(20) null, @create_id int)
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
/****** Object:  StoredProcedure [dbo].[spSaveSurveyCategory]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spSaveSurveyCategory](
	@id int = 0,
	@name nvarchar(20),
	@description nvarchar(200),
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
				   ,[created_by]
				   ,[created_at]
				   ,[status])
			 VALUES
				   (@name
				   ,@description
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
/****** Object:  StoredProcedure [dbo].[spUpdateLinearScaleAnswer]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateResponseChoiceAnswer]    Script Date: 7/13/2022 10:41:46 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateResponseIsOtherChoiceAnswer]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateResponseIsOtherChoiceAnswer](@response nvarchar(300),@id int )
AS
UPDATE [dbo].[ResponsedOtherChoiceAnswer]
   SET [text] = @response
      ,[updated_at] = GETDATE()
 WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateResponseTextAnswer]    Script Date: 7/13/2022 10:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateResponseTextAnswer](@response nvarchar(400),@id int )
AS
UPDATE [dbo].[ResponsedTextAnswer]
   SET [text] = @response
      ,[updated_at] = GETDATE()
 WHERE id =@id
GO
