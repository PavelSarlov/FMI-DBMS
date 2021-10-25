USE pc
GO

--5
SELECT DISTINCT maker
FROM product
WHERE maker IN (SELECT maker FROM product WHERE type LIKE 'Printer')
	AND maker IN (SELECT maker FROM product WHERE type LIKE 'Laptop');

SELECT DISTINCT maker
FROM product
WHERE type LIKE 'Printer'
INTERSECT
SELECT DISTINCT maker
FROM product
WHERE type LIKE 'Laptop';

--6
UPDATE pc
SET price = price - 5/100*price
FROM pc
	JOIN product pr ON pc.model=pr.model
WHERE pr.maker IN (SELECT maker
				FROM printer
					JOIN product on printer.model=product.model
				GROUP BY maker
				HAVING AVG(price)>800)

SELECT * FROM pc JOIN product ON pc.model=product.model;
SELECT * FROM printer JOIN product ON printer.model=product.model;

--7
SELECT hd, MIN(price) as min_price
FROM pc
WHERE hd>=10 AND hd<=30
GROUP BY hd;