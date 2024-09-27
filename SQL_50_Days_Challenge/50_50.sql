
drop table if exists Employees;
CREATE TABLE employees (
    employee_id int identity(1,1) PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert records for three departments
INSERT INTO employees (name, department, salary) VALUES 
('John Doe', 'Engineering', 63000),
('Jane Smith', 'Engineering', 55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);

/*

Write the SQL query to find the second highest salary

*/

-- Sol 1

select * from Employees order by Salary desc offset 1 rows
fetch next 1 rows only;

-- Sol 2

with cte as (
select *,
ROW_NUMBER() over(order by salary desc) rn
from employees
)
select employee_id, Name, Department, Salary from cte where rn = 2;
