CREATE TABLE bank_transactions (
    transaction_id int identity(1,1) PRIMARY KEY,
    bank_id INT,
    customer_id INT,
    transaction_amount DECIMAL(10, 2),
    transaction_type VARCHAR(10),
    transaction_date DATE
);

-- Insert sample records into bank_transactions
INSERT INTO bank_transactions (bank_id, customer_id, transaction_amount, transaction_type, transaction_date) VALUES
(1, 101, 500.00, 'credit', '2024-01-01'),
(1, 101, 200.00, 'debit', '2024-01-02'),
(1, 101, 300.00, 'credit', '2024-01-05'),
(1, 101, 150.00, 'debit', '2024-01-08'),
(1, 102, 1000.00, 'credit', '2024-01-01'),
(1, 102, 400.00, 'debit', '2024-01-03'),
(1, 102, 600.00, 'credit', '2024-01-05'),
(1, 102, 200.00, 'debit', '2024-01-09');




/*
You are given a bank transaction data 
with columns bank_id, customer_id, 
amount_type(credit debit), 
transaction_amount and transaction_date

-- Write a query to find starting and ending 
trans amount for each customer

Return cx_id, their first_transaction_amt, 
last_transaction and these transaction_date

*/
select * from bank_transactions;

select distinct customer_id,
FIRST_VALUE(transaction_amount) over(PARTITION BY customer_id order by transaction_date asc) as starting_amount,
FIRST_VALUE(transaction_amount) over(PARTITION BY customer_id order by transaction_date desc) as ending_amount
from bank_transactions

