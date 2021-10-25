--1
	--а)
	CREATE TABLE Product (
		model CHAR(4),
		maker CHAR(1),
		type VARCHAR(7)
	);

	CREATE TABLE Printer (
		code INT,
		model CHAR(4),
		price DECIMAL(6,2)
	);

	--б)
	INSERT INTO Product VALUES('1276','A','Printer');
	INSERT INTO Product VALUES('1433','B','Printer');
	INSERT INTO Product VALUES('1434','C','Printer');
	INSERT INTO Product VALUES('1401','A','Printer');
	INSERT INTO Product VALUES('1408','B','Printer');
	INSERT INTO Product VALUES('1288','C','Printer');

	INSERT INTO Printer VALUES(1,'1276',400);
	INSERT INTO Printer VALUES(2,'1433',270);
	INSERT INTO Printer VALUES(3,'1434',290);
	INSERT INTO Printer VALUES(4,'1401',150);
	INSERT INTO Printer VALUES(5,'1408',270);
	INSERT INTO Printer VALUES(6,'1288',400);

	--в)
	ALTER TABLE Printer ADD type VARCHAR(6)
	CHECK (type LIKE 'laser' OR type LIKE 'matrix' OR type LIKE 'jet');

	ALTER TABLE Printer ADD color CHAR(1) DEFAULT 'n';

	--г)
	ALTER TABLE Printer DROP COLUMN price;

	--д)
	DROP TABLE Product,Printer;