CREATE DATABASE Week10;

USE Week10;

CREATE TABLE Customer (
CusNumber int PRIMARY KEY,
Last varchar(15),
First varchar(15),
Init varchar(1),
AreaCode varchar(3),
Phone varchar(8),
Balance float(8)
);
INSERT INTO Customer VALUES('10010','Ramas','Alfred','A','615','844-2573','0');
INSERT INTO Customer VALUES('10011','Dunne','Leona','K','713','894-1238','0');
INSERT INTO Customer VALUES('10012','Smith','Kathy','W','615','894-2285','345.86');
INSERT INTO Customer VALUES('10013','Olowski','Paul','F','615','894-2180','536.75');
INSERT INTO Customer VALUES('10014','Orlando','Myron','','615','222-1672','0');
INSERT INTO Customer VALUES('10015','O''Brian','Amy','B','713','442-3381','0');
INSERT INTO Customer VALUES('10016','Brown','James','G','615','297-1228','221.19');
INSERT INTO Customer VALUES('10017','Williams','George','','615','290-2556','768.93');
INSERT INTO Customer VALUES('10018','Farriss','Anne','G','713','382-7185','216.55');
INSERT INTO Customer VALUES('10019','Smith','Olette','K','615','297-3809','0');

/* -- */

CREATE TABLE Invoice (
InvNumber int PRIMARY KEY,
CusNumber int,
Date datetime,
Subtotal float(8),
Tax float(8),
Total float(8),
CONSTRAINT FK_InvoiceCus FOREIGN KEY(CusNumber) REFERENCES Customer(CusNumber)
);
INSERT INTO Invoice VALUES('1001','10014','1/16/2016','24.90','1.99','26.89');
INSERT INTO Invoice VALUES('1002','10011','1/16/2016','9.98','0.80','10.78');
INSERT INTO Invoice VALUES('1003','10012','1/16/2016','153.85','12.31','166.16');
INSERT INTO Invoice VALUES('1004','10011','1/17/2016','34.97','2.80','37.77');
INSERT INTO Invoice VALUES('1005','10018','1/17/2016','70.44','5.64','76.08');
INSERT INTO Invoice VALUES('1006','10014','1/17/2016','397.83','31.83','429.66');
INSERT INTO Invoice VALUES('1007','10015','1/17/2016','34.97','2.80','37.77');
INSERT INTO Invoice VALUES('1008','10011','1/17/2016','399.15','31.93','431.08');

/* -- */

CREATE TABLE Line(
InvNumber int,
LineNumber int,
ProductNumber varchar(10),
Units float(8),
Price float(8),
Total float(8),
CONSTRAINT FK_LineInvNumber FOREIGN KEY(InvNumber) REFERENCES Invoice(InvNumber),
CONSTRAINT PK_Line PRIMARY KEY(InvNumber, LineNumber)
);
INSERT INTO Line VALUES('1001','1','13-Q2/P2','1','14.99','14.99');
INSERT INTO Line VALUES('1001','2','23109-HB','1','9.95','9.95');
INSERT INTO Line VALUES('1002','1','54778-2T','2','4.99','9.98');
INSERT INTO Line VALUES('1003','1','2238/QPD','1','38.95','38.95');
INSERT INTO Line VALUES('1003','2','1546-QQ2','1','39.95','39.95');
INSERT INTO Line VALUES('1003','3','13-Q2/P2','5','14.99','74.95');
INSERT INTO Line VALUES('1004','1','54778-2T','3','4.99','14.97');
INSERT INTO Line VALUES('1004','2','23109-HB','2','9.95','19.90');
INSERT INTO Line VALUES('1005','1','PVC23DRT','12','5.87','70.44');
INSERT INTO Line VALUES('1006','1','SM-18277','3','6.99','20.97');
INSERT INTO Line VALUES('1006','2','2232/QTY','1','109.92','109.92');
INSERT INTO Line VALUES('1006','3','23109-HB','1','9.95','9.95');
INSERT INTO Line VALUES('1006','4','89-WRE-Q','1','256.99','256.99');
INSERT INTO Line VALUES('1007','1','13-Q2/P2','2','14.99','29.98');
INSERT INTO Line VALUES('1007','2','54778-2T','1','4.99','4.99');
INSERT INTO Line VALUES('1008','1','PVC23DRT','5','5.87','29.35');
INSERT INTO Line VALUES('1008','2','WR3/TT3','3','119.95','359.85');
INSERT INTO Line VALUES('1008','3','23109-HB','1','9.95','9.95');

