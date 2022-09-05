GO
create procedure spGetAllSurveyByEmail(
@email nvarchar(100),
@is_response int
)
AS
BEGIN
	if @is_response = 1
		BEGIN
			select DISTINCT s.id,s.name,code,description, open_time,close_time,survey_category_id,s.created_by,s.created_at,is_require,
				is_score_taken,is_public,is_changing_allow,background_color,background_image,s.updated_by,s.updated_at, s.status
			from Survey s inner join SurveyResponse sr on s.id=sr.survey_id where email=@email
		END
	else if @is_response =0
		BEGIN
			declare @check int =  (
				SELECT count(DISTINCT(S.ID)) FROM 
				Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
				WHERE RS.email=@email);

				if @check =0
					BEGIN
						SELECT * FROM Survey where is_public =1;
					END
				else if @check =1
					BEGIN
						SELECT * FROM Survey WHERE Survey.ID <> ANY(
							SELECT DISTINCT(S.ID) FROM 
							Survey S JOIN SurveyResponse RS ON S.ID=RS.survey_id
						WHERE RS.email=@email) and is_public =1
					END
		END
END
go
go
create procedure spSaveSurveyCategory(
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
go

create procedure spFindAllSurveyCategory
AS
BEGIN
	select * from SurveyCategory
END
go

create procedure spFindSurveyCategoryByID(
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
go

create procedure spFindUserByID(
	@id int
)
AS
BEGIN
	select * from [User] where id=@id
END

go 
create procedure [dbo].[findAll_User](
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