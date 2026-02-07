/*
PROJECT: Employee Data Analysis
DESCRIPTION: Technical analysis of employee demographics and department performance.
			 Focuses on data cleaning and identifying high-level staffing trends.
TABLES: employees, department_mappings, salary_history
*/

CREATE DATABASE people;

CREATE TABLE employees (
		id			INT PRIMARY KEY,
		first_name	NVARCHAR(20),
		last_name	NVARCHAR(20),
		department	NVARCHAR(20),
		salary		DECIMAL	(10,2)
);

INSERT INTO employees (id, first_name, last_name, department, salary)
VALUES
	('1', 'Paul', 'Garrix', 'Corporate', 3547.25);

INSERT INTO employees (id, first_name, last_name, department, salary)
VALUES
	(2, 'Astrid', 'Fox', 'Private Individuals', 2845.56),
	(3, 'Matthias', 'Johnson', 'Private Individuals', 3009.41),
	(4, 'Lucy', 'Patterson', 'Private Individuals', 3547.25),
	(5, 'Tom', 'Page', 'Corporate', 5974.41),
	(6, 'Claudia', 'Conte', 'Corporate', 4714.12),
	(7, 'Walter', 'Deer', 'Private Individuals', 3547.25),
	(8, 'Stephanie', 'Marx', 'Corporate', 2894.51),
	(9, 'Luca', 'Pavarotti', 'Private Individuals', 4123.45),
	(10, 'Victoria', 'Pollock', 'Corporate', 4789.53);

INSERT INTO employees (id, first_name, last_name, department, salary)
VALUES
	(11, 'John', 'Doe', 'Corporate', 6000.00),
	(12, 'Jane', 'Smith', 'Private Individuals', 4500.75),
	(13, 'Michael', 'Johnson', 'Corporate', 5200.50),
	(14, 'Emily', 'Williams', 'Private Individuals', 3800.25),
	(15, 'David', 'Brown', 'Corporate', 4800.75),
	(16, 'Sophia', 'Miller', 'Private Individuals', 3200.00),
	(17, 'Daniel', 'Clark', 'Private Individuals', 4100.50),
	(18, 'Olivia', 'Anderson', 'Corporate', 5500.25),
	(19, 'Christopher', 'Moore', 'Private Individuals', 3600.00),
	(20, 'Emma', 'Taylor', 'Corporate', 5100.75),
	(21, 'Liam', 'Hill', 'Corporate', 4300.50),
	(22, 'Isabella', 'Ward', 'Private Individuals', 5900.25),
	(23, 'William', 'Carter', 'Corporate', 4900.75),
	(24, 'Sophie', 'Jones', 'Private Individuals', 3200.00),
	(25, 'Ethan', 'Hall', 'Corporate', 4100.50),
	(26, 'Mia', 'Davis', 'Private Individuals', 3600.00),
	(27, 'Aiden', 'Baker', 'Corporate', 5100.75),
	(28, 'Ella', 'Cooper', 'Private Individuals', 4300.50),
	(29, 'Carter', 'Perry', 'Corporate', 5900.25),
	(30, 'Mila', 'Evans', 'Private Individuals', 4900.75),
	(31, 'James', 'Lopez', 'Corporate', 3200.00),
	(32, 'Ava', 'Rivera', 'Private Individuals', 4100.50),
	(33, 'Liam', 'Bryant', 'Corporate', 3600.00),
	(34, 'Olivia', 'Hudson', 'Private Individuals', 5100.75),
	(35, 'Noah', 'Watson', 'Corporate', 4300.50),
	(36, 'Sophia', 'Fisher', 'Private Individuals', 5900.25),
	(37, 'Ethan', 'Bell', 'Corporate', 4900.75),
	(38, 'Ava', 'Fletcher', 'Private Individuals', 3200.00),
	(39, 'Lucas', 'Murray', 'Corporate', 4100.50),
	(40, 'Chloe', 'Simmons', 'Private Individuals', 3600.00),
	(41, 'Mason', 'Perkins', 'Corporate', 5100.75),
	(42, 'Harper', 'Harrison', 'Private Individuals', 4300.50),
	(43, 'Aiden', 'Andrews', 'Corporate', 5900.25),
	(44, 'Ella', 'Knight', 'Private Individuals', 4900.75),
	(45, 'Caleb', 'Fox', 'Corporate', 3200.00),
	(46, 'Aria', 'Gibson', 'Private Individuals', 4100.50),
	(47, 'Jackson', 'Reed', 'Corporate', 3600.00),
	(48, 'Scarlett', 'Cox', 'Private Individuals', 5100.75),
	(49, 'Logan', 'Hunt', 'Corporate', 4300.50),
	(50, 'Lily', 'Grant', 'Private Individuals', 5900.25);

