USE HOTEL;

--Insert some example values in the EMPLOYEES table

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Georgi','Kaloqnov','Petrov','8010288531','piccolo','1089800023',8,900,'M',125)

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Nikola','Ivanov','Ivanov','9005147956','piccolo','1190454666',8,900,'M',125)

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Kalina','Petrova','Dinkova','6502185863','maid','2484636141',12,1200,'F',124)

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Borislava','Kalinova','Petrova','7703269817','maid','1430622368',12,1100,'F',124)

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Hristina','Todorova','Vladeva','9609081269','maid','7069411501',12,950,'F',123)

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Hristo','Dimitrov','Kolev','6402261370','doorsman','4543769705',10,800,'M',122)

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Teodor','Kirilov','Kapitanov','8001208536','doorsman','7802942555',10,850,'M',122)

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Mariq','Yordanova','Kostova','8905175210','receptionist','8738472850',12,1500,'F',123)

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Anna','Borisova','Karaivanova','7807256398','receptionist','8733359810',12,1500,'F',121)

INSERT INTO EMPLOYEES (firstName,secondName,lastName,personalID,type,insuranceNumber,workingHours,salary,gender, roomNumber)
VALUES('Kiril','Vladislavov','Boikov','8512045219','manager','6125811490',8,2350,'M',120)

SELECT * FROM EMPLOYEES