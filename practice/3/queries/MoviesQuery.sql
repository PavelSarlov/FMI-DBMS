--1
SELECT NAME
FROM MOVIESTAR
WHERE NAME=ANY(SELECT NAME FROM MOVIEEXEC WHERE NETWORTH>10000000) AND GENDER='F';

--2
SELECT NAME
FROM MOVIESTAR
WHERE NAME NOT IN (SELECT NAME FROM MOVIEEXEC);

--3
SELECT M.TITLE
FROM MOVIE M, (SELECT LENGTH FROM MOVIE WHERE TITLE='Star Wars') L
WHERE M.LENGTH>L.LENGTH;

--4
SELECT M.TITLE, E.NAME
FROM MOVIE M, MOVIEEXEC E
WHERE M.PRODUCERC#=E.CERT# AND E.NETWORTH>ANY(SELECT NETWORTH FROM MOVIEEXEC WHERE NAME='Merv Griffin');