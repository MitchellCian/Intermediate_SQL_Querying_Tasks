-- Exercise 5
USE QATSQLPLUS
-- TASK 1
SELECT * FROM Course WHERE VendorID = 2

-- TASK 2
SELECT * INTO #MicrosoftLocal
FROM Course WHERE VendorID = 2
SELECT * INTO #MicrosoftGlobal
FROM Course WHERE VendorID = 2
GO
SELECT * FROM #MicrosoftLocal

SELECT * FROM #MicrosoftGlobal