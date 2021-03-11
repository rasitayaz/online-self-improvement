USE ONLINE_SELF_IMPROVEMENT;

---DROP PROCEDURE AddMeeting;

GO
CREATE PROCEDURE AddMeeting
   @Date VARCHAR(15),
   @DurationInMins TINYINT,
   @StudentID SMALLINT,
   @InstructorID SMALLINT,
   @CourseID SMALLINT
AS
BEGIN
   SET NOCOUNT ON
	   INSERT INTO dbo.Meeting(Date, DurationInMins, StudentID, InstructorID, CourseID) 
         VALUES (CAST(@Date AS SMALLDATETIME), @DurationInMins, @StudentID, @InstructorID, @CourseID) ;
END
GO
