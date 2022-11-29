-- EXERCISE 3 Task 1
USE QATSQLPLUS
SELECT CourseRunID, StartDate FROM CourseRun as cr
INNER JOIN
Trainer as t
ON cr.TrainerID = t.TrainerID
WHERE TrainerName = 'Jason Bourne'

-- Task 2
SELECT d.DelegateID, d.DelegateName, d.CompanyName, StartDate 
	FROM Delegate AS d
		INNER JOIN DelegateAttendance as da 
		ON d.DelegateID = da.DelegateID
			INNER JOIN (
				SELECT CourseRunID, StartDate 
				FROM Trainer as t
				INNER JOIN CourseRun as cr
				ON t.TrainerID = cr.TrainerID
			WHERE TrainerName = 'Jason Bourne'
	) AS JB
ON da.CourseRunID = JB.CourseRunID

-- CTEs
Use Northwind
SELECT * FROM Employees
GO
WITH OrgStructure AS (
	SELECT EmployeeID, FirstName, ReportsTo FROM Employees Where ReportsTo IS NULL
	UNION ALL
	SELECT e.EmployeeID, e.FirstName, e.ReportsTo 
	FROM
	Employees AS e
	INNER JOIN
	OrgStructure AS o
	ON 
	o.EmployeeID = e.ReportsTo
)
SELECT * FROM OrgStructure
GO