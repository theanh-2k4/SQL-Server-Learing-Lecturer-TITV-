use NORTHWND

--Lấy ra các đơn hàng chưa được giao
SELECT *
FROM [dbo].[Orders]
WHERE [ShippedDate] IS NULL
--21 rows
SELECT COUNT(*) AS [CHUA GIAO]
FROM [dbo].[Orders]
WHERE [ShippedDate] IS NULL
--21

--Lấy ra những khách hàng có region không bị NULL
SELECT *
FROM [dbo].[Customers]
WHERE [Region] IS NOT NULL
--31 rows

--Lấy ra các khách hàng không có tên công ty
SELECT *
FROM [dbo].[Customers]
WHERE [CompanyName] IS NULL
--0 rows

--Bài tập
--Lấy ra các đơn chưa được giao và có khu vực giao hàng [ShipRegion] không bị NULL
SELECT *
FROM [dbo].[Orders]
WHERE [ShipRegion] IS NOT NULL AND [ShippedDate] IS NULL
--9 rows

--2 câu tự làm
--Lấy ra tên đầy đủ của những nhân viên có region không phải null
SELECT ([LastName] +' ' +[FirstName]) AS [FullName]
FROM [dbo].[Employees]
WHERE [Region] IS NOT NULL
--5 rows

--Lấy ra những nhà cung cấp có Homepage nhưng không có Region
SELECT *
FROM [dbo].[Suppliers]
WHERE [HomePage] IS NOT NULL 
	  AND [Region] IS NULL
--3 rows