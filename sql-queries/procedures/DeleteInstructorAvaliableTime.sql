USE ONLINE_SELF_IMPROVEMENT;

--DROP PROCEDURE DeleteInstructorAvailableTime;

GO
CREATE PROCEDURE DeleteInstructorAvailableTime
	@InstructorID SMALLINT,
	@StartTime NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM InstructorAvailableTime
		WHERE @InstructorID=InstructorAvailableTime.InstructorID AND @StartTime=InstructorAvailableTime.StartTime;
END
GO