-- searching the database

SELECT [id]
FROM [people].[dbo].[employees]

SELECT first_name, last_name
FROM [people].[dbo].[employees]

SELECT *		-- all columns
FROM employees  -- all collumns from the employee table 

SELECT *
FROM employees
WHERE id = 4

SELECT *
FROM employees
WHERE department = 'corporate'

SELECT *
FROM employees
ORDER BY last_name DESC --ASC a-z / DESC z-a

SELECT *
FROM employees
Order By salary DESC, last_name ASC

SELECT *
FROM employees
WHERE id <> 26 -- selecting a range 
ORDER BY last_name ASC

--TASK 1
SELECT *
FROM employees
WHERE salary < 3000
ORDER BY last_name

--TASK 2
SELECT first_name, last_name
FROM employees
WHERE department = 'private individuals'
ORDER BY last_name DESC

--TASK 3
SELECT *
FROM employees
WHERE department = 'corporate'
ORDER BY salary DESC

--TASK 4 
SELECT last_name, salary
FROM employees
WHERE salary >=4000 and salary <= 5000
ORDER BY salary ASC

SELECT first_name, last_name, salary
FROM employees
WHERE salary >= 4000
ORDER BY salary DESC, last_name ASC, first_name ASC

-- Wild Card using the %

SELECT *
FROM employees
WHERE first_name LIKE '%y' -- any character and any number of characters 

SELECT *
FROM employees
WHERE first_name LIKE '%on%'


SELECT *
FROM employees
WHERE first_name LIKE 'L___' -- any single character 


--output shows only paul and tom detail 
SELECT *
FROM employees
WHERE first_name IN ('Paul', 'Tom')

--output is department in alphabetical order with highest salary 
SELECT *
FROM employees
WHERE department IN ('Corporate')
ORDER BY department ASC, salary DESC

-- Output show everything but paul and tome 
SELECT *
FROM employees
WHERE first_name NOT IN ('Paul', 'Tom')

INSERT INTO employees (id, first_name, last_name, department, salary)
VALUES
	(51, 'Rio', 'Black', 'Home Office', 5100.75),
	(52, 'Jamie', 'Cairney', 'Home Office', 4300.50),
	(53, 'Abdul', 'Andrews', 'Home Office', 5900.25),
	(54, 'Thom', 'Night', 'Home Office', 4900.75),
	(55, 'Jeremy', 'Brown', 'Home Office', 3200.00),
	(56, 'Mohamed', 'Gohed', 'Home Office', 4100.50),
	(57, 'Tulip', 'Read', 'Home Office', 3600.00),
	(58, 'Scarlett', 'Brown', 'Home Office', 5100.75),
	(59, 'Paige', 'Thirst', 'Home Office', 4300.50),
	(60, 'Joanne', 'Hussain', 'Home Office', 5900.25);

-- common aggregations

-- shows average salary for home office department if you want to show
SELECT department, avg(salary) AS avg_salary, sum (salary) AS total_salary
FROM employees
WHERE department = 'Home Office'
GROUP BY department 

-- updating information for a specific customer
UPDATE employees
SET first_name = 'Jo' 
WHERE ID = 60 

-- removing a row matching a condition 
DELETE FROM employees
WHERE id = 60 

SELECT *
FROM employees