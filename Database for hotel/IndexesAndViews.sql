
--INDEXES---------------------------------------------------

 CREATE INDEX idx_room
 ON rooms (roomNumber, priceForNight);
 ------------------------------------------------------------
 CREATE UNIQUE INDEX idx_exemployees
 ON former_employees (personalID);
 ------------------------------------------------------------
 CREATE UNIQUE INDEX idx_employees
 ON employees (personalID);
 ------------------------------------------------------------
 CREATE UNIQUE INDEX idx_clients
 ON clients (personalID);
 ------------------------------------------------------------
 CREATE CLUSTERED INDEX idx_package_changes
 ON package_audit (package);

 --VIEWS------------------------------------------------------
--1.
 CREATE VIEW reservations_with_breakfast
 AS
 SELECT reservationNumber, registerDate, checkOutDate
 FROM reservations 
 WHERE packet IN ('BB', 'HB', 'FB', 'AI');
--2.
 SELECT reservationNumber, DATEDIFF(day, registerDate, checkOutDate)   AS days
 FROM reservations_with_breakfast;
 --WHERE reservationNumber = 10

------------------------------------------------------------

--1.
CREATE VIEW number_usable_rooms_view
AS
SELECT roomType, COUNT(roomType) AS TotalRooms, usable
FROM ROOMS 
GROUP BY roomType, usable;

 --2.
 SELECT *
 FROM number_usable_rooms_view
 WHERE roomType LIKE 'Room'

------------------------------------------------------------

--1.
CREATE VIEW employee_position_view
AS
SELECT type, COUNT(type) AS number,salary
FROM employees 
GROUP BY type,salary;
--2.
 SELECT *
 FROM employee_position_view
 WHERE type LIKE 'maid';

------------------------------------------------------------

 --1.
CREATE VIEW man_employee
AS
SELECT *
FROM EMPLOYEES
WHERE gender LIKE 'M'
WITH CHECK OPTION;

--2.
 SELECT *
 FROM man_employee
--3.1.
 INSERT INTO man_employee (firstName, secondName, lastName, personalID, 
                           type,insuranceNumber, workingHours,gender, salary) 
                    VALUES ('Dimityr', 'Ivanov', 'Boykov', '8110304594', 
					        'piccolo','1488369752', 8,'M', 950)
 --3.2.Error
 INSERT INTO man_employee (firstName, secondName, lastName, personalID, 
                           type,insuranceNumber, workingHours,gender, salary) 
                    VALUES ('Mariq', 'Ivanov', 'Boykova', '9310304594', 'maid',
					        '1487369752', 8,'F', 950)
