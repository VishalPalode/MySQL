select * from persons_data;
select * from student1;
//-- Inner join
SELECT persons_data.Name, persons_data.city, student1.email  
FROM persons_data   
INNER JOIN student1 
ON persons_data.Person_Id = student1.id;  

//-- Outer join
SELECT persons_data.Name, persons_data.city, student1.email  
FROM persons_data   
LEFT JOIN student1 
ON persons_data.Person_Id = student1.id; 

//-- Right outer 
SELECT persons_data.Name, persons_data.city, student1.email  
FROM persons_data   
RIGHT JOIN student1 
ON persons_data.Person_Id = student1.id;

//-- Inner
Create table technologies (
studentid integer,
techid integer,
inst_name varchar(45),
technology varchar(45));
insert into technologies values ( 1, 1, 'java training inst', 'java'),
(2, 2, 'chroma campus', 'angular'),
(3, 3, 'cepta infotech', 'big data'),
(4, 4, 'aptron', 'ios');
alter table technologies rename column studentid to id;
select * from technologies;
select * from student;
SELECT student.LastName, student.FirstName,student.City, technologies.technology    
FROM student  
INNER JOIN technologies    
ON student.id = technologies.techid;  

//-- Inner Join with Group By Clause
SELECT student.id, technologies.inst_name, student.city, technologies.technology    
FROM student
INNER JOIN technologies    
ON student.id = technologies.techid GROUP BY inst_name;

//--  Inner Join with USING clause
SELECT id, inst_name, city, technology    
FROM student  
INNER JOIN technologies    
USING (id);

//-- Inner Join with WHERE Clause
SELECT techid, inst_name, city, technology    
FROM student  
INNER JOIN technologies    
USING (id) WHERE technology = "Java";

//--  Inner Join Multiple Tables
  Create table contact (
					college_id integer,
					cellphone varchar(20),
					homephone varchar(20));
insert into contact values
					(1, 23232323,545455455),
                    (2, 23456788,456789033),
                    (3, 89765432,789065433),
                    (4, 67253545,987654332);
select * from contact;
SELECT id, inst_name, city, technology, cellphone  
FROM student  
INNER JOIN technologies USING (id)  
INNER JOIN contact ORDER BY id; 

//-- Left Join
create table Order1 (
order_id int,
date date,
customer_id int,
price int
);
insert into Order1 values 
(1001, '2020-03-20', 2, 3000);
insert into Order1 values
(1002, '2020-02-15', 4, 2500),
(1003, '2020-01-31', 5, 5000),
(1004, '2020-03-10', 2, 1500),
(1005, '2020-02-20', 1, 4500);
select * from Order1;

create table customer1(
			customer_id int,
            cust_name varchar(25),
            occupation varchar(30),
            income varchar(50),
            qualification varchar(25)
        );
insert into customer1 values
			(1,'John Miller', 'Developer',20000,'Btech'),
            (2,'Mark Robert', 'Engineer',40000,'Btech'),
            (3,'Reyan Watson', 'Scientist',60000,'Msc'),
            (4,'Shane Trump', 'Businessman',10000,'MBA'),
            (5,'Adam Obama', 'Manager',80000,'MBA'),
            (6,'Rincky Ponting', 'Cricketer',200000,'Btech');
