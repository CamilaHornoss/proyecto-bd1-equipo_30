# Manejo de transacciones

## 1. Definición y objetivo

Una transacción es una unidad lógica de trabajo cuyas operaciones deben confirmarse o deshacerse en conjunto. Garantiza atomicidad, consistencia, aislamiento y durabilidad.

## 2. Ventajas y aplicaciones

En Tienda OGA una venta afecta `Venta`, `Detalle_venta` y `Producto`. Una transacción evita ventas incompletas o descuentos de stock sin respaldo.

## 3. Implementación en SQL Server Express

Se implementa `sp_RegistrarVentaCompleta` con `BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`, `TRY...CATCH`, `XACT_ABORT ON` y control de stock.

## 4. Caso aplicado

El procedimiento valida cliente, producto y stock, registra la venta y su detalle y descuenta el stock.

## 5. Demostración y resultados

Se incluye una prueba correcta y otra con stock insuficiente para demostrar atomicidad.
