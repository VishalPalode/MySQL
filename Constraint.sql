/-- NOT NULL
CREATE TABLE Student
(Id INTEGER, LastName TEXT NOT NULL, FirstName TEXT NOT NULL, City VARCHAR(35));  
INSERT INTO Student VALUES(1, 'patil', 'vishal', 'pune');    
INSERT INTO Student VALUES(2, 'Michel', 'Clark', 'Austrelia'),
							(3, 'Ethon', 'Miller', 'England'),
                            (4, 'Mark', 'Strauss', 'America');
SELECT * FROM Student;

//-- UNIQUE
CREATE TABLE ShirtBrands(Id INTEGER, BrandName VARCHAR(40) UNIQUE, Size VARCHAR(30)); 
INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, 'Pantaloons', 38), (2, 'Cantabil', 40);  
INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, 'Raymond', 38), (2, 'Cantabil', 40);
select * from ShirtBrands;

//-- check 
CREATE TABLE Persons (  
    ID int NOT NULL,  
    Name varchar(45) NOT NULL,  
    Age int CHECK (Age>=18)  
);  
INSERT INTO Persons(Id, Name, Age)   
VALUES (1,'Robert', 28), (2, 'Joseph', 35), (3, 'Peter', 40);  
INSERT INTO Persons(Id, Name, Age) VALUES (1,'Robert', 15);  
select* from Persons;

//-- DEFAULT
CREATE TABLE emp (  
    ID int NOT NULL,  
    Name varchar(45) NOT NULL,  
    Age int,  
    City varchar(25) DEFAULT 'Pune'  
);  
INSERT INTO emp(Id, Name, Age, City)   
VALUES (1,'karan', 15, 'mumbai'),   
(2, 'omkar', 35, 'satara'),   
(3, 'ayush', 40, 'lonawala');
INSERT INTO emp (Id, Name, Age) VALUES (1,'Rohit', 15);  
select * from emp;

//-- PRIMARY KEY
CREATE TABLE emp2 (  
    ID int NOT NULL PRIMARY KEY,   
    Name varchar(45) NOT NULL,   
    Age int,   
    City varchar(25));  
    INSERT INTO emp2(Id, Name, Age, City)   
VALUES (1,'amol', 15, 'Banglore') ,   
(2, 'akshay', 35, 'Chennai'),   
(3, 'saurabh', 40, 'nashik');  
  
INSERT INTO Persons(Id, Name, Age, City)   
VALUES (1,'Stephen', 15, 'Florida');
select * from emp2;

//-- Auto Increment
CREATE TABLE Animals(  
id int NOT NULL AUTO_INCREMENT,   
name CHAR(30) NOT NULL,   
PRIMARY KEY (id));
 INSERT INTO Animals (name) 
 VALUES   ('Tiger'),('Dog'),('Penguin'), ('Camel'),('Cat'),('Ostrich'); 
 select * from Animals;
 
 //-- ENUM 
 CREATE TABLE Shirts (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    name VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')    
);  
INSERT INTO Shirts(id, name, size)     
VALUES (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large');
select * from shirts;

//-- INDEX
CREATE INDEX idx_shirts ON Shirts(name); 
select* from shirts use index(idx_shirts);

//-- FOREIGN KEY----
CREATE TABLE Persons_Data (  
    Person_ID int NOT NULL PRIMARY KEY,   
    Name varchar(45) NOT NULL,   
    Age int,   
    City varchar(25)  
);  
INSERT INTO Persons_Data(Person_Id, Name, Age, City)   
VALUES (1,'Robert', 15, 'Florida') ,   
(2, 'Joseph', 35, 'California'),   
(3, 'Peter', 40, 'Alaska');
CREATE TABLE Orders (  
    Order_ID int NOT NULL PRIMARY KEY,  
    Order_Num int NOT NULL,  
    Person_ID int,  
    FOREIGN KEY (Person_ID) REFERENCES Persons_Data(Person_ID)  
);  
insert into Orders values(1,100,1),(2,101,2),(3,101,2); 
select * from Orders where person_ID = 2;
select * from Orders;