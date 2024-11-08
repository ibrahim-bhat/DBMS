 Normalization
Normalization is a way to organize data in your database to avoid repeating the same information and to keep it tidy. There are different levels (called normal forms) of normalization:
-- First Normal Form (1NF): A table is in 1NF if all the columns contain atomic (indivisible) values, and each entry is unique. For example:

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    subjects VARCHAR(100) -- Not in 1NF (non-atomic)
);
| Student ID | Name   | Subjects          |
|------------|--------|--------------------|
| 1          | Alice  | Math, Science      |
  
-- To convert to 1NF:

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(100) -- Now in 1NF
);
| Student ID | Name   | Subject  |
|------------|--------|----------|
| 1          | Alice  | Math     |
| 1          | Alice  | Science  |

-- Second Normal Form (2NF): A table is in 2NF if it is in 1NF and all non-key attributes are fully functionally dependent on the primary key. For example:

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    course_name VARCHAR(100),
    PRIMARY KEY (student_id, course_id)
);
| Student ID | Course ID | Course Name   |
|------------|-----------|----------------|
| 1          | 101       | Math           |
| 1          | 102       | Science        |

-- To convert to 2NF:

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);
Students Table:
| Student ID | Name   |
|------------|--------|
| 1          | Alice  |

Courses Table:
| Course ID | Course Name   |
|-----------|----------------|
| 101       | Math           |
| 102       | Science        |

Enrollments Table:
| Student ID | Course ID |
|------------|-----------|
| 1          | 101       |
| 1          | 102       |

-- Third Normal Form (3NF): A table is in 3NF if it is in 2NF and no transitive dependencies exist (i.e., no non-key attribute depends on another non-key attribute).