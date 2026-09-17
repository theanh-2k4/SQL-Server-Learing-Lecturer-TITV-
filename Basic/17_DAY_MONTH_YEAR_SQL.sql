USE NORTHWND;

--Tìm số lượng đơn đặt hàng của từng khách hàng TRONG NĂM 1997
SELECT [CustomerID], COUNT(*) AS [TotalOrders], YEAR([OrderDate]) AS [Year]
FROM [dbo].[Orders]
WHERE YEAR([OrderDate]) = 1997
GROUP BY [CustomerID], YEAR([OrderDate])
--1st row ALFKI	3	1997

--Lọc tiếp các đơn hàng được đặt trong tháng 5 năm 1997
SELECT [CustomerID], 
		COUNT(*) AS [TotalOrders],
		MONTH([OrderDate]) AS [Month],
		YEAR([OrderDate]) AS [Year]
FROM [dbo].[Orders]
WHERE YEAR([OrderDate]) = 1997 AND MONTH([OrderDate]) = 5
GROUP BY [CustomerID], MONTH([OrderDate]), YEAR([OrderDate])
--1st row ANTON	1	5	1997

--Lọc tiếp các đơn hàng được đặt trong ngay 4 tháng 9 năm 1996
SELECT [CustomerID], 
		COUNT(*) AS [TotalOrders],
		DAY([OrderDate]) AS [Day],
		MONTH([OrderDate]) AS [Month],
		YEAR([OrderDate]) AS [Year]
FROM [dbo].[Orders]
WHERE YEAR([OrderDate]) = 1996 AND MONTH([OrderDate]) = 9 AND DAY([OrderDate]) =4
GROUP BY [CustomerID],DAY([OrderDate]), MONTH([OrderDate]), YEAR([OrderDate])
--BLONP	1	4	9	1996

--Lấy ra danh sách khách hàng, các đơn hàng theo tháng trong năm 1998 sắp xếp các tháng tăng dần
SELECT [CustomerID],
		COUNT(*) AS [TotalOrders], 
		MONTH([OrderDate]) AS [Month],
		YEAR([OrderDate]) AS [Year]
FROM [dbo].[Orders]
WHERE YEAR([OrderDate]) = 1998 
GROUP BY [CustomerID], MONTH([OrderDate]), YEAR([OrderDate]) 
ORDER BY MONTH([OrderDate]) 
--1st row ALFKI	1	1	1998

--bài tập 
--Lấy các đơn hàng được đặt vào tháng 5, sắp sếp theo các năm tăng dần
SELECT [OrderID], YEAR([OrderDate])
FROM [dbo].[Orders]
WHERE MONTH([OrderDate]) = 5
ORDER BY YEAR([OrderDate]) ASC
--46 rows

--2 câu tự làm 
-- Lọc ra các nhân viên từ trẻ nhất đến có tuổi nhất được sinh ra trong giai đoạn năm 1950 - 1960
SELECT ([LastName] +' ' +[FirstName]) AS [FullName], 
		YEAR([BirthDate]) AS [BirthYear]
FROM [dbo].[Employees]
WHERE YEAR([BirthDate]) >= 1950 AND  YEAR([BirthDate]) <= 1960
ORDER BY YEAR([BirthDate])
--1st row Fuller Andrew	1952

--Lọc các nhân viên không đến từ USA được thuê vào tháng 10 năm bất kì
SELECT ([LastName] +' ' +[FirstName]) AS [FullName], 
MONTH([HireDate]) AS [Month]
FROM [dbo].[Employees]
WHERE MONTH([HireDate]) = 10 AND [Country] <> 'USA'
--1st row Buchanan Steven	10
