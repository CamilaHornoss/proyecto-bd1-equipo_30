USE ProyectoTiendaOGA;
GO

IF OBJECT_ID('dbo.Auditoria_Producto','U') IS NULL
BEGIN
CREATE TABLE dbo.Auditoria_Producto(
 id_auditoria BIGINT IDENTITY(1,1) PRIMARY KEY,
 id_producto INT NOT NULL, tipo_operacion VARCHAR(10) NOT NULL, fecha_hora DATETIME2(0) NOT NULL, usuario_bd SYSNAME NOT NULL,
 descripcion_anterior VARCHAR(100) NULL, descripcion_nueva VARCHAR(100) NULL,
 precio_anterior DECIMAL(12,2) NULL, precio_nuevo DECIMAL(12,2) NULL,
 stock_anterior INT NULL, stock_nuevo INT NULL);
END;
GO

CREATE OR ALTER TRIGGER dbo.tr_Auditoria_Producto
ON dbo.Producto AFTER INSERT,UPDATE,DELETE
AS
BEGIN
 SET NOCOUNT ON;
 INSERT INTO dbo.Auditoria_Producto(id_producto,tipo_operacion,fecha_hora,usuario_bd,descripcion_anterior,descripcion_nueva,precio_anterior,precio_nuevo,stock_anterior,stock_nuevo)
 SELECT COALESCE(i.id_producto,d.id_producto),
        CASE WHEN d.id_producto IS NULL THEN 'INSERT' WHEN i.id_producto IS NULL THEN 'DELETE' ELSE 'UPDATE' END,
        SYSDATETIME(),USER_NAME(),d.descripcion_producto,i.descripcion_producto,d.precio_lista,i.precio_lista,d.stock_actual,i.stock_actual
 FROM inserted i FULL OUTER JOIN deleted d ON d.id_producto=i.id_producto;
END;
GO

DECLARE @p INT=(SELECT TOP 1 id_producto FROM dbo.Producto ORDER BY id_producto);
UPDATE dbo.Producto SET precio_lista=precio_lista+1000 WHERE id_producto=@p;
SELECT TOP 5 * FROM dbo.Auditoria_Producto WHERE id_producto=@p ORDER BY id_auditoria DESC;
GO
