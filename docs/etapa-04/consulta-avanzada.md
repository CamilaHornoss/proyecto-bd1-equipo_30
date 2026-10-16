DOCUMENTACION TECNICA: CONSULTA AVANZADA

PROYECTO: Tienda OGA
MODULO: Consultas SQL
ARCHIVO ASOCIADO: sql/consultas/consulta_avanzada.sql

---
1. DESCRIPCION
Esta consulta responde al caso de uso CU-03. Constituye un analisis analitico complejo que segmenta a los clientes de mayor impacto financiero combinando agregaciones, agrupamientos, filtros sobre funciones de grupo y subconsultas correlacionadas.
2. REGLA DE NEGOCIO RESUELTA
Permite conocer cuales clientes individuales tienen un consumo historico superior al promedio global de facturacion por comprador en Tienda OGA, con el fin de disenar campanas de fidelizacion o bonificaciones comerciales directas.
3. CARACTERISTICAS TECNICAS DESTACADAS
- Agrupamiento multiple: Agrupa por dni_cliente, nombre, apellido y localidad para consolidar la informacion demografica del cliente.
- Clausula HAVING con Subconsulta: A diferencia de un WHERE que filtra registros individuales, el HAVING filtra grupos consolidados basandose en el resultado dinamico devuelto por una subconsulta escalar interna.
- Subconsulta derivada: La subconsulta interna calcula en memoria la suma de compras por cada cliente y obtiene el promedio general (AVG) de toda la base de datos de manera automatica, sin valores hardcodeados en el codigo.
- Ordenamiento: Se presentan los clientes con mayor volumen de compra en primer lugar mediante ORDER BY total_gastado DESC.