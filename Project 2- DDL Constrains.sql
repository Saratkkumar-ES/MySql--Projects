
-- 1. Create a database called Sales

CREATE DATABASE Sales;

USE Sales;
 -- 2 Create a table named Orders 

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,              
    CustomerName VARCHAR(100) NOT NULL,    
    ProductCategory VARCHAR(50),
    OrderedItem VARCHAR(100),
    ContactNo VARCHAR(15) UNIQUE
    );
    
-- 3 Adding new column OrderQuantity to the Orders table

ALTER TABLE Orders 
ADD OrderQuantity INT;

Select * from Orders;

-- 4 Rename  Orders table to Sales_Orders

RENAME TABLE Orders TO sales_orders;

#6. Insert 10 rows into the sales_orders table

INSERT INTO sales_Orders (OrderId, CustomerName, ProductCategory, OrderedItem, ContactNo, OrderQuantity)
VALUES
(1, 'Alice', 'Electronics', 'Smartphone', '1234567890', 2),
(2, 'Bob', 'Home Appliances', 'Vacuum Cleaner', '2345678901', 1),
(3, 'Charlie', 'Furniture', 'Dining Table', '3456789012', 1),
(4, 'David', 'Clothing', 'Jacket', '4567890123', 3),
(5, 'Eva', 'Books', 'Fiction', '5678901234', 4),
(6, 'Frank', 'Electronics', 'Laptop', '6789012345', 1),
(7, 'Grace', 'Groceries', 'Rice', '7890123456', 5),
(8, 'Hannah', 'Footwear', 'Running Shoes', '8901234567', 2),
(9, 'Ian', 'Accessories', 'Watch', '9012345678', 1),
(10, 'Jack', 'Beauty Products', 'Perfume', '0123456789', 3);

Select * from Sales_Orders;

# 7 Retrieve Customer name and Ordered item
SELECT CustomerName, OrderedItem 
FROM sales_Orders;

 # 8 Update the product category for any row
UPDATE sales_orders
SET ProductCategory = 'Mobile Devices'
WHERE OrderId = 1;

# 9 Deleting the sales_orders table

DROP TABLE sales_orders;
SHOW TABLES;