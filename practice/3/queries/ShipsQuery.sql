--1
SELECT DISTINCT COUNTRY
FROM CLASSES
WHERE NUMGUNS>=ALL(SELECT NUMGUNS FROM CLASSES);

--2
SELECT DISTINCT CLASS
FROM SHIPS
WHERE NAME IN(SELECT SHIP FROM OUTCOMES WHERE RESULT='sunk');

--3
SELECT NAME, CLASS
FROM SHIPS
WHERE CLASS IN(SELECT CLASS FROM CLASSES WHERE BORE=16);

--4
SELECT BATTLE
FROM OUTCOMES
WHERE SHIP IN(SELECT NAME FROM SHIPS WHERE CLASS='Kongo');

--5
SELECT CLASS, NAME
FROM SHIPS
WHERE CLASS IN (SELECT CLASS FROM CLASSES C WHERE NUMGUNS>=ALL(SELECT NUMGUNS FROM CLASSES WHERE BORE=C.BORE))
ORDER BY CLASS;