use NORTHWND

--Liệt kê các đơn có ngày đặt hàng gần đây nhất
SELECT MAX([OrderDate])
FROM [dbo].[Orders]

SELECT * 
FROM [dbo].[Orders]
WHERE [OrderDate] = (
	SELECT MAX([OrderDate])
	FROM [dbo].[Orders]
	)
--4 rows

--Liệt kê những sản phẩm mà không có đơn nào đặt mua chúng
SELECT * 
FROM [dbo].[Products]
WHERE [ProductID] NOT IN (
	SELECT DISTINCT [ProductID]
	FROM [dbo].[Order Details]
	)
--1 rows

--Tìm dơn hàng và tên sản phẩm chưa được trao cho khách hàng
--1
SELECT OD.OrderID, 
	(SELECT P.ProductName
	FROM [dbo].[Products] P
	WHERE P.ProductID = OD.ProductID) 
	AS [ProductName]
FROM [dbo].[Order Details] OD
WHERE OD.OrderID IN 
	(SELECT [OrderID]
	FROM [dbo].[Orders]
	WHERE [ShippedDate] IS NULL)
--73 rows

--2
SELECT OD.OrderID, P.ProductName
FROM [dbo].[Order Details] OD
INNER JOIN [dbo].[Products] P
ON P.ProductID = OD.ProductID
WHERE OD.OrderID IN 
	(SELECT [OrderID]
	FROM [dbo].[Orders]
	WHERE [ShippedDate] IS NULL)
--73 rows

--Lấy thông tin sản phẩm có lượng tồn kho it hơn lượng tồn kho trung bình
SELECT *
FROM [dbo].[Products]
WHERE [UnitsInStock] > 
	(SELECT AVG([UnitsInStock])
	FROM [dbo].[Products])
--26 rows

--Lấy thông tin khách hàng có tổng giá trị đơn hàng lớn nhất
SELECT TOP 1 [OrderID], SUM([UnitPrice]*[Quantity])
FROM [dbo].[Order Details]
GROUP BY [OrderID]
ORDER BY SUM([UnitPrice]*[Quantity]) DESC
--Giải
SELECT C.*, O.OrderID
FROM [dbo].[Customers] C
INNER JOIN  [dbo].[Orders] O
ON O.CustomerID = C.CustomerID
WHERE O.OrderID IN 
	(SELECT TOP 1 [OrderID]
	FROM [dbo].[Order Details]
	GROUP BY [OrderID]
	ORDER BY SUM([UnitPrice]*[Quantity]) DESC)
--

