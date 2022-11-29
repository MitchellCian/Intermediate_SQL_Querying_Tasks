USE QATSQLPLUS

-- Task 2
ALTER FUNCTION udf_DelegateDays()
RETURNS TABLE
AS 
RETURN (
SELECT d.DelegateID, SUM(cr.DurationDays) as DelegateDays, COUNT(*) as DelegateCourses 
FROM Delegate as d
INNER JOIN
DelegateAttendance as da
ON d.DelegateID = da.DelegateID
INNER JOIN 
CourseRun as cr
ON cr.CourseRunID = da.CourseRunID
GROUP BY d.DelegateID 
)
-- Task 3
CREATE FUNCTION dbo.udf_IndividualDelegateDays(@DelegateID INT)
RETURNS TABLE
AS 
RETURN (
	SELECT @DelegateID as DelegateID, 
		SUM(cr.DurationDays) as DelegateDays, 
		COUNT(*) as DelegateCourses 
FROM Delegate as d
INNER JOIN
DelegateAttendance as da
ON d.DelegateID = da.DelegateID
INNER JOIN 
CourseRun as cr
ON cr.CourseRunID = da.CourseRunID
WHERE d.DelegateID = @DelegateID
)
GO
SELECT * FROM dbo.udf_IndividualDelegateDays(1)

-- DERIVED TABLES
USE Northwind
SELECT * FROM (
	SELECT TOP 3 CustomerID FROM orders GROUP BY CustomerID ORDER BY Count(CustomerID)
) AS DervivedTable

--Find all the products that are priced avove average for their category

Use Northwind
SELECT ProductName, UnitPrice, CategoryName, AveragePrice FROM Products AS p
INNER JOIN
(
	SELECT CategoryID, 
	AVG(UnitPrice) AS AveragePrice FROM PRODUCTS 
	GROUP BY CategoryID
) AS DerivedAveragePrice
ON p.CategoryID = DerivedAveragePrice.CategoryID
JOIN Categories as C
ON
p.CategoryID = c.CategoryID
WHERE UnitPrice >= AveragePrice

