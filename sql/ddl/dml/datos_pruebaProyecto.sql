USE ProyectoTiendaOGA;
GO

/* =========================================================
   ETAPA III - DATOS DE PRUEBA
   ========================================================= */

/* =========================================================
   CLIENTES
   ========================================================= */

INSERT INTO Cliente
    (
        dni_cliente,
        nombre_cliente,
        apellido_cliente,
        telefono_cliente,
        calle,
        altura,
        localidad
    )
VALUES
('38456123','Carlos','Gomez','3794112233','Junin',1240,'Corrientes'),
('40123987','Lucia','Fernandez','3794998877','San Martin',850,'Resistencia'),
('42555111','Ana','Lopez','3624551100','Brown',330,'Resistencia'),
('36777222','Martin','Diaz','3794772200','Belgrano',1540,'Corrientes'),
('44999333','Sofia','Benitez','3624993300','Mitre',910,'Barranqueras'),
('39888444','Pablo','Romero','3794884400','Cordoba',745,'Corrientes'),
('43111555','Laura','Acosta','3624115500','Sarmiento',222,'Fontana'),
('35666677','Diego','Ruiz','3794666777','Mendoza',1800,'Corrientes');
GO


/* =========================================================
   METODOS DE PAGO
   ========================================================= */

INSERT INTO Metodo_pago (nombre_metodo)
VALUES
('Efectivo'),
('Transferencia bancaria'),
('Tarjeta de debito'),
('Tarjeta de credito'),
('Mercado Pago'),
('QR bancario'),
('Cuenta corriente'),
('Deposito bancario');
GO


/* =========================================================
   PROVEEDORES
   ========================================================= */

INSERT INTO Proveedor
    (
        cuit_proveedor,
        nombre_proveedor,
        telefono_proveedor
    )
VALUES
('20123456789','Distribuidora Litoral','3794223344'),
('30987654321','Importaciones Norte','3794556677'),
('30700111222','Electro Mayorista','3624221100'),
('30666555444','Ferreteria Central','3624554400'),
('27222333444','Iluminacion NEA','3794334400'),
('20333444555','Seguridad Total','3794778800'),
('30777888999','Hogar Mayorista','3624889900'),
('30666111222','Tecnologia Corrientes','3794112200');
GO


/* =========================================================
   CATEGORIAS
   ========================================================= */

INSERT INTO Categorias (nombre_categoria)
VALUES
('Seguridad y Vigilancia'),
('Herramientas'),
('Iluminacion LED'),
('Electronica'),
('Hogar'),
('Ferreteria'),
('Accesorios'),
('Conectividad');
GO


/* =========================================================
   PRODUCTOS
   ========================================================= */

INSERT INTO Producto
    (
        descripcion_producto,
        stock_actual,
        precio_lista,
        precio_costo_referencia,
        id_categoria
    )
VALUES
('Camara IP Wifi Domo Exterior',15,45000.00,32000.00,1),
('Cortadora Profesional V9',8,38500.00,27000.00,2),
('Reflector LED Solar 100W',30,22000.00,15000.00,3),
('Tablet 10 pulgadas',12,185000.00,142000.00,4),
('Secaplatos Acero',20,28000.00,19000.00,5),
('Taladro Percutor 650W',10,76000.00,56000.00,6),
('Cable HDMI 2 metros',40,8500.00,5200.00,7),
('Router WiFi AC1200',18,54000.00,39000.00,8);
GO


/* =========================================================
   COMPRAS
   ========================================================= */

INSERT INTO Compra
    (
        fecha_compra,
        hora_compra,
        estado_compra,
        id_proveedor
    )
VALUES
('2026-09-01','09:10','RECIBIDA',1),
('2026-09-03','11:25','RECIBIDA',2),
('2026-09-05','15:00','RECIBIDA',3),
('2026-09-08','10:40','RECIBIDA',4),
('2026-09-10','16:20','RECIBIDA',5),
('2026-09-12','12:05','RECIBIDA',6),
('2026-09-15','14:30','RECIBIDA',7),
('2026-09-18','17:10','PENDIENTE',8);
GO


/* =========================================================
   DETALLE DE COMPRAS
   ========================================================= */

INSERT INTO Detalle_compra
    (
        id_producto,
        id_compra,
        precio_unitario_compra,
        cantidad_compra
    )
