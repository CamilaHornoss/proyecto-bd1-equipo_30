USE ProyectoTiendaOGA;
GO

SELECT 
    v.id_venta AS numero_comprobante,
    v.fecha_venta,
    v.hora_venta,
    cli.dni_cliente,
    CONCAT(cli.nombre_cliente, ' ', cli.apellido_cliente) AS nombre_cliente,
    cli.telefono_cliente,
    CONCAT(cli.calle, ' ', cli.altura, ', ', cli.localidad) AS direccion_cliente,
    p.descripcion_producto,
    dv.cantidad_venta,
    dv.precio_unitario,
    -- Subtotal por cada linea/renglon:
    (dv.cantidad_venta * dv.precio_unitario) AS subtotal_linea,
    -- Total general acumulado de la venta (calculado sobre la misma transaccion):
    SUM(dv.cantidad_venta * dv.precio_unitario) OVER (PARTITION BY v.id_venta) AS total_acumulado_venta,
    -- Datos de pagos y medios de pago utilizados:
    mp.nombre_metodo AS metodo_pago,
    pa.monto AS monto_pagado,
    pa.fecha_pago,
    pa.referencia AS referencia_pago
FROM Venta v
INNER JOIN Cliente cli ON v.dni_cliente = cli.dni_cliente
INNER JOIN Detalle_venta dv ON v.id_venta = dv.id_venta
INNER JOIN Producto p ON dv.id_producto = p.id_producto
LEFT JOIN Pago pa ON v.id_venta = pa.id_venta
LEFT JOIN Metodo_pago mp ON pa.id_metodo = mp.id_metodo
WHERE v.id_venta = 1;
GO