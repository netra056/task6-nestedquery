CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    hire_date DATE
);

CREATE TABLE projects3 (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    employee_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
INSERT INTO projects (project_id, project_name, employee_id, start_date, end_date) VALUES
(201, 'Onboarding Revamp', 101, '2023-01-01', '2023-06-30'),
(202, 'CRM Upgrade', 102, '2022-09-15', '2023-03-15'),
(203, 'Website Redesign', 104, '2023-04-01', '2023-10-01'),
(204, 'Sales Strategy 2025', 105, '2024-01-10', '2024-12-31');





INSERT INTO employees (employee_id, name, salary, department_id, hire_date) VALUES
(101, 'Alice Sharma', 75000.00, 1, '2020-03-15'),
(102, 'Ravi Kumar', 68000.00, 2, '2019-07-22'),
(103, 'Meena Joshi', 82000.00, 1, '2021-01-10'),
(104, 'John Dsouza', 60000.00, 3, '2018-11-05'),
(105, 'Priya Desai', 90000.00, 2, '2022-06-30');

select * from employees;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);

INSERT INTO departments (department_id, department_name, location) VALUES
(1, 'Human Resources', 'Mumbai'),
(2, 'Sales', 'Delhi'),
(3, 'IT Support', 'Bangalore');


-- Scalar Subqueries
--A scalar subquery returns a single value (one row, one column).
SELECT employee_id, name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


--The subquery returns a single value: average salary.
-- Used with > operator.
-- Correlated Subqueries
--A correlated subquery refers to columns from the outer query and is evaluated for each row.

SELECT e.employee_id, e.name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);



-- Subqueries with IN


SELECT employee_id, name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'New York'
);


-- Subqueries with EXISTS
SELECT employee_id, name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM projects3 p
    WHERE p.employee_id = e.employee_id
);


--. Subqueries with =

SELECT name
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
