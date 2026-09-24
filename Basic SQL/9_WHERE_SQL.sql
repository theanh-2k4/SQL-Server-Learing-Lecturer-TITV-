use NORTHWND

--Liệt kê tất cả nhân vien đến từ London
--Sắp xếp kết quả theo Lastname
SELECT ([LastName] +' ' +[FirstName]) as [FullName],
	   [City]
FROM [dbo].[Employees]
WHERE [City] = 'London'
Order By [LastName] ASC
--4 rows
-- 1st row Buchanan Steven	London

--Liệt kê các đơn hàng bị giao muộn
SELECT [OrderID], 
	   [RequiredDate],
	   [ShippedDate]
FROM [dbo].[Orders]
WHERE [RequiredDate] < [ShippedDate]
--1st row 10264	1996-08-21 00:00:00.000	1996-08-23 00:00:00.000

SELECT COUNT(*) AS [Số đơn giao muộn]
FROM [dbo].[Orders]
WHERE [RequiredDate] < [ShippedDate]
--37

--Lấy ra các đơn hàng được giảm giá nhiều hơn 10%
SELECT *
FROM [dbo].[Order Details]
WHERE [Discount] > 0.1
--1st row 10250	51	42.40	35	0.15

--Lấy ra các đơn hàng được giảm giá từ 10% - 20%
SELECT *
FROM [dbo].[Order Details]
WHERE [Discount] >= 0.1 AND [Discount] <= 0.2
--491 row

--Bài tập
--Liệt kê các đơn hàng được gửi đến France
SELECT [OrderID],
	   [ShipCountry]
FROM [dbo].[Orders]
WHERE [ShipCountry] = 'France'
--1st row
--10248	France

--Liệt kê các sản phẩm có số lượng trong kho lớn hơn 20
SELECT  *
FROM [dbo].[Products]
WHERE [UnitsInStock] >20

--3 câu tự làm 
--Liệt kê các nhân viên sinh sau 1960
SELECT *
FROM [dbo].[Employees]
WHERE YEAR([BirthDate]) > 1960
--1st row
--3	Leverling	Janet	Sales Representative	Ms.	1963-08-30 00:00:00.000

--Liệt kê những món hàng có số lượng đặt hàng nhiều hơn số hàng còn trong kho
SELECT  [ProductName], 
		[UnitsOnOrder],
		[UnitsInStock]
FROM [dbo].[Products]
WHERE [UnitsOnOrder] > [UnitsInStock] 
--Chang	40	17

