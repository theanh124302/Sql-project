drop DATABASE project;
CREATE DATABASE project;
\c project

-- TABLE DEFINITION

-- chuong( ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
-- co_so_giong ( ma_co_so, ten_co_so, dia_chi, sdt, danh_gia)
-- ke_don( ma_thuoc, ma_benh, lieu_luong)
-- lo_giong ( ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
-- loai ( ma_loai, ten_loai, do_tuoi_xuat_chuong, gia_mua_giong, gia_ban)
-- mam_benh ( ma_benh, ma_loai, ma_thu_y, ten_benh, cach_phong, cach_chua)
-- thu_y ( ma_thu_y, ho_va_ten, so_dien_thoai, CCCD, ngay_sinh, gioi_tinh)
-- thuc_an ( ma_thuc_an, ma_loai, ten_thuc_an, gia_ban, nha_san_xuat, ngay_san_xuat, han_su_dung)
-- lo_thuc_an ( ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai )
-- thuoc ( ma_thuoc, nha_san_xuat, ten_thuoc, gia_ban)
-- vat_nuoi ( ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tuoi, tinh_hinh_tiem_chung)

-- ----------------------------------------------------------------------------
-- Tạo Bảng
SET client_encoding = 'UTF8';
-- chuong( ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
 CREATE TABLE public.chuong (
    ma_chuong character(10) NOT NULL,
    ma_loai character(10) NOT NULL,
    so_luong_toi_da integer NOT NULL,
    so_luong_thuc_te integer NOT NULL,
    CONSTRAINT chuong_pkey PRIMARY KEY (ma_chuong)
);

-- co_so_giong ( ma_co_so, ten_co_so, dia_chi, sdt, danh_gia)
CREATE TABLE public.co_so_giong (
    ma_co_so character varying(10) NOT NULL,
    ten_co_so character varying(100),
    dia_chi character varying(100),
    sdt character varying(12),
    danh_gia character varying(100),
    CONSTRAINT co_so_giong_pkey PRIMARY KEY (ma_co_so)
);

-- ke_don( ma_thuoc, ma_benh)
CREATE TABLE public.ke_don (
    ma_thuoc character(10) NOT NULL,
    ma_benh character(10) NOT NULL,
    lieu_luong text,
    CONSTRAINT ke_don_pkey PRIMARY KEY (ma_thuoc, ma_benh)
);

-- lo_giong ( ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
CREATE TABLE public.lo_giong (
    ma_lo character(20) NOT NULL,
    ma_loai character(10),
    ma_co_so character varying(50),
    so_luong integer,
    ngay_nhap_giong date,
    CONSTRAINT lo_giong_pkey PRIMARY KEY (ma_lo)
);

-- loai ( ma_loai, ten_loai, do_tuoi_xuat_chuong, gia_mua_giong, gia_ban)
CREATE TABLE public.loai (
    ma_loai character(10) NOT NULL,
    ten_loai character varying(10) NOT NULL,
    do_tuoi_xuat_chuong  double precision NOT NULL,
    gia_mua_giong money NOT NULL,
    gia_ban money NOT NULL,
    CONSTRAINT loai_pkey PRIMARY KEY (ma_loai)
);

-- mam_benh ( ma_benh, ma_loai, ma_thu_y, ten_benh, cach_phong, cach_chua)
CREATE TABLE public.mam_benh (
    ma_benh character(10) NOT NULL,
    ma_thu_y  character(10) NOT NULL,
    ma_loai character(10) NOT NULL,
    ten_benh  character(50) NOT NULL,
    cach_phong text,
    cach_chua text,
    CONSTRAINT mam_benh_pkey PRIMARY KEY (ma_benh)
);

-- thu_y ( ma_thu_y, ho_va_ten, so_dien_thoai, CCCD, ngay_sinh, gioi_tinh)
CREATE TABLE public.thu_y (
    ma_thu_y  character(10) NOT NULL,
    ho_va_ten character varying(40) NOT NULL,
    so_dien_thoai character varying(40) NOT NULL,
    CCCD character varying(40) NOT NULL,
    ngay_sinh date NOT NULL,
    gioi_tinh character varying(10) NOT NULL,
    CONSTRAINT thu_y_pkey PRIMARY KEY (ma_thu_y)
);

--lo_thuc_an ( ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai )
CREATE TABLE public.lo_thuc_an (
    ma_lo_thuc_an character varying(20) NOT NULL,
    ma_thuc_an character varying(10) NOT NULL,
    ngay_nhap date,
    nsx date,
    hsd date,
    so_luong_nhap integer,
    so_luong_con_lai integer,
    CONSTRAINT lo_thuc_an_pkey PRIMARY KEY (ma_lo_thuc_an)
);

-- thuc_an ( ma_thuc_an, ma_loai, ten_thuc_an, gia_ban, nha_san_xuat, ngay_san_xuat, han_su_dung)
CREATE TABLE public.thuc_an (
    ma_thuc_an character(10) NOT NULL,
    ma_loai character(10) NOT NULL,
    ten_thuc_an character varying(50) NOT NULL,
    nha_san_xuat character varying(50) NOT NULL,
    gia_mua integer,
    CONSTRAINT thuc_an_pkey PRIMARY KEY (ma_thuc_an)
);

-- thuoc ( ma_thuoc, nha_san_xuat, ten_thuoc, gia_ban)
CREATE TABLE public.thuoc (
    ma_thuoc character(10) NOT NULL,
    nha_san_xuat character varying(50) NOT NULL,
    ten_thuoc character varying(50) NOT NULL,
    dieu_tri text,
    gia_ban integer,
    CONSTRAINT thuoc_pkey PRIMARY KEY (ma_thuoc)
);

-- vat_nuoi ( ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tuoi, tinh_hinh_tiem_chung)
CREATE TABLE public.vat_nuoi (
    ma_ca_the character(10) NOT NULL,
    ma_lo character(20) NOT NULL,
    ma_chuong character(10) NOT NULL,
    ma_loai character(10),
    gioi_tinh character varying(10),
    tinh_hinh_tiem_chung character varying(40),
    ma_benh character(10),
    tuoi double precision,
    CONSTRAINT vat_nuoi_pkey PRIMARY KEY (ma_ca_the)
);

-- Foreign key constraints
ALTER TABLE   public.chuong ADD CONSTRAINT chuong_fk_loai FOREIGN KEY (ma_loai) REFERENCES public.loai(ma_loai);
ALTER TABLE   public.ke_don ADD CONSTRAINT ke_don_fk_mam_benh FOREIGN KEY (ma_benh) REFERENCES public.mam_benh(ma_benh);
ALTER TABLE   public.ke_don ADD CONSTRAINT ke_don_fk_thuoc FOREIGN KEY (ma_thuoc) REFERENCES public.thuoc(ma_thuoc);
ALTER TABLE   public.lo_giong ADD CONSTRAINT lo_giong_fk_loai FOREIGN KEY (ma_loai) REFERENCES public.loai(ma_loai);
ALTER TABLE   public.mam_benh ADD CONSTRAINT mam_benh_fk_loai FOREIGN KEY (ma_loai) REFERENCES public.loai(ma_loai);
ALTER TABLE   public.mam_benh ADD CONSTRAINT mam_benh_fk_thu_y FOREIGN KEY (ma_thu_y) REFERENCES public.thu_y(ma_thu_y);
ALTER TABLE   public.lo_thuc_an ADD CONSTRAINT lo_thuc_an_fk_thuc_an FOREIGN KEY (ma_thuc_an) REFERENCES public.thuc_an(ma_thuc_an);
ALTER TABLE   public.thuc_an ADD CONSTRAINT thuc_an_fk_loai FOREIGN KEY (ma_loai) REFERENCES public.loai(ma_loai);
ALTER TABLE   public.vat_nuoi ADD CONSTRAINT vat_nuoi_fk_chuong FOREIGN KEY (ma_chuong) REFERENCES public.chuong(ma_chuong);
ALTER TABLE   public.vat_nuoi ADD CONSTRAINT vat_nuoi_fk_lo_giong FOREIGN KEY (ma_lo) REFERENCES public.lo_giong(ma_lo);
ALTER TABLE   public.vat_nuoi ADD CONSTRAINT vat_nuoi_fk_loai FOREIGN KEY (ma_loai) REFERENCES public.loai(ma_loai);

set client_encoding = 'UTF8' ;

-- 1Insert data into public.loai
insert into public.loai (ma_loai, ten_loai, gia_mua_giong, gia_ban, do_tuoi_xuat_chuong)
values('ML01','Gà',14500,	160000,	4);
insert into public.loai (ma_loai, ten_loai, gia_mua_giong, gia_ban, do_tuoi_xuat_chuong)
values('ML02','Vịt',18000,	50000,	3.5);
insert into public.loai (ma_loai, ten_loai, gia_mua_giong, gia_ban, do_tuoi_xuat_chuong)
values('ML03','Ngan',14000,	120000,	3.5);
insert into public.loai (ma_loai, ten_loai, gia_mua_giong, gia_ban, do_tuoi_xuat_chuong)
values('ML04','Bò',7000000,	25000000,	20);
insert into public.loai (ma_loai, ten_loai, gia_mua_giong, gia_ban, do_tuoi_xuat_chuong)
values('ML05','Lợn',800000,	4500000,	7);
insert into public.loai (ma_loai, ten_loai, gia_mua_giong, gia_ban, do_tuoi_xuat_chuong)
values('ML06','Dê',1500000,	4300000,	6);

-- 2Insert data into public.chuong
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CG01','ML01',30,30);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CG02','ML01',30,30);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CG03','ML01',30,30);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CG04','ML01',30,30);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CB01','ML04',10,6);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CB02','ML04',10,7);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CB03','ML04',10,8);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CD01','ML06',15,6);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CD02','ML06',15,11);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CL01','ML05',15,9);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CL02','ML05',15,8);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CL03','ML05',15,15);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CN01','ML03',30,17);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CN02','ML03',30,20);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CV01','ML02',30,23);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CV02','ML02',30,23);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CCL01','ML01',30,0);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CCL02','ML02',30,0);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CCL03','ML03',30,0);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CCL04','ML04',30,0);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CCL05','ML05',30,0);
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CCL06','ML06',30,0);

