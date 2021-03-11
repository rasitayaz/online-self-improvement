USE ONLINE_SELF_IMPROVEMENT
--DROP VIEW StudentExamInfo;
GO
CREATE VIEW StudentExamInfo AS
SELECT
    ei.ID AS ExamID, si.ID AS StudentID, si.FirstName + ' ' + si.LastName AS StudentName,
    ei.NumOfQuestions, se.CorrectAnswers, se.FalseAnswers, se.Grade, CAST(CASE WHEN se.Grade >= ei.AvgGrade THEN 1 ELSE 0 END AS BIT) AS IsAboveAvg
FROM StudentExam se,
    (SELECT ID, FirstName, LastName FROM StudentInfo) AS si,
    (SELECT * FROM ExamInfo) AS ei
WHERE se.StudentID = si.ID AND se.ExamID = ei.ID
GROUP BY ei.ID, si.ID, si.FirstName + ' ' + si.LastName, ei.NumOfQuestions, se.CorrectAnswers, se.FalseAnswers, se.Grade, ei.AvgGrade
GO
