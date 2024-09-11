USE ShopDB;
GO;

CREATE FUNCTION GetCustomerStatus (@CustomerId INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @Total DECIMAL(10, 2);
    SET @Total = (SELECT SUM(Amount) FROM Orders WHERE CustomerID = @CustomerId);

    DECLARE @Status VARCHAR(50);

    IF @Total < 300
        SET @Status = 'Bronze';
    ELSE IF @Total < 1000
        SET @Status = 'Silver';
    ELSE
        SET @Status = 'Gold';

    RETURN @Status
END;

--DECLARE @returnVal VARCHAR(50);
--EXEC @returnVal = GetCustomerStatus @CustomerId = 20;
--PRINT @returnVal;