-- 3Insert data into public.co_so_giong
insert into public.co_so_giong (ma_co_so, ten_co_so, dia_chi, sdt, danh_gia)
values('CSNXA',	'Trang trại Nguyễn Xuân An - Cơ sở phân phối giống uy tín hàng đầu miền Bắc	','2R3W+QJ8, Trần Đại Nghĩa, Bách Khoa, Hai Bà Trưng, Hà Nội'	,0987654321, null)	;
insert into public.co_so_giong (ma_co_so, ten_co_so, dia_chi, sdt, danh_gia)
values('CSHTA',	'Trang trại gia cầm Hoàng Thế Anh - Giống tốt giá rẻ',	'33/2 P. Lê Thanh Nghị, Bách Khoa, Hai Bà Trưng, Hà Nội'	,0123123123, null	);
insert into public.co_so_giong (ma_co_so, ten_co_so, dia_chi, sdt, danh_gia)
values('CSLTA',	'Bò giống Lê Thế Anh - Bò giống to đẹp hàng đầu Việt Nam',	'1 Đại Cồ Việt, Bách Khoa, Hai Bà Trưng, Hà Nội'	,0123456789, 'n');

---- 4Insert data into public.thu_y
insert into public.thu_y (ma_thu_y, ho_va_ten, so_dien_thoai, CCCD, ngay_sinh, gioi_tinh)
values('LTA0018',   	'Le The Anh',	'1234566543',	'123456789987'	,'2002-08-19',	'Nam');
insert into public.thu_y (ma_thu_y, ho_va_ten, so_dien_thoai, CCCD, ngay_sinh, gioi_tinh)
values('NXA4937',   	'Nguyen Xuan An',	'2354122639',	'123427198549'	,'2002-06-04',	'Nam');
insert into public.thu_y (ma_thu_y, ho_va_ten, so_dien_thoai, CCCD, ngay_sinh, gioi_tinh)
values('HTA4938',   	'Hoang The Anh',	'1233214567',	'2444666666'	,'2002-02-27',	'Nam');

