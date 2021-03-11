USE ONLINE_SELF_IMPROVEMENT;

---DROP PROCEDURE AddStudentCourse;

GO
CREATE PROCEDURE AddStudentCourse
  @StudentID SMALLINT, 
  @CourseID SMALLINT
AS
BEGIN
   SET NOCOUNT ON
	   INSERT INTO StudentCourse(StudentID,CourseID) 
       VALUES (@StudentID, @CourseID);
END
GO

