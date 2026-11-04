# Evidencias — Optimización mediante índices

## Resultados obtenidos

Las pruebas se realizaron sobre la tabla técnica `VentaHistorica` con 1.000.000 de registros.

| Escenario | Resultado observado | Operación principal |
|---|---|---|
| Sin índice | Mayor cantidad de lecturas y mayor tiempo de ejecución | Table Scan |
| Índice clustered sobre fecha | Reducción de lecturas y tiempo de ejecución | Clustered Index Seek |
| Índice de cobertura | Menor costo entre los escenarios evaluados | Index Seek |

Los resultados obtenidos muestran que la incorporación de índices adecuados mejora el acceso a los datos y reduce el trabajo necesario para resolver consultas sobre grandes volúmenes de información.
