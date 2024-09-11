USE ShopDB;
GO;

CREATE PROCEDURE CreateCustomer
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @RegistrationDate DATETIME,
    @Status NVARCHAR(50)
AS
BEGIN
    INSERT INTO Customers(Name, Email, RegistrationDate, Status)
    VALUES(@Name, @Email, @RegistrationDate, @Status);
END;

CREATE PROCEDURE UpdateCustomer
    @CustomerId INT,
    @Name NVARCHAR(100) = NULL,
    @Email NVARCHAR(100) = NULL,
    @RegistrationDate DATETIME = NULL,
    @Status NVARCHAR(50) = NULL
AS
BEGIN
    UPDATE Customers SET
        Name = ISNULL(@Name, Name),
        Email = ISNULL(@Email, Email),
        RegistrationDate = ISNULL(@RegistrationDate, RegistrationDate),
        Status = ISNULL(@Status, Status)
    WHERE CustomerID = @CustomerId;
END;

CREATE PROCEDURE DeleteCustomer
     @CustomerId INT
AS
BEGIN
    DELETE FROM Customers WHERE CustomerID = @CustomerId;
END;