/* -- */
CREATE TABLE Vendor (
VendorNumber int PRIMARY KEY,
Name varchar(15),
Contact varchar(50),
AreaCode varchar(3),
Phone varchar(8),
State varchar(2),
VendorOrder varchar(1)
);
INSERT INTO Vendor VALUES('21225','Bryson, Inc.','Smithson','615','223-3234','TN','Y');
INSERT INTO Vendor VALUES('21226','SuperLoo, Inc.','Flushing','904','215-8995','FL','N');
INSERT INTO Vendor VALUES('21231','D&E Supply','Singh','615','228-3245','TN','Y');
INSERT INTO Vendor VALUES('21344','Gomez Bros.','Ortega','615','889-2546','KY','N');
INSERT INTO Vendor VALUES('22567','Dome Supply','Smith','901','678-1419','GA','N');
INSERT INTO Vendor VALUES('23119','Randsets Ltd.','Anderson','901','678-3998','GA','Y');
INSERT INTO Vendor VALUES('24004','Brackman Bros.','Browning','615','228-1410','TN','N');
INSERT INTO Vendor VALUES('24288','ORDVA, Inc.','Hakford','615','898-1234','TN','Y');
INSERT INTO Vendor VALUES('25443','B&K, Inc.','Smith','904','227-0093','FL','N');
INSERT INTO Vendor VALUES('25501','Damal Supplies','Smythe','615','890-3529','TN','N');
INSERT INTO Vendor VALUES('25595','Rubicon Systems','Orton','904','456-0092','FL','Y');

/* --- */

CREATE TABLE Product (
ProductCode varchar(10) PRIMARY KEY,
Description varchar(35),
Date datetime,
QOH int,
Min int,
Price float(8),
Discount float(8),
VendorNumber int,
CONSTRAINT FK_ProductVendorNumber FOREIGN KEY(VendorNumber) REFERENCES Vendor(VendorNumber)
);
INSERT INTO Product VALUES('11QER/31','Power painter, 15 psi., 3-nozzle',    '11/3/2015','8','5','109.99','0','25595');
INSERT INTO Product VALUES('13-Q2/P2','7.25-in. pwr. saw blade',            '12/13/2015','32','15','14.99','0.05','21344');
INSERT INTO Product VALUES('14-Q1/L3','9.00-in. pwr. saw blade',            '11/13/2015','18','12','17.49','0','21344');
INSERT INTO Product VALUES('1546-QQ2','Hrd. cloth, 1/4-in., 2x50',           '1/15/2016','15','8','39.95','0','23119');
INSERT INTO Product VALUES('1558-QW1','Hrd. cloth, 1/2-in., 3x50',           '1/15/2016','23','5','43.99','0','23119');
INSERT INTO Product VALUES('2232/QTY','B&D jigsaw, 12-in. blade',           '12/30/2015','8','5','109.92','0.05','24288');
INSERT INTO Product VALUES('2232/QWE','B&D jigsaw, 8-in. blade',            '12/24/2015','6','5','99.87','0.05','24288');
INSERT INTO Product VALUES('2238/QPD','B&D cordless drill, 1/2-in.',         '1/20/2016','12','5','38.95','0.05','25595');
INSERT INTO Product VALUES('23109-HB','Claw hammer',                         '1/20/2016','23','10','9.95','0.1','21225');
INSERT INTO Product VALUES('54778-2T','Rat-tail file, 1/8-in. fine',        '12/15/2015','43','20','4.99','0','21344');
INSERT INTO Product VALUES('89-WRE-Q','Hicut chain saw, 16 in.',              '2/7/2016','11','5','256.99','0.05','24288');
INSERT INTO Product VALUES('SM-18277','1.25-in. metal screw, 25',             '3/1/2016','172','75','6.99','0','21225');
INSERT INTO Product VALUES('SW-23116','2.5-in. wd. screw, 50',               '2/24/2016','237','100','8.45','0','21231');
INSERT INTO Product VALUES('WR3/TT3','Steel matting, 4''x8''x1/6", .5" mesh','1/17/2016','18','5','119.95','0.1','25595');

