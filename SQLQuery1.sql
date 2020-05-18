use COMPANY
go

CREATE TABLE DEPARTMENTS (
	DeptID		Int			NOT NULL IDENTITY(600,1),
	DeptName	Char(25)	NOT NULL,
	ManagerID	Int			NOT NULL,
	StartDate	Date		NOT NULL,
	CONSTRAINT	DeptPK		PRIMARY KEY(DeptID),
	CONSTRAINT	DeptAK1		UNIQUE(DeptName)
	
	);
	
CREATE TABLE EMPLOYEES (
	EmployeeID		Int			NOT NULL		IDENTITY(1000,1),
	EmployeeName	Char(25)	NOT NULL,
	SSN				Int			NOT NULL,
	Address			Char(40)	NOT NULL,
	Salary			Int			NOT NULL,
	Sex				Char(10)	NOT NULL,
	DOB				DATE		NOT NULL,
	DeptID			Int			NOT NULL,
	ManagerID		Int			NOT NULL,

	CONSTRAINT		EmpFK		FOREIGN KEY(ManagerID) references EMPLOYEE(ManagerID),
	CONSTRAINT		EmpPK		PRIMARY KEY(EmployeeName)

	);

CREATE TABLE PROJECTS(
	ProjectID			Int			NOT NULL IDENTITY(3000,1),
	ProjectName			Char(25)	NOT NULL,
	ProjectLocation		Char(25)	NOT NULL,
	CONSTRAINT	ProjectPK		PRIMARY KEY(ProjectID)

	);

CREATE TABLE EMPLOYEESPROJECTS(
	ProjectID			Int			NOT	NULL,
	ProjectName			Char(25)	NOT NULL,
	EmployeeName		Char(25)	NOT NULL,
	HoursWorked			Int			NOT NULL DEFAULT '0',
	CONSTRAINT 			EmployeeFK1			FOREIGN KEY(EmployeeName)
						REFERENCES Employees(EmployeeName)
 							ON UPDATE NO ACTION
							ON DELETE NO ACTION
	
						
	);

CREATE TABLE DEPENDENTS(
	DependentFirstName	Char(50)	NOT NULL,
	Sex					Char(10)	NOT NULL,
	DOB					Char(10)	NOT NULL,
	EmployeeRelationship		Char(25)	NOT NULL

	);

CREATE TABLE EMPDEPENDENTS(
	EmployeeName		Char(25)	NOT NULL,
	NumberOfDependents	Int			NOT	NULL DEFAULT '0'

	);