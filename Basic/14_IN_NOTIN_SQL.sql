use NORTHWND

--Lấy ra các đơn hàng được giao đến
--a Germany, UK, Brazil
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCountry] = 'Germany' OR [ShipCountry] = 'UK' OR [ShipCountry] = 'Brazil'
--261 rows

SELECT *
FROM [dbo].[Orders]
WHERE [ShipCountry] IN ('Germany', 'UK', 'Brazil')
--261 rows

--b không đến Germany, UK, Brazil
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCountry] NOT IN ('Germany', 'UK', 'Brazil')
--569 rows

--Lấy ra các sản phẩm có mã thể loại khác 2, 3, 4
SELECT *
FROM [dbo].[Products]
WHERE [CategoryID] NOT IN (2, 3, 4)

--Liệt kê tất cả các nhân viên
--a không phải là nữ
SELECT *
FROM [dbo].[Employees]
WHERE [TitleOfCourtesy] NOT IN ('Mrs.', 'Ms.')
--4 rows

--b là nữ
SELECT *
FROM [dbo].[Employees]
WHERE [TitleOfCourtesy] IN ('Mrs.', 'Ms.')
--5 rows

--Bài tập
--Lấy ra các khách hàng đến từ các thành phố sau đây Berlin, London, Warszawa
SELECT *
FROM [dbo].[Customers]
WHERE [City] IN ('Berlin','London','Warszawa')
--8 rows

--2 câu tự làm
--Lấy ra 10 đơn hàng có phí vận chuyển lớn nhất có Shipvia là 1 hoặc 2
SELECT TOP 10 *
FROM [dbo].[Orders]
WHERE [ShipVia] IN (1, 2)
ORDER BY [Freight] DESC
--10 rows

--Lấy ra những nhà cung cấp không đến từ UK hoặc USA có chữ o trong tên thành phố 
SELECT *
FROM [dbo].[Suppliers]
WHERE [Country] NOT IN ('UK','USA') AND [City] LIKE '%o%'
