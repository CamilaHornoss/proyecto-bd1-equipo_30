# Decisiones de Diseño

## Esquema relacional propuesto

El esquema relacional propuesto está compuesto por **10 tablas** y se encuentra normalizado hasta la **Tercera Forma Normal (3FN)**.

### CLIENTE
```text
CLIENTE (
    dni_cliente (PK),
    nombre_cliente,
    apellido_cliente,
    telefono_cliente,
    calle,
    altura,
    localidad
)
```

### CATEGORIA

```text
CATEGORIAS (
    id_categoria (PK),
    nombre_categoria
)
```

### PRODUCTO

```text
PRODUCTO (
    id_producto (PK),
    descripcion_producto,
    stock_actual,
    precio_lista,
    precio_costo_referencia,
    id_categoria (FK)
)
```

### PROVEEDOR

```text
PROVEEDOR (
    id_proveedor (PK),
    cuit_proveedor,
    nombre_proveedor,
    telefono_proveedor
)
```

### CROMPRA

```text
COMPRA (
    id_compra (PK),
    fecha_compra,
    hora_compra,
    estado_compra,
    id_proveedor (FK)
)
```

### DETALLE_COMPRA

```text
DETALLE_COMPRA (
    id_producto (PK/FK),
    id_compra (PK/FK),
    precio_unitario_compra,
    cantidad_compra
)
```

### VENTA

```text
VENTA (
    id_venta (PK),
    fecha_venta,
    hora_venta,
    estado_venta,
    dni_cliente (FK)
)
```

### DETALLE_VENTA

```text
DETALLE_VENTA (
    id_producto (PK/FK),
    id_venta (PK/FK),
    precio_unitario,
    cantidad_venta
)
```

### METODO_PAGO

```text
METODO_PAGO (
    id_metodo (PK),
    nombre_metodo
)
```

### PAGO_VENTA

```text
PAGO_VENTA (
    id_pago (PK),
    id_venta (FK),
    id_metodo (FK),
    fecha_pago,
    hora_pago,
    monto,
    referencia
)
```

## Justificación del cumplimiento de las Formas Normales

### Primera Forma Normal (1FN)

Cada celda almacena un único valor atómico. No existen listas de productos ni datos agrupados en columnas. Todas las tablas poseen una clave primaria definida.

### Segunda Forma Normal (2FN)

No existen dependencias parciales.

En las tablas de detalle `DETALLE_VENTA` y `DETALLE_COMPRA`, las claves primarias son compuestas y todos los atributos no clave dependen funcionalmente de la combinación completa de la operación y el producto.

### Tercera Forma Normal (3FN)

No existen dependencias transitivas.

El nombre de la categoría se separo en su propia tabla `CATEGORIA`, evitando redundancias en la tabla `PRODUCTO`.

Del mismo modo, los datos de proveedores se aislaron en PROVEEDOR y los métodos de pago en METODO_PAGO.
