CREATE DATABASE Exam1;

USE Exam1;
 
INSERT INTO Exam1.Manufacturer VALUES ('Ward'); 
INSERT INTO Exam1.Manufacturer VALUES ('East Penn'); 
INSERT INTO Exam1.Manufacturer VALUES ('Sedco'); 
INSERT INTO Exam1.Manufacturer VALUES ('Primus'); 
INSERT INTO Exam1.Manufacturer VALUES ('QorTek'); 

CREATE TABLE Exam1.Customer( 
	CustomerId varchar(3) PRIMARY KEY, 
	Title varchar(4), 
	LastName varchar(15), 
	FirstName varchar(15), 
	Initial varchar(1), 
	DOB datetime, 
	Areacode varchar(3), 
	Phone varchar(8) 
); 

INSERT INTO Exam1.Customer  VALUES('100','Mr.','Kolmycz','George','D','6/15/1942','615','324-5456'); 
INSERT INTO Exam1.Customer  VALUES('101','Ms.','Lewis','Rhonda','G','3/19/2005','615','324-4472'); 
INSERT INTO Exam1.Customer  VALUES('102','Mr.','VanDam','Rhett','','11/14/1958','901','675-8993'); 
INSERT INTO Exam1.Customer  VALUES('103','Ms.','Jones','Anne','M','10/16/1974','615','898-3456'); 
INSERT INTO Exam1.Customer  VALUES('104','Mr.','Lange','John','P','11/8/1971','901','504-4430'); 
INSERT INTO Exam1.Customer  VALUES('105','Mr.','Williams','Robert','D','3/14/1975','615','890-3220'); 
INSERT INTO Exam1.Customer  VALUES('106','Mrs.','Smith','Jeanine','K','2/12/2003','615','324-7883'); 
INSERT INTO Exam1.Customer  VALUES('107','Mr.','Diante','Jorge','D','8/21/1974','615','890-4567'); 
INSERT INTO Exam1.Customer  VALUES('108','Mr.','Wiesenbach','Paul','R','2/14/1966','615','897-4358'); 
INSERT INTO Exam1.Customer  VALUES('109','Mr.','Smith','George','K','6/18/1961','901','504-3339'); 
INSERT INTO Exam1.Customer  VALUES('110','Mrs.','Genkazi','Leighla','W','5/19/1970','901','569-0093'); 
INSERT INTO Exam1.Customer  VALUES('111','Mr.','Washington','Rupert','E','1/3/1966','615','890-4925'); 
INSERT INTO Exam1.Customer  VALUES('112','Mr.','Johnson','Edward','E','5/14/1961','615','898-4387'); 
INSERT INTO Exam1.Customer  VALUES('113','Ms.','Smythe','Melanie','P','9/15/1970','615','324-9006'); 
INSERT INTO Exam1.Customer  VALUES('114','Ms.','Brandon','Marie','G','11/2/1932','901','882-0845'); 
INSERT INTO Exam1.Customer  VALUES('115','Mrs.','Saranda','Hermine','R','7/25/1972','615','324-5505'); 
INSERT INTO Exam1.Customer  VALUES('116','Mr.','Smith','George','A','11/8/1965','615','890-2984'); 


CREATE TABLE Affiliated (
	AffiliatedID varchar(3) PRIMARY KEY, 
	CustomerID  
	ManufacturerID 
); 

INSERT INTO Exam1.Affiliated VALUES('abc','101', 1); 
INSERT INTO Exam1.Affiliated VALUES('esf','102', 2); 
INSERT INTO Exam1.Affiliated VALUES('aef','103', 1); 
INSERT INTO Exam1.Affiliated VALUES('cba','104', 2); 
INSERT INTO Exam1.Affiliated VALUES('rtf','105', 1); 
INSERT INTO Exam1.Affiliated VALUES('lol','106', 3); 
INSERT INTO Exam1.Affiliated VALUES('ltr','107', 3); 
INSERT INTO Exam1.Affiliated VALUES('oky','108', 4); 
INSERT INTO Exam1.Affiliated VALUES('wht','109', 3); 
INSERT INTO Exam1.Affiliated VALUES('usz','110', 3); 
INSERT INTO Exam1.Affiliated VALUES('god','111', 1); 
INSERT INTO Exam1.Affiliated VALUES('def','102', 5); 






