Use ONLINE_SELF_IMPROVEMENT;

--DROP TRIGGER TrgUpdateAvailableTime;
GO
CREATE TRIGGER TrgUpdateAvailableTime
ON Meeting
AFTER INSERT

AS
BEGIN
	Declare @MeetingDate SMALLDATETIME;
	Declare @InstructorID SMALLINT;

	Select @MeetingDate=i.Date, @InstructorID=i.InstructorID
	FROM inserted i

	Delete iat
	FROM InstructorAvailableTime iat
	WHERE @MeetingDate=iat.StartTime and @InstructorID=iat.InstructorID

END

