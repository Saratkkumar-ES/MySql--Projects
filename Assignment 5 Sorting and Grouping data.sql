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


## Joins and Union

-- 1 Inner Join, Left Join, and Right Join

# Inner Join

SELECT Persons.Fname, Persons.Lname, Country.Country_name, Country.Population
FROM Persons
INNER JOIN Country ON Persons.Country_Id = Country.Id;

# Left Join
SELECT Persons.Fname, Persons.Lname, Country.Country_name, Country.Population
FROM Persons
LEFT JOIN Country ON Persons.Country_Id = Country.Id;

# Right Join
SELECT Persons.Fname, Persons.Lname, Country.Country_name, Country.Population
FROM Persons
RIGHT JOIN Country ON Persons.Country_Id = Country.Id;

-- 2 Distinct Country Names from Both Tables

SELECT DISTINCT Country_name
FROM (
    SELECT Country_name FROM Country
    UNION
    SELECT Country_name FROM Persons
) AS Countries;

-- 3 List all country names from both the Country and Persons tables, including duplicates

SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

-- 4 Round the ratings of all persons to the nearest integer in the Persons table.

SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;


## Sorting and Grouping data

-- 1 Concatenate First Name and Last Name

SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM Persons;

-- 2 count the number of unique country names from Persons table.
SELECT COUNT(DISTINCT Country_name) AS Unique_Country_Count
FROM Persons;

-- 3  maximum population from the Country table

SELECT MAX(Population) AS Max_Population
FROM Country;

-- 4 The minimum population from Persons table

SELECT MIN(Population) AS MinPopulation
FROM Persons;

-- 5 Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
# Inserting two Raws in to Persons

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(11, 'Arjun', NULL, 200000, 4.3, 2, 'India'),
(12, 'Priya', NULL, 300000, 4.2, 2, 'India');

# COUNT LNAME
SELECT COUNT(*) AS Null_Last_Name_Count
FROM Persons
WHERE Lname IS  NOT NULL;

-- 6 number of rows in the Persons table
SELECT COUNT(*) AS Total_Rows
FROM Persons;

-- 7 population of the Country table for the first 3 rows.

SELECT Population FROM Country
LIMIT 3;

-- 7 print 3 random rows of countries.

SELECT * FROM Country ORDER BY RAND()
LIMIT 3;

-- 8 List all persons ordered by their rating in descending order.
SELECT * FROM Persons
ORDER BY Rating DESC;

-- 9 total population for each country in the Persons table

SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_Name;

-- 10 countries in the Persons table with a total population greater than 50,000

SELECT Country_name FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- 11 List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.

SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Average_Rating ;