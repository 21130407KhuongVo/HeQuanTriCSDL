create database NuocGiaiKhat;

use NuocGiaiKhat;

create table NGK(
	MaNGK VARCHAR(50) not null primary key,
	TenNGK varchar(512),
	QuyCach varchar(256),
	MaLoaiNGK varchar(50)
)
create table LOAINGK (
	MaLoaiNGK varchar(50) not null primary key,
	TenLoaiNGK varchar(512),
	MaNCC varchar(50) 
)
create table NHACC(
	MaNCC varchar(50) not null primary key,
	TenNCC varchar(512),
	DiaChiNCC text,
	DTNCC varchar(10)
	)
create table KH(
	MaKH varchar(50) not null primary key, TenNCC varchar (512),
	DCKH text, DTKH varchar(10))	
create table DDH (SoDDH varchar(50) not null primary key,
	NgayDH date,
	MaNCC varchar(50))
create table CT_DDH(SoDDH varchar(50),MaNGK varchar(50),
	SLDat int,Primary key(SoDDh,MaNGK))
create table PHIEUGHI (SoPGH varchar(50) not null primary key,
	NgayGH date, SoDDH varchar(50))
create table CT_PGH (SoPGH varchar(50),
	MaNGK varchar(50),
	SLGiao int, DGGiao float,
	Primary key(SoPGH, MaNGK)
	)
create table HOADON(
	SoHD varchar(50) not null primary key,
	NgayLapHD date,
	MaKH varchar(50), foreign key (MaKH) references KH(MaKH))
create table CT_HOADON(
	SoHD varchar(50), MaNGK varchar(50),
	SLKHMua int,DGBan float,
	primary key (SoHD,MaNGK))
create table PHIEUHEN (
	SoPH varchar(50) not null primary key,
	NgayLapPH date,
	NgayHenGiao date ,
	MaKH varchar(50), 
	foreign key (MaKH) references KH(MaKH), constraint Check_NgayHG check (NgayHenGiao>=NgayLapPH)
)
create table CT_PH(
	SoPH varchar(50), MaNGK varchar(50),
	SLHen int, primary key(SoPH, MaNGK))
create table PHIEUTRANO(
	SoPTN varchar(50) not null primary key,
	NgayTra date, SoTienTra float, SoHD varchar(50),
	foreign key (SoHD) references HOADON(SoHD))

--Insert data
insert into NGK (MaNGK, TenNGK, QuyCach,MaLoaiNGK)
values
	('CC1','Coca Cola', 'Chai', 'NK1'),
	('CC2','Coca Cola', 'Lon', 'NK1'),
	('PS1','Pepsi','Chai','NK1'),
	('PS2','Pepsi','Lon','NK1'),
	('SV1','Seven Up','Chai','NK1'),
	('SV2','Seven Up','Lon','NK1'),
	('NO1','Number One','Chai','NK1'),
	('NO2','Number One','Lon','NK1'),
	('ST1','Sting dau','Chai','NK1'),
	('ST2','Sting dau','Lon','NK1'),
	('C2','Tra C2','Chai','NK2'),
	('OD','Tra xanh 0 do','Chai','NK2'),
	('ML1','Sua tuoi tuyet trung','Bich','NK1'),
	('WT1','Nuoc uong dong chai','Chai','NK2')
	;
insert into LOAINGK (MaLoaiNGK, TenLoaiNGK,MaNCC)
values 
	('NK1','Nuoc ngot co gas','NC1'),
	('NK2','Nuoc ngot khong gas','NC2'),
	('NK3','Tra','NC1'),
	('NK4','Sua','NC2')
	;
insert into NHACC (MaNCC,TenNCC,DiaChiNCC,DTNCC)
values
	('NC1','Cong ty NGK quoc te CocaCola','Xa lo Ha Noi, Thu duc, TP.HCM','088967908'),
	('NC2','Cong ty NGK quoc te Pepsi','Ben Chuong Duong, Quan 1, TP.HCM','083663366'),
	('NC3','Cong ty NGK Ben Chuong Duong','Ham Tu, Q.5, TP.HCM','0894566767')
	;
insert into KH(MaKH,TenKH,DCKH,DTKH)values
	('KH01','Cua hang BT', '144 XVNT', '088405996'),
	('KH02','Cua hang Tra', '198/42 NTT', '085974572'),
	('KH03','Sieu thi Coop', '24 DTH','086547888')
	;
