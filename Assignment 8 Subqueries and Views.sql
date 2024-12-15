-- Creating Database and tables
create database PopulationDB;
use PopulationDB;
-- 1 Creating country table and persons table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population BIGINT,
    Area DECIMAL(10, 2)
);
desc country;

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population BIGINT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
Desc Persons;

-- 2 Inserting values

INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833517),
(2, 'India', 1393409038, 3287263),
(3, 'Canada', 38005238, 9984670),
(4, 'UK', 68207114, 243610),
(5, 'Australia', 25687041, 7692024),
(6, 'Germany', 83240525, 357022),
(7, 'France', 67804115, 551695),
(8, 'China', 1444216107, 9596961),
(9, 'Japan', 125960000, 377975),
(10, 'Brazil', 213993437, 8515770);

select * from Country;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'Michael', 'Smith', 331000000, 4.5, 1, 'USA'),
(2, 'Ravi', 'Patel', 1393409038, 3.8, 2, 'India'),
(3, 'Samantha', 'Jones', 38005238, 4.6, 3, 'Canada'),
(4, 'Oliver', 'Williams', 68207114, 4.2, 4, 'UK'),
(5, 'Emma', 'Taylor', 25687041, 4.1, 5, 'Australia'),
(6, 'Stefan', 'Schmidt', 83240525, 3.7, 6, 'Germany'),
(7, 'Isabelle', 'Martin', 67804115, 4.8, 7, 'France'),
(8, 'Wei', 'Zhang', 1444216107, 4.0, 8, 'China'),
(9, 'Haruto', 'Tanaka', 125960000, 4.3, 9, 'Japan'),
(10, 'Lucas', 'Gonzalez', 213993437, 4.4, 10, 'Brazil');

select * from Persons;


-- 1 Add a New Column Called DOB in the Persons Table
ALTER TABLE Persons
ADD DOB DATE;


-- 2 User-Defined Function to Calculate Age Using DOB
DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //

DELIMITER ;

-- query to fetch the Age of all persons 
UPDATE Persons 
SET DOB = '1990-05-15' WHERE Id = 1;
UPDATE Persons 
SET DOB = '1985-08-20' WHERE Id = 2;
UPDATE Persons 
SET DOB = '1993-12-10' WHERE Id = 3;
UPDATE Persons 
SET DOB = '1998-03-25' WHERE Id = 4;
UPDATE Persons 
SET DOB = '1991-07-19' WHERE Id = 5;
UPDATE Persons 
SET DOB = '1982-11-30' WHERE Id = 6;
UPDATE Persons 
SET DOB = '1995-04-05' WHERE Id = 7;
UPDATE Persons 
SET DOB = '1989-01-13' WHERE Id = 8;
UPDATE Persons 
SET DOB = '1997-06-22' WHERE Id = 9;
UPDATE Persons 
SET DOB = '1992-09-08' WHERE Id = 10;

# Fetch the ages
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

-- 4 length of each country name in the Country table

SELECT Country_name, CHAR_LENGTH(Country_name) AS Length
FROM Country;


-- 5 Extract the first three characters of each country's name
SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeCharacters
FROM Country;

-- 6 Convert all country names to uppercase and lowercase

SELECT UPPER(Country_name) AS Uppercase_Country_Name
FROM Country;

SELECT lower(Country_name) AS lowercase_Country_Name
FROM Country;

-- Assignment 8 Subqueries and Views

# 1 number of persons in each country
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name;

# 2 number of persons in each country sorted from high to low

SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

# 3 average rating for Persons in respective countries if the average is greater than 3.0


SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;


# 4 countries with the same rating as the USA

SELECT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons 
WHERE Country_name = 'USA');

# 5 countries whose population is greater than the average population of all nations

SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);


-- Creating Database Product
CREATE DATABASE Product;

USE Product;

-- Creating Customer Table
CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

-- Inserting Values

INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '123 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India'),
('Ananya', 'Iyer', 'ananya.iyer@example.com', '9876543211', '456 T Nagar', 'Chennai', 'Tamil Nadu', '600017', 'India'),
('Rohan', 'Verma', 'rohan.verma@example.com', '9876543212', '789 Sector 14', 'Gurgaon', 'Haryana', '122001', 'India'),
('Diya', 'Patel', 'diya.patel@example.com', '9876543213', '101 Lake View', 'Ahmedabad', 'Gujarat', '380001', 'India'),
('Ishaan', 'Singh', 'ishaan.singh@example.com', '9876543214', '303 Civil Lines', 'Jaipur', 'Rajasthan', '302001', 'India'),
('Meera', 'Rao', 'meera.rao@example.com', '9876543215', '505 Mall Road', 'Pune', 'Maharashtra', '411001', 'India'),
('Karan', 'Gupta', 'karan.gupta@example.com', '9876543216', '707 Park Street', 'Kolkata', 'West Bengal', '700001', 'India'),
('Sanya', 'Mehta', 'sanya.mehta@example.com', '9876543217', '909 Jubilee Hills', 'Hyderabad', 'Telangana', '500033', 'India'),
('Aditya', 'Kapoor', 'aditya.kapoor@example.com', '9876543218', '111 Palm Grove', 'Bengaluru', 'Karnataka', '560001', 'India'),
('Nisha', 'Joshi', 'nisha.joshi@example.com', '9876543219', '222 Mission Street', 'Thiruvananthapuram', 'Kerala', '695001', 'India');


INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '555 Elm Street', 'New York', 'New York', '10001', 'USA'),
('Emily', 'Clark', 'emily.clark@example.com', '1234567891', '222 Oak Avenue', 'San Francisco', 'California', '94103', 'USA'),
('James', 'Smith', 'james.smith@example.com', '7894561230', '77 London Road', 'London', 'England', 'EC1A1BB', 'UK'),
('Sophie', 'Taylor', 'sophie.taylor@example.com', '7894561231', '10 Kings Street', 'Manchester', 'England', 'M11AE', 'UK'),
('Liam', 'Brown', 'liam.brown@example.com', '9876543120', '99 Bay Street', 'Toronto', 'Ontario', 'M5J2X2', 'Canada'),
('Olivia', 'Wilson', 'olivia.wilson@example.com', '9876543121', '12 Maple Drive', 'Vancouver', 'British Columbia', 'V5K0A1', 'Canada'),
('Noah', 'Williams', 'noah.williams@example.com', '9123456780', '45 Queen Street', 'Sydney', 'New South Wales', '2000', 'Australia');

-- Creating a view called customer_info that displays Customer’s Full name and email address
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

SELECT * FROM customer_info;

--  CreatING a view named US_Customers that displays customers located in the US
CREATE VIEW USA_Customers AS
SELECT * from Customer where Country = 'USA';
SELECT * FROM USA_Customers;

SELECT * FROM USA_Customers;

-- Creating view named Customer_details

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;

create view Customer_details as	
select concat(First_name,' ', Last_name) as Full_Name, Email, Phone_no, State
From Customer;
SELECT * FROM Customer_details;

-- Updating phone numbers of customers who live in California

SET SQL_SAFE_UPDATES = 0;


update Customer 
set Phone_no = 'UpdatedPhoneNumber'
where State = 'California';
SELECT * FROM Customer_details WHERE State = 'California';


-- Count the number of customers in each state and show only states with more than 5 customers

select state, count(*) as 
Number_of_Customers from Customer
group by State having count(*) > 5;

-- return the number of customers in each state, based on the state column in the Customer_details view

select State, count(*) as Number_of_Customers
from Customer_details group by State;

-- Query for returns all the columns from the Customer_details view, sorted by the state column in ascending order

SELECT * FROM Customer_details
ORDER BY State ASC;

-- end --