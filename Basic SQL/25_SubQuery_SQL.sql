use NORTHWND
-- Liệt kê toàn bộ sản phẩm
SELECT [ProductID], [ProductName], [UnitPrice]
FROM [dbo].[Products]

--Tính giá trung bình của tất cả sản phẩm 
SELECT AVG([UnitPrice])
FROM [dbo].[Products]

--Lấy ra các sản phẩm có giá lớn hơn giá trung bình tất cả sản phẩm
SELECT [ProductID], [ProductName], [UnitPrice]
FROM [dbo].[Products]
WHERE [UnitPrice] > 28.4962
--26 rows

SELECT [ProductID], [ProductName], [UnitPrice]
FROM [dbo].[Products]
WHERE [UnitPrice] > (
	SELECT AVG([UnitPrice])
	FROM [dbo].[Products] 
)
--26 rows

--Lọc ra những khách hàng có số đơn lớn hơn 10 
SELECT C.CustomerID, C.ContactName, COUNT(O.OrderID) AS [TotalOrders]
FROM [dbo].[Customers] C
LEFT JOIN [dbo].[Orders] O
ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.ContactName
HAVING  COUNT(O.OrderID) > 10

--SubQuery
SELECT [CustomerID]
FROM [dbo].[Orders]
GROUP BY [CustomerID]
HAVING COUNT([OrderID]) > 10

SELECT * 
FROM [dbo].[Customers]
WHERE [CustomerID] IN (
		SELECT [CustomerID]
		FROM [dbo].[Orders]
		GROUP BY [CustomerID]
		HAVING COUNT([OrderID]) > 10
)
--28 rows

--Tính tổng tiền cho từng đơn hàng
SELECT O.*,(
		SELECT SUM(OD.Quantity*OD.UnitPrice)
		FROM [dbo].[Order Details] OD
		WHERE OD.OrderID = O.OrderID
	) AS [TotalPrice]
FROM [dbo].[Orders] O

--Lấy ra tên sản phẩm và tổng số đơn hàng của sản phẩm
SELECT P.ProductName, (
		SELECT COUNT([OrderID])
		FROM [dbo].[Order Details] OD
		WHERE OD.ProductID = p.ProductID
	) AS [TotalOrders]
FROM [dbo].[Products] P
--78 rows

SELECT ProductName, TotalOrders
FROM (
		SELECT P.ProductName, (
			SELECT COUNT([OrderID])
			FROM [dbo].[Order Details] OD
			WHERE OD.ProductID = p.ProductID
			) AS [TotalOrders]
		FROM [dbo].[Products] P
	) AS Temp
--78 rows
--Bài tập
--In ra mã đơn hàng và số lượng sản phẩm của đơn hàng đó
SELECT O.OrderID, 
	(
		SELECT SUM(OD.Quantity)
		FROM [dbo].[Order Details] OD
		WHERE O.OrderID = OD.OrderID
	) AS [TotalProducts]
FROM [dbo].[Orders] O

--Bài tự làm
--In ra mã đơn hàng và số sản phẩm khác nhau của đơn hàng đó
SELECT O.OrderID, 
	(
		SELECT COUNT(OD.ProductID)
		FROM [dbo].[Order Details] OD
		WHERE O.OrderID = OD.OrderID
	) AS [Products]
FROM [dbo].[Orders] O
--830 rows

----
SELECT [OrderID], COUNT(*) AS [Products]
FROM [dbo].[Order Details]
GROUP BY [OrderID]
--830 rows