INSERT INTO DDH(SoDDH, NgayDH, MaNCC) VALUES 
    ('DDH01', '2011-05-10', 'NC1'),
    ('DDH02', '2011-05-20', 'NC1'),
    ('DDH03', '2011-05-26', 'NC2'),
    ('DDH04', '2011-06-03', 'NC2');
insert into CT_DDH(SoDDH,MaNGK,SLDat)values
	('DDH01','CC1',20),
	('DDH01','CC2',15),
	('DDH01','PS1',18),
	('DDH01','SV2',12),
	('DDH02','CC2',30),
	('DDH02','PS2',10),
	('DDH02','SV1',5),
	('DDH02','ST1',15),
	('DDH02','C2',10),
	('DDH03','OD',45),
	('DDH04','CC1',8),
	('DDH04','ST2',12)
	;
INSERT INTO PHIEUGHI(SoPGH,NgayGH,SoDDH) VALUES
    ('PGH01','2010-05-12','DDH01'),
    ('PGH02','2010-05-15','DDH01'),
    ('PGH03','2010-05-21','DDH02'),
    ('PGH04','2010-05-22','DDH02'),
    ('PGH05','2010-05-28','DDH03');
insert into CT_PGH(SoPGH,MaNGK,SLGiao,DGGiao) values
	('PGH01','CC1',15,5000),
	('PGH01','CC2',15,4000),
	('PGH01','SV2',10,4000),
	('PGH02','SV2',2,4000),
	('PGH03','CC2',30,5000),
	('PGH03','PS2',10,4000),
	('PGH03','PS2',10,4000),
	('PGH03','ST1',15,9000),
	('PGH03','C2',10,8000);
INSERT INTO HOADON(SoHD,NgayLapHD,MaKH) VALUES
    ('HD01','2010-05-10','KH01'),
    ('HD02','2010-05-20','KH01'),
    ('HD03','2010-06-05','KH02'),
    ('HD04','2010-06-16','KH02'),
    ('HD05','2010-06-22','KH02'),
    ('HD06','2010-07-08','KH03');
INSERT INTO CT_HOADON (SoHD,MaNGK,SLKHMua,DGBan) VALUES
	('HD01','CC1',20,6000),('HD01','CC2',50,5000),
	('HD02','ST1',40,10000),('HD03','SV2',60,5000),
	('HD04','PS2',25,5000),
	('HD05','CC1',100,6000),('HD05','SV1',12,8000),
	('HD05','C2',80,9000),('HD06','OD',55,1000),
	('HD06','ST2',50,11000);
INSERT INTO PHIEUHEN (SoPH,NgayLapPH,NgayHenGiao,MaKH) VALUES
    ('PH01','2010-05-08','2010-06-09','KH01'),
    ('PH02','2010-05-25','2010-06-28','KH02'),
    ('PH03','2010-06-01','2010-06-02','KH03');
INSERT INTO CT_PH (SoPH,MaNGK,SLHen) VALUES
	('PH01','ST2',10),
	('PH01','OD',8),
	('PH02','CC1',20),
	('PH03','ST1',7),
	('PH03','SV2',12),
	('PH03','CC2',9),
	('PH04','PS2',15);
INSERT INTO PHIEUTRANO(SoPTN,NgayTra,SoTienTra,SoHD) VALUES
    ('PTN01','2010-05-18',500000,'HD01'),
    ('PTN02','2010-06-01',350000,'HD01'),
    ('PTN03','2010-06-02',650000,'HD02'),
    ('PTN04','2010-06-15',1020000,'HD03'),
    ('PTN05','2010-07-01',1080000,'HD03');
	
--Foreign key--
alter table NGK add constraint fk_MaLoaiNGK_NGK_LoaiNGK
	foreign key (MaLoaiNGK) references LoaiNGK(MaLoaiNGK);
alter table loaingk add constraint fk_MaNCC_LoaiNGK_NhacCC
	foreign key (MaNCC) references Nhacc(MaNCC);
alter table DDH add constraint fk_MaNCC_DDH_NhaCC
	foreign key (MaNCC) references NHACC(MaNCC);
alter table Phieughi add constraint fk_SoDDH_PhieuGhi_DDH
	foreign key (SoDDH) references DDH(SoDDH);
alter table hoadon add constraint fk_MaKH_HoaDon_KH
	foreign key (MaKH) references KH(MaKH);
alter table phieuhen add constraint fk_MaKH_PhieuHen_KH
	foreign key (MaKH) references KH(MaKH);
