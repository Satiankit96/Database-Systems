-- Replace zk1 with your NetID

-- execute data setup script
@dataSetupScript06.sql

spool spool06.txt

PROMPT as14128
/*

YOU START YOUR ANSWERS AFTER THE END OF THIS COMMENT BLOCK

ANSWER0 is an example to show you the structure of what you need to produce, unless instructed otherwise in the assignment. Please read carefully what you are asked to do.

Insert your solution for ANSWERX between the string -- ANSWERX and the string PROMPT ANSWERX

You DO NOT have to run the "spool on" comand yourself. This script file does that for you.

The spool06.txt file generated when you run this script will be a part of your submission.

*/

-- Answer 0 represents a sample quert that uses the temp table TEMP0 just to demonstrate the usage of temp table.
-- ANSWER0
CREATE TABLE TEMP0
AS SELECT *
FROM DOG;

CREATE TABLE ANSWER0
AS SELECT DISTINCT Breed
FROM TEMP0
ORDER BY Breed DESC;


PROMPT ANSWER0
SELECT * FROM ANSWER0;

-- ANSWER1
CREATE TABLE ANSWER1
AS SELECT NNUMBER, DEPOSIT 
FROM STUDENT
ORDER BY NNUMBER DESC;

PROMPT ANSWER1
SELECT * FROM ANSWER1;

-- ANSWER2
CREATE TABLE ANSWER2
AS SELECT DISTINCT NNUMBER
FROM STUDENT
WHERE DEPOSIT > 100
ORDER BY NNUMBER ASC;

PROMPT ANSWER2
SELECT * FROM ANSWER2;

-- ANSWER3
CREATE TABLE TEMP3
AS SELECT DISTINCT  STUDENT.NNUMBER, STUDENT.NETID, DOG.BREED
FROM STUDENT, DOG
WHERE STUDENT.NNUMBER = DOG.NNUMBER
ORDER BY STUDENT.NNUMBER ASC, STUDENT.NETID ASC, DOG.BREED ASC;

CREATE TABLE ANSWER3
AS SELECT DISTINCT student1.NETID AS STUDENT1NETID, student2.NETID AS STUDENT2NETID  
FROM TEMP3 student1, TEMP3 student2
WHERE student1.NNUMBER != student2.NNUMBER AND student1.BREED = student2.BREED  
ORDER BY STUDENT1NETID ASC, STUDENT2NETID ASC;

PROMPT ANSWER3
SELECT * FROM ANSWER3;

-- ANSWER4
CREATE TABLE TEMP4
AS (SELECT DISTINCT DOG.SERIALNUMBER, DOG.NNUMBER
    FROM DOG, BITES
    WHERE BITES.BITEE = 3 AND DOG.SERIALNUMBER = BITES.BITER
    INTERSECT
    SELECT DISTINCT DOG.SERIALNUMBER, DOG.NNUMBER
    FROM DOG, BITES
    WHERE BITES.BITEE = 2 AND DOG.SERIALNUMBER = BITES.BITER);

CREATE TABLE ANSWER4
AS SELECT * FROM TEMP4
ORDER BY SERIALNUMBER ASC, NNUMBER ASC;

PROMPT ANSWER4
SELECT * FROM ANSWER4;

-- ANSWER5
CREATE TABLE TEMP5
AS SELECT NETID, NNUMBER
FROM STUDENT;

CREATE TABLE TEMP15
AS SELECT SERIALNUMBER, NNUMBER AS NNNUMBER
FROM DOG; 

CREATE TABLE ANSWER5
AS SELECT NETID, NNUMBER
FROM TEMP5, TEMP15
WHERE NNUMBER = NNNUMBER
AND SERIALNUMBER > 1000;

PROMPT ANSWER5
SELECT * FROM ANSWER5;

-- ANSWER6

CREATE TABLE ANSWER6
AS SELECT DISTINCT Bites1.Biter AS SerialNumberA, Bites2.Bitee as SerialNumberC
FROM BITES Bites1, BITES Bites2
WHERE Bites1.Bitee = Bites2.Biter
ORDER BY SerialNumberA ASC, SerialNumberC ASC;

PROMPT ANSWER6
SELECT * FROM ANSWER6;

-- ANSWER7
CREATE TABLE TEMP7
AS SELECT DISTINCT DOG.SERIALNUMBER, DOG.NNUMBER
FROM DOG, BITES
WHERE BITES.BITEE = 4 AND DOG.SERIALNUMBER = BITES.BITER
ORDER BY DOG.SERIALNUMBER ASC, DOG.NNUMBER ASC;

CREATE TABLE TEMP8
AS (SELECT DISTINCT DOG.SERIALNUMBER, DOG.NNUMBER
    FROM DOG, BITES
    WHERE BITES.BITER = 6 AND DOG.SERIALNUMBER = BITES.BITEE
    INTERSECT
    SELECT DISTINCT DOG.SERIALNUMBER, DOG.NNUMBER
    FROM DOG, BITES
    WHERE BITES.BITER = 5 AND DOG.SERIALNUMBER = BITES.BITEE);

CREATE TABLE TEMP9
AS SELECT * FROM TEMP8
ORDER BY SERIALNUMBER ASC, NNUMBER ASC;

CREATE TABLE ANSWER7
AS (SELECT DISTINCT SERIALNUMBER, NNUMBER
    FROM TEMP7 
    UNION
    SELECT DISTINCT SERIALNUMBER, NNUMBER
    FROM TEMP9);


PROMPT ANSWER7
SELECT * FROM ANSWER7;

spool off
