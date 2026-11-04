# Pruebas y validación — Etapa III

## Orden de ejecución

1. Ejecutar `sql/ddl/ddl.sql`.
2. Ejecutar `sql/dml/datos_prueba.sql`.
3. Verificar que cada tabla contenga entre 8 y 10 registros.
4. Revisar la consulta final de coherencia entre ventas y pagos.

## Validaciones esperadas

### Conteos

El DML debe devolver 8 registros para cada una de las diez tablas del modelo.

### Integridad de dominio

SQL Server debe rechazar operaciones como:

```sql
INSERT INTO Detalle_venta
    (id_producto, id_venta, precio_unitario, cantidad_venta)
VALUES
    (1, 1, -100, 1);
```

porque `precio_unitario` debe ser mayor que cero.

También debe rechazar:

```sql
UPDATE Producto
SET stock_actual = -1
WHERE id_producto = 1;
```

por la restricción de stock no negativo.

### Integridad referencial

Debe rechazarse un detalle que utilice un producto inexistente:

```sql
INSERT INTO Detalle_venta
    (id_producto, id_venta, precio_unitario, cantidad_venta)
VALUES
    (999999, 1, 1000, 1);
```

### Unicidad

Debe rechazarse un CUIT ya registrado:

```sql
INSERT INTO Proveedor
    (cuit_proveedor, nombre_proveedor, telefono_proveedor)
VALUES
    ('20123456789', 'Proveedor duplicado', '3624000000');
```

### Clave compuesta

Debe rechazarse un segundo renglón con el mismo producto y venta:

```sql
INSERT INTO Detalle_venta
    (id_producto, id_venta, precio_unitario, cantidad_venta)
VALUES
    (1, 1, 45000, 1);
```

### Pagos múltiples

La venta 1 posee dos filas en `Pago` con métodos diferentes. Esto demuestra que la PK simple `id_pago` permite registrar más de un pago para una misma venta.

### Coherencia de importes

La consulta final del DML compara:

- total calculado desde `Detalle_venta`;
- total registrado en `Pago`;
- saldo resultante.

Las ventas abonadas deben presentar saldo 0. La venta con estado `PENDIENTE DE PAGO` conserva un saldo pendiente y no posee pagos.

## Nota

Estas pruebas destructivas o deliberadamente inválidas se documentan aquí como casos de control. Para mantener limpio el conjunto de datos de prueba, no se incluyen automáticamente dentro de `datos_prueba.sql`.
