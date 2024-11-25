-- Crateing Data base and table
create database CompanyDataBase;
Use  CompanyDataBase;

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18 AND Age <= 65),  -- Check constraint for valid age
    Last_Update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

-- 1 inserting values

INSERT INTO Managers (Manager_Id, First_Name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'Aaliya', 'Khan', '1990-01-15', 34, 'Female', 'HR', 28000),
(2, 'Rohan', 'Verma', '1985-03-10', 39, 'Male', 'IT', 40000),
(3, 'Sneha', 'Sharma', '1992-05-25', 32, 'Female', 'Finance', 35000),
(4, 'Anil', 'Kumar', '1988-07-12', 36, 'Male', 'IT', 30000),
(5, 'Priya', 'Mehra', '1995-09-20', 29, 'Female', 'Marketing', 25000),
(6, 'Vikram', 'Singh', '1987-11-30', 37, 'Male', 'Operations', 45000),
(7, 'Sahil', 'Gupta', '1993-02-14', 31, 'Male', 'IT', 22000),
(8, 'Neha', 'Pandey', '1991-04-18', 33, 'Female', 'Finance', 32000),
(9, 'Amit', 'Joshi', '1994-08-05', 30, 'Male', 'HR', 28000),
(10, 'Kavita', 'Rao', '1989-06-21', 35, 'Female', 'IT', 27000);

select * from managers;

-- 2 Retrieving the name and date of birth of the manager with Manager_Id

SELECT First_Name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 1;

SELECT First_Name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 7;

-- 3 annual income of all managers

SELECT Manager_Id, First_Name, Last_Name, (Salary * 12) AS Annual_Income
FROM Managers;

-- 4 display records of all managers except ‘Aaliya’

SELECT *
FROM Managers
WHERE First_Name != 'Aaliya';

-- 5 details of managers whose department is IT and earns more than 25000 per month

SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

-- 6 display details of managers whose salary is between 10000 and 35000.
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;

