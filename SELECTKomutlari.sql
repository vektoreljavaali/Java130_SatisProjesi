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







