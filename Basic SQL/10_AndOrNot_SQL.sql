use NORTHWND
--Liệt kê các sản phẩm có số lượng trong kho nhỏ hơn 50 hoặc lớn hơn 100
SELECT *
FROM [dbo].[Products]
WHERE [UnitsInStock] <50 OR [UnitsInStock] >100
--64 rows

--Liệt kê các đơn hàng đến Brazilk và giao muộn
SELECT [OrderID],
		[RequiredDate],
		[ShippedDate],
		[ShipCountry]
FROM [dbo].[Orders]
WHERE [ShipCountry] = 'Brazil' AND [RequiredDate] <[ShippedDate]
--3 row
--1st row 10423	1997-02-06 00:00:00.000	1997-02-24 00:00:00.000	Brazil

--Lấy ra các sản phẩm có giá dưới 100$ và mã thể loại khác 1 dùng NOT
SELECT  [ProductName],
		[CategoryID],
		[UnitPrice]
FROM [dbo].[Products]
WHERE NOT [CategoryID]=1 OR [UnitPrice] >=100
-- 1st row Aniseed Syrup	2	10.00

--Bài tập 
--Liệt kê các đơn hàng có giá vận chuyên từ 50 - 100 $
--1.AND 
SELECT *
FROM [dbo].[Orders]
WHERE [Freight] >=50 AND [Freight]<=100

--NOT, OR
SELECT *
FROM [dbo].[Orders]
WHERE NOT [Freight] >100 OR [Freight] <50

--Liệt kê các sản phẩm có số lượng trong kho lớn hơn 20, số lượng trong đơn nhỏ hơn 20
--AND
SELECT  [ProductName],
		[UnitsInStock],
		[UnitsOnOrder]
FROM [dbo].[Products]
WHERE [UnitsInStock]>20 AND [UnitsOnOrder]<20
--1st row Chai	39	0

--2 câu tự làm 
--Lấy ra 3 nhân viên vào công ty sớm nhất ở USA, sinh sau 1940
SELECT TOP 3 ([LastName] +' ' +[FirstName]) AS [FullName], 
			 [HireDate], 
			 [BirthDate],
			 [Country]
FROM [dbo].[Employees]
WHERE [Country] = 'USA' AND YEAR([BirthDate]) >1940
ORDER BY [HireDate] ASC
--1st row Leverling Janet	1992-04-01 00:00:00.000	1963-08-30 00:00:00.000	USA

--Lấy ra 10 đơn hàng có giá trị lớn nhất có giảm giá và số lượng mua nhỏ hơn 3
SELECT TOP 10 *, ([UnitPrice]*[Quantity]) AS [TotalValue]
FROM [dbo].[Order Details]
WHERE [Quantity]<3 AND [Discount]>0
ORDER BY ([UnitPrice]*[Quantity]) DESC

