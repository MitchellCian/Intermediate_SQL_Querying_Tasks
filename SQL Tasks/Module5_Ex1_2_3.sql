-- Module 5 Exercise 1
DECLARE @StartDT datetime = GETDATE()
DECLARE @EndDt datetime -- This wasn't there in the original
DECLARE @Vendor VARCHAR(50)
PRINT @StartDT
-- GO removed

DECLARE @X INT = 0
WHILE @X < 100
	BEGIN
		PRINT @X
		SET @X = @X + 1
	END
SET @EndDT = GETDATE()
SELECT @StartDT, @EndDT

IF EXISTS (SELECT * FROM sysobjects WHERE Name = 'NewView')
	DROP VIEW dbo.NewView
GO
-- Go was inserted here, because create view needs a go ahead of it

CREATE VIEW dbo.NewView AS
	SELECT * FROM dbo.Delegate
GO

-- EXERCISE 2
DECLARE @TotalDelegates INT 
SELECT @TotalDelegates FROM Delegate
PRINT @TotalDelegates

--Exercise 3
-- Task 1/2
/* DECLARE @Vendor VARCHAR(100)
SET @Vendor = NULL

IF @Vendor IS NULL
PRINT 'Vendor is not allowed to be null'
ELSE
SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor
GO */

--Task 3
/* DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'AQ'

IF NOT EXISTS (SELECT* FROM Vendor WHERE VendorName = @Vendor)
PRINT 'Vendor is not allowed to be null'
ELSE
SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor
GO */

-- Task 4
DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'AQ'

IF @Vendor IS NULL
	BEGIN 
	PRINT 'Vendor is not allowed to be null'
	RETURN
	END

IF NOT EXISTS (SELECT* FROM Vendor WHERE VendorName = @Vendor)
	BEGIN
	PRINT 'Invalid vendor name'
	RETURN
	END

SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor
GO