CREATE TABLE Employee (
EmployeeNumber int PRIMARY KEY,
Title varchar(4),
LastName varchar(15),
FirstName varchar(15),
Initial varchar(1),
DOB datetime,
HireDate datetime,
AreaCode varchar(3),
Phone varchar(8)
);
INSERT INTO Employee VALUES('100','Mr.','Kolmycz','George','D','6/15/1942','3/15/1985','615','324-5456');
INSERT INTO Employee VALUES('101','Ms.','Lewis','Rhonda','G','3/19/1965','4/25/1986','615','324-4472');
INSERT INTO Employee VALUES('102','Mr.','VanDam','Rhett','','11/14/1958','12/20/1990','901','675-8993');
INSERT INTO Employee VALUES('103','Ms.','Jones','Amy','M','10/16/1974','8/28/1994','615','898-3456');
INSERT INTO Employee VALUES('104','Mr.','Lange','John','P','11/8/1971','10/20/1994','901','504-4430');
INSERT INTO Employee VALUES('105','Mr.','Williams','Robert','D','3/14/1975','11/8/1998','615','890-3220');
INSERT INTO Employee VALUES('106','Mrs.','Smith','Jeanine','K','2/12/1968','1/5/1989','615','324-7883');
INSERT INTO Employee VALUES('107','Mr.','Diante','Jorge','D','8/21/1974','7/2/1994','615','890-4567');
INSERT INTO Employee VALUES('108','Mr.','Wiesenbach','Paul','R','2/14/1966','11/18/1992','615','897-4358');
INSERT INTO Employee VALUES('109','Mr.','Smith','George','K','6/18/1961','4/14/1989','901','504-3339');
INSERT INTO Employee VALUES('110','Mrs.','Genkazi','Leighla','W','5/19/1970','12/1/1990','901','569-0093');
INSERT INTO Employee VALUES('111','Mr.','Washington','Rupert','E','1/3/1966','6/21/1993','615','890-4925');
INSERT INTO Employee VALUES('112','Mr.','Johnson','Edward','E','5/14/1961','12/1/1983','615','898-4387');
INSERT INTO Employee VALUES('113','Ms.','Smythe','Aimee','P','9/15/1970','5/11/1999','615','324-9006');
INSERT INTO Employee VALUES('114','Ms.','Brandon','Marie','G','11/2/1956','11/15/1979','901','882-0845');
INSERT INTO Employee VALUES('115','Mrs.','Saranda','Hermine','R','7/25/1972','4/23/1993','615','324-5505');
INSERT INTO Employee VALUES('116','Mr.','Smith','Jon','A','11/8/1965','12/10/1988','615','890-2984');

-- HOW CAN YOU SEE THIS VISUALLY?

-- === SQL FUNCTIONS
-- DATE/TIME FUNCTIONS

-- 1) List all employess born in 1966


-- 2) * List all employess born in November


-- 3) List each invoice number with the number of days for each invoice from the date 1/15/2016


-- 4) List all Employees that were hired within the last 7 days of a month.


-- === NUMERIC FUNCTIONS

-- 5) List absolute value
SELECT -1.93;

-- 6) List the product prices rounded to one and zero decimal places


-- 7) List the product price rounded to one and zero decimal places and truncated.
-- Sidebar on round()
SELECT ROUND(150.75, 0); --Note not truncated... how do we get rid of the decimal places?
GO  
SELECT ROUND(150.75, 0, 1); --Note truncated
GO  

-- 8) Do the following conversions

-- show current date using the british standard (day before month)

-- show current date as 01 Apr 19

-- show current time as hh:mm:ss

-- 9) * List the product price, smallest integer greater than or equal to the product price, and the largest integer equal or less than the product price.


-- === STRING FUNCTIONS
-- CONCATENATION
-- 10) List all Employee names (concatenated)


-- 11) List all Employee names in all capitals (concatenated)


-- 12) List the first three characters of all Employee’s phone numbers


-- 13) List all Employee’s last names and the length of their names, ordered descended by last name length


-- 14)* Generate a list of Employee user ids using the first character of first name and first 7 characters of last name and the length of their last name


-- 15)* What does this do?
SELECT * 
FROM Employee 
WHERE SOUNDEX('Amy') = SOUNDEX(FirstName);


-- SUB-QUERIES
-- SOME TIMES WE NEED TO PROCESS DATA BASED ON OTHER PROCESSED DATA

-- 16) LIST ALL VENDORS THAT PROVIDE PRODUCTS? (IN subquery)


-- 17) LIST OF PRODUCTS WITH PRICE >= AVERAGE PRODUCT PRICE? (WHERE subquery)


-- 18) Show all products with a vendor area code 615 


-- 19) LIST ALL PRODUCTS WITH A TOTAL UNITS SOLD GREATER THAN THE AVERAGE UNITS SOLD? (HAVING subquery)


-- 20) *STUDENT LIST ALL CUSTOMERS THAT PURCHASED ANY TYPE OF HAMMER OR ANY KIND OF SAW OR SAW BLADE? 


-- --- ALL MULTI-ROW OPERAND SUB-QUERIES
-- 21) LIST ALL PRODUCTS WITH A PRODUCT COST (QOH * PRICE) GREATER THAN ALL INDIVIDUAL PRODUCT COSTS OF PRODUCTS PROVIDED BY VENDORS IN FLORIDA? (ALL multirow)


-- --- ATTRIBUTE LIST SUB-QUERIES
-- 22) List the the difference between each product’s price and the average product price (SELECT subquery)


-- 23) * List the product code, total sales by product(units * price), and total sales divided by number of Employees? (SELECT suquery)
