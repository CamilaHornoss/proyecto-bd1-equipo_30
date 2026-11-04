# Evidencias — Transacciones

## Resultados obtenidos

La prueba con stock suficiente finalizó correctamente: se registró la venta, se insertó el detalle correspondiente y se descontó del producto la cantidad vendida.

En la prueba con una cantidad superior al stock disponible, SQL Server generó el mensaje `Stock insuficiente para registrar la venta.`

La operación fue revertida y no quedaron registros parciales en `Venta` ni en `Detalle_venta`. El stock del producto tampoco fue modificado.

Esto permitió comprobar el comportamiento atómico de la transacción.
