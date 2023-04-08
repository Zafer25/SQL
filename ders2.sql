SELECT * FROM proje1.person;
create table proje1.customer(
id int not null auto_increment,
adi varchar(45) not null ,
adres varchar(255),
kayitTarihi datetime default now(),
yas int ,
check (yas>18),
primary key(id)


);

insert into proje1.customer(adi, adres, yas) values("Nergis", "Ankara", 19);
select * from proje1.customer;