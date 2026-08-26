




-- drop database carniceria;
create database carniceria;
use carniceria;


create table categorias (
  ID_categoria int auto_increment primary key,
  nombre varchar(30)
);
create table productos (
  ID_producto int auto_increment primary key,
  nombre varchar(50),
  precio decimal(10,2),
  ID_Categoria int,
 foreign key (ID_Categoria) references categorias(ID_categoria)
 );

create table clientes (
  ID_cliente int auto_increment primary key,
  nombre varchar(50),
  direccion varchar(100)
);


create table carniceros (
  ID_carnicero int auto_increment primary key,
  nombre varchar(50)
);

create table metodos_pago (
  ID_metodo int auto_increment primary key,
  nombre varchar(30)
);

create table ventas (
  ID_venta int auto_increment primary key,
  ID_cliente int,
  ID_producto int,
  ID_carnicero int,
  cantidad int,
  fecha date,
  foreign key (ID_cliente) references clientes(ID_cliente),
  foreign key (ID_producto) references productos(ID_producto),
  foreign key (ID_carnicero) references carniceros(ID_carnicero)
);

insert into categorias (nombre) values ('vacuno'), ('aves'), ('embutidos'), ('cerdo');
insert into carniceros (nombre) values ('juan'), ('ana');
insert into metodos_pago (nombre) values ('efectivo'), ('tarjeta'), ('transferencia');


insert into productos (nombre, precio, ID_Categoria)
values ('asado', 2500, 1),
       ('pollo', 1800, 2),
       ('chorizo', 1200, 3),
       ('milanesa', 2200, 1),
       ('bondiola', 2700, 4);

insert into clientes (nombre, direccion)
values ('juan perez', 'av. siempre viva 123'),
       ('maria lopez', 'calle sol 456'),
       ('carlos diaz', 'ruta 8 km 12');


insert into ventas (ID_cliente, ID_producto, ID_carnicero, cantidad, fecha)
values (1, 1, 1, 2, '2026-08-20'), 
       (2, 3, 2, 5, '2026-08-21'),
	   (3, 2, 1, 3, '2026-08-22'),
       (1, 5, 1, 1, '2026-08-22');

-- producto más caro
select nombre, precio from productos
where precio = (select max(precio) from productos);

-- producto más barato
select nombre, precio from productos
where precio = (select min(precio) from productos);

-- precio promedio
select avg(precio) as promedio from productos;

-- cliente con más compras
select nombre from clientes
where ID_cliente = (
  select ID_cliente from ventas
  group by ID_cliente
  order by sum(cantidad) desc
  limit 1
);

-- total vendido por categoría
select p.ID_Categoria, sum(p.precio * v.cantidad) as total -- select categoria, sum(precio * cantidad) as total
from productos as p, ventas as v                           -- from productos p
where v.ID_producto = p.ID_producto                        -- join ventas v on p.ID_producto = v.ID_producto
group by p.ID_Categoria;                                   -- group by categoria;


select car.nombre, count(v.ID_venta) as atendidos
from carniceros car
join ventas v on car.ID_carnicero = v.ID_carnicero
group by car.ID_carnicero, car.nombre
order by atendidos desc
limit 1;



