USE Hotel

--Prints the average total price for a reservation
SELECT AVG(totalPrice) AS AverageReservationPrice
FROM RESERVATIONS

--Prints the average salary of female employees
SELECT AVG(salary) AS AverageFemaleSalary
FROM EMPLOYEES
WHERE gender = 'F'

--Prints the maximum salary of a maid
SELECT firstName, lastName, type, salary 
FROM EMPLOYEES
WHERE salary = (SELECT MAX(salary) FROM EMPLOYEES WHERE type = 'maid') 

--Prints the number of employees by type
SELECT  type, COUNT(employeeID) as EmployeesCount
FROM EMPLOYEES
GROUP BY type

--Prints the nuber of reservations by package type 
SELECT  packet, COUNT(*) as ReservationsCount
FROM RESERVATIONS
GROUP BY packet

--Prints the hotel income from all inclusive reservations
SELECT SUM(totalPrice) AS TotalIncome
FROM RESERVATIONS
WHERE packet = 'AI'

--Prints the income of all the apartments for a week considering they are all booked
SELECT SUM(priceForNight) AS TotalIncome
FROM ROOMS
WHERE roomType = 'Apartment'

--Prints the cheapest available regular rooms ordered by number
SELECT *
FROM ROOMS
WHERE priceForNight = (SELECT MIN(priceForNight) FROM ROOMS WHERE roomType = 'Room')
AND status = 'F'
AND roomType = 'Room'
ORDER BY roomNumber

--Prints the number of double rooms grouped by type
SELECT roomType, COUNT(roomNumber) AS TotalRooms
FROM ROOMS
WHERE roomCapacity = 2
GROUP BY roomType

--Prints the lowest paid employees working on 8 hour shifts
SELECT *
FROM EMPLOYEES 
WHERE salary = (SELECT MIN(salary) FROM EMPLOYEES WHERE workingHours = 8)
AND workingHours = 8











