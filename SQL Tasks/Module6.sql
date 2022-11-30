--Module 6
-- Exercise 1
-- Task 1
EXEC sp_addmessage 50003, 16, 'Vendor %s cannot be found'
GO

-- Task 2
RAISERROR (50003, 16, 1, 'Red Hat')
GO

-- Exercise 2
-- Task 1/2
USE QATSQLPLUS
DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'QA'

IF @Vendor IS NULL
	BEGIN;
	THROW 54000,'Vendor must not be NULL',1
	RETURN
	END

IF NOT EXISTS (SELECT * FROM Vendor WHERE VendorName = @Vendor)
	BEGIN;
	THROW 54000,'Vendor cannot be found',1
	RETURN
	END

SELECT *
	FROM Course AS c
		INNER JOIN Vendor AS v
			ON c.VendorID = v.VendorID
	WHERE VendorName = @Vendor	
GO

-- EXERCISE 3
BEGIN TRY
UPDATE dbo.Vendor
SET VendorName = NULL
	WHERE VendorID = 1
END TRY
BEGIN CATCH
	THROW 60000,'Error occurred within the procedure', 1
END CATCH
GO