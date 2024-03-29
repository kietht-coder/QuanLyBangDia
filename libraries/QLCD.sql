USE [master]
GO
CREATE DATABASE [QLCD]
 ON  PRIMARY 
( NAME = N'QLCD', FILENAME = N'D:\QLCD.mdf' , SIZE = 4MB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLCD_log', FILENAME = N'D:\QLCD_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

USE [QLCD]
GO

CREATE TABLE [CD](
	[MaCD] [char](30) NOT NULL PRIMARY KEY,
	[TenCD] [nvarchar](30) NULL,
	[Theloai] [nvarchar](30) NULL,
	[Trangthai] [bit] NULL,
	[HangSX] [nvarchar](30) NULL,
	[Ghichu] [nvarchar](30) NULL,
	[DonGia] [int] NULL
)
GO

CREATE TABLE [ThanhVien](
	[MaTV] [char](30) NOT NULL PRIMARY KEY,
	[HoTen] [nvarchar](30) NULL,
	[Gioitinh] [BIT] NULL,
	[SDT] [char] (13) NULL,
	[Diachi] [nvarchar](30) NULL,
	[NgayHH] [date] NULL,
)
GO

CREATE TABLE [NhanVien] (
	[MaNV] [CHAR](30) NOT NULL PRIMARY KEY,
	[TenNV] [NVARCHAR](30) NULL,
	[SDT] [CHAR] (13) NULL,
	[MoTa] [NVARCHAR](30) NULL,
)

CREATE TABLE [Account]
(
	[MaNV] [CHAR] (30) NOT NULL PRIMARY KEY,
	[Password] [CHAR] (33),
	FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien (MaNV)
)

CREATE TABLE [PhieuThue](
	[SoPhieu] [char](30)PRIMARY KEY,
	[MaNV] [CHAR](30),
	[Ngaythue] [DATE],
	[MaTV] [char](30) NOT NULL,
	FOREIGN KEY (MaTV) REFERENCES dbo.ThanhVien(MaTV),
	FOREIGN KEY (MaTV) REFERENCES dbo.NhanVien(MaNV),
)
GO

CREATE TABLE [CTPhieuThue](
	[SoPhieu] [char](30) NOT NULL,
	[MaCD] [char](30) NOT NULL,
	[SoNM] [int] NOT NULL,
	PRIMARY KEY (SoPhieu,MaCD),
	FOREIGN KEY (MaCD) REFERENCES dbo.CD(MaCD),
	FOREIGN KEY (SoPhieu) REFERENCES dbo.PhieuThue(SoPhieu)
)
alter table [dbo].[PhieuThue] add soluong int;

INSERT dbo.CD
VALUES
(   'CD01',   -- MaCD - char(30)
    N'Đồi Thông Hai Mộ',  -- TenCD - nvarchar(30)
    N'Nhạc Vàng',  -- Theloai - nvarchar(30)
    1, -- Trangthai - bit
    N'Product Entertaiment',  -- HangSX - nvarchar(30)
    N'',  -- Ghichu - nvarchar(30)
    15000    -- DonGia - int
),
(   'CD02',   -- MaCD - char(30)
    N'Vợ Người Ta',  -- TenCD - nvarchar(30)
    N'Nhạc Trắng',  -- Theloai - nvarchar(30)
    0, -- Trangthai - bit
    N'Product Entertaiment',  -- HangSX - nvarchar(30)
    N'',  -- Ghichu - nvarchar(30)
    20000    -- DonGia - int
),
(   'CD03',   -- MaCD - char(30)
    N'Ngày Mai Em ĐI',  -- TenCD - nvarchar(30)
    N'Nhạc Đỏ',  -- Theloai - nvarchar(30)
    1, -- Trangthai - bit
    N'Product Entertaiment',  -- HangSX - nvarchar(30)
    N'',  -- Ghichu - nvarchar(30)
    10000    -- DonGia - int
)
INSERT dbo.ThanhVien VALUES
(   'TV01',       -- MaTV - char(30)
    N'Nguyễn Phi Hùng',      -- HoTen - nvarchar(30)
    1,     -- Gioitinh - bit
    '000000000',       -- SDT - char(13)
    N'',      -- Diachi - nvarchar(30)
    GETDATE() -- NgayHH - date
),
(   'TV02',       -- MaTV - char(30)
    N'Huỳnh Tuấn Kiệt',      -- HoTen - nvarchar(30)
    1,     -- Gioitinh - bit
    '111111111',       -- SDT - char(13)
    N'',      -- Diachi - nvarchar(30)
    GETDATE() -- NgayHH - date
),
(   'TV03',       -- MaTV - char(30)
    N'Nguyễn Văn A',      -- HoTen - nvarchar(30)
    1,     -- Gioitinh - bit
    '222222222',       -- SDT - char(13)
    N'',      -- Diachi - nvarchar(30)
    GETDATE() -- NgayHH - date
)
alter table [dbo].[CTPhieuThue] add gia int ;
