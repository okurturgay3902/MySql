-- =======SELECT-WHERE========

use sys;
create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

 INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
 INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
 INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
 
 select * from ogrenciler;
 /*
 ============================================================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
==============================================================================
 */
 
 /*
 -----------------------------------------------------------------------------
  ORNEK1: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------
 */
 select * from ogrenciler
 where sinav_notu>80;
 /*
 -----------------------------------------------------------------------------
  ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------
 */
 select isim, adres from ogrenciler where adres='Ankara';
 /*
 -----------------------------------------------------------------------------
  ORNEK3: id’si 124 olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------
 */
 select * from ogrenciler where id=124;
 /*
 ======================= SELECT - BETWEEN ==================================
 */
 CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR(50),
        maas int
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES('10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);
    
/* not= BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme imkani saglar
   yazdigimiz iki sinirda araliga dahildir.
========================================================================
 And (Ve) Operatörü Kullanımı
And ile belirtilen şartların tamamı gerçekleşiyorsa o kayıt listelenir, şartlardan
bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu örnekte hem sınav1 hem de sınav2 alanı 50'den küçük olan kayıtlar listelenecektir.

=====Or (Veya) Operatörü Kullanımı=====
Or ile belirtilen şartlardan en az biri gerçekleşiyorsa o kayıt listelenir,
şartlardan hiçbiri gerçekleşmiyorsa o kayıt listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu örnekte sınav1 veya sınav2 alanı 50'den küçük olan kayıtlar listelenecektir.
========================================================================================*/

 /*
 -----------------------------------------------------------------------------
  ORNEK4: id'si 10002 ile 10005 arasında olan personelin bilgilerini listele
 -----------------------------------------------------------------------------
 */
 -- 1. yol
 select * from personel where id between '10002' and '10005';
 -- 2. yol mathematiksel
 select * from personel where id >= '10002' and id<= '10005';
 
 /*
 -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------
 */
 select * from personel where isim between 'Mehmet Yilmaz' and 'Veli Han';
 
 /* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
 
select * from personel where id='10001' or id='10002' or id='10004';
 
 select * from personel where id in(10001,10002,10004);
 
 /* --------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  veya 12000 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
 select * from personel where maas='7000' or maas='12000';
 select * from personel where maas in(7000,12000);
 
 select * from personel where maas='7000' or isim='meryem ';
 
 select * from personel where maas between '5000' and '7000'; 
 
 /* --------------------------------------------------------------------------
  ORNEK9: ismi A harfi ile baslayanlari listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like 'a%'; -- % butun karakterler
 select * from personel where isim like 'a_______'; -- _ ile karekter sayisi belirtiyoruz
 
 /* --------------------------------------------------------------------------
  ORNEK10: ismi N harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like '%n';
 
 /* --------------------------------------------------------------------------
  ORNEK11: isminin ikinci harfi E olanlari listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like '_e%';
 
 /* --------------------------------------------------------------------------
  ORNEK12: isminin ikinci harfi E olup diger harflerinde y olanlari listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like '_e%y%';
 
 /* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile başlamayanları listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';
 
 /* --------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim not like '%a%';
 
  /* -----------------------------------------------------------------------------
  ORNEK16:  maaşının son 2 hanesi 00 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';
    
      
    
/* -----------------------------------------------------------------------------
  ORNEK17:  maaşının 4000 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
 
 /* -----------------------------------------------------------------------------
  ORNEK18: maaşı 5 haneli olanları listeleyiniz
 -----------------------------------------------------------------------------*/  
 SELECT * FROM personel
    WHERE maas LIKE '_____'; -- 5 alt tire
 
 /* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspneli listeleyiniz.
 -----------------------------------------------------------------------------*/  
 SELECT * FROM personel
    WHERE isim LIKE 'a_____a%';
 
 