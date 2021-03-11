USE ONLINE_SELF_IMPROVEMENT
--DROP VIEW MeetingInfo;
GO
CREATE VIEW MeetingInfo AS
SELECT m.ID,
    si.ID AS StudentID, si.FirstName + ' ' + si.LastName AS StudentName,
    ii.ID AS InstructorID, ii.FirstName + ' ' + ii.LastName AS InstructorName,
    c.ID AS CourseID, c.Name AS CourseName, m.[Date], m.DurationInMins
FROM Meeting m,
    (SELECT ID, FirstName, LastName FROM StudentInfo) AS si,
    (SELECT ID, FirstName, LastName FROM InstructorInfo) AS ii,
    (SELECT ID, Name FROM Course) AS c
WHERE m.StudentID = si.ID AND m.InstructorID = ii.ID AND m.CourseID = c.ID
GO
