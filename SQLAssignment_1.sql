--1
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P

--2
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.ListPrice = 0

--3
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.Color is null

--4
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.Color is not null

--5
SELECT P.ProductID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.Color is not null and P.ListPrice > 0

--6
SELECT CONCAT(P.Name, ' ', P.Color) AS New_Result
FROM Production.Product AS P
WHERE P.Color is not null

--7
SELECT CONCAT('NAME:', P.Name, ' -- ', 'COLOR:', P.Color) AS [Name And Color]
FROM Production.Product AS P
WHERE P.Color is not null

--8
SELECT P.ProductID, P.Name
FROM Production.Product AS P
WHERE P.ProductID between 400 and 500

--9
SELECT P.ProductID, P.Name, P.Color
FROM Production.Product AS P
WHERE P.Color in ('Black', 'Blue')

--10
SELECT P.Name
FROM Production.Product AS P
WHERE P.Name like 'S%'

--11
SELECT P.Name, P.ListPrice
FROM Production.Product AS P
WHERE P.Name like 'S%'
ORDER BY P.Name

--12
SELECT P.Name, P.ListPrice
FROM Production.Product AS P
WHERE P.Name like '[A,S]%' 
ORDER BY P.Name

--13
SELECT P.Name, P.ListPrice
FROM Production.Product AS P
WHERE P.Name like 'SPO%' and P.Name not like '___K%'
ORDER BY P.Name

--14
SELECT DISTINCT P.Color
FROM Production.Product AS P
WHERE P.Color is not null
ORDER BY P.Color DESC

--15
SELECT DISTINCT CONCAT(P.ProductSubcategoryID, ' ', P.Color) AS New_Result
FROM Production.Product AS P
WHERE P.ProductSubcategoryID is not null and P.Color is not null
ORDER BY New_Result

--16
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE ((Color NOT IN ('Red','Black') 
      OR ListPrice BETWEEN 1000 AND 2000)
      AND ProductSubCategoryID != 1)
	  OR ProductSubcategoryID = 1
ORDER BY ProductID

--17
SELECT P.ProductSubcategoryID, P.Name, P.Color, P.ListPrice
FROM Production.Product AS P
WHERE P.ProductSubcategoryID is not null 
AND P.Color is not null 
AND ((((P.Name LIKE 'HL%' AND P.ProductSubcategoryID = 14 AND (P.Color = 'Red' OR P.Color = 'Black' AND P.Name LIKE '%58'))
OR (P.Name LIKE 'HL%' AND P.ProductSubcategoryID = 12))
OR (P.ProductSubcategoryID BETWEEN 2 AND 11))
OR (P.Name LIKE 'Mountain-500%' AND P.Color = 'Black' AND P.ProductSubcategoryID = 1))
ORDER BY P.ProductSubcategoryID DESC


