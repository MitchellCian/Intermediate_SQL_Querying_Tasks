Use Northwind

GO
CREATE VIEW ReportsToPlus AS (
SELECT 
m.FirstName + m.LastName AS ManagerName, e.FirstName + e.LastName as EmployeeName
From 
Employees as e
JOIN
Employees as m
ON 
e.ReportsTo = m.EmployeeID
)
GO

CREATE VIEW Top50Orders AS (
	SELECT 
	TOP 50 o.CustomerID, o.OrderDate, od.UnitPrice  * od.Quantity AS OrderPrice
	FROM [Order Details] AS od
	JOIN Orders AS o 
	ON od.OrderID = o.OrderID
	ORDER BY OrderPrice DESC
)
GO
SELECT * FROM Top50Orders
GO

-- Exercise 1 
-- Task 1
USE QATSQLPLUS

SELECT c.CourseName, c.CourseID, v.VendorName FROM Vendor as v
JOIN
Course as c
ON
c.VendorID = v.VendorID


-- Task 2
USE QATSQLPLUS
GO
CREATE VIEW CourseList AS (
SELECT c.CourseName, c.CourseID, v.VendorName FROM Vendor as v
JOIN
Course as c
ON
c.VendorID = v.VendorID
)
GO
SELECT * FROM CourseList

-- Table Valued Functions (TVFs: Views with parameters)
-- TOP 50 orders but you can specify a start year and customer ID
-- TOP 50 orders placed by a customer after a certain date
USE Northwind
SELECT DISTINCT CustomerID FROM Customers

GO
CREATE FUNCTION TopOrderFunc(@StartDate DateTime, @CustomerID VARCHAR(10)) -- Keywords name (Params)
RETURNS TABLE -- retrun type (literally the type that will be returned)
AS  -- same as with a view
RETURN -- returns the value
	SELECT TOP 50 
	o.CustomerID, o.OrderDate, od.UnitPrice  * od.Quantity AS TotalPrice
	FROM 
	Orders AS o JOIN [Order Details] AS od 
	ON od.OrderID = o.OrderID
	JOIN Products AS p
	ON od.ProductID = p.ProductID
	WHERE o.OrderDate >= @StartDate AND o.CustomerID = @CustomerID
	ORDER BY TotalPrice DESC
GO

SELECT * FROM TopOrderFunc('1998-02-01', 'QUICK')

GO

--That finds revenue per year from a provided starting year
ALTER FUNCTION dbo.RevenuePeryear(@StartYear INT)
RETURNS @Revenue TABLE (FinancialYear INT, Revenue MONEY)
BEGIN -- START
	INSERT INTO @Revenue
		SELECT YEAR(OrderDate) AS [Year], SUM(UnitPrice * Quantity) AS TotalRevenue
		FROM dbo.Orders AS o JOIN dbo.[Order Details] AS od ON o.OrderID = od.OrderID
		WHERE YEAR (OrderDate) >= @StartYear
		GROUP BY Year(OrderDate)
		ORDER BY [YEAR] ASC
	RETURN
END -- STOP
GO
SELECT * FROM dbo.RevenuePeryear(1998)
GO