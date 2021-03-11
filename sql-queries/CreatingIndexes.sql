USE ONLINE_SELF_IMPROVEMENT;

CREATE INDEX IDX_FullName
ON Person (FirstName, LastName);

CREATE UNIQUE INDEX IDX_CourseName
ON Course (Name);

CREATE INDEX IDX_MainGrade
ON StudentCourse (MainGrade);