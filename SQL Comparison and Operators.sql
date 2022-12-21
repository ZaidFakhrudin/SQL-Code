-- Comparisons/Operators --

-- NOT EQUAL syntax '!='
SELECT * FROM books WHERE released_year != 2017;
SELECT title, author_lname FROM books WHERE author_lname != 'Gaiman';

-- NOT LIKE --
SELECT title FROM books WHERE title NOT LIKE '% %';
SELECT title,author_fname,author_lname FROM books WHERE author_fname NOT LIKE 'da%';

-- GREATER THAN > --
SELECT * FROM books WHERE pages > 500;

-- LESS/GREATER THAN OR EQUAL TO </>=  --
SELECT title, released_year FROM books WHERE released_year < 2000;
SELECT title, released_year FROM books WHERE released_year >= 2000;

-- Logical AND --
SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;
-- BOTH SIDES OF 'AND' NEEDS TO BE TRUE (LEFT AND RIGHT)

-- Logical OR --
SELECT title,author_lname,released_year FROM books
WHERE author_lname = 'Eggers' OR released_year > 2010;
-- ONLY ONE SIDE OF 'OR' NEEDS TO BE TRUE (LEFT OR RIGHT)

-- BETWEEN --
-- selecting books published between 2004 and 2005 --
-- using logical AND 
SELECT title, released_year FROM books 
WHERE released_year >= 2004 AND released_year <=2015;
-- using BETWEEN
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;

-- COMPARING DATES/TIME --
SELECT * FROM people WHERE YEAR(birthdate) < '2000-01-01';
SELECT * FROM people WHERE HOUR(birthtime) > '10:00:00';
-- CAST(expr1 AS type): casting a string into a specific type
SELECT CAST('09:00:00' AS TIME);
SELECT * FROM people WHERE birthtime BETWEEN 
CAST('12:00:00' AS TIME) AND CAST('16:00:00' AS TIME);

-- IN Operator --
-- print out books written by Carver,Lahiri,Smith
-- one way is to use the OR operator but..
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver','Lahiri','Smith');

SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver','Lahiri','Smith');

-- CASE STATEMENTS --
SELECT 
     title,
     released_year,
     CASE
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
     END AS GENRE
 FROM
     books;

 SELECT 
     title,
     stock_quantity,
     CASE
         WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
         WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
         ELSE '***'
     END AS Stock
 FROM
     books;

-- IS NULL --
 SELECT * FROM books WHERE title IS NULL;

-- EXERCISE --

 SELECT * FROM books WHERE released_year < 1980;

 SELECT * FROM books 
 WHERE author_lname = 'Eggers' 
 OR author_lname = 'Chabon';

 SELECT title,author_lname,released_year FROM books
 WHERE author_lname = 'Lahiri' AND released_year > 2000;

 SELECT title,pages FROM books
 WHERE pages BETWEEN 100 AND 200;

 SELECT title,author_lname FROM books
 WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

 SELECT 
    title,
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN
            title LIKE 'Just Kids'
                AND 'A Heartbreaking Work of Staggering Genius'
        THEN
            'Memoir'
        ELSE 'Novel'
    END AS Type
FROM
    books;

SELECT 
    author_fname,
    author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' ', 'book')
        ELSE CONCAT(COUNT(*), ' ', 'books')
    END AS Count
FROM
    books
GROUP BY author_fname , author_lname;