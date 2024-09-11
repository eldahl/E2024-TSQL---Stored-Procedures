USE ShopDB;
GO;

CREATE PROCEDURE GetOrdersForCustomer
    @CustomerId INT
AS
BEGIN
    SELECT * FROM Orders WHERE CustomerID = @CustomerId;
END;
