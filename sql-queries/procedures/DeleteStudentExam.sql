USE ONLINE_SELF_IMPROVEMENT;

--DROP PROCEDURE DeleteStudentExam;

GO
CREATE PROCEDURE DeleteStudentExam
   @StudentID SMALLINT,
   @ExamID SMALLINT
AS
BEGIN
   SET NOCOUNT ON
   DELETE FROM StudentExam
		WHERE @StudentID=StudentExam.StudentID AND @ExamID=StudentExam.ExamID;   
END
GO
