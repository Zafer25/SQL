select * from proje1.personel;
-- group by ifadesi gruplama yapmak icindir

-- Her bit bolumdeki calisan syisini listeleyelim
select bolum, count(id) as Calisan_Sayisi from proje1.personel group by bolum;

-- Her bir Bolumdeki min maasi hesaplayiniz
select bolum,min(maas) as min_Maas from proje1.personel group by bolum;

-- Her bir bolumdeki ortalama maasi virgulden sonra 1 basamak olacak sekilde hesaplayin
select bolum,round (avg(maas),1) as avgMaas from proje1.personel group by bolum;

-- herbir bolumdeki toplam maas gosterelim
select bolum, sum(maas) as toplam_Maas from proje1.personel group by bolum;

-- having kullanimi
-- ortalama maasi 6000 den fazla olan bolumlerin max maaslarini listeleyelim
select bolum, max(maas) as max_Maas from proje1.personel group by bolum having avg(maas)>6000;

-- toplam maaslari 10000 den fazla olan bolumlerin ortalama maaslarini yazdiriniz
select bolum, avg(maas) as Maas from proje1.personel group by bolum having sum(maas)>10000;

-- kisi sayisi 1 den fazla olan bolumlerin toplam maaslarini getirelim
select bolum,sum(maas) as toplam_maas from proje1.personel group by bolum having count(id)>1;

/*
union ve union all kullanimi

 birden fazla sorgulari birlestirmede bize yardimci olur
 
 union tekrarli olanlari gostermez
 union all tekrarli olanlari gosterir
 */
 
select * from proje1.personel where maas>6000
union 
select * from proje1.personel where maas>4000;

select * from proje1.personel where maas>6000
union all
select * from proje1.personel where maas>4000;

-- maasi 4000 den fazla isim ve bolumunu, ismi yunus olanlarin isim ve bilgilerini getir
select isim, bolum, yas from proje1.personel where maas>4000
union 
select isim, bolum, yas from proje1.personel where isim="Yunus";


create table proje1.personel_info(
id int primary key,
tel varchar(10) unique,
cocuk_sayisi int
);
insert into proje1.personel_info values(11, '1234567891', 1);
  insert into proje1.personel_info values(12, '1234567892', 3);
  insert into proje1.personel_info values(13, '1234567893', 2);
  insert into proje1.personel_info values(14, '1234567894', 1);
  insert into proje1.personel_info values(15, '1234567895', 4);
   insert into proje1.personel_info values(16, '1234567896', 1);
   insert into proje1.personel_info values(17, '1234567897', 2);
    insert into proje1.personel_info values(18, '1234567898', 3);
   insert into proje1.personel_info values(19, '1234567899', 1);
      insert into proje1.personel_info values(20, '1234567890', 4);

      select * from proje1.personel_info;

-- isim ve id kismini personel den id ve tel kismini personel_infodan listeleyeniz
select id, isim as isim_tel from proje1.personel
union
select id, tel from proje1.personel_info;

-- maasi 7000 den fazla olanlarin id ve isimlerini ve cocuk sayisi 1 yada 2 olanlarin 
-- id ve tel numaralarini getirelim
select id, isim as isim_tel from proje1.personel where maas>7000
union
select id, tel from proje1.personel_info where cocuk_sayisi in (1,2);

