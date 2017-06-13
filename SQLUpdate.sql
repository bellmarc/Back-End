
CREATE PROCEDURE dbo.PrivacyPolicy_Update 
		@ParentId int
		,@Title nvarchar(50)
		,@Description nvarchar(100)= null
		,@DisplayOrder int
		,@ModifiedBy nvarchar(128)
		,@Id int  
AS

BEGIN
DECLARE @ModifiedDate datetime2(7) = getutcdate();
	UPDATE PrivacyPolicy
	SET		ParentId =	@ParentId
			,Title = @Title
			,Description = @Description
			,DisplayOrder = @DisplayOrder
			,ModifiedBy = @ModifiedBy
			,ModifiedDate = @ModifiedDate
	
			WHERE Id= @Id
END
	


