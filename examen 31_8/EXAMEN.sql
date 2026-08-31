
create database laboratorio;
-- drop database laboratorio;
use laboratorio;

create table empresas (
idempresa int primary key auto_increment,
nombre varchar(100),
DNI varchar(20)
);

create table tipomuestras (
idtipo int primary key auto_increment,
descripcion varchar(50)
);

create table tecnicosq (
idtecnicoq int primary key auto_increment,
nombre varchar(50),
apellido varchar(50)
);

create table muestras (
idmuestra int primary key auto_increment,
idempresa int,
idtipo int,
fecha date,
foreign key (idempresa) references empresas(idempresa),
foreign key (idtipo) references tipomuestras(idtipo)
);

create table compuestos (
idcompuesto int primary key auto_increment,
nombre varchar(100),
formula varchar(50)
);

create table analisis (
idanalisis int primary key auto_increment,
idmuestra int,
idtecnicoq int,
fecha_analisis date,
resultado varchar(100),
foreign key (idmuestra) references muestras(idmuestra),
foreign key (idtecnicoq) references tecnicosq(idtecnicoq)
);

create table analisis_compuesto (
idanalisis int,
idcompuesto int,
concentracion decimal(10,2),
primary key (idanalisis, idcompuesto),
foreign key (idanalisis) references analisis(idanalisis),
foreign key (idcompuesto) references compuestos(idcompuesto)
);

insert into empresas (nombre, dni) values 
('arcor','96567689'), ('aysa','15467278');
insert into tipomuestras (descripcion) values 
('agua'), ('suelo'), ('aire'), ('alimentos');
insert into tecnicosq (nombre, apellido) values 
('juan','perez'), ('ana','gomez');
insert into muestras (idempresa, idtipo, fecha) values 
(1,1,'2024-01-10'), (1,2,'2024-01-11'), (2,1,'2024-01-12');
insert into compuestos (nombre, formula) values 
('plomo','pb'), ('nitrogeno','n2');
insert into analisis (idmuestra, idtecnicoq, fecha_analisis, resultado) values 
(1,1,'2024-01-15','positivo'), (2,2,'2024-01-16','negativo');
insert into analisis_compuesto (idanalisis, idcompuesto, concentracion) values 
(1,1,10.5), (1,2,2.3), (2,1,0.5);

select * from empresas;
select * from tipomuestras;
select * from tecnicosq;
select * from muestras;
select * from analisis;

select e.nombre, t.descripcion, m.fecha
from muestras m
inner join empresas e on m.idempresa = e.idempresa
inner join tipomuestras t on m.idtipo = t.idtipo;

select idempresa, count(*) as total from muestras group by idempresa;

select idempresa, count(*) as total from muestras group by idempresa having count(*) > 1;

select nombre from tecnicosq where idtecnicoq > (select avg(idtecnicoq) from tecnicosq);

select avg(concentracion) from analisis_compuesto;
select count(*) from muestras;
