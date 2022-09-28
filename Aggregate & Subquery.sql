//-- AGGREGATE---
CREATE TABLE employee_wage(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours varchar(10)  
);  
INSERT INTO employee_wage VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);
//-- SUM
SELECT COUNT(name) FROM employee_wpersonspersons_dataage;  

//-- SUM------
 SELECT SUM(working_hours) AS "Total working hours" FROM employee_wage;
 
 //-- AVG--
 SELECT AVG(working_hours) AS "Average working hours" FROM employee_wage; 
 
 //-- MIN---
 SELECT MIN(working_hours) AS Minimum_working_hours FROM employee_wage;    
 
 //-- MAX--
 SELECT MAX(working_hours) AS Maximum_working_hours FROM employee_wage; 
 
 //-- FIRST ---
 SELECT working_date FROM employee_wage LIMIT 2; 
 
 //-- LAST ---
 SELECT name FROM employee_wage ORDER BY name DESC LIMIT 1; 
 SELECT name FROM employee_wage ORDER BY name ASC LIMIT 1; 
 
 //-- --------------------------------------------------------------------------------------------------------------------------------
 //-- SUBQUERY---------------
 Create table emp_wage(
 id int primary key not null,
 name varchar (45) not null,
 age int not null,
 city varchar (45) not null,
 income int  not null
 );
 INSERT INTO emp_wage VALUES    
(101,'Robin',32, 'NewYork',200000 ),  
(102,'Warner',32, 'California', 300000 ),  
(103,'Peter', 40,'Arizona',1000000 ),  
(104,'Marco', 35,'Florida', 5000000),  
(105,'Brayden',32, 'Georgia',250000 ),  
(106,'Antonio',45, 'Alaska', 450000),
(107,'Adam',35, 'NewYork',5000000 ),  
(108,'Macculam',40, 'California', 350000 ),  
(109,'Brayan', 32,'Arizona',400000 ),  
(110,'Stephan', 40,'Florida', 600000),  
(111,'Alexander',45, 'Georgia',70000 );
select * from emp_wage;
SELECT name, city, income FROM emp_wage   
   WHERE id IN (SELECT id FROM emp_wage);
   
   //-- Comparison Operator
   SELECT * FROM emp_wage   
   WHERE id IN (SELECT id FROM emp_wage  
         WHERE income > 350000); 
SELECT name, city, income FROM emp_wage   
   WHERE income = (SELECT MAX(income) FROM emp_wage);
   
   //-- Correlated Subqueries
 SELECT name, city, income  
FROM emp_wage emp WHERE income > (   
SELECT AVG(income) FROM emp_wage WHERE city = emp.city);

//-- Subquery with IN or NOT-IN Operator
CREATE TABLE Student1(
			Id INTEGER, 
			Name TEXT NOT NULL, 
			Email TEXT NOT NULL, 
			City VARCHAR(35));
		select * from Student1;    
		INSERT INTO Student1 VALUES
			(1, 'Peter', 'peter@gmail.com', 'Texas'), 
			(2, 'Suzi', 'suzi@gmail.com', 'California'),
			(3, 'Joseph', 'joseph@gmail.com', 'Alaska'),
			(4, 'Andrew', 'andrew@gmail.com', 'Los Angeles'),
			(5, 'Brayan', 'brayan@gmail.com', 'New York');
            
CREATE TABLE Student2
(Id INTEGER, Email TEXT NOT NULL, Name TEXT NOT NULL, City VARCHAR(35));  
INSERT INTO Student2 VALUES(1, 'stephen@gmail.com', 'stephen', 'texas');    
INSERT INTO Student2 VALUES(2, 'joseph@gmail.com', 'joseph', 'los angeles'); 
INSERT INTO Student2 VALUES(3, 'peter@gmail.com', 'peter', 'california'); 
INSERT INTO Student2 VALUES(4, 'david@gmail.com', 'david', 'new york'); 
INSERT INTO Student2 VALUES(5, 'maddy@gmail.com', 'maddy', 'los angeles'); 
select * from Student2;

SELECT Name, City FROM student1  
WHERE City NOT IN (  
SELECT City FROM student2 WHERE City='Los Angeles');
