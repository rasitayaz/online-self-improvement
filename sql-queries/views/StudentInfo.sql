USE ONLINE_SELF_IMPROVEMENT
--DROP VIEW StudentInfo;
GO
CREATE VIEW StudentInfo AS
SELECT p.ID, p.FirstName, p.LastName, p.MailAddress, p.PhoneNumber, COUNT(sc.CourseID) AS NumOfCourses,
    p.ZIP, p.City, p.District, p.Gender, s.Age, s.BirthDate, s.Payment, s.RegistrationDate,
    sp.FullName AS ParentName, sp.Occupation AS ParentOccupation, sp.PhoneNumber AS ParentPhoneNumber
FROM Person p,
    Student s LEFT JOIN Parent sp ON s.PersonID = sp.StudentID
    LEFT JOIN
    (SELECT StudentID, CourseID FROM StudentCourse) AS sc ON sc.StudentID = s.PersonID
WHERE p.ID = s.PersonID
GROUP BY p.ID, p.FirstName, p.LastName, p.MailAddress, p.PhoneNumber,
    p.ZIP, p.City, p.District, p.Gender, s.Age, s.BirthDate, s.Payment, s.RegistrationDate,
    sp.FullName, sp.Occupation, sp.PhoneNumber
GO
