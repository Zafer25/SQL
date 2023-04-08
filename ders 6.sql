-- update => veri Tablodaki verileri guncellemek icin kullaniriz 
-- update tablo ismi set kolon ismi = yeni deger
set sql_safe_updates=0;
-- id leri hepsini 10 artiralim
update proje1.personel set id=id+10;
-- id si 11 olanin Bolumunu tesis yapalim yasini 290 yapalim
update proje1.personel set bolum = "Tesis" , yas=20 where id =11;
-- bolumu personel olanin maaslarini 2000 artirin
update proje1.personel set maas = maas+2000 where bolum="Personel";

-- Tugrulu CEO yapalim 
update proje1.personel set bolum="Ceo" where id=16;




select @maxMaas:=(maas) as maxMaas from proje1.personel;
select * from proje1.personel where maas =@maxMaas;
-- yas ortalamasinin uzerinde olanlardan en dusuk maas alanin tum bilgilerini getiriniz

select @ortalamaYas:=avg(yas) from proje1.personel;
select @kckMaas:=min(maas) from proje1.personel where yas>@ortalamaYas;
select * from proje1.personel where maas=@kckMaas;

-- bakim personel bolumlerindeki calisanlarin 500 lira azaltalim
 update proje.personel set maas= maas -500 where bolum in ("Bakim", "Personel");
 
 -- alter kullanimi
 alter table proje1.personel add adres varchar(150) default "Almanya";
 -- cinsiyet kolonu ekleyelim
 alter table proje1.personel add cinsiyet varchar(50) ;
 
 -- tablo ismi degistirme 
       --            eski isim                 yani isim
 drop table proje1.personel;
 alter table proje1.personel rename to proje1.persons;
 
 alter table proje1.personel rename to proje1.personel;

 alter table world.city rename to world.city2;

 
 -- id si 12 disinda olanlarin cinsiyetini erkek yapiniz
 -- esit degildir != yada  <> kullanilarak  yapilarak gosterilir 
  update proje1.personel set cinsiyet = "Erkek" where id <> 12;
  update proje1.personel set cinsiyet = "Kadin" where id = 12;
  
  -- kolon isim degistirme 
  alter table proje1.personel rename column bolum to departman;
  
  -- ad kolonunu isime cevirelim
    alter table proje1.personel rename column ad to isim;

alter table proje1.personel modify adres varchar (200);
-- adres kolonunu default olarak Turkiye atayalim
alter table proje1.personel alter column adres set default 'Turkiye';

 alter table proje1.personel modify adres  varchar(200) default 'Turkiye';

-- yeni bit kisi ekleyip default olarak Turkiye gozuksun
insert into proje1.personel(id, isim, departman, yas, maas, cinsiyet) values (19, "Can", "Tehsis", 35, 7000,"Erkek");
-- check ekleme 
alter table proje1.personel add constraint check (maas>4000);
 
 
 alter table proje1.personel rename column departman to bolum;
 
select * from proje1.personel;










