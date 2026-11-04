-- Database Creation --
CREATE DATABASE College_db;

-- set the database --
USE college_db;

-- Create a table under college_db database --
CREATE TABLE Students(
Student_ID int,
Student_Name varchar(30),
Age int,
Department varchar(30),
City varchar(15),
Marks int);

-- Insert the data into table --
INSERT INTO students values
(101,'Arun',21,'Python','Chennai',85),
(102,'Priya',22,'java','Madurai',90),
(103,'Kumar',20,'Python','Coimbatore',75),
(104,'Divya',21,'SQL','Chennai',95),
(105,'Rahul',23,'Java','Salem',80);

-- 1. Display all columns from the Students table.
SELECT * FROM Students;

-- 2. Display only Student_Name and Department.
SELECT Student_Name,Department FROM Students;

-- 3. Display only Student_Name and Marks.
SELECT Student_Name,Marks FROM Students;

-- 4. Display all student records in ascending order of Marks
SELECT * FROM Students
ORDER BY Marks ASC;

-- 5. Display all student records in descending order of Marks.
SELECT * FROM Students
ORDER BY Marks DESC;

-- 6. Display student names in alphabetical order.
SELECT Student_Name FROM Students
ORDER BY Student_Name ASC;

-- 7. Display student records in descending order of Student_ID.
SELECT * FROM Students
ORDER BY Student_ID DESC;