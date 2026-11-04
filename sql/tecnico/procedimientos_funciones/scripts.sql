USE ProyectoTiendaOGA;
GO

CREATE OR ALTER PROCEDURE dbo.sp_InsertarProducto
    @descripcion_producto VARCHAR(100),
    @stock_actual INT,
    @precio_lista DECIMAL(12,2),
    @precio_costo_referencia DECIMAL(12,2) = NULL,
    @id_categoria INT
AS
BEGIN
    SET NOCOUNT ON;
    IF @stock_actual < 0 THROW 50001, 'El stock no puede ser negativo.', 1;
    IF @precio_lista <= 0 THROW 50002, 'El precio de lista debe ser mayor que cero.', 1;
    IF NOT EXISTS (SELECT 1 FROM dbo.Categorias WHERE id_categoria=@id_categoria)
        THROW 50004, 'La categoria indicada no existe.', 1;
    INSERT INTO dbo.Producto(descripcion_producto,stock_actual,precio_lista,precio_costo_referencia,id_categoria)
    VALUES(@descripcion_producto,@stock_actual,@precio_lista,@precio_costo_referencia,@id_categoria);
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS id_producto_creado;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_ModificarProducto
    @id_producto INT, @descripcion_producto VARCHAR(100), @stock_actual INT,
    @precio_lista DECIMAL(12,2), @precio_costo_referencia DECIMAL(12,2)=NULL, @id_categoria INT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM dbo.Producto WHERE id_producto=@id_producto)
        THROW 50006, 'El producto indicado no existe.', 1;
    UPDATE dbo.Producto
    SET descripcion_producto=@descripcion_producto, stock_actual=@stock_actual, precio_lista=@precio_lista,
        precio_costo_referencia=@precio_costo_referencia, id_categoria=@id_categoria
    WHERE id_producto=@id_producto;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_EliminarProducto @id_producto INT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM dbo.Detalle_venta WHERE id_producto=@id_producto)
       OR EXISTS (SELECT 1 FROM dbo.Detalle_compra WHERE id_producto=@id_producto)
        THROW 50013, 'No se puede eliminar un producto utilizado en compras o ventas.', 1;
    DELETE FROM dbo.Producto WHERE id_producto=@id_producto;
END;
GO

CREATE OR ALTER FUNCTION dbo.fn_CalcularImporteVenta(@id_venta INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @total DECIMAL(18,2);
    SELECT @total=COALESCE(SUM(precio_unitario*cantidad_venta),0) FROM dbo.Detalle_venta WHERE id_venta=@id_venta;
    RETURN COALESCE(@total,0);
END;
GO

CREATE OR ALTER FUNCTION dbo.fn_CalcularTotalComprasCliente(@dni_cliente CHAR(8))
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @total DECIMAL(18,2);
    SELECT @total=COALESCE(SUM(dv.precio_unitario*dv.cantidad_venta),0)
    FROM dbo.Venta v INNER JOIN dbo.Detalle_venta dv ON dv.id_venta=v.id_venta
    WHERE v.dni_cliente=@dni_cliente AND v.estado_venta IN ('PAGADO','PREPARADO','ENTREGADO');
    RETURN COALESCE(@total,0);
END;
GO

CREATE OR ALTER FUNCTION dbo.fn_CalcularDescuento(@dni_cliente CHAR(8))
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @total DECIMAL(18,2)=dbo.fn_CalcularTotalComprasCliente(@dni_cliente);
    RETURN CASE WHEN @total>500000 THEN 0.10 WHEN @total>200000 THEN 0.05 ELSE 0.00 END;
END;
GO

SELECT v.id_venta, dbo.fn_CalcularImporteVenta(v.id_venta) AS importe_venta FROM dbo.Venta v ORDER BY v.id_venta;
SELECT c.dni_cliente, dbo.fn_CalcularTotalComprasCliente(c.dni_cliente) AS total_compras, dbo.fn_CalcularDescuento(c.dni_cliente) AS descuento FROM dbo.Cliente c;
GO
