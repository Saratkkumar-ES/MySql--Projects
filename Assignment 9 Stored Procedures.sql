-- Creating Database
create database	Plant_DB;
use Plant_DB;

-- Create the Worker table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

drop table Worker;
-- Inserting values
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) 
VALUES
(1, 'Rajesh', 'Sharma', 45000, '2020-01-15', 'IT'),
(2, 'Aditi', 'Verma', 52000, '2019-05-10', 'HR'),
(3, 'John', 'Doe', 60000, '2018-07-20', 'Finance'),
(4, 'Priya', 'Mehta', 47000, '2021-03-12', 'IT'),
(5, 'Karan', 'Singh', 55000, '2022-08-25', 'Operations'),
(6, 'Emily', 'Davis', 50000, '2020-11-30', 'Finance'),
(7, 'Ravi', 'Kumar', 48000, '2019-02-18', 'HR'),
(8, 'Sophia', 'Brown', 53000, '2021-06-05', 'Operations'),
(9, 'Aarav', 'Patel', 62000, '2017-09-22', 'IT'),
(10, 'Olivia', 'Wilson', 58000, '2022-01-10', 'Finance');

-- 1 Creating Stored Procedures
# Stored Procedure to Add a New Record

delimiter //
create procedure AddWorker(
in p_worker_ID int, in p_FirstName Char(25),
in p_LastName Char(25),
in p_salary int(15),
in p_JoiningDate datetime,
In p_Department char (25))

Begin
insert into worker(Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
Values (p.Worker_Id, p.FirstName, p.LastName, p.Salary, p.JoiningDate, p.Department);
end//
Delimiter ;
CALL AddWorker(11, 'John', 'Doe', 50000, '2024-01-01 10:00:00', 'HR');

-- 2 procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
# It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. 
# Then make the procedure call.

DELIMITER ;

delimiter //
create procedure GetSalary(
in P_Worker_Id int,
out p_Salary int)
Begin
select Salary into p_Salary
from Worker where Worker_Id = p_Worker_Id;
end //
delimiter ;

# procedure
set @Salary =0;
call	GetSalary(1, @Salary);
select @Salary;

select * from Worker;
-- 3 stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
# It should update the department of the worker with the given ID and Then make a procedure call. 
DELIMITER //

CREATE PROCEDURE UpdateDepartment(
IN p_Worker_Id INT,
IN p_Department CHAR(25))
BEGIN
UPDATE Worker
SET Department = p_Department
WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

CALL UpdateDepartment(1, 'Finance');
select * from Worker;

-- 4 Stored Procedure to Count Workers in a Department
# IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 
# retrieve the number of workers in the given department and returns it in the p_workerCount parameter and then Make procedure call


DELIMITER //
CREATE PROCEDURE GetWorkerCount(
IN p_Department CHAR(25),
OUT p_workerCount INT)
BEGIN
SELECT COUNT(*) INTO p_workerCount
FROM Worker WHERE Department = p_Department;
END //

DELIMITER ;

SET @workerCount = 0;
CALL GetWorkerCount('HR', @workerCount);
SELECT @workerCount;

USE Plant_DB;
SHOW PROCEDURE STATUS WHERE Db = 'Plant_DB';

-- 5 Stored Procedure to Calculate Average Salary
DELIMITER //

CREATE PROCEDURE GetAverageSalary(
IN p_Department CHAR(25),
OUT p_avgSalary FLOAT
)
BEGIN
SELECT AVG(Salary) INTO p_avgSalary
FROM Worker
WHERE Department = p_Department;
END //

DELIMITER ;

SET @avgSalary = 0;
CALL GetAverageSalary('Finance', @avgSalary);
SELECT @avgSalary;

-- View all data in Worker table
SELECT * FROM Worker;

-- Check the total number of workers
SELECT COUNT(*) AS TotalWorkers FROM Worker;


