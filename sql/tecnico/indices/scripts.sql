USE ProyectoTiendaOGA;
GO
DROP TABLE IF EXISTS dbo.VentaHistorica;
GO
CREATE TABLE dbo.VentaHistorica(
 id_venta BIGINT IDENTITY(1,1) NOT NULL, fecha_venta DATE NOT NULL, id_producto INT NOT NULL, cantidad INT NOT NULL, importe DECIMAL(12,2) NOT NULL);
GO
WITH E1(n) AS (SELECT n FROM (VALUES(1),(1),(1),(1),(1),(1),(1),(1),(1),(1))v(n)),
E2(n) AS (SELECT 1 FROM E1 a CROSS JOIN E1 b),
E4(n) AS (SELECT 1 FROM E2 a CROSS JOIN E2 b),
E6(n) AS (SELECT TOP(1000000) ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) FROM E4 a CROSS JOIN E2 b)
INSERT INTO dbo.VentaHistorica(fecha_venta,id_producto,cantidad,importe)
SELECT DATEADD(DAY,(n-1)%1825,CAST('2020-01-01' AS DATE)),((n-1)%8)+1,((n-1)%5)+1,CAST(1000+((n-1)%10000) AS DECIMAL(12,2)) FROM E6;
GO
SELECT COUNT(*) AS cantidad_registros FROM dbo.VentaHistorica;
GO
SET STATISTICS TIME ON; SET STATISTICS IO ON;
GO
SELECT id_venta,fecha_venta,id_producto,cantidad,importe FROM dbo.VentaHistorica WHERE fecha_venta BETWEEN '2023-01-01' AND '2023-03-31';
GO
CREATE CLUSTERED INDEX IX_VentaHistorica_Fecha ON dbo.VentaHistorica(fecha_venta);
GO
SELECT id_venta,fecha_venta,id_producto,cantidad,importe FROM dbo.VentaHistorica WHERE fecha_venta BETWEEN '2023-01-01' AND '2023-03-31';
GO
DROP INDEX IX_VentaHistorica_Fecha ON dbo.VentaHistorica;
CREATE NONCLUSTERED INDEX IX_VentaHistorica_Fecha_Cobertura ON dbo.VentaHistorica(fecha_venta) INCLUDE(id_venta,id_producto,cantidad,importe);
GO
SELECT fecha_venta,id_venta,id_producto,cantidad,importe FROM dbo.VentaHistorica WHERE fecha_venta BETWEEN '2023-01-01' AND '2023-03-31';
GO
SET STATISTICS TIME OFF; SET STATISTICS IO OFF;
GO
