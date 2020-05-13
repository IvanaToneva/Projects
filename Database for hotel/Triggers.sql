

--Trigger for time of employment
--1.
ALTER TABLE EMPLOYEES ADD employed_since DATETIME
--2. 
CREATE TRIGGER employment_trigger ON employees
AFTER INSERT 
AS
 UPDATE employees
 SET
 employed_since = GETDATE()
 FROM inserted
 WHERE employees.employeeID= inserted.employeeID;
  

  --Triger to block the delete operation
 CREATE TRIGGER notdeleted_clients_trigger ON clients
INSTEAD OF DELETE
AS
RAISERROR ('Sorry, you can not delete clients!',16,10);



 -- Trigger INSTEAD OF DELETE on rooms
 --1.
 ALTER TABLE rooms ADD usable CHAR(1) NOT NULL  DEFAULT 'T' ;
 --2.
 ALTER TABLE rooms ADD CONSTRAINT usable_as_bool CHECK (usable IN ('T','F'));
 --3.
 CREATE TRIGGER notdeleted_rooms_trigger ON rooms
 INSTEAD OF DELETE
 AS
 UPDATE rooms
 SET
 usable = 'F'
 FROM deleted
 WHERE rooms.roomNumber= deleted.roomNumber;



 -- History of packages price
 --1.
 CREATE TABLE package_audit(
 package CHAR(2),
	oldPrice INT,
	newPrice INT,
	updated_at DATETIME
	)
 --2.
 CREATE TRIGGER price_audit_trigger ON packages
 AFTER UPDATE
 AS
 INSERT INTO package_audit (package, oldPrice, newPrice, updated_at) 
 SELECT inserted.package, deleted.additionalPrice, inserted.additionalPrice , GETDATE()
 FROM inserted, deleted;
 --3.
 CREATE TRIGGER price_delete_trigger ON packages
 AFTER DELETE
 AS
 INSERT INTO package_audit (package, oldPrice, updated_at) 
 SELECT deleted.package, deleted.additionalPrice, GETDATE()
 FROM  deleted;

--Trigger for employees who are laid off
 --1.
 CREATE TABLE former_employees (
 firstName VARCHAR(20),
 secondName VARCHAR(20),
 lastName VARCHAR(20),
 personalID CHAR(10),
 type VARCHAR(15),
 insuranceNumber VARCHAR(20),
 workingHours INT,
 salary DECIMAL(10,2),
 employed_sinse DATETIME,
 unemployed DATETIME
 )
 --2.
 CREATE TRIGGER exemployees_trigger ON employees
 AFTER DELETE
 AS
 INSERT INTO former_employees (firstName, secondName, lastName, personalID, type, 
 insuranceNumber,workingHours, salary, employed_sinse, unemployed)
 SELECT
 d.firstName, d.secondName, d.lastName, d.personalID, d.type, d.insuranceNumber, d.workingHours,
 d.salary, d.employed_since, GETDATE()
 FROM deleted d;