CREATE PROCEDURE dbo.PrivacyPolicy_Insert
	 @ParentId int
	,@Title nvarchar(50)
	,@Description nvarchar(100)= null
	,@DisplayOrder int
	,@CreatedBy nvarchar(128)
	,@CreatedDate datetime2(7) = null
	,@ModifiedDate datetime2(7) = null 
	,@Id int OUTPUT
AS

BEGIN
	DECLARE @ModifiedBy nvarchar(128) = @CreatedBy 
	IF (@CreatedDate IS null)
	BEGIN 

			SET @CreatedDate = getutcdate() 
	END
			SET @ModifiedDate = COALESCE(@ModifiedDate, getutcdate()) null value, 

	INSERT INTO dbo.PrivacyPolicy 
				(ParentId
				,Title
				,[Description] 
				,DisplayOrder
				,CreatedBy
				,CreatedDate
				,ModifiedBy 
				,ModifiedDate) 

	VALUES (
				 @ParentId
				,@Title
				,@Description
				,@DisplayOrder
				,@CreatedBy
				,@CreatedDate
				,@ModifiedBy
				,@ModifiedDate)

			SELECT @Id = SCOPE_IDENTITY()  
END


