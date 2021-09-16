/*
1. Result Set is the output data we want.
2. Union extracts the row we specifiy while Union all extracts all the rows.
3. Union, intersect, except.
4. Union bascially just put the two datasets one after another while join is to combine two different datasets.
5. Inner join will only output the rows that in both tables, outer join will select some rows that only in one table and do not have a match in the other table.
6. Left join is a kind of outer join.
7. Cross join returns the product of the sets of records from two tables.
8. Having allows us to specify a search condition on a query with group by.
9. Yes.
*/

----1
--SELECT COUNT(1)
--FROM Production.Product


----2
--SELECT COUNT(P.ProductSubcategoryID)
--FROM Production.Product AS P

----3
--SELECT P.ProductSubcategoryID, COUNT(P.ProductSubcategoryID) AS CountedProducts
--FROM Production.Product AS P
--WHERE P.ProductSubcategoryID IS NOT NULL
--GROUP BY P.ProductSubcategoryID

----4
--SELECT COUNT(1)
--FROM Production.Product AS P
--WHERE P.ProductSubcategoryID IS NULL

----5
--SELECT SUM(P.Quantity)
--FROM Production.ProductInventory AS P

----6
--SELECT SUM(P.Quantity)
--FROM Production.ProductInventory AS P
--WHERE P.LocationID = 40 AND P.Quantity < 100

----7
--SELECT P.Shelf, P.ProductID, SUM(P.Quantity) AS TheSum
--FROM Production.ProductInventory AS P
--WHERE P.LocationID = 40 AND P.Quantity < 100
--GROUP BY P.Shelf, P.ProductID

----8
--SELECT AVG(P.Quantity)
--FROM Production.ProductInventory AS P
--WHERE P.LocationID = 10

----9
--SELECT P.ProductID, P.Shelf, AVG(P.Quantity) AS TheAvg
--FROM Production.ProductInventory AS P
--GROUP BY P.Shelf, P.ProductID

----10
--SELECT P.ProductID, P.Shelf, AVG(P.Quantity) AS TheAvg
--FROM Production.ProductInventory AS P
--WHERE P.Shelf != 'N/A'
--GROUP BY P.ProductID, P.Shelf

----11
--SELECT P.Color, P.Class, COUNT(1) AS TheCount, AVG(P.ListPrice) AS AvgPrice
--FROM Production.Product AS P
--WHERE Color IS NOT NULL AND Class IS NOT NULL
--GROUP BY P.Color, P.Class

----12
--SELECT PC.Name AS Country, PS.Name AS Province
--FROM Person.CountryRegion AS PC
--JOIN Person.StateProvince AS PS
--ON PC.CountryRegionCode = PS.CountryRegionCode

----13
--SELECT PC.Name AS Country, PS.Name AS Province
--FROM Person.CountryRegion AS PC
--JOIN Person.StateProvince AS PS
--ON PC.CountryRegionCode = PS.CountryRegionCode
--WHERE PC.Name IN ('Germany', 'Canada')

----14
--SELECT DISTINCT P.ProductName
--FROM [Order Details] AS OD
--JOIN Products AS P
--ON P.ProductID = OD.ProductID

----15
--SELECT TOP 5 O.ShipPostalCode, COUNT(O.ShipPostalCode) AS Order_Number
--FROM Orders AS O
--GROUP BY O.ShipPostalCode
--ORDER BY Order_Number DESC

----16
--SELECT TOP 5 O.ShipPostalCode, COUNT(O.ShipPostalCode) AS Number_of_Orders
--FROM Orders AS O
--WHERE O.OrderDate > '2001'
--GROUP BY O.ShipPostalCode
--ORDER BY Number_of_Orders DESC

----17
--SELECT C.City, COUNT(1)
--FROM Customers AS C
--GROUP BY C.City

----18
--SELECT C.City, COUNT(1) AS Number_of_Customers
--FROM Customers AS C
--GROUP BY C.City
--HAVING COUNT(1) > 10

----19
--SELECT O.ShipName, O.OrderDate
--FROM Orders AS O
--WHERE O.OrderDate > '1998-01-01'

----20
--SELECT O.ShipName, MAX(O.OrderDate)
--FROM Orders AS O
--GROUP BY O.ShipName

----21
--SELECT O.ShipName, SUM(D.Quantity) AS Total_products
--FROM Orders AS O
--JOIN [Order Details] AS D
--ON O.OrderID = D.OrderID
--GROUP BY O.ShipName

----22
--SELECT O.CustomerID, SUM(D.Quantity) AS Total_products
--FROM Orders AS O
--JOIN [Order Details] AS D
--ON O.OrderID = D.OrderID
--GROUP BY O.CustomerID
--HAVING SUM(D.Quantity) > 100

----23
--SELECT CS.CompanyName AS [Supplier Company Name]
--INTO New_Table1
--FROM [Customer and Suppliers by City] AS CS
--WHERE CS.Relationship = 'Suppliers'

--SELECT CS.CompanyName AS [Shipping Company Name]
--INTO New_Table2
--FROM [Customer and Suppliers by City] AS CS
--WHERE CS.Relationship = 'Customers'

--SELECT NT1.[Supplier Company Name], NT2.[Shipping Company Name]
--FROM New_Table1 AS NT1
--CROSS JOIN New_Table2 AS NT2

----24
--SELECT DISTINCT O.OrderDate, OD.ProductName
--FROM [Order Details Extended] AS OD
--JOIN Orders AS O
--ON O.OrderID = OD.OrderID
--ORDER BY O.OrderDate

----25
--SELECT E1.LastName, E2.LastName
--FROM Employees AS E1
--JOIN Employees AS E2
--ON E1.Title = E2.TITLE
--WHERE E1.LastName != E2.LastName

----26
--SELECT E1.FirstName, E1.LastName, COUNT(1) AS Number_of_Reportings
--FROM Employees AS E1
--RIGHT JOIN Employees AS E2
--ON E1.EmployeeID = E2.ReportsTo
--GROUP BY E1.FirstName, E1.LastName
--HAVING COUNT(1) > 2

----27
--SELECT CS.City, CS.CompanyName AS Name, CS.ContactName AS [Contact Name], CS.Relationship AS Type
--FROM [Customer and Suppliers by City] AS CS
--ORDER BY CS.City

----28
--SELECT T1.F1, T2.F2
--FROM T1
--JOIN T2
--ON T1.F1 = T2.F2

/*
-F1---F2-
-2----2-
-3----3-
*/

----29
--SELECT T1.F1, T2.F2
--FROM T1
--LEFT JOIN T2
--ON T1.F1 = T2.F2

/*
-F1---F2-
-1---null-
-2----2-
-3----3-
*/
