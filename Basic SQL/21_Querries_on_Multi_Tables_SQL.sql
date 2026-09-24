use NORTHWND

--Lấy ra các sản phẩm thuộc loại Seafood gồm mã, tên thê loại, mã, tên sp
SELECT C.CategoryID, C.CategoryName, P.ProductID, P.ProductName
FROM [dbo].[Categories] C, [dbo].[Products] P
WHERE C.CategoryID = P.CategoryID AND C.CategoryName = 'Seafood'

--Lấy ra mã nhà cung cấp , quốc gia, mã và tên sản phẩm đến từ Germany
SELECT S.SupplierID, S.Country, P.ProductID, P.ProductName
FROM [dbo].[Suppliers] S, [dbo].[Products] P
WHERE S.SupplierID = P.SupplierID AND S.Country = 'Germany'

--Lấy ra mã đơn, tên khách hàng, tên công ty vận chuyển của khách đến từ London
SELECT O.OrderID, 
	C.ContactName, 
	SH.CompanyName
FROM [dbo].[Orders] O, [dbo].[Customers] C, [dbo].[Shippers] SH
WHERE O.CustomerID = C.CustomerID 
	AND O.ShipVia = SH.ShipperID 
	AND C.City = 'London'
--11	Germany	25	NuNuCa Nuß-Nougat-Creme

--Lấy ra mã đơn, tên khách hàng, tên công ty vận chuyển, ngày yêu cầu hàng, ngày giao hàng chỉ in ra các đơn giao muôn
SELECT O.OrderID, 
	C.ContactName, 
	SH.CompanyName,
	O.RequiredDate,
	O.ShippedDate
FROM [dbo].[Orders] O, [dbo].[Customers] C, [dbo].[Shippers] SH
WHERE O.CustomerID = C.CustomerID 
	AND O.ShipVia = SH.ShipperID 
	AND O.RequiredDate < O.ShippedDate

--Lọc ra những quốc gia có đơn mà khách không đến USA, có hơn 100 đơn, hiển thị tên quốc gia và số đơn
SELECT O.ShipCountry, COUNT(O.OrderID) AS [TotalOrders]
FROM [dbo].[Orders] O, [dbo].[Customers] C, [dbo].[Shippers] SH
WHERE O.CustomerID = C.CustomerID 
	AND O.ShipVia = SH.ShipperID 
	AND C.Country <> 'USA' 
GROUP BY O.ShipCountry 
HAVING COUNT(O.OrderID) > 100
--Germany	122

--2 câu tự làm
--Lấy ra tên khách hàng, tên nhân viên bán hàng, order ID, tổng số tiền khách cần thanh toán chưa tính giảm giá
SELECT C.ContactName, 
	(E.LastName +' ' +E.FirstName) AS [FullName], 
	O.OrderID, 
	SUM(OD.Quantity*OD.UnitPrice) AS [Total]
FROM [dbo].[Orders] O, [dbo].[Order Details] OD, 
	[dbo].[Customers] C, [dbo].[Employees] E
WHERE O.OrderID = OD.OrderID 
	AND O.CustomerID = C.CustomerID 
	AND O.EmployeeID = E.EmployeeID
GROUP BY C.ContactName, 
	(E.LastName +' ' +E.FirstName), 
	O.OrderID
-- Alejandra Camino	Davolio Nancy	10306	498.50

--Lấy ra tên khách hàng, tên nhân viên bán hàng, order ID, tổng số tiền khách cần thanh toán chưa tính giảm giá
--Lấy ra những hóa đơn nhiều hơn 1000 đô
--Sắp xếp theo số tiền giảm dần
SELECT C.ContactName, 
	(E.LastName +' ' +E.FirstName) AS [FullName], 
	O.OrderID, 
	SUM(OD.Quantity*OD.UnitPrice) AS [Total]
FROM [dbo].[Orders] O, [dbo].[Order Details] OD, 
	[dbo].[Customers] C, [dbo].[Employees] E
WHERE O.OrderID = OD.OrderID 
	AND O.CustomerID = C.CustomerID 
	AND O.EmployeeID = E.EmployeeID
GROUP BY C.ContactName, 
	(E.LastName +' ' +E.FirstName), 
	O.OrderID
HAVING SUM(OD.Quantity*OD.UnitPrice) > 1000
ORDER BY [Total] DESC
--Horst Kloss	Fuller Andrew	10865	17250.00