-- 5Insert data into public.lo_giong
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LG0105072022',        	'ML01',      	'CSHTA',	30,	'2022-07-05');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LG0106072022',        	'ML01',      	'CSHTA',	30,	'2022-07-06');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LG0205072022',        	'ML01',      	'CSHTA',	30,	'2022-07-05');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LG0305072022',        	'ML01',      	'CSHTA',	30,	'2022-07-05');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LN0106072022',        	'ML03',      	'CSHTA',	30,	'2022-07-06');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LN0206072022',        	'ML03',      	'CSHTA',	30,	'2022-07-06');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LV0106072022',        	'ML02',      	'CSHTA',	30,	'2022-07-06');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LV0206072022',        	'ML02',      	'CSHTA',	30,	'2022-07-06');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LB0105072019',        	'ML04',      	'CSLTA',	10,	'2019-07-05');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LB0207072019',        	'ML04',      	'CSLTA',	10,	'2019-07-07');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LB0305072022',        	'ML04',      	'CSLTA',	10,	'2022-07-05');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LL0208072021',        	'ML05',      	'CSNXA',	15,	'2021-07-08');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LL0305072022',        	'ML05',      	'CSNXA',	15,	'2022-07-05');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LD0106072021',        	'ML06',      	'CSNXA',	15,	'2020-07-06');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LD0207072022',        	'ML06',      	'CSNXA',	15,	'2022-07-07');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LL0102012022',        	'ML05',      	'CSNXA',	15,	'2020-01-01');
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LB0105072021',        	'ML04',      	'CSLTA',	10,	'2021-07-05');

