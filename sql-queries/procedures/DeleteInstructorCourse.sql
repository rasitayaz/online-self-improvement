USE ONLINE_SELF_IMPROVEMENT;

--DROP PROCEDURE DeleteInstructorCourse;

GO
CREATE PROCEDURE DeleteInstructorCourse
	@InstructorID SMALLINT,
	@CourseID SMALLINT
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM InstructorCourse
		WHERE @InstructorID=InstructorCourse.InstructorID AND @CourseID=InstructorCourse.CourseID;
END
GO