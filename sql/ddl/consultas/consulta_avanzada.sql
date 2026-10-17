USE ProyectoTiendaOGA;
GO

-- CONSULTA AVANZADA: ANALISIS DE RENDIMIENTO COMERCIAL Y COMPARATIVA
-- Proposito: Combina agrupamientos, filtros HAVING, subconsultas en el WHERE
-- y analisis de rentabilidad/margen entre precio de compra y venta.

-- Identifica clientes cuyo gasto acumulado supera el promedio de ventas del local,
-- mostrando ademas la cantidad de operaciones y el ticket maximo alcanzado.
SELECT 
    cli.dni_cliente,
    CONCAT(cli.nombre, ' ', cli.apellido) AS cliente,
    cli.localidad,
    COUNT(DISTINCT v.id_venta) AS total_compras,
    SUM(dv.cantidad_venta * dv.precio_unitario) AS total_gastado,
    MAX(dv.cantidad_venta * dv.precio_unitario) AS compra_individual_maxima
FROM Cliente cli
INNER JOIN Venta v ON cli.dni_cliente = v.dni_cliente
INNER JOIN Detalle_venta dv ON v.id_venta = dv.id_venta
WHERE v.estado_venta = 1
GROUP BY cli.dni_cliente, cli.nombre, cli.apellido, cli.localidad
HAVING SUM(dv.cantidad_venta * dv.precio_unitario) > (
    -- Subconsulta: Obtiene el gasto promedio por cliente en el sistema
    SELECT AVG(total_por_cliente)
    FROM (
        SELECT SUM(sub_dv.cantidad_venta * sub_dv.precio_unitario) AS total_por_cliente
        FROM Venta sub_v
        INNER JOIN Detalle_venta sub_dv ON sub_v.id_venta = sub_dv.id_venta
        WHERE sub_v.estado_venta = 1
        GROUP BY sub_v.dni_cliente
    ) AS promedios
)
ORDER BY total_gastado DESC;
GO