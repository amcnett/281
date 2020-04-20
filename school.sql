-- Need to create and use a database for this
-- Need to create a HR schema
Go;
CREATE SCHEMA HR; -- run the schema lines one at a time if they give you trouble
Go;
-- Need to create a Registrar schema
CREATE SCHEMA Registrar;
Go;

CREATE TABLE Registrar.STUDENT(
StudentID int IDENTITY(1,1) NOT NULL,
Last varchar(50) NOT NULL,
First varchar(50) NOT NULL,
Initial varchar(1),
DateOfBirth datetime,
GPA decimal(3,2)
);

ALTER TABLE Registrar.Student
ADD CONSTRAINT PkStudent_StudentID
PRIMARY KEY(StudentID);

CREATE TABLE HR.Employee (
EmployeeID int IDENTITY(1,1),
Last varchar(15) NOT NULL,
First varchar(12) NOT NULL,
Initial varchar(1),
JobCode varchar(5),
DateOfBirth datetime,
HireDate datetime,
CONSTRAINT PkEmployee_EmployeeID
	PRIMARY KEY(EmployeeId)
);

CREATE TABLE HR.Department (
DepartmentId varchar(10),
Name varchar(30) NOT NULL,
SchoolCode varchar(8) NOT NULL,
EmployeeID int,
Address varchar(20),
Extension varchar(4)
CONSTRAINT PkDepartment_DepartmentId
	PRIMARY KEY(DepartmentId)
);

ALTER TABLE HR.Department
ADD CONSTRAINT FkDepartment_EmployeeId
FOREIGN KEY (EmployeeId) REFERENCES HR.Employee(EmployeeId);

ALTER TABLE Registrar.Student
ADD CONSTRAINT CkStudent_GPA
CHECK (GPA BETWEEN 0 AND 4);

--INSERT INTO Registrar.STUDENT VALUES('Miller','Bob','U','1998-2-23', 5.2); -- GPA is not valid (example)

ALTER TABLE Registrar.Student
ADD EmployeeId int CONSTRAINT FkStudent_EmployeeId
FOREIGN KEY(EmployeeId) REFERENCES HR.Employee(EmployeeId); 

ALTER TABLE HR.Employee
ADD CONSTRAINT DfEmployee_JobCode
DEFAULT('PROF') FOR JobCode;

ALTER TABLE HR.Employee
ADD YearsEmployed as DATEDIFF(year, HireDate, SYSDATETIME());

INSERT INTO HR.Employee VALUES('Worley','James','F','CUST','1978-2-23','1999-6-12');
INSERT INTO HR.Employee VALUES('Ramso','Henry','B','CUST','1994-11-15','2015-11-2');
INSERT INTO HR.Employee VALUES('Edwards','Rosemary','D','TECH','1990-7-23','2015-7-3');
INSERT INTO HR.Employee VALUES('Donelly','Ronald','O','PROF','1987-7-1','2015-10-2');
INSERT INTO HR.Employee VALUES('Yukon','Preston','D','PROF','1992-5-1','2010-2-23');
INSERT INTO HR.Employee VALUES('Heffington','Arnelle','B','PROF','1991-7-1','2014-11-2');
INSERT INTO HR.Employee VALUES('Washington','Ross','E','PROF','1976-8-1','1992-3-4');
INSERT INTO HR.Employee VALUES('Robertson','Elaine','W','TECH','1983-10-18','2005-6-20');
INSERT INTO HR.Employee VALUES('Thieu','Van','S','PROF','1989-8-1','2011-8-12');
INSERT INTO HR.Employee VALUES('Graztevski','Gerald','B','PROF','1978-8-1','1999-3-18');
INSERT INTO HR.Employee VALUES('Wilson','Todd','H','CUST','1990-11-6','2014-10-19');
INSERT INTO HR.Employee VALUES('Jones','Suzanne','B','TECH','1994-1-5','2015-12-30');
INSERT INTO HR.Employee VALUES('Smith','Elsa','K','CLRK','1982-12-16','2005-9-13');
INSERT INTO HR.Employee VALUES('Ardano','James','G','CLRK','1994-10-1','2014-3-12');

INSERT INTO HR.Department VALUES('ACCT','Accounting','BUS','2','KLR 211, Box 52','3119');
INSERT INTO HR.Department VALUES('ART','Fine Arts','A&SCI','4','BBG 185, Box 128','2278');
INSERT INTO HR.Department VALUES('BIOL','Biology','A&SCI','6','AAK 230, Box 415','4117');
INSERT INTO HR.Department VALUES('CIS','Computer Info. Systems','BUS','3','KLR 333, Box 56','3245');
INSERT INTO HR.Department VALUES('ECON/FIN','Economics/Finance','BUS','7','KLR 284, Box 63','3126');
INSERT INTO HR.Department VALUES('ENG','English','A&SCI','5','DRE 102, Box 223','1004');
INSERT INTO HR.Department VALUES('HIST','History','A&SCI','9','DRE 156, Box 284','1867');

INSERT INTO Registrar.Student VALUES('Blaine','Rick','U','1900-2-23', 3.2, 4);
INSERT INTO Registrar.Student VALUES('Matrix','John','J','1950-2-23', 2.9, 4);
INSERT INTO Registrar.Student VALUES('Kint','Verbal','R','1962-2-23', 4.0, 4);
INSERT INTO Registrar.Student VALUES('Vega','Vincent','X','1958-2-23', 3.12, 4);
INSERT INTO Registrar.Student VALUES('Baxter','C.C.','T','1920-2-23', 2.28, 5);
INSERT INTO Registrar.Student VALUES('Jones','Indiana','M','1899-7-01', 3.89, 5);
INSERT INTO Registrar.Student VALUES('Desmond','Norma','M','1943-2-23', 3.3, 5);
INSERT INTO Registrar.Student VALUES('Skywalker','Luke','L','1977-5-25', 4.0, 6);
INSERT INTO Registrar.Student VALUES('Organa','Leia','J','1977-5-25', 4.0, 6);
INSERT INTO Registrar.Student VALUES('Connor','Sarah','B','1986-10-26', 2.4, 7);
INSERT INTO Registrar.Student VALUES('Ripley','Ellen','E','1986-7-18', 3.97, 7);
INSERT INTO Registrar.Student VALUES('Dubois','Blanche','R','1901-4-23', 2.0, 9);
