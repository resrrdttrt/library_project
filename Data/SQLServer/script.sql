USE [library]
GO
/****** Object:  Schema [library]    Script Date: 11/23/2024 4:13:31 PM ******/
CREATE SCHEMA [library]
GO
/****** Object:  Table [library].[admin]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[chitietphieumuon]    Script Date: 11/23/2024 4:13:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[chitietphieumuon](
	[maPhieuMuon] [nvarchar](7) NOT NULL,
	[IDSach] [nvarchar](9) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [library].[chitietphieunhap]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[chitietphieuxuat]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[chitietsach]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[khachhang]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[khosach]    Script Date: 11/23/2024 4:13:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [library].[khosach](
	[maSach] [nvarchar](7) NOT NULL,
	[soLuong] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [library].[loaisach]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[lydophat]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[nhacungcap]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[nhanvien]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[phieumuon]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[phieunhap]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[phieuphat]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[phieuxuat]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[quyen]    Script Date: 11/23/2024 4:13:31 PM ******/
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
/****** Object:  Table [library].[the]    Script Date: 11/23/2024 4:13:31 PM ******/
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
