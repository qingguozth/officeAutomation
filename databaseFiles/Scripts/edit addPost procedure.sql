USE [OfficeAutomation]
GO
/****** Object:  StoredProcedure [dbo].[addPost]    Script Date: 12/31/2015 7:16:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[addPost] 
	-- Add the parameters for the stored procedure here
	@postId char(2),
	@postTitle varchar(20),
	@postScore int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		INSERT INTO Post_Score
		(PostID,PostTitle,Score)
		VALUES (@postId,@postTitle,@postScore);
	
		SELECT 1;
	END TRY
	BEGIN CATCH
		SELECT 0;
	END CATCH
END