alter table phieutrano add constraint fk_SoHD_PhieuTraNo_HoaDon
	foreign key (SoHD) references Hoadon(Sohd);
	
--Bài tập--
--liệt kê các NGK và loại NGK tương ứng
select * from NGK inner join LOAINGK on ngk.MaLoaiNGK = LOAINGK.MaLoaiNGK order by MaNGK ASC;
--Cho biết thông tin về nhà cung cấp ở TP.HCM
select * from NHACC where DiaChiNCC like '%TP.HCM%';
--Liệt kê các hoá đơn mua hàng trong tháng 5/2010
select *  from hoa
--Cho biết tên các nhà cung cấp không có khả năng cung cấp NGK 'Coca Cola'
--Cho biết tên các nhà cung cấp có thể cung cấp nhiều loại NGK nhất
--Cho biết tên nhà cung cấp không có khả năng cung cấp NGK có tên 'Pepsi'
--Hiển thị thông tin của NGK chưa bán được
--Hiển thị tên và tổng số lượng bán của từng NGK
--Hiển thị tên và tổng số lượng của NGK nhập về
--Hiển thị DDH đã đặt NGK với số lượng nhiều nhất so với các DDH khác có đặt NGK đó. Thông tin hiển thị: SoDDH, MaNGK, [SL đặt nhiều nhất]
--Hiển thị các NGK không bán được trong tháng 6/2010
--Cho biết cửa hàng bán bao nhiêu thứ NGK
--Hiển thị thông tin của khách hàng  có giao dịch với cửa hàng nhiều nhất(căn cứ vào số lần mua hàng)
--Tính tổng doanh thu năm 2010 của cửa hàng
--Liệt kê 5 loại NGK bán chạy nhất (doanh thu) trong tháng 5/2010
--Liệt kê thông tin bán NGK của tháng 5/2010. Thông tin hiển thị: Mã NGK, Tên NGK, SL bán
--Liệt kê thông tin của NGK có nhiều người mua nhất.
--Hiển thị ngày nhập hàng của khách có mã là 'KH001'
--Cho biết tổng tiền của từng hoá đơn
--Cho biết danh sách các hoá đơn gồm SoHD, NgaylapHD, MaKH, TenKH và tổng trị giá của từng HoaDon. Danh sách sắp xếp tăng dần theo ngày và giảm dần theo tổng trị giá của hoá đơn.
--Cho biết các hoá đơn có tổng trị giá lớn hơn tổng trị giá trung bình của các hoá đơn  trong ngày 18/06/2010.
--Cho biết số lượng từng NGK tiêu thụ theo từng tháng của năm 2010
--Đưa ra danh sách NGK chưa được bán trong tháng 9 năm 2010
--Đưa ra danh sách khách hàng có địa chỉ ở TP.HCM và từng mua NGK trong tháng 9 năm 2010
--Đưa ra số lượng đã bán tương ứng của từng NGK tại cửa hàng.
--Cho biết trong 2010, khách hàng nào đã mua nợ nhiều nhất
--Có bao nhiêu hoá đơn chưa thanh toán hết số tiền?
--Liệt kê các hoá đơn cùng tên của khách hàng tương ứng đã mua NGK và thanh toán tiền đầy đủ 1 lần.(không có phiếu ghi nợ)
--Thống kê cho biết thông tin đặt hàng của cửa hàng trong năm 2010: Mã NGK, Tên NGK, Tổng SL đặt.
--Để thuận tiện trong việc tặng quà TẾt cho khách hàng, hãy liệt kê danh sách khách hàng đã mua NGK với tổng số tiền tương ứng trong năm 2010 (hiển thị giảm dần theo sô tiền đã mua)

--Phần bổ sung thêm. Không cần quan tâm.	
select * from PHIEUHEN
delete from CT_DDH;
delete from CT_HOADON;
delete from CT_PGH;
delete from DDH;
delete from HOADON;
delete from KH;
delete from LOAINGK;
delete from NGK;
delete from NHACC;
delete from PHIEUGHI;
delete from PHIEUHEN;
delete from PHIEUTRANO;

SET LANGUAGE Vietnamese;
SELECT GETDATE();

ALTER TABLE DDH
DROP CONSTRAINT fk_MaNCC_DDH_NhaCC;

SELECT MaNCC
FROM DDH
WHERE MaNCC NOT IN (SELECT MaNCC FROM NHACC);
