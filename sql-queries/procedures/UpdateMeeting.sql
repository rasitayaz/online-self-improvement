USE ONLINE_SELF_IMPROVEMENT;

---DROP PROCEDURE UpdateMeeting;

GO
CREATE PROCEDURE UpdateMeeting
   @MeetingID SMALLINT,
   @Date VARCHAR(15),
   @DurationInMins TINYINT
AS
BEGIN
	SET NOCOUNT ON
	UPDATE Meeting 
	SET Date = @Date
	WHERE @Date IS NOT NULL	and ID = @MeetingID
	UPDATE Meeting 
	SET DurationInMins = @DurationInMins
	WHERE @DurationInMins IS NOT NULL	and ID = @MeetingID 

END
GO