-- 6Insert data into public.mam_benh
insert into public.mam_benh (ma_benh,ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BV001','HTA4938','ML02','Bệnh tụ huyết trùng','Kiểm tra kỹ sức khoẻ của đàn vịt. Tiêm vắc xin cho vịt khi mới nuôi kết hợp thăm nom, kiểm tra sức khoẻ, vệ sinh chuồng trại tạo điều kiện tốt nhất cho vịt sinh sống.', 	'tiêm cho toàn đàn bằng một trong các loại thuốc như: BIO FLODOXY, GENTAMYCIN, LINSPEC 5/10… \n\nTiêm liên tiếp 3 ngày, kết hợp cho uống thuốc hạ sốt và điện giải.\n\nSau đó cho uống một trong các loại sau từ 3-5 ngày để trị dứt điểm bệnh: BIO AMOXICILLIN 50%, BIO AMPI COLI MAX, HANFLOR 20 % ORAL…' );
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BG004','LTA0018','ML01','Bệnh gà ủ rũ','Giữ vệ sinh chuồng trại\nTiêm kháng thể Gumboro trong ngày thứ 5 để tăng miễn dịch',	'Bổ sung vitamin B, C và các khoáng chất giúp gà đào thải chất độc nhanh hơn. Người chăn nuôi có thể sử dụng các loại kháng sinh như Genta-costrim, Colidox – plus,.. theo liều lượng và hướng dẫn của cơ sở y tế.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BG005','LTA0018','ML01','Bệnh đầu đen','Để phòng tránh bệnh đầu đen, chuồng trại cần được giữ vệ sinh theo tiêu chuẩn. Dung dịch Nano Bạc trong chăn nuôi giúp tiêu diệt ký sinh trùng và vi khuẩn gây hại. Sân vườn cũng cần được rắc vôi bột giúp ngăn chặn trứng ký sinh trùng.',	'Các loại thuốc có tác dụng chữa bệnh đầu đen là metronidazole (50-60mg/kg trọng lượng/ngày) dimetridazole, ronidazole,ipronidazole. Người chăn nuôi duy trì bơm thuốc cho gà liên tục trong 3 – 5 ngày. Bên cạnh đó, các dinh dưỡng trong Mega Men giúp chữa trị các bệnh gây ra bởi E.coli.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BG001','LTA0018','ML01','Bệnh sổ mũi truyền nhiễm', 'Xây dựng chuồng trại kín gió, tránh mưa dột, ẩm thấp\nPhun thuốc sát trùng đều đặn 2-3 lần/tháng\nBổ sung dinh dưỡng để tăng sức đề kháng','Nếu thấy gà có những biểu hiện của bệnh coryza, người chăn nuôi nên lập tức cách ly gà bệnh. Các cán bộ y tế địa phương sẽ có trách nhiệm tiêm kháng sinh và kiểm tra tổng thể sức khỏe đàn gà. Các kháng sinh được sử dụng là Moxcolis, Amoxy, Nexymix.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BG002','LTA0018','ML01','Bệnh nhiễm trùng đường hô hấp', 'Giữ vệ sinh chuồng trại với dung dịch Nano Bạc trong chăn nuôi. Liều lượng: 100ml/ 200 – 400m2 nền chuồng\nBổ sung dinh dưỡng trong thức ăn',	'Bệnh Gumboro hoàn toàn có thể chữa trị nếu được phát hiện sớm. Các phương pháp điều trị hữu hiệu nhất là tăng cường hệ miễn dịch cho gà. Kháng thể KTG có chứa K+ Glucose, Paracetamol vitamin C giúp cơ thể gà sản sinh chất miễn dịch.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BG003','LTA0018','ML01','Bệnh viêm túi huyệt', 'Giữ vệ sinh chuồng trại bằng Nano Bạc trong chăn nuôi.\nĐảm bảo độ thông thoáng và thay lớp trấu lót thường xuyên để tránh ẩm mốc\n','Tăng cường dinh dưỡng và các chất trợ sức hữu cơ như Megacid L, Megacid L+	Bệnh ORT xuất hiện rất nhiều vào các mùa mưa. Việc sử dụng kháng sinh gặp nhiều khó khăn. Một phần nguyên nhân là do sự kháng kháng sinh trong chăn nuôi. Vì thế trước khi cho gà uống kháng sinh, nông dân nên hạ sốt cho đàn gà. Kháng sinh được sử dụng đều đặn trong 2 – 3 ngày trị bệnh. Một số loại kháng sinh tham khảo là Kháng sinh thảo dược chăn nuôi, Moxcin Vet 50,…');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BV002','HTA4938','ML02','Bệnh dịch tả vịt','Tiêm phòng cho vịt mới nuôi bằng vắc xin dịch tả vịt lúc 2 tuần và tiêm lại khi 2 tháng tuổi. Vịt sinh sản thì tiêm vắc xin dịch tả nhắc lại 6 tháng một lần. Kết hợp với chăm sóc và dọn dẹp chuồng vịt định kì.', 	 'Bệnh do virus gây ra nên chỉ có thể phòng ngừa là chủ yếu, chưa có thuốc đặc trị.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BV003','HTA4938','ML02','Bệnh viêm gan virut','tiêm phòng vắc xin cho vịt con và vịt trưởng thành, cách ly vịt con 1- 5 tuần tuổi tránh lây nhiễm.',	 'Vì không có thuốc đặc trị nên bệnh thường gặp ở vịt chỉ phòng ngừa bệnh là chủ yếu');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BV004','HTA4938','ML02','Bệnh tụ cầu trùng','Giữ vệ sinh chuồng trại',	'Tiêm kháng sinh thẳng vào khớp: Streptomycin hoặc Penicilline ');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BN001','HTA4938','ML03','Bệnh tụ huyết trùng',null,null);
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BN002','HTA4938','ML03','Bệnh dịch tả vịt', null,null);
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BN003','HTA4938','ML03','Bệnh viêm gan virut', null,null);
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BN004','HTA4938','ML03','Bệnh tụ cầu trùng', null,null);
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BB001','NXA4937','ML04','Bệnh lở mồm long móng','Tiêm vắc xin phòng bệnh lở mồm long móng mỗi năm 2 lần, cách nhau 6 tháng. Tiêm phòng lần đầu cho bê nghé từ 4 tuần tuổi trở lên và tiêm nhắc lại sau 4 tuần để tạo miễn dịch chắc chắn. Sau đó cứ 6 tháng tiêm nhắc lại 1 lần.','	Không có thuốc chữa đặc hiệu, chỉ xử lý các vết loét bằng thuốc sát trùng như xanh mêthylen, cồn i-ốt hoặc dùng các chất chua như axit xitric 1%, axit axêtíc 2%, thuốc tím 0,1% hay các quả chua như chanh, khế, chà sát vào các mụn loét trong miệng.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BB002','NXA4937','ML04','Bệnh tụ huyết trùng','Tiêm vắc xin phòng bệnh tụ huyết trùng trâu bò 2 lần một năm.',	'Dùng kháng huyết thanh chống bệnh tụ huyết trùng trâu bò, tiêm dưới da trâu bò 60-100ml; bê nghé 20-40ml.\nDùng các loại kháng sinh sau đây: Streptomycine, Kanamycin, Oxytetracyline, Gentamycin, tiêm ngày 2 lần, tiêm liền trong 4 đến 5 ngày, ngoài ra cần trợ sức, trợ lực cho con vật.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BB003','NXA4937','ML04','Bệnh sán lá gan',null,	'dùng Dertil-B, thuốc ít độc. Trâu, bò dùng 4mg/kg trọng lượng đưa thuốc qua đường miệng. Có thể tẩy sán lá gan bằng phương pháp tiêm dung dịch Fasinex, Fasciolid theo chỉ dẫn của nhà sản xuất');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BB004','NXA4937','ML04','Bệnh chướng hơi dạ cỏ',null,	'Cho vật nhịn ăn 1-2 ngày, sau đó cho ăn rơm, cỏ khô, không cho ăn thức ăn dễ lên men sinh hơi.\nTìm mọi cách làm thoát hơi trong dạ cỏ.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BL001','LTA0018','ML05','Bệnh dịch tả heo','phải tiêm phòng Vắc xin đúng lịch trình, khi lợn mới mua về phải nhốt riêng ra ít nhất 3 tuần, để tránh trường hợp lợn lây bệnh cho đàn. Chuồng trại phải luôn vệ sinh định kỳ, sát trùng, khi có dịch xảy ra lợn bệnh phải được xử lý ngay kịp thời.',	'Hiện tại chưa có thuốc đặc trị');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BL002','NXA4937','ML05','Bệnh tụ huyết trùng','Tiêm vaccin tụ huyết trùng heo keo phèn, đối với heo nái tiêm phòng trước khi phối giống, đối với heo con tiêm khi heo được 40 – 45 ngày tuổi. Tiêm cho heo vào gốc tai với liều lượng theo hướng dẫn của nhà sản xuất. Sau khi tiêm 8 – 14 ngày thì vaccin mới bắt đầu phát huy tác dụng và hiệu quả phòng ngừa bệnh kéo dài từ 4 – 5 tháng. Vì vậy nên tiêm phòng cho heo theo định kỳ 4 – 5 tháng 1 lần. Ngoài việc tiêm phòng, cần chú ý cải thiện điều kiện vệ sinh thú y', 	 'phối hợp giữa Streptomicine với liều 20 – 40 mg/kg thể trọng và Penicillin với liều 20.000 – 40.000 IU/kg thể trọng hoặc dùng Terramicin 10 – 20 mg/kg thể trọng. Để nâng cao hiệu quả điều trị, cần phối hợp với những loại thuốc trị triệu chứng như thuốc giảm sốt (Analgine), thuốc giảm ho (Eucalyptin), thuốc kháng viêm (Dexamethasone), thuốc trợ lực trợ sức (Cafein, Vitamin C, B Complex …).'   );
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BL003','LTA0018','ML05','Bệnh lở mồm long móng', ' thường xuyên quan sát đàn vật nuôi, khi thấy gia súc có hiện tượng lạ như sốt, bỏ ăn, chảy nước dãi, có bọt có mụn nước ở vùng miệng và quanh móng chân phải tiến hành cách ly ngay.'	,null);
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BD001','LTA0018','ML06','Bệnh viêm phổi','Giữ chuồng trại khô ráo, sạch sẽ, thoáng mát vào mua hè và ấm áp vào mùa đông. Định kỳ tẩy uế chuồng nuôi bằng nước vôi 10% hoặc axit phenic 2%. Cho dê ăn uống tốt, bảo đảm đủ dinh dưỡng; thức ăn, nước uống phải sạch sẽ. Phát hiện sớm những con dê bị bệnh, nuôi cách ly và điều trị kịp thời.\n',	'Điều trị nhiễm khuẩn: sử dụng một trong các loại kháng sinh sau đây trong 4 – 5 ngày liên tục: Tylosin, liều 11mg/kg khối lượng /ngày; Gentamycin, liều 15mg/kg khối lượng /ngày; Streptomycin, liều 30mg/kg khối lượng/ ngày; Dùng vitamin B1, vitamin C; Chăm sóc và nuôi dưỡng tốt.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BD002','HTA4938','ML06','Bệnh ỉa chảy',null,'Khi phát hiện phân dê có hiện tượng bất thường, điều trị bằng cách cho dê ăn hoặc uống nước lá ổi, lá quả hồng xiêm, búp sim… Kết hợp cloramfenicon ngày 2-4 viên/con lớn.');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BD003','HTA4938','ML06','Bệnh viêm vú',null,'Chườm vú nhiều lần bằng nước nóng có pha muối 5%. Sau đó đắp cao tan vào vú viêm. Vệ sinh vú sạch sẽ hàng ngày, đồng thời vệ sinh dụng cụ vắt sữa.\n');
insert into public.mam_benh (ma_benh, ma_thu_y, ma_loai, ten_benh, cach_phong, cach_chua)
values('BD004','NXA4937','ML06','Bệnh giun sán', 'Không cho dê ăn những giống cỏ trồng ở vùng ngập nước. Nếu có thì nên phơi nắng  trong một ngày để các ấu trùng đó chết đi, và giảm lượng nước trong cỏ. Như vậy dê ăn sẽ không bị tiêu chảy, không bị giun sán.',	 'Dùng dextrin - B phòng định kỳ và điều trị với dê đã mắc bệnh.');