VALUES
(1,1,32000.00,10),
(2,2,27000.00,8),
(3,3,15000.00,20),
(4,4,142000.00,10),
(5,5,19000.00,15),
(6,6,56000.00,8),
(7,7,5200.00,30),
(8,8,39000.00,15);
GO


/* =========================================================
   VENTAS
   ========================================================= */

INSERT INTO Venta
    (
        fecha_venta,
        hora_venta,
        estado_venta,
        dni_cliente
    )
VALUES
('2026-09-20','10:15','ENTREGADO','38456123'),
('2026-09-21','11:30','ENTREGADO','40123987'),
('2026-09-22','12:45','PAGADO','42555111'),
('2026-09-23','16:10','PREPARADO','36777222'),
('2026-09-24','17:25','ENTREGADO','44999333'),
('2026-09-25','09:50','PAGADO','39888444'),
('2026-09-26','14:20','ENTREGADO','43111555'),
('2026-09-27','18:05','PENDIENTE DE PAGO','35666677');
GO


/* =========================================================
   DETALLE DE VENTAS
   ========================================================= */

INSERT INTO Detalle_venta
    (
        id_producto,
        id_venta,
        precio_unitario,
        cantidad_venta
    )
VALUES
(1,1,45000.00,1),
(2,2,38500.00,1),
(3,3,22000.00,2),
(4,4,185000.00,1),
(5,5,28000.00,2),
(6,6,76000.00,1),
(7,7,8500.00,3),
(8,8,54000.00,1);
GO


/* =========================================================
   PAGOS

   La venta 1 utiliza dos medios de pago.
   La venta 8 queda pendiente y no posee pagos.
   ========================================================= */

INSERT INTO Pago
    (
        id_venta,
        id_metodo,
        fecha_pago,
        hora_pago,
        monto,
        referencia
    )
VALUES
(1,1,'2026-09-20','10:20',20000.00,'PAG-0001'),
(1,2,'2026-09-20','10:21',25000.00,'PAG-0002'),
(2,3,'2026-09-21','11:35',38500.00,'PAG-0003'),
(3,6,'2026-09-22','12:50',44000.00,'PAG-0004'),
(4,4,'2026-09-23','16:15',185000.00,'PAG-0005'),
(5,5,'2026-09-24','17:30',56000.00,'PAG-0006'),
(6,2,'2026-09-25','09:55',76000.00,'PAG-0007'),
(7,1,'2026-09-26','14:25',25500.00,'PAG-0008');
GO


/* =========================================================
   VALIDACION DE CANTIDAD DE REGISTROS
   ========================================================= */

SELECT 'Cliente' AS tabla, COUNT(*) AS registros
FROM Cliente

UNION ALL
SELECT 'Metodo_pago', COUNT(*)
FROM Metodo_pago

UNION ALL
SELECT 'Proveedor', COUNT(*)
FROM Proveedor

UNION ALL
SELECT 'Categorias', COUNT(*)
FROM Categorias

UNION ALL
SELECT 'Producto', COUNT(*)
FROM Producto

UNION ALL
SELECT 'Compra', COUNT(*)
FROM Compra

UNION ALL
SELECT 'Detalle_compra', COUNT(*)
FROM Detalle_compra

UNION ALL
SELECT 'Venta', COUNT(*)
FROM Venta

UNION ALL
SELECT 'Detalle_venta', COUNT(*)
FROM Detalle_venta

UNION ALL
SELECT 'Pago', COUNT(*)
FROM Pago;
GO


/* =========================================================
   VALIDACION DE VENTAS Y PAGOS
   ========================================================= */

WITH TotalesVenta AS (
    SELECT
        id_venta,
        SUM(precio_unitario * cantidad_venta) AS total_venta
    FROM Detalle_venta
    GROUP BY id_venta
),
TotalesPago AS (
    SELECT
        id_venta,
        SUM(monto) AS total_pagado
    FROM Pago
    GROUP BY id_venta
)
SELECT
    v.id_venta,
    v.estado_venta,
    tv.total_venta,
    COALESCE(tp.total_pagado, 0) AS total_pagado,
    tv.total_venta - COALESCE(tp.total_pagado, 0) AS saldo
FROM Venta v
INNER JOIN TotalesVenta tv
    ON tv.id_venta = v.id_venta
LEFT JOIN TotalesPago tp
    ON tp.id_venta = v.id_venta
ORDER BY v.id_venta;
GO
