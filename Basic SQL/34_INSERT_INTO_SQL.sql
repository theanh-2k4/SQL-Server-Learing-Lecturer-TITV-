use NORTHWND;

--Thêm 1 khách hàng mới 
INSERT INTO [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [Phone])
VALUES ('KH321', 'HTA.vn', 'Ha The Anh', '10230234032');

--Nếu không điền tên cột thì phải điền đủ dữ liệu
INSERT INTO [dbo].[Customers] 
VALUES ('KH231', 'HTA.vn', 'Ha The Anh', '10230234032', 'dsa', null, null, null, null, null, null);

--Thêm nhiều khách hàng cùng lúc
INSERT INTO [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [Phone])
VALUES 
	('KH111', 'HTA.vn', 'Ha The Anh', '10230234032'),
	('KH222', 'HTA.vn', 'Ha The Anh', '10230234032'),
	('KH333', 'HTA.vn', 'Ha The Anh', '10230234032'),
	('KH444', 'HTA.vn', 'Ha The Anh', '10230234032');

--Thêm một sản phẩm mới
INSERT INTO [dbo].[Products] ([ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock])
VALUES ('NEW PRODUCT', 1, 2, '24 bottles', 10.99, 100);

--Bài tập
--Thêm nhà cung cấp vào bảng suppliers
INSERT INTO [dbo].[Suppliers] ([CompanyName], [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [HomePage]) 
VALUES 
	('New Suppliers', 'John Smith', 'Sales Manager', '123 Supplier Street', 'New York', 'NY', '10001', 'USA', '555-555-5555', '555-555-5556', 'https://www.newsupplier.com');

--Viết lệnh thêm đơn hàng dựa theo id khách, nhân viên, shipvia hiện có, date là ngày hiện tại
INSERT INTO [dbo].[Orders] ([CustomerID], [EmployeeID], [OrderDate], [ShipVia], [Freight], [ShipCity], [ShipPostalCode], [ShipCountry])
VALUES 
	('ALFKI', 8, GETDATE(), 1, 10.99, 'Ho Chi Minh', '70000', 'Viet Nam')