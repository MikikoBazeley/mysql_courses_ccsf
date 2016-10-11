-- Assignment 8.sql 
--
-- Mikiko Bazeley
-- CS155A, Fall 2016
--
 
USE library;
 
--  
-- Query 1 
/*
Query 1: Display the number of different publishers represented in the BOOKS table.
*/

SELECT COUNT(DISTINCT publisher_id) as Num_Publishers
FROM books;


-- 	
-- Query 2
/*
Determine the number of books provided by publisher 3.
*/

-- assume this is asking for number of ciopies of books by pulshier id, not the titles
SELECT SUM(bc.no_of_copies)
FROM books bk
LEFT JOIN bookcopies bc USING (ISBN)
WHERE bk.publisher_id=3;

-- Sanity check that number of copies is the same:
-- SELECT SUM(no_of_copies)
-- FROM bookcopies;

--
-- Query 3
/*
Display the date of the book with the earliest publication date. 
Display the title, ISBN, and publication date
*/

SELECT MIN(pub_date)
FROM books;


SELECT title, ISBN, pub_date
FROM books
ORDER BY pub_date ASC
LIMIT 1;

--
-- Query 4
/*
Determine how many books are in the Computer category. 
Display the category name and the number of books.
*/

SELECT SUM(bc.no_of_copies), bk.category_name
FROM books bk
LEFT JOIN bookcopies bc USING (ISBN)
WHERE bk.category_name='Computer';



--
-- Query 5
/*
Determine how many books are in each category. 
Display the category name and the number of books.
*/

SELECT SUM(bc.no_of_copies), bk.category_name
FROM books bk
LEFT JOIN bookcopies bc USING (ISBN)
GROUP BY bk.category_name;


--
-- Query 6
/*
Display the name of the publisher and 
the title of all books published 
by the publisher of Database Implementation.
*/




--
-- Query 7
/*
 For each book that is loaned out from 
 the Foster City branch and 
 whose due date is June 12, 2015, 
 
 display the book title, the member’s name, and the member’s address.
*/






--
-- Query 8
/*
For each library branch, 
display the branch name and 
the total number of books loaned out from that branch.

Sample run:
+-----------+-------------+-----------------+
| Branch_id | Branch_name | number of books |
+-----------+-------------+-----------------+
| 1234 | San Leandro | 2 |
| 2345 | East Bay | 2 |
*/





--
-- Query 9
/*
Display the card numbers, 
names, 
addresses, and the 
number of books checked out for 
all members who have one book checked out.

Sample run:
+---------+------------+-----------+-------------------+-----------------+
| Card_no | first_name | last_name | Address | number of books |
+---------+------------+-----------+-------------------+-----------------+
| 1001 | BONITA | MORALES | P.O. BOX 651 | 1 |
| 1003 | LEILA | SMITH | P.O. BOX 66 | 1 |
| 1005 | CINDY | GIRARD | P.O. BOX 851 | 1 |
*/



--
-- Query 10
/*
Determine the number of books written by Lisa White. 
Display the author ID and the number of books

+-----------+---------------------+
| author_id | The number of books |
+-----------+---------------------+
| W105 | 2 |
+-----------+---------------------+
*/

 
