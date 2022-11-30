-- EXERCISE 1 
-- Task 2	
USE QATSQLPLUS
DECLARE @ProductID INT = 1
DECLARE @Amount INT = 1

IF (@ProductID IS NULL OR @Amount IS NULL)
	BEGIN;
	THROW 59999, 'Neither variable is allowed to be NULL',1
	RETURN
	END

BEGIN TRY
	BEGIN TRAN
	INSERT INTO BookTransfers VALUES
	(@ProductID,getdate(),'Transfer Out',-@Amount)
	UPDATE BookStock
	SET StockAmount = StockAmount - @Amount
	WHERE ProductID = @ProductID	
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
	THROW 59999,'An error occurred in the transaction. Everything rolled back',1
END CATCH
GO
