USE ONLINE_SELF_IMPROVEMENT;

---DROP PROCEDURE AddInstructorCourse;

GO
CREATE PROCEDURE AddInstructorCourse
  @InstructorID SMALLINT, 
  @CourseID SMALLINT
AS
BEGIN
   SET NOCOUNT ON
	   INSERT INTO InstructorCourse(InstructorID,CourseID) 
       VALUES ( @InstructorID, @CourseID);
END
GO
