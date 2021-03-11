USE ONLINE_SELF_IMPROVEMENT;

---DROP PROCEDURE AddInstructorAvailableTime;

GO
CREATE PROCEDURE AddInstructorAvailableTime
  @InstructorID SMALLINT,
  @StartTime NVARCHAR(50)
AS
BEGIN
   SET NOCOUNT ON
	   INSERT INTO InstructorAvailableTime(InstructorID,StartTime) 
       VALUES ( @InstructorID, @StartTime);
END
GO




