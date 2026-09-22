DROP TABLE IF EXISTS Customers_table;

CREATE TABLE Customers_table(CustomerID INT PRIMARY KEY,Name VARCHAR(50),Email VARCHAR(50),Address VARCHAR(100));

INSERT INTO Customers_table(CustomerID,Name,Email,Address)
VALUES
(1,'alice','a@gmail.com','25 Green Park Avenue, Near City Mall, Satellite Road, Ahmedabad, Gujarat, India - 380015'),
(2,'prince','p@gmail.com','142 Sunrise Residency, Opposite Central Park, MG Road, Pune, Maharashtra, India - 411001'),
(3,'juli','j@gmail.com','78 Lake View Street, Near Metro Station, Anna Nagar, Chennai, Tamil Nadu, India - 600040'),
(4,'priya','pi@gmail.com','56 Royal Garden Road, Near Railway Station, Salt Lake City, Kolkata, West Bengal, India - 700091'),
(5,'kiya','k@gmail.com','89 Silver Oak Society, Near Riverfront Park, Paldi Road, Ahmedabad, Gujarat, India - 380007');

SELECT * FROM Customers_table;

UPDATE Customers_table
SET Address = '34 Shanti Nagar Road, Near City Center, Vastrapur, Ahmedabad, Gujarat, India - 380052'
WHERE CustomerID = 2;

DELETE FROM Customers_table
WHERE CustomerID = 3;

SELECT * FROM Customers_table
WHERE Name = 'alice';

DROP TABLE IF EXISTS Orders_table;
CREATE TABLE Orders_table(OrderID INT PRIMARY KEY,CustomerID INT,OrderDate DATE,TotalAmount DECIMAL(10,2));
INSERT INTO Orders_table
(OrderID,CustomerID,OrderDate,TotalAmount)
VALUES 
(1,11,'2026-3-2',2300.23),
(2,12,'2025-4-2',2400.12),
(3,13,'2025-3-2',2100.12),
(4,14,'2024-2-2',2600.12),
(5,15,'2026-5-2',2200.12);

SELECT * FROM Orders_table;

UPDATE Orders_table
SET TotalAmount = 2400.33;

DELETE FROM Orders_table 
WHERE OrderID = 4;

SELECT *  FROM Orders_table
WHERE OrderDate <='2026-9-22';

SELECT
MAX(TotalAmount) AS highest_amount ,
AVG(TotalAmount) AS average_amount, 
MIN(TotalAmount) AS lowest_amount 
FROM Orders_table;

DROP TABLE IF EXISTS Products_table;

CREATE TABLE Products_table(productID INT,productName VARCHAR(50),price INT,stock INT);

INSERT INTO Products_table(productID,productName,price,stock)
VALUES (1,'pencil',2400,21),
(2,'eraser',20,20),
(3,'sharpner',2,30),
(4,'book',29,30),
(5,'colorbook',22,30);

SELECT productName,price FROM Products_table ORDER BY price DESC;

UPDATE Products_table
SET price = 32
WHERE productID = 4;

DELETE FROM Products_table
WHERE stock = 0;

SELECT productName FROM Products_table
WHERE price >= 500 AND price <= 2000;

SELECT
MAX(price) AS highest_price ,
MIN(price) AS lowest_price 
FROM Products_table;

DROP TABLE IF EXISTS Orderdetails_table;

CREATE TABLE Orderdetails_table(OrderdetailID INT PRIMARY KEY,OrderID INT,ProductID INT,Quantity INT,SubTotal INT);

INSERT INTO Orderdetails_table(OrderdetailID,OrderID,ProductID,Quantity,SubTotal)
VALUES
(1,11,101,23,2300),
(2,12,102,24,2200),
(3,13,103,25,2400),
(4,14,104,26,2600),
(5,15,105,27,2700);

SELECT * FROM Orderdetails_table;

SELECT SUM(Quantity * SubTotal) 
FROM Orderdetails_table;

SELECT * FROM Orderdetails_table LIMIT 3;

SELECT COUNT(*) AS product_sold_times FROM Orderdetails_table
ORDER BY ProductID;
