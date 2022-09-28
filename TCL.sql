//-- ------------TCL Commands in SQL--------------
//-- Commit
CREATE TABLE t_school(ID INT, School_Name VARCHAR(40), Number_Of_Students INT, Number_Of_Teachers INT, Number_Of_Classrooms INT, EmailID VARCHAR(40));	
 START TRANSACTION;  
 INSERT INTO t_school(ID, School_Name, Number_Of_Students, Number_Of_Teachers, Number_Of_Classrooms, EmailID) VALUES
 (1, "Boys Town Public School", 1000, 80, 12, "btps15@gmail.com"), 
 (2, "Guru Govind Singh Public School", 800, 35, 15, "ggps25@gmail.com"), 
 (3, "Delhi Public School", 1200, 30, 10, "dps101@gmail.com"), 
 (4, "Ashoka Universal School", 1110, 40, 40, "aus17@gmail.com"), 
 (5, "Calibers English Medium School", 9000, 31, 50, "cems@gmail.com"); 
 SELECT *FROM t_school; 
  COMMIT;  
  SET autocommit = 0;  
  //--  SAVEPOINT
  savepoint save;
  //-- Rollback
  Rollback to save;
  UPDATE t_school SET Number_Of_Students = 9050 WHERE ID = 5;  
  SELECT *FROM t_school;  
  
  CREATE TABLE customer_TCL(
     Customer_ID INT PRIMARY KEY, 
     Name VARCHAR(20), 
     Age INT, 
     Salary INT, 
     Salary_BankAccount VARCHAR(20)); 
  INSERT INTO customer_TCL(Customer_ID, Name, Age, Salary, Salary_BankAccount) 
      VALUES(1, "Aryan Jain", 51, 56000, "SBI"),
      (2, "Arohi Dixit", 21, 25000, "Axis"), 
      (3, "Vineet Garg", 24, 31000, "ICICI"), 
      (4, "Anuja Sharma", 26, 49000, "HDFC"),
      (5, "Deepak Kohli", 28, 65000, "SBI");  
SELECT *FROM customer_TCL; 
START TRANSACTION;   
SAVEPOINT Insertion;  
DELETE FROM customer_TCL WHERE Customer_ID = 5; 
SELECT *FROM customer_TCL; 
SAVEPOINT Deletion;  
ROLLBACK TO Insertion;
SELECT *FROM customer_TCL;