--1
SELECT *
FROM SHIPS L 
	JOIN CLASSES R ON L.CLASS=R.CLASS;

--2
SELECT *
FROM SHIPS L
	FULL JOIN CLASSES R ON L.CLASS=R.CLASS
WHERE L.CLASS IS NOT NULL OR R.CLASS IN (SELECT NAME FROM SHIPS);

--3 
SELECT COUNTRY, NAME
FROM CLASSES C 
	JOIN SHIPS S ON C.CLASS=S.CLASS
	LEFT JOIN OUTCOMES O ON S.NAME=O.SHIP
WHERE O.SHIP IS NULL
ORDER BY COUNTRY;


--4
SELECT NAME AS 'Ship Name'
FROM SHIPS L
	JOIN CLASSES R ON L.CLASS=R.CLASS
WHERE NUMGUNS>=7 AND LAUNCHED=1916;

--5
SELECT SHIP, BATTLE, DATE
FROM OUTCOMES O
	JOIN BATTLES B ON BATTLE=NAME AND RESULT='sunk'
ORDER BY BATTLE;

--6
SELECT NAME, DISPLACEMENT, LAUNCHED
FROM SHIPS L
	JOIN CLASSES R ON L.CLASS=R.CLASS
WHERE L.NAME=R.CLASS;

--7
SELECT C.*
FROM CLASSES C
	LEFT JOIN SHIPS S ON C.CLASS=S.CLASS
WHERE S.CLASS IS NULL;

--8
SELECT NAME, DISPLACEMENT, NUMGUNS, RESULT
FROM CLASSES C
	JOIN SHIPS S ON C.CLASS=S.CLASS
	JOIN OUTCOMES O ON S.NAME=O.SHIP
WHERE BATTLE='North Atlantic';