
/*	University Database*/
/* ****************************************************************************/
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS FACULTY;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS TERM;
DROP TABLE IF EXISTS SECTION;
DROP TABLE IF EXISTS REGISTRATION;
DROP TABLE IF EXISTS MAJOR;
DROP TABLE IF EXISTS LOCATION;

--------------------------------------------------

CREATE TABLE DEPARTMENT (
    dept_id INT NOT NULL ???,
    dept_name VARCHAR(30) ???,
    budget INT ???,
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
        ON DELETE CASCADE ????????
);

CREATE TABLE FACULTY (
    faculty_id INT ?????? NOT NULL,
    room_id INT ????? NOT NULL,
    dept_id INT ????? NOT NULL,
    name VARCHAR(15) ???? NULL,
    salary DECIMAL(10,2) ???? NULL,
    CONSTRAINT FAC_PK PRIMARY KEY (faculty_id),
    CONSTRAINT ROOM_FK FOREIGN KEY (room_id)
        REFERENCES LOCATION (room_id)
        ON DELETE CASCADE?????,
    CONSTRAINT DEPT_FK FOREIGN KEY (dept_id)
        REFERENCES DEPARTMENT (dept_id)
        ON DELETE CASCADE ?????, 
);

CREATE TABLE STUDENT (
    student_id INT ???????,
    major_id INT ?????,
    last_name VARCHAR(15) NOT NULL ????,
    first_name VARCHAR(15) NOT NULL ?????,
    street VARCHAR(15) NOT NULL ?????,
    city VARCHAR(15) NOT NULL ?????,
    state CHAR(2) ??????,
    zip INT NOT NULL ?????,
    birth_date DATE ???????,
    phone INT ???????,
    student_type ENUM('grad','ugrad') ????,
    CONSTRAINT STUDENT_PK PRIMARY KEY (student_id),
    CONSTRAINT MAJOR_FK FOREIGN KEY (major_id)
        REFERENCES MAJOR (major_id)
        ON DELETE CASCADE ??????????
);

CREATE TABLE TERM (
    term_id VARCHAR(4) ?????,
    term_desc VARCHAR(12) ????,
    start_date DATE ?????,
    end_date DATE ????,
    CONSTRAINT TERM_PK PRIMARY KEY (term_id)
);


CREATE TABLE SECTION (
    section_id INT ???????,
    course_id VARCHAR(8) ?????,
    term_id VARCHAR(4) NOT NULL ????,
    faculty_id INT NOT NULL ?????,
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
