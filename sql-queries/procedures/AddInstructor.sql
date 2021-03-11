USE ONLINE_SELF_IMPROVEMENT;

---DROP PROCEDURE AddInstructor;

GO
CREATE PROCEDURE AddInstructor
   @FirstName NVARCHAR(30),
   @LastName NVARCHAR(30), 
   @MailAddress VARCHAR(50), 
   @PhoneNumber VARCHAR(15),
   @Gender CHAR(1),
   @ZIP CHAR(5) = '34000',
   @District NVARCHAR(15) = NULL,
   @City NVARCHAR(15) = N'İstanbul',
   @Salary SMALLINT = NULL
AS
BEGIN
   SET NOCOUNT ON
	   INSERT INTO dbo.Person(FirstName, LastName, MailAddress, PhoneNumber, Gender, ZIP, District, City) 
         VALUES (@FirstName, @LastName, @MailAddress, @PhoneNumber, @Gender, @ZIP, @District, @City);
	   INSERT INTO dbo.Instructor(PersonID,Salary)
	      VALUES (SCOPE_IDENTITY(), CAST(@Salary AS SMALLMONEY));
END
GO


