-- Assignment 4.sql 
--
-- Mikiko Bazeley
-- CS155A, Fall 2016
--
 
 
-- put the database name into this command
USE bookstore;

-- Query 1 
/*
The Pioneer Book Store has decided to keep track of computers used by the employees.
In order to do this, one new table will be added to the database. The schema for these
tables, as related to the existing EMPLOYEE table is:
COMPUTER(serial_number, make, model, processor_type, memory,
disk_size)
Create a new table containing these six columns: serial_number, make, model,
processor_type, memory, disk_size. The table name should be COMPUTER. The
serial_number column contains a numeric number which should consist of a sevendigit
number. Use column sizes you consider suitable for the make, model,
processor_type, memory,disk_size columns. The serial_number column is a primary
key.
Specify the InnoDB storage engine for the new table.
*/


CREATE TABLE computer (
 serial_number INT(7) UNSIGNED,
 make VARCHAR(5) NOT NULL,
 model VARCHAR(20) NOT NULL,
 processor_type VARCHAR(20) NOT NULL,
 memory VARCHAR(20) NOT NULL,
 disk_size VARCHAR(10) NOT NULL,
 PRIMARY KEY (serial_number))ENGINE=INNODB;

--
-- Query 2
/*
Add five rows to the COMPUTER table. 
Copy and run the following SQL statements.
*/
INSERT INTO COMPUTER VALUES(
9871234, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
'6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
9871245, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
'6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
9871256, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
'6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
9871267, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
'6.0 GBytes', '1.0 TBytes');
INSERT INTO COMPUTER VALUES(
9871278, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530',
'6.0 GBytes', '1.0 TBytes');

--
-- Query 3
/*
Alter the COMPUTER table to add a column that will be used to store the processor
speed. Name this column processor_speed and use an appropriate number datatype
specification. You do not need to store any data to this column.
*/
ALTER TABLE computer
ADD processor_speed INT(10) UNSIGNED;
--
-- Query 4
/*
	Display the rows in the COMPUTER table.
*/
SELECT *
FROM computer;
--
-- Query 5
/*
Display column names and datatypes for the COMPUTER table
*/
DESC computer;
--
-- Query 6
/*
Delete the processor_speed column from the COMPUTER table
*/
ALTER TABLE computer 
DROP COLUMN processor_speed;

--
-- Query 7
/*
Rename the COMPUTER table as COMPUTER_BACKUP.
*/
RENAME TABLE computer to computer_backup;
--
-- Query 8
/*
Display the names of the tables in your current database. 
*/
SHOW TABLES;
--
-- Query 9
/*
Remove the COMPUTER_BACKUP table from the database. Display the names of the
tables in your current database.


*/	
DROP TABLE computer_backup;
SHOW TABLES;
--
-- Query 10
/*
Alter the EMPLOYEE table to add a column that will be used to store the salary earned
year-to-date. Name this column SalaryYearToDate and use an appropriate NUMBER
datatype specification. You do not need to store any data to this column
*/
ALTER TABLE employee
ADD SalaryYearToDate DECIMAL(10,2);
--
-- Query 11
/*
Write an SQL statement to drop the SalaryYearToDate column you added to the
EMPLOYEE table in query 10.

*/
ALTER TABLE employee
DROP COLUMN SalaryYearToDate;