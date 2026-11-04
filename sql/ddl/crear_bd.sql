CREATE DATABASE ProyectoTiendaOGA;
GO

USE ProyectoTiendaOGA;
GO

CREATE TABLE Cliente (
    dni_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    apellido_cliente VARCHAR(50) NOT NULL,
    telefono_cliente VARCHAR(15) UNIQUE NOT NULL,
    calle VARCHAR(70) NOT NULL,
    altura INT NOT NULL,
    localidad VARCHAR(50) NOT NULL
);

CREATE TABLE Metodo_pago (
    id_metodo INT IDENTITY(1,1) PRIMARY KEY,
    nombre_metodo VARCHAR(30) NOT NULL
);

CREATE TABLE Proveedor (
    id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
    cuit_proveedor CHAR(11) NOT NULL UNIQUE,
    nombre_proveedor VARCHAR(70) NOT NULL,
    telefono_proveedor VARCHAR(15) NOT NULL
);

CREATE TABLE Categorias (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre_categoria VARCHAR(60) NOT NULL
);

CREATE TABLE Venta (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    hora_venta TIME(0) NOT NULL,
    estado_venta VARCHAR(20) NOT NULL,
    dni_cliente INT NOT NULL,
    CONSTRAINT fk_Venta_dni_cliente 
    FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni_cliente)
);

CREATE TABLE Compra (
    id_compra INT IDENTITY(1,1) PRIMARY KEY,
    fecha_compra DATE NOT NULL,
    hora_compra TIME(0) NOT NULL,
    estado_compra VARCHAR(20) NOT NULL,
    id_proveedor INT NOT NULL,
    CONSTRAINT fk_Compra_id_proveedor 
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

CREATE TABLE Producto (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    stock_actual INT CHECK (stock_actual >= 0),
    descripcion_producto VARCHAR(60) UNIQUE NOT NULL,
    precio_lista DECIMAL(10,2) CHECK (precio_lista > 0) NOT NULL,
    precio_costo_referencia DECIMAL(10,2) CHECK (precio_costo_referencia > 0) NULL,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_Producto_id_categoria 
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Detalle_compra (
    id_producto INT NOT NULL,
    id_compra INT NOT NULL,
    precio_unitario_compra DECIMAL(10,2) CHECK (precio_unitario_compra > 0) NOT NULL,
    cantidad_compra INT CHECK (cantidad_compra > 0) NOT NULL,
    CONSTRAINT pk_Detalle_compra PRIMARY KEY (id_producto, id_compra),
    CONSTRAINT fk_Detalle_Compra_id_producto 
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    CONSTRAINT fk_Detalle_Compra_id_compra 
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra)
);

CREATE TABLE Detalle_venta (
    id_producto INT NOT NULL,
    id_venta INT NOT NULL,
    precio_unitario DECIMAL(10,2) CHECK (precio_unitario > 0) NOT NULL,
    cantidad_venta INT CHECK (cantidad_venta > 0) NOT NULL,
    CONSTRAINT pk_Detalle_venta PRIMARY KEY (id_producto, id_venta),
    CONSTRAINT fk_Detalle_venta_id_producto 
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    CONSTRAINT fk_Detalle_venta_id_venta
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta)
);

CREATE TABLE Pago (
    id_pago INT IDENTITY(1,1) PRIMARY KEY,
    id_venta INT NOT NULL, 
    id_metodo INT NOT NULL,
    fecha_pago DATE NOT NULL,
    hora_pago TIME(0) NOT NULL,
    monto DECIMAL(10,2) CHECK (monto > 0) NOT NULL,
    referencia VARCHAR(50) NULL,
    CONSTRAINT fk_Pago_id_venta 
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    CONSTRAINT fk_Pago_id_metodo 
    FOREIGN KEY (id_metodo) REFERENCES Metodo_pago(id_metodo)
);
