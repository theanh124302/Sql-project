--A: CÁC CÂU LỆNH TRUY VẤN

--I. Nhập lô giống
--Cau 1: Nhập lô giống
--	Tạo dữ liệu lô giống cần nhập từ các cơ sở giống
insert into public.lo_giong (ma_lo, ma_loai, ma_co_so, so_luong, ngay_nhap_giong)
values('LG0127072022','ML01','CSHTA',28, '2022-07-27');

--Cau 2: Tạo thông tin chuồng và tiến hành thêm các loài vật nuôi vào từng chuồng
insert into public.chuong (ma_chuong, ma_loai, so_luong_toi_da, so_luong_thuc_te)
values('CG05','ML01',30,28);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0517','LG0127072022','CG05','ML01','F',null,   'BG003',     0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0505','LG0127072022','CG05','ML01','F','Đã tiêm',  null,   0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0507','LG0127072022','CG05','ML01','F','Đã tiêm',  null,   0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0506','LG0127072022','CG05','ML01','F','Đã tiêm',  null,   0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0507','LG0127072022','CG05','ML01','F','Đã tiêm',  null,0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0503','LG0127072022','CG05','ML01','F',null,   null,   0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0504','LG0127072022','CG05','ML01','F',null,   null,   0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0508','LG0127072022','CG05','ML01','F','Đã tiêm',  'BG004',     0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0509','LG0127072022','CG05','ML01','F','Đã tiêm',  null,   0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0510','LG0127072022','CG05','ML01','F','Đã tiêm',  null,0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0511','LG0127072022','CG05','ML01','F','Đã tiêm',  null,0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0514','LG0127072022','CG05','ML01','F','Đã tiêm',  null,0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0515','LG0127072022','CG05','ML01','F','Đã tiêm',  null,   0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0516','LG0127072022','CG05','ML01','F','Đã tiêm',  'BG003',     0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0523','LG0127072022','CG05','ML01','F',null,   null,0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0525','LG0127072022','CG05','ML01','F',null,   null,0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0518','LG0127072022','CG05','ML01','F','Đã tiêm',  null,   0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0519','LG0127072022','CG05','ML01','F','Đã tiêm',  null,0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0520','LG0127072022','CG05','ML01','F','Đã tiêm',  null,0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, ma_chuong, ma_loai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0516','LG0127072022','CG05','ML01','F',null,   null,0.6);
insert into public.vat_nuoi (ma_ca_the, ma_lo, Ga_chuong, ma_lo1i, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0518','LG0127072022','CG05','ML01','F',null,   null,0.6);
insert into pu27ic.vat_nuoi (ma_ca_th5, ma_lo, ma_chuong, ma_lFai, gioi_tinh, tinh_hinh_tiem_chung, ma_benh, tuoi)
values('G0521','LG0127072022','CG05','ML01','M','Đã tiêm',  'BG002',  0.6);


--Cau 3. Truy xuất cơ sở có lô giống đã chết >10% số lượng giống đã nhập
select distinct co_so_giong.*
from co_so_giong join lo_giong using(ma_co_so)
join (select ma_lo, count(ma_ca_the) as so_luong_con_lai 
		from vat_nuoi
		group by ma_lo
) as dem_ca_the using(ma_lo)
where so_luong_con_lai < (0.9*lo_giong.so_luong) 

--Câu 4.. Tìm thông tin về cơ sở nhập giống vật nuôi của từng loài

select distinct ten_loai, co_so_giong.*
from co_so_giong join lo_giong using (ma_co_so)
join loai using (ma_loai);

--II. Quản lý thức ăn cho các loài
--Câu 5: Nhập thêm lô Thức ăn mới

insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAG0201072022',	'TAG002','2022-07-01','2022-05-01','2023-12-01',20,	19);

--Câu 6: Nhập thêm loại thức ăn mới ( Insert into bình thường , nhập cụ thể các cột vào cx đc )


insert into public.thuc_an (ma_thuc_an, ma_loai, ten_thuc_an, nha_san_xuat, gia_mua)
values('TAN002', 'ML03', 'Cám ANOVA (bao 25kg)','CÔNG TY ANOVA',120000);

--Câu 7: Truy xuất lô thức ăn sắp hết hạn sử dụng (hạn còn lại <10% hạn kể từ nsx) 
select ma_lo_thuc_an, ten_loai, ten_thuc_an, ngay_nhap, hsd
from lo_thuc_an left join thuc_an using (ma_thuc_an)
join loai using (ma_loai)
where (hsd - current_date) < 0.1 * (hsd - nsx)




--Câu 8:Truy xuất thức ăn sắp hết để nhập thêm ( thức ăn cần nhập thêm khi số lg còn lại <= 2) 
select thuc_an.*, so_luong_con_lai
from thuc_an left join lo_thuc_an using (ma_thuc_an)
where so_luong_con_lai <= 2 

--Câu 9: Tính số tiền cần chi để nhập lô đó :  
select ma_lo_thuc_an, lo_thuc_an.ma_thuc_an, ngay_nhap, so_luong_nhap*gia_mua as gia_mua_lo_thuc_an
from lo_thuc_an,thuc_an


--Câu 10: Tính tổng số tiền đã dùng để mua toàn bộ lượng thức ăn
select sum(so_luong_nhap*gia_mua) as tong_tien_mua_thuc_an
from lo_thuc_an,thuc_an

--III: Theo dõi tình trạng bệnh của vật nuôi
--Câu 11: Truy xuất những cá thể chưa được tiêm chủng ‘ok’
select * from vat_nuoi
where tinh_hinh_tiem_chung is null ;

--Câu 12:Truy xuất những cá thể đang mắc bệnh -> xuất thông tin thú y cần liên hệ  ‘ok’
select vat_nuoi.ma_ca_the, vat_nuoi.ma_benh, mam_benh.ten_benh,thu_y.ma_thu_y, thu_y.ho_va_ten, thu_y.so_dien_thoai
from vat_nuoi, mam_benh
join thu_y on mam_benh.ma_thu_y = thu_y.ma_thu_y
where vat_nuoi.ma_benh = mam_benh.ma_benh;

--Câu 13:Truy xuất những cá thể đang mắc bệnh ->Xuất thông tin thuốc cần mua - liều lượng để chữa bệnh ‘‘ok’ 
select vat_nuoi.ma_ca_the,  vat_nuoi.ma_benh,ke_don.ma_thuoc,thuoc.ten_thuoc, ke_don.lieu_luong
from vat_nuoi, ke_don, thuoc
where vat_nuoi.ma_benh = ke_don.ma_benh
and thuoc.ma_thuoc = ke_don.ma_thuoc;

--Câu 14:Cập nhật thông tin bệnh và tình hình tiêm chủng cho từng cá thể ‘ok’
 
 
CREATE OR REPLACE function update_tinh_trang_benh_tiem_chung
(IN ma_ca_the1 char(10), tinh_hinh_tiem_chung1 character varying(10), ma_benh1 char(10))
Returns void AS
$$
BEGIN
            update vat_nuoi set tinh_hinh_tiem_chung = tinh_hinh_tiem_chung1, ma_benh = ma_benh1
            where vat_nuoi.ma_ca_the = ma_ca_the1;
END;
$$
LANGUAGE plpgsql;
 
select update_tinh_trang_benh_tiem_chung('B0101', null, 'BB003')

--Câu 15:Truy xuất những con vật nào bị bệnh truyền nhiễm cần cách ly vào chuồng mới ( tạo một chuồng mới để cách ly ) ‘ok’
--# Những bệnh truyền nhiễm cần cách ly bao gồm ( BB001, BB002, BD001, BG001, BL001, BL002, BL003, BN001, BV001, BV004 ) 
select distinct ma_ca_the,ma_chuong, ma_benh from vat_nuoi
where ma_benh = 'BB001'
    or ma_benh = 'BB002'
    or ma_benh = 'BD001'
    or ma_benh = 'BG001'
    or ma_benh = 'BL001'
    or ma_benh = 'BL002'
    or ma_benh = 'BN001'
    or ma_benh = 'BV001'

--Câu 16:In ra tất cả những con vật mắc bệnh ‘tụ huyết trùng’, và tên bác sĩ thú y cần gọi ‘ok’
select ma_ca_the,ma_chuong,ma_benh,ten_benh, ho_va_ten
from vat_nuoi
inner join mam_benh using (ma_benh)
inner join thu_y using (ma_thu_y)
where ten_benh = 'Bệnh tụ huyết trùng';


--IV. Quản lý thức ăn
--Câu 17:Tính số tiền thực tế đã chi để nhập từng loại thức ăn cho từng loài ‘ok’
select ten_loai,sum(Tien_thuc_an) as Tong_tien_thuc_an from 
(SELECT ma_loai,(l.so_luong_nhap * t.gia_mua) as Tien_thuc_an
from loai join thuc_an as t using (ma_loai)
join lo_thuc_an as l using (ma_thuc_an)) as thuc_an_loai join loai using (ma_loai)
group by ten_loai;
 
--Câu 18: In ra tên công ty mà trang trại đã nhập lô thức ăn X ( dùng function cho tiện)’ok’
CREATE OR replace FUNCTION cty_nhap_thuc_an(in id_lo_thu_an char, out ten_cong_ty char) AS
$$
BEGIN
    select into ten_cong_ty  nha_san_xuat
    from thuc_an join lo_thuc_an using ( ma_thuc_an )
    where id_lo_thu_an = ma_lo_thuc_an;
end;
$$
LANGUAGE plpgsql;


--V: Quản lí chuồng trại
--Câu 19: cập nhật số lượng thực tế của chuồng (dùng funtcion) ‘ok’
CREATE OR REPLACE function so_ca_the_trong_chuong(IN ma_chuong1 char(10)) RETURNS int4 AS
$$
declare abc int4 := 0;
BEGIN
        If abc is null then
            select into abc count(*)
            from vat_nuoi
            where vat_nuoi.ma_chuong is null;
        else
            select into abc count(*)
            from vat_nuoi
            where vat_nuoi.ma_chuong = ma_chuong1;
        END if;
        return abc;
END;
$$
LANGUAGE plpgsql;
select so_ca_the_trong_chuong('CB01');


--Câu 20:Truy xuất những chuồng có vật nuôi bị bệnh cần cách ly ok’
--# Những bệnh truyền nhiễm cần cách ly bao gồm ( BB001, BB002, BD001, BG001, BL001, BL002, BL003, BN001, BV001, BV004 ) 
 
 
select distinct ma_chuong from vat_nuoi
where ma_benh = 'BB001'
    or ma_benh = 'BB002'
    or ma_benh = 'BD001'
    or ma_benh = 'BG001'
    or ma_benh = 'BL001'
    or ma_benh = 'BL002'
    or ma_benh = 'BN001'
    or ma_benh = 'BV001'

--VI.	Vật nuôi, loài
--Câu 21: Truy xuất những cá thể có thể xuất chuồng   ‘ok’
select * from vat_nuoi
join loai using(ma_loai)
where vat_nuoi.tuoi >= loai.do_tuoi_xuat_chuong
and vat_nuoi.ma_benh is null;

--Câu 22: Sắp xếp vật nuôi của 1 loài cụ thể theo độ tuổi giảm dần 
select vat_nuoi.* 
from vat_nuoi join loai using (ma_loai)
where ten_loai like '%Gà%'
order by tuoi desc;

--Câu 23: Truy xuất số lượng cá thể của từng loài theo giới tính ‘ok’
CREATE OR replace function so_ca_the_gioi_tinh(IN ma_loai1 char(10), gioi_tinh1 char(10)) RETURNS int4 AS
$$
declare abc int4 := 0;
BEGIN
        If abc is null then
            select into abc count(*)
            from vat_nuoi
            inner join loai using(ma_loai)
            where vat_nuoi.gioi_tinh is null;
        else
            select into abc count(*)
            from vat_nuoi
            inner join loai using(ma_loai)
            where vat_nuoi.gioi_tinh = gioi_tinh1
            and vat_nuoi.ma_loai = ma_loai1;
        END if;
        return abc;
END;
$$
LANGUAGE plpgsql;
select so_ca_the_gioi_tinh('ML01','M');
 
hoặc
select ma_loai,gioi_tinh, count(gioi_tinh)
            from vat_nuoi
            where vat_nuoi.gioi_tinh = 'F'
            and vat_nuoi.ma_loai = 'ML02'
            group by gioi_tinh,ma_loai
 

--Câu 24: Xóa các cá thể chết vì bệnh khỏi bảng vật nuôi ‘ok’
select so_ca_the_trong_chuong('CB03');
delete from vat_nuoi
where ma_ca_the = 'B0308';
select so_ca_the_trong_chuong('CB03');

--Câu 25: Truy xuất tổng tiền mua giống của loài ‘ok’
select ten_loai,sum(tien_mua_giong) as tong_tien_mua_giong 
from 
(SELECT ma_loai,(so_luong * gia_mua_giong) as tien_mua_giong
from loai join lo_giong using(ma_loai)) as tbl1 join loai using (ma_loai)
group by ten_loai;

--Câu 26: Truy xuất giá bán của loài	‘ok’
select ten_loai, gia_ban
from loai;
 


--Câu 27: Tìm tất cả các loài vật nuôi có số lượng dưới 50 con  ‘ok’
select loai.ma_loai , count(vat_nuoi.ma_loai) as so_luong
from vat_nuoi,loai
where vat_nuoi.ma_loai = loai.ma_loai
group by loai.ma_loai
having count(vat_nuoi.ma_loai) < 50;

--Câu 28:. Tìm thông tin các con vật nuôi của 1 loài bất kì ‘ok’
select vat_nuoi.*
	from loai join vat_nuoi using (ma_loai)
	where ten_loai ilike '%Dê%';
 
--Câu 29:. Tính số tiền thu được khi bán toàn bộ những con có khả năng xuất chuồng ’ok’
create or replace view check_do_tuoi as 
select ma_ca_the, ten_loai,gia_ban from vat_nuoi
join loai using(ma_loai)
where vat_nuoi.tuoi >= loai.do_tuoi_xuat_chuong
and vat_nuoi.ma_benh is null;
 
select ten_loai, sum(gia_ban)
from check_do_tuoi
group by ten_loai;
 
--Câu 30:. Cập nhật số lượng thực tế của chuồng sau khi có cá thể chết, xuất chuồng, bị đem đi cách ly
	create or replace function function_update_so_luong_thuc_te() returns trigger as
$$
begin
    -- giam so luong chuonng cu
    if OLD.ma_chuong is not null then
        update chuong
        Set so_luong_thuc_te = so_luong_thuc_te - 1
        where ma_chuong = OLD.ma_chuong;
    end if;
    -- tang so luong chuong moi
    if new.ma_chuong is not null then
        update chuong
        Set so_luong_thuc_te = so_luong_thuc_te + 1
        where ma_chuong = NEW.ma_chuong;
    end if;
 
    RETURN NULL ;
end;
$$
language plpgsql;
create trigger update_so_luong_thuc_te
AFTER INSERT OR UPDATE OR DELETE ON vat_nuoi
for each row
execute procedure function_update_so_luong_thuc_te();

--Câu 31. Tra cứu thông tin vật nuôi (thông tin cơ bản, lô giống, cơ sở nhập, ngày nhập, giá nhập, thời gian cho tới khi xuất chuồng)

	
Create or replace function thong_tin_vat_nuoi(mct character)
Returns table(ma_ca_the character,ten_loai character varying,gioi_tinh character varying,tinh_hinh_tiem_chung character varying,benh_dang_mac_neu_co character,tuoi double precision,lo_giong character,ngay_nhap date,ten_co_so character varying) as
$$
Begin
	Return query select v.ma_ca_the,l.ten_loai,v.gioi_tinh,v.tinh_hinh_tiem_chung,mb.ten_benh,v.tuoi,v.ma_lo,lg.ngay_nhap_giong,cs.ten_co_so
	from vat_nuoi v join loai l using(ma_loai) 
	join lo_giong lg using(ma_lo)
	join co_so_giong cs using(ma_co_so)
	left join mam_benh mb using(ma_benh)
	where v.ma_ca_the = mct;
End
$$ language plpgsql;


--#######################################################################################################################################################################
--B. CÁC CHỨC NĂNG CHÍNH
 
--1: Chức năng xem thông tin đàn vật nuôi: loài, số lượng, tình trạng tiêm chủng, độ tuổi xuất chuồng.
select l.ma_loai,l.ten_loai, 1.0*da_tiem.so_luong_da_tiem/sl.so_luong as ti_le_tiem_chung,l.do_tuoi_xuat_chuong
	from loai l 
	join (select v1.ma_loai,count(v1.ma_ca_the) as so_luong_da_tiem
		 from vat_nuoi v1
		 where v1.tinh_hinh_tiem_chung is not null
		 group by v1.ma_loai
		 ) as da_tiem using(ma_loai)
	join (select v2.ma_loai,count(v2.ma_ca_the) as so_luong
		 from vat_nuoi v2
		 group by v2.ma_loai
		 ) as sl using(ma_loai)
	where l.ma_loai = 'ML01';

-- 2: Chức năng theo dõi vật nuôi bị bệnh: Bị bệnh gì, cách chữa, thuốc cần mua, thú y thăm khám.
-- Truy xuất những cá thể đang mắc bệnh -> xuất thông tin thú y cần liên hệ  
select vat_nuoi.ma_ca_the,  vat_nuoi.ma_benh, mam_benh.ten_benh,thu_y.ma_thu_y, thu_y.ho_va_ten, thu_y.so_dien_thoai
from vat_nuoi, mam_benh
join thu_y on mam_benh.ma_thu_y = thu_y.ma_thu_y
where vat_nuoi.ma_benh = mam_benh.ma_benh;
--Truy xuất những cá thể đang mắc bệnh ->Xuất thông tin thuốc cần mua - liều lượng để chữa bệnh  
select vat_nuoi.ma_ca_the,  vat_nuoi.ma_benh,ke_don.ma_thuoc,thuoc.ten_thuoc, ke_don.lieu_luong
from vat_nuoi, ke_don, thuoc
where vat_nuoi.ma_benh = ke_don.ma_benh
and thuoc.ma_thuoc = ke_don.ma_thuoc;

--3: Chức năng quản lý thông tin thức ăn: Nhập thêm lô thức ăn mới, tính giá tiền mua thức ăn.
--Tính số tiền cần chi để nhập lô thức ăn đó : 
 select ma_lo_thuc_an, quan_ly_thuc_an.ma_thuc_an, ngay_nhap, so_luong_nhap*gia_mua as gia_mua_lo
from quan_ly_thuc_an,thuc_an
--: Nhập thêm lô Thức ăn mới
insert into public.lo_thuc_an (ma_lo_thuc_an, ma_thuc_an, ngay_nhap, nsx, hsd, so_luong_nhap, so_luong_con_lai)
values('TAG0201072022',	'TAG002',	'2022-07-01',	'2022-05-01',	'2023-12-01',	20,	19);
       
--4.Chức năng quản lý thông tin thuốc
-- In ra thông tin từng loại thuốc
SELECT * from thuoc
-- in ra thông tin từng bệnh và loại thuốc tương ứng chữa bệnh đó , bao gồm cả liều lượng
select mam_benh.ma_benh,mam_benh.ten_benh,ke_don.ma_thuoc,thuoc.ten_thuoc, ke_don.lieu_luong
from  ke_don, mam_benh,thuoc
where thuoc.ma_thuoc = ke_don.ma_thuoc
and mam_benh.ma_benh = ke_don.ma_benh;

--5 Chức năng quản lý thông tin vật nuôi từng chuồng
-- Cập nhật tình trạng tiêm chủng, bệnh tật từng cá thể
CREATE OR REPLACE function update_tinh_trang_benh_tiem_chung
(IN ma_ca_the1 char(10), tinh_hinh_tiem_chung1 character varying(10), ma_benh1 char(10))
Returns void AS
$$
BEGIN
        update vat_nuoi set tinh_hinh_tiem_chung = tinh_hinh_tiem_chung1, ma_benh = ma_benh1
        where vat_nuoi.ma_ca_the = ma_ca_the1;
END;
$$
LANGUAGE plpgsql;
 
select update_tinh_trang_benh_tiem_chung('B0101', null, 'BB003')

-- Cập nhật số lượng thực tế của chuồng sau khi có cá thể chết, xuất chuồng, bị đem đi cách ly
	create or replace function function_update_so_luong_thuc_te() returns trigger as
$$
begin
    -- giam so luong chuonng cu
    if OLD.ma_chuong is not null then
        update chuong
        Set so_luong_thuc_te = so_luong_thuc_te - 1
        where ma_chuong = OLD.ma_chuong;
    end if;
    -- tang so luong chuong moi
    if new.ma_chuong is not null then
        update chuong
        Set so_luong_thuc_te = so_luong_thuc_te + 1
        where ma_chuong = NEW.ma_chuong;
    end if;
 
    RETURN NULL ;
end;
$$
language plpgsql;
create trigger update_so_luong_thuc_te
AFTER INSERT OR UPDATE OR DELETE ON vat_nuoi
for each row
execute procedure function_update_so_luong_thuc_te();

-- Cách ly những cá thể bị bệnh sang chuồng mới
update vat_nuoi set ma_chuong = 'CCL01' where ma_ca_the = 'B0206'
-- Xóa những cá thể đã xuất chuồng hoặc chết vì bệnh
delete from vat_nuoi where ma_ca_the = 'B0308';










