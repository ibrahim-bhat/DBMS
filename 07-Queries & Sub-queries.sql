A query is simply a request to retrieve or manipulate data from a database. When you run a query, you’re asking the database to find specific information based on your conditions.

-- Example 

  Query Example: Imagine you have an employees table with columns name, position, and salary, and you want to find all employees who are "Managers."

SELECT name, position, salary
FROM employees
WHERE position = 'Manager';

This query will return only the rows where the position is "Manager." It’s straightforward—you’re asking the database to show you all managers.



  2. Subqueries
A subquery is a query within another query. It’s like asking one question inside another question to get more specific information.

Why Use a Subquery? Sometimes, you need information from one query to complete another query. A subquery helps you do this by allowing you to nest one query inside another.

Subquery Example: Let’s say you want to find the names of employees who earn more than the average salary in the company.

Here’s how you’d do it with a subquery:

SELECT name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- The main query uses this result to find all employees who earn more than that average salary.


Types of Subqueries

-- Single-row Subquery: Returns a single value, like finding the highest salary.

SELECT name
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);


-- Multi-row Subquery: Returns multiple values, like finding all departments with employees earning more than $50,000.

SELECT department
FROM employees
WHERE salary > 50000;


-- Correlated Subquery: Refers to columns in the outer query and runs for each row. Think of it like a question that checks each row individually.

SELECT name, salary
FROM employees e1
WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e1.department = e2.department);


This query finds employees whose salary is above the average salary in their specific department.



-- Query: A direct question to the database to get specific information.
-- Subquery: A query within another query, helpful for performing complex searches or calculations.