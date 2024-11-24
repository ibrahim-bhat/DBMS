A schema is a template that defines the structure, organization, and relationships of a database.

a schema is a logical container or structure within a database that organizes and groups database objects like tables, views, indexes, and stored procedures. It’s essentially a way to logically separate and organize database 
objects for clarity, permissions, and management.


-- Example
 
--  Creating Schema
CREATE SCHEMA ecommerce;

-- creating tables with schema 
CREATE TABLE ecommerce.customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    registration_date DATE
);

CREATE TABLE ecommerce.orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES ecommerce.customers(customer_id)
);

CREATE TABLE ecommerce.products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);