-- 7Insert data into public.thuc_an
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAG001',    	'ML01',      	'Cám gà JAPFA Việt Nam (bao 25kg)',	'CÔNG TY JAPFA VIỆT NAM',	99000   );
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAG002',    	'ML01',      	'Cám con cò (bao 25kg)',	'CÔNG TY PROCONCO',	124000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAG003',    	'ML01',      	'Cám cargill (bao 25kg)',	'CÔNG TY TNHH CARGILL Việt Nam',	200000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAN001',    	'ML03',      	'Cám LTA (bao 25kg)',	'CÔNG TY PROCONCO',	100000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAV001',    	'ML02',      	'Cám ANOVA (bao 25kg)',	'CÔNG TY ANOVA',	120000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAV002',    	'ML02',      	'Cám VIT (bao 25kg)',	'CÔNG TY TNHH CARGILL Việt Nam',	110000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAB001',    	'ML04',      	'Cỏ Ba Vì (1 tấn)',	'CÔNG TY TNHH Hoàng Thế Anh',	2500000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAL001',    	'ML05',      	'Cám bio-zeem (bao 25kg)',	'CÔNG TY PROCONCO',	200000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAL002',    	'ML05',      	'Cám biotech (bao 25kg)',	'CÔNG TY DARBIO',	180000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAD001',    	'ML06',      	'A35-S dạng viên (bao 25kg)',	'CÔNG TY ANOVA',	200000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAD002',    	'ML06',      	'Cỏ Ba Vì (1 tấn)',	'CÔNG TY TNHH Hoàng Thế Anh',	2500000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAB002',    	'ML04',      	'NOVA 5010 - T (bao 25kg)',	'CÔNG TY ANOVA',	200000);
insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAN002',    	'ML03',      	'Cám ANOVA (bao 25kg)',	'CÔNG TY ANOVA',	120000);

