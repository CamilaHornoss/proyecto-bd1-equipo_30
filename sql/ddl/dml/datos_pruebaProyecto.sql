USE ProyectoTiendaOGA;
GO

-- 1. Tablas independientes (sin FKs)
INSERT INTO Cliente (dni_cliente, nombre_cliente, apellido_cliente, telefono_cliente, calle, altura, localidad)
VALUES 
    (38456123, 'Carlos', 'Gomez', '3794112233', 'Junin', 1240, 'Corrientes'),
    (40123987, 'Lucia', 'Fernandez', '3794998877', 'San Martin', 850, 'Resistencia');

INSERT INTO Metodo_pago (nombre_metodo)
VALUES 
    ('Efectivo'),
    ('Transferencia / QR'),
    ('Tarjeta de Credito');

INSERT INTO Proveedor (cuit_proveedor, nombre_proveedor, telefono_proveedor)
VALUES 
    (201234567, 'Distribuidora Litoral', '3794223344'),
    (309876543, 'Importaciones Norte', '3794556677');

INSERT INTO Categorias (nombre_categoria)
VALUES 
    ('Seguridad y Vigilancia'),
    ('Herramientas y Barberia'),
    ('Iluminacion LED');
GO

-- 2. Tablas de segundo nivel (dependen de las maestras)
INSERT INTO Producto (stock_actual, descripcion_producto, precio_lista, id_categoria)
VALUES 
    (15, 'Camara IP Wifi Domo Exterior', 45000.00, 1),
    (8,  'Cortadora WAER Profesional V9', 38500.00, 2),
    (30, 'Reflector LED Solar 100W', 22000.00, 3);

INSERT INTO Compra (fecha_compra, hora_compra, estado_compra, id_proveedor)
VALUES 
    ('2026-09-15', '10:30:00', 'CONCRETADA', 1),
    ('2026-09-20', '16:45:00', 'CONCRETADA', 2);

INSERT INTO Venta (fecha_venta, hora_venta, estado_venta, dni_cliente)
VALUES 
    ('2026-09-28', '11:15:00', 'CONCRETADA', '38456123'),
    ('2026-09-29', '18:30:00', 'CONCRETADA', '40123987');
GO

-- 3. Tablas transaccionales / intermedias (Detalles y Pagos)
INSERT INTO Detalle_compra (id_producto, id_compra, precio_unitario_compra, cantidad_compra)
VALUES 
    (1, 1, 32000.00, 10),
    (2, 1, 27000.00, 5),
    (3, 2, 15000.00, 20);

INSERT INTO Detalle_venta (id_producto, id_venta, precio_unitario, cantidad_venta)
VALUES 
    (1, 1, 45000.00, 1),
    (3, 1, 22000.00, 2),
    (2, 2, 38500.00, 1);

-- Pagos actualizados con fecha, hora y soporte para la PK simple id_pago
INSERT INTO Pago (id_venta, id_metodo, fecha_pago, hora_pago, monto)
VALUES 
    (1, 1, '2026-09-28', '11:20:00', 40000.00),
    (1, 2, '2026-09-28', '11:22:00', 49000.00), -- Venta 1 abonada con dos métodos distintos (Efectivo y QR)
    (2, 3, '2026-09-29', '18:35:00', 38500.00);
GO

-- Verificación de inserciones correctas
SELECT * FROM Cliente;
SELECT * FROM Producto;
SELECT * FROM Venta;
SELECT * FROM Detalle_venta;
SELECT * FROM Pago;
GO
