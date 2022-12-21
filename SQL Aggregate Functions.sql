-- Aggregate Functions --

-- Count: Returns number of cells within a range -- 
--  eg; SELECT COUNT(*) FROM books; 
-- (*) in this case refers to number of rows

-- Group By: Summarize/Aggregate identical data into single row
-- COUNT how many books each author has written

SELECT author_lname, COUNT(*) FROM books
GROUP BY author_lname;

-- MIN & MAX with subqueries --

SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;

-- Find the title of book with MAX pages

SELECT title, pages FROM books
WHERE pages =
(SELECT MAX(pages) FROM books);

-- Find book with earliest release

SELECT title,released_year FROM books
WHERE released_year =
(SELECT MIN(released_year) FROM books);

-- Group By Multiple Columns--
SELECT author_fname, author_lname, COUNT(*) FROM books 
GROUP BY author_lname, author_fname;

-- MIN/MAX with GROUP BY --
-- Find the year each author published their first book 

SELECT CONCAT(author_fname,' ',author_lname) AS author, 
COUNT(*) AS books_published,
MAX(released_year) AS latest_release,
MIN(released_year) AS earliest_release FROM books 
GROUP BY Author;

-- SUM 
-- Sum all pages each author has written

SELECT SUM(pages) AS total_pages, CONCAT(author_fname,' ',author_lname) AS author FROM books
GROUP BY author
ORDER BY total_pages DESC;

-- AVG --
-- eg.SELECT AVG(released_year) FROM books;
-- Calculate avg stock quantity for books released in the same year

SELECT AVG(stock_quantity), COUNT(*), released_year FROM books
GROUP BY released_year;

-- Aggregate Exercise --

-- Print no of books in database --
SELECT COUNT(*)	FROM books;

-- print out no of books released each year --
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

-- print no of books in stock
SELECT SUM(stock_quantity) FROM books;

-- avg release year for each author
SELECT CONCAT(author_fname,' ',author_lname) AS author, AVG(released_year) 
FROM books
GROUP BY author;

-- Find full name of author who released longest book
SELECT CONCAT(author_fname,' ',author_lname) AS author, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT CONCAT(author_fname,' ',author_lname) AS author, SUM(pages) AS pages FROM books
GROUP BY author
ORDER BY pages DESC
LIMIT 1;


SELECT released_year AS year, COUNT(*) AS '# books', 
AVG(pages) AS 'avg pages'
FROM books
GROUP BY year
ORDER BY year ASC;