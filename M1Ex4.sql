USE QATSQLPLUS
-- Task 1

SELECT CourseRunID, StartDate 
FROM CourseRun as cr
INNER JOIN
Trainer as t
ON cr.TrainerID = t.TrainerID
WHERE TrainerName = 'Jason Bourne'

-- Task 2
GO
WITH BourneCourses AS (
SELECT CourseRunID, StartDate 
FROM CourseRun as cr
INNER JOIN
Trainer as t
ON cr.TrainerID = t.TrainerID
WHERE TrainerName = 'Jason Bourne'
)
SELECT * FROM BourneCourses

--Task 3
GO

WITH BourneCourses AS (
SELECT CourseRunID, StartDate 
FROM CourseRun as cr
INNER JOIN
Trainer as t
ON cr.TrainerID = t.TrainerID
WHERE TrainerName = 'Jason Bourne'
)

SELECT d.DelegateID, d.DelegateName, d.CompanyName, StartDate 
	FROM Delegate AS d
		INNER JOIN DelegateAttendance as da 
		ON d.DelegateID = da.DelegateID
			INNER JOIN BourneCourses as JB
				ON da.CourseRunID = JB.CourseRunID

GO