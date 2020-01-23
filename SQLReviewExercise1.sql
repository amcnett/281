/* Database Systems, Coronel/Morris */
/* Type of SQL : SQL Server */
/* In-class exercise - SQL Basics Assignment */

CREATE DATABASE SqlBasics
USE SqlBasics;

/* -- */
Go
/* Create construction schema here first! */

Go
/* Please read assignment instructions */
/* Don't run the entire file yet... make sure you follow the assignment and change the tables as needed first */
CREATE TABLE Job (
JobCode varchar(3),
Description varchar(25),
HourlyCharge float(8),
LastUpdated datetime
);
INSERT INTO Construction.Job VALUES('500','Programmer',           '35.75','11/20/2015');
INSERT INTO Construction.Job VALUES('501','Systems Analyst',      '96.75','11/20/2015');
INSERT INTO Construction.Job VALUES('502','Database Designer',    '125',   '3/24/2016');
INSERT INTO Construction.Job VALUES('503','Electrical Engineer',  '84.5', '11/20/2018');
INSERT INTO Construction.Job VALUES('504','Mechanical Engineer',  '67.9', '11/20/2015');
INSERT INTO Construction.Job VALUES('505','Civil Engineer',       '55.78','11/20/2015');
INSERT INTO Construction.Job VALUES('506','Clerical Support',     '26.87','11/20/2016');
INSERT INTO Construction.Job VALUES('507','DSS Analyst',          '45.95','11/20/2015');
INSERT INTO Construction.Job VALUES('508','Applications Designer','48.1',  '3/24/2018');
INSERT INTO Construction.Job VALUES('509','Bio Technician',       '34.55','11/20/2015');
INSERT INTO Construction.Job VALUES('510','General Support',      '15.00','11/20/2019');

/* -- */

CREATE TABLE Construction.Employee (
EmployeeNum varchar(3) PRIMARY KEY,
LastName varchar(15),
FirstName varchar(15),
MI varchar(1),
HireDate datetime,
JobCode varchar(3),
EmployeeYears AS datediff(year, HireDate, getdate())
);
INSERT INTO Construction.Employee VALUES('101','News','John','G','11/8/2000','502');
INSERT INTO Construction.Employee VALUES('102','Senior','David','H','7/12/1989','501');
INSERT INTO Construction.Employee VALUES('103','Arbough','June','E','12/1/1996','503');
INSERT INTO Construction.Employee VALUES('104','Ramoras','Anne','K','11/15/1987','501');
INSERT INTO Construction.Employee VALUES('105','Johnson','Alice','K','2/1/1993','502');
INSERT INTO Construction.Employee VALUES('106','Smithfield','William','','6/22/2004','500');
INSERT INTO Construction.Employee VALUES('107','Alonzo','Maria','D','10/10/1993','500');
INSERT INTO Construction.Employee VALUES('108','Washington','Ralph','B','8/22/1991','501');
INSERT INTO Construction.Employee VALUES('109','Smith','Larry','W','7/18/1997','501');
INSERT INTO Construction.Employee VALUES('110','Olenko','Gerald','A','12/11/1995','505');
INSERT INTO Construction.Employee VALUES('111','Wabash','Geoff','B','4/4/1991','506');
INSERT INTO Construction.Employee VALUES('112','Smithson','Darlene','M','10/23/1994','507');
INSERT INTO Construction.Employee VALUES('113','Joenbrood','Delbert','K','11/15/1996','508');
INSERT INTO Construction.Employee VALUES('114','Jones','Annelise','','8/20/1993','508');
INSERT INTO Construction.Employee VALUES('115','Bawangi','Travis','B','1/25/1992','501');
INSERT INTO Construction.Employee VALUES('116','Pratt','Gerald','L','3/5/1997','510');
INSERT INTO Construction.Employee VALUES('117','Williamson','Angie','H','6/19/1996','509');
INSERT INTO Construction.Employee VALUES('118','Frommer','James','J','1/4/2005','510');
INSERT INTO Construction.Employee VALUES('119','Frommer','James','J','1/4/2005','510');

