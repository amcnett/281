CREATE DATABASE Week02;

USE Week02;

CREATE SCHEMA People;
CREATE SCHEMA Items;

/* Database Systems, Coronel/Morris */
CREATE TABLE People.Customer (
CustomerId char(5),
LastName varchar(15),
FirstName varchar(15),
MI varchar(1),
Areacode varchar(3),
Phone varchar(8),
Balance float(8)
);
INSERT INTO People.Customer VALUES('10010','Ramas','Alfred','A','615','844-2573','0');
INSERT INTO People.Customer VALUES('10011','Dunne','Leona','K','713','894-1238','0');
INSERT INTO People.Customer VALUES('10012','Smith','Kathy','W','615','894-2285','345.859985351562');
INSERT INTO People.Customer VALUES('10013','Olowski','Paul','F','615','894-2180','536.75');
INSERT INTO People.Customer VALUES('10014','Orlando','Myron','','615','222-1672','0');

/* -- */
CREATE TABLE Employee (
EmployeeId int IDENTITY(1,1) PRIMARY KEY,
Title varchar(5),
LastName varchar(55),
FirstName varchar(55),
MI char(1),
DOB datetime NOT NULL,
HireDate datetime,
AreaCode char(3),
Phone char(8),
ManagerID int
);
INSERT INTO Employee VALUES('Mr.','Kolmycz','George','D','6/15/1942','3/15/1985','615','324-5456', NULL );
INSERT INTO Employee VALUES('Ms.','Lewis','Rhonda','G','3/19/1965','4/25/1986','615','324-4472',1);
INSERT INTO Employee VALUES('Mr.','VanDam','Rhett','','11/14/1958','12/20/1990','901','675-8993',1);
INSERT INTO Employee VALUES('Ms.','Jones','Anne','M','10/16/1974','8/28/1994','615','898-3456',1);
INSERT INTO Employee VALUES('Mr.','Lange','John','P','11/8/1971','10/20/1994','901','504-4430',1);
INSERT INTO Employee VALUES('Mr.','Williams','Robert','D','3/14/1975','11/8/1998','615','890-3220',1);
INSERT INTO Employee VALUES('Mrs.','Smith','Jeanine','K','2/12/1968','1/5/1989','615','324-7883',1);

/* -- */

CREATE TABLE Items.Invoice (
Id int,
CustomerId int,
InvoiceDate datetime
);
INSERT INTO Items.Invoice VALUES('1001','10014','1/16/2016');
INSERT INTO Items.Invoice VALUES('1002','10011','1/16/2016');
INSERT INTO Items.Invoice VALUES('1003','10012','1/16/2016');
INSERT INTO Items.Invoice VALUES('1004','10011','1/17/2016');
INSERT INTO Items.Invoice VALUES('1006','10014','1/17/2016');
INSERT INTO Items.Invoice VALUES('1008','10011','1/17/2016');

/* -- */

CREATE TABLE Items.Line (
InvoiceId int,
LineNumber int,
ProductId varchar(10),
Units float(8),
Price float(8) UNIQUE
);

ALTER TABLE Items.Line
ADD Total AS Units * Price; -- This is a calculated field. 

INSERT INTO Items.Line VALUES('1001','1','13-Q2/P2','1','14.91');
INSERT INTO Items.Line VALUES('1001','2','23109-HB','1','9.97');
INSERT INTO Items.Line VALUES('1002','1','54778-2T','2','4.99');
INSERT INTO Items.Line VALUES('1003','1','2238/QPD','1','38.95');
INSERT INTO Items.Line VALUES('1003','2','1546-QQ2','1','39.95');
INSERT INTO Items.Line VALUES('1003','3','13-Q2/P2','5','14.99');
INSERT INTO Items.Line VALUES('1004','1','54778-2T','3','4.98');
INSERT INTO Items.Line VALUES('1004','2','23109-HB','2','9.98');
INSERT INTO Items.Line VALUES('1006','1','SM-18277','3','6.99');
INSERT INTO Items.Line VALUES('1006','2','2232/QTY','1','109.92');
INSERT INTO Items.Line VALUES('1006','3','23109-HB','1','9.95');
INSERT INTO Items.Line VALUES('1006','4','89-WRE-Q','1','256.99');
INSERT INTO Items.Line VALUES('1008','1','PVC23DRT','5','5.87');
INSERT INTO Items.Line VALUES('1008','2','WR3/TT3','3','119.95');
INSERT INTO Items.Line VALUES('1008','3','23109-HB','1','9.93');

