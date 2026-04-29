
database empresa;
use empresa;
create table productos(
IDproducto int auto_increment primary key not null,
nombre_producto varchar(20),
tipo_producto varchar(10),
precio_producto float,
talla_producto char
 );
 create table vendedores(
 IDvendedor int auto_increment primary key not null,
 nombre_vendedor varchar(10)
 );
 create table repartidores(
 IDrepartidor int auto_increment primary key not null,
 nombre_repartidor varchar(10)
 );
 create table estadopedidos(
 IDestadopedido  int auto_increment primary key not null,
 descripcion varchar(30) not null
 );
 create table tipofacturas(
 IDfactura  int auto_increment primary key not null,
 descripcion char 
 );
 create table ventas(
 IDventa int auto_increment primary key not null,
 fecha date not null,
 FOREIGN KEY (vendedor) REFERENCES vendedores(IDvendedor),
 FOREIGN KEY (repartidores) REFERENCES repartidores(IDrepartidor),
 FOREIGN KEY (estadopedidos) REFERENCES estadopedidos(IDestadopedido),
 FOREIGN KEY (tipofactura) REFERENCES tipofacturas( IDfactura)
 );
 create table detalleventas(
 IDventa int, 
 IDproducto int,
 cantidad int default 1,
 primary key (IDventa, IDproducto ),
 FOREIGN KEY (venta) REFERENCES ventas(IDventa),
 FOREIGN KEY (producto) REFERENCES productos(IDproducto)
 );
 insert into vendedores(nombre_vendedor) values
('Marcos Paz'), ('Lucía Fernández'), ('Julián Gómez');
insert into repartidores (nombre_repartidor) values
('Correo Argentino'), ('Andreani'), ('Motomensajería Flash');
insert into estadopedidos (descripcion) values 
('Factura A'), ('Factura B'), ('Ticket C');
insert into productos(nombre_producto,precio_producto, talle_producto) values
('Remera Algodón', 15000.00, "L"), ('Pantalón Jean', 45000.50,"M"), ('Campera Cuero', 85000.00, "S");
INSERT INTO VENTAS (fecha, id_vendedor, id_repartidor, id_estadopedido, id_tipo_factura) VALUES 
('2026-04-10', 1, 1, 3, 1),
('2026-04-12', 2, 2, 2, 2),
('2026-04-15', 3, 3, 1, 3);

insert into detalleventas (id_venta, id_producto) values (1, 1), (2, 2), (3, 3);
select nombre_producto , precio_producto from productos;

