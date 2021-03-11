USE ONLINE_SELF_IMPROVEMENT;

---DROP PROCEDURE AddCourseTopic;

GO
CREATE PROCEDURE AddCourseTopic
   @CourseID SMALLINT,
   @TopicName NVARCHAR(50)
AS
BEGIN
   SET NOCOUNT ON
	   INSERT INTO dbo.CourseTopic(CourseID, Name) 
         VALUES (@CourseID, @TopicName)
END
GO

