DROP TABLE IF EXISTS orders;

-- Create the orders table
CREATE TABLE orders (
    user_id INT,
    item_ordered VARCHAR(512)
);

-- Insert sample data into the orders table
INSERT INTO orders VALUES 
('1', 'Pizza'),
('1', 'Burger'),
('2', 'Cold Drink'),
('2', 'Burger'),
('3', 'Burger'),
('3', 'Cold Drink'),
('4', 'Pizza'),
('4', 'Cold Drink'),
('5', 'Cold Drink'),
('6', 'Burger'),
('6', 'Cold Drink'),
('7', 'Pizza'),
('8', 'Burger');

-- Flipkart Data Analyst Interview Questions
-- Question: Write an SQL query to fetch user IDs that have only bought both 'Burger' and 'Cold Drink' items.

-- Expected Output Columns: user_id

select * from orders;

with cte as (
select *,
case when item_ordered = 'Burger' then 1 else 0 end burger,
case when item_ordered = 'Cold Drink' then 1 else 0 end col
from orders
),
cte2 as(
select *,
first_value(burger) over(partition by user_id order by burger desc) burger_st,
first_value(col) over(partition by user_id order by col desc) col_st
from cte
)
select distinct USER_ID from cte2 where burger_st = 1 and col_st =1