select * from customer1;
//-- LEFT JOIN clause for joining two tables
SELECT customer1.customer_id, cust_name, price, date  
FROM customer1  
LEFT JOIN order1 ON customer1.customer_id = order1.customer_id;  
//-- LEFT JOIN with USING Clause
SELECT customer_id, cust_name, occupation, price, date  
FROM customer1  
LEFT JOIN order1 USING(customer_id);
//-- LEFT JOIN with Group By Clause
SELECT customer1.customer_id, cust_name, qualification, price, date  
FROM customer1  
LEFT JOIN order1 ON customer1.customer_id = order1.customer_id  
GROUP BY price;   
//-- LEFT JOIN with WHERE Clause
SELECT customer_id, cust_name, occupation, price, date  
FROM customer1  
LEFT JOIN order1   
USING(customer_id) WHERE price>2500;  
//-- Use of LEFT JOIN clause to get unmatched records
SELECT customer_id, cust_name, cellphone, homephone  
FROM customer1  
LEFT JOIN contact ON customer_id = college_id  
WHERE cellphone IS NULL ;  
//-- Difference between WHERE and ON clause in MySQL LEFT JOIN
//-- where clause
SELECT cust_name, occupation, order_id, price, date  
FROM customer1  
LEFT JOIN order1  
USING(customer_id) WHERE price=2500; 
//-- on clause
SELECT cust_name, occupation, order_id, price, date  
FROM customer1 LEFT JOIN order1 ON price=2500;

// -------------- RIGHT JOIN -----------------
//-- RIGHT JOIN clause for joining two tables
SELECT customer1.customer_id, cust_name, price, date  
FROM customer1 
RIGHT JOIN order1 ON customer1.customer_id = order1.customer_id  
ORDER BY  customer_id; 
//-- RIGHT JOIN with WHERE Clause
SELECT * FROM customer1  
RIGHT JOIN order1 USING(customer_id)  
WHERE price>2500 AND price<5000;
//--  RIGHT JOIN Multiple Tables
SELECT customer1.customer_id, cust_name, order_id, price, cellphone  
FROM customer1 
RIGHT JOIN contact ON customer_id = college_id  
RIGHT JOIN order1 ON customer1.customer_id = order1.customer_id ORDER BY order_id; 
//-- Use of RIGHT JOIN clause to get unmatched records
SELECT customer_id, cust_name, cellphone, homephone  
FROM customer1  
RIGHT JOIN contact ON customer_id = college_id  
WHERE cellphone IS NULL  
ORDER BY cellphone;

//----------------------------- MySQL CROSS JOIN ---------------
//-- CROSS JOIN clause for joining two tables
SELECT *  
FROM customer1  
CROSS JOIN contact;
//-- Ambiguous Columns problem in MySQL CROSS JOIN
SELECT customer_id, cust_name, income, order_id, price  
FROM customer1  
CROSS JOIN order1;
SELECT customer1.customer_id, customer1.cust_name, customer1.income, order1.order_id, order1.price  
FROM customer1 
CROSS JOIN order1;  
//-- LEFT JOIN with WHERE Clause
SELECT customer1.customer_id, customer1.cust_name, customer1.income, order1.order_id, order1.price  
FROM customer1  
CROSS JOIN order1 
USING(customer_id) WHERE price>1500 AND price<5000;  
//-- CROSS JOIN Multiple Tables
SELECT * FROM customer1  
LEFT JOIN(order1 CROSS JOIN contact)  
ON customer1.customer_id=college_id  
ORDER BY income;
 //-- --------------MySQL SELF JOIN----------
 Create table student3 (
 student_id int,
 name varchar (45),
 course_id int,
 duration int
 );
 insert into student3 value
            (1,'Adam',1,3),
            (2,'Peter',2,4),
            (1,'Adam',2,4),
            (3,'Brian',3,2),
            (2,'Shane',3,5);
select * from student3;
//-- SELF JOIN Example
SELECT  s1.student_id, s1.name  
FROM student3 AS s1, student3 s2  
WHERE s1.student_id=s2.student_id  
AND s1.course_id<>s2.course_id;  
//-- SELF JOIN using INNER JOIN clause
SELECT  s1.student_id, s1.name  
FROM student3 s1  
INNER JOIN student3 s2  
ON s1.student_id=s2.student_id  
AND s1.course_id<>s2.course_id  
GROUP BY student_id;

//-- ------------------------MySQL DELETE JOIN------------------------
select * from student;
select * from contact;
//-- DELETE JOIN with INNER JOIN
DELETE student, contact FROM student
INNER JOIN contact ON student.id=contact.college_id   
WHERE student.id = 4;      
//-- DELETE JOIN with LEFT JOIN
DELETE Table1 FROM Table1  
LEFT JOIN Table2 ON Table1.key = Table2.key   
WHERE Table2.key IS NULL;  

