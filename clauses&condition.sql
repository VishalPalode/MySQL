//-- CLAUSES---
CREATE TABLE People(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    occupation varchar(35) NOT NULL,  
    age int,  
    PRIMARY KEY (id)  
);  
INSERT INTO People VALUES  
(102, 'Joseph', 'Developer', 30),  
(103, 'Mike', 'Leader', 28),  
(104, 'Stephen', 'Scientist', 45);
INSERT INTO People Values
(105, 'John', 'singer', 32),  
(106, 'jos', 'Leader', 22),  
(107, 'harry', 'manager', 42);
select * from people;
UPDATE People    
SET age = '35'    
WHERE id = '102';
UPDATE People  
SET name = 'Mary', occupation = 'Content Writer'  
WHERE id = 104; 
DELETE FROM People WHERE id=104;  
DELETE FROM People ORDER BY name LIMIT 3;  
SELECT *  
FROM People
ORDER BY name ASC; 
SELECT *  FROM People
ORDER BY name DESC; 
select distinct occupation
from people;
SELECT NAME, COUNT(*)  
FROM   People   
GROUP BY name;
SELECT name, SUM(working_hours) AS "Total working hours"  
FROM employee_wage
GROUP BY name  
HAVING SUM(working_hours) > 5; 
//-- --------------------------------------------------------------------------------------------------------
//-- -----------------------------------condition-----
//-- AND
SELECT *  FROM People  
WHERE name = 'Mike'  
AND id = 103;
//-- OR 
 SELECT *  
FROM People
WHERE name = 'John'  
OR id = 105;
//-- AND OR  
SELECT *  
FROM People  
WHERE (name = 'Joseph' AND name = 'Mike')  
OR (id < 105);
//-- NOT EQUAL
SELECT * FROM People WHERE occupation != "Teacher";  
//-- NOT NULL
SELECT *  
FROM People
WHERE name IS NOT NULL;    
select * from People;
select id, name, occupation from People
where occupation = "Leader";
update people set occupation = "cricketer"
where id = '103';
//-- BOOLEAN 
CREATE TABLE student_record (  
    studentid INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(40) NOT NULL,  
    age VARCHAR(3),  
    pass BOOLEAN  
);  
INSERT INTO student_record(name, pass) VALUES('Peter',true), ('John',false); 
select * from student_record;
INSERT INTO student_record(name, pass) VALUES('Miller',2);
SELECT  studentid, name, IF(pass, 'true', 'false') completed FROM student_record; 
SELECT studentid, name, pass FROM student_record WHERE pass = TRUE;
SELECT studentid, name, pass FROM student_record WHERE pass is TRUE;
SELECT studentid, name, pass FROM student_record WHERE pass IS FALSE;
SELECT studentid, name, pass FROM student_record WHERE pass IS NOT TRUE;

//-- LIKE --------------------
select * from persons_data;   
insert into persons_data values (4,'john',28,'Florida');
//-- USING % WILDCARD
SELECT Name  
FROM persons_data 
WHERE City LIKE 'Flo%';
//-- USING _ (UNDERSCORE) WILDCARD 
SELECT Name  
FROM persons_data 
WHERE City LIKE 'Flo__da'; 
//-- USING NOT OPERATOR
SELECT Name  
FROM persons_data  
WHERE City NOT LIKE 'Flo%';

//-- IN CONDITION
SELECT *  
FROM persons_data 
WHERE Name IN ('joseph', 'peter');

//-- NOT CONDITION-----
SELECT *  
FROM persons_data 
WHERE Name NOT IN ('joseph', 'peter'); 

//-- NOT operator with IS NULL condition
SELECT *  
FROM persons_data 
WHERE Name IS NOT NULL; 

//-- NOT operator with LIKE condition
SELECT *  
FROM persons_data
WHERE Name NOT LIKE 'A%';

//-- NOT Operator with BETWEEN condition 	 
SELECT *  
FROM persons_data  
WHERE Person_ID NOT BETWEEN 3 AND 5;


//-- IS NULL CONDITION
SELECT *  
FROM persons_data 
WHERE Name IS NULL;

//-- BETWEEN CONDITION
SELECT *  
FROM persons_data 
WHERE Person_ID BETWEEN 1 AND 3;  