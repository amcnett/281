CREATE DATABASE Exam1;

USE Exam1;
 
INSERT INTO Exam1.Product VALUES (0.50); 
INSERT INTO Exam1.Product VALUES (1.00); 
INSERT INTO Exam1.Product VALUES (1.25); 
INSERT INTO Exam1.Product VALUES (2.00); 
INSERT INTO Exam1.Product VALUES (1.50); 

CREATE TABLE Exam1.Warehouse( 
	WarehouseId varchar(3) PRIMARY KEY, 
	Name varchar(255),  
); 

INSERT INTO Exam1.Warehouse  VALUES('100','Williamsport ABC'); 
INSERT INTO Exam1.Warehouse  VALUES('101','Lycoming FUN'); 
INSERT INTO Exam1.Warehouse  VALUES('102','FoodRUs'); 
INSERT INTO Exam1.Warehouse  VALUES('103','Snack Center'); 

CREATE TABLE StockItem (
	AffiliatedID varchar(3) PRIMARY KEY,  
	WarehouseID 
	ProductID 
	Qty int NOT NULL,
); 

INSERT INTO Exam1.StockItem VALUES('abc','101', 1, 100); 
INSERT INTO Exam1.StockItem VALUES('esf','102', 2, 200); 
INSERT INTO Exam1.StockItem VALUES('aef','103', 1, 120); 
INSERT INTO Exam1.StockItem VALUES('cba','101', 2, 200); 
INSERT INTO Exam1.StockItem VALUES('rtf','101', 1, 99); 
INSERT INTO Exam1.StockItem VALUES('lol','102', 3, 30); 
INSERT INTO Exam1.StockItem VALUES('ltr','103', 3, 0); 
INSERT INTO Exam1.StockItem VALUES('oky','101', 4, 50); 
INSERT INTO Exam1.StockItem VALUES('wht','101', 3, 40); 
INSERT INTO Exam1.StockItem VALUES('usz','102', 3, 220); 
INSERT INTO Exam1.StockItem VALUES('god','103', 1, 10); 
INSERT INTO Exam1.StockItem VALUES('def','101', 5, 100); 
