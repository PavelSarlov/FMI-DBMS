USE FurnitureCompany
GO

--2
SELECT PR.Product_ID, PR.Product_Description, COUNT(*)
FROM PRODUCT PR
	JOIN ORDER_LINE OL ON PR.Product_ID=OL.Product_ID
GROUP BY PR.Product_ID, PR.Product_Description;

--3
SELECT P.Product_ID, P.Product_Description, ISNULL(SUM(Ordered_Quantity),0) as Total_Quantity_Ordered
FROM PRODUCT P
	LEFT JOIN ORDER_LINE O ON P.Product_ID = O.Product_ID
GROUP BY P.Product_ID, P.Product_Description;

--4
SELECT C.Customer_Name, SUM(PR.Standard_Price * OL.Ordered_Quantity) AS Order_Amount
FROM CUSTOMER C
	JOIN ORDER_T OT ON OT.Customer_ID=C.Customer_ID
	JOIN ORDER_LINE OL ON OT.Order_ID=OL.Order_ID
	JOIN PRODUCT PR ON PR.Product_ID=OL.Product_ID
GROUP BY C.Customer_Name;