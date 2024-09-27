

drop table if exists customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Create spending records table
CREATE TABLE spending_records (
    record_id INT PRIMARY KEY,
    customer_id INT,
    spending_amount DECIMAL(10, 2),
    spending_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert example data into customers table
INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'Bob'),
(4, 'Charlie');

-- Insert example data into spending records table
INSERT INTO spending_records (record_id, customer_id, spending_amount, spending_date) VALUES
(9, 1, 120.00, '2024-03-25'),
(10, 2, 80.00, '2024-03-25'),
(11, 3, 150.00, '2024-03-25'),
(12, 4, 70.00, '2024-03-25'),
(13, 1, 90.00, '2024-03-02'),
(14, 2, 100.00, '2024-04-02'),
(15, 3, 160.00, '2024-04-02'),
(16, 4, 30.00, '2024-03-02'),
(17, 1, 110.00, '2024-04-09'),
(18, 2, 70.00, '2024-02-09'),
(19, 3, 140.00, '2024-03-09'),
(20, 4, 60.00, '2024-04-09'),
(21, 1, 100.00, '2024-03-16'),
(22, 2, 60.00, '2024-03-16'),
(23, 3, 130.00, '2024-03-16'),
(24, 4, 50.00, '2024-04-16'),
(25, 1, 80.00, '2024-03-23'),
(26, 2, 50.00, '2024-04-23'),
(27, 3, 120.00, '2024-04-23'),
(28, 4, 40.00, '2024-04-23'),
(29, 1, 70.00, '2024-04-30'),
(30, 2, 40.00, '2024-04-30'),
(31, 3, 110.00, '2024-03-01'),
(32, 4, 30.00, '2024-03-01');

/*

-- Amazon Data Analyst Interview Question

You are given two table of amazon
spending_records and customers 

Write a SQL query to show all customers
and their total spending show only those
customers whos total spending has reduced
compare to last month ()

Return customer_name, customer_id, 
last MONTH spend, current month spent 

-- Note consider last month as March
Current Month as April
*/

with current_month as (
select customer_id, SUM(spending_amount) as total_spend from spending_records where MONTH(spending_date) = 4
group by customer_id
),
previous_month as (
select customer_id, SUM(spending_amount) as total_spend from spending_records where MONTH(spending_date) = 3
group by customer_id
),
cust_id as(
select cm.customer_id,cm.total_spend as Present_Month_Spend, pm.total_spend as Previous_Month_Spend from current_month cm join previous_month pm on pm.customer_id = cm.customer_id
where cm.total_spend < pm.total_spend
)
select cu.customer_name, cu.customer_id, Present_Month_Spend,Previous_Month_Spend
from customers cu join cust_id ci on ci.customer_id = cu.customer_id
