create table proje1.orders(
id int not null primary key,
ad varchar(50),
adres varchar(255),
email varchar(200) unique ,
tel int unique,
tarih datetime default now(),
urun varchar(50),
fiyat int,
adet int,
toplamfiyat int
);

insert into proje1.orders values(1,"Zafer", "Istanbul","zafer.asm@gmail.com",1234567891,now(),"Margaritta",15,2,30);
insert into proje1.orders values(2,"Ahmet", "Istanbul","ahmet.asm@gmail.com",1234567892,now(),"Sucuklu Pizza",16,1,16);
insert into proje1.orders values(3,"Sena", "Ankara","sena.asm@gmail.com",1234567893,now(),"Vegi",10,3,30);
insert into proje1.orders values(4,"Ali", "Paris","Ali.asm@gmail.com",1234567814,now(),"Pepperoni",15,2,30);
insert into proje1.orders values(5,"Azra", "Izmir","Azra.asm@gmail.com",123456895,now(),"Margaritta",15,2,15);
insert into proje1.orders values(6,"Huzeyfe", "Antalya","huz.asm@gmail.com",124567896,now(),"Burger",10,2,20);
insert into proje1.orders values(7,"Yunus", "Erzurum","yunus.asm@gmail.com",124567897,now(),"Salata",7,4,28);
insert into proje1.orders values(8,"Enes", "Izmir","enes.asm@gmail.com",123467898,now(),"Sucuklu Pizza",16,2,32);
insert into proje1.orders values(9,"Asim", "Frankfurt","asim.asm@gmail.com",123467899,now(),"Margaritta",15,3,45);
insert into proje1.orders values(10,"Hans", "Izmir","hans.asm@gmail.com",123457810,now(),"Margaritta",15,2,30);

select * from proje1.orders;

-- 1)toplamfiyati 25 euro dan fazla olan siparislerin sayisini gosteriniz
select urun, adet from proje1.orders where toplamFiyat>25;

-- 2)Toplam kazanilan parayi yaziniz
select sum(toplamFiyat) as kayanilan_para from proje1.orders;

-- 3) en yuksek ve en dusuk siparisin tum bilgilerini gertiriniz
select * from proje1.orders where adet=(select min(adet) as en_kucuk from proje1.orders);
-- 4) ortalama kazanilan parayi virgulden sonra 2 basamakli olarak getiriniz
select avg(toplamFiyat) from proje1.orders;
-- 5) Urun isimlerini buyuk harfli olarak gosteriniz
select upper(urun) from proje1.orders;
-- 6)Urun isimlerinin sadece ilk harfini buyuk harfli olarak gosteriniz


-- 7) Toplam fiyati en yuksek olan 3 siparisi yazdiriniz
  select * from proje1.orders order by toplamFiyat desc limit 3;
-- 8) Urunlerin icinde a harfi olanlari urun ismine gore siralayiniz
select * from proje1.orders where urun like "_a%" or urun like "A_%";
-- 9) Siparis miktari 15 Euro dan fazla olanlari silelim
-- 10) Delete Truncate Drop arasindaki fark nedir?
-- TRUNCATE tüm satırları bir defada kaldırır 
-- DROP  bir tabloyu veya veritabanını veritabanından tamamen kaldırır.
DELETE satirlari tek tek kaldirir

