USE NORTHWND

SELECT P.ProductID, P.ProductName --2
FROM [dbo].[Products] P --

SELECT P.ProductID, P.ProductName --3
FROM [dbo].[Products] P --1
WHERE P.CategoryID = 1 --2

SELECT P.CategoryID, COUNT(P.ProductID) AS [TotalProducts] --4
FROM [dbo].[Products] P --1
WHERE P.CategoryID IN (1, 2, 3) --2
GROUP BY P.CategoryID --3

SELECT P.CategoryID, COUNT(P.ProductID) AS [TotalProducts] --5
FROM [dbo].[Products] P --1
WHERE P.CategoryID IN (1, 2, 3) --2
GROUP BY P.CategoryID --3
HAVING [TotalProducts] >= 13 --4 [TotalProducts] chưa tồn tại

SELECT P.CategoryID, COUNT(P.ProductID) AS [TotalProducts] --5
FROM [dbo].[Products] P --1
WHERE P.CategoryID IN (1, 2, 3) --2
GROUP BY P.CategoryID --3
HAVING COUNT(P.ProductID) >= 13 --4

SELECT P.CategoryID, COUNT(P.ProductID) AS [TotalProducts] --5
FROM [dbo].[Products] P --1
WHERE P.CategoryID IN (1, 2, 3, 4, 5, 6, 7) --2
GROUP BY P.CategoryID --3
HAVING COUNT(P.ProductID) >= 10 --4
ORDER BY [TotalProducts] ASC --6 [TotalProducts] đã tồn tại

--Bài tập
--Cho biết thứ tự thực thi của đoạn code sau
SELECT TOP 3 --11
p.ProductID, od.Discount, o.ShipCountry --9
FROM [dbo].[Products] P --1
INNER --4
JOIN [dbo].[Order Details] OD --2
ON P.ProductID = OD.ProductID --3
INNER --7
JOIN [dbo].[Orders] O --5
ON O.OrderID = OD.OrderID --6
WHERE OD.Discount =0.25 AND O.ShipCountry ='Germany' --8
ORDER BY p.ProductID DESC --10