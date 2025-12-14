-- 1. Create the database if it does not already exist
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- 2. Table: Authors
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 3. Table: Books
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    -- Foreign Key: Links books to their authors
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 4. Table: Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE, -- Email should be unique for login/contact
    address TEXT
);

-- 5. Table: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    -- Foreign Key: Links orders to the customer who placed them
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6. Table: Order_Details (The junction table for the many-to-many relationship between Orders and Books)
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    -- Foreign Key: Links order details to the main order
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    -- Foreign Key: Links order details to the specific book purchased
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);