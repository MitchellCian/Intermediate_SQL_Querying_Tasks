-- Exercise 1 
--Task 1
USE QATSQLPLUS
SELECT ProductID, TransferDate, TransferAmount 
FROM BookTransfers

-- Task 2
SELECT ProductID, SUM(TransferAmount ) AS Stock
FROM BookTransfers
GROUP BY ProductID

-- Task 3
SELECT ProductID, TransferDate, TransferAmount,
	SUM(TransferAmount) OVER
	(PARTITION BY ProductID ORDER BY TransferDate)
	AS RunningStock
	FROM BookTransfers

-- Exercise 2
-- Task 1
SELECT * FROM VendorCourseDelegateCount

--
GO
SELECT *,
	RANK() OVER (ORDER BY NumberDelegates DESC)
	AS LeaguePosition_Rank,
	DENSE_RANK() OVER (ORDER BY NumberDelegates DESC)
	AS LeaguePosition_DenseRank,
	ROW_NUMBER() OVER (ORDER BY NumberDelegates DESC)
	AS LeaguePosition_Row,
	NTILE(3) OVER (ORDER BY NumberDelegates DESC)
	AS LeaguePosition_Ntile
	FROM VendorCourseDelegateCount

GO

-- Task 2
SELECT * FROM VendorCourseDelegateCount


--
SELECT *, RANK() OVER (PARTITION BY VendorName ORDER BY NumberDelegates DESC)
FROM VendorCourseDelegateCount
GO

--
SELECT VendorName, CourseName, NumberDelegates
FROM (
SELECT *,
	RANK() OVER (PARTITION BY VendorName ORDER BY NumberDelegates DESC) AS LeaguePosition
FROM VendorCourseDelegateCount
) AS Del
WHERE LeaguePosition = 1
GO