//-- --------------------------MySQL UPDATE JOIN--------------------
CREATE TABLE Performance (  
    performance INT(11) NOT NULL,  
    percentage FLOAT NOT NULL,  
    PRIMARY KEY (performance)  
);  
INSERT INTO Performance (performance, percentage)  
VALUES(101,0),  
      (102,0.01),  
      (103,0.03),  
      (104,0.05),  
      (105,0.08); 
select * from Performance;
CREATE TABLE Employees (  
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(255) NOT NULL,  
    performance INT(11) DEFAULT NULL,  
    salary FLOAT DEFAULT NULL,  
    CONSTRAINT fk_performance FOREIGN KEY (performance) REFERENCES Performance (performance)  
);
INSERT INTO Employees (name, performance, salary)        
VALUES('Mary', 101, 55000),  
      ('John', 103, 65000),  
      ('Suzi', 104, 85000),  
      ('Gracia', 105, 110000),  
      ('Nancy Johnson', 103, 95000),  
      ('Joseph', 102, 45000),  
      ('Donald', 103, 50000);  
select * from Employees;
//-- ----UPDATE JOIN with INNER JOIN Example---------
UPDATE Employees e  
INNER JOIN Performance p   
ON e.performance = p.performance  
SET salary = salary + salary * percentage;
//-- UPDATE JOIN with LEFT JOIN Example
INSERT INTO Employees (name, performance, salary)  
VALUES('William', NULL, 73000),  
      ('Rayan', NULL, 92000);  
UPDATE Employees e 
LEFT JOIN Performance p   
ON e.performance = p.performance   
SET salary = salary + salary * 0.025  
WHERE p.percentage IS NULL;

//-- -------------MySQL EquiJoin------------------
//-- Equi Join Using Three Tables
CREATE TABLE cust_info (  
    account_no int,  
    mobile VARCHAR(15),  
    address VARCHAR(65)  
);  
INSERT INTO cust_info (account_no, mobile, address)  
VALUES(1030, '598675498654', '777 Brockton Avenue, Abington MA 251'),   
    (2035, '698853747888', '337 Russell St, Hadley MA 103'),   
    (5564, '234456977555', '20 Soojian Dr, Leicester MA 154'),   
    (4534, '987656789666', '780 Lynnway, Lynn MA 19'),   
    (7648, '756489372222', '700 Oak Street, Brockton MA 23');  
    select * from cust_info;
    create table balance (
    id int,
    account_num int,
    balance int);
    insert into balance values
    (1, 1030, 50000),
    (2, 2035, 230000),
    (3, 5564, 125000),
    (4, 4534, 80000),
    (5, 7648, 45000);
    select * from balance;
    create table customer3 (
			id int,
            customer_name varchar(40),
            account varchar(20),
            email varchar(40)
            );
            insert into customer3 values
            (1,'stephen',1030,'stephen@gmail.com'),
            (2,'Jenifer',1030,'jenifer@gmail.com'),
            (3,'Mathew',1030,'mathew@gmail.com'),
            (4,'Smith',1030,'smith@gmail.com'),
            (5,'David',1030,'david@gmail.com');
select * from customer3;
SELECT C.customer_name, C.account, B.balance, I.mobile   
FROM customer3 AS C, balance AS B, cust_info AS I  
WHERE C.account = B.account_num   
AND B.account_num = I.account_no;

//-- ---------------MySQL Natural Join-----------
//-- Natural Join with WHERE Clause
SELECT cust. customer_name, bal.balance   
FROM customer3 AS cust   
NATURAL JOIN balance AS bal  
WHERE bal.balance > 50000;
//-- Natural Join Using Three Tables
SELECT C.customer_name, C.account, B.balance, I.mobile   
FROM customer3 AS C  
NATURAL JOIN balance AS B  
NATURAL JOIN cust_info AS I; 


	

