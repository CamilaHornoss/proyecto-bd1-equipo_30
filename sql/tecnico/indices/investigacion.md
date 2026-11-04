# Optimización de consultas mediante índices

## 1. Definición y objetivo

Un índice permite localizar datos de manera más eficiente y reducir lecturas y tiempos de ejecución.

## 2. Ventajas y aplicaciones

- Menor cantidad de lecturas lógicas.
- Menor tiempo de respuesta.
- Posibilidad de `Index Seek`.
- Mejor rendimiento en filtros por fecha.

## 3. Implementación

Se crea `VentaHistorica` con 1.000.000 de registros y se comparan tres escenarios: sin índice, índice clustered e índice de cobertura.

## 4. Caso aplicado

Se analiza una consulta histórica de ventas por rango de fechas.

## 5. Demostración y resultados

Se compara el plan de ejecución y las estadísticas de IO y tiempo.
