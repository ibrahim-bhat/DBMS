### What is Minimal Cover in Databases?

A **Minimal Cover** (or Minimal Basis) is a **simplified set** of functional dependencies (FDs) that retains the same information as the original set but has been **minimized**. This minimized set has the **least amount of redundancy**, meaning it is as simple as possible without changing the meaning or impact of the functional dependencies.

In other words, a minimal cover for a set of functional dependencies is an **equivalent set of FDs** that:
1. **Contains no extraneous attributes** (no unnecessary attributes).
2. **Has a single attribute on the right side** of each dependency.
3. **Does not have any redundant dependencies**.

### Why Use Minimal Cover?
Using a minimal cover helps us:
- **Simplify** the structure of the functional dependencies.
- **Optimize** database design by reducing redundancy.
- Make it easier to **identify candidate keys** and normalize relations.

### Steps to Find Minimal Cover
To get a minimal cover for a set of functional dependencies, we follow these steps:

1. **Split FDs so each has a single attribute on the right**:
   - For example, if we have **A → BC**, we split it into **A → B** and **A → C**.
   
2. **Remove extraneous attributes**:
   - An attribute is extraneous if removing it does not change the closure (or if it can be derived from the other attributes in the dependency).
   
3. **Remove redundant FDs**:
   - A functional dependency is redundant if removing it does not change the closure of the entire set.

### Example of Finding a Minimal Cover

Lets say we have the following set of FDs:

1. **A → BC**
2. **B → C**
3. **A → B**
4. **AB → C**

#### Step 1: Split into FDs with Single Attributes on the Right
We start by splitting **A → BC** into two FDs:
- **A → B**
- **A → C**

So, our FDs now look like this:

1. **A → B**
2. **A → C**
3. **B → C**
4. **AB → C**

#### Step 2: Remove Extraneous Attributes
Now we check if any attribute on the left side of an FD is unnecessary.

- In **AB → C**, we see that **A → C** is already in the list. This means **AB → C** is redundant since **A → C** alone is enough.

Removing **AB → C**, we now have:

1. **A → B**
2. **A → C**
3. **B → C**

#### Step 3: Check for Redundant FDs
Now we see if removing any FDs changes the meaning.

1. Removing **B → C** changes the information, so it stays.
2. Similarly, **A → B** and **A → C** are necessary.

The minimal cover is:
1. **A → B**
2. **A → C**
3. **B → C**

### Summary
A **Minimal Cover** is the smallest set of functional dependencies that conveys the same information as the original set, making it easier to work with and reducing redundancy in database design.