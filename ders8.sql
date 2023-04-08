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
delete from urunler where urun_id=12;
select * from urunler;
select * from siparis;

update urunler set urun_id=urun_id+10;
set sql_safe_updates=0;

-- kategoriler ve products diye table olusturup urunler ekleyip cascade ile silip ve update yapiniz
/*kategoriler
kat_id
kat_adi

products
product_id
kat_id
product_adi
product_fiyat*/

create table kategoriler(
kat_id int primary key auto_increment,
kat_adi varchar(100)
);


insert into kategoriler(kat_adi) values('Computer');
insert into kategoriler(kat_adi) values('Telefon');
insert into kategoriler(kat_adi) values('Ev Esyasi');


select * from kategoriler;

create table products(
product_id int primary key auto_increment,
kat_id int, 
product_adi varchar(100),
product_fiyat double,
foreign key (kat_id) references kategoriler(kat_id)
on delete cascade
on update cascade
);
insert into products(kat_id, product_adi, product_fiyat) values(1, 'Dell', 1000);
insert into products(kat_id, product_adi, product_fiyat) values(2, 'Samsung', 700);
insert into products(kat_id, product_adi, product_fiyat) values(3, 'Bulasik Makinasi', 700);
insert into products(kat_id, product_adi, product_fiyat) values(1, 'Asus', 1200);
insert into products(kat_id, product_adi, product_fiyat) values(3, 'Camasir Makinasi', 800);

------------
select kategoriler.kat_id, kategoriler.kat_adi, products.product_adi,products.product_fiyat 
from products 
left join kategoriler
on kategoriler.kat_id=products.kat_id;
--------------------

select kategoriler.kat_id, kategoriler.kat_adi,products.product_id, products.product_adi,products.product_fiyat 
from products 
left join kategoriler
on kategoriler.kat_id=products.kat_id;

select kategoriler.kat_id, kategoriler.kat_adi,products.product_id, products.product_adi,products.product_fiyat 
from products 
right join kategoriler
on kategoriler.kat_id=products.kat_id;


select kategoriler.kat_id, kategoriler.kat_adi,products.product_id, products.product_adi,products.product_fiyat 
from products 
inner join kategoriler
on kategoriler.kat_id=products.kat_id;

select kategoriler.kat_id, kategoriler.kat_adi,products.product_id, products.product_adi,products.product_fiyat 
from products 
left join kategoriler
on kategoriler.kat_id=products.kat_id
union
select kategoriler.kat_id, kategoriler.kat_adi,products.product_id, products.product_adi,products.product_fiyat 
from products 
right join kategoriler
on kategoriler.kat_id=products.kat_id;













