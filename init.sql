-- Create the STUDENTS table
CREATE TABLE STUDENTS (
    ST_ID SERIAL PRIMARY KEY,
    ST_NAME VARCHAR(20),
    ST_LAST VARCHAR(20)
);

-- Create the INTERESTS table
CREATE TABLE INTERESTS (
    STUDENT_ID INTEGER REFERENCES STUDENTS(ST_ID),
    INTEREST VARCHAR(20)
);

-- Insert data into STUDENTS table
INSERT INTO STUDENTS (ST_ID, ST_NAME, ST_LAST) VALUES
    (1, 'Konul', 'Gurbanova'),
    (2, 'Shahnur', 'Isgandarli'),
    (3, 'Natavan', 'Mammadova');

-- Insert data into INTERESTS table
INSERT INTO INTERESTS (STUDENT_ID, INTEREST) VALUES
    (1, 'Tennis'),
    (1, 'Literature'),
    (2, 'Math'),
    (2, 'Tennis'),
    (3, 'Math'),
    (3, 'Music'),
    (2, 'Football'),
    (1, 'Chemistry'),
    (3, 'Chess');
    
-- Display final tables
SELECT * FROM STUDENTS;
SELECT * FROM INTERESTS;
