DDL
Stands for Data Definition Language, and is used to define and manage the structure of a database. DDL commands include CREATE, ALTER, and DROP.
DCL
Stands for Data Control Language, and is used to control access to data within a database. DCL commands include GRANT and REVOKE


    -- DLL

CREATE: Creates a new database, table, index, or view.
ALTER: Modifies an existing database object, such as a table.
DROP: Deletes an existing database, table, index, or view.
TRUNCATE: Removes all records from a table, but not the table structure.

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);

ALTER TABLE employees ADD date_of_joining DATE;

DROP TABLE employees;

TRUNCATE TABLE employees; --delete the data but not the table


    -- DCL

GRANT: Provides specific privileges to users.
REVOKE: Removes privileges from users.

-- GRANT (e.g., to allow a user to SELECT and INSERT data):
GRANT SELECT, INSERT ON database_name.* TO 'username'@'localhost';

-- REVOKE (e.g., to remove INSERT privileges from a user):
REVOKE INSERT ON database_name.* FROM 'username'@'localhost';