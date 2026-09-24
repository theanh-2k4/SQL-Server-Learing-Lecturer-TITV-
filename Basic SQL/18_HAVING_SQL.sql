--Các cột phát sinh bỏ vào having
use NORTHWND;

--Cho biết những khách đặt nhiều hơ n20 đơn, sắp xếp theo số đơn giảm dần
SELECT [CustomerID], COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]
GROUP BY [CustomerID]
HAVING COUNT([OrderID]) > 20
ORDER BY [TotalOrders] DESC
--1st row SAVEA	31

--Lọc ra những nhà cung cấp sản phẩm có số lượng hàng trong kho lớn hơn 30, trung bình giá < 50
SELECT [SupplierID], 
		SUM([UnitsInStock]) AS [TotalUnits],
		AVG([UnitPrice]) AS [AVGPrice]
FROM [dbo].[Products]
GROUP BY [SupplierID]
HAVING AVG([UnitPrice]) < 50 AND SUM([UnitsInStock]) > 30
--1st row 1	69	15.6666

--Cho biết tổng tiền vận chuyển của từng tháng trong nửa sau năm 1996, sắp xếp theo các tháng tăng dần
--Tổng tiền vận chuyển lớn hơn 1000
SELECT MONTH([ShippedDate]) AS [Month],
		SUM([Freight])  AS [TotalFreights]
FROM [dbo].[Orders]
WHERE YEAR([ShippedDate]) = 1996
GROUP BY MONTH([ShippedDate])
HAVING MONTH([ShippedDate]) > 6 AND SUM([Freight]) > 1000
ORDER BY [Month] ASC
--1st row 8	1463.23

--Bài tập 
--Lọc ra những thành phố có số lượng đơn hàng > 16, sắp xếp giảm dần 
SELECT [ShipCity],
		COUNT([OrderID]) AS [TotalOrders]
FROM [dbo].[Orders]
GROUP BY [ShipCity]
HAVING COUNT([OrderID]) > 16 
ORDER BY [TotalOrders] DESC
--1st row Rio de Janeiro	34

--2 bài tự làm
--Lọc ra những lọai sản phẩm có mã thể loại khác 3 và 6 và có số tổng hàng trong kho lớn hơn 100, 
--sắp sếp theo tổng giá trị của loại hàng còn trong kho, tăng dần
SELECT [CategoryID]	,
		SUM([UnitsInStock]) AS [TotalUnits],
		SUM([UnitsInStock] *[UnitPrice]) AS [TotalPrice]
FROM [dbo].[Products]
WHERE [CategoryID] NOT IN (3, 6)
GROUP BY [CategoryID]
HAVING SUM([UnitsInStock]) > 100
ORDER BY SUM([UnitsInStock] *[UnitPrice])

--Tính tổng giá trị vận chuyển của các đơn hàng theo khách hàng ở các thành phố có tên bắt đầu từ a
--sắp sếp giảm dần
--Lọc ra các khách có giá vận chuyển trên 500
SELECT [CustomerID],
		SUM([Freight]) AS [TotalFreightS],
		[ShipCity]
FROM [dbo].[Orders]
WHERE [ShipCity] LIKE 'A%'
GROUP BY [CustomerID], [ShipCity]
HAVING SUM([Freight]) > 500
ORDER BY [TotalFreightS] DESC
--1st row RATTC	2134.21	Albuquerque