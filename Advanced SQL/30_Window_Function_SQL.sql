use NORTHWND

--Xếp hạng toàn bộ sản phẩm trên giá  
SELECT 
	[ProductID],
	[ProductName],
	[CategoryID],
	[UnitPrice],
RANK() OVER (ORDER BY [UnitPrice] DESC) AS Ranking
FROM [dbo].[Products]

--Xếp hạng toàn bộ sản phẩm trên giá giảm dần theo thể loại
SELECT 
	[ProductID],
	[ProductName],
	[CategoryID],
	[UnitPrice],
RANK() OVER (PARTITION BY [CategoryID] ORDER BY [UnitPrice] DESC) AS Ranking
FROM [dbo].[Products];

-- Chèn 20 dòng dữ liệu thực tế vào bảng
CREATE TABLE [sinh_vien] (
    [ma_sinh_vien] INT PRIMARY KEY,
    [ho_ten] NVARCHAR(255),
    [diem_trung_binh] DECIMAL(3, 2),
    [ma_lop_hoc] INT
);

INSERT INTO [sinh_vien] ([ma_sinh_vien], [ho_ten], [diem_trung_binh], [ma_lop_hoc])
VALUES
    (1, N'Nguyễn Văn A', 3.75, 101),
    (2, N'Trần Thị B', 3.88, 102),
    (3, N'Phạm Văn C', 3.75, 101),
    (4, N'Huỳnh Thị D', 3.92, 103),
    (5, N'Lê Văn E', 3.60, 102),
    (6, N'Ngô Thị F', 3.78, 101),
    (7, N'Trịnh Văn G', 3.65, 102),
    (8, N'Võ Thị H', 3.80, 103),
    (9, N'Đặng Văn I', 3.55, 101),
    (10, N'Hoàng Thị K', 3.95, 102),
    (11, N'Mai Thị L', 3.70, 103),
    (12, N'Lý Thị M', 3.62, 101),
    (13, N'Chu Thị N', 3.85, 102),
    (14, N'Đỗ Thị P', 3.58, 103),
    (15, N'Dương Văn Q', 3.72, 101),
    (16, N'Lâm Thị R', 3.85, 102),
    (17, N'Nguyễn Văn S', 3.68, 101),
    (18, N'Nguyễn Thị T', 3.75, 103),
    (19, N'Nguyễn Văn U', 3.93, 102),
    (20, N'Nguyễn Thị V', 3.67, 101);

--Xếp hạng sinh viên toàn trường dựa theo điểm sô giảm dần
SELECT 
    [ma_sinh_vien],
    [ho_ten],
    [diem_trung_binh],
    [ma_lop_hoc],
    RANK () OVER (ORDER BY [diem_trung_binh] DESC) AS [Xep hang]
FROM [dbo].[sinh_vien];

--Xếp hạng sinh viên theo từng lớp dựa theo điểm sô giảm dần, không nhảy hạng
SELECT 
    [ma_sinh_vien],
    [ho_ten],
    [diem_trung_binh],
    [ma_lop_hoc],
    DENSE_RANK () OVER (PARTITION BY [ma_lop_hoc] ORDER BY [diem_trung_binh] DESC) AS [Xep hang]
FROM [dbo].[sinh_vien];

SELECT 
    [ma_sinh_vien],
    [ho_ten],
    [diem_trung_binh],
    [ma_lop_hoc],
    ROW_NUMBER () OVER (PARTITION BY [ma_lop_hoc] ORDER BY [diem_trung_binh] DESC) AS [Xep hang]
FROM [dbo].[sinh_vien];

--LAG() lấy thông tin về đơn hàng
--và ngày đặt hàng của đơn trước đó cho mỗi khách hàng
SELECT 
    O.CustomerID,
    O.OrderID,
    O.OrderDate,
    LAG(O.OrderDate) OVER (PARTITION BY O.CustomerID ORDER BY O.OrderDate ASC) AS [PreviousOrderDate]
FROM [dbo].[Orders] O;
--830 rows

--Bài tập
--Tính tổng doanh số bán hàng của mỗi khách hàng theo từng năm, và xếp hạng dựa trên doanh số bán hàng
WITH RevenuePerYear AS (
    SELECT O.CustomerID, YEAR(O.OrderDate) AS [Year], SUM(OD.UnitPrice *OD.Quantity) AS [Total]
    FROM [dbo].[Orders] O 
    JOIN [dbo].[Order Details] OD
    ON O.OrderID = OD.OrderID
    GROUP BY O.CustomerID, YEAR(O.OrderDate) 
)
SELECT 
    C.CustomerID,
    C.ContactName, 
    RPY.Year, 
    RPY.Total,
    DENSE_RANK() OVER (PARTITION BY RPY.Year ORDER BY RPY.Total DESC) AS Ranking
FROM [dbo].[Customers] C
JOIN RevenuePerYear RPY
ON RPY.CustomerID = C.CustomerID;
--234 rows