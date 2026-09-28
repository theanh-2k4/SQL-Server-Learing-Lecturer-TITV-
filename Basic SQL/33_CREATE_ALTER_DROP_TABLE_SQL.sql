USE NVDB;

CREATE TABLE NhanVien (
	MaNV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Phai VARCHAR(50),
	NgaySinh DATE,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10)
);
--Tên bảng phải bắt đầu bằng kí tự chữ cái và không chứa kí tự đăc biệt
--Tên cột phải bắt đầu bằng kí tự chữ cái hoặc số và không chứa kí tự đăc biệt
--Kiểu dữ liệu phải xác định từ trước 
--Chỉ có duy nhất 1 khóa chính
--Khóa ngoại phải tham chiếu đến khóa chính của bảng khác

--CONSTRAINTS - Các lệnh bổ sung khi tạo bảng
--IDENTITY -> Tạo cột tự tăng
--IDENTITY(seed, increment) -> Tạo cột tự tăng có giá trị khởi đầu và giá trị tăng
--DEFAULT Thiết lập giá trị mặc định
--CHECK Thiết lập ràng buộc kiểm tra
--UNIQUE Thiết lập ràng buộc duy nhất

CREATE TABLE KhachHang (
	MaKH INT IDENTITY(100,5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10) CHECK (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

--ALTER TABLE -> Thay đổi cấu trúc TABLE
--ADD, DROP, RENAME, ALTER COLUMN column
--thêm cột vào bảng
ALTER TABLE NhanVien
ADD Email VARCHAR(100);

--thay đổi cấu trúc cột dữ liệu
ALTER TABLE NhanVien
ALTER COLUMN HoTen VARCHAR(100);

--Thêm ràng buộc
ALTER TABLE NhanVien
ADD CONSTRAINT NgaySinhCheck CHECK (NgaySinh<= GETDATE());

--xóa TABLE
--TRUNCATE TABLE [ten bang] -> xóa dữ liệu bảng
TRUNCATE TABLE NhanVien;

--DROP TABLE [ten bang] -> xóa bảng
DROP TABLE NhanVien;

--Bài tập
--1 Tạo bảng SinhVien
CREATE TABLE SinhVien (
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB FLOAT
);

--2 Thêm cột Email vào với kiểu dữ liệu VARCHAR(100)
ALTER TABLE SinhVien
ADD Email VARCHAR(100);

--3 Sửa kiểu dữ liệu cột DiemTB thành Decimal(2, 1)
ALTER TABLE SinhVien
ALTER COLUMN DiemTB DECIMAL(2, 1);

--4 Xóa cột Nganh khỏi bảng SinhVien
ALTER TABLE SinhVien
DROP COLUMN Nganh;

--5 Thêm ràng buôc kiểm tra cho cột DiemTB trong bảng SinhVien để giá trị >=0
ALTER TABLE SinhVien
ADD CONSTRAINT CheckDiemTB CHECK (DiemTB >= 0);

--6 Thêm ràng buộc duy nhất cho cột MaSV
ALTER TABLE SinhVien
ADD CONSTRAINT UniqueMaSV UNIQUE (MaSV);

--7 Thêm dữl liệu vào bảng SinhVien với một số thông tin
INSERT INTO [dbo].[SinhVien] ([MaSV], [HoTen], [Lop], [DiemTB], [Email])
VALUES
	(1, 'A', '1', 3.14, 'a@gmail.com'),
	(2, 'B', '1', 3.4, 'b@gmail.com'),
	(3, 'C', '1', 3.3, 'c@gmail.com'),
	(4, 'D', '1', 3.2, 'd@gmail.com');
---
SELECT * 
FROM [dbo].[SinhVien]

--8 Xóa dữ liệu bảng SinhVien
TRUNCATE TABLE [dbo].[SinhVien]

SELECT * 
FROM [dbo].[SinhVien]

--9 Xóa bảng SinhVien
DROP TABLE [dbo].[SinhVien]

--10 Tạo lại bảng sinh viên với cấu trúc ban đầu
CREATE TABLE SinhVien (
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB FLOAT
);

