--SELECT INTO dùng để tạo mới 1 bảng và sao chép dữ liệu từ 1 bảng hiện có vào
--thường tạo để tạo bảng tạm thời hăocj sao lưu dư liệu để phân tích, theo tác dư liệu khác
--có thể chọn 1 phần dữ liệu
use NORTHWND

--tạo bảng mới với các sản phẩm có giá lớn hơn 50
SELECT *
INTO HighValueProducts
FROM [dbo].[Products] 
WHERE [UnitPrice] > 50;

--tạo ra bảng mới với các đơn đến USA
SELECT *
INTO ToUSA
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'USA'

--tạo bảng tạm thời đểchuaws thông tin cáckhachs hàng có địa chỉ ở London
SELECT *
INTO CustomersInLondon	
FROM [dbo].[Customers]
WHERE [City] LIKE 'London'

SELECT *
FROM CustomersInLondon;

--Tạo bảng tạm thời chứa các đơn hàng có giá trị lớn hơn 1000$
WITH OrderValues AS (
	SELECT OD.[OrderID], SUM(OD.Quantity *OD.UnitPrice) AS OrderValue
	FROM [dbo].[Order Details] OD
	GROUP BY OD.[OrderID]
	HAVING SUM(OD.Quantity *OD.UnitPrice) > 1000
)
SELECT O.*, OV.OrderValue
INTO HighValueOrders
FROM [dbo].[Orders] O
JOIN OrderValues OV
ON O.OrderID = OV.OrderID
--Kiểm tra 
SELECT HVO.OrderID, HVO.OrderValue
FROM HighValueOrders HVO
--10249	1863.40