-- 8Insert data into public.lo_thuc_an
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAG0101072022',	'TAG001',	'2022-07-01',	'2022-05-01',	'2023-12-01',	20,	18);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAG0201072022',	'TAG002',	'2022-07-01',	'2022-05-01',	'2023-12-01',	20,	19);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAG0102072022',	'TAG003',	'2022-07-02',	'2022-05-01',	'2023-12-01',	20,	19);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAV0101072022',	'TAV001',	'2022-07-01',	'2022-05-01',	'2023-12-01',	15,	13);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAV0201072022',	'TAV002',	'2022-07-01',	'2022-05-01',	'2023-12-01',	15,	13);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAN0201072022',	'TAN001',	'2022-07-01',	'2022-05-01',	'2023-12-01',	15,	14);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAN0101072022',	'TAN002',	'2022-07-01',	'2022-05-01',	'2023-12-01',	15,	14);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAB0101032022',	'TAB001',	'2022-07-07',	'2022-05-07',	'2023-07-28',	4,	1);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAB0201032022',	'TAB002',	'2022-07-01',	'2022-05-01',	'2023-12-01',	15,	14);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAD0101032022',	'TAD001',	'2022-06-01',	'2022-05-01',	'2023-12-01',	15,	12);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAD0201012022',	'TAD002',	'2022-07-05',	'2022-05-05',	'2023-08-04',	3,	1);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAL0201072022',	'TAL002',	'2022-07-01',	'2022-05-28',	'2023-11-28',	20,	14);
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAL0101072022',	'TAL001',	'2022-07-01',	'2022-05-01',	'2023-12-01',	20,	15);

-- 9Insert data into public.thuoc
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TG001',     	'tGeneral Drugs House Co., LTD – Thailand',	'Amoxycillin',	'Mycoplasma gallisepticum, E. coli, Tụ huyết trùng, Sổ mũi truyền nhiễm (Coryza) PRDC');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TG002',     	'Công ty TNHH Dược Phẩm Thú y Thịnh Vượng',	'AMOXY-WS',	'– Trị viêm phổi, tiêu chảy, viêm rốn, viêm khớp trên gia súc, gia cầm non, nhiễm trùng đường hô hấp.\n\n– Viêm vú trên bò sữa, tiêu chảy trên trâu, bò, dê, cừu, heo.');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TG003',     	'CÔNG TY GENERAL DRUGS HOUSE',	'Moxcin Vet 50',	'Trị nhiễm khuẩn đường hô hấp, đường tiêu hóa trên gia súc, gia cầm.');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TG004',     	'ANOVA',	'NOVA-PARA C',	'Bệnh viêm túi huyệt nguy hiểm BG003');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TG005',     	'Công ty TNHH Dược Hanvet',	'GENTA-COSTRIM',	'Gia cầm: chữa các bệnh nhiễm khuẩn gây viêm ruột - ỉa chảy phân trắng, phân xanh; bệnh đường hô hấp, CRD, viêm phổi-phế; bệnh tụ huyết trùng, thương hàn, các bệnh kế phát Gumboro...\n- Lợn, trâu, bò, dê: chữa các bệnh nhiễm khuẩn đường ruột, hô hấp, tiết niệu, sinh dục, các bệnh da, viêm vú...');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TNV001',    	'Công ty TNHH Dược Hanvet',	'LINSPEC 5/10',	'Tụ huyết trùng ở gia cầm');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TNV002',    	'Công ty liên doanh Bio – Pharmachemie',	'BIO FLODOXY',	'Trị thương hàn, viêm ruột tiêu chảy, E.coli; Tụ huyết trùng, viêm phổi, viêm khớp, sưng phù đầu, viêm tử cung, viêm vú trên heo, bê, nghé, dê, cừu, gia cầm, chó, mèo');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TG006',     	'Vinmec',	'Metronidazole',	'Bệnh đầu đen ở gà');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TNV003',    	'Vinmec',	'Streptomycin',	'Tụ cầu trùng');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TB001',     	'Công ty TNHH Dược Hanvet',	'Gentamycin',	'hỗ tợ Tụ huyết trùng trâu bò');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TB002',     	'Công ty TNHH Dược Hanvet',	'HAN-DERTIL-B',	'Tẩy sán lá gan cả ấu trùng và sán trưởng thành, sán lá ống mật, sán lá dạ cỏ, sán lá ruột ở trâu, bò, lợn, dê, cừu.\n- Tẩy sán lá dây và các loại giun tròn ở trâu, bò, lợn, dê, cừu.');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TL001',     	'Nhà máy GMP-WHO',	'Terramicin',	'hỗ trợ tụ huyết trùng lợn');
insert into public.thuoc (ma_thuoc, nha_san_xuat, ten_thuoc, dieu_tri)
values('TD001',     	'Vinmec',	'Cloramphenicol',	'tiêu chảy ở gia sức');

