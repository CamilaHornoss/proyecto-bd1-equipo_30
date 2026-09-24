# Decisiones de Diseño

## Esquema relacional propuesto

El esquema relacional propuesto está compuesto por **8 tablas** y se encuentra normalizado hasta la **Tercera Forma Normal (3FN)**.

### CLIENTE

```text
CLIENTE (
    dni_cuit,
    nombre,
    apellido,
    telefono,
    direccion,
    localidad
)
```

### CATEGORIA

```text
CATEGORIA (
    id_categoria,
    nombre_categoria
)
```

### MARCA

```text
MARCA (
    id_marca,
    nombre_marca
)
```

### PRODUCTO

```text
PRODUCTO (
    cod_producto,
    descripcion,
    precio_lista,
    stock_actual,
    stock_minimo,
    id_categoria,
    id_marca
)
```

### VENTA

```text
VENTA (
    id_venta,
    fecha_hora,
    estado_pedido,
    dni_cliente
)
```

### DETALLE_VENTA

```text
DETALLE_VENTA (
    id_venta,
    cod_producto,
    cantidad,
    precio_unitario_historico
)
```

### METODO_PAGO

```text
METODO_PAGO (
    id_metodo,
    nombre_metodo
)
```

### PAGO_VENTA

```text
PAGO_VENTA (
    id_pago,
    fecha_pago,
    monto,
    nro_referencia,
    id_venta,
    id_metodo
)
```

## Justificación del cumplimiento de las Formas Normales

### Primera Forma Normal (1FN)

Cada celda almacena un único valor atómico. No existen listas de productos ni datos agrupados en columnas.

Además, todas las tablas poseen una clave primaria definida.

### Segunda Forma Normal (2FN)

No existen dependencias parciales.

En `DETALLE_VENTA`, cuya clave primaria es compuesta por `id_venta` y `cod_producto`, los atributos `cantidad` y `precio_unitario_historico` dependen de la combinación completa de la venta y el producto.

### Tercera Forma Normal (3FN)

No existen dependencias transitivas.

El nombre de la categoría y el nombre de la marca se separaron en sus propias tablas (`CATEGORIA` y `MARCA`), evitando redundancias en la tabla `PRODUCTO`.

Del mismo modo, los métodos de pago se separaron en `METODO_PAGO`, evitando almacenar repetidamente la descripción del método en cada pago.
