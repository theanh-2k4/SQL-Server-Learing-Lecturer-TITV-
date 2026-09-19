use NORTHWND

--từ bảng Products và Categories, in ra các thông tin sau
--, Mã và tên thể loại
--Mã và tên sản phẩm 
SELECT c.[CategoryID], c.CategoryName, p.ProductID, p.ProductName
FROM [dbo].[Categories] AS c, [dbo].[Products] AS p
WHERE c.CategoryID = p.CategoryID
-- 77 rows
--1st row 1	Beverages	1	Chai

--Lấy ra mã và tên nhân viên, số lượng đơn mà nhân viên đã bán được 
SELECT e.EmployeeID, e.LastName, e.FirstName, COUNT(o.OrderID) AS [TotalOrders]
FROM [dbo].[Employees] AS e, [dbo].[Orders] AS o
WHERE E.EmployeeID = O.EmployeeID
GROUP BY e.EmployeeID, e.LastName, e.FirstName
--9 rows
--1st row 1	Davolio	Nancy	123

--từ bảng [dbo].[Customers] và [dbo].[Orders] in ra - Mã khách hàng, tên công ty, tên liên hệ, số đơn đã mua
SELECT C.CustomerID, C.CompanyName, C.ContactName, COUNT(O.OrderID) AS [TotalOrders]
FROM [dbo].[Customers] C, [dbo].[Orders] O
WHERE C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CompanyName, C.ContactName
--89 rows
--1st row ALFKI	Alfreds Futterkiste	Maria Anders	6

--từ bảng [dbo].[Orders] và [dbo].[Shippers]  in ra mã nhà vận cuyển, tên công ty vận chuyển, tổng tiền vận chuyển
--Sắp xếp theo số tiền giảm dần
SELECT S.ShipperID, S.CompanyName, SUM(O.Freight) AS [TotalFreights]
FROM [dbo].[Shippers] S, [dbo].[Orders] O
WHERE S.ShipperID = O.ShipVia
GROUP BY S.ShipperID, S.CompanyName
ORDER BY [TotalFreights] DESC
--1st row 2	United Package	28244.85

--Lấy ra Mã nhà cung cấp, tên công ty, tổng các sản phẩm khác nhau đã cung cấp [dbo].[Products], [dbo].[Suppliers]
--in ra duy nhất 1 nhà cung cấp có nhiều sản phẩm khác nhau nhất
SELECT TOP 1 S.SupplierID, S.CompanyName, COUNT(P.ProductID) AS [TotalProducts]
FROM [dbo].[Suppliers] S, [dbo].[Products] P
WHERE S.SupplierID = P.SupplierID
GROUP BY S.SupplierID, S.CompanyName
ORDER BY COUNT(P.ProductID) DESC
-- 7	Pavlova, Ltd.	5

-- Từ [dbo].[Orders] và [dbo].[Order Details] lấy mã sản phẩm, mã khách hàng và tổng tiền sản phẩm của đơn hàng đó
SELECT O.OrderID, [CustomerID], SUM(OD.Quantity * OD.UnitPrice) AS [Total]
FROM [dbo].[Orders] O, [dbo].[Order Details] OD
WHERE o.OrderID = od.OrderID
GROUP BY O.OrderID, [CustomerID]
--1st row 10248	VINET	440.00

--In ra mã đơn hàng, tên nhân viên tổng tiền sản phẩm của đơn
SELECT O.OrderID, 
		(E.LastName +' ' +E.FirstName) AS [FullName], 
		SUM(OD.Quantity * OD.UnitPrice) AS [Total]
FROM [dbo].[Orders] O, [dbo].[Order Details] OD, [dbo].[Employees] E
WHERE O.OrderID = OD.OrderID AND O.EmployeeID = E.EmployeeID
GROUP BY O.OrderID, (E.LastName +' ' +E.FirstName)
--1st row 10248	Buchanan Steven	440.00

--Bài tập
--In ra mã đơn hàng, tên khách hàng, tên công ty vận chuyển, chỉ in các đơn giao đến UK năm 1997
SELECT O.OrderID, C.CustomerID, S.CompanyName, O.ShippedDate, O.ShipCountry
FROM [dbo].[Orders] O, [dbo].[Customers] C, [dbo].[Shippers] S
WHERE O.CustomerID = C.CustomerID AND O.ShipVia = S.ShipperID
	  AND O.ShipCountry = 'UK' AND YEAR(O.ShippedDate) = 1997
--26 rows
--1st row 10400	EASTC	Federal Shipping	1997-01-16 00:00:00.000	UK

--2 câu tự làm
-- Lọc ra những đơn hàng có hóa đơn hơn 500 đô và tên khách hàng của hóa đơn đó, sắp xếp giảm dần giá trị đơn
SELECT C.ContactName, O.OrderID, SUM(OD.Quantity *OD.UnitPrice) AS [Total]
FROM [dbo].[Customers] C, [dbo].[Orders] O, [dbo].[Order Details] OD
WHERE C.CustomerID = O.CustomerID AND O.OrderID = OD.OrderID
GROUP BY C.ContactName, O.OrderID
HAVING SUM(OD.Quantity *OD.UnitPrice) > 500
ORDER BY SUM(OD.Quantity *OD.UnitPrice) DESC
--611 rows

-- Lấy ra họ tên nhân viên và tổng các đơn hàng gửi đến đia chỉ trùng với đất nước họ đơn ở
SELECT E.EmployeeID, (E.[LastName] +' ' +E.[FirstName]) AS [FULLNAME], COUNT(O.OrderID) AS [TOTALORDERS]
FROM [dbo].[Employees] E, [dbo].[Orders] O
WHERE E.EmployeeID = O.EmployeeID AND E.Country = O.ShipCountry
GROUP BY E.EmployeeID, (E.[LastName] +' ' +E.[FirstName])
--9 rows
--
