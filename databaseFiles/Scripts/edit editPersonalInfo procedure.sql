USE [OfficeAutomation]
GO
/****** Object:  StoredProcedure [dbo].[editPersonalInfo]    Script Date: 12/31/2015 8:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[editPersonalInfo] 
	-- Add the parameters for the stored procedure here
	@personalId char(10),
	@paramName varchar(20),
	@paramChar varchar(20) = NULL,
	@paramDate date = NULL,
	@paramInt int = NULL,
	@paramFloat float = NULL
AS
BEGIN
	DECLARE @nationalId char(10);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
	SET @nationalId = (
		SELECT NationalID
		FROM Employee
		WHERE PersonalID = @personalId
	);

	

	IF @paramName = 'firstName'
	BEGIN
		UPDATE Person
		SET firstName = @paramChar
		WHERE NationalID = @nationalId;
	END

	ELSE IF @paramName = 'lastName'
	BEGIN
		UPDATE Person
		SET lastName = @paramChar
		WHERE NationalID = @nationalId;
	END
	
	ELSE IF @paramName = 'sodoorPlace'
	BEGIN
		UPDATE Person
		SET SodoorPlace = @paramChar
		WHERE NationalID = @nationalId;
	END
	
	ELSE IF @paramName = 'maritalStatus'
	BEGIN
		UPDATE Person
		SET maritalStatus = @paramChar
		WHERE NationalID = @nationalId;
	END
	
	ELSE IF @paramName = 'gender'
	BEGIN
		UPDATE Person
		SET Gender = @paramChar
		WHERE NationalID = @nationalId;
	END
	
	ELSE IF @paramName = 'birthDate'
	BEGIN
		UPDATE Person
		SET Birthdate = @paramDate
		WHERE NationalID = @nationalId;
	END
	
	ELSE IF @paramName = 'childrenNumber'
	BEGIN
		UPDATE Person
		SET ChildrenNumber = @paramInt
		WHERE NationalID = @nationalId;
	END

	ELSE IF @paramName = 'contractId'
	BEGIN
		UPDATE Employee
		SET ContractID = @paramChar
		WHERE PersonalID = @personalId;
	END

	ELSE IF @paramName = 'postId'
	BEGIN
		UPDATE Employee
		SET PostID = @paramChar
		WHERE PersonalID = @personalId;
	END

	ELSE IF @paramName = 'officeId'
	BEGIN
		UPDATE Employee
		SET OfficeID = @paramChar
		WHERE PersonalID = @personalId;
	END

	ELSE IF @paramName = 'managerId'
	BEGIN
		UPDATE Employee
		SET ManagerID = @paramChar
		WHERE PersonalID = @personalId;
	END

	ELSE IF @paramName = 'eduLevel'
	BEGIN
		UPDATE Education
		SET EduLevel = @paramChar
		WHERE NationalID = @nationalId;
	END
	
	ELSE IF @paramName = 'field'
	BEGIN
		UPDATE Education
		SET Field = @paramChar
		WHERE NationalID = @nationalId;
	END

	ELSE IF @paramName = 'institute'
	BEGIN
		UPDATE Education
		SET Institute = @paramChar
		WHERE NationalID = @nationalId;
	END
	
	ELSE IF @paramName = 'graduationDate'
	BEGIN
		UPDATE Education
		SET GraduationDate = @paramDate
		WHERE NationalID = @nationalId;
	END

	
	ELSE IF @paramName = 'finalProjectTitle'
	BEGIN
		UPDATE Education
		SET FinalProjectTitle = @paramChar
		WHERE NationalID = @nationalId;
	END

	
	ELSE IF @paramName = 'average'
	BEGIN
		UPDATE Education
		SET Average = @paramFloat
		WHERE NationalID = @nationalId;
	END



		SELECT 1;
	END TRY
	BEGIN CATCH
		SELECT 0;
	END CATCH
END
