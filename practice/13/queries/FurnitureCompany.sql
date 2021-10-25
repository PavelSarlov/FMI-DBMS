USE master;
GO

IF EXISTS (SELECT NAME FROM sys.databases WHERE NAME='FurnitureCompany')
	DROP DATABASE FurnitureCompany;
GO

CREATE DATABASE FurnitureCompany;
GO

USE master;
GO
ALTER DATABASE FurnitureCompany SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
GO
ALTER DATABASE FurnitureCompany COLLATE Cyrillic_General_CI_AS
GO
ALTER DATABASE FurnitureCompany SET MULTI_USER
GO

USE FurnitureCompany;
GO

-- TABLES

CREATE TABLE CUSTOMER (
	Customer_ID INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_CUSTOMER PRIMARY KEY,
	Customer_Name NVARCHAR(50),
	Customer_Address NVARCHAR(100),
	Customer_City NVARCHAR(20),
	City_Code NCHAR(4)
);

CREATE TABLE PRODUCT (
	Product_ID INT NOT NULL CONSTRAINT PK_PRODUCT PRIMARY KEY,
	Product_Description NVARCHAR(100),
	Product_Finish NVARCHAR(14),
	Standard_Price DECIMAL(16,2),
	Product_Line_ID INT,
	CHECK (Product_Finish in ('череша', 'естествен ясен', 'бял ясен', 'червен дъб', 'естествен дъб', 'орех'))
);

CREATE TABLE ORDER_T (
	Order_ID INT NOT NULL CONSTRAINT PK_ORDERT PRIMARY KEY,
	Order_DATE DATE NOT NULL DEFAULT GETDATE(),
	Customer_ID INT NOT NULL CONSTRAINT FK_ORDERT_CUSTOMER REFERENCES CUSTOMER(Customer_ID)
);

CREATE TABLE ORDER_LINE (
	Order_ID INT NOT NULL CONSTRAINT FK_ORDERLINE_ORDERT REFERENCES ORDER_T(Order_ID),
	Product_ID INT NOT NULL CONSTRAINT FK_ORDERLINE_PRODUCT REFERENCES PRODUCT(Product_ID),
	Ordered_Quantity INT
);
GO

-- DATA

insert into CUSTOMER values
('Иван Петров', 'ул. Лавеле 8', 'София', '1000'),
('Камелия Янева', 'ул. Иван Шишман 3', 'Бургас', '8000'),
('Васил Димитров', 'ул. Абаджийска 87', 'Пловдив', '4000'),
('Ани Милева', 'бул. Владислав Варненчик 56', 'Варна','9000');

insert into PRODUCT values
(1000, 'офис бюро', 'череша', 195, 10),
(1001, 'директорско бюро', 'червен дъб', 250, 10),
(2000, 'офис стол', 'череша', 75, 20),
(2001, 'директорски стол', 'естествен дъб', 129, 20),
(3000, 'етажерка за книги', 'естествен ясен', 85, 30),
(4000, 'настолна лампа', 'естествен ясен', 35, 40);

insert into ORDER_T values
(100, '2013-01-05', 1),
(101, '2013-12-07', 2),
(102, '2014-10-03', 3),
(103, '2014-10-08', 2),
(104, '2015-10-05', 1),
(105, '2015-10-05', 4),
(106, '2015-10-06', 2),
(107, '2016-01-06', 1);

insert into ORDER_LINE values
(100, 4000, 1),
(101, 1000, 2),
(101, 2000, 2),
(102, 3000, 1),
(102, 2000, 1),
(106, 4000, 1),
(103, 4000, 1),
(104, 4000, 1),
(105, 4000, 1),
(107, 4000, 1);
GO

SELECT * FROM CUSTOMER;
SELECT * FROM PRODUCT;
SELECT * FROM ORDER_T;
SELECT * FROM ORDER_LINE;