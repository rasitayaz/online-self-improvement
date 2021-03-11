USE ONLINE_SELF_IMPROVEMENT;

--DROP PROCEDURE AddStudent;

GO
CREATE PROCEDURE AddStudent
   @FirstName NVARCHAR(30),
   @LastName NVARCHAR(30), 
   @MailAddress VARCHAR(50), 
   @PhoneNumber VARCHAR(15),
   @Gender CHAR(1),
   @ZIP CHAR(5) = '34000',
   @District NVARCHAR(15) = NULL,
   @City NVARCHAR(15) = N'İstanbul',
   @BirthDate VARCHAR(15),
   @RegistrationDate VARCHAR(15) = NULL,
   @Payment SMALLINT
AS
IF @RegistrationDate IS NULL
   SET @RegistrationDate = CONVERT(VARCHAR, GETDATE(), 1);
BEGIN
   SET NOCOUNT ON
	   INSERT INTO dbo.Person(FirstName, LastName, MailAddress, PhoneNumber, Gender, ZIP, District, City) 
         VALUES (@FirstName, @LastName, @MailAddress, @PhoneNumber, @Gender, @ZIP, @District, @City);
	   INSERT INTO dbo.Student(PersonID, BirthDate, RegistrationDate, Payment)
	      VALUES (SCOPE_IDENTITY(), CAST(@BirthDate AS SMALLDATETIME), CAST(@RegistrationDate AS SMALLDATETIME), CAST(@Payment AS SMALLMONEY));
END
GO



