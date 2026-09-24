use NORTHWND
--Láy các sản phẩm có giá từ 10 -20$
SELECT *
FROM [dbo].[Products]
WHERE [UnitPrice] BETWEEN 10 AND 20
--29 rows

--Láy danh sách các đơn hàng được đặt trong tháng 7/1996
SELECT *
FROM [dbo].[Orders]
WHERE [OrderDate] BETWEEN '1996-07-01' AND '1996-7-31'
-- 22 rows

--Tính tổng tiền vận chuyển các đơn đặt hàng trong tháng 7/1996
SELECT SUM([Freight])
FROM [dbo].[Orders]
WHERE [OrderDate] BETWEEN '1996-07-01' AND '1996-07-31'
--1288.18

--Bài tập
--Lấy ra cơn đơn hàng nằm trong khoảng năm 1997 được vận chuyển bằng tàu thủy [ShipVia]=3
SELECT *
FROM [dbo].[Orders]
WHERE [ShipVia]=3 AND 
	  [OrderDate] BETWEEN '1997-01-01' AND '1997-12-31'

--2 câu tự làm
--Lấy top 5 sản phẩm theo thứ tự tồn kho giảm dần có mã thẻ loại khác 2 và giá sản phẩm trong khoảng 5 - 50$
SELECT TOP 5 *
FROM [dbo].[Products]
WHERE [UnitPrice] BETWEEN 5 AND 50 
	  AND [CategoryID] <> 2
ORDER BY [UnitsInStock] DESC

--Liệt kê tên các nhân viên sống ở London, năm sinh trong khoản năm 1952 - 1963, hoặc được tuyển trong khoản 1-2-1992 - hết năm 1993
--Lấy 3 nhân viên, sắp sếp theo LastName từ A-Z
SELECT TOP 3 ([LastName] +' ' +[FirstName]),
				[BirthDate],
				[HireDate],
				[City]
FROM [dbo].[Employees]
WHERE [City] = 'London' AND 
		[BirthDate] BETWEEN '1952-01-01' AND '1963-12-31' AND
		[HireDate] BETWEEN '1992-01-01' AND '1993-12-31'
ORDER BY [LastName] DESC