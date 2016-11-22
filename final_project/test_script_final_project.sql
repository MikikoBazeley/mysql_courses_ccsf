
/*	University Database*/
/* ****************************************************************************/
-- Dropping Production Database and all tables and data
DROP DATABASE IF EXISTS university;
CREATE DATABASE IF NOT EXISTS university;
USE university;


/* ****************************************************************************/
/*	Create Tables*/
-- 1	Term
CREATE TABLE TERM (
    term_id VARCHAR(5),
    term_desc VARCHAR(12) UNIQUE NOT NULL ,
    start_date DATE UNIQUE NOT NULL,
    end_date DATE UNIQUE NOT NULL,
    CONSTRAINT TERM_PK PRIMARY KEY (term_id)
);

-- 2	Department
CREATE TABLE DEPARTMENT (
    dept_id INT(2) UNSIGNED,
    dept_name VARCHAR(30) NOT NULL,
    budget INT(10) UNSIGNED NOT NULL,
    CONSTRAINT DEPT_PK PRIMARY KEY (dept_id)
);

-- 3	Location
CREATE TABLE LOCATION (
    room_id INT(3) UNSIGNED,
    building VARCHAR(10) NOT NULL,
    room_no INT(4) UNSIGNED NOT NULL,
    capacity INT(3) UNSIGNED NOT NULL,
    room_type ENUM('O','L','C') NOT NULL,
    room_description ENUM('Office','Lab','Classroom') NOT NULL,
    CONSTRAINT LOCAT_PK PRIMARY KEY (room_id),
);

-- 4	Course
CREATE TABLE COURSE (
    course_id VARCHAR(8),
    dept_id INT(2) UNSIGNED NOT NULL,
    title VARCHAR(50) NOT NULL,
    credits INT(1) NOT NULL DEFAULT 0,
    prerequisite VARCHAR(8),
    CONSTRAINT COURSE_PK PRIMARY KEY (course_id),
    CONSTRAINT DEPT_FK FOREIGN KEY (dept_id)
        REFERENCES DEPARTMENT (dept_id)
);

-- 5	Faculty
CREATE TABLE FACULTY (
    faculty_id INT(8) UNSIGNED,
    room_id INT(3) UNSIGNED NOT NULL,
    dept_id INT INT(2) UNSIGNED NOT NULL,
    name VARCHAR(15) NOT NULL,
    salary DECIMAL(10,2) UNSIGNED NOT NULL,
    CONSTRAINT FAC_PK PRIMARY KEY (faculty_id),
    CONSTRAINT ROOM_FK FOREIGN KEY (room_id)
        REFERENCES LOCATION (room_id),
    CONSTRAINT DEPT_FK FOREIGN KEY (dept_id)
        REFERENCES DEPARTMENT (dept_id)
);

-- 6	Section
CREATE TABLE SECTION (
    section_id INT(6) UNSIGNED,
    course_id VARCHAR(8) NOT NULL,
    term_id VARCHAR(5) NOT NULL,
    faculty_id INT(8) UNSIGNED,
    room_id INT(3) UNSIGNED NOT NULL,
    section_number VARCHAR(3) NOT NULL,
    day SET('M','T','W','R','F') NOT NULL,
    max_count INT(3) UNSIGNED NOT NULL,
    start_time TIME DEFAULT 'TBA',
    end_time TIME DEFAULT 'TBA',
    CONSTRAINT SEC_PK PRIMARY KEY (section_id),
    CONSTRAINT CRS_FK FOREIGN KEY (course_id)
        REFERENCES COURSE (course_id),
    CONSTRAINT TRM_FK FOREIGN KEY (term_id)
        REFERENCES TERM (term_id),
    CONSTRAINT FCTY_FK FOREIGN KEY (faculty_id)
        REFERENCES FACULTY (faculty_id),
    CONSTRAINT ROOM_FK FOREIGN KEY (room_id)
        REFERENCES COURSE (course_id)
);

-- 7	Major
CREATE TABLE MAJOR (
    major_id INT(4) UNSIGNED,
    major_desc VARCHAR(50) NOT NULL,
    CONSTRAINT MAJOR_PK PRIMARY KEY (major_id)
);

-- 8	Student
CREATE TABLE STUDENT (
    student_id INT(8) UNSIGNED,
    major_id INT(4) UNSIGNED NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    street VARCHAR(15) NOT NULL,
    city VARCHAR(30) NOT NULL,
    state CHAR(2) NOT NULL,
    zip INT(6) UNSIGNED NOT NULL,
    birth_date DATE NOT NULL,
    phone INT(12) UNSIGNED NOT NULL,
    student_type ENUM('grad','ugrad') NOT NULL,
    CONSTRAINT STUDENT_PK PRIMARY KEY (student_id),
    CONSTRAINT MAJOR_FK FOREIGN KEY (major_id)
        REFERENCES MAJOR (major_id)
);

-- 9	Registration
CREATE TABLE REGISTRATION (
    student_id INT(8) UNSIGNED,
    section_id INT INT(6) UNSIGNED,
    midterm_grade ENUM('A','B','C','D','F','W'),
        final_grade ENUM('A','B','C','D','F','W'),
    CONSTRAINT REGIS_PK PRIMARY KEY (student_id, section_id),
);

/* ****************************************************************************/
/*	Import Data*/
\. insert_data_university_database.mysql;
