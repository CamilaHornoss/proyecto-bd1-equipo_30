USE ProyectoTiendaOGA;
GO

CREATE OR ALTER PROCEDURE dbo.sp_RegistrarVentaCompleta
    @dni_cliente CHAR(8), @id_producto INT, @cantidad INT, @id_venta INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    SET @id_venta=NULL;
    IF @cantidad<=0 THROW 50100, 'La cantidad debe ser mayor que cero.', 1;
    BEGIN TRY
        BEGIN TRANSACTION;
        IF NOT EXISTS (SELECT 1 FROM dbo.Cliente WHERE dni_cliente=@dni_cliente)
            THROW 50101, 'El cliente indicado no existe.', 1;
        DECLARE @stock_actual INT, @precio_unitario DECIMAL(12,2);
        SELECT @stock_actual=stock_actual, @precio_unitario=precio_lista
        FROM dbo.Producto WITH (UPDLOCK,HOLDLOCK) WHERE id_producto=@id_producto;
        IF @stock_actual IS NULL THROW 50102, 'El producto indicado no existe.', 1;
        IF @stock_actual<@cantidad THROW 50103, 'Stock insuficiente para registrar la venta.', 1;
        INSERT INTO dbo.Venta(fecha_venta,hora_venta,estado_venta,dni_cliente)
        VALUES(CAST(GETDATE() AS DATE),CAST(GETDATE() AS TIME(0)),'PENDIENTE DE PAGO',@dni_cliente);
        SET @id_venta=CAST(SCOPE_IDENTITY() AS INT);
        INSERT INTO dbo.Detalle_venta(id_producto,id_venta,precio_unitario,cantidad_venta)
        VALUES(@id_producto,@id_venta,@precio_unitario,@cantidad);
        UPDATE dbo.Producto SET stock_actual=stock_actual-@cantidad WHERE id_producto=@id_producto;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT>0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO

DECLARE @dni CHAR(8)=(SELECT TOP 1 dni_cliente FROM dbo.Cliente ORDER BY dni_cliente);
DECLARE @prod INT=(SELECT TOP 1 id_producto FROM dbo.Producto WHERE stock_actual>0 ORDER BY id_producto);
DECLARE @venta INT;
EXEC dbo.sp_RegistrarVentaCompleta @dni,@prod,1,@venta OUTPUT;
SELECT * FROM dbo.Venta WHERE id_venta=@venta;
SELECT * FROM dbo.Detalle_venta WHERE id_venta=@venta;
GO

BEGIN TRY
    DECLARE @venta_error INT;
    EXEC dbo.sp_RegistrarVentaCompleta @dni,@prod,1000000,@venta_error OUTPUT;
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() AS numero_error, ERROR_MESSAGE() AS mensaje_error;
END CATCH;
GO
