--
-- SQL script to insert a single row into the CUSTOMERS table 
-- in the alx_book_store database.
--

-- 1. Explicitly select the database
USE alx_book_store;

-- 2. Insert the customer data
INSERT INTO CUSTOMERS (customer_id, customer_name, email, address)
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.');