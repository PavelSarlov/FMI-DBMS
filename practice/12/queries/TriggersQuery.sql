--1
ALTER TABLE FLIGHTS
ADD num_pass INT NOT NULL DEFAULT 0;

--2
ALTER TABLE AGENCIES
ADD num_book INT NOT NULL DEFAULT 0;
GO

--3
IF EXISTS (SELECT NAME FROM SYS.triggers WHERE NAME='TR_ADD_BOOKING')
	DROP TRIGGER TR_ADD_BOOKING;
GO
CREATE TRIGGER TR_ADD_BOOKING ON BOOKINGS
AFTER INSERT
AS
	UPDATE FLIGHTS
	SET num_pass=num_pass+(SELECT COUNT(*)
						FROM inserted
						WHERE FNUMBER=FLIGHT_NUMBER AND STATUS=1);

	UPDATE AGENCIES
	SET num_book=num_book+(SELECT COUNT(*)
						FROM inserted
						WHERE NAME=AGENCY);
GO

UPDATE FLIGHTS
SET num_pass=0
FROM FLIGHTS;
UPDATE AGENCIES
SET num_book=0
FROM AGENCIES;

DELETE FROM BOOKINGS;

INSERT INTO BOOKINGS
VALUES	('YN298P', 'Travel One', 'FB', 'FB1363', 1, '2021-04-27', '2021-12-25', 300, 0),
		('YA298P', 'Travel Two', 'TK', 'TK1038', 2, '2021-04-27', '2021-12-25', 300, 1),
		('YB298P', 'Travel Tour', 'TK', 'TK1037', 3, '2021-04-27', '2021-05-25', 400, 0),
		('YC298P', 'Travel One', 'TK', 'TK1028', 4, '2021-04-27', '2021-11-25', 350, 0),
		('YD298P', 'Travel Tour', 'TK', 'TK1028', 1, '2021-04-27', '2021-12-20', 250, 1),
		('YE298P', 'Aerofly', 'TK', 'TK1027', 2, '2021-04-27', '2021-12-21', 150, 0),
		('YJ298P', 'Aerofly', 'SU', 'SU2061', 3, '2021-04-27', '2021-12-05', 500, 1),
		('YS298P', 'Aerofly', 'SU', 'SU2061', 4, '2021-04-27', '2021-11-15', 400, 0),
		('YK298P', 'Aerofly', 'SU', 'SU2060', 1, '2021-04-26', '2021-08-08', 350, 0),
		('YM298P', 'Aerotravel', 'OA', 'OA308', 2, '2021-04-26', '2021-07-10', 350, 1),
		('YN198P', 'Aerotravel', 'OA', 'OA307', 3, '2021-04-26', '2021-11-25', 450, 0),
		('YN498P', 'Aerofly', 'LH', 'LH1703', 1, '2021-04-26', '2021-05-25', 300, 1),
		('YN598P', 'Aerotravel', 'FB', 'FB1363', 5, '2021-04-26', '2021-06-25', 300, 0),
		('YN698P', 'Fly Tour', 'FB', 'FB852', 6, '2021-04-26', '2021-07-25', 330, 1),
		('YL298P', 'Fly Tour', 'FB', 'FB851', 7, '2021-04-26', '2021-05-25', 360, 0),
		('YZ298P', 'Fly Tour', 'FB', 'FB458', 1, '2021-04-26', '2021-06-25', 380, 1),
		('YN268P', 'Fly Tour', 'FB', 'FB457', 2, '2021-04-26', '2021-12-21', 390, 0);

SELECT * FROM FLIGHTS;
SELECT * FROM AGENCIES;
SELECT * FROM BOOKINGS;
GO

--4
IF EXISTS (SELECT NAME FROM SYS.triggers WHERE NAME='TR_DEL_BOOKINGS')
	DROP TRIGGER TR_DEL_BOOKINGS
GO
CREATE TRIGGER TR_DEL_BOOKINGS ON BOOKINGS
AFTER DELETE
AS
	UPDATE FLIGHTS
	SET num_pass=num_pass-(SELECT COUNT(*)
						FROM deleted
						WHERE FNUMBER=FLIGHT_NUMBER AND STATUS=1);

	UPDATE AGENCIES
	SET num_book=num_book-(SELECT COUNT(*)
						FROM deleted
						WHERE AGENCY=NAME);
GO

DELETE FROM BOOKINGS;

--5
IF EXISTS (SELECT NAME FROM SYS.triggers WHERE NAME='TR_UPD_BOOKINGS')
	DROP TRIGGER TR_UPD_BOOKINGS
GO
CREATE TRIGGER TR_UPD_BOOKINGS ON BOOKINGS
AFTER UPDATE
AS
	UPDATE FLIGHTS
	SET num_pass=num_pass+(SELECT COUNT(*)
						FROM inserted
						WHERE FNUMBER=FLIGHT_NUMBER AND STATUS=1
							AND CODE IN (SELECT CODE FROM deleted WHERE STATUS<>1));
	UPDATE FLIGHTS
	SET	num_pass=num_pass-(SELECT COUNT(*)
						FROM inserted
						WHERE FNUMBER=FLIGHT_NUMBER AND STATUS=0
							AND CODE IN (SELECT CODE FROM deleted WHERE STATUS<>0));
GO

UPDATE BOOKINGS
SET STATUS=0;