/* -- */

CREATE TABLE Construction.Project (
ProjectNum varchar(3) PRIMARY KEY,
Name varchar(25),
ValueTotal float(8),
Balance float(8),
EmployeeNum varchar(3) REFERENCES Construction.Employee(EmployeeNum)
);
INSERT INTO Construction.Project VALUES('15','Evergreen','1453500','1002350','103');
INSERT INTO Construction.Project VALUES('18','Amber Wave','3500500','2110346','108');
INSERT INTO Construction.Project VALUES('22','Rolling Tide','805000','500345.2','102');
INSERT INTO Construction.Project VALUES('25','Starflight','2650500','2309880','107');

CREATE TABLE Construction.Assignment (
AssignmentNum int PRIMARY KEY,
DateAssigned datetime,
ProjectNum varchar(3) REFERENCES Construction.Project(ProjectNum),
EmployeeNum varchar(3) REFERENCES Construction.Employee(EmployeeNum),
JobCode varchar(3) REFERENCES Construction.Job(JobCode),
HourlyChargeAssigned float(8),
AssignedHours float(8),
AssignedCharge AS HourlyChargeAssigned * AssignedHours
);
INSERT INTO Construction.Assignment VALUES('3/22/2016','18','103','503','84.5','3.5');
INSERT INTO Construction.Assignment VALUES('3/22/2016','22','117','509','34.55','4.2');
INSERT INTO Construction.Assignment VALUES('3/22/2016','18','117','509','34.55','2');
INSERT INTO Construction.Assignment VALUES('3/22/2016','18','103','503','84.5','5.9');
INSERT INTO Construction.Assignment VALUES('3/22/2016','25','108','501','96.75','2.2');
INSERT INTO Construction.Assignment VALUES('3/22/2016','22','104','501','96.75','4.2');
INSERT INTO Construction.Assignment VALUES('3/22/2016','25','113','508','50.75','3.8');
INSERT INTO Construction.Assignment VALUES('3/22/2016','18','103','503','84.5','0.9');
INSERT INTO Construction.Assignment VALUES('3/23/2016','15','115','501','96.75','5.6');
INSERT INTO Construction.Assignment VALUES('3/23/2016','15','117','509','34.55','2.4');
INSERT INTO Construction.Assignment VALUES('3/23/2016','25','105','502','105','4.3');
INSERT INTO Construction.Assignment VALUES('3/23/2016','18','108','501','96.75','3.4');
INSERT INTO Construction.Assignment VALUES('3/23/2016','25','115','501','96.75','2');
INSERT INTO Construction.Assignment VALUES('3/23/2016','22','104','501','96.75','2.8');
INSERT INTO Construction.Assignment VALUES('3/23/2016','15','103','503','84.5','6.1');
INSERT INTO Construction.Assignment VALUES('3/23/2016','22','105','502','105','4.7');
INSERT INTO Construction.Assignment VALUES('3/23/2016','18','117','509','34.55','3.8');
INSERT INTO Construction.Assignment VALUES('3/23/2016','25','117','509','34.55','2.2');
INSERT INTO Construction.Assignment VALUES('3/24/2016','25','104','501','110.5','4.9');
INSERT INTO Construction.Assignment VALUES('3/24/2016','15','101','502','125','3.1');
INSERT INTO Construction.Assignment VALUES('3/24/2016','22','108','501','110.5','2.7');
INSERT INTO Construction.Assignment VALUES('3/24/2016','22','115','501','110.5','4.9');
INSERT INTO Construction.Assignment VALUES('3/24/2016','22','105','502','125','3.5');
INSERT INTO Construction.Assignment VALUES('3/24/2016','15','103','503','84.5','3.3');
INSERT INTO Construction.Assignment VALUES('3/24/2016','18','117','509','34.55','4.2');