/* -- */

CREATE TABLE Items.Product (
Id varchar(10),
Description varchar(35),
InventoryDate datetime,
QOH int,
QOHMin int,
Price float(8),
Discount float(8),
Code int
);
INSERT INTO Items.Product VALUES('11QER/31','Power painter, 15 psi., 3-nozzle', '11/3/2015','8','5','109.99','0','25595');
INSERT INTO Items.Product VALUES('13-Q2/P2','7.25-in. pwr. saw blade', '12/13/2015','32','15', '14.99','0.05','21344');
INSERT INTO Items.Product VALUES('14-Q1/L3','9.00-in. pwr. saw blade', '11/13/2015','18','12','17.49','0','21344');
INSERT INTO Items.Product VALUES('1546-QQ2','Hrd. cloth, 1/4-in., 2x50', '1/15/2016','15','8','39.95','0','23119');
INSERT INTO Items.Product VALUES('1558-QW1','Hrd. cloth, 1/2-in., 3x50', '1/15/2016','23','5','43.99','0','23119');
INSERT INTO Items.Product VALUES('2232/QTY','B\&D jigsaw, 12-in. blade', '12/30/2015','8','5','109.92','0.05','24288');
INSERT INTO Items.Product VALUES('2232/QWE','B\&D jigsaw, 8-in. blade', '12/24/2015','6','5','99.87','0.05','24288');
INSERT INTO Items.Product VALUES('2238/QPD','B\&D cordless drill, 1/2-in.', '1/20/2016','12','5','38.95','0.05','25595');
INSERT INTO Items.Product VALUES('23109-HB','Claw hammer', '1/20/2016','23','10','9.95','0.1','21225');
INSERT INTO Items.Product VALUES('23114-AA','Sledge hammer, 12 lb.', '1/2/2016','8','5','14.40','0.05','');
INSERT INTO Items.Product VALUES('54778-2T','Rat-tail file, 1/8-in. fine', '12/15/2015','43','20','4.99','0','21344');
INSERT INTO Items.Product VALUES('89-WRE-Q','Hicut chain saw, 16 in.', '2/7/2016','11','5','256.99','0.05','24288');
INSERT INTO Items.Product VALUES('PVC23DRT','PVC pipe, 3.5-in., 8-ft', '2/20/2016','188','75','5.87','0','');
INSERT INTO Items.Product VALUES('SM-18277','1.25-in. metal screw, 25', '3/1/2016','172','75','6.99','0','21225');
INSERT INTO Items.Product VALUES('SW-23116','2.5-in. wd. screw, 50', '2/24/2016','237','100','8.45','0','21231');
INSERT INTO Items.Product VALUES('WR3/TT3','Steel matting, 4''x8''x1/6", .5" mesh','1/17/2016','18','5','119.95','0.1','25595');

/* -- */

CREATE TABLE People.Vendor (
Id int,
Name varchar(15),
Contact varchar(50),
Areacode varchar(3),
Phone varchar(8),
State varchar(2),
Ordered varchar(1)
);
INSERT INTO People.Vendor VALUES('21225','Bryson, Inc.','Smithson','615','223-3234','TN','Y');
INSERT INTO People.Vendor VALUES('21226','SuperLoo, Inc.','Flushing','904','215-8995','FL','N');
INSERT INTO People.Vendor VALUES('21231','D&E Supply','Singh','615','228-3245','TN','Y');
INSERT INTO People.Vendor VALUES('21344','Gomez Bros.','Ortega','615','889-2546','KY','N');
INSERT INTO People.Vendor VALUES('22567','Dome Supply','Smith','901','678-1419','GA','N');
INSERT INTO People.Vendor VALUES('23119','Randsets Ltd.','Anderson','901','678-3998','GA','Y');
INSERT INTO People.Vendor VALUES('24004','Brackman Bros.','Browning','615','228-1410','TN','N');
INSERT INTO People.Vendor VALUES('24288','ORDVA, Inc.','Hakford','615','898-1234','TN','Y');
INSERT INTO People.Vendor VALUES('25443','B&K, Inc.','Smith','904','227-0093','FL','N');
INSERT INTO People.Vendor VALUES('25501','Damal Supplies','Smythe','615','890-3529','TN','N');
INSERT INTO People.Vendor VALUES('25595','Rubicon Systems','Orton','904','456-0092','FL','Y');
