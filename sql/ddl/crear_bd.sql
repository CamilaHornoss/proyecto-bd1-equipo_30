IF DB_ID('ProyectoTiendaOGA') IS NULL
BEGIN
    EXEC('CREATE DATABASE ProyectoTiendaOGA');
END;
GO

USE ProyectoTiendaOGA;
GO

/* =========================================================
   ETAPA III - IMPLEMENTACION FISICA
   ========================================================= */

DROP TABLE IF EXISTS
    Pago,
    Detalle_venta,
    Detalle_compra,
    Venta,
    Compra,
    Producto,
    Metodo_pago,
    Cliente,
    Proveedor,
    Categorias;
GO


/* =========================================================
   TABLAS MAESTRAS
   ========================================================= */

CREATE TABLE Cliente (
    dni_cliente CHAR(8) NOT NULL,
    nombre_cliente VARCHAR(50) NOT NULL,
    apellido_cliente VARCHAR(50) NOT NULL,
    telefono_cliente VARCHAR(20) NOT NULL,
    calle VARCHAR(70) NOT NULL,
    altura INT NOT NULL,
    localidad VARCHAR(50) NOT NULL,

    CONSTRAINT pk_Cliente
        PRIMARY KEY (dni_cliente),

    CONSTRAINT uq_Cliente_telefono
        UNIQUE (telefono_cliente),

    CONSTRAINT ck_Cliente_altura
        CHECK (altura > 0)
);
GO


CREATE TABLE Metodo_pago (
    id_metodo INT IDENTITY(1,1) NOT NULL,
    nombre_metodo VARCHAR(40) NOT NULL,

    CONSTRAINT pk_Metodo_pago
        PRIMARY KEY (id_metodo),

    CONSTRAINT uq_Metodo_pago_nombre
        UNIQUE (nombre_metodo)
);
GO


CREATE TABLE Proveedor (
    id_proveedor INT IDENTITY(1,1) NOT NULL,
    cuit_proveedor CHAR(11) NOT NULL,
    nombre_proveedor VARCHAR(70) NOT NULL,
    telefono_proveedor VARCHAR(20) NOT NULL,

    CONSTRAINT pk_Proveedor
        PRIMARY KEY (id_proveedor),

    CONSTRAINT uq_Proveedor_cuit
        UNIQUE (cuit_proveedor),

    CONSTRAINT uq_Proveedor_telefono
        UNIQUE (telefono_proveedor)
);
GO


CREATE TABLE Categorias (
    id_categoria INT IDENTITY(1,1) NOT NULL,
    nombre_categoria VARCHAR(60) NOT NULL,

    CONSTRAINT pk_Categorias
        PRIMARY KEY (id_categoria),

    CONSTRAINT uq_Categorias_nombre
        UNIQUE (nombre_categoria)
);
GO


/* =========================================================
   PRODUCTOS Y COMPRAS
   ========================================================= */

