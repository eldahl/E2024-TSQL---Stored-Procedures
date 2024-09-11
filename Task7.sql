USE ShopDB;
GO;

CREATE TRIGGER OnDeleteCustomer ON Customers
    FOR DELETE
AS
BEGIN
    DECLARE @deletedCustId INT;
    SELECT @deletedCustId = CustomerID FROM DELETED;

    DECLARE @AmountOfOrders INT;
    SET @AmountOfOrders = (SELECT COUNT(*) FROM Orders WHERE CustomerID = @deletedCustId);

    IF @AmountOfOrders > 0
        RAISERROR(N'Cannot delete Customer, because of existing number of Orders: ', 50000, -1, -1, @AmountOfOrders);
END;