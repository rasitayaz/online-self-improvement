USE ONLINE_SELF_IMPROVEMENT
--DROP VIEW InstructorInfo;
GO
CREATE VIEW InstructorInfo AS
SELECT p.ID, p.FirstName, p.LastName, p.MailAddress, p.PhoneNumber, p.ZIP, p.City, p.District, p.Gender,
    i.Salary, SUM(DurationInMins) AS TotalMinsInLastWeek
FROM Person p, Instructor i LEFT JOIN
    (SELECT InstructorID, DurationInMins, [Date]
    FROM Meeting
    WHERE
        [Date] >= DATEADD(dd, ((DATEDIFF(dd, '01-01-1900', GETDATE()) / 7) * 7) - 7, '01-01-1900') AND
        [Date] <= DATEADD(dd, ((DATEDIFF(dd, '01-01-1900', GETDATE()) / 7) * 7) - 1, '01-01-1900')
    ) AS m on i.PersonID = m.InstructorID
WHERE p.ID = i.PersonID  
GROUP BY p.ID, p.FirstName, p.LastName, p.MailAddress, p.PhoneNumber, p.ZIP, p.City, p.District, p.Gender, i.Salary
GO
