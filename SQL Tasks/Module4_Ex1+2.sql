-- PIVOT
USE Northwind
SELECT 
'Total Revenue' AS RevenuePerYear, [1996], [1997], [1998]
FROM
(
SELECT YEAR(OrderDate) AS ORderYear, UnitPRice * Quantity AS OrderPrice
FROM
Orders AS o
JOIN 
[Order Details] AS od
ON
o.OrderID = od.OrderID
) AS OrdersByYear
PIVOT
( 
SUM(OrderPrice) FOR OrderYear IN ([1996], [1997], [1998])
) AS Pivotted

GO

-- ADVANCED GROUPING
-- Total orders per year and month
SELECT
	YEAR(OrderDate) AS OrderYear,
	MONTH(OrderDate) AS OrderMonth,
	COUNT(*) AS TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth

-- Module 4
-- EXERCISE 1
-- Task 1
USE QATSQLPLUS
SELECT VendorName, CourseName, StartDate, NumberDelegates FROM VendorCourseDateDelegateCount

-- Task 2
SELECT VendorName, StartDate, NumberDelegates FROM VendorCourseDateDelegateCount

SELECT * 
FROM (
SELECT VendorName, StartDate, NumberDelegates FROM VendorCourseDateDelegateCount) AS BaseData

SELECT * 
FROM (
SELECT VendorName, CourseName, StartDate, NumberDelegates FROM VendorCourseDateDelegateCount) AS BaseData
PIVOT
(SUM(NumberDelegates) FOR VendorName IN (Qa, Microsoft, Oracle)) AS Pivotted

-- EXERCISE 2
--Task1
SELECT VendorName, CourseName, StartDate, SUM(NumberDelegates) AS TotalDelegates 
FROM VendorCourseDateDelegateCount
GROUP BY VendorName, CourseName, StartDate

SELECT VendorName, CourseName, StartDate, SUM(NumberDelegates) AS TotalDelegates 
FROM VendorCourseDateDelegateCount
GROUP BY VendorName, CourseName, StartDate
WITH ROLLUP

--Task2
SELECT VendorName, CourseName, StartDate, SUM(NumberDelegates) AS TotalDelegates 
FROM VendorCourseDateDelegateCount
GROUP BY GROUPING SETS ((VendorName), (VendorName, CourseName, StartDate))

SELECT VendorName, CourseName, StartDate, 
	SUM(NumberDelegates) AS TotalDelegates,
	GROUPING_ID(VendorName, CourseName, StartDate) AS GroupingType
FROM VendorCourseDateDelegateCount
GROUP BY GROUPING SETS ((VendorName), (VendorName, CourseName), (VendorName, CourseName, StartDate))


