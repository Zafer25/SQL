use proje1;


create table urunler(
urun_id int primary key auto_increment,
urun_adi varchar(50), 
fiyat double
);

-- insert into urunler(urun_adi, fiyat) values ('Hamburger', 8.50),('Cheeseburger', 10.50),('Sucuk Burger', 11);

insert into urunler(urun_adi, fiyat) values ('Hamburger', 8.50);
insert into urunler(urun_adi, fiyat) values('Cheeseburger', 10.50);
insert into urunler(urun_adi, fiyat) values('Sucuk Burger', 11);

select * from urunler;

create table siparis(
siparis_id int primary key auto_increment,
urun_id int,
adet int,
toplam_fiyat double,
adres varchar(225),
foreign key (urun_id) references urunler(urun_id)

);

insert into siparis(urun_id, adet, toplam_fiyat, adres) values (14, 5, 42.5,"Istanbul");
insert into siparis(urun_id, adet, toplam_fiyat, adres) values(12, 2, 21,"Ankara");
insert into siparis(urun_id, adet, toplam_fiyat, adres) values(13, 1, 11,'Ankara');

select * from urunler;
select * from siparis;

select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
left join siparis s
on u.urun_id =s.urun_id;
------------------
select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
right join siparis s
on u.urun_id =s.urun_id;
-------------------
select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
inner join siparis s
on u.urun_id =s.urun_id;
--------------------
select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
left join siparis s
on u.urun_id =s.urun_id
union
select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
right join siparis s
on u.urun_id =s.urun_id;





