USE ProyectoTiendaOGA;
GO
IF DATABASE_PRINCIPAL_ID('oga_lector') IS NULL CREATE USER oga_lector WITHOUT LOGIN;
IF DATABASE_PRINCIPAL_ID('oga_consulta_productos') IS NULL CREATE USER oga_consulta_productos WITHOUT LOGIN;
IF DATABASE_PRINCIPAL_ID('oga_sin_rol') IS NULL CREATE USER oga_sin_rol WITHOUT LOGIN;
IF DATABASE_PRINCIPAL_ID('rol_consulta_productos') IS NULL CREATE ROLE rol_consulta_productos;
GO
GRANT SELECT ON OBJECT::dbo.Venta TO oga_lector;
DENY INSERT,UPDATE,DELETE ON OBJECT::dbo.Venta TO oga_lector;
GRANT SELECT ON OBJECT::dbo.Producto TO rol_consulta_productos;
ALTER ROLE rol_consulta_productos ADD MEMBER oga_consulta_productos;
GO
EXECUTE AS USER='oga_consulta_productos';
SELECT TOP 5 * FROM dbo.Producto;
REVERT;
GO
BEGIN TRY
 EXECUTE AS USER='oga_sin_rol';
 SELECT TOP 1 * FROM dbo.Producto;
 REVERT;
END TRY
BEGIN CATCH
 IF USER_NAME()='oga_sin_rol' REVERT;
 SELECT ERROR_MESSAGE() AS resultado;
END CATCH;
GO
BEGIN TRY
 EXECUTE AS USER='oga_lector';
 INSERT INTO dbo.Venta(fecha_venta,hora_venta,estado_venta,dni_cliente)
 VALUES(CAST(GETDATE() AS DATE),CAST(GETDATE() AS TIME(0)),'PENDIENTE DE PAGO','38456123');
 REVERT;
END TRY
BEGIN CATCH
 IF USER_NAME()='oga_lector' REVERT;
 SELECT ERROR_MESSAGE() AS resultado;
END CATCH;
GO
