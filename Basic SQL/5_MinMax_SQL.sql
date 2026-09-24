use NORTHWND;

--Tìm giá thấp nhất trong các sản phẩm bảng Product
SELECT MIN([UnitPrice]) AS [MINPRICE]
FROM [dbo].[Products]
--2.5

--Viết câu lệnh lấy ra ngày đặt hàng gần đây nhất từ bảng Order 
SELECT MAX([OrderDate]) AS [Ngày gần nhất]
FROM [dbo].[Orders]
--1998-05-06

--Viết câu lệnh sql tìm số lượng hàng trong kho (UnitInStock) lớn nhất
SELECT MAX([UnitsInStock]) AS [Số lượng hàng lớn nhất]
FROM [dbo].[Products]
--125

--Bài tập
--Cho biết ngày sinh của nhân viên có tuổi đời lớn nhất công ty
SELECT MIN([BirthDate]) AS [Ngày sinh]
FROM [dbo].[Employees]
--1937-09-19

--2 câu tự làm
--Tìm ngày gần nhất có đơn hàng được giao trong bảng Orders
SELECT MAX([ShippedDate]) AS [Ngày gần nhất]
FROM [dbo].[Orders]
--1998-05-06

--Tìm ngày gần nhất có nhân viên được tuyển vào công ty
SELECT MAX([HireDate]) AS [Ngày tuyển]
FROM [dbo].[Employees]
--1994-11-15 

