-- READ İşlemleri
-- SELECT kullanımı ve Parametreleri
-- 1- SELECT - seçme anahtarı yazılır
-- 2- seçim sonucunda hangi dataların alınacağını belirtmek için
-- 3- tabloya ait alanların adı ya da tüm dataları çekmek için *
-- karakteri kullanılır.
-- 4- Hangi tablonunu kullanılaacağını belirtmek adına önce FROM anahtar
-- kelimesi bir boşluk bırakılarak eklenir
-- 5- ardından bir boşluk bırakılarak tablonun adı yazılır.
select * from tblurun

select id,ad,satisfiyat from tblurun

-- WHERE Anahar kelimesi ile yapılan sıkıtlamalar.

select * from tblurun where id=1 -- id si 1 olan kaydı getir

select * from tblurun where id<3 -- id si 3 te n küçük ayıtları getir.

select * from tblurun where id!=2 -- id si 2 ye eşit olmayan kayıtlar

select * from tblurun where id<=3 -- id si 3 e eşit ve küçük ayıtları getir.

-- WHERE AND,OR Kullanımı

select * from tblurun where id=1 or id=4 -- id si 1 e ya da 4 e eşit olan kayıtları göster

select * from tblurun where id>1 and id<4 -- id si 1 ile 4 arasında olan değerleri göster

-- Stoğu azalan ürünleri göster, stok kriterim 8 adet olsun
select * from tblurun where stokmiktari <= 20

select id,ad,stokmiktari from tblurun where stokmiktari <= 20

-- ÖRNEK OLMASI İÇİN YAZIYORUZ. Kafanız karışmasın :)))
-- ürün 1 -> 1000 adet var
-- ürün 2 -> 4 adet var  
-- Hangisinin stoğu azalmış sizce
-- ürün 1 için günlük satış adedi, 280 adet
-- ürün 2 için haftalık satis adedi 1,
-- satış tablosundan günlük satış adedini bulur buna göre stok 
-- hesabı yaparım.

-- LIMIT, (top-> mssql) 
-- Tablodan belli bir sayıda kayıt çekmek için kullanırız.
select * from tblilce  -- Tabloda bulunan tüm kayıtları görüntüler

select * from tblilce limit 4 -- ilk 4 kaydı görüntüler

select * from tblilce limit 4 offset 10 

-- IN, 
--- 1000 kaydın olduğu bir durumda 200 ile 245 arasındaki
--- kayıtları göstermek istiyorsunuz diyelim.
--- CEVAP where id>199 and id<246
--- 1000 kayıt içinde rast gelen seçilmiş 46 adet değeriniz olsa idi.
--- CEVAP id=1 or id=998 or id=34 or id=456 ...

select * from tblilce where id in(3,65,343,34,98,1,910)

select * from tblil where id in
(select ilid from tblilce where ad ilike 'an%')

-- BETWEEN, belli bir aralıkta ki değerleri getirmek için kullanılır

select * from tblil where id>10 and id<20 -- 10 ile 20 arasındaki illeri getir.

select * from tblil where id between 10 and 20

-- IS NULL, IS NOT NULL

select * from tblurun

update tblurun set kdv=18 where id in(1,4)

select id,ad,kdv from tblurun where kdv is null

select id,ad,kdv from tblurun where kdv is not null


-- LIKE, ILIKE
-- % yüzde işareti
-- _ alt tire işareeti

select * from tblilce where ad like 'A%' -- A ile başlayan devamında
						-- uzunluğu ve içeriği farketmeyen kayıtlar

select * from tblilce where ad like '%AN%'
 -- an....
 -- ...an...
 -- ..an
 -- an

--  _ altire tek bir karakter yerine geçer.
select * from tblilce where ad like '__A%' -- ilk iki karakterinden 
			-- sonra A harfi gelen tüm ifadeler
			-- ..A.....
			-- ..A
select * from tblilce where ad like '__A___'

select * from tblilce where ad ilike '%a%' -- keys sensitive olmadan
				-- arama yapmak için kullanılır. büyük küçük harf
				-- kısıtına uymadan arama (filtreleme) yapar.
				
------------------------------------------------
------------------------------------------------
-- SELECT kendisine verilen bilgiyi tablo olarak gösterme eğilimindedir
-- AS -> Alias -> Takma ad, Mahlas
-- tablo adına, colon adına uygulanabilir, herhangi bir sorguya
-- uygulanabilir.

