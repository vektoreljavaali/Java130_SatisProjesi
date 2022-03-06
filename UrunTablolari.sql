-- ÜRÜN İLE İLGİLİ TABLOLAR
create table tblmarka(
	id serial primary key,
	ad varchar(250),
	logo varchar(255),
	adres varchar(500),
	notes varchar(250)
)
create table tblmodel(
	id serial primary key,
	markaid integer references tblmarka(id),
	ad varchar(255),
	aciklama varchar(500)
)
create table tblkategori(
	id serial primary key,
	ad varchar(120),
	parentid integer
)
insert into tblkategori(ad,parentid) values('Bilgisayar',0)

create table tblurun(
	id bigserial primary key,
	ad varchar(255),
	markaid integer references tblmarka(id),
	modelid integer references tblmodel(id),
	barkod varchar(40),
	alisfiyati double precision,
	satisfiyat double precision,
	kdv integer,
	birimi varchar(25),-- adet, litre, kilo v.s.
	stokmiktari integer,
	uyarimiktari integer,-- belli bir adedin altı için
	kategoriid integer references tblkategori(id),
	aciklama varchar(500)
)
----------------------------
--- SATIŞ -----

create table tblkasa(
	id serial primary key,
	ad varchar(50),-- nakit, A Bankası, B Bankası, ...
	toplam double precision
)

create table tblsatis(
	id bigserial primary key,
	satistarihi bigint,
	islemtarihi bigint,
	musteriid bigint references tblmusteri(id),
	toplamtutar double precision,
	nakitodenen double precision,
	kartlaodenen double precision,
	iskonto integer,
	iskontolufiyat double precision,
	kalan double precision,
	odemeyontemi integer, -- 1-> nakit, 2-> kredikartı
	kasaid integer references tblkasa(id)	
)

create table tblsatisdetay(
	id bigserial primary key,
	satisid bigint references tblsatis(id),
	urunid bigint references tblurun(id),
	miktar integer,
	iskonto integer,
	iskontolufiyat double precision,
	satisfiyati double precision,
	alisfiyati double precision,
	toplamtutar double precision	
)

create table tblodeme(
	id bigserial primary key,
	musteriid bigint references tblmusteri(id),
	nakitodemetutari double precision,
	kartodemetutari double precision,	
	odemetarihi bigint,
	kasaid integer,	
	aciklama varchar(200)
)

create table tblmusteriborc(
	id bigserial primary key,
	musteriid bigint references tblmusteri(id),
	borc double precision
)

