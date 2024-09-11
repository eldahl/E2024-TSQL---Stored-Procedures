USE ShopDB;
GO;

CREATE TRIGGER UpdateStatus ON Orders
    AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @insertedCustId INT;
    SELECT @insertedCustId = CustomerID FROM INSERTED;

    DECLARE @returnVal VARCHAR(50);
    EXEC @returnVal = GetCustomerStatus @CustomerId = @insertedCustId;

    UPDATE Customers SET
        Status = @returnVal
    WHERE CustomerID = @insertedCustId;
END;