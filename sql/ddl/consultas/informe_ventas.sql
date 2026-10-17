USE ProyectoTiendaOGA;
GO

SELECT 
    c.id_categoria,
    c.nombre_categoria,
    COUNT(DISTINCT v.id_venta) AS cantidad_ventas_realizadas,
    SUM(dv.cantidad_venta) AS unidades_totales_vendidas,
    SUM(dv.cantidad_venta * dv.precio_unitario) AS total_recaudado
FROM Detalle_venta dv
INNER JOIN Producto p ON dv.id_producto = p.id_producto
INNER JOIN Categorias c ON p.id_categoria = c.id_categoria
INNER JOIN Venta v ON dv.id_venta = v.id_venta
WHERE v.estado_venta = 1
  -- Rango de fechas requerido por la consigna:
  AND v.fecha_venta BETWEEN '2026-09-01' AND '2026-09-30'
GROUP BY c.id_categoria, c.nombre_categoria
ORDER BY total_recaudado DESC;
GO