select 5 + 33334 as toplam

select id as urunid,ad as urunadi,kdv,markaid from tblurun

select * from tblurun

select 'Ahmet BAŞ'

select NOW()

--------------------------------
--------------------------------

-- ORDER BY,
---- ASC, DESC

select * from tblil order by ad -- ad a göre a..Z ye sırala

select * from tblil order by ad desc -- ad a göer Z..a ya sırala

select * from tblil order by ad asc -- ad a göre a..Z ye sırala

-- ASC, küçükten büyüğe, 0...9, a...Z
-- NOT: Eğer order by ek parametre almaz ise ASC şeklinde davranır.
-- DESC, BÜYÜK ten küçüğe, 9...0, Z...a

----------------------------------
-----------------------------------------

select * from tblmusteri
insert into tblmusteri(ad,soyad) values
('Ahmet','BAŞ'),('Canan','TURNA'),('Gül','GENİŞ'),('Demet','TEK'),
('Ayhan','SİCİM'),('Deniz','KUŞ'),('Kenan','SAFİ')
insert into tblodeme(musteriid,nakitodemetutari) values (1,98500)
(1,2500),(2,6900),(3,1120),(4,1200),(5,150),
(2,500),(3,600),(4,120),(5,1500),(4,500),
(3,200),(4,900),(5,280),(3,700),(1,170),
(4,700),(5,800),(2,3220),(2,400),(2,10),
(5,9800),(1,1100),(1,6320),(1,330),(3,11)

select * from tblodeme

-- Ödeme yapan müşteri listesini çıkart

select id,ad,soyad from tblmusteri where id in(
select musteriid from tblodeme order by musteriid
)

-- Tekrar eden kayıtların tek gösterim ile gösterilmesi
-- DISTINCT
select distinct musteriid from tblodeme order by musteriid

------------------------------------
------------------------------------

-- GROUP BY,

select musteriid, SUM(nakitodemetutari) as toplamodeme
from tblodeme 
group by musteriid

---------------------------------------------------
---------------------------------------------------

--- Bir tabloda var olan yabancı anahtarlı değerlerin 
--- diğer tablodan alınarak birleştirilmesi nasıl yapılır?

-- JOIN, referens verilmiş iki tabloyu bu referans değerini baz alarak 
-- birleştirme işlemi yapar.

--- Birleştirme işleminde dikkat edilmesi gereken durumlar
--- 1- hangi tabloyu, hangi tabloya birleştirelim ???
--- soruya ya da soruna göre değişir.

select * from tblodeme
join tblmusteri on tblodeme.musteriid = tblmusteri.id

--- * tüm tablolardaki alanları getiriyor. Peki sadece istediğim
--- tablodan istediğim alanları çekmek istese idim ne nasıl olacakti?

select tblmusteri.id, tblmusteri.ad, tblmusteri.soyad, 
tblodeme.nakitodemetutari
from tblodeme
join tblmusteri on tblodeme.musteriid = tblmusteri.id

--- Pekii, tablo adları ve alan adları çooooook uzun olsa idi ve 
--- ve bir birine yakın kelimelerle karmaşıklık artsa idi nasıl 
--- kodlayacaktık????
--- Ödeme yapan müşterileri ödeme tutarlarına göre sıralanmış
--- ve ödeme sayıları belirtilmiş listesi.
select ms.id, ms.ad, ms.soyad,SUM(od.nakitodemetutari), count(*)
from tblodeme as od
join tblmusteri as ms on od.musteriid = ms.id
group by ms.id 
having SUM(od.nakitodemetutari) > 10000 -- where normal sorgularda
									--- group by kullanımında 
									--- sadece having ile kısıtlama 
									--- yapılabilir. where === having
order by SUM(od.nakitodemetutari)



--- ödeme tablosun da hangi müşteri kaç ödeme yaptı ve tutarı ne idi

select musteriid, count(*),SUM(nakitodemetutari) from tblodeme group by musteriid

insert into tblodeme(nakitodemetutari) values(25444),(150),(3650)

select ms.id,ms.ad,ms.soyad,od.nakitodemetutari from tblodeme as od
inner join tblmusteri as ms on ms.id=od.musteriid


