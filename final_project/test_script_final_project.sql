
/*	University Database*/
/* ****************************************************************************/
-- Dropping Production Database and all tables and data
-- ????????????????

DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS FACULTY;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS TERM;
DROP TABLE IF EXISTS SECTION;
DROP TABLE IF EXISTS REGISTRATION;
DROP TABLE IF EXISTS MAJOR;
DROP TABLE IF EXISTS LOCATION;



/* ****************************************************************************/

DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;
--------------------------------------------------

CREATE TABLE DEPARTMENT (
    dept_id INT(2) UNSIGNED,
    dept_name VARCHAR(30) NOT NULL,
    budget INT(10) UNSIGNED, NOT NULL,
    CONSTRAINT DEPT_PK PRIMARY KEY (dept_id)
);


CREATE TABLE COURSE (
    course_id VARCHAR(8) ????? NOT NULL,
    dept_id INT NOT NULL ????,
    title VARCHAR(50) NOT NULL ???,
    credits INT NULL,
    prerequisite VARCHAR(8) NULL,
    CONSTRAINT COURSE_PK PRIMARY KEY (course_id),
    CONSTRAINT DEPT_FK FOREIGN KEY (dept_id)
        REFERENCES DEPARTMENT (dept_id)
);

CREATE TABLE FACULTY (
    faculty_id INT(8) UNSIGNED,
    room_id INT(3) UNSIGNED NOT NULL,
    dept_id INT ????? NOT NULL,
    name VARCHAR(15) NOT NULL,
    salary DECIMAL(10,2) UNSIGNED NOT NULL,
    CONSTRAINT FAC_PK PRIMARY KEY (faculty_id),
    CONSTRAINT ROOM_FK FOREIGN KEY (room_id)
        REFERENCES LOCATION (room_id),
    CONSTRAINT DEPT_FK FOREIGN KEY (dept_id)
        REFERENCES DEPARTMENT (dept_id)
);

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

CREATE TABLE TERM (
    term_id VARCHAR(5) ?????,
    term_desc VARCHAR(12) UNIQUE NOT NULL ,
    start_date DATE UNIQUE NOT NULL,
    end_date DATE UNIQUE NOT NULL,
    CONSTRAINT TERM_PK PRIMARY KEY (term_id)
);


CREATE TABLE SECTION (
    section_id INT(6) UNSIGNED,
    course_id VARCHAR(8) NOT NULL,
    term_id VARCHAR(5) NOT NULL,
    faculty_id INT INT(8) UNSIGNED,
    room_id INT NOT NULL ?????,
    section_number INT NOT NULL ?????,
    day SET('M','T','W','R','F') ??????,
    max_count INT NOT NULL ?????,
    start_time TIME ???????,
    end_time TIME ???????,
    student_type ENUM('grad','ugrad') ????,
    CONSTRAINT SEC_PK PRIMARY KEY (section_id),
    CONSTRAINT CRS_FK FOREIGN KEY (course_id)
        REFERENCES COURSE (course_id)
        ON DELETE CASCADE ??????????,
    CONSTRAINT TRM_FK FOREIGN KEY (term_id)
        REFERENCES TERM (term_id)
        ON DELETE CASCADE ??????????,
    CONSTRAINT FCTY_FK FOREIGN KEY (faculty_id)
        REFERENCES FACULTY (faculty_id)
        ON DELETE CASCADE ??????????,
    CONSTRAINT ROOM_FK FOREIGN KEY (room_id)
        REFERENCES COURSE (course_id)
        ON DELETE CASCADE ??????????
);

CREATE TABLE REGISTRATION (
    student_id INT ?????,
    section_id INT ???????,
    midterm_grade ENUM('A','B','C','D','F','W') ?????,
    final_grade ENUM('A','B','C','D','F','W') ?????,
    CONSTRAINT REGIS_PK PRIMARY KEY (student_id, section_id),
);


CREATE TABLE MAJOR (
    major_id INT ?????,
    major_desc VARCHAR(50) ???????,
    CONSTRAINT MAJOR_PK PRIMARY KEY (major_id) ?????
);



CREATE TABLE LOCATION (
    room_id INT ???????,
    building VARCHAR(10) ?????,
    room_no INT ??????,
    capacity INT ????,
    room_type ENUM('O','L','C'),
    room_description ENUM('Office','Lab','Classroom'),
    CONSTRAINT LOCAT_PK PRIMARY KEY (room_id),
);



/* ****************************************************************************/
-- import data
