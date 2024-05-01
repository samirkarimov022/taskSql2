CREATE DATABASE AB106

USE AB106


CREATE TABLE Roles (
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Roles (Id, Name) VALUES
(1, 'Admin1'),
(2, 'Admin2'),
(3, 'Admin3');


CREATE TABLE Users (
    Id INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50),
    RoleId INT,
    FOREIGN KEY (RoleId) REFERENCES Roles(Id)
);

INSERT INTO Users (Id, Username, Password, RoleId) VALUES
(1, 'admin1user', '12345', 1),
(2, 'admin2user', '23456', 2),
(3, 'admin3user', '34567', 3);

CREATE TABLE Categories (
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Categories (Id, Name) VALUES
(1, 'Category A'),
(2, 'Category B');

CREATE TABLE Products (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Price DECIMAL CHECK(Price > 0),
    Cost DECIMAL CHECK(Cost > 0),
    CategoryId INT,
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

INSERT INTO Products (Id, Name, Price, Cost, CategoryId) VALUES
(1, 'Product1', 10.00, 5.00, 1),
(2, 'Product2', 15.00, 7.00, 2),
(3, 'Product3', 20.00, 10.00, 1);


CREATE TABLE Sizes (
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Sizes (Id, Name) VALUES
(1, 'Small'),
(2, 'Medium'),
(3, 'Large');

CREATE TABLE ProductSizes (
    ProductId INT,
    SizeId INT,
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (SizeId) REFERENCES Sizes(Id)
);

INSERT INTO ProductSizes (ProductId, SizeId) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3);

SELECT * FROM Users AS u
INNER JOIN Roles AS r
ON u.RoleId = r.Id

SELECT p.Name AS ProductName, c.Name AS CategoryName, s.Name AS SizeName
FROM Products p
INNER JOIN Categories as c ON p.CategoryId = c.Id
INNER JOIN ProductSizes as ps ON p.Id = ps.ProductId
INNER JOIN Sizes as s ON ps.SizeId = s.Id
