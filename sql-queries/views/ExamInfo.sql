USE ONLINE_SELF_IMPROVEMENT
--DROP VIEW ExamInfo;
GO
CREATE VIEW ExamInfo AS
SELECT
    e.ID, e.NumOfQuestions, COUNT(se.StudentID) AS NumOfStudents, e.CourseID, c.Name AS CourseName,
    CAST (AVG(se.Grade * 1.0) AS FLOAT) AS AvgGrade, MAX(se.Grade) AS MaxGrade, MIN(se.Grade) AS MinGrade
FROM Exam e
    LEFT JOIN
    (SELECT StudentID, ExamID, Grade FROM StudentExam) AS se
        ON se.ExamID = e.ID,
    (SELECT ID, Name FROM Course) AS c
WHERE c.ID = e.CourseID
GROUP BY e.ID, e.NumOfQuestions, e.CourseID, c.Name
GO
