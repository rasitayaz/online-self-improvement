USE ONLINE_SELF_IMPROVEMENT;

---DROP PROCEDURE AddParent;

GO
CREATE PROCEDURE AddParent
   @FullName NVARCHAR(50),
   @PhoneNumber VARCHAR(15), 
   @Occupation NVARCHAR(30),
   @StudentID SMALLINT
AS
BEGIN
   SET NOCOUNT ON
	   INSERT INTO dbo.Parent(FullName, PhoneNumber, Occupation,StudentID) 
         VALUES ( @FullName, @PhoneNumber, @Occupation,@StudentID);
END
GO
