-- Create, (Insert into)
-- Read
-- Update
-- Delete

-- CREATE - INSERT INTO
--- bir tabloya veri eklemek.
-- 1- ilk olarak "INSERT INTO" kullanılır
-- 2- devamında bir boşluk bırakarak tablo adı yazılır
-- 3- parantez içinde tabloda içine ekleme yapılacak tüm
-- alanlar virgül ile ayrılarak yazılır.
-- 4- bir boşluk bırakılarak "VALUES" parametresi yazılarak 
-- parantez içine sıra ile tablo parantezinde bulunan alanlar 
-- için değerler girilir.
-- DİKKAT!! values içine girdiğiniz değerler, kolon alanlarının
-- değişken türüne uygun şekilde olmalıdır. ÖRN;
-- varchar için -> tek tırnak içinde değer giriniz 'Muhammet HOCA'
-- sayısal değerler için -> tırnak olmadan sayı değeri giriniz 544.3

insert into tblmarka(ad) 
values ('Lenovo'),('Asus'),('Apple'),('HP'),('Samsung')

insert into tblmodel(ad,markaid)
values 
('Glaxy Phone',5)
('MacBook Air M1',3), 
('MacBook Pro M1',3),
('MacBook Pro Intel',3)


insert into tblurun(ad,alisfiyati,satisfiyat,
					stokmiktari,uyarimiktari,markaid,modelid)
values
('Apple MacBook Air M1 Çip 8GB 256GB
 SSD macOS 13" QHD Taşınabilir 
 Bilgisayar Gümüş MGN93TU/A',11500,14999,15,3,3,2),
('Apple MacBook M1 Pro Çip 16GB 512GB SSD macOS 14 inch
 QHD Taşınabilir Bilgisayar Gümüş MKGR3TUA'
 ,28500,34498.99,50,10,3,3),
('Apple MacBook Pro Intel Core i5 16GB 1TB SSD macOS 13 inch
 Taşınabilir Bilgisayar MWP52TUA Uzay Grisi',
 17900,22499,25,5,3,4) 

insert into tblurun(ad,alisfiyati,satisfiyat,
					stokmiktari,uyarimiktari)
values
('Samsung Galaxy S21 Plus 5G 128 GB',11099,15999,25,5),
('Samsung Galaxy Note 10 Lite 128 GB',9117,9399,150,15)

-- UPDATE - Güncelleme
-- 1- İlk olarak UPDATE komutu girilir.
-- 2- bir boşluk bırakılarak tablo adı girilir.
-- 3- SET anahtar eklimesi eklenir.
-- 4- değiştirmek istenilen alan adı yazılır, sonra eşittir
-- eklenerek atanmak istenlen değer yazılır.
-- DİKKAT!! atanılacak değer alan adının tipine uygun şekilde
-- yazılmalıdır.
-- ÇOOOOK DİKKAT!!!, değiştirilmek istenilen ürün belirtilmelidir.
-- eğer değiştirme istediğiniz değerin primary key (id) değerini
-- girmez iseniz tüm kayıtların güncellenmesine neden olursunuz.
-- WHERE anahtar değeri ile hangi kayıt ın güncelleneceği belirtilir.
update tblurun set markaid=5, modelid=6 where id<3

update tblurun set markaid=5, modelid=60 where id<3

-- DELETE - silme işlemi
-- 1- DELETE komutu eklenir bir boşluk bırakılarak from anahtarı eklenir
-- 2- verileri silinmek istenilen tablo adı bir boşluk bırakılarak yazılır
-- DİKKAT!!! silme işleminde silinecek bilginin primary key (id)
-- değerinin girilmiş olduğundan emin olunuz. aksi durumda tüm
-- tablo datalarının silinmesine neden olursunuz.
-- WHERE anahtarı ile silinmek istenilen kaydın koşulunu girersiniz.
delete from tblurun where id=5











