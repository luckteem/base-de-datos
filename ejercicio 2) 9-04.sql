create database tienda_ropa;
use tienda_ropa;

create table categorias (
    ID_categoria int auto_increment primary key,
    descripcion varchar(50) not null
);

create table productos (
    codigo_producto int primary key,
    nombre varchar(100) not null,
    precio decimal(10,2) not null,
    ID_categoria int,
    FOREIGN KEY (ID_categoria) REFERENCES categorias(ID_categoria)
);

create table clientes (
    ID_cliente int primary key,
    nombre varchar(100) not null,
    telefono varchar(20)
);

create table vendedores (
    ID_vendedor int primary key,
    nombre varchar(100) not null,
    area_trabajo varchar(50)
);

create table ventas (
    ID_venta int auto_increment primary key,
    fecha date not null,
    ID_cliente int,
    ID_vendedor int,
    FOREIGN KEY (ID_cliente) REFERENCES clientes(ID_cliente),
    FOREIGN KEY (ID_vendedor) REFERENCES vendedores(ID_vendedor)
);

create table detalle_venta (
    ID_venta int,
    codigo_producto int,
    cantidad int default 1,
    primary key (ID_venta, codigo_producto),
    FOREIGN KEY (ID_venta) REFERENCES ventas(ID_venta),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
);

