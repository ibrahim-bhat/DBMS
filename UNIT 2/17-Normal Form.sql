### Normal Forms Based on Primary Keys

**Normal Forms** are guidelines or rules in database design to structure data to reduce redundancy, avoid anomalies, and ensure data integrity. Here’s a breakdown of the normal forms based on primary keys, from the most basic (1NF) to a more advanced level (BCNF).

---

### 1. **First Normal Form (1NF)**
- **Definition**: A table is in **1NF** if:
  1. Each column contains only **atomic (indivisible)** values.--single
  2. There are **no repeating groups** or arrays.
- **Goal**: Eliminate duplicate groups and ensure every cell holds a single, indivisible value.

#### Example:
Consider this table that is **not in 1NF**:
| StudentID | Name       | Subjects         |
|-----------|------------|------------------|
| 1         | Alice      | Math, Science    |
| 2         | Bob        | Math, English    |

Here, the **Subjects** column contains multiple values. To bring it to **1NF**, we split each subject into a separate row:

| StudentID | Name       | Subject          |
|-----------|------------|------------------|
| 1         | Alice      | Math             |
| 1         | Alice      | Science          |
| 2         | Bob        | Math             |
| 2         | Bob        | English          |

---

### 2. **Second Normal Form (2NF)**
- **Definition**: A table is in **2NF** if:
  1. It is already in **1NF**.
  2. Every **non-key** attribute is **fully dependent** on the primary key (no partial dependency).
- **Goal**: Remove partial dependencies, where a non-key attribute depends only on part of a composite key.

#### Example:
Let’s say we have this table (which is in 1NF but not in 2NF):
| StudentID | CourseID   | CourseName   | Instructor |
|-----------|------------|--------------|------------|
| 1         | 101        | Math         | Dr. Smith  |
| 1         | 102        | English      | Dr. Adams  |
| 2         | 101        | Math         | Dr. Smith  |

Here, **CourseName** and **Instructor** only depend on **CourseID**, not on the full primary key (**StudentID + CourseID**). To make it **2NF**, we split the table:

1. **StudentCourses** (StudentID, CourseID)
2. **Courses** (CourseID, CourseName, Instructor)

---

### 3. **Third Normal Form (3NF)**
- **Definition**: A table is in **3NF** if:
  1. It is already in **2NF**.
  2. There are **no transitive dependencies**, where a non-key attribute depends on another non-key attribute.
- **Goal**: Remove transitive dependencies, where non-key attributes depend on other non-key attributes.

#### Example:
Consider a **2NF** table that isn’t in **3NF**:
| StudentID | CourseID | InstructorID | InstructorName |
|-----------|----------|--------------|----------------|
| 1         | 101      | 1            | Dr. Smith      |
| 2         | 102      | 2            | Dr. Adams      |

Here, **InstructorName** depends on **InstructorID**, not directly on the primary key **(StudentID, CourseID)**. To make it **3NF**, separate it into:

1. **StudentCourses** (StudentID, CourseID, InstructorID)
2. **Instructors** (InstructorID, InstructorName)

---

### 4. **Boyce-Codd Normal Form (BCNF)**
- **Definition**: A table is in **BCNF** if:
  1. It is already in **3NF**.
  2. Every **determinant** is a **candidate key** (a candidate key is a column, or a combination of columns, that can uniquely identify a row).
- **Goal**: Further reduce redundancy by ensuring that every determinant is a candidate key.

#### Example:
Consider a **3NF** table that isn’t in **BCNF**:
| CourseID | InstructorID | Room      |
|----------|--------------|-----------|
| 101      | 1            | Room 101  |
| 101      | 2            | Room 102  |

Here, **InstructorID** determines **Room**, but **InstructorID** alone is not a candidate key. To make it **BCNF**, split the table into:

1. **Courses** (CourseID, InstructorID)
2. **InstructorRooms** (InstructorID, Room)

---

### Summary of Normal Forms
| Normal Form  | Requirements                                                                 |
|--------------|------------------------------------------------------------------------------|
| **1NF**      | Atomic values, no repeating groups                                          |
| **2NF**      | 1NF + no partial dependency (full dependency on the primary key)             |
| **3NF**      | 2NF + no transitive dependency                                               |
| **BCNF**     | 3NF + every determinant is a candidate key                                   |

Each level of normalization builds upon the previous one, ensuring more rigorous control over data redundancy and integrity.