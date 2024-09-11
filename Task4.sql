USE ShopDB;
GO;

CREATE FUNCTION CalculateTotalAmount (@CustomerId INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Total DECIMAL(10, 2);
    SET @Total = (SELECT SUM(Amount) FROM Orders WHERE CustomerID = @CustomerId);

    RETURN @Total
END;