USE Northwind

-- TEMP TABLES

CREATE TABLE #AveragesLocal (
	[Year] INT,
	AveragePrice Money
)

INSERT INTO #AveragesLocal
				SELECT
					YEAR(o.OrderDate),
					AVG(od.UnitPrice * od.Quantity)
					FROM 
					Orders AS o
					JOIN
					[Order Details] AS od
					ON 
					o.OrderID = od.OrderID
					GROUP BY YEAR(o.OrderDate)
SELECT * FROM #AveragesLocal 

-- TABLE VARIABLES

DECLARE @AveragesTV TABLE (
	[Year] INT,
	AveragePrice Money
)

INSERT INTO @AveragesTV
				SELECT
					YEAR(o.OrderDate),
					AVG(od.UnitPrice * od.Quantity)
					FROM 
					Orders AS o
					JOIN
					[Order Details] AS od
					ON 
					o.OrderID = od.OrderID
					GROUP BY YEAR(o.OrderDate)
SELECT * FROM @AveragesTV



