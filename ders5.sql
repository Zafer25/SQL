-- round kullanimi--> ondalikli sayilari yuvarlamak icin kullanilir
select round(maas, 1) as yuvarlanmis_maas from proje1.personel;

-- maas ortalamasini 2virgulden sonra 2 basamak olacak sekilde yazdiriniz
select round (avg(maas), 2) as yuvarlanmis_maas from proje1.personel;

-- limit kullanimi=> istenilen sayi kadar elamanlari listelemek icin kullanilir
select * from proje1.personel limit 2;

--                           ilk 3 unu atlar 2 tanesini getirir
select * from proje1.personel limit 3,2;

-- order by => siralama yapmak icin kullanilir
select* from proje1.personel order by maas;
--                                  desc    buyuk den kucuge
select* from proje1.personel order by maas desc;
--                                kucukten buyuge => asc or nothing
select* from proje1.personel order by maas asc;
-- isetenilirse kolon sira numarisi da yazilabilir
select* from proje1.personel order by 5 desc;

-- maasa gore siralayip maasi en buyuk olan kisinin bilgilerini gosteriniz
select * from proje1.personel order by maas desc limit 1;

-- yonetim ve bakim bolumlerinde yasi 15 den buyuk en kucuk kisinin bilgileri
select * from proje1.personel where bolum in("Yonetim","Bakim") and yas >15 order by yas asc limit 1;

-- ilk once en kucuk yasi bulun  sonra bu yasa sahip olan kisilerin bilgilerini getirin

-- 15 ten buyuk En kucuk yasa sahip olanlarin (16) olanlarin bilgileri

select * from proje1.personel where yas=16 and bolum in ("Yonetim", "Bakim");

select * from proje1.personel where yas=(select yas from proje1.personel where bolum in("Yonetim", "Bakim") and yas>15 order by yas asc limit 1)
and bolum in("Bakim", "Yonetim");

-- personelleri isminde a harfi olanlari isme gore siralayiniz
select * from proje1.personel where ad like "%a%"order by ad;

-- maasi ortalamanin uzerinde olanlarin en dusuk maas alanin maasini yazdiriniz

select maas from proje1.personel where maas > (select avg(maas) from proje1.personel) order by maas limit 1;

-- tum table i siler
 truncate table proje1.personel;











select * from proje1.personel