-- Creating Database School
CREATE DATABASE School;

-- Use the School database
USE School;
-- Creating a table named STUDENT
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);

-- Insert data
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) 
VALUES 
(1, 'Manu M', 85, 'A'),
(2, 'Arun S', 78, 'B'),
(3, 'Anil Joshy', 92, 'A');

SELECT * FROM STUDENT;

#1 Alter + Drop
-- Adding column named Contact to the STUDENT table

ALTER TABLE STUDENT 
ADD Contact VARCHAR(15);


#2 Alter + Drop
-- Remove the Grade column from the STUDENT table
ALTER TABLE STUDENT 

DROP COLUMN Grade;

#3 Rename
-- Rename the table from STUDENT to Students and to ClassTen
RENAME TABLE STUDENT TO Students;
RENAME TABLE STUDENTs TO ClassTen;

#4 delete
-- Delete all rows from the Students table
TRUNCATE TABLE CLASSTEN;

SELECT * FROM CLASSTEN;
#5 Removing the CLASSTEN table from the database

DROP TABLE CLASSTEN;

