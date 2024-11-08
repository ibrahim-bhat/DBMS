
--  Cursors
A cursor is a database object that lets you process each row in a query result one at a time. They’re useful when you need to perform row-by-row operations that can’t be handled well with standard SQL.

Example of a Cursor
Imagine you have an employees table, and you want to give a 5% bonus to each employee based on their current salary. You can use a cursor to loop through each row and update their salaries individually.

DECLARE
   CURSOR emp_cursor IS SELECT emp_id, salary FROM employees;
   emp_id employees.emp_id%TYPE;
   salary employees.salary%TYPE;
BEGIN
   OPEN emp_cursor;
   LOOP
      FETCH emp_cursor INTO emp_id, salary;
      EXIT WHEN emp_cursor%NOTFOUND;

      UPDATE employees
      SET salary = salary * 1.05
      WHERE emp_id = emp_id;
   END LOOP;

   CLOSE emp_cursor;
END;

Steps:
Declare: Define the cursor to select employees.
Open: Start the cursor.
Fetch and Loop: Go through each row, apply the update, and repeat until all rows are processed.
Close: Close the cursor.


-- . Stored Procedures
A stored procedure is a saved collection of SQL statements that you can run as a single unit. Stored procedures allow you to encapsulate complex logic and reuse code, making your database management easier and more efficient.

Example of a Stored Procedure
Imagine a shopping app where customers can place orders. You can create a stored procedure to handle a new order, deduct stock from the inventory, and add a record to the orders table.

CREATE PROCEDURE place_order (
   IN product_id INT,
   IN quantity INT,
   IN customer_id INT
)
BEGIN
   DECLARE stock INT;
   
   -- Check stock
   SELECT inventory INTO stock
   FROM products
   WHERE product_id = product_id;
   
   IF stock >= quantity THEN
      -- Deduct stock
      UPDATE products
      SET inventory = inventory - quantity
      WHERE product_id = product_id;
      
      -- Insert order
      INSERT INTO orders (product_id, quantity, customer_id)
      VALUES (product_id, quantity, customer_id);
   ELSE
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Insufficient stock';
   END IF;
END;

Input parameters: product_id, quantity, and customer_id.
Steps in the procedure:
Check if there is enough stock.
If there’s enough stock, deduct the quantity and add a new order.
If stock is insufficient, show an error message.




Cursors: Allow row-by-row processing of query results, helpful for operations that require handling each row individually, like applying a bonus to each employee’s salary.

Stored Procedures: A stored set of SQL statements that can perform complex tasks with input parameters. They’re reusable, secure, and ideal for repetitive actions, like handling a customer order.