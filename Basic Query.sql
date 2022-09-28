 CREATE DATABASE CQA_106;
  SHOW CREATE DATABASE CQA_106;
  USE CQA_106;
  CREATE DATABASE CQA_106_NEW;
  SHOW DATABASES;
  DROP DATABASE cqa_106_new;
  CREATE TABLE employee_table(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    occupation varchar(35) NOT NULL,  
    age int NOT NULL,  
    PRIMARY KEY (id)  
);  
SHOW TABLES;
 DESCRIBE employee_table;
 ALTER TABLE employee_table  
ADD salary varchar(40) NOT NULL;  
ALTER TABLE employee_table  
ADD email varchar(40) NOT NULL; 
ALTER TABLE employee_table 
RENAME column email to email_id; 
ALTER TABLE employee_table 
DROP COLUMN email_id;
INSERT INTO employee_table (id, name, occupation, age, salary)
VALUES (1, "vishal", "engineer", 22, 50000);
SELECT* FROM employee_table;
INSERT INTO employee_table ( name, occupation, age, salary)
VALUES ( "Ronit", "engineer", 22, 50000);

CREATE TABLE customer (    
    Id int PRIMARY KEY NOT NULL,     
    Name varchar(45) NOT NULL,     
    Product varchar(45) DEFAULT NULL,     
    Country varchar(25) DEFAULT NULL,     
    Year int NOT NULL    
); 
Desc customer;
INSERT INTO customer ( Id, Name, Product, Country, Year)     
VALUES (1, 'vishal', 'Computer', 'IND', 2020),     
(2, 'Vikas', 'Laptop', 'India', 2016),     
(3, 'Ronit', 'TV', 'USA', 2016),    
(4, 'Sanket', 'Mobile', 'India', 2018),    
(6, 'Ayush', 'Mouse', 'England', 2016); 
Select * from customer;
TRUNCATE TABLE customer;