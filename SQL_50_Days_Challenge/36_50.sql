DROP TABLE IF EXISTS employees;
-- Creating the employees table
CREATE TABLE employees (
    employee_id int identity(1,1) PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Inserting sample data for employees
INSERT INTO employees (employee_name, department, salary) 
VALUES
    ('John Doe', 'HR', 50000.00),
    ('Jane Smith', 'HR', 55000.00),
    ('Michael Johnson', 'HR', 60000.00),
    ('Emily Davis', 'IT', 60000.00),
    ('David Brown', 'IT', 65000.00),
    ('Sarah Wilson', 'Finance', 70000.00),
    ('Robert Taylor', 'Finance', 75000.00),
    ('Jennifer Martinez', 'Finance', 80000.00);

/*
-- Q 1.
You have a table with below COLUMNS
emp_id employee_name, department, salary

Find the details of employees whose salary is greater
than the average salary across the entire company.
*/

select * from employees where salary > (select AVG(salary) from employees);

/*
-- Q 2.
You have a table with below COLUMNS
emp_id employee_name, department, salary

Find the details of employees whose salary is greater
than the average salary for each Department.
*/

select * from employees e1 where salary>
(
select AVG(salary) from employees e2
where e1.department = e2.department
);