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
