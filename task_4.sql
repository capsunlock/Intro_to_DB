-- SQL script to print the full description of the BOOKS table 
-- in the alx_book_store database without using DESCRIBE or EXPLAIN.
--

-- 1. Explicitly select the database
USE alx_book_store;

-- 2. Print the full description of the BOOKS table
SHOW FULL COLUMNS FROM BOOKS;