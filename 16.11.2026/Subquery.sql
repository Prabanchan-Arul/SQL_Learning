-- Database and Table Creation --
CREATE DATABASE AmazonDB;

USE AmazonDB;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30)
);

INSERT INTO employees VALUES
(101, 'Arun', 'IT', 50000, 'Chennai'),
(102, 'Priya', 'HR', 35000, 'Bangalore'),
(103, 'Kumar', 'IT', 60000, 'Chennai'),
(104, 'Divya', 'Finance', 45000, 'Madurai'),
(105, 'Ravi', 'HR', 30000, 'Chennai'),
(106, 'Meena', 'Finance', 55000, 'Bangalore'),
(107, 'Suresh', 'IT', 40000, 'Madurai'),
(108, 'Anu', 'Finance', 70000, 'Chennai');

-- SUBQUERY CONCEPTS --

-- 1.find the Employees salary more than Average
-- Query:
select * from Employees
where salary > (select Avg(salary) from employees);

-- 2. find the employees who earns highest salary
-- Query:
select * from Employees
where salary = (select max(salary)
from Employees);


-- Multiple subquery --
-- select * from Employees
-- where department in ('IT','hr');


-- select distinct(department) from Employees
-- where City = "chennai";

-- 3. 
select * from Employees
where department in (select distinct(department) from
employees where city ="madurai");

-- 4.find the employee whose greater than hr department 
-- query:
-- any
Select * from Employees
where salary > any (select salary from Employees
where department = 'hr');

-- All
-- Query:
Select * from Employees
where salary > all (select salary from Employees
where department = 'hr');


-- average salary of each department
select avg(salary) ,department from
employees
group by department;

-- CORRELATED SUB-QUERY --
select * from Employees t1
where salary > (select avg(salary) from employees t2
where t2.department < t1.department);