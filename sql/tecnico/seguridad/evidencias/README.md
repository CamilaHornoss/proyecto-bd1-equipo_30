# Evidencias — Seguridad

## Resultados obtenidos

El usuario perteneciente al rol `rol_consulta_productos` pudo consultar la tabla `Producto`.

El usuario sin dicho rol no pudo ejecutar la misma consulta.

El usuario `oga_lector` no tuvo permiso para realizar un `INSERT` directamente sobre la tabla `Venta`, pero pudo ejecutar el procedimiento almacenado autorizado.

Los resultados confirman la aplicación del principio de mínimo privilegio.