-- 10Insert data into public.vat_nuoi
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0117',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	null,	'BG003',     	2         );
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0205',     	'LB0207072019',        	'CB02',      	'ML04',      	'M',	'Đã tiêm',	null,	24);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0107',     	'LD0106072021',        	'CD01',      	'ML06',      	'M',	'Đã tiêm',	null,	12);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0104',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	'BG001',     	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0105',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0106',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0107',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0203',     	'LB0207072019',        	'CB02',      	'ML04',      	'M',	null,	null,	24);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0204',     	'LB0207072019',        	'CB02',      	'ML04',      	'M',	null,	null,	24);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0108',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	'BG004',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0109',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0110',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0111',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0105',     	'LD0106072021',        	'CD01',      	'ML06',      	'M',	null,	null,	12);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0114',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0115',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0116',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	'BG003',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0123',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	null,	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0125',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	null,	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0118',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0119',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0208',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	null,	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0120',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0214',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	null,	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0216',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	null,	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0218',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	null,	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0121',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	'BG002',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0208',     	'LL0208072021',        	'CL02',      	'ML05',      	'M',	null,	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0101',    	'LB0105072019',        	'CB01',      	'ML04',      	'M',	'Đã tiêm',	null,	12);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0308',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	null,	'BL003',     	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0102',     	'LB0105072019',        	'CB01',      	'ML04',      	'M',	'Đã tiêm',	null,	13);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0103',     	'LB0105072019',        	'CB01',      	'ML04',      	'M',	null,	'BB003',     	12);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0104',     	'LB0105072019',        	'CB01',      	'ML04',      	'M',	'Đã tiêm',	null,	14);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0102',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	null,	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0105',     	'LB0105072019',        	'CB01',      	'ML04',      	'M',	null,	'BB004',     	12);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0106',     	'LB0105072019',        	'CB01',      	'ML04',      	'M',	'Đã tiêm',	null,	13);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0206',     	'LB0207072019',        	'CB02',      	'ML04',      	'M',	'Đã tiêm',	'BB003',     	20);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0106',     	'LD0106072021',        	'CD01',      	'ML06',      	'M',	'Đã tiêm',	null,	13);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0108',     	'LD0106072021',        	'CD01',      	'ML06',      	'M',	'Đã tiêm',	null,	13);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0110',     	'LD0106072021',        	'CD01',      	'ML06',      	'M',	'Đã tiêm',	'BD003',     	12);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0202',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	null,	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0203',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	null,	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0204',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	'BD004',     	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0205',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	null,	5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0206',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	null,	5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0207',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	null,	5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0208',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	null,	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0103',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0122',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0124',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0126',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	'BG005',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0127',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0128',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0129',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0130',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0201',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0202',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	'BG002',     	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0203',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0204',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0205',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0206',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0209',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0210',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	'BG003',     	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0212',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0213',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	'BG001',     	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0215',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0217',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0220',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	'BG004',     	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0221',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	'BG004',     	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0223',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0224',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0225',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0226',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0228',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0230',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0301',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	'BG001',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0302',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0303',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0109',     	'LD0106072021',        	'CD01',      	'ML06',      	'M',	null,	'BD001',     	12);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0210',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	null,	null,	7);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0307',     	'LB0305072022',        	'CB03',      	'ML04',      	'M',	null,	'BB001',     	20);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0308',     	'LB0305072022',        	'CB03',      	'ML04',      	'M',	null,	'BB001',     	18);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0207',     	'LB0207072019',        	'CB02',      	'ML04',      	'M',	'Đã tiêm',	null,	19);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0208',     	'LB0207072019',        	'CB02',      	'ML04',      	'M',	'Đã tiêm',	'BB004',     	20);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0209',     	'LB0207072019',        	'CB02',      	'ML04',      	'M',	'Đã tiêm',	null,	20);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0301',     	'LB0305072022',        	'CB03',      	'ML04',      	'M',	'Đã tiêm',	null,	20);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0113',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	null,	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0302',     	'LB0305072022',        	'CB03',      	'ML04',      	'M',	'Đã tiêm',	null,	18);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0303',     	'LB0305072022',        	'CB03',      	'ML04',      	'M',	'Đã tiêm',	null,	19);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0304',     	'LB0305072022',        	'CB03',      	'ML04',      	'M',	'Đã tiêm',	null,	19);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0309',     	'LB0305072022',        	'CB03',      	'ML04',      	'M',	'Đã tiêm',	null,	19);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('B0310',     	'LB0305072022',        	'CB03',      	'ML04',      	'M',	'Đã tiêm',	'BB001',     	19);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0211',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	'BD003',     	5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0404',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	null,	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0214',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	'BD003',     	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('D0215',     	'LD0207072022',        	'CD02',      	'ML06',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0101',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0428',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	null,	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0112',     	'LG0105072022',        	'CG01',      	'ML01',      	'M',	null,	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0219',     	'LG0205072022',        	'CG02',      	'ML01',      	'M',	null,	null,	4.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0409',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	null,	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0209',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	null,	'BN003',     	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0213',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	null,	'BN004',     	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0106',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	null,	'BV001',     	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0109',    	'LV0106072022',        	'CV01',      	'ML02',      	'F',	null,	'BV002',     	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0113',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	null,	'BV002',     	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0126',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	null,	'BV004',     	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0209',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	null,	'BV003',     	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0304',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0305',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0306',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0307',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0308',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0309',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	'BG003',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0312',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0313',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0314',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0315',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0316',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0318',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0319',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	'BG003',     	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0320',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0321',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0322',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0323',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0324',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0325',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0326',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	'BG005',     	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0327',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0328',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0329',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0330',     	'LG0305072022',        	'CG03',      	'ML01',      	'M',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0401',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0403',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0405',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0406',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0407',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0408',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0410',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0411',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0412',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	'BG001',     	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0413',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0414',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0415',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0416',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0417',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0418',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0419',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0420',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0421',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0422',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0423',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0424',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0426',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0427',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0429',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0430',     	'LG0106072022',        	'CG04',      	'ML01',      	'M',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0101',     	'LL0102012022',        	'CL01',      	'ML05',      	'M',	'Đã tiêm',	'BL001',     	5.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0102',     	'LL0102012022',        	'CL01',      	'ML05',      	'M',	'Đã tiêm',	'BL001',     	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0103',     	'LL0102012022',        	'CL01',      	'ML05',      	'M',	'Đã tiêm',	'BL001',     	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0104',     	'LL0102012022',        	'CL01',      	'ML05',      	'M',	'Đã tiêm',	null,	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0105',     	'LL0102012022',        	'CL01',      	'ML05',      	'M',	'Đã tiêm',	null,	5.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0106',     	'LL0102012022',        	'CL01',      	'ML05',      	'M',	'Đã tiêm',	null,	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0107',     	'LL0102012022',        	'CL01',      	'ML05',      	'M',	'Đã tiêm',	null,	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0108',     	'LL0102012022',        	'CL01',      	'ML05',      	'M',	'Đã tiêm',	null,	6.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0109',     	'LL0102012022',        	'CL01',      	'ML05',      	'M',	'Đã tiêm',	'BL001',     	6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0205',     	'LL0208072021',        	'CL02',      	'ML05',      	'M',	'Đã tiêm',	'BL002',     	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0206',     	'LL0208072021',        	'CL02',      	'ML05',      	'M',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0207',     	'LL0208072021',        	'CL02',      	'ML05',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0209',     	'LL0208072021',        	'CL02',      	'ML05',      	'M',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0212',     	'LL0208072021',        	'CL02',      	'ML05',      	'M',	'Đã tiêm',	'BL003',     	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0213',     	'LL0208072021',        	'CL02',      	'ML05',      	'M',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0214',     	'LL0208072021',        	'CL02',      	'ML05',      	'M',	'Đã tiêm',	'BL002',     	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0301',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0302',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0303',     	'LL0305072022',        	'CL03',      	'ML05',	        'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0304',     	'LL0305072022',        	'CL03',      	'ML05',	        'F',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0305',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0306',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0307',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0309',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0310',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0311',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0312',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0313',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0314',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('L0315',     	'LL0305072022',        	'CL03',      	'ML05',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0102',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0103',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	'BN001',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0104',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0105',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0106',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0108',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0109',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0110',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	'BN001',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0111',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0112',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0118',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0119',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0120',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0124',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	null,	'BN003',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0125',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0126',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	null,	'BN002',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0127',     	'LN0106072022',        	'CN01',      	'ML03',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0201',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0203',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0204',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0205',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0206',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0207',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0208',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0210',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0212',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0214',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0215',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0216',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0217',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0218',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0219',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0220',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0221',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	'BN004',     	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('N0222',     	'LN0206072022',        	'CN02',      	'ML03',      	'F',	'Đã tiêm',	null,	1);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0101',    	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0102',    	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0103',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0104',   	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0105',    	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0107',    	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0108',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	4);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0110',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0112',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0115',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0116',    	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0117',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0118',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0119',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0120',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0124',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0125',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0127',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0128',     	'LV0106072022',        	'CV01',      	'ML02',      	'F',	'Đã tiêm',	null,	3.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0201',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0202',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0204',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0205',    	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0206',    	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0207',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0208',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0210',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0212',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0213',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0214',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0216',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0217',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0219',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0220',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0222',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	null,	'BV003',     	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0223',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0224',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0225',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	1.5);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0227',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0229',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('V0230',     	'LV0206072022',        	'CV02',      	'ML02',      	'M',	'Đã tiêm',	null,	2);

