-- Create a backup table to store the individual interests
CREATE TABLE INTERESTS_ROLLBACK AS
SELECT STUDENT_ID, UNNEST(INTERESTS) AS INTEREST
FROM INTERESTS;

-- Delete the modified INTERESTS table
DROP TABLE INTERESTS;

-- Rename the backup table to INTERESTS
ALTER TABLE INTERESTS_ROLLBACK RENAME TO INTERESTS;

-- Change back the length of STUDENTS.ST_NAME and STUDENTS.ST_LAST from 30 to 20
ALTER TABLE STUDENTS ALTER COLUMN ST_NAME TYPE VARCHAR(20);
ALTER TABLE STUDENTS ALTER COLUMN ST_LAST TYPE VARCHAR(20);

-- Rename back the STUDENTS.STUDENT_ID to STUDENTS.ST_ID 
ALTER TABLE STUDENTS RENAME COLUMN STUDENT_ID TO ST_ID;

-- Display final tables
SELECT * FROM STUDENTS;
SELECT * FROM INTERESTS;