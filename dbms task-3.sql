CREATE DATABASE BrightMartDB;
USE BrightMartDB;

CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY AUTO_INCREMENT,
    Seller_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Address VARCHAR(200) NOT NULL);
    
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_ID INT NOT NULL,
    Seller_ID INT NOT NULL,
    Stock_Quantity INT NOT NULL CHECK (Stock_Quantity >= 0),
    Stock_Status VARCHAR(20) NOT NULL
        CHECK (Stock_Status IN ('Available', 'Out of Stock')),
    Last_Updated DATE NOT NULL,

    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID));

INSERT INTO Seller
(Seller_Name, Email, Phone, Address)
VALUES
('ABC Traders', 'abc@gmail.com', '9876543210', 'Chennai'),
('Raja Suppliers', 'raja@gmail.com', '9876543211', 'Madurai'),
('Sri Stores', 'sri@gmail.com', '9876543212', 'Thoothukudi'),
('Bright Suppliers', 'bright@gmail.com', '9876543213', 'Coimbatore'),
('JJ Enterprises', 'jj@gmail.com', '9876543214', 'Tirunelveli');

INSERT INTO Inventory
(Product_ID, Seller_ID, Stock_Quantity, Stock_Status, Last_Updated)
VALUES
(1, 1, 50, 'Available', '2026-09-25'),
(2, 1, 25, 'Available', '2026-09-25'),
(3, 2, 8, 'Available', '2026-09-25'),
(4, 2, 0, 'Out of Stock', '2026-09-25'),

INSERT INTO Seller
(Seller_Name, Email, Phone, Address)
VALUES
('New Seller', 'new@gmail.com', '9876543215', 'Chennai');

INSERT INTO Inventory
(Product_ID, Seller_ID, Stock_Quantity, Stock_Status, Last_Updated)
VALUES
(1, 2, 20, 'Available', '2026-09-25');

SELECT s.Seller_Name, i.Product_ID, i.Stock_Quantity
FROM Seller s
JOIN Inventory i
ON s.Seller_ID = i.Seller_ID;

SELECT s.Seller_Name, COUNT(i.Product_ID) AS Product_Count
FROM Seller s
LEFT JOIN Inventory i
ON s.Seller_ID = i.Seller_ID
GROUP BY s.Seller_Name;

UPDATE Seller
SET Phone = '9999999999',
    Address = 'Chennai'
WHERE Seller_ID = 1;

SELECT *
FROM Inventory
WHERE Stock_Status = 'Available';

SELECT *
FROM Inventory
WHERE Stock_Status = 'Out of Stock';

SELECT *
FROM Inventory
WHERE Stock_Quantity < 10;

UPDATE Inventory
SET Stock_Quantity = 40,
    Stock_Status = 'Available',
    Last_Updated = '2026-09-25'
WHERE Inventory_ID = 1;

DELETE FROM Inventory
WHERE Inventory_ID = 8;

SELECT s.Seller_Name,
       i.Product_ID,
       i.Stock_Quantity,
       i.Stock_Status
FROM Seller s
JOIN Inventory i
ON s.Seller_ID = i.Seller_ID;

SELECT Product_ID,
       Stock_Quantity,
       Stock_Status
FROM Inventory;

SELECT COUNT(*) AS Total_Available_Products
FROM Inventory
WHERE Stock_Status = 'Available';

SELECT COUNT(*) AS Out_of_Stock_Products
FROM Inventory
WHERE Stock_Status = 'Out of Stock';

SELECT Product_ID, Stock_Quantity
FROM Inventory
ORDER BY Stock_Quantity DESC
LIMIT 1;

SELECT AVG(Stock_Quantity) AS Average_Inventory
FROM Inventory;