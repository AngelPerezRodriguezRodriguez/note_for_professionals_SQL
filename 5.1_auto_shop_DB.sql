/*

1. Each Department may have 0 or more Employees
2. Each Employee may have 0 or 1 Manager (Employee)
3. Each Customer may have 0 or more Cars

*/

CREATE TABLE Department (

	Id INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(25) NOT NULL,
	
	PRIMARY KEY(Id)
);

CREATE TABLE Employee (

	Id INT NOT NULL AUTO_INCREMENT,
	FName VARCHAR(35) NOT NULL,
	LName VARCHAR(35) NOT NULL,
	PhoneNumber VARCHAR(11),
	ManagerId INT NULL,
	DepartmentId INT NOT NULL,
	Salary INT NOT NULL,
	HireDate DATETIME NOT NULL,
	
	PRIMARY KEY(Id),
	FOREIGN KEY (ManagerId) REFERENCES Employees(Id),
	FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

/*
1. Each Department may have 0 or more Employees
(1 - N)

The core concept of "0 or more Employees" lies in the absence of data itself. 
If a department doesn't have any employees, 
there simply wouldn't be any records in the Employee table referencing them.


2. Each Employee may have 0 or 1 Manager (Employee)
(1 - N) reflective relationship

The ManagerId foreign key in the Employees table can be NULL 
to accommodate the possibility of an employee having no manager.

There must be a Trigger to prevent self-management.
*/

CREATE TABLE Customer (

	Id INT NOT NULL AUTO_INCREMENT,
	FName VARCHAR(35) NOT NULL,
	LName VARCHAR(35) NOT NULL,
	Email varchar(100) NOT NULL,
	PhoneNumber VARCHAR(11),
	PreferredContact VARCHAR(5) NOT NULL,
	
	PRIMARY KEY(Id)
);

CREATE TABLE Car (

	Id INT NOT NULL AUTO_INCREMENT,
	CustomerId INT NOT NULL,
	Model varchar(50) NOT NULL,
	Status varchar(25) NOT NULL,
	TotalCost INT NOT NULL,
	
	PRIMARY KEY(Id),
	FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
	FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
);

/*
3. Each Customer may have 0 or more Cars
(1 - N)

The core concept of "0 or more Cars" lies in the absence of data itself. 
If a Customer doesn't have any Car, 
there simply wouldn't be any records in Car table referencing them.
*/