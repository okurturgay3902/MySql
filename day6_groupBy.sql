use sys;

/*============================= GROUP BY =====================================
    
    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak gruplamak için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
    
==============================================================================*/ 
      
    CREATE TABLE manav 
    (
        isim varchar(50), 
        urun_adi varchar(50), 
        urun_miktari int 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', null, 2);
    
    select * from manav;
    
   /* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu 
  yazınız.
------------------------------------------------------------------------------*/  
select isim, sum(urun_miktari) as toplam_urun from manav group by isim; 
    
    
 /* ----------------------------------------------------------------------------
  ORNEK2: satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
  sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
SELECT 
    urun_adi, COUNT(isim) kisi_sayisi
FROM
    manav
WHERE
    urun_adi IS NOT NULL
GROUP BY urun_adi;

-- group by ile birlikte where cumlecigi kullanilabilir

/* --------------------------------------------------------------------------------
ORNEK3: satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve MAX urun
miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu yazınız.
----------------------------------------------------------------------------------*/ 

select urun_adi, min(urun_miktari) min, max(urun_miktari) maks
from manav
WHERE urun_adi IS NOT NULL
group by urun_adi
order by maks;
   
 /* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adına göre satılan ürünlerin toplamını 
  gruplandıran ve isime göre ters sırasıda listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/  
 select isim, urun_adi, sum(urun_miktari)
 from manav
 group by isim, urun_adi
 order by isim desc;
 
 
 
 
 
 