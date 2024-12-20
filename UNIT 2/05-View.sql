A view is like a virtual table that shows only certain parts of a table (or multiple tables) based on a predefined query. It doesn’t store data itself but displays data from the original tables, making it easier to show tailored information to different users.


-- Example

Views in Action: Customizing Data for Different Departments

-- Finance Department: Needs access to employee salary information but not their project details or personal information.
Exmaple Sarah creates a view for Finance, selecting only emp_id, name, and salary columns from the employees table. This way, Finance sees only relevant data without having access to private details.

CREATE VIEW finance_view AS
SELECT emp_id, name, salary
FROM employees;
Now, when Finance wants to check salaries, they can just query:         

SELECT * FROM finance_view;


-- Project Managers: Need to see which employees are working on which projects, but they don’t need salary or private details.
Sarah creates a view for Project Managers, selecting emp_id, name, and project_name from the employees and projects tables. This gives them a list of employees and their projects without extra information.

CREATE VIEW project_view AS
SELECT employees.emp_id, employees.name, projects.project_name
FROM employees
JOIN projects ON employees.emp_id = projects.emp_id;
When project managers use this view, they can quickly check who’s on which project:

SELECT * FROM project_view;


-- Executive Team: Only needs a summary of the number of employees in each department, without any names or personal details.
Sarah creates a view that groups data by department and counts employees, keeping the executives informed without sharing extra data.

CREATE VIEW department_summary AS
SELECT department, COUNT(emp_id) AS employee_count
FROM employees
GROUP BY department;
Now, the executive team can simply query:

SELECT * FROM department_summary;




-- 1 Updated view
An "updated view" in SQL refers to a view that has been modified using the "ALTER VIEW" statement, essentially changing the underlying query that defines the view, thus presenting a different set of data when accessed; its like changing the filter or calculation on a virtual table without actually altering the base data in the database tables it draws from  , updating a view in SQL does not directly change the actual data in the underlying tables


-- 2 Read only view
A "read-only view" in SQL is a virtual table created using a SELECT statement that only allows users to view data from the underlying base tables, preventing them from performing any modifications like inserting, updating, or deleting rows within the view itself; essentially, it provides access to data without the ability to change it. 


