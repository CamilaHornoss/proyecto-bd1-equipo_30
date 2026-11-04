# Etapa III — Implementación física

## Objetivo

La Etapa III transforma el modelo relacional definido en la Etapa II en una implementación física ejecutable en Microsoft SQL Server.

La fuente de verdad utilizada para esta implementación es el **modelo relacional y los diagramas actualizados de Etapa II** del repositorio del equipo. Se implementan las siguientes diez relaciones:

1. `Categorias`
2. `Producto`
3. `Proveedor`
4. `Compra`
5. `Detalle_compra`
6. `Cliente`
7. `Venta`
8. `Detalle_venta`
9. `Metodo_pago`
10. `Pago`

## Correspondencia con Etapa II

La implementación respeta los elementos visibles en el DER y en el modelo relacional actualizado:

- `Producto` incluye `precio_costo_referencia`.
- `Detalle_compra` conserva el precio histórico en `precio_unitario_compra`.
- `Detalle_venta` conserva el precio histórico en `precio_unitario`.
- `Pago` posee `id_pago` como clave primaria simple (autoincremental), permitiendo relacionar de forma limpia cada cobro con una `Venta` y un `Metodo_pago`.
- `Pago` incluye `fecha_pago`, `hora_pago`, `monto` y `referencia`.
- `Cliente` utiliza `nombre_cliente`, `apellido_cliente` y `telefono_cliente`.
- Las tablas de detalle utilizan claves primarias compuestas.

## Archivos

### DDL
`sql/ddl/ddl.sql`

El script:

- crea la base `ProyectoTiendaOGA` si no existe;
- recrea las diez tablas en un orden compatible con las claves foráneas;
- define PK y FK;
- aplica `NOT NULL`, `UNIQUE` y `CHECK`;
- utiliza tipos `DATE`, `TIME`, `DECIMAL`, `CHAR` y `VARCHAR` según el dominio;
- establece `ON UPDATE NO ACTION` y `ON DELETE NO ACTION` para preservar la integridad referencial.

### DML
`sql/dml/datos_prueba.sql`

Se cargan **8 registros coherentes por cada tabla**, cumpliendo el rango de 8–10 solicitado para la etapa.

Los datos permiten verificar:

- compras y ventas válidas;
- precios históricos en los detalles;
- una venta abonada mediante dos métodos distintos (registrando múltiples filas en `Pago` mediante su clave simple `id_pago`);
- una venta pendiente sin pagos;
- correspondencia entre importes vendidos y pagos registrados.

## Decisiones de implementación

### Identificadores numéricos
Los identificadores internos `id_categoria`, `id_producto`, `id_proveedor`, `id_compra`, `id_venta`, `id_metodo` e `id_pago` se implementan mediante `IDENTITY(1,1)`.

### DNI y CUIT
Se utilizan tipos de texto (`CHAR`) porque son identificadores y no magnitudes sobre las que se realicen operaciones aritméticas.

### Fechas y horas
Se implementan por separado mediante `DATE` y `TIME(0)`, respetando la decisión de diseño de Etapa II.

### Precio de costo de referencia
`precio_costo_referencia` admite `NULL` cuando aún no se dispone de un costo de referencia; si se informa, debe ser mayor que cero.

### Estados
Los estados se almacenan como texto y se restringen mediante `CHECK` para evitar valores arbitrarios.

## Resultado esperado

Al ejecutar primero `sql/ddl/ddl.sql` y luego `sql/dml/datos_prueba.sql`, la base debe quedar creada con las diez relaciones del modelo y con datos suficientes para las consultas de Etapa IV y los temas técnicos de Etapa V.
