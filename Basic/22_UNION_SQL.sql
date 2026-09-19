USE NORTHWND

--Lấy ra những đơn hàng có unitprice từ 100 - 200
--I
SELECT OD.OrderID
FROM [dbo].[Order Details] OD
WHERE OD.UnitPrice BETWEEN 100 AND 200
--22 rows

--Lấy ra những đơn hàng có Quantity là 10 hoặc 20
--II
SELECT OD.OrderID
FROM [dbo].[Order Details] OD
WHERE OD.Quantity IN (10, 20)
--433 rows

--Lấy ra những đơn hàng có Quantity là 10 hoặc 20 và có unitprice từ 100 - 200
--III
SELECT OD.OrderID
FROM [dbo].[Order Details] OD
WHERE OD.UnitPrice BETWEEN 100 
	AND 200 AND OD.Quantity IN (10, 20)
--7 rows

--Lấy ra những đơn hàng có Quantity là 10 hoặc 20 hoặc có unitprice từ 100 - 200
--IV
SELECT OD.OrderID
FROM [dbo].[Order Details] OD
WHERE OD.UnitPrice BETWEEN 100 
	AND 200 OR OD.Quantity IN (10, 20)
--448 rows

--Yêu cầu như câu trước thêm DISTINCT
--V + DISTINCT
SELECT DISTINCT OD.OrderID
FROM [dbo].[Order Details] OD
WHERE OD.UnitPrice BETWEEN 100 
	AND 200 OR OD.Quantity IN (10, 20)
--360 rows

--Viết lại câu 5 dùng UNION
--Dùng UNION
SELECT OD.OrderID
FROM [dbo].[Order Details] OD
WHERE OD.UnitPrice BETWEEN 100 AND 200
UNION
SELECT OD.OrderID
FROM [dbo].[Order Details] OD
WHERE OD.Quantity IN (10, 20)
--360 rows

--Viết lại câu 4 dùng UNION ALL
SELECT OD.OrderID
FROM [dbo].[Order Details] OD
WHERE OD.UnitPrice BETWEEN 100 AND 200
UNION ALL
SELECT OD.OrderID
FROM [dbo].[Order Details] OD
WHERE OD.Quantity IN (10, 20)

--Lấy tất cả quốc gia từ 2 Table là [dbo].[Suppliers] và [dbo].[Customers]
SELECT DISTINCT S.Country
FROM [dbo].[Suppliers] S --> 16 ROWS
UNION
SELECT DISTINCT C.Country
FROM [dbo].[Customers] C --> 21 ROWS
--UNION > 25 ROWS

SELECT DISTINCT S.Country
FROM [dbo].[Suppliers] S --> 16 ROWS
UNION ALL
SELECT DISTINCT C.Country
FROM [dbo].[Customers] C --> 21 ROWS
--37 ROWS

--Bài tập
--Giải thích ý nghĩa câu lệnh sau
--Giải thích:
--Câu truy vấn lấy ra không trùng lặp danh sách các thành phố và đất nướ của thành phố đó từ 3 bảng khác nhau là
--[Customers]
--[Suppliers]
--[Orders]
--Mỗi bảng có 1 điều kiện truy vấn khác nhau
SELECT C.City, C.Country
FROM [dbo].[Customers] C
WHERE C.Country LIKE 'U%' --> Lấy ra danh sách thành phố và quốc gia nhưng quốc gia có tên bắt dầu bằng U
UNION
SELECT S.City, S.Country
FROM [dbo].[Suppliers] S
WHERE S.City = 'London' --> Lấy ra thành phố và quốc gia mà của thành phố London
UNION
SELECT O.ShipCity, O.ShipCountry
FROM [dbo].[Orders] O
WHERE O.ShipCountry = 'USA' --> Lấy ra những thành phố của Hoa Kì
--14 rows

--Câu tự làm
--Lấy ra không trùng lặp danh sách thành phố, quốc gia và khu vực từ 2 bảng [dbo].[Employees] và [dbo].[Customers]
--Không lấy dữ liệu region null
--Đối với bảng khách hàng không lấy danh sách các thành phố đến từ UK
SELECT C.[City], C.[Country], C.[Region]
FROM [dbo].[Customers] C
WHERE C.Country <> 'UK' AND C.Region IS NOT NULL
UNION
SELECT E.[City], E.[Country], E.[Region]
FROM [dbo].[Employees] E
WHERE E.Region IS NOT NULL
--26 rows
