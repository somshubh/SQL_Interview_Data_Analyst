DROP TABLE IF EXISTS customers_details;
-- Creating the Customers table
CREATE TABLE Customers_details (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);


DROP TABLE IF EXISTS purchases;
-- Creating the Purchases table
CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
    customer_id INT,
    product_category VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers_details(customer_id)
);

-- Inserting sample data into Customers table
INSERT INTO Customers_details (customer_id, customer_name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie'),
    (4, 'David'),
    (5, 'Emma');

-- Inserting sample data into Purchases table
INSERT INTO Purchases (purchase_id, customer_id, product_category) VALUES
    (101, 1, 'Electronics'),
    (102, 1, 'Books'),
    (103, 1, 'Clothing'),
    (104, 1, 'Electronics'),
    (105, 2, 'Clothing'),
    (106, 1, 'Beauty'),
    (107, 3, 'Electronics'),
    (108, 3, 'Books'),
    (109, 4, 'Books'),
    (110, 4, 'Clothing'),
    (111, 4, 'Beauty'),
    (112, 5, 'Electronics'),
    (113, 5, 'Books');

/*

Question:
Write an SQL query to find customers who have made 
purchases in all product categories.

Tables:
Customers: customer_id (INT), customer_name (VARCHAR)

Purchases: purchase_id (INT), customer_id (INT), 
product_category (VARCHAR)

Your query should return the customer_id and 
customer_name of these customers.

*/

--select distinct product_category from Purchases;
--select * from Customers_details;
--select * from Purchases;

with cte as(
select customer_id, COUNT(distinct product_category) as product_count from Purchases group by
customer_id
)
select cd.customer_id, cd.customer_name from cte c join Customers_details cd on cd.customer_id = c.customer_id
where product_count = (select COUNT(distinct product_category) from Purchases);