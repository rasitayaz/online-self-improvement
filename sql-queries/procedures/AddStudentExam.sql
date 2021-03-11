USE ONLINE_SELF_IMPROVEMENT;

--DROP PROCEDURE AddStudentExam;

GO
CREATE PROCEDURE AddStudentExam
   @StudentID SMALLINT,
   @ExamID SMALLINT,
   @Grade TINYINT,
   @CorrectAnswers TINYINT,
   @FalseAnswers TINYINT
AS
BEGIN
   DECLARE @NumOfQuestions AS TINYINT;
   SET @NumOfQuestions = (SELECT NumOfQuestions FROM Exam WHERE Exam.ID = @ExamID);
   IF @CorrectAnswers + @FalseAnswers > @NumOfQuestions BEGIN
      PRINT 'ERROR: CorrectAnswers + FalseAnswers can''t be greater than NumOfQuestions.';
      RETURN
   END
   IF @Grade IS NULL BEGIN
      SET @Grade = @CorrectAnswers * 100.0 / @NumOfQuestions;
   END
   SET NOCOUNT ON
	   INSERT INTO StudentExam(StudentID, ExamID, Grade, CorrectAnswers, FalseAnswers) 
         VALUES (@StudentID, @ExamID, @Grade, @CorrectAnswers, @FalseAnswers);
END
GO
