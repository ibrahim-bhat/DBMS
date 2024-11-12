An index in a database is like "an index at the back of a book": it helps you find information faster. By creating an index on a column or set of columns, you can optimize the search speed for specific queries without changing the actual data in the table.
The purpose of an index is to optimize the speed of searches, especially in large tables . in small tables, this isn’t a big deal we can directly fetch data without index because scanning a few rows is quick. However, as tables grow larger (e.g., thousands or millions of rows), scanning each row becomes slow.


--Example 

-- Indexes in Action: Making Searches Faster
-- Index on Book Titles
Sarah knows people frequently search for books by their titles. She creates an index on the title column so that, instead of scanning through every book in the books table, the database can quickly jump to the relevant title, speeding up searches.

CREATE INDEX idx_title ON books (title);  --creating index here
Now, when someone searches for a book by title:

SELECT * FROM books WHERE title = 'Pride and Prejudice';