select ms.id,ms.ad,ms.soyad,od.nakitodemetutari from tblodeme as od
left outer join tblmusteri as ms on ms.id=od.musteriid
--------------------------------
--------------------------------

-- VIEW, hazırladığınız soruları bir şablon halinde
-- tutmak ve daha sonra kullanmak üzere yaratılan 
-- görünümlerdir. 
-- view ler tablo gibi davranır. bir tablo üzerinde
-- uyguladığınız tüm işlemleri view içinde yapabilirsiniz.
create view vwtumurunler
as
select ur.id,ur.ad as urunadi,ur.satisfiyat,
tblmarka.ad as markaadi,tblmodel.ad as modeladi
from tblurun as ur
left join tblmodel on tblmodel.id=ur.modelid
left join tblmarka on tblmarka.id=tblmodel.markaid

create view vwmodelurunler
as
select ur.id,ur.ad as urunadi,ur.satisfiyat,
tblmarka.ad as markaadi,tblmodel.ad as modeladi
from tblurun as ur
inner join tblmodel on tblmodel.id=ur.modelid
left join tblmarka on tblmarka.id=tblmodel.markaid

select * from vwtumurunler where satisfiyat>15000

------------------------------------------
------------------------------------------
-- 1- Bir Proje Seçiniz.
-- 2- Tabloları ve ilişkilerini yazınız.
-- 3- Tablo sayısı 8 den az olmasın, en az 4 ilişkili tablo olsun
-- 4- SORU ÇIKARTIN
--- Neden? uygulamanız yapılmak istenilen program isteklerine
--- cevap verebiliyor mu?
---- > Bu ay hangi müşteriler ödeme yapmadı?
---- > 
----------------------------------------------
----------------------------------------------
--- PROJE SORULARI
----------------------------
-- 1- Stoğu azalan ürünleri göster (30 altında olanları bulun)
create view vwstoguazalanurunler
as
select * from tblurun 
where stokmiktari<=uyarimiktari order by id

update tblurun set stokmiktari=2 where id in(4,6)

-- 2- marka ve model bilgisini de içeren tablo
create view vwmarkamodelurunbilgisi
as
select tblurun.id, tblurun.ad, tblmarka.ad as markaadi
, tblmodel.ad as modeladi
from tblurun
left join tblmarka on tblmarka.id=tblurun.markaid
left join tblmodel on tblmodel.id=tblurun.modelid

select * from vwmarkamodelurunbilgisi

-- 3- En çok Satışı yapılan ilk 3 ürün ???
create view vwencoksatilanilkucurun
as
select urunid,sum(miktar) as toplammiktar
from tblsatisdetay group by urunid order by sum(miktar) desc
limit 3

-- 4- bireysel olarak satılan ürün satış tekrarı
-- COUNT kullanırken DİKKAT!!!
-- COUNT(*) yaparsanız var olan satır sayısını sayar.
-- COUNT(SUTUNADI) yazasanız o satırda NULL olmayan kayıtlarımn
-- sayısını verir. bu nedenle, sütun adı verirken dikkat ediniz
-- eksik bilgi dönebilirsiniz.
create view vwsatilanurunadedi
as
select urunid,count(urunid) from tblsatisdetay  group by urunid
order by count(urunid) desc

-- 5- Marka ve Modeli Belli olan en çok satışı yapılan
-- ürünlerin listesi.
create view vwmarkamodelencoksatilanurunler
as
select vwbil.id,vwbil.ad,vwbil.markaadi,vwbil.modeladi,
vwsat.toplammiktar
from vwencoksatilanilkucurun as vwsat
left join vwmarkamodelurunbilgisi as vwbil
on vwbil.id=vwsat.urunid




select * from tblsatis
select * from tblmusteri
insert into tblmusteri(ad,soyad) values('Ahmet','BAŞ')
insert into tblsatis(musteriid,toplamtutar)
values(1,63000)

select * from tblsatisdetay
select * from tblurun
insert into tblsatisdetay(satisid, urunid,miktar)
values(2, 4, 1), (2,6,5),(2,7,2),(2,4,10),(2,5,3),(2,7,8),
(2,4,5),(2,8,2)


id    ad      miktar
1     şeker   20
2     un      1
3     tuz     5
1     şeker   3
1     şeker   2
3     tuz     3

group by 
id    ad     toplammiktar
1     şeker  25
3     tuz    8
2     un     1











