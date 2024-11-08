Reasoning About Functional Dependencies
This means thinking about how your data relates. If one piece of data helps you find another, you can organize your tables better.

Transitive Dependency: If A → B and B → C, then A → C.

Example: If:
Student ID → Department ID (a student belongs to a department)
Department ID → Department Name (each department has a name)
Then you can also say:
Student ID → Department Name (you can get the department name if you have the student ID).