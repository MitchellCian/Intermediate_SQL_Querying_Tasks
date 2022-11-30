-- Module 2 
-- Exercise 1
--Task1
USE QATSQLPLUS
SELECT VendorName, PhoneNumber FROM Vendor

--Task 2
SELECT TrainerName, PhoneNumber FROM Trainer

--Task3
SELECT VendorName, PhoneNumber FROM Vendor
UNION
SELECT TrainerName, PhoneNumber FROM Trainer

SELECT VendorName, PhoneNumber FROM Vendor
UNION ALL
SELECT TrainerName, PhoneNumber FROM Trainer

SELECT 'Vendor' AS ContactType, ContactName, PhoneNumber FROM Vendor
UNION
SELECT 'Trainer' AS ContactType, ContactName, PhoneNumber FROM Vendor

-- Exercise 2
-- Task 1
SELECT DelegateID FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON cr.CourseID = c.CourseID
WHERE CourseName = 'QATSQL'

-- Task 2
SELECT DelegateID FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON cr.CourseID = c.CourseID
WHERE CourseName = 'QATSQLPLUS'

-- Task 3
SELECT DelegateID FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON cr.CourseID = c.CourseID
WHERE CourseName = 'QATSQL'
INTERSECT
SELECT DelegateID FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON cr.CourseID = c.CourseID
WHERE CourseName = 'QATSQLPLUS'

--EXERCISE 3
-- Task 1
SELECT DelegateID FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON cr.CourseID = c.CourseID
WHERE CourseName = 'QATSQL'
EXCEPT
SELECT DelegateID FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON cr.CourseID = c.CourseID
WHERE CourseName = 'QATSQLPLUS'

SELECT DelegateID FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON cr.CourseID = c.CourseID
WHERE CourseName = 'QATSQLPLUS'
EXCEPT
SELECT DelegateID FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON cr.CourseID = c.CourseID
WHERE CourseName = 'QATSQL'