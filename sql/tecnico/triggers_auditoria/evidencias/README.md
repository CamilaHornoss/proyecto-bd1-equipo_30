# Evidencias — Triggers de auditoría

## Resultados obtenidos

Al modificar el precio de un producto, el trigger `tr_Auditoria_Producto` se ejecutó automáticamente.

La tabla `Auditoria_Producto` registró el producto modificado, el tipo de operación `UPDATE`, fecha y hora, usuario responsable, precio anterior, precio nuevo y valores de stock.

De esta manera se comprobó la trazabilidad automática de las modificaciones realizadas sobre los productos.