CREATE TABLE Producto (
    id_producto INT IDENTITY(1,1) NOT NULL,
    descripcion_producto VARCHAR(100) NOT NULL,
    stock_actual INT NOT NULL,
    precio_lista DECIMAL(12,2) NOT NULL,
    precio_costo_referencia DECIMAL(12,2) NULL,
    id_categoria INT NOT NULL,

    CONSTRAINT pk_Producto
        PRIMARY KEY (id_producto),

    CONSTRAINT uq_Producto_descripcion
        UNIQUE (descripcion_producto),

    CONSTRAINT ck_Producto_stock
        CHECK (stock_actual >= 0),

    CONSTRAINT ck_Producto_precio_lista
        CHECK (precio_lista > 0),

    CONSTRAINT ck_Producto_precio_costo
        CHECK (
            precio_costo_referencia IS NULL
            OR precio_costo_referencia > 0
        ),

    CONSTRAINT fk_Producto_id_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES Categorias(id_categoria)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
GO


CREATE TABLE Compra (
    id_compra INT IDENTITY(1,1) NOT NULL,
    fecha_compra DATE NOT NULL,
    hora_compra TIME(0) NOT NULL,
    estado_compra VARCHAR(15) NOT NULL,
    id_proveedor INT NOT NULL,

    CONSTRAINT pk_Compra
        PRIMARY KEY (id_compra),

    CONSTRAINT ck_Compra_estado
        CHECK (
            estado_compra IN (
                'PENDIENTE',
                'RECIBIDA',
                'CANCELADA'
            )
        ),

    CONSTRAINT fk_Compra_id_proveedor
        FOREIGN KEY (id_proveedor)
        REFERENCES Proveedor(id_proveedor)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
GO


CREATE TABLE Detalle_compra (
    id_producto INT NOT NULL,
    id_compra INT NOT NULL,
    precio_unitario_compra DECIMAL(12,2) NOT NULL,
    cantidad_compra INT NOT NULL,

    CONSTRAINT pk_Detalle_compra
        PRIMARY KEY (id_producto, id_compra),

    CONSTRAINT ck_Detalle_compra_precio
        CHECK (precio_unitario_compra > 0),

    CONSTRAINT ck_Detalle_compra_cantidad
        CHECK (cantidad_compra > 0),

    CONSTRAINT fk_Detalle_Compra_id_producto
        FOREIGN KEY (id_producto)
        REFERENCES Producto(id_producto)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,

    CONSTRAINT fk_Detalle_Compra_id_compra
        FOREIGN KEY (id_compra)
        REFERENCES Compra(id_compra)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
GO


/* =========================================================
   VENTAS
   ========================================================= */

CREATE TABLE Venta (
    id_venta INT IDENTITY(1,1) NOT NULL,
    fecha_venta DATE NOT NULL,
    hora_venta TIME(0) NOT NULL,
    estado_venta VARCHAR(20) NOT NULL,
    dni_cliente CHAR(8) NOT NULL,

    CONSTRAINT pk_Venta
        PRIMARY KEY (id_venta),

    CONSTRAINT ck_Venta_estado
        CHECK (
            estado_venta IN (
                'PENDIENTE DE PAGO',
                'PAGADO',
                'PREPARADO',
                'ENTREGADO',
                'CANCELADO'
            )
        ),

    CONSTRAINT fk_Venta_dni_cliente
        FOREIGN KEY (dni_cliente)
        REFERENCES Cliente(dni_cliente)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
GO


CREATE TABLE Detalle_venta (
    id_producto INT NOT NULL,
    id_venta INT NOT NULL,
    precio_unitario DECIMAL(12,2) NOT NULL,
    cantidad_venta INT NOT NULL,

    CONSTRAINT pk_Detalle_venta
        PRIMARY KEY (id_producto, id_venta),

    CONSTRAINT ck_Detalle_venta_precio
        CHECK (precio_unitario > 0),

    CONSTRAINT ck_Detalle_venta_cantidad
        CHECK (cantidad_venta > 0),

    CONSTRAINT fk_Detalle_venta_id_producto
        FOREIGN KEY (id_producto)
        REFERENCES Producto(id_producto)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,

    CONSTRAINT fk_Detalle_venta_id_venta
        FOREIGN KEY (id_venta)
        REFERENCES Venta(id_venta)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
GO


/* =========================================================
   PAGOS
   ========================================================= */

CREATE TABLE Pago (
    id_pago INT IDENTITY(1,1) NOT NULL,
    id_venta INT NOT NULL,
    id_metodo INT NOT NULL,
    fecha_pago DATE NOT NULL,
    hora_pago TIME(0) NOT NULL,
    monto DECIMAL(12,2) NOT NULL,
    referencia VARCHAR(50) NOT NULL,

    CONSTRAINT pk_Pago
        PRIMARY KEY (id_pago),

    CONSTRAINT ck_Pago_monto
        CHECK (monto > 0),

    CONSTRAINT fk_Pago_id_venta
        FOREIGN KEY (id_venta)
        REFERENCES Venta(id_venta)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,

    CONSTRAINT fk_Pago_id_metodo
        FOREIGN KEY (id_metodo)
        REFERENCES Metodo_pago(id_metodo)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
GO
