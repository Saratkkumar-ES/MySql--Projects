create database School;
use school;
-- Create the Teachers table
CREATE TABLE Teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

-- inserting values

INSERT INTO Teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice', 'Math', 5, 40000),
(2, 'Bob', 'Science', 8, 50000),
(3, 'Charlie', 'English', 12, 55000),
(4, 'Diana', 'History', 3, 35000),
(5, 'Ethan', 'Physics', 10, 60000),
(6, 'Fiona', 'Chemistry', 15, 65000),
(7, 'George', 'Biology', 7, 48000),
(8, 'Hannah', 'Geography', 2, 30000);



-- 1 creating Before Insert Trigger to Prevent Negative Salaries

DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;

INSERT INTO teachers (id, name, subject, experience, salary) 
VALUES (9, 'Ivan', 'Music', 4, -10000);

INSERT INTO teachers (id, name, subject, experience, salary) 
VALUES (9, 'Ivan', 'Music', 4, 40000);

SELECT * FROM teacher_log;

-- 2 Creating an After Insert Trigger to Log Inserted Rows

# Creating the `teacher_log` table
CREATE TABLE teacher_log (
log_id INT AUTO_INCREMENT PRIMARY KEY,
teacher_id INT,
action VARCHAR(50),
timestamp DATETIME
);

# creating the after_insert_teacher trigger
DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
INSERT INTO teacher_log (teacher_id, action, timestamp)
VALUES (NEW.id, 'INSERT', NOW());
END //

DELIMITER ;

-- 3 Before Delete Trigger to Prevent Deletion of Experienced Teachers
DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
IF OLD.experience > 10 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Cannot delete teachers with experience greater than 10 years';
END IF;
END //

DELIMITER ;

DELETE FROM teachers WHERE id = 3;
DELETE FROM teachers WHERE id = 4; 
SELECT * FROM teacher_log;

-- 4 After Delete Trigger to Log Deleted Rows
DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
INSERT INTO teacher_log (teacher_id, action, timestamp)
VALUES (OLD.id, 'DELETE', NOW());
END //

DELIMITER ;



SELECT * FROM teacher_log;
DELETE FROM teachers WHERE id = 1;
SELECT * FROM teacher_log WHERE action = 'DELETE';
DELETE FROM teachers WHERE id = 6;

SELECT * FROM teacher_log WHERE action = 'DELETE';