-- 11Insert data into public.ke_don
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TG001',     	'BG001',     	'- 1 g/ 5 – 6 lít nước uống \n- 1 g/ 2 – 3 kg thức ăn');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TG001',     	'BV001',     	'- 1 g/ 5 – 6 lít nước uống \n- 1 g/ 2 – 3 kg thức ăn');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TG002',     	'BG002',     	'1 g/ 4 – 5 lít nước uống hoặc 1 g/ 1,5 – 2 kg thức ăn hoặc 1 g/ 50 – 60 kg thể trọng.');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TG004',     	'BG003',     	'1 g / lít nước hoặc 2 g/ kg thức ăn');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV001',    	'BV001',     	'1 ml/5 kg TT.');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TG006',     	'BG005',     	'50-60mg/kg trọng lượng/ngày');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV001',    	'BN001',     	'1 ml/5 kg TT');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV001',    	'BG001',     	'1 ml/5 kg TT');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TG005',     	'BG004',     	'1 gam/2 lít nước uống hoặc trộn 1-1,5 kg thức ăn');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV002',    	'BN001',     	'1 ml/5 kg TT');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV002',    	'BV001',     	'1 ml/5 kg TT');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TG001',     	'BN001',     	'- 1 g/ 5 – 6 lít nước uống \n- 1 g/ 2 – 3 kg thức ăn');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV003',    	'BN004',     	'100- 150mg/ kg thể trọng');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV003',    	'BV004',     	'100- 150mg/ kg thể trọng');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV001',    	'BB002',     	null);
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TB001',     	'BB002',     	 '2-4ml/100 kg TT');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TB002',     	'BB003',     	'1 viên/50 kg TT');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV003',    	'BB002',     	'5-7 ml/100 kg TT');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TG001',     	'BB002',     	'1 g/ 4 – 5 lít nước uống hoặc 1 g/ 1,5 – 2 kg thức ăn hoặc 1 g/ 50 – 60 kg thể trọng.');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV003',    	'BL002',     	'1 ml/10 kg TT.');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TG001',     	'BL002',     	'1 g/ 4 – 5 lít nước uống hoặc 1 g/ 1,5 – 2 kg thức ăn hoặc 1 g/ 50 – 60 kg thể trọng.');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TB001',     	'BL002',     	 '2-4ml/100 kg TT');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV003',    	'BL003',     	 '20 – 40 mg/kg');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TL001',     	'BL002',     	'10 – 20 mg/kg thể trọng');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TB002',     	'BD001',     	'15mg/kg khối lượng /ngày');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TNV003',    	'BD001',     	'30mg/kg khối lượng/ ngày');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TD001',     	'BD002',     	'ngày 2-4 viên/con');
insert into public.ke_don (ma_thuoc, ma_benh, lieu_luong)
values('TB002',     	'BD004',     	'15mg/kg khối lượng /ngày');