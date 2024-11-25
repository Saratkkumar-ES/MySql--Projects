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

-- 3 List the distinct country names from the Persons table

SELECT DISTINCT Country_name
FROM Persons;

-- 4 first names and last names from the Persons table with aliases

SELECT Fname AS First_Name, Lname AS Last_Name
FROM Persons;

-- 5 persons with a rating greater than 4.0.

SELECT * FROM Persons
WHERE Rating > 4.0;

-- 6 countries with a population greater than 10 lakhs
SELECT *
FROM Country
WHERE Population > 1000000;

-- 7 persons who are from 'USA' or have a rating greater than 4.5
SELECT *
FROM Persons
WHERE Country_name = 'USA' OR Rating > 4.5;

-- 8 persons where the country name is NULL
SELECT *
FROM Persons
WHERE Country_name IS NULL;
-- 9 all persons from the countries 'USA', 'Canada', and 'UK'

SELECT *
FROM Persons
WHERE Country_name IN ('USA', 'Canada', 'UK');

-- 10 Find all persons not from the countries 'India' and 'Australia'
SELECT *
FROM Persons
WHERE Country_name NOT IN ('India', 'Australia');

-- 11 countries with a population between 5 lakhs and 20 lakhs
SELECT *
FROM Country
WHERE Population BETWEEN 500000 AND 2000000;

-- 12  Find all countries whose names do not start with 'C'
SELECT *
FROM Country
WHERE Country_name NOT LIKE 'C%';