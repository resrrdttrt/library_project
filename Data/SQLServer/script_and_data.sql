USE [master]
GO
/****** Object:  Database [library]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE DATABASE [library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [library] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [library] SET ARITHABORT OFF 
GO
ALTER DATABASE [library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [library] SET  ENABLE_BROKER 
GO
ALTER DATABASE [library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [library] SET RECOVERY FULL 
GO
ALTER DATABASE [library] SET  MULTI_USER 
GO
ALTER DATABASE [library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'library', N'ON'
GO
ALTER DATABASE [library] SET QUERY_STORE = ON
GO
ALTER DATABASE [library] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [library]
GO
/****** Object:  Schema [library]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE SCHEMA [library]
GO
/****** Object:  Table [library].[admin]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[admin](
	[tkAdmin] [nvarchar](8) NOT NULL,
	[password] [nvarchar](45) NOT NULL,
	[password_hashed] [nvarchar](32) NULL,
	[salt] [nvarchar](32) NULL,
 CONSTRAINT [PK_admin_tkAdmin] PRIMARY KEY CLUSTERED 
(
	[tkAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[chitietphieumuon]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[chitietphieumuon](
	[maPhieuMuon] [nvarchar](7) NOT NULL,
	[IDSach] [nvarchar](9) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [library].[chitietphieunhap]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[chitietphieunhap](
	[maNhap] [nvarchar](8) NULL,
	[maSach] [nvarchar](7) NOT NULL,
	[soLuong] [int] NULL,
	[donGia] [int] NULL,
	[thanhTien] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [library].[chitietphieuxuat]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[chitietphieuxuat](
	[maXuat] [nvarchar](8) NOT NULL,
	[maSach] [nvarchar](7) NOT NULL,
	[soLuong] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [library].[chitietsach]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[chitietsach](
	[IDSach] [nvarchar](9) NOT NULL,
	[maSach] [nvarchar](7) NOT NULL,
	[tinhTrang] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_chitietsach_IDSach] PRIMARY KEY CLUSTERED 
(
	[IDSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[khachhang]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[khachhang](
	[maKhachHang] [nvarchar](8) NOT NULL,
	[hoTen] [nvarchar](45) NOT NULL,
	[ngaySinh] [date] NOT NULL,
	[diaChi] [nvarchar](65) NOT NULL,
	[sdt] [nvarchar](11) NOT NULL,
	[email] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_khachhang_maKhachHang] PRIMARY KEY CLUSTERED 
(
	[maKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[khosach]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[khosach](
	[maSach] [nvarchar](7) NOT NULL,
	[soLuong] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [library].[loaisach]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[loaisach](
	[maSach] [nvarchar](7) NOT NULL,
	[tenSach] [nvarchar](70) NOT NULL,
	[tenTacGia] [nvarchar](45) NOT NULL,
	[tenNXB] [nvarchar](45) NOT NULL,
	[namXB] [int] NOT NULL,
	[theLoai] [nvarchar](45) NOT NULL,
	[ngonNgu] [nvarchar](45) NOT NULL,
	[tomTatNoiDung] [nvarchar](max) NOT NULL,
	[giaTien] [int] NOT NULL,
	[soTrang] [int] NOT NULL,
	[hinhSach] [nvarchar](max) NULL,
	[soLuongTong] [int] NULL,
	[soLuongMuon] [int] NULL,
 CONSTRAINT [PK_loaisach_maSach] PRIMARY KEY CLUSTERED 
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [library].[lydophat]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[lydophat](
	[maLDPhat] [nvarchar](9) NOT NULL,
	[tenLDPhat] [nvarchar](45) NOT NULL,
	[mucDo] [int] NOT NULL,
 CONSTRAINT [PK_lydophat_maLDPhat] PRIMARY KEY CLUSTERED 
(
	[maLDPhat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[nhacungcap]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[nhacungcap](
	[maNCC] [nvarchar](9) NOT NULL,
	[tenNCC] [nvarchar](45) NOT NULL,
	[sdt] [nvarchar](11) NOT NULL,
	[email] [nvarchar](45) NOT NULL,
	[diaChi] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_nhacungcap_maNCC] PRIMARY KEY CLUSTERED 
(
	[maNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[nhanvien]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[nhanvien](
	[maNhanVien] [nvarchar](8) NOT NULL,
	[password] [nvarchar](45) NOT NULL,
	[password_hashed] [nvarchar](32) NULL,
	[salt] [nvarchar](32) NULL,
	[hoTen] [nvarchar](45) NOT NULL,
	[ngaySinh] [date] NOT NULL,
	[diaChi] [nvarchar](65) NOT NULL,
	[sdt] [nvarchar](11) NOT NULL,
	[email] [nvarchar](45) NOT NULL,
	[chucVu] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_nhanvien_maNhanVien] PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[phieumuon]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[phieumuon](
	[maPhieuMuon] [nvarchar](7) NOT NULL,
	[maThe] [nvarchar](7) NOT NULL,
	[ngayMuon] [date] NOT NULL,
	[thoiGianMuon] [int] NOT NULL,
	[ngayTra] [date] NULL,
 CONSTRAINT [PK_phieumuon_maPhieuMuon] PRIMARY KEY CLUSTERED 
(
	[maPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[phieunhap]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[phieunhap](
	[maNhap] [nvarchar](8) NOT NULL,
	[ngayNhap] [date] NOT NULL,
	[maNhanVien] [nvarchar](8) NOT NULL,
	[maNCC] [nvarchar](9) NOT NULL,
	[tongSoLuong] [int] NULL,
	[tongTien] [int] NULL,
 CONSTRAINT [PK_phieunhap_maNhap] PRIMARY KEY CLUSTERED 
(
	[maNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[phieuphat]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[phieuphat](
	[maPhieuPhat] [nvarchar](7) NOT NULL,
	[maPhieuMuon] [nvarchar](7) NOT NULL,
	[tienPhat] [int] NULL,
	[maLDPhat] [nvarchar](9) NULL,
 CONSTRAINT [PK_phieuphat_maPhieuPhat] PRIMARY KEY CLUSTERED 
(
	[maPhieuPhat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[phieuxuat]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[phieuxuat](
	[maXuat] [nvarchar](8) NOT NULL,
	[ngayXuat] [date] NOT NULL,
	[maNhanVien] [nvarchar](8) NOT NULL,
	[tongSoLuong] [int] NULL,
 CONSTRAINT [PK_phieuxuat_maXuat] PRIMARY KEY CLUSTERED 
(
	[maXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[quyen]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[quyen](
	[maQuyen] [nvarchar](7) NOT NULL,
	[tenQuyen] [nvarchar](45) NOT NULL,
	[chitietQuyen] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_quyen_maQuyen] PRIMARY KEY CLUSTERED 
(
	[maQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [library].[the]    Script Date: 12/15/2024 3:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[the](
	[maThe] [nvarchar](7) NOT NULL,
	[maKhachhang] [nvarchar](8) NULL,
	[ngayCap] [date] NOT NULL,
	[ngayHetHan] [date] NOT NULL,
 CONSTRAINT [PK_the_maThe] PRIMARY KEY CLUSTERED 
(
	[maThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [library].[admin] ([tkAdmin], [password], [password_hashed], [salt]) VALUES (N'1', N'1', N'1', N'1')
GO
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000001', N'IDS000001')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000001', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000002', N'IDS000004')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000002', N'IDS000005')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000003', N'IDS000008')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000003', N'IDS000009')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000004', N'IDS000012')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000004', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000005', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000005', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000006', N'IDS000019')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000006', N'IDS000020')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000007', N'IDS000023')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000007', N'IDS000024')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000008', N'IDS000030')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000008', N'IDS000031')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000009', N'IDS000038')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000009', N'IDS000039')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000010', N'IDS000053')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000010', N'IDS000054')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000011', N'IDS000026')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000011', N'IDS000027')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000012', N'IDS000070')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000012', N'IDS000071')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000013', N'IDS000064')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000013', N'IDS000065')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000014', N'IDS000067')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000014', N'IDS000068')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000015', N'IDS000076')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000015', N'IDS000077')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000016', N'IDS000058')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000016', N'IDS000059')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000017', N'IDS000045')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000017', N'IDS000046')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000018', N'IDS000078')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000018', N'IDS000077')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000019', N'IDS000063')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000019', N'IDS000064')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000020', N'IDS000029')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000020', N'IDS000030')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000021', N'IDS000047')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000021', N'IDS000048')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000022', N'IDS000056')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000022', N'IDS000057')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000023', N'IDS000015')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000023', N'IDS000016')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000024', N'IDS000025')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000024', N'IDS000026')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000025', N'IDS000008')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000025', N'IDS000009')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000026', N'IDS000017')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000026', N'IDS000018')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000027', N'IDS000001')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000027', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000028', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000028', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000029', N'IDS000018')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000029', N'IDS000019')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000030', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000030', N'IDS000015')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000031', N'IDS000016')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000031', N'IDS000017')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000032', N'IDS000018')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000032', N'IDS000019')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000033', N'IDS000020')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000033', N'IDS000021')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000034', N'IDS000062')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000034', N'IDS000063')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000035', N'IDS000057')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000035', N'IDS000058')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000036', N'IDS000076')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000036', N'IDS000077')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000037', N'IDS000003')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000037', N'IDS000004')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000038', N'IDS000010')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000038', N'IDS000011')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000039', N'IDS000030')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000039', N'IDS000031')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000040', N'IDS000027')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000040', N'IDS000028')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000041', N'IDS000060')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000041', N'IDS000061')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000042', N'IDS000045')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000042', N'IDS000046')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000043', N'IDS000070')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000043', N'IDS000071')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000044', N'IDS000019')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000044', N'IDS000020')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000045', N'IDS000060')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000045', N'IDS000061')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000046', N'IDS000004')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000046', N'IDS000005')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000047', N'IDS000062')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000047', N'IDS000063')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000048', N'IDS000027')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000048', N'IDS000028')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000049', N'IDS000010')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000049', N'IDS000011')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000050', N'IDS000033')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000050', N'IDS000034')
GO
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000051', N'IDS000005')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000051', N'IDS000006')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000052', N'IDS000075')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000052', N'IDS000076')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000053', N'IDS000028')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000053', N'IDS000029')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000054', N'IDS000066')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000054', N'IDS000067')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000055', N'IDS000022')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000055', N'IDS000023')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000056', N'IDS000038')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000056', N'IDS000039')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000057', N'IDS000048')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000057', N'IDS000049')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000058', N'IDS000076')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000058', N'IDS000077')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000059', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000059', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000060', N'IDS000003')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000060', N'IDS000004')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000061', N'IDS000008')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000061', N'IDS000009')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000062', N'IDS000007')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000062', N'IDS000010')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000063', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000063', N'IDS000015')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000064', N'IDS000025')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000064', N'IDS000026')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000065', N'IDS000030')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000065', N'IDS000031')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000066', N'IDS000040')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000066', N'IDS000041')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000067', N'IDS000045')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000067', N'IDS000046')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000068', N'IDS000050')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000068', N'IDS000051')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000069', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000069', N'IDS000003')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000070', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000070', N'IDS000015')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000071', N'IDS000009')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000071', N'IDS000010')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000072', N'IDS000024')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000072', N'IDS000025')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000073', N'IDS000026')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000073', N'IDS000027')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000074', N'IDS000035')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000074', N'IDS000036')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000075', N'IDS000005')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000075', N'IDS000006')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000076', N'IDS000010')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000076', N'IDS000011')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000077', N'IDS000012')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000077', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000078', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000078', N'IDS000015')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000079', N'IDS000078')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000079', N'IDS000077')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000080', N'IDS000061')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000080', N'IDS000062')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000081', N'IDS000001')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000081', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000082', N'IDS000009')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000082', N'IDS000010')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000083', N'IDS000020')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000083', N'IDS000021')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000084', N'IDS000004')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000084', N'IDS000005')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000085', N'IDS000045')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000085', N'IDS000046')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000086', N'IDS000015')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000086', N'IDS000016')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000087', N'IDS000008')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000087', N'IDS000009')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000088', N'IDS000048')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000088', N'IDS000049')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000089', N'IDS000069')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000089', N'IDS000068')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000090', N'IDS000010')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000090', N'IDS000011')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000091', N'IDS000023')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000091', N'IDS000024')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000092', N'IDS000061')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000092', N'IDS000062')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000093', N'IDS000048')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000093', N'IDS000049')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000094', N'IDS000070')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000094', N'IDS000071')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000095', N'IDS000034')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000095', N'IDS000035')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000096', N'IDS000075')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000096', N'IDS000076')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000097', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000097', N'IDS000003')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000098', N'IDS000020')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000098', N'IDS000021')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000099', N'IDS000035')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000099', N'IDS000036')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000100', N'IDS000006')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000100', N'IDS000007')
GO
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000101', N'IDS000050')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000101', N'IDS000051')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000102', N'IDS000008')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000102', N'IDS000009')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000103', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000103', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000104', N'IDS000015')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000104', N'IDS000016')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000105', N'IDS000060')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000105', N'IDS000061')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000106', N'IDS000046')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000106', N'IDS000047')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000107', N'IDS000001')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000107', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000108', N'IDS000069')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000108', N'IDS000068')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000108', N'IDS000007')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000108', N'IDS000008')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000109', N'IDS000021')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000109', N'IDS000022')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000110', N'IDS000042')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000110', N'IDS000043')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000111', N'IDS000027')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000111', N'IDS000028')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000112', N'IDS000039')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000112', N'IDS000038')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000113', N'IDS000012')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000113', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000114', N'IDS000054')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000114', N'IDS000055')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000115', N'IDS000075')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000115', N'IDS000076')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000116', N'IDS000006')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000116', N'IDS000007')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000117', N'IDS000034')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000117', N'IDS000035')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000118', N'IDS000055')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000118', N'IDS000056')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000119', N'IDS000022')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000119', N'IDS000023')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000120', N'IDS000050')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000120', N'IDS000051')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000121', N'IDS000037')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000121', N'IDS000038')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000122', N'IDS000026')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000122', N'IDS000027')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000123', N'IDS000007')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000123', N'IDS000008')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000124', N'IDS000063')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000124', N'IDS000064')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000125', N'IDS000023')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000125', N'IDS000024')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000126', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000126', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000127', N'IDS000016')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000127', N'IDS000017')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000128', N'IDS000030')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000128', N'IDS000031')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000129', N'IDS000046')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000129', N'IDS000047')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000130', N'IDS000062')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000130', N'IDS000063')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000131', N'IDS000007')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000131', N'IDS000008')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000132', N'IDS000027')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000132', N'IDS000028')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000133', N'IDS000044')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000133', N'IDS000045')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000134', N'IDS000004')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000134', N'IDS000005')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000135', N'IDS000057')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000135', N'IDS000058')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000136', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000136', N'IDS000015')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000137', N'IDS000033')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000137', N'IDS000034')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000138', N'IDS000050')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000138', N'IDS000051')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000139', N'IDS000001')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000139', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000140', N'IDS000034')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000140', N'IDS000035')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000141', N'IDS000009')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000141', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000142', N'IDS000032')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000142', N'IDS000033')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000143', N'IDS000049')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000143', N'IDS000042')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000143', N'IDS000062')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000143', N'IDS000063')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000145', N'IDS000037')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000145', N'IDS000038')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000146', N'IDS000076')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000146', N'IDS000077')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000147', N'IDS000069')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000147', N'IDS000065')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000148', N'IDS000064')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000148', N'IDS000066')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000149', N'IDS000019')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000149', N'IDS000012')
GO
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000150', N'IDS000040')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000150', N'IDS000041')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000151', N'IDS000078')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000151', N'IDS000077')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000152', N'IDS000030')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000152', N'IDS000031')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000153', N'IDS000004')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000153', N'IDS000005')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000154', N'IDS000017')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000154', N'IDS000018')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000155', N'IDS000024')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000155', N'IDS000025')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000156', N'IDS000070')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000156', N'IDS000071')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000157', N'IDS000001')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000157', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000158', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000158', N'IDS000014')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000159', N'IDS000022')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000159', N'IDS000023')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000160', N'IDS000018')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000160', N'IDS000019')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000161', N'IDS000005')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000161', N'IDS000006')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000162', N'IDS000046')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000162', N'IDS000047')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000163', N'IDS000066')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000163', N'IDS000067')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000164', N'IDS000036')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000164', N'IDS000037')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000165', N'IDS000062')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000165', N'IDS000063')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000166', N'IDS000002')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000166', N'IDS000004')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000167', N'IDS000040')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000167', N'IDS000041')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000168', N'IDS000013')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000168', N'IDS000017')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000169', N'IDS000051')
INSERT [library].[chitietphieumuon] ([maPhieuMuon], [IDSach]) VALUES (N'M000169', N'IDS000052')
GO
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000001', 3, 189000, 567000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000003', 3, 100000, 300000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000005', 17, 135000, 2295000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000007', 3, 160000, 480000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000009', 3, 297000, 891000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000011', 3, 320000, 960000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000013', 3, 108000, 324000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000015', 3, 136000, 408000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000017', 3, 72000, 216000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000019', 3, 143000, 429000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000021', 3, 60000, 180000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000001', N'S000023', 3, 57000, 171000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000002', 7, 90000, 630000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000004', 7, 265000, 1855000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000006', 14, 125000, 1750000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000008', 13, 200000, 2600000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000010', 10, 330000, 3300000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000012', 7, 535000, 3745000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000014', 7, 265000, 1855000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000016', 7, 83000, 581000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000018', 7, 150000, 1050000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000020', 7, 44000, 308000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000022', 7, 43000, 301000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000002', N'S000024', 7, 39000, 273000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000001', 3, 189000, 567000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000002', 3, 90000, 270000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000003', 3, 100000, 300000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000004', 3, 265000, 795000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000005', 3, 135000, 405000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000006', 3, 125000, 375000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000007', 3, 160000, 480000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000008', 3, 200000, 600000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000009', 3, 297000, 891000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000010', 3, 330000, 990000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000011', 3, 320000, 960000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000012', 3, 535000, 1605000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000013', 3, 108000, 324000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000014', 3, 265000, 795000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000015', 3, 136000, 408000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000016', 3, 83000, 249000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000017', 3, 72000, 216000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000018', 3, 150000, 450000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000019', 3, 143000, 429000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000020', 3, 44000, 132000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000021', 3, 60000, 180000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000022', 3, 43000, 129000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000023', 3, 57000, 171000)
INSERT [library].[chitietphieunhap] ([maNhap], [maSach], [soLuong], [donGia], [thanhTien]) VALUES (N'N0000003', N'S000024', 3, 39000, 117000)
GO
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000001', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000002', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000003', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000004', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000005', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000006', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000007', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000008', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000009', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000010', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000011', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000012', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000013', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000014', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000015', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000016', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000017', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000018', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000019', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000020', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000021', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000022', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000023', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000001', N'S000024', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000001', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000002', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000003', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000004', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000005', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000006', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000007', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000008', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000009', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000010', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000011', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000012', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000013', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000014', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000015', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000016', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000017', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000018', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000019', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000020', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000021', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000022', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000023', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000002', N'S000024', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000003', N'S000005', 2)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000003', N'S000006', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000003', N'S000007', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000003', N'S000008', 1)
INSERT [library].[chitietphieuxuat] ([maXuat], [maSach], [soLuong]) VALUES (N'X0000003', N'S000010', 1)
GO
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000001', N'S000001', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000002', N'S000001', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000003', N'S000001', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000004', N'S000002', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000005', N'S000002', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000006', N'S000002', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000007', N'S000003', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000008', N'S000003', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000009', N'S000003', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000010', N'S000004', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000011', N'S000004', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000012', N'S000004', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000013', N'S000005', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000014', N'S000005', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000015', N'S000005', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000016', N'S000005', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000017', N'S000005', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000018', N'S000006', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000019', N'S000006', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000020', N'S000006', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000021', N'S000006', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000022', N'S000007', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000023', N'S000007', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000024', N'S000007', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000025', N'S000007', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000026', N'S000008', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000027', N'S000008', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000028', N'S000008', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000029', N'S000008', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000030', N'S000009', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000031', N'S000009', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000032', N'S000009', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000033', N'S000010', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000034', N'S000010', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000035', N'S000010', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000036', N'S000010', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000037', N'S000011', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000038', N'S000011', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000039', N'S000011', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000040', N'S000012', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000041', N'S000012', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000042', N'S000012', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000043', N'S000013', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000044', N'S000013', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000045', N'S000013', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000046', N'S000014', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000047', N'S000014', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000048', N'S000014', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000049', N'S000015', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000050', N'S000015', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000051', N'S000015', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000052', N'S000016', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000053', N'S000016', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000054', N'S000016', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000055', N'S000017', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000056', N'S000017', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000057', N'S000017', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000058', N'S000018', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000059', N'S000018', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000060', N'S000018', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000061', N'S000019', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000062', N'S000019', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000063', N'S000019', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000064', N'S000020', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000065', N'S000020', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000066', N'S000020', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000067', N'S000021', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000068', N'S000021', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000069', N'S000021', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000070', N'S000022', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000071', N'S000022', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000072', N'S000022', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000073', N'S000023', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000074', N'S000023', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000075', N'S000023', N'Cũ')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000076', N'S000024', N'Tốt')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000077', N'S000024', N'Bình Thường')
INSERT [library].[chitietsach] ([IDSach], [maSach], [tinhTrang]) VALUES (N'IDS000078', N'S000024', N'Cũ')
GO
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000001', N'Nguyễn Thùy Chi', CAST(N'1999-01-29' AS Date), N'Tỉnh Lộ 1, Quận Hoàn Kiếm, TP Hà Nội', N'0321589102', N'thuychi@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000002', N'Nguyễn Minh Khang', CAST(N'2000-02-12' AS Date), N'Nguyễn Thái Học, Quận Đống Đa, TP Hà Nội', N'0951786905', N'khangnguyen@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000003', N'Lê Bảo Trân', CAST(N'1997-11-22' AS Date), N'Lê Trọng Tấn, Quận Thanh Xuân, TP Hà Nội', N'0985327812', N'baotran@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000004', N'Lê Quốc Bình', CAST(N'2001-09-22' AS Date), N'Trần Phú, Quận Ba Đình, TP Hà Nội', N'0904281742', N'binhle@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000005', N'Phạm Diệu Linh', CAST(N'1998-09-09' AS Date), N'Ngô Gia Tự, Quận Long Biên, TP Hà Nội', N'0762190538', N'dieulinh@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000006', N'Phạm Hùng Cường', CAST(N'1996-08-27' AS Date), N'Lê Văn Lương, Quận Nam Từ Liêm, TP Hà Nội', N'0351298632', N'cuongpham@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000007', N'Đặng Trúc Lâm', CAST(N'1997-06-14' AS Date), N'Đường 19/5, Quận Bắc Từ Liêm, TP Hà Nội', N'0924582906', N'truclam@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000008', N'Đặng Minh Quân', CAST(N'2000-11-23' AS Date), N'Hồ Tùng Mậu, Quận Cầu Giấy, TP Hà Nội', N'0705643219', N'quandang@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000009', N'Đỗ Đan Hạ', CAST(N'1997-09-07' AS Date), N'Trần Hưng Đạo, Quận Hoàn Kiếm, TP Hà Nội', N'0399641785', N'danha@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000010', N'Đỗ Thái Dương', CAST(N'1998-10-10' AS Date), N'Phan Đình Phùng, Quận Ba Đình, TP Hà Nội', N'0761297518', N'duongdo@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000011', N'Hoàng Vân Khánh', CAST(N'1999-08-19' AS Date), N'An Thới Đông, Huyện Cần Giờ, TP HCM', N'0388127529', N'vankhanh@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000012', N'Hoàng Vân Phong', CAST(N'1997-04-02' AS Date), N'Chánh Hưng, Huyện Nhà Bè, TP HCM', N'0982437581', N'phonghoang@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000013', N'Đinh Nhã Uyên', CAST(N'1998-10-24' AS Date), N'Quang Trung, Quận 12, TP HCM', N'0937841679', N'nhauyen@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000014', N'Đinh Gia Khánh', CAST(N'1996-06-11' AS Date), N'Nguyễn Công Trứ, Quận 9, TP HCM', N'0318951479', N'khanhdinh@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000015', N'Phan Mẫn Nhi', CAST(N'1999-05-07' AS Date), N'Nguyễn Tri Phương, Quận 7, TP HCM', N'0985241788', N'nhiphan@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000016', N'Phan Tấn Gia Hưng', CAST(N'1967-12-26' AS Date), N'An Dương Vương, Quận 5, TP HCM', N'0921686578', N'hungphan@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000017', N'Vũ Hà My', CAST(N'2000-08-06' AS Date), N'Tôn Đản, Quận 4, TP HCM', N'0367189002', N'hamy@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000018', N'Vũ Trung Nghĩa', CAST(N'1999-11-20' AS Date), N'Nguyễn Thượng Hiền, Quận #, TP HCM', N'0915738940', N'nghiavu@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000019', N'Huỳnh Ngọc Bích', CAST(N'1998-10-28' AS Date), N'Mạc Đĩnh Chi, Quận 1, TP HCM', N'0974135863', N'ngocbich@gmail.com')
INSERT [library].[khachhang] ([maKhachHang], [hoTen], [ngaySinh], [diaChi], [sdt], [email]) VALUES (N'KH000020', N'Huỳnh Anh Việt', CAST(N'1999-03-08' AS Date), N'Nguyễn Thị Định, Quận 2, TP HCM', N'0357189582', N'viethuynh@gmail.com')
GO
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000001', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000002', 7)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000003', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000004', 7)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000005', 15)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000006', 13)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000007', 2)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000008', 12)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000009', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000010', 9)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000011', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000012', 7)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000013', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000014', 7)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000015', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000016', 7)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000017', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000018', 7)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000019', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000020', 7)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000021', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000022', 7)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000023', 3)
INSERT [library].[khosach] ([maSach], [soLuong]) VALUES (N'S000024', 7)
GO
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000001', N'Tập Tục Đời Người', N'Phan Cẩm Thượng', N'Nhà Xuất Bản Hội Nhà Văn', 2017, N'Sách Văn Hóa', N'Tiếng Việt', N'“Bạn đang cầm trên tay cuốn thứ hai trong một bộ sách của Phan Cẩm Thượng […] gồm bốn cuốn, sẽ hoàn thành trong 4 đến 5 năm nữa. Một bộ sử Việt Nam. Nhưng cần nói rõ: không phải lịch sử nước Việt với tư cách một quốc gia, mà là lịch sử người Việt Nam trong cuộc sống làm người hằng ngày của họ. Phan Cẩm Thượng không viết về các triều đại hưng suy, các cuộc chiến tranh thắng thua khốc liệt, các biến cố chính trị được coi là trọng đại … như ta thường gặp trong những bộ quốc sử nghiêm trang. Ở đây ta gặp một cái khác, nhỏ nhoi hơn, thường nhật và gần gũi hơn (nhưng kỳ vậy, lại ít được biết đến hơn): những con người. Con người Việt Nam. Phan Cẩm Thượng cho thấy còn có một lịch sử khác nữa như vậy của đất nước này mà ta chưa thật biết, song lại cũng quan trọng không kém, nếu không hơn. Vâng, có thể còn hơn, bởi vì con người phải sống như thế này, làm những cái này trước, rồi mới có thể làm những cái được coi là trọng đại kia. Mới có thể làm nên Lịch sử ‘lớn’. Hoặc nói cho cùng, những cái to lớn, trọng đại kia, theo cách nào đó rất có thể do chính những cái này chi phối, thậm chí đến quyết định. Vì nó có trước. Nó là cái nền. Nó bền bỉ và lâu dài hơn các triều đại và các chế độ.”', 189000, 611, N'../images/Hinhsach/S000001.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000002', N'Việt Nam Phong Tục', N'Phan Kế Bính', N'Nhà Xuất Bản Hồng Đức', 2019, N'Sách Văn Hóa', N'Tiếng Việt', N'Từ Phong tục trong gia tộc, Phong tục xóm làng (hương đảng) đến các phong tục ngoài xã hội, VIỆT NAM PHONG TỤC của học giả PHAN KẾ BÍNH là một bộ biên khảo tương đối đầy đủ về các phong tục tập quán cũ của nước Việt. Là một nhà nho uyên bác mang tư tưởng tân tiến, tác giả không chỉ mô tả từng tập tục, mà còn về gốc tích, nguyên ủy cái tục ấy, nhìn nhận, đánh giá để xem nó hay hay dở, từ đó "xét điều gì quá tệ mà bỏ bớt đi, rồi lâu lâu mới đem cái tục hay mà bổ hết cho cái tục dở. Còn tục gì hay mà là quốc túy của ta thì cứ giữ lấy". Đến nay, tập sách gần một trăm năm tuổi này vẫn là một trong những công trình khảo cứu có giá trị bậc nhất về các phong tục tập quán trên đất nước ta và nhiều vấn đề được PHAN KẾ BÍNH nhắc tới vẫn nóng hổi tính thời đại.', 90000, 306, N'../images/Hinhsach/S000002.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000003', N' Văn Hóa Tín Ngưỡng Việt Nam', N'Nguyễn Hạnh', N'Nhà Xuất Bản Trẻ', 2020, N'Sách Văn Hóa', N'Tiếng Việt', N'Tác phẩm Văn Hóa Tín Ngưỡng Việt Nam của tác giả Nguyễn Hạnh là tác phẩm biên khảo về tín ngưỡng của người Việt khởi từ thời dựng nước với khái niệm thờ: Trời, đất, tổ tiên. Những niềm tin dân gian của ông bà ta xưa vẫn còn lưu truyền đến ngày nay thông qua kho tàng ca dao.Tiếp đến là sự giao thoa văn hóa với 4 tôn giáo lớn ở Việt Nam là Nho, Phật, Lão, Công Giáo. Chính sự giao thoa giữa tín ngưỡng dân gian Việt Nam và 4 tôn giáo lớn này đã hình thành nên nhiều tôn giáo bản địa như Cao Đài, Hòa Hảo, Hòa Đồng Tôn Giáo. Sự giao thoa, tiếp thu và chọn lọc đó đã làm nên một đặc sắc trong chiều kích tâm linh đó là các tôn giáo du nhập phải được điều chỉnh và chứa đựng được yếu tố tín ngưỡng của người Việt. Chính những ảnh hưởng giao thoa này góp phần tạo nên bản sắc văn hóa, tín ngưỡng của người Việt xuyên suốt từ thuở dựng nước đến nay. Tác phẩm Văn Hóa Tín Ngưỡng Việt Nam sẽ góp phần làm phong phú thêm Tủ sách Triết học phương Đông của NXB Trẻ và là quyển sách cần thiết cho độc giả tìm hiểu về cội nguồn tín ngưỡng của người Việt.', 100000, 232, N'../images/Hinhsach/S000003.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000004', N'Nghề Cổ Nước Việt Từ Truyền Thống Đến Hiện Đại', N'Vũ Từ Trang', N'Nhà Xuất Bản Phụ Nữ', 2020, N'Sách Văn Hóa', N'Tiếng Việt', N'“Trong suốt hai trăm năm công nghiệp hóa và đô thị hóa, nhân loại mất đi nhiều nghề thủ công truyền thống không bao giờ phục hồi lại được nữa. Cho đến xã hội thông tin và công nghệ toàn cầu hiện nay, với sự phát triển toàn diện của ngành design, các nghề thủ công cổ được nhìn nhận lại, trước tiên phục vụ cho công việc bảo tồn di sản vật thể và phi vật thể, sau đó là những ngành design thủ công và độc bản cũng có cơ hội kinh doanh. Việt Nam không nằm ngoài vấn đề này, mặc dù công nghiệp của nước ta chậm phát triển, chỉ trong thế kỷ 20, nhưng do chiến tranh, những chính sách kinh tế không thích hợp, nhiều làng nghề thủ công và nghệ thủ công truyền thống cũng suy thoái và biến mất.

Cho đến nay, không có một thống kê chính xác Việt Nam từng có bao nhiêu làng nghề, phường nghề và nghề thủ công truyền thống, cái nào mất, cái nào còn, cái nào biến đổi trong cơ giới hóa và dây chuyền, gần đây còn là áp dụng công nghệ, ví dụ tiện chạm công nghệ theo mẫu mã, hoặc in 3D. Sách về làng nghề và thủ công truyền thống không nhiều và cũng chưa thật đi sâu vào chuyên môn mang tính kỹ thuật, lý do là ngành nghiên cứu Việt Nam không có truyền thống và rất hạn chế về đầu tư, những người biết nghề thì có xu hướng giữ kín nghề nghiệp, nên không bao giờ công bố các công thức và kỹ nghệ, những người viết về làng nghề và nghề thủ công chủ yếu là các nhà văn hóa có hạn chế nhất định về tay nghề và cũng chẳng có ai có thể nắm được mọi kỹ thuật nghề nghiệp mà viết từng nghề cho rành rọt. Đây là công việc của nhiều thế hệ và nhiều người. Việc những nhà văn hóa viết về làng nghề và nghề thủ công đã là quý lắm, bởi họ có ý thức giữ gìn truyền thống trong khả năng có thể.

Cuốn Nghề cổ nước Việt – từ truyền thống đến hiện đại” của Vũ Từ Trang, ra mắt trong năm nay, do Nhà xuất bản Phụ nữ ấn hành, là một công trình đáng kể, sau nhiều năm hoạt động văn chương và nghiên cứu văn hóa của tác giả. Ông xuất thân là một trí thức làng Sặt (Trang Liệt) ở Từ Sơn, Bắc Ninh, quê hương của nhiều di sản văn hóa và làng nghề, nguyên việc khảo cứu làng nghề Kinh Bắc xưa đối với ông là hoàn toàn thuận lợi và các làng nghề Kinh Bắc cũng cởi mở hơn rất nhiều nơi khác trong việc cung cấp thông tin cho người nghiên cứu. Vũ Từ Trang từng 20 năm làm phóng viên chuyên theo dõi và viết về đề tài tiểu thủ công nghiệp. Từng được đi hầu hết các làng nghề thủ công truyền thống.

Tập sách với 25 nghề cổ...', 265000, 700, N'../images/Hinhsach/S000004.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000005', N'Giáo Trình Kỹ Thuật Lập Trình C Căn Bản Và Nâng Cao', N'GS. Phạm Văn Ất', N'Nhà Xuất Bản Bách Khoa Hà Nội', 2018, N'Sách Công Nghệ Thông Tin', N'Tiếng Việt', N'Giáo trình kỹ thuật lập trình C căn bản và nâng cao được hình thành qua nhiều năm giảng dạy của các tác giả. Ngôn ngữ lập trình C là một môn học cơ sở trong chương trình đào tạo kỹ sư, cử nhân tin học của nhiều trường đại học. Ở đây sinh viên được trang bị những kiến thức cơ bản nhất về lập trình, các kỹ thuật  tổ chức dữ liệu và lập trình căn bản với ngôn ngữ C.

Để đáp ứng nhu cầu học tập ngôn ngữ lập trình C của sinh viên cũng như nhu cầu về tài liệu cho mọi người trong nhiều ngành khoa học và kỹ thuật cần nghiên cứu C để giải quyết các bài toán của mình, tác giả biên soạn cuốn sách này. Nội dung cuốn sách là tập hợp một cách có chọn lọc các bài giảng của các tác giả.', 135000, 440, N'../images/Hinhsach/S000005.png', 5, 2)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000006', N'Lập Trình Với C#', N'Phạm Quang Huy', N'Nhà Xuất Bản Thanh Niên', 2019, N'Sách Công Nghệ Thông Tin', N'Tiếng Việt', N'Hướng dẫn người học từng bước lập trình với C#. Xây dựng ứng dụng trên Window Form.
Xây dựng ứng dụng, tạo hai trang web quản lý bán hàng và quản lý tuyển sinh với các hướng dẫn từng bước làm cơ sở cho việc thiết kế các trang web phức tạp hơn.
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...', 125000, 392, N'../images/Hinhsach/S000006.png', 4, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000007', N'Lập Trình Hệ Thống Thương Mại Điện Tử', N'Phạm Quang Hiển', N'Nhà Xuất Bản Thanh Niên', 2019, N'Sách Công Nghệ Thông Tin', N'Tiếng Việt', N'Thương mại điện tử là gì? Là quá trình tiến hành một phần hay toàn bộ hoạt động thương mại thông qua những phương tiện điện tử hiện đại. Về bản chất, thương mại điện tử không thay đổi so với các hoạt động thương mại truyền thống. Tuy nhiên, bằng các phương tiện điện tử mới, các hoạt động giao dịch, mua bán, quảng bá được thực hiện nhanh chóng, hiệu quả hơn, giúp tiết kiệm chi phí và mở rộng phạm vi kinh doanh.
Với những kiến thức và thế mạnh về xây dựng chiến lược kinh doanh, kỹ năng nghiệp vụ liên quan trong lĩnh vực công nghệ, tin học, ngoại ngữ, sinh viên tốt nghiệp ngành Thương mại điện tử có rất nhiều cơ hội việc làm hấp dẫn từ Phòng marketing; Phòng nghiệp vụ kinh doanh; Phòng kế hoạch; Phòng tin họở các công ty, tập đoàn trong và ngoài nước.', 160000, 582, N'../images/Hinhsach/S000007.png', 4, 2)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000008', N'Sách Lập Trình Với Scratch 3.0', N'Nguyễn Hữu Hưng', N'Nhà Xuất Bản Đại Học Quốc Gia Hà Nội', 2017, N'Sách Công Nghệ Thông Tin', N'Tiếng Việt', N'Mục đích cuốn sách
Giới thiệu về ngôn ngữ lập trình kéo thả phổ biến nhất thế giới cho học sinh phổ thông, Scratch 3.0 (phiên bản mới, phát hành năm 2019). Cuốn sách kế thừa hoàn toàn những quan điểm về nội dung, cách trình bày của cuốn sách “Lập trình với Scratch” xuất bản năm 2016 tại NXBGD (viết cho phiên bản Scratch 2.0), đồng thời bổ sung những thông tin mới về giao diện, cách lập trình cũng như các khối lệnh của phiên bản Scratch 3.0. Giúp người học nhanh chóng làm chủ hoàn toàn cách sử dụng Scratch 3.0 thông qua từng bước hướng dẫn thiết kế và lập trình ra 05 chương trình mẫu theo cấp độ từ dễ đến khó. Trên cơ sở đó người học có thể tự tạo ra các ứng dụng trò chơi, ứng dụng hỗ trợ học tập nghiên cứu hoặc đơn giản như làm tấm thiệp hay bộ phim hoạt hình, tùy theo trình độ cũng như  ý tưởng của riêng mình.
Tầm quan trọng của bộ môn lập trình kéo thả
Cuốn sách được xuất bản điện tử và chia sẻ công khai bản PDF nhằm mục đích đồng hành và dẫn dắt các em tiến tới kỷ nguyên mới, kỷ nguyên 4.0 - thời đại của robot và trí tuệ nhân tạo phát triển. Trong thời đại này, lập trình không chỉ là môn học thiết yếu mà còn là kỹ năng cơ bản và cũng được đánh giá quan trọng không khác gì kỹ năng đọc và viết. Lập Trình đang trở thành một môn học mới và được phổ cập tại nhiều quốc gia trên thế giới trong đó có Việt Nam.
Mô tả
Cuốn sách viết về ngôn ngữ lập trình Scratch với phiên bản Scratch 3.0 (phiên bản mới)  theo quan điểm: Thực hành - Trải nghiệm - Trực quan với những ví dụ được sử dụng trong cuốn sách đều rất gần gũi với học sinh. Việc lập trình những sản phẩm gắn với thực tế sẽ kích thích các em nhỏ tìm tòi, khám phá những sự vật xung quanh mình. Ngoài các sản phẩm gắn với thực tế và một số trò chơi thú vị học sinh hoàn toàn có thể tạo ra những sản phẩm hỗ trợ trong việc học tập các môn học như: Toán, Lý, Hóa, Ngữ Văn,.. Đồng thời thông qua việc thực hành tạo ra các sản phẩm trong cuốn sách các em có thể hiểu được những kiến thức cơ bản về bộ môn lập trình như những kiến thức về vòng lặp, biến, hàm,… một cách dễ dàng, gần gũi nhất.
Sau mỗi bài học nội dung kiến thức sẽ được tóm tắt, minh họa bằng những hình ảnh sinh động đi kèm với phần bài tập nhằm củng cố và nâng cao kiến thức học sinh đã được tìm hiểu trong bài học.', 200000, 190, N'../images/Hinhsach/S000008.png', 4, 2)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000009', N'All About Biology', N'Robert Wintons', N'DK Publishing', 2016, N'Sách Khoa Học Công Nghệ', N'Tiếng Anh', N'What makes Earth an ideal place for life to survive? Professor Robert Winston will take kids back to Earth''s beginnings showing how organisms live and survive in All About Biology. From the very big to the microscopic, meet the animals, plants, fungi and bacteria that play an important role in sustaining life on Earth.

Packed with colourful images, facts and stats, All About Biology introduces the features and characteristics of the six main kingdoms of life. Help your child discover how life began and just what it means to be alive today.', 297000, 96, N'../images/Hinhsach/S000009.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000010', N'Big Data', N'Timandra Harkness', N'Bloomsbury', 2018, N'Sách Công Nghệ Thông Tin', N'Tiếng Anh', N'What is Big Data, and why should you care?

Big data knows where you''ve been and who your friends are. It knows what you like and what makes you angry. It can predict what you''ll buy, where you''ll be the victim of crime and when you''ll have a heart attack. Big data knows you better than you know yourself, or so it claims.

But how well do you know big data?

You''ve probably seen the phrase in newspaper headlines, at work in a marketing meeting, or on a fitness-tracking gadget. But can you understand it without being a Silicon Valley nerd who writes computer programs for fun?

Yes. Yes, you can.

Timandra Harkness writes comedy, not computer code. The only programmes she makes are on the radio. If you can read a newspaper you can read this book.

Starting with the basics - what IS data? And what makes it big? - Timandra takes you on a whirlwind tour of how people are using big data today: from science to smart cities, business to politics, self-quantification to the Internet of Things.

Finally, she asks the big questions about where it''s taking us; is it too big for its boots, or does it think too small? Are you a data point or a human being? Will this book be full of rhetorical questions?

No. It also contains puns, asides, unlikely stories and engaging people, inspiring feats and thought-provoking dilemmas. Leaving you armed and ready to decide what you think about one of the decade''s big ideas: big data.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...', 330000, 320, N'../images/Hinhsach/S000010.png', 4, 0)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000011', N'How Not To Be Wrong: The Hidden Maths Of Everyday Life', N'Jordan Ellenberg', N'Penguin Random House UK', 2015, N'Sách Khoa Học Công Nghệ', N'Tiếng Anh', N'THE SUNDAY TIMES BESTSELLER

The maths we learn in school can seem like an abstract set of rules, laid down by the ancients and not to be questioned. In fact, Jordan Ellenberg shows us, maths touches on everything we do, and a little mathematical knowledge reveals the hidden structures that lie beneath the world''s messy and chaotic surface. In How Not to be Wrong, Ellenberg explores the mathematician''s method of analyzing life, from the everyday to the cosmic, showing us which numbers to defend, which ones to ignore, and when to change the equation entirely. Along the way, he explains calculus in a single page, describes Gödel''s theorem using only one-syllable words, and reveals how early you actually need to get to the airport.', 320000, 468, N'../images/Hinhsach/S000011.png', 3, 0)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000012', N'The Wonderful Wizard Of Oz: A Commemorative Pop-Up', N'Robert Sabuda', N'Simon And Schuster', 2001, N'Sách Thiếu Nhi', N'Tiếng Anh', N'Robert Sabuda has created a resplendent pop-up version of The Wonderful Wizard of Oz to celebrate the 100th anniversary of the original publication. This glorious edition is told in a shorter version of L. Frank Baum''s original text, with artwork in the style of W. W. Denslow. With sparkling touches of colored foil and Emerald City eyeglasses, this classic tale is certain to find an honored place on the family bookshelf.', 535000, 16, N'../images/Hinhsach/S000012.png', 3, 0)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000013', N'I-Learn Smart Start 2 Student Book', N'Paperback', N'Nhà Xuất Bản Đại Trường Phát', 2016, N'Sách Học Ngoại Ngữ', N'Tiếng Anh', N'Smart Start is a 5-level course for young learners of English. It has been developed by an experienced team of International and Vietnamese writers and teachers to be a perfect fit for the Vietnamese classroom.

- Solid curriculum

Based on  the Cambridge Young Learner''s syllabus and the Vietnamese Ministry of Education and Training (MOET) guidelines.

- User-friendly lesson format

Clear, consistent, and logical format makes lessons easy to prepare, teach, and understand.

- Proven, mmotivational materials

Catchy songs, colorful comic strips, and fun games catch students'' interest.

- Effective balance of skills

A level appropriate mix of Listening, Speaking, Reading and Writing tasks to systematically develop student abilities.

- Knowledge and culture focus

Core subjects (math, science, geoography, etc.) and moral lessons (be helpful, respect elders, be neat and tidy, etc.) are covered within a Vietnamese cutural setting.

- Test taking skills

Each theme includes excercises that familiarize students with the common tasks they will find on exams like the Cambridge Young Learners exams.', 108000, 128, N'../images/Hinhsach/S000013.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000014', N'Everybody Up 3 Student''s Book', N'Susan Banman Sileci', N'Oxford University Press', 2017, N'Sách Học Ngoại Ngữ', N'Tiếng Anh', N'Everybody Up encourages children to use language in a natural and meaningful way by connecting English to their own lives. Colorful cross-curricular lessons link English to other school subjects. Fun stories teach life lessons such as being kind and polite. Great songs, and the special Everybody Up Friends, motivate children to practice English - even at home! ', 265000, 80, N'../images/Hinhsach/S000014.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000015', N'Diary Of A Wimpy Kid 01: A Novel In Cartoons', N'Jeff Kinney', N'Penguin Random House', 2008, N'Sách Thiếu Nhi', N'Tiếng Anh', N'The hilarious and original global bestseller Diary of a Wimpy Kid - perfect for readers of 8+ and also reluctant readers, everyone loves the adventures of Greg Heffley. Now a major film series, Diary of a Wimpy Kid: The Long Haul is in cinemas now!

Let me get something straight: this is a JOURNAL, not a diary. This was Mom''s idea, not mine. But if she thinks I''m going to write down my "feelings" in here or whatever, she''s crazy.

The only reason I agreed to do this at all is because I figure later on when I''m rich and famous, this book is gonna come in handy.

But for now I''m stuck with a bunch of morons.

Today is the first day of school, so I figured I might as well write in this book to pass the time.

Just don''t expect me to be all "Dear Diary" this and "Dear Diary" that.

Praise for Jeff Kinney:

''The world has gone crazy for Jeff Kinney''s Diary of a Wimpy Kid'' - Sun

''Kinney is right up there with J K Rowling as one of the bestselling children''s authors on the planet'' - Independent

''The most hotly anticipated children''s book of the year is here - Diary of a Wimpy Kid'' - Big Issue

''Hilarious'' - Telegraph', 136000, 224, N'../images/Hinhsach/S000015.png', 3, 0)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000016', N'Các Thế Giới Song Song (Tái Bản 2018)', N'Michio Kaku ', N'Nhà Xuất Bản Thế Giới', 2018, N'Sách Khoa Học Công Nghệ', N'Tiếng Việt', N'Một chuyến du hành đầy trí tuệ qua các vũ trụ, được dẫn dắt tài tình bởi "thuyền trưởng" Michio Kaku và độc giả có dịp chiêm ngưỡng vẻ đẹp kỳ vĩ của vũ trụ kể từ vụ nổ lớn, vượt qua những hố đen, lỗ sâu, bước vào các thế giới lượng tử từ muôn màu kỳ lạ nằm ngay trước mũi chúng ta, vốn dĩ tồn tại song song trên một màng bên ngoài không - thời gian bốn chiều, ngắm nhìn thực tại vật chất quen thuộc hoà quyện với thế giới của những điều kỳ diệu như năng lượng và vật chất tối, sự nảy chồi của các vũ trụ, những chiều không gian bí ẩn và sự biến ảo của các dây rung siêu nhỏ...

Dẫn chuyện lôi cuốn, kết hợp tường minh, sống động một lượng thông tin đồ sộ để khai mở những giới hạn tột cùng của trí  tưởng tượng, Kaku thực sự xứng đáng là " nhà truyền giáo" vĩ đại đã mang thế giới vật lý lý thuyết tới quảng đại quần chúng.', 83000, 480, N'../images/Hinhsach/S000016.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000017', N'Toán Học, Một Thiên Tiểu Thuyết', N'Mickael Launay ', N'Nhà Xuất Bản Thế Giới', 2019, N'Sách Khoa Học Công Nghệ', N'Tiếng Việt', N'Hầu hết mọi người đều thích toán, tiếc là họ không biết điều này!

Bởi ai mà chẳng thấy hấp dẫn với những mẩu chuyện kỳ thú về toán: như “giáo phái” toán học kỳ lạ của Pythagoras thời cổ đại hay những cuộc thăm dò hệ mặt trời bằng công cụ toán học đầy kịch tính thời cận đại, hoặc gần đây hơn là sự kiện máy tính AlphaGo giành chiến thắng trước kỳ thủ cờ vây số một thế giới Lee Sedol bằng những nước đi “thần thánh” sử dụng lý thuyết xác suất.

Toán học khai sinh vì lý do hữu dụng, hẳn nhiên. Vào thời tiền sử, người ta nghĩ ra những con số để đếm đàn gia súc, dùng hình học để đo ruộng đất, làm đường sá. Loài home sapiens chúng ta không ngừng tò mò muốn khám phá thế giới tự nhiên xung quanh, nên suốt mấy ngàn năm qua toán học đã tiến lên phía trước với những bước khổng lồ và ngày càng trừu tượng.

Mickael Launay không chỉ cho người đọc thấy cái đẹp, chất thơ của toán học mà còn xác quyết một điều khác, rằng mọi người đều có thể yêu thích toán học và đều có thể cảm nhận được vẻ đẹp tự nhiên của nó. Cuốn sách này là một minh chứng cho điều đó.', 72000, 332, N'../images/Hinhsach/S000017.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000018', N'Luyện Nói Tiếng Anh Như Người Bản Ngữ ', N'A.J.Hoge', N'Nhà Xuất Bản Đại Học Quốc Gia Hà Nội', 2015, N'Sách Học Ngoại Ngữ', N'Tiếng Việt', N'Effortless English – Luyện nói tiếng Anh như người bản ngữ – Phương pháp học tiếng Anh nổi tiếng thế giới, kết quả đã được kiểm chứng

Những vấn đề sau có đang làm khó các bạn?

Mất cảm hứng, chán nản khi học Tiếng Anh
Bạn đã bao lần từ bỏ việc học tiếng Anh vì ngày này qua tháng nọ dường như cứ mãi dậm chân tại chỗ dù đã thử nhiều phương pháp. Học tiếng Anh từ lớp 3 nhưng đến lúc tốt nghiệp đại học trình độ nhiều bạn vẫn chỉ dừng lại ở những câu đơn giản như “hello”, “hi”,…

Cuốn sách gồm 23 chương trong đó có tới 8 chương cung cấp cho người học những quy tắc và bí quyết giúp các bạn có thể nói tiếng Anh thành thạo. Những quy tắc được trình bày dễ hiểu, dễ ghi nhớ và phù hợp với người Việt chúng ta.

– Quy tắc đầu tiên: Học theo cụm từ – không học đơn lẻ

– Quy tắc thứ hai: Hoc ngữ pháp sẽ hạn chế khả năng nói của bạn

– Quy tắc thứ ba: Học bằng tai không phải học bằng mắt

– Quy tắc thứ tư: Lặp lại là chìa khóa để nắm vững kỹ năng nói tiếng Anh

– Quy tắc thứ năm: Học ngữ pháp một cách trực quan và tự nhiên

– Quy tắc thứ sáu: Hãy học tiếng Anh thực tế và tạm bỏ những cuốn giáo trình

– Quy tắc thứ bảy: Học tiếng Anh với các câu chuyện hấp dẫn

– Bí quyết để có kỹ năng viết tiếng Anh tốt

Chắc chắn thông qua hệ thống quy tắc và bí quyết này các bạn có thể thay đổi được tư duy nói tiếng Anh một cách khoa học.', 150000, 303, N'../images/Hinhsach/S000018.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000019', N'Ngữ Pháp Tiếng Hàn Thông Dụng - Sơ Cấp ', N'Ahn Jean-myung', N'Nhà Xuất Bản Hồng Đức', 2015, N'Sách Học Ngoại Ngữ', N'Tiếng Việt', N'Cuốn sách này được thiết kế hoàn toàn phù hợp với những người mới bắt đầu học tiếng Hàn. Sách gồm có 3 phần chính tổng hợp các kiến thức chính về ngữ pháp tiếng Hàn sơ cấp và thêm nhiều phần kiến thức liên quan:

– Phần 1: Giới thiệu tiếng Hàn Quốc (Phần này sẽ giúp các bạn bước đầu có những hình dung về tiếng Hàn, là tiền đề để bạn học tốt môn ngoại ngữ này)

– Phần 2: 24 bài học hệ thống các cấu trúc ngữ pháp phù hợp với trình độ của các bạn

– Phần 3: Phụ lục (Cung cấp thêm nhiều kiến thức bổ trợ và đáp án cho các bài luyện tập ở phía trước)
...', 143000, 379, N'../images/Hinhsach/S000019.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000020', N'301 Câu Đàm Thoại Tiếng Hoa (Tái Bản)', N'Trần Thanh Liêm', N'Nhà Xuất Bản Hồng Đức', 2018, N'Sách Học Ngoại Ngữ', N'Tiếng Việt', N'Giáo trình ""301 câu đàm thoại tiếng Hoa"" được biên dịch và bổ sung dựa trên cơ sở cuốn sách giáo khoa "" Hán ngữ hội thoại 301"" do các chuyên gia Hán ngữ của học viện ngôn ngữ Bắc kinh biên soạn.

Giáo trình gồm 48 bài trong đó có 8 bài ôn tập, bao quát trên 800 từ thường dùng. Nội dung các bài tập gồm các phần ""Mẫu câu"", ""Đàm thoại"", ""Từ mới"", ""Chú ý từ ngữ"", ""Ngữ pháp"", ""bài tập""... 

Giáo trình biên soạn theo hướng ""mẫu câu"" để đi vào thực hành giao tiếp, nhưng cũng giới thiếu khái quát cấu trúc ngữ pháp của tiếng Hán hiện đại.', 44000, 416, N'../images/Hinhsach/S000020.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000021', N'365 Truyện Kể Hằng Đêm - Mùa Thu', N'Lưu Hồng Hà', N'Nhà Xuất Bản Đại Học Sư Phạm', 2015, N'Sách Thiếu Nhi', N'Tiếng Việt', N'Trẻ nhỏ thường nhận thức thế giới qua những điều đơn giản. Chính vì thế, những quan điểm chuẩn mực về đạo đức của mỗi người thường bắt nguồn từ những câu chuyện nghe kể từ thuở ấu thơ.

Cuốn sách tập hợp những truyện ngụ ngôn, đồng thoại, cổ tích đặc sắc từ xưa đến nay của nhiều quốc gia trên thế giới. Mỗi câu chuyện là một bài học nhỏ với các tình tiết sống động, hấp dẫn. Hy vọng rằng, cuốn sách sẽ trở thành một người bạn gần gũi, thân thiết của các em trong quá trình hình thành những phẩm chất tốt đẹp, tạo nền tảng vững chắc cho sự hình thành nhân cách trong tương lai.', 60000, 190, N'../images/Hinhsach/S000021.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000022', N'365 Thí Nghiệm Khoa Học Dành Cho Trẻ Em', N'Om Books', N'Nhà Xuất Bản Thế Giới', 2019, N'Sách Thiếu Nhi', N'Tiếng Việt', N'Cũng là những tri thức, nhưng chúng không cứng nhắc và khô khan như chúng ta vẫn thường thấy.

Người đọc sẽ nhanh chóng bị lôi cuốn vào một thế giới đầy bí ẩn, nơi đó, chúng ta như được đối thoại cùng những người nổi tiếng. Chúng ta sẽ được tìm hiểu về họ, đối thoại cùng họ, và từ lúc nào, chúng ta đã thu nhận được những tri thức vô cùng thú vị.

Bạn sẽ được tìm hiểu về cuộc sống, sở thích và các thí nghiệm khoa học từ những vật dụng xung quanh chúng ta thông qua những câu chuyện thú vị và những bức tranh sinh động. Những điều được thể hiện qua mỗi thí nghiệm đều là nghiêm túc. Sau mỗi thí nghiệm sẽ là một kiến thức hữu ích . Tiếp thu những kiến thức của cuốn sách này, trong tương lai không xa, chắc chắn bạn sẽ thành công.

Bộ sách thích hợp cho mọi lứa tuổi, mọi đối tượng độc giả, đặc biệt là các em học sinh. Chắc chắn các em học sinh sẽ thích bộ sách sinh động và bổ ích này.', 43000, 236, N'../images/Hinhsach/S000022.png', 3, 1)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000023', N'Sách kỹ năng - Cẩm nang an toàn cho bé', N'Vũ Tuấn Anh', N'Nhà Xuất Bản Thế Giới', 2013, N'Sách Thiếu Nhi', N'Tiếng Việt', N'Cẩm Nang An Toàn Cho Bé

Các bạn nhỏ liệu đã biết cách giữ an toàn cho bản thân mình chưa nhỉ? Nếu bếp ga trong nhà bốc cháy, có người lạ đến gõ cửa nhà, đi qua bãi rác có nhiều mảnh sành vỡ, đi giữa đường gặp cơn mưa giông, đang đi siêu thị đột nhiên lạc bố mẹ... thì bạn làm thế nào?

Hãy cùng bốn người bạn dễ thương CÚN ĐỐM, CHUỘT LANG, LẠC ĐÀ, QUẠ CẬN trong cuốn cẩm nang này học giữ an toàn mọi nơi mọi lúc, khi ở nhà cũng như lúc ra đường!Cẳm Nang An Toàn Cho Bé, cuốn sách không thể thiếu cho các bạn nhỏ ham học hỏi về mọi thứ xung quanh; cho các bậc phụ huynh muốn dạy con tự bảo vệ mình', 57000, 108, N'../images/Hinhsach/S000023.png', 3, 0)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000024', N'Tủ Sách Ehon - Bốn Mùa Ở Nhà Trẻ', N'Fujita Hioko - Aka Shozo ', N'Nhà Xuất Bản Lao Động', 2015, N'Sách Thiếu Nhi', N'Tiếng Việt', N'Cuốn sách được viết bởi một ông bố, qua những cuộc đối thoại với con để làm bạn với con, để dạy con cũng như dạy chính mình.

"Con chúng ta có thể không phải là thiên tài nhưng chúng hoàn toàn có thể là những người tốt” chỉ cần chúng ta biết trò chuyện với chúng.

"Với trẻ con, thì khái niệm sở hữu được làm quen dần dần, "Nhi Bá có cái gì đó" cũng như “Nhi Bá không có cái gì đó", đều quan trọng như nhau. Con trai ạ, rồi con sẽ còn phải hiểu cái gì không có thì sẽ làm như thế nào để có được, lại còn phải hiểu, mong cầu ít thôi, biết thế nào là đủ với mình; mong cầu mà không đạt được, là khổ lắm đấy con à…" – Phúc Lai', 39000, 40, N'../images/Hinhsach/S000024.png', 3, 2)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000025', N'123', N'123', N'123', 2011, N'123', N'123', N'123', 123, 123, N'D:StudyProjectJavaLibrary-Management-System-JavaLibraryManagementSystemsrclibrarymanagementsystemimagesHinhsachS000003.png', NULL, NULL)
INSERT [library].[loaisach] ([maSach], [tenSach], [tenTacGia], [tenNXB], [namXB], [theLoai], [ngonNgu], [tomTatNoiDung], [giaTien], [soTrang], [hinhSach], [soLuongTong], [soLuongMuon]) VALUES (N'S000026', N'123', N'123', N'123', 2001, N'123', N'123', N'123', 123, 123, N'D:StudyProjectJavaLibrary-Management-System-JavaLibraryManagementSystemsrclibrarymanagementsystemimagesHinhsachS000001.png', NULL, NULL)
GO
INSERT [library].[lydophat] ([maLDPhat], [tenLDPhat], [mucDo]) VALUES (N'LDP000001', N'Mất sách', 70)
INSERT [library].[lydophat] ([maLDPhat], [tenLDPhat], [mucDo]) VALUES (N'LDP000002', N'Hư sách', 50)
INSERT [library].[lydophat] ([maLDPhat], [tenLDPhat], [mucDo]) VALUES (N'LDP000003', N'Trả sách trễ hạn', 20)
GO
INSERT [library].[nhacungcap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC000001', N'Nhà sách Fahasa', N'1900636467', N'info@fahasa.com', N'60-62 Lê Lợi, Q.1, TP. HCM')
INSERT [library].[nhacungcap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC000002', N'Nhà sách Cá Chép', N'0862905695', N'nhasachcachep@gmail.com', N'211 - 213 Võ Văn Tần, Quận 3, Tp. Hồ Chí Minh')
INSERT [library].[nhacungcap] ([maNCC], [tenNCC], [sdt], [email], [diaChi]) VALUES (N'NCC000003', N'Nhà sách Hà Nội', N'0834729034', N'nhasachhanoi@gmail.com', N'245 Nguyễn Thị Minh Khai,  Quận 1, TP HCM')
GO
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000001', N'QL000001', N'261f3be78d4c3ff12e00380e0bdfd72f', N'41baa34f66cffd82ffc788a4cd70bf9d', N'Nguyễn Mai Ngọc Bích', CAST(N'1988-11-02' AS Date), N'Đường Láng, Quận Đống Đa, TP Hà Nội', N'0358990124', N'ngocbich@gmail.com', N'Thủ Thư')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000002', N'QL000002', N'644694fb9c214c9f5b8aa23b2048cc25', N'1a10f8e2a08c1816208daf3393c98fe8', N'Nguyễn Đức Minh', CAST(N'1985-02-13' AS Date), N'Nguyễn Xiển, Quận Thanh Xuân, TP Hà Nội', N'0705145202', N'minhnguyen@gmail.com', N'Quản Lý Kho')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000003', N'QL000003', N'bba1f6527b49b8df760d0ea3f476e9c2', N'074484fe51ca878e492e6898f38cdec8', N'Lê Vân Nhi', CAST(N'1992-07-17' AS Date), N'Cầu Giấy, Quận Cầu Giấy, TP Hà Nội', N'0903214760', N'vannhi@gmail.com', N'Thủ Thư')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000004', N'QL000004', N'a42f93001586d44e00c07dcd46e716fe', N'891e9f4d62ab25189cf57339d3e33ad1', N'Lê Gia An', CAST(N'1987-10-20' AS Date), N'Phạm Hùng, Quận Nam Từ Liêm, TP Hà Nội', N'0345905191', N'anle@gmail.com', N'Quản Lý Kho')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000005', N'QL000005', N'ed5deec89a88cb076472f0b136d0a030', N'ff9209aa59464468825a1f0913091b42', N'Phạm Ánh Dương', CAST(N'1994-03-15' AS Date), N'Kim Mã, Quận Ba Đình, TP Hà Nội', N'0935120275', N'anhduong@gmail.com', N'Thủ Thư')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000006', N'QL000006', N'843fe76766b5c0d0ffc7c3583246b2b9', N'a80c2affb865c229f56a649f2164e595', N'Phạm Thiên Ân', CAST(N'1990-01-31' AS Date), N'Trường Chinh, Quận Thanh Xuân, TP Hà Nội', N'0950123589', N'anhpham@gmail.com', N'Quản Lý Kho')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000007', N'QL000007', N'9d6310310461250cdb0bb18b0ef16b43', N'd999be8f5ecb928d724d9d75c40b6d4f', N'Đặng Gia Hân', CAST(N'1993-05-29' AS Date), N'Huỳnh Văn Nghệ, Quận Gò Vấp, TP HCM', N'0795342467', N'giahan@gmail.com', N'Thủ Thư')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000008', N'QL000008', N'9da165e83f191c30a12f7967fe26efbe', N'58b8fec34661f027c73c8e0f8570eee1', N'Đặng Ngọc Gia Nguyên', CAST(N'1986-08-20' AS Date), N'Nguyễn Văn Trỗi, Quận Phú Nhuận, TP HCM', N'0940567316', N'nguyendang@gmail.com', N'Quản Lý Kho')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000009', N'QL000009', N'47eb5e5512db203625dafa28206a9b47', N'd46cc4babf75a7e4c628b1da9f0c7c28', N'Đỗ Phương Thảo', CAST(N'1995-10-10' AS Date), N'Bạch Đằng, Quận Tân Bình, TP HCM', N'0775428796', N'phuongthao@gmail.com', N'Thủ Thư')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000010', N'QL000010', N'399f364e690c3244387ab088176d06db', N'e303f79fc666c869495c005830d4e632', N'Đỗ Quang Khải', CAST(N'1986-12-24' AS Date), N'Phan Châu Trinh, Quận Tân Phú, TP HCM', N'0902464703', N'khaido@gmail.com', N'Quản Lý Kho')
INSERT [library].[nhanvien] ([maNhanVien], [password], [password_hashed], [salt], [hoTen], [ngaySinh], [diaChi], [sdt], [email], [chucVu]) VALUES (N'QL000011', N'QL000011', N'57c692e57439e67195b6adb2caa2696c', N'2d2ec84321c690b365f682d177ac03de', N'Vương Tùng Dương', CAST(N'1988-11-02' AS Date), N'Phú Thượng, Quận Tây Hồ, TP Hà Nội', N'0331345364', N'duongvuong@gmail.com', N'Nhân Viên')
GO
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000001', N'T000001', CAST(N'2020-01-10' AS Date), 14, CAST(N'2020-01-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000002', N'T000002', CAST(N'2020-01-25' AS Date), 14, CAST(N'2020-01-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000003', N'T000003', CAST(N'2020-02-04' AS Date), 14, CAST(N'2020-02-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000004', N'T000003', CAST(N'2020-02-12' AS Date), 14, CAST(N'2020-02-23' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000005', N'T000004', CAST(N'2020-02-12' AS Date), 28, CAST(N'2020-03-12' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000006', N'T000005', CAST(N'2020-02-12' AS Date), 28, CAST(N'2020-03-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000007', N'T000007', CAST(N'2020-02-15' AS Date), 14, CAST(N'2020-02-21' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000008', N'T000006', CAST(N'2020-02-20' AS Date), 14, CAST(N'2020-02-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000009', N'T000006', CAST(N'2020-02-20' AS Date), 14, CAST(N'2020-02-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000010', N'T000007', CAST(N'2020-02-28' AS Date), 56, CAST(N'2020-04-28' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000011', N'T000008', CAST(N'2020-03-14' AS Date), 28, CAST(N'2020-04-08' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000012', N'T000009', CAST(N'2020-03-20' AS Date), 56, CAST(N'2020-04-28' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000013', N'T000010', CAST(N'2020-04-03' AS Date), 28, CAST(N'2020-04-26' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000014', N'T000011', CAST(N'2020-04-08' AS Date), 14, CAST(N'2020-04-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000015', N'T000012', CAST(N'2020-04-16' AS Date), 28, CAST(N'2020-05-12' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000016', N'T000013', CAST(N'2020-04-18' AS Date), 28, CAST(N'2020-05-06' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000017', N'T000014', CAST(N'2020-04-21' AS Date), 14, CAST(N'2020-04-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000018', N'T000014', CAST(N'2020-05-02' AS Date), 14, CAST(N'2020-05-06' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000019', N'T000015', CAST(N'2020-05-02' AS Date), 14, CAST(N'2020-05-19' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000020', N'T000016', CAST(N'2020-05-09' AS Date), 14, CAST(N'2020-05-21' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000021', N'T000017', CAST(N'2020-05-11' AS Date), 28, CAST(N'2020-06-12' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000022', N'T000018', CAST(N'2020-05-21' AS Date), 56, CAST(N'2020-06-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000023', N'T000019', CAST(N'2020-06-02' AS Date), 14, CAST(N'2020-06-06' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000024', N'T000020', CAST(N'2020-06-07' AS Date), 14, CAST(N'2020-06-15' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000025', N'T000001', CAST(N'2019-01-15' AS Date), 14, CAST(N'2019-01-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000026', N'T000002', CAST(N'2019-01-23' AS Date), 14, CAST(N'2019-01-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000027', N'T000002', CAST(N'2019-01-29' AS Date), 14, CAST(N'2019-01-31' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000028', N'T000003', CAST(N'2019-02-06' AS Date), 14, CAST(N'2019-02-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000029', N'T000004', CAST(N'2019-02-21' AS Date), 14, CAST(N'2019-02-28' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000030', N'T000005', CAST(N'2019-03-18' AS Date), 14, CAST(N'2019-03-23' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000031', N'T000006', CAST(N'2019-03-28' AS Date), 14, CAST(N'2019-03-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000032', N'T000007', CAST(N'2019-04-03' AS Date), 14, CAST(N'2019-04-10' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000033', N'T000008', CAST(N'2019-04-14' AS Date), 14, CAST(N'2019-04-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000034', N'T000009', CAST(N'2019-05-11' AS Date), 14, CAST(N'2019-05-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000035', N'T000009', CAST(N'2019-05-11' AS Date), 14, CAST(N'2019-05-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000036', N'T000010', CAST(N'2019-05-23' AS Date), 14, CAST(N'2019-05-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000037', N'T000010', CAST(N'2019-05-23' AS Date), 14, CAST(N'2019-05-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000038', N'T000011', CAST(N'2019-06-20' AS Date), 14, CAST(N'2019-06-26' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000039', N'T000011', CAST(N'2019-06-20' AS Date), 14, CAST(N'2019-06-26' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000040', N'T000012', CAST(N'2019-07-09' AS Date), 14, CAST(N'2019-07-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000041', N'T000012', CAST(N'2019-07-09' AS Date), 14, CAST(N'2019-07-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000042', N'T000013', CAST(N'2019-07-15' AS Date), 14, CAST(N'2019-07-22' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000043', N'T000013', CAST(N'2019-07-15' AS Date), 14, CAST(N'2019-07-22' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000044', N'T000014', CAST(N'2019-08-14' AS Date), 14, CAST(N'2019-08-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000045', N'T000014', CAST(N'2019-08-14' AS Date), 14, CAST(N'2019-08-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000046', N'T000015', CAST(N'2019-08-22' AS Date), 14, CAST(N'2019-08-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000047', N'T000015', CAST(N'2019-08-22' AS Date), 14, CAST(N'2019-08-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000048', N'T000016', CAST(N'2019-09-09' AS Date), 14, CAST(N'2019-09-14' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000049', N'T000016', CAST(N'2019-09-09' AS Date), 14, CAST(N'2019-09-14' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000050', N'T000017', CAST(N'2019-09-18' AS Date), 14, CAST(N'2019-09-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000051', N'T000017', CAST(N'2019-09-18' AS Date), 14, CAST(N'2019-09-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000052', N'T000018', CAST(N'2019-10-08' AS Date), 14, CAST(N'2019-10-15' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000053', N'T000018', CAST(N'2019-10-08' AS Date), 14, CAST(N'2019-10-15' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000054', N'T000019', CAST(N'2019-11-14' AS Date), 28, CAST(N'2019-11-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000055', N'T000019', CAST(N'2019-11-30' AS Date), 14, CAST(N'2019-12-03' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000056', N'T000020', CAST(N'2019-12-12' AS Date), 14, CAST(N'2019-12-16' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000057', N'T000020', CAST(N'2019-12-12' AS Date), 14, CAST(N'2020-12-16' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000058', N'T000020', CAST(N'2019-12-23' AS Date), 14, CAST(N'2019-12-28' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000059', N'T000020', CAST(N'2019-12-23' AS Date), 14, CAST(N'2019-12-28' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000060', N'T000003', CAST(N'2020-01-03' AS Date), 14, CAST(N'2020-01-10' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000061', N'T000004', CAST(N'2020-01-04' AS Date), 14, CAST(N'2020-01-11' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000062', N'T000005', CAST(N'2020-01-07' AS Date), 14, CAST(N'2020-01-21' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000063', N'T000006', CAST(N'2020-01-11' AS Date), 14, CAST(N'2020-01-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000064', N'T000007', CAST(N'2020-01-13' AS Date), 14, CAST(N'2020-01-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000065', N'T000008', CAST(N'2020-01-15' AS Date), 14, CAST(N'2020-01-22' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000066', N'T000009', CAST(N'2020-01-18' AS Date), 14, CAST(N'2020-01-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000067', N'T000010', CAST(N'2020-01-20' AS Date), 14, CAST(N'2020-01-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000068', N'T000011', CAST(N'2020-01-23' AS Date), 14, CAST(N'2019-11-28' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000069', N'T000001', CAST(N'2020-03-02' AS Date), 14, CAST(N'2020-03-09' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000070', N'T000002', CAST(N'2020-03-05' AS Date), 14, CAST(N'2020-03-12' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000071', N'T000012', CAST(N'2020-03-06' AS Date), 14, CAST(N'2020-03-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000072', N'T000006', CAST(N'2020-03-08' AS Date), 14, CAST(N'2020-03-15' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000073', N'T000010', CAST(N'2020-03-13' AS Date), 14, CAST(N'2020-03-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000074', N'T000011', CAST(N'2020-03-24' AS Date), 14, CAST(N'2020-03-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000075', N'T000001', CAST(N'2020-04-06' AS Date), 14, CAST(N'2020-04-14' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000076', N'T000002', CAST(N'2020-04-10' AS Date), 14, CAST(N'2020-04-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000077', N'T000002', CAST(N'2020-05-23' AS Date), 14, CAST(N'2020-05-31' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000078', N'T000002', CAST(N'2020-06-04' AS Date), 14, CAST(N'2020-06-11' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000079', N'T000005', CAST(N'2020-06-06' AS Date), 14, CAST(N'2020-06-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000080', N'T000013', CAST(N'2020-06-13' AS Date), 14, CAST(N'2020-06-16' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000081', N'T000003', CAST(N'2020-01-02' AS Date), 14, CAST(N'2020-01-08' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000082', N'T000012', CAST(N'2020-01-05' AS Date), 14, CAST(N'2020-01-11' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000083', N'T000013', CAST(N'2020-01-12' AS Date), 14, CAST(N'2020-01-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000084', N'T000014', CAST(N'2020-01-14' AS Date), 14, CAST(N'2020-01-21' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000085', N'T000008', CAST(N'2020-02-05' AS Date), 14, CAST(N'2020-02-12' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000086', N'T000009', CAST(N'2020-02-10' AS Date), 14, CAST(N'2020-02-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000087', N'T000010', CAST(N'2020-02-24' AS Date), 14, CAST(N'2020-02-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000088', N'T000014', CAST(N'2020-03-03' AS Date), 14, CAST(N'2020-03-07' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000089', N'T000013', CAST(N'2020-03-04' AS Date), 14, CAST(N'2020-03-10' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000090', N'T000015', CAST(N'2020-03-07' AS Date), 14, CAST(N'2020-03-14' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000091', N'T000016', CAST(N'2020-03-09' AS Date), 14, CAST(N'2020-03-17' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000092', N'T000017', CAST(N'2020-03-10' AS Date), 14, CAST(N'2020-03-14' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000093', N'T000018', CAST(N'2020-03-11' AS Date), 14, CAST(N'2020-03-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000094', N'T000019', CAST(N'2020-03-12' AS Date), 14, CAST(N'2020-03-19' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000095', N'T000003', CAST(N'2020-04-04' AS Date), 14, CAST(N'2020-04-10' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000096', N'T000004', CAST(N'2020-04-05' AS Date), 14, CAST(N'2020-04-19' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000097', N'T000005', CAST(N'2020-04-07' AS Date), 14, CAST(N'2020-04-21' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000098', N'T000006', CAST(N'2020-04-09' AS Date), 14, CAST(N'2020-04-23' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000099', N'T000012', CAST(N'2020-04-11' AS Date), 14, CAST(N'2020-04-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000100', N'T000013', CAST(N'2020-04-12' AS Date), 14, CAST(N'2020-04-26' AS Date))
GO
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000101', N'T000015', CAST(N'2020-04-13' AS Date), 14, CAST(N'2020-04-27' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000102', N'T000016', CAST(N'2020-04-14' AS Date), 14, CAST(N'2020-04-28' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000103', N'T000017', CAST(N'2020-04-15' AS Date), 14, CAST(N'2020-04-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000104', N'T000018', CAST(N'2020-04-16' AS Date), 14, CAST(N'2020-04-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000105', N'T000019', CAST(N'2020-04-17' AS Date), 14, CAST(N'2020-04-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000106', N'T000003', CAST(N'2020-05-04' AS Date), 14, CAST(N'2020-05-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000107', N'T000004', CAST(N'2020-05-06' AS Date), 14, CAST(N'2020-05-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000108', N'T000005', CAST(N'2020-05-06' AS Date), 14, CAST(N'2020-05-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000109', N'T000006', CAST(N'2020-05-07' AS Date), 14, CAST(N'2020-05-14' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000110', N'T000007', CAST(N'2020-05-08' AS Date), 14, CAST(N'2020-05-15' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000111', N'T000008', CAST(N'2020-05-10' AS Date), 14, CAST(N'2020-05-16' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000112', N'T000010', CAST(N'2020-05-12' AS Date), 14, CAST(N'2020-05-26' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000113', N'T000011', CAST(N'2020-05-20' AS Date), 14, CAST(N'2020-05-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000114', N'T000017', CAST(N'2020-05-22' AS Date), 14, CAST(N'2020-05-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000115', N'T000001', CAST(N'2020-06-01' AS Date), 14, CAST(N'2020-06-06' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000116', N'T000003', CAST(N'2020-06-03' AS Date), 14, CAST(N'2020-06-10' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000117', N'T000004', CAST(N'2020-06-05' AS Date), 14, CAST(N'2020-06-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000118', N'T000006', CAST(N'2020-06-08' AS Date), 14, CAST(N'2020-06-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000119', N'T000007', CAST(N'2020-06-09' AS Date), 14, CAST(N'2020-06-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000120', N'T000008', CAST(N'2020-06-10' AS Date), 14, CAST(N'2020-06-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000121', N'T000009', CAST(N'2020-06-11' AS Date), 14, CAST(N'2020-06-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000122', N'T000010', CAST(N'2020-06-12' AS Date), 14, CAST(N'2020-06-19' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000123', N'T000011', CAST(N'2020-06-14' AS Date), 14, CAST(N'2020-06-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000124', N'T000012', CAST(N'2020-06-15' AS Date), 14, CAST(N'2020-06-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000125', N'T000014', CAST(N'2020-06-16' AS Date), 14, CAST(N'2020-06-23' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000126', N'T000015', CAST(N'2020-06-17' AS Date), 14, CAST(N'2020-06-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000127', N'T000016', CAST(N'2020-06-18' AS Date), 14, CAST(N'2020-06-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000128', N'T000003', CAST(N'2019-01-05' AS Date), 14, CAST(N'2019-01-19' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000129', N'T000004', CAST(N'2019-01-06' AS Date), 14, CAST(N'2019-01-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000130', N'T000005', CAST(N'2019-01-07' AS Date), 14, CAST(N'2019-01-21' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000131', N'T000007', CAST(N'2019-01-08' AS Date), 14, CAST(N'2019-01-22' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000132', N'T000001', CAST(N'2019-02-02' AS Date), 14, CAST(N'2019-02-09' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000133', N'T000002', CAST(N'2019-02-04' AS Date), 14, CAST(N'2019-02-18' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000134', N'T000007', CAST(N'2019-02-09' AS Date), 14, CAST(N'2019-02-28' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000135', N'T000005', CAST(N'2019-02-12' AS Date), 14, CAST(N'2019-02-26' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000136', N'T000006', CAST(N'2019-02-15' AS Date), 14, CAST(N'2019-02-22' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000137', N'T000001', CAST(N'2019-03-03' AS Date), 14, CAST(N'2019-03-17' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000138', N'T000002', CAST(N'2019-03-06' AS Date), 14, CAST(N'2019-03-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000139', N'T000003', CAST(N'2019-03-09' AS Date), 14, CAST(N'2019-03-23' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000140', N'T000004', CAST(N'2019-03-23' AS Date), 14, CAST(N'2019-03-31' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000141', N'T000001', CAST(N'2019-04-05' AS Date), 14, CAST(N'2019-04-19' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000142', N'T000002', CAST(N'2019-04-12' AS Date), 14, CAST(N'2019-04-26' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000143', N'T000003', CAST(N'2019-04-23' AS Date), 14, CAST(N'2019-04-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000144', N'T000001', CAST(N'2019-05-09' AS Date), 14, CAST(N'2019-05-23' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000145', N'T000002', CAST(N'2019-05-15' AS Date), 14, CAST(N'2019-05-22' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000146', N'T000003', CAST(N'2019-05-20' AS Date), 14, CAST(N'2019-05-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000147', N'T000001', CAST(N'2019-06-10' AS Date), 14, CAST(N'2019-06-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000148', N'T000002', CAST(N'2019-06-15' AS Date), 14, CAST(N'2019-06-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000149', N'T000004', CAST(N'2019-06-21' AS Date), 14, CAST(N'2019-06-28' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000150', N'T000003', CAST(N'2019-06-23' AS Date), 14, CAST(N'2019-06-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000151', N'T000001', CAST(N'2019-07-10' AS Date), 14, CAST(N'2019-07-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000152', N'T000002', CAST(N'2019-07-24' AS Date), 14, CAST(N'2019-07-31' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000153', N'T000007', CAST(N'2019-08-06' AS Date), 14, CAST(N'2019-08-20' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000154', N'T000008', CAST(N'2019-08-10' AS Date), 14, CAST(N'2019-08-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000155', N'T000009', CAST(N'2019-08-16' AS Date), 14, CAST(N'2019-08-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000156', N'T000010', CAST(N'2019-08-24' AS Date), 14, CAST(N'2019-08-31' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000157', N'T000001', CAST(N'2019-09-10' AS Date), 14, CAST(N'2019-09-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000158', N'T000002', CAST(N'2019-09-12' AS Date), 14, CAST(N'2019-09-26' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000159', N'T000003', CAST(N'2019-09-24' AS Date), 14, CAST(N'2019-09-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000160', N'T000001', CAST(N'2019-10-15' AS Date), 14, CAST(N'2019-10-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000161', N'T000002', CAST(N'2019-10-18' AS Date), 14, CAST(N'2019-10-22' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000162', N'T000003', CAST(N'2019-10-23' AS Date), 14, CAST(N'2019-10-31' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000163', N'T000002', CAST(N'2019-11-15' AS Date), 14, CAST(N'2019-11-29' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000164', N'T000003', CAST(N'2019-11-18' AS Date), 14, CAST(N'2019-11-25' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000165', N'T000004', CAST(N'2019-11-25' AS Date), 14, CAST(N'2019-11-30' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000166', N'T000001', CAST(N'2019-12-02' AS Date), 14, CAST(N'2019-12-16' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000167', N'T000002', CAST(N'2019-12-06' AS Date), 14, CAST(N'2019-12-13' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000168', N'T000003', CAST(N'2019-12-17' AS Date), 14, CAST(N'2019-12-24' AS Date))
INSERT [library].[phieumuon] ([maPhieuMuon], [maThe], [ngayMuon], [thoiGianMuon], [ngayTra]) VALUES (N'M000169', N'T000004', CAST(N'2019-12-26' AS Date), 14, CAST(N'2019-12-30' AS Date))
GO
INSERT [library].[phieunhap] ([maNhap], [ngayNhap], [maNhanVien], [maNCC], [tongSoLuong], [tongTien]) VALUES (N'N0000001', CAST(N'2020-01-03' AS Date), N'QL000002', N'NCC000001', 50, 7221000)
INSERT [library].[phieunhap] ([maNhap], [ngayNhap], [maNhanVien], [maNCC], [tongSoLuong], [tongTien]) VALUES (N'N0000002', CAST(N'2020-03-08' AS Date), N'QL000010', N'NCC000002', 100, 18248000)
INSERT [library].[phieunhap] ([maNhap], [ngayNhap], [maNhanVien], [maNCC], [tongSoLuong], [tongTien]) VALUES (N'N0000003', CAST(N'2020-06-16' AS Date), N'QL000004', N'NCC000003', 72, 11838000)
GO
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000001', N'M000003', 0, N'LDP000003')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000002', N'M000005', 0, N'LDP000003')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000003', N'M000006', 0, N'LDP000003')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000004', N'M000010', 0, N'LDP000003')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000005', N'M000014', 0, N'LDP000003')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000006', N'M000019', 0, N'LDP000003')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000007', N'M000018', 0, N'LDP000003')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000008', N'M000021', 0, N'LDP000003')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000009', N'M000001', 0, N'LDP000002')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000010', N'M000013', 0, N'LDP000002')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000011', N'M000015', 0, N'LDP000002')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000012', N'M000020', 0, N'LDP000002')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000013', N'M000022', 0, N'LDP000002')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000014', N'M000002', 0, N'LDP000001')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000015', N'M000011', 0, N'LDP000001')
INSERT [library].[phieuphat] ([maPhieuPhat], [maPhieuMuon], [tienPhat], [maLDPhat]) VALUES (N'P000016', N'M000016', 0, N'LDP000001')
GO
INSERT [library].[phieuxuat] ([maXuat], [ngayXuat], [maNhanVien], [tongSoLuong]) VALUES (N'X0000001', CAST(N'2020-01-10' AS Date), N'QL000002', 48)
INSERT [library].[phieuxuat] ([maXuat], [ngayXuat], [maNhanVien], [tongSoLuong]) VALUES (N'X0000002', CAST(N'2020-03-09' AS Date), N'QL000008', 24)
INSERT [library].[phieuxuat] ([maXuat], [ngayXuat], [maNhanVien], [tongSoLuong]) VALUES (N'X0000003', CAST(N'2020-04-14' AS Date), N'QL000010', 6)
GO
INSERT [library].[quyen] ([maQuyen], [tenQuyen], [chitietQuyen]) VALUES (N'Q000001', N'Thủ Thư', N'1111110000000')
INSERT [library].[quyen] ([maQuyen], [tenQuyen], [chitietQuyen]) VALUES (N'Q000002', N'Nhập Kho', N'0000000001111')
GO
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000001', N'KH000001', CAST(N'2020-01-08' AS Date), CAST(N'2021-01-08' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000002', N'KH000002', CAST(N'2020-01-15' AS Date), CAST(N'2021-01-15' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000003', N'KH000003', CAST(N'2020-01-21' AS Date), CAST(N'2021-01-21' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000004', N'KH000004', CAST(N'2020-01-30' AS Date), CAST(N'2021-01-30' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000005', N'KH000005', CAST(N'2020-02-02' AS Date), CAST(N'2021-02-02' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000006', N'KH000006', CAST(N'2020-02-06' AS Date), CAST(N'2021-02-06' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000007', N'KH000007', CAST(N'2020-02-27' AS Date), CAST(N'2021-02-27' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000008', N'KH000008', CAST(N'2020-03-04' AS Date), CAST(N'2021-03-04' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000009', N'KH000009', CAST(N'2020-03-14' AS Date), CAST(N'2021-03-14' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000010', N'KH000010', CAST(N'2020-03-20' AS Date), CAST(N'2021-03-20' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000011', N'KH000011', CAST(N'2020-03-29' AS Date), CAST(N'2021-03-29' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000012', N'KH000012', CAST(N'2020-04-14' AS Date), CAST(N'2021-04-14' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000013', N'KH000013', CAST(N'2020-04-16' AS Date), CAST(N'2021-04-16' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000014', N'KH000014', CAST(N'2020-04-18' AS Date), CAST(N'2021-04-18' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000015', N'KH000015', CAST(N'2020-04-28' AS Date), CAST(N'2021-04-28' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000016', N'KH000016', CAST(N'2020-05-03' AS Date), CAST(N'2021-05-03' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000017', N'KH000017', CAST(N'2020-05-09' AS Date), CAST(N'2021-05-09' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000018', N'KH000018', CAST(N'2020-05-19' AS Date), CAST(N'2021-05-19' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000019', N'KH000019', CAST(N'2020-05-31' AS Date), CAST(N'2021-05-31' AS Date))
INSERT [library].[the] ([maThe], [maKhachhang], [ngayCap], [ngayHetHan]) VALUES (N'T000020', N'KH000020', CAST(N'2020-06-06' AS Date), CAST(N'2021-06-06' AS Date))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_IDSach_ChiTietPhieuMuon]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_IDSach_ChiTietPhieuMuon] ON [library].[chitietphieumuon]
(
	[IDSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_MaPhieuMuon_ChiTietPhieuMuon]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_MaPhieuMuon_ChiTietPhieuMuon] ON [library].[chitietphieumuon]
(
	[maPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_MaNhap]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_MaNhap] ON [library].[chitietphieunhap]
(
	[maNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_MaSach_NK]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_MaSach_NK] ON [library].[chitietphieunhap]
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_MaSach_XuatKho]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_MaSach_XuatKho] ON [library].[chitietphieuxuat]
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_MaXuat]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_MaXuat] ON [library].[chitietphieuxuat]
(
	[maXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_maSach_2]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_maSach_2] ON [library].[chitietsach]
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_maSach]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_maSach] ON [library].[khosach]
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_maThe_2]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_maThe_2] ON [library].[phieumuon]
(
	[maThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_MaQuanLy-NhapKho]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_MaQuanLy-NhapKho] ON [library].[phieunhap]
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_NCC-NhapKho]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_NCC-NhapKho] ON [library].[phieunhap]
(
	[maNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_maLDPhat_PhieuPhat]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_maLDPhat_PhieuPhat] ON [library].[phieuphat]
(
	[maLDPhat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_MaMuonSach]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_MaMuonSach] ON [library].[phieuphat]
(
	[maPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_MaQuanLy-XuatKho]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_MaQuanLy-XuatKho] ON [library].[phieuxuat]
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FK_maKhachHang]    Script Date: 12/15/2024 3:47:22 PM ******/
CREATE NONCLUSTERED INDEX [FK_maKhachHang] ON [library].[the]
(
	[maKhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [library].[admin] ADD  DEFAULT (NULL) FOR [password_hashed]
GO
ALTER TABLE [library].[admin] ADD  DEFAULT (NULL) FOR [salt]
GO
ALTER TABLE [library].[chitietphieunhap] ADD  DEFAULT (NULL) FOR [maNhap]
GO
ALTER TABLE [library].[chitietphieunhap] ADD  DEFAULT (NULL) FOR [soLuong]
GO
ALTER TABLE [library].[chitietphieunhap] ADD  DEFAULT (NULL) FOR [donGia]
GO
ALTER TABLE [library].[chitietphieunhap] ADD  DEFAULT (NULL) FOR [thanhTien]
GO
ALTER TABLE [library].[chitietphieuxuat] ADD  DEFAULT (NULL) FOR [soLuong]
GO
ALTER TABLE [library].[khosach] ADD  DEFAULT (NULL) FOR [soLuong]
GO
ALTER TABLE [library].[loaisach] ADD  DEFAULT (NULL) FOR [hinhSach]
GO
ALTER TABLE [library].[loaisach] ADD  DEFAULT (NULL) FOR [soLuongTong]
GO
ALTER TABLE [library].[loaisach] ADD  DEFAULT (NULL) FOR [soLuongMuon]
GO
ALTER TABLE [library].[nhanvien] ADD  DEFAULT (NULL) FOR [password_hashed]
GO
ALTER TABLE [library].[nhanvien] ADD  DEFAULT (NULL) FOR [salt]
GO
ALTER TABLE [library].[phieumuon] ADD  DEFAULT (NULL) FOR [ngayTra]
GO
ALTER TABLE [library].[phieunhap] ADD  DEFAULT (NULL) FOR [tongSoLuong]
GO
ALTER TABLE [library].[phieunhap] ADD  DEFAULT (NULL) FOR [tongTien]
GO
ALTER TABLE [library].[phieuphat] ADD  DEFAULT (NULL) FOR [tienPhat]
GO
ALTER TABLE [library].[phieuphat] ADD  DEFAULT (NULL) FOR [maLDPhat]
GO
ALTER TABLE [library].[phieuxuat] ADD  DEFAULT (NULL) FOR [tongSoLuong]
GO
ALTER TABLE [library].[the] ADD  DEFAULT (NULL) FOR [maKhachhang]
GO
ALTER TABLE [library].[chitietphieumuon]  WITH NOCHECK ADD  CONSTRAINT [chitietphieumuon$FK_IDSach_ChiTietPhieuMuon] FOREIGN KEY([IDSach])
REFERENCES [library].[chitietsach] ([IDSach])
GO
ALTER TABLE [library].[chitietphieumuon] CHECK CONSTRAINT [chitietphieumuon$FK_IDSach_ChiTietPhieuMuon]
GO
ALTER TABLE [library].[chitietphieumuon]  WITH NOCHECK ADD  CONSTRAINT [chitietphieumuon$FK_MaPhieuMuon_ChiTietPhieuMuon] FOREIGN KEY([maPhieuMuon])
REFERENCES [library].[phieumuon] ([maPhieuMuon])
GO
ALTER TABLE [library].[chitietphieumuon] CHECK CONSTRAINT [chitietphieumuon$FK_MaPhieuMuon_ChiTietPhieuMuon]
GO
ALTER TABLE [library].[chitietphieunhap]  WITH NOCHECK ADD  CONSTRAINT [chitietphieunhap$FK_MaNhap] FOREIGN KEY([maNhap])
REFERENCES [library].[phieunhap] ([maNhap])
GO
ALTER TABLE [library].[chitietphieunhap] CHECK CONSTRAINT [chitietphieunhap$FK_MaNhap]
GO
ALTER TABLE [library].[chitietphieunhap]  WITH NOCHECK ADD  CONSTRAINT [chitietphieunhap$FK_MaSach_NK] FOREIGN KEY([maSach])
REFERENCES [library].[loaisach] ([maSach])
GO
ALTER TABLE [library].[chitietphieunhap] CHECK CONSTRAINT [chitietphieunhap$FK_MaSach_NK]
GO
ALTER TABLE [library].[chitietphieuxuat]  WITH NOCHECK ADD  CONSTRAINT [chitietphieuxuat$FK_MaSach_NhapKho] FOREIGN KEY([maSach])
REFERENCES [library].[loaisach] ([maSach])
GO
ALTER TABLE [library].[chitietphieuxuat] CHECK CONSTRAINT [chitietphieuxuat$FK_MaSach_NhapKho]
GO
ALTER TABLE [library].[chitietphieuxuat]  WITH NOCHECK ADD  CONSTRAINT [chitietphieuxuat$FK_MaXuat] FOREIGN KEY([maXuat])
REFERENCES [library].[phieuxuat] ([maXuat])
GO
ALTER TABLE [library].[chitietphieuxuat] CHECK CONSTRAINT [chitietphieuxuat$FK_MaXuat]
GO
ALTER TABLE [library].[chitietsach]  WITH NOCHECK ADD  CONSTRAINT [chitietsach$FK_maSach_2] FOREIGN KEY([maSach])
REFERENCES [library].[loaisach] ([maSach])
GO
ALTER TABLE [library].[chitietsach] CHECK CONSTRAINT [chitietsach$FK_maSach_2]
GO
ALTER TABLE [library].[khosach]  WITH NOCHECK ADD  CONSTRAINT [khosach$FK_maSach] FOREIGN KEY([maSach])
REFERENCES [library].[loaisach] ([maSach])
GO
ALTER TABLE [library].[khosach] CHECK CONSTRAINT [khosach$FK_maSach]
GO
ALTER TABLE [library].[phieumuon]  WITH NOCHECK ADD  CONSTRAINT [phieumuon$FK_maThe_2] FOREIGN KEY([maThe])
REFERENCES [library].[the] ([maThe])
GO
ALTER TABLE [library].[phieumuon] CHECK CONSTRAINT [phieumuon$FK_maThe_2]
GO
ALTER TABLE [library].[phieunhap]  WITH NOCHECK ADD  CONSTRAINT [phieunhap$FK_MaQuanLy-NhapKho] FOREIGN KEY([maNhanVien])
REFERENCES [library].[nhanvien] ([maNhanVien])
GO
ALTER TABLE [library].[phieunhap] CHECK CONSTRAINT [phieunhap$FK_MaQuanLy-NhapKho]
GO
ALTER TABLE [library].[phieunhap]  WITH NOCHECK ADD  CONSTRAINT [phieunhap$FK_NCC-NhapKho] FOREIGN KEY([maNCC])
REFERENCES [library].[nhacungcap] ([maNCC])
GO
ALTER TABLE [library].[phieunhap] CHECK CONSTRAINT [phieunhap$FK_NCC-NhapKho]
GO
ALTER TABLE [library].[phieuphat]  WITH NOCHECK ADD  CONSTRAINT [phieuphat$FK_maLDPhat_PhieuPhat] FOREIGN KEY([maLDPhat])
REFERENCES [library].[lydophat] ([maLDPhat])
GO
ALTER TABLE [library].[phieuphat] CHECK CONSTRAINT [phieuphat$FK_maLDPhat_PhieuPhat]
GO
ALTER TABLE [library].[phieuphat]  WITH NOCHECK ADD  CONSTRAINT [phieuphat$FK_MaMuonSach] FOREIGN KEY([maPhieuMuon])
REFERENCES [library].[phieumuon] ([maPhieuMuon])
GO
ALTER TABLE [library].[phieuphat] CHECK CONSTRAINT [phieuphat$FK_MaMuonSach]
GO
ALTER TABLE [library].[phieuxuat]  WITH NOCHECK ADD  CONSTRAINT [phieuxuat$FK_MaQuanLy-XuatKho] FOREIGN KEY([maNhanVien])
REFERENCES [library].[nhanvien] ([maNhanVien])
GO
ALTER TABLE [library].[phieuxuat] CHECK CONSTRAINT [phieuxuat$FK_MaQuanLy-XuatKho]
GO
ALTER TABLE [library].[the]  WITH NOCHECK ADD  CONSTRAINT [the$FK_maKhachHang] FOREIGN KEY([maKhachhang])
REFERENCES [library].[khachhang] ([maKhachHang])
GO
ALTER TABLE [library].[the] CHECK CONSTRAINT [the$FK_maKhachHang]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.admin' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'admin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.chitietphieumuon' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'chitietphieumuon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.chitietphieunhap' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'chitietphieunhap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.chitietphieuxuat' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'chitietphieuxuat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.chitietsach' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'chitietsach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.khachhang' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'khachhang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.khosach' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'khosach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.loaisach' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'loaisach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.lydophat' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'lydophat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.nhacungcap' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'nhacungcap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.nhanvien' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'nhanvien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.phieumuon' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'phieumuon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.phieunhap' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'phieunhap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.phieuphat' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'phieuphat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.phieuxuat' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'phieuxuat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.quyen' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'quyen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'library.the' , @level0type=N'SCHEMA',@level0name=N'library', @level1type=N'TABLE',@level1name=N'the'
GO
USE [master]
GO
ALTER DATABASE [library] SET  READ_WRITE 
GO
