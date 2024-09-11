USE ShopDB;
GO;

CREATE PROCEDURE GetOrdersInDateRange
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT * FROM Orders WHERE OrderDate > @StartDate AND OrderDate < @EndDate;
END;