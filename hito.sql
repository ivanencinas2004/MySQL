drop database if exists hito;
create database hito;
use hito;

create table barrio (
	id_barrio int primary key auto_increment,
    nombre varchar (40)
);

create table calle (
	id_calle int primary key auto_increment,
    nombre varchar (40)
);

create table puntodeinteres (
	id_puntodeinteres int primary key auto_increment,
    nombre varchar (40)
);

create table paradadebus (
	id_paradadebus int primary key auto_increment,
    codigo char (40)
);

create table estaciondemetro (
	id_estaciondemetro int primary key auto_increment,
    nombre varchar (40)
);

create table lineademetro (
	id_lineademetro int primary key auto_increment,
    numero varchar (40)
);

create table lineadebus (
	id_lineadebus int primary key auto_increment,
    numero char (40)
);

create table tramo (
	id_tramo int primary key auto_increment,
    id_barrio int,
    id_calle int,
    id_paradadebus int,
    id_estaciondemetro int,
    foreign key (id_barrio) references barrio(id_barrio),
    foreign key (id_calle) references calle(id_calle),
    foreign key (id_paradadebus) references paradadebus(id_paradadebus),
    foreign key (id_estaciondemetro) references estaciondemetro(id_estaciondemetro),
    inicio varchar (40),
    fin varchar (40)
);


create table estaciondemetro_lineademetro (
	id_estaciondemetro_lineademetro int primary key auto_increment,
    id_estaciondemetro int,
	id_lineademetro int, 
    foreign key (id_estaciondemetro) references estaciondemetro(id_estaciondemetro),
    foreign key (id_lineademetro) references lineademetro(id_lineademetro)
);

create table puntodeinteres_tramo (
	id_puntodeinteres_tramo int primary key auto_increment,
    id_puntodeinteres int,
	id_tramo int, 
    foreign key (id_puntodeinteres) references puntodeinteres(id_puntodeinteres),
    foreign key (id_tramo) references tramo(id_tramo)
);

create table paradadebus_lineadebus (
	id_paradadebus_lineadebus int primary key auto_increment,
    id_paradadebus int,
	id_lineadebus int, 
    foreign key (id_paradadebus) references paradadebus(id_paradadebus),
    foreign key (id_lineadebus) references lineadebus(id_lineadebus)
);

insert into barrio values (null, 'Vallecas');
insert into barrio values (null, 'Orcasitas');
insert into barrio values (null, 'Villa verde');
insert into barrio values (null, 'Usera');

insert into calle values (null, 'Huertas');
insert into calle values (null, 'Mayor');
insert into calle values (null, 'de Preciados');
insert into calle values (null, 'de Segovia');

insert into puntodeinteres values (null, 'Plaza Mayor');
insert into puntodeinteres values (null, 'Puerta del sol');
insert into puntodeinteres values (null, 'Gran Via');
insert into puntodeinteres values (null, 'Plaza España');

insert into paradadebus values (null, 'B505');
insert into paradadebus values (null, 'B509');
insert into paradadebus values (null, 'B555');
insert into paradadebus values (null, 'B506');

insert into estaciondemetro values (null, 'Atocha');
insert into estaciondemetro values (null, 'Callao');
insert into estaciondemetro values (null, 'Portazgo');
insert into estaciondemetro values (null, 'Nuevos Ministerios');

insert into lineademetro values (null, 'Linea1');
insert into lineademetro values (null, 'Linea2');
insert into lineademetro values (null, 'Linea3');
insert into lineademetro values (null, 'Linea4');

insert into lineadebus values (null, 'Linea1');
insert into lineadebus values (null, 'Linea2');
insert into lineadebus values (null, 'Linea3');
insert into lineadebus values (null, 'Linea4');


insert into tramo values (null,'1','1','1','1','41.40338 , 2.17403','41 24.2028 , 2 10.4418');
insert into tramo values (null,'2','2','2','2','41.40338 , 2.17403','41 24.2028 , 2 10.4418');
insert into tramo values (null,'3','3','3','3','41.40338 , 2.17403','41 24.2028 , 2 10.4418');

insert into puntodeinteres_tramo values (null, '1','1');
insert into puntodeinteres_tramo values (null, '2','2');
insert into puntodeinteres_tramo values (null, '2','2');

insert into paradadebus_lineadebus values (null, '1','1');
insert into paradadebus_lineadebus values (null, '2','2');
insert into paradadebus_lineadebus values (null, '3','3');

insert into estaciondemetro_lineademetro values (null, '1','1');
insert into estaciondemetro_lineademetro values (null, '2','2');
insert into estaciondemetro_lineademetro values (null, '3','3');

-- select ---

select * from barrio where nombre= 'Orcasitas';

select * from barrio where nombre like 'O%';

select * from calle where nombre like '%e%';

select * from estaciondemetro where nombre between 'c' and 'nz';

select * from paradadebus where codigo between 'B505' and 'B510';

select paradadebus.codigo, lineadebus.numero from paradadebus,lineadebus;

select * from calle,barrio,lineademetro;

select id_paradadebus, codigo
from paradadebus inner join lineadebus
on paradadebus.id_paradadebus = lineadebus.id_lineadebus
order by id_lineadebus;

set sql_safe_updates=0;
select*from puntodeinteres;
delete from puntodeinteres
where nombre= 'Gran Via';

select id_estaciondemetro, nombre
from estaciondemetro inner join lineademetro
on estaciondemetro.id_estaciondemetro = lineademetro.id_lineademetro
order by id_lineademetro;









































