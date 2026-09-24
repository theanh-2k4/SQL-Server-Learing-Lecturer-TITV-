use NORTHWND

--Cho biết mỗi khách hàng đã mua bao nhiêu đơn hàng
SELECT [CustomerID], COUNT(*) AS [Đơn đã đặt]
FROM [dbo].[Orders]
GROUP BY [CustomerID]
--89 rows
--1st row ALFKI	6

--Tính giá trị đơn giá trung bình theo mỗi nhà cung cấp 
SELECT [SupplierID], AVG([UnitPrice]) AS [AVGPrice]
FROM [dbo].[Products]
GROUP BY [SupplierID]
--1st rows 1	15.6666

--Mỗi thể loại mặt hàng có bao nhiêu sản phẩm trong kho
SELECT [CategoryID], SUM([UnitsInStock]) AS [TotalUnitsInStock]
FROM [dbo].[Products]
GROUP BY [CategoryID]
--1st row 1	559

--Cho biết giá vận chuyển thấp nhất và lớn nhất của các đơn hàng theo từng thành phố và quốc gia khác nhau
SELECT MIN([Freight]) AS [MinFreight], 
MAX([Freight]) AS [MaxFreight],
[ShipCity],
[ShipCountry]
FROM [dbo].[Orders]
GROUP BY [ShipCity], [ShipCountry]
ORDER BY [ShipCountry] ASC, [ShipCity] ASC
--70 rows
--1st row 0.33	217.86	Buenos Aires	Argentina

--Bài tập 
--Thống kê số lượng nhân viên theo quốc gia
SELECT [Country], COUNT(*) AS [NumOfEmploy]
FROM [dbo].[Employees]
GROUP BY [Country]

--2 câu tự làm
--Tính tổng tiền vận chuyển hàng của từng quốc gia ngoại trừ USA và UK
SELECT [ShipCountry], SUM([Freight]) AS [TotalFreight]
FROM [dbo].[Orders]
WHERE [ShipCountry] NOT IN ('USA','UK')
GROUP BY [ShipCountry]
--19 rows
--1st row Argentina	598.58

--Liệt kê tổng tiền bán hàng cho từng sản phẩm
SELECT [ProductID], SUM([UnitPrice]*[Quantity]) AS [TotalPrice]
FROM [dbo].[Order Details]
GROUP BY [ProductID]
ORDER BY [ProductID] ASC
--77 rows
--1st row 1	14277.60