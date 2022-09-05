USE [FinalFUSurvey]
GO
alter PROCEDURE spUpdateSurvey(
@id int,
@name nvarchar(50),
@description nvarchar(300) null,
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
 GO
alter PROCEDURE spDeleteSurvey(@id int)
AS
UPDATE [dbo].[Survey]
   SET status=0
    WHERE id=@id

	go
alter PROCEDURE spDeleteSection(@id int)
AS
UPDATE [dbo].Section
   SET status=0
    WHERE id=@id

	go
	alter PROCEDURE spDeleteQuestion(@id int)
AS
UPDATE [dbo].Question
   SET status=0
    WHERE id=@id

	go
 alter PROCEDURE spUpdateSection(
@id int,
@name nvarchar(50),
@description nvarchar(300) null,
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


alter PROCEDURE spUpdateQuestion(
@id int,
@question nvarchar(200),
@description nvarchar(300) null,
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

USE [FinalFUSurvey]
GO
alter PROCEDURE spUpdateLinearScale(@id int, @label nvarchar(50),@update_id int)
AS
UPDATE [dbo].[LinearScale]
   SET [scale_label] = @label
      ,[updated_at] = GETDATE()
      ,[updated_by] = @update_id
 WHERE id=@id
GO
alter PROCEDURE spDeleteLinearScale(@id int)
AS
UPDATE [dbo].[LinearScale]
   SET status=0
   WHERE id=@id

GO
alter PROCEDURE spUpdateTextAnswer(@id int, @label nvarchar(20),@update_id int)
AS
UPDATE [dbo].[TextAnswer]
   SET [label] = @label
      ,[updated_at] = GETDATE()
      ,[updated_by] = @update_id
 WHERE id=@id
GO
alter PROCEDURE spDeleteTextAnswer(@id int)
AS
UPDATE [dbo].[TextAnswer]
   SET status=0
 WHERE id=@id

GO
alter PROCEDURE spUpdateChoice(@id int, @label nvarchar(50),@order int,@update_id int)
AS
UPDATE [dbo].[Choice]
   SET [choice_label] = @label
      ,[order] = @order
      ,[updated_at] = GETDATE()
      ,[updated_by] = @update_id
 WHERE id=@id
GO
alter PROCEDURE spDeleteChoice(@id int)
AS
UPDATE [dbo].[Choice]
   SET status=0
 WHERE id=@id

 go
	alter PROCEDURE spGetResponsesBySurveyID(@id int)
	AS
	SELECT id,email,created_at FROM SurveyResponse SR WHERE SR.survey_id=@id
GO
alter PROCEDURE spGetAllSurveyStatistic
AS
SELECT S.[id]
      ,s.[name] as [name]
      ,[code]
	  ,sc.id as category_id
	  ,s.description as [description]
	  ,sc.name as category
      ,COUNT(sr.ID) AS count
  FROM [dbo].[Survey] S
  JOIN SurveyCategory sc on s.survey_category_id=sc.id
  LEFT JOIN SurveyResponse SR ON SR.survey_id=S.id
  WHERE s.status=1
  GROUP BY S.id,S.name,S.code,s.description,sc.id,sc.name
  GO
  alter PROCEDURE spGetSurveyStatistic(@id int)
AS
SELECT S.[id]
      ,s.[name] as [name]
      ,[code]
	  ,sc.id as category_id
	  ,s.description as [description]
	  ,sc.name as category
      ,COUNT(sr.ID) AS count
  FROM [dbo].[Survey] S
  JOIN SurveyCategory sc on s.survey_category_id=sc.id
  LEFT JOIN SurveyResponse SR ON SR.survey_id=S.id
  WHERE s.id=@id AND s.status=1
  GROUP BY S.id,S.name,S.code,s.description,sc.id,sc.name
  
  
GO
alter PROCEDURE spGetChoiceStatistic(@id int)
AS
SELECT C.id,C.choice_label,c.is_other_choice,COUNT(RSC.ID) AS count
FROM Question Q
		 JOIN Choice C ON Q.ID=C.question_id
		 LEFT JOIN ResponsedChoiceAnswer RSC ON  RSC.choice_id=C.id
		 WHERE Q.ID=@id AND C.status=1 
		 GROUP BY C.id,C.choice_label,C.is_other_choice,C.[order]
		 ORDER BY C.[order]
		 go
alter PROCEDURE spGetLinearStatistic(@id int)
AS
SELECT C.id,C.scale_number,C.scale_label ,COUNT(Q.ID) AS count
FROM Question Q
		 JOIN LinearScale C ON Q.ID=C.question_id
		 LEFT JOIN ResponsedLinearScaleAnswer RSC ON  RSC.linear_scale_id=C.id
		 WHERE Q.ID=@id AND c.status=1
		 GROUP BY C.id,C.scale_number,C.scale_label
		 ORDER BY C.scale_number
		 go
alter PROCEDURE spGetTextStatistic(@id int)
AS
SELECT RTA.text ,COUNT(Q.ID) AS count
FROM Question Q
		 JOIN TextAnswer C ON Q.ID=C.question_id
		 LEFT JOIN ResponsedTextAnswer RTA ON  RTA.text_answer_id=C.id
		 WHERE Q.ID=3 AND c.status=1 GROUP BY RTA.text 
		 go
alter PROCEDURE spGetOtherChoiceStatistic(@id int)
AS
SELECT ROCA.text, COUNT(ROCA.id) as count
FROM Choice c  
	JOIN ResponsedChoiceAnswer RCA ON C.id=RCA.choice_id
	JOIN ResponsedOtherChoiceAnswer ROCA ON ROCA.reponsed_choice_answer_id=RCA.id
	
	WHERE C.id=3 AND C.status=1
	GROUP BY ROCA.text

	go
	alter PROCEDURE [dbo].[spGetLinearScaleByQuestionId](@id int)
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
alter PROCEDURE [dbo].[spGetChoiceByQuestionID](@id int)
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
alter PROCEDURE [dbo].[spGetQuestionBySectionId](@id int)
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
alter PROCEDURE [dbo].[spGetSurveyAccessPermission](@id int, @email nvarchar(50))
AS
select A.id from 
assignedStudent A  JOIN Survey S ON S.id= A.survey_id
WHERE survey_id=@id AND email=@email AND S.status=1
union 
select id from Survey s where s.is_public=1 and id=@id
GO
alter PROCEDURE [dbo].[spGetSurveyByID](@ID INT)
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
alter PROCEDURE [dbo].[spGetTextAnswerbyQuestionID](@id int)
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
  alter PROCEDURE [dbo].[spGetSectionsBySurveyId](@id int)
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

go
alter PROCEDURE [dbo].[spGetAllSurveyResultSearch](
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


go
alter PROCEDURE saveAssignStudent(
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


alter PROCEDURE [dbo].[spGetLinearStatistic](@id int)
AS
SELECT C.id,C.scale_number,C.scale_label ,COUNT(RSC.id) AS count
FROM Question Q
		 JOIN LinearScale C ON Q.ID=C.question_id
		 Left  JOIN ResponsedLinearScaleAnswer RSC ON  RSC.linear_scale_id=C.id
		 WHERE Q.ID=@id AND C.status=1
		 GROUP BY C.id,C.scale_number,C.scale_label
		 ORDER BY C.scale_number
		 go
alter PROCEDURE [dbo].[spGetTextStatistic](@id int)
AS
SELECT RTA.text ,COUNT(Q.ID) AS count
FROM Question Q
		 JOIN TextAnswer C ON Q.ID=C.question_id
		 LEFT JOIN ResponsedTextAnswer RTA ON  RTA.text_answer_id=C.id
		 WHERE Q.ID=@id AND c.status=1 GROUP BY RTA.text 
		 
		 go
alter PROCEDURE spGetInforByID(@id int)
AS
SELECT survey_id
      ,[email]
      FROM [dbo].[SurveyResponse]
	  WHERE status=1 AND id=@id
GO
/****** Object:  StoredProcedure [dbo].[spGetAllSurveyStatistic]    Script Date: 7/25/2022 8:37:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


go
 alter PROCEDURE [dbo].[spGetSurveyStatistic](@id int)
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
alter PROCEDURE [dbo].[spGetTextStatistic](@id int)
AS
SELECT RTA.text ,COUNT(RTA.id) AS count
FROM Question Q
		 JOIN TextAnswer C ON Q.ID=C.question_id
		 LEFT JOIN ResponsedTextAnswer RTA ON  RTA.text_answer_id=C.id
		 WHERE Q.ID=@id AND c.status=1 GROUP BY RTA.text 

		 go
alter PROCEDURE [dbo].[spGetAllAssignBySurveyID](
	@survey_id int
)
AS  
BEGIN
	Select * from AssignedStudent where survey_id = @survey_id
END
go

ALTER PROCEDURE [dbo].[spSaveSurveyCategory](
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
ALTER PROCEDURE [dbo].[spGetSurveyCategorybyID](@id int)
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

go

ALTER PROCEDURE [dbo].[spGetAllSurveyByEmailSearch](
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
			from Survey s inner join SurveyResponse sr on s.id=sr.survey_id where email=@email and s.name like  '%'+@search+'%'
			 and s.status=1 ) as t
			where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)
			
			set @total_record = (select count(*) from 
			(select DISTINCT s.id,s.name,code,description, open_time,close_time,survey_category_id,s.created_by,s.created_at,is_require,
				is_score_taken,is_public,is_changing_allow,background_color,background_image,s.updated_by,s.updated_at, s.status
			from Survey s inner join SurveyResponse sr on s.id=sr.survey_id where email=@email and s.name like '%'+@search+'%' AND S.status=1) as t)
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
						)) as c where c.name like  '%'+@search+'%' and c.status=1) as t
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
				) as c where c.name like  '%'+@search+'%')
			END
						
END

go

go

ALTER PROCEDURE [dbo].[spGetAllSurveyStatistic](
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
  where s.[name] like  '%'+@search+'%' or code like '%'+@search+'%' and s.status=1
    GROUP BY S.id,S.name,S.code,s.description,sc.id,sc.name,s.open_time,close_time,s.created_at ) as t 
					  where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize) 
					  

				set @total_record = (select count(*) from Survey s where s.name like '%'+@search+'%' or s.code like '%'+@search+'%' and s.status=1)
			End
END
go
ALTER procedure [dbo].[spFindSurveyCategoryByID](
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
ALTER  procedure [dbo].[spFindAllSurveyCategorySearch]
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

go
ALTER procedure [dbo].[spFindAllSurveyCategory]
AS
BEGIN
	select * from SurveyCategory where status=1 order by created_at desc
END
go

ALTER procedure [dbo].[findAll_User](
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
	
	go
ALTER PROCEDURE [dbo].[spGetAllSurveySearch](
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
					  FROM [dbo].[Survey] where ([name] like  '%'+@search+'%' or code like '%'+@search+'%') and survey_category_id = @categoryid and status=1 ) as t 
					  where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)   Order by created_at desc

				set @total_record = (select count(*) from Survey s inner join SurveyCategory sc on s.survey_category_id = sc.id
					where (s.name like '%'+@search+'%' or s.code like '%'+@search+'%') and s.survey_category_id = @categoryid and s.status=1)
			End
		else  
			Begin
				select * from (
					SELECT [id] ,[name],[code] ,[description] ,[open_time],[close_time],[survey_category_id]
						  ,[created_by],[created_at],[is_require],[is_score_taken],[is_public],[is_changing_allow],[background_color]
						  ,[background_image] ,[updated_by],[updated_at],[status]
						  ,ROW_NUMBER() over (order by created_at desc) as row_num
					  FROM [dbo].[Survey] where ([name] like  '%'+@search+'%' or code like '%'+@search+'%') and status=1 ) as t 
					  where t.row_num between ((@page-1)* + @pagesize +1) and (@page*  @pagesize)
					  Order by created_at desc
				set @total_record = (select count(*) from Survey s where (s.name like '%'+@search+'%' or s.code like '%'+@search+'%') and status=1)
			End
-- ORDER BY SE.[order] ASC,Q.[order] ASC, C.[order], L.scale_number
END
 go


ALTER PROCEDURE [dbo].[Save_User](
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

go

ALTER PROCEDURE [dbo].[spSaveSurveyCategory](
	@id int = 0,
	@name nvarchar(50),
	@description nvarchar(500),
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
go
alter procedure spFindUserByEmail(
	@email nvarchar(max)
)
AS
BEGIN
	select  u.id as uid, u.name as uname, email, r.id as rid, r.role_name as rname, u.status as ustatus
	from [User] u inner join [Role] r on u.role_id = r.id
	where email =@email and u.status =1
END
go
ALTER PROCEDURE [dbo].[spGetAllSurveyByEmailSearch](
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
