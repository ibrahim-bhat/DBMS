1. Constraints
Constraints are rules applied to columns in a database table to enforce data integrity and restrict the types of data that can be stored in a column. Constraints help ensure that the data in the database adheres to business rules and remains accurate, consistent, and reliable.


Common Types of Constraints:

PRIMARY KEY: Ensures that each row in a table has a unique, non-null identifier. A table can only have one primary key, but it can be composed of multiple columns.
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,  -- like enoroll number is unique for every one
    name VARCHAR(100)
);

FOREIGN KEY: Ensures a link between two tables by requiring values in one table to match values in another. This enforces referential integrity.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) --example to link with a any company project is connected with valid exploye
);

UNIQUE: Ensures all values in a column or a set of columns are distinct across rows. 
CREATE TABLE products (
    product_id INT,
    product_code VARCHAR(50) UNIQUE  --like email id is unique or username
);

NOT NULL: Ensures that a column cannot contain null (empty) values. 
CREATE TABLE users (    
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL --is applied if we have to enuser anything if filled it should not be empty
);

CHECK: Ensures values in a column satisfy a specific condition. 
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    age INT CHECK (age >= 18) -- ex . Ensures employees are at least 18
);