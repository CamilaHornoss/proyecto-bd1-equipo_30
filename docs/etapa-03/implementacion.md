create database ProyectoTiendaOGA
go

create table Cliente (
	dni_cliente INT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	telefono VARCHAR(15) UNIQUE NOT NULL,
	calle VARCHAR(70) NOT NULL,
	altura INT NOT NULL,
	localidad VARCHAR(50) NOT NULL,
	)


create table Metodo_pago (
	id_metodo INT IDENTITY (1,1) PRIMARY KEY,
	nombre_metodo VARCHAR(30) NOT NULL,
	)

create table Proveedor (
	id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
	cuit_proveedor INT NOT NULL UNIQUE,
	nombre_proveedor VARCHAR(70) NOT NULL,
	telefono_proveedor VARCHAR(15) NOT NULL,
	)

create table Categorias (
	id_categoria INT IDENTITY(1,1) PRIMARY KEY,
	nombre_categoria VARCHAR(60) NOT NULL,
	)

create table Venta (
	id_venta INT IDENTITY(1,1) PRIMARY KEY,
	fecha_venta DATE NOT NULL,
	hora_venta INT NOT NULL,
	estado_venta BIT NOT NULL,
	dni_cliente INT NOT NULL,
	CONSTRAINT fk_Venta_dni_cliente 
	FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni_cliente)
	)

create table Compra (
	id_compra INT IDENTITY(1,1) PRIMARY KEY,
	fecha_compra DATE NOT NULL,
	hora_compra INT NOT NULL,
	estado_compra BIT NOT NULL,
	id_proveedor INT NOT NULL,
	CONSTRAINT fk_Compra_cuit_proveedor 
	FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
	)

create table Producto (
	id_producto INT IDENTITY(1,1) PRIMARY KEY,
	stock_actual INT,
	descripcion_producto VARCHAR(60) UNIQUE NOT NULL,
	precio_lista DECIMAL(10,2) NOT NULL,
	id_categoria INT NOT NULL,
	CONSTRAINT fk_Producto_id_categoria 
	FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
	)

create table Detalle_compra (
	id_producto INT NOT NULL,
	id_compra INT NOT NULL,
	precio_compra DECIMAL(10,2) CHECK (precio_compra > 0) not null,
	cantidad_compra INT CHECK (cantidad_compra > 0) not null,
	CONSTRAINT pk_Detalle_compra PRIMARY KEY (id_producto, id_compra),
	CONSTRAINT fk_Detalle_Compra_id_producto 
	FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
	CONSTRAINT fk_Detalle_Compra_id_compra 
	FOREIGN KEY (id_compra) REFERENCES Compra(id_compra)
	)

create table Detalle_venta (
	id_producto INT NOT NULL,
	id_venta INT NOT NULL,
	precio_unitario DECIMAL(10,2) CHECK(precio_unitario > 0) NOT NULL,
	cantidad_venta INT CHECK (cantidad_venta > 0) NOT NULL,
	CONSTRAINT pk_Detalle_venta PRIMARY KEY (id_producto, id_venta),
	CONSTRAINT fk_Detalle_venta_id_producto 
	FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
	CONSTRAINT fk_Detalle_venta_id_compra
	FOREIGN KEY (id_venta) REFERENCES Venta(id_venta)
	)

create table Pago (
	id_venta INT NOT NULL, 
	id_metodo INT NOT NULL,
	monto DECIMAL(10,2) CHECK (monto > 0) NOT NULL,
	CONSTRAINT pk_Pago PRIMARY KEY (id_venta, id_metodo),
	CONSTRAINT fk_Pago_id_venta 
	FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
	CONSTRAINT fk_Pago_id_metodo 
	FOREIGN KEY (id_metodo) REFERENCES Metodo_pago(id_metodo)
	)

