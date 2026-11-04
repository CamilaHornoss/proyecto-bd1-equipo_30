# Procedimientos y funciones almacenadas

## 1. Definición y objetivo

Los procedimientos almacenados son programas T-SQL guardados dentro de la base de datos que pueden recibir parámetros y ejecutar varias sentencias. Las funciones almacenadas son rutinas que reciben parámetros y devuelven un valor o una tabla.

Su objetivo es centralizar lógica reutilizable dentro del motor, reducir código repetido y mantener las reglas de negocio cerca de los datos.

## 2. Ventajas y aplicaciones

- Reutilización de lógica de negocio.
- Menor duplicación de código.
- Mayor mantenibilidad.
- Validaciones centralizadas.
- Posibilidad de otorgar permiso de ejecución sin permitir acceso directo a las tablas.
- Cálculo consistente de importes, acumulados y descuentos.

## 3. Implementación en SQL Server Express

Se implementan los procedimientos `sp_InsertarProducto`, `sp_ModificarProducto` y `sp_EliminarProducto`, además de las funciones `fn_CalcularImporteVenta`, `fn_CalcularTotalComprasCliente` y `fn_CalcularDescuento`.

## 4. Caso aplicado a Tienda OGA

El catálogo necesita altas y modificaciones controladas, mientras que los importes históricos deben calcularse desde `Detalle_venta.precio_unitario` y no desde el precio vigente de `Producto`.

## 5. Demostración y resultados

El script incluye consultas de importes y descuentos y demuestra la ejecución de las rutinas sobre el modelo real del proyecto.
