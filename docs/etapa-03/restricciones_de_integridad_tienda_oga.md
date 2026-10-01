# RESTRICCIONES DE INTEGRIDAD - PROYECTO TIENDA OGA

## DEFINICION CONCEPTUAL
Las restricciones de integridad son reglas de negocio y directivas lógicas definidas en el esquema de una base de datos relacional. Su propósito fundamental es garantizar que los datos almacenados sean correctos, consistentes, válidos y confiables a lo largo de todo el ciclo de vida del sistema, impidiendo el registro de datos corruptos o contradictorios frente a operaciones de inserción (`INSERT`), modificación (`UPDATE`) o eliminación (`DELETE`).

---

## CLASIFICACION DE RESTRICCIONES EN EL MODELO RELACIONAL

### A. INTEGRIDAD DE ENTIDAD
Establece que cada registro o fila debe ser identificable de forma unívoca dentro de una tabla.

* **Regla principal:** Ningún atributo que forme parte de una Clave Primaria (`PRIMARY KEY`) puede admitir valores nulos (`NULL`) ni repetidos.

**Implementación en el proyecto:**
* **`Cliente` (`dni_cliente`):** Identifica de forma única a cada cliente mediante su documento.
* **`Metodo_pago` (`id_metodo`):** Identificador numérico secuencial autoincremental mediante `IDENTITY(1,1)`.
* **`Proveedor` (`id_proveedor`):** Clave primaria autoincremental.
* **`Categorias` (`id_categoria`):** Clave primaria autoincremental.
* **`Producto` (`id_producto`):** Clave primaria autoincremental.
* **`Venta` (`id_venta`):** Identificador único autoincremental de la cabecera de venta.
* **`Compra` (`id_compra`):** Identificador único autoincremental de la orden de compra.

---

### B. INTEGRIDAD DE DOMINIO
Asegura que los valores asignados a una columna pertenezcan a un conjunto de valores admisibles según su tipo de dato, formato, obligatoriedad o rango lógico.

* **Restricción `NOT NULL`:** Obliga la carga de datos indispensables para el negocio en tablas como:
  * `Cliente` (`nombre`, `apellido`, `calle`, `altura`, `localidad`)
  * `Venta` (`fecha_venta`, `hora_venta`, `estado_venta`)
  * `Compra` (`fecha_compra`, `hora_compra`, `estado_compra`)

* **Restricción `CHECK`:** Valida reglas aritméticas y condiciones lógicas sobre montos y cantidades:
  * `Detalle_venta`: `precio_unitario > 0` y `cantidad_venta > 0`.
  * `Detalle_compra`: `precio_compra > 0` y `cantidad_compra > 0`.
  * `Pago`: `monto > 0`.

* **Restricción `UNIQUE` (Claves Alternativas):** Evita la duplicación de atributos identificatorios secundarios que no forman parte de la clave primaria:
  * `Cliente` (`telefono`): Impide que dos clientes compartan la misma línea de contacto.
  * `Proveedor` (`cuit_proveedor`): Garantiza la unicidad tributaria por cada proveedor registrado.
  * `Producto` (`descripcion_producto`): Asegura que no se creen dos productos con la misma descripción.

---

### C. INTEGRIDAD REFERENCIAL
Garantiza la coherencia lógica y las relaciones válidas entre tablas vinculadas. Establece que cualquier valor cargado en una Clave Foránea (`FOREIGN KEY`) debe existir previamente como Clave Primaria en la tabla padre referenciada.

**Implementación en el proyecto:**
* `fk_Venta_dni_cliente`: La tabla `Venta` exige que `dni_cliente` exista previamente en la tabla `Cliente`.
* `fk_Compra_cuit_proveedor`: La tabla `Compra` exige que `id_proveedor` exista previamente en la tabla `Proveedor`.
* `fk_Producto_id_categoria`: La tabla `Producto` exige que `id_categoria` exista previamente en la tabla `Categorias`.
* `fk_Detalle_venta_id_producto`: Asocia cada renglón vendido a un producto existente.
* `fk_Detalle_venta_id_compra`: Asocia cada renglón vendido a una cabecera de venta existente.
* `fk_Detalle_Compra_id_producto`: Asocia cada renglón comprado a un producto existente.
* `fk_Detalle_Compra_id_compra`: Asocia cada renglón comprado a una cabecera de compra existente.
* `fk_Pago_id_venta`: Asocia el comprobante de cobro a una venta válida.
* `fk_Pago_id_metodo`: Asocia el cobro a un medio de pago habilitado.

---

### D. INTEGRIDAD EN TABLAS ASOCIATIVAS (CLAVES COMPUESTAS)
Garantiza la consistencia en tablas intermedias que resuelven relaciones de muchos a muchos:

* **`Detalle_venta`:** Clave primaria compuesta por `(id_producto, id_venta)`. Evita registrar dos veces el mismo producto en una misma venta.
* **`Detalle_compra`:** Clave primaria compuesta por `(id_producto, id_compra)`. Evita registrar dos veces el mismo producto dentro de una misma orden de compra.
* **`Pago`:** Clave primaria compuesta por `(id_venta, id_metodo)`. Identifica el pago vinculado a la venta y al método financiero utilizado.

---

## RESUMEN DE RESTRICCIONES POR TABLA

### Tabla: `Cliente`
* `dni_cliente`: `PRIMARY KEY`, `NOT NULL`
* `telefono`: `UNIQUE`, `NOT NULL`
* `nombre`, `apellido`, `calle`, `altura`, `localidad`: `NOT NULL`

### Tabla: `Metodo_pago`
* `id_metodo`: `PRIMARY KEY`, `IDENTITY(1,1)`
* `nombre_metodo`: `NOT NULL`

### Tabla: `Proveedor`
* `id_proveedor`: `PRIMARY KEY`, `IDENTITY(1,1)`
* `cuit_proveedor`: `UNIQUE`, `NOT NULL`
* `nombre_proveedor`, `telefono_proveedor`: `NOT NULL`

### Tabla: `Categorias`
* `id_categoria`: `PRIMARY KEY`, `IDENTITY(1,1)`
* `nombre_categoria`: `NOT NULL`

### Tabla: `Producto`
* `id_producto`: `PRIMARY KEY`, `IDENTITY(1,1)`
* `descripcion_producto`: `UNIQUE`, `NOT NULL`
* `precio_lista`: `NOT NULL`
* `id_categoria`: `FOREIGN KEY` referenciando a `Categorias(id_categoria)`

### Tabla: `Venta`
* `id_venta`: `PRIMARY KEY`, `IDENTITY(1,1)`
* `fecha_venta`, `hora_venta`, `estado_venta`: `NOT NULL`
* `dni_cliente`: `FOREIGN KEY` (`fk_Venta_dni_cliente`) referenciando a `Cliente(dni_cliente)`

### Tabla: `Compra`
* `id_compra`: `PRIMARY KEY`, `IDENTITY(1,1)`
* `fecha_compra`, `hora_compra`, `estado_compra`: `NOT NULL`
* `id_proveedor`: `FOREIGN KEY` (`fk_Compra_cuit_proveedor`) referenciando a `Proveedor(id_proveedor)`

### Tabla: `Detalle_compra`
* `(id_producto, id_compra)`: `PRIMARY KEY` (`pk_Detalle_compra`)
* `id_producto`: `FOREIGN KEY` referenciando a `Producto(id_producto)`
* `id_compra`: `FOREIGN KEY` referenciando a `Compra(id_compra)`
* `precio_compra`: `CHECK (precio_compra > 0)`, `NOT NULL`
* `cantidad_compra`: `CHECK (cantidad_compra > 0)`, `NOT NULL`

### Tabla: `Detalle_venta`
* `(id_producto, id_venta)`: `PRIMARY KEY` (`pk_Detalle_venta`)
* `id_producto`: `FOREIGN KEY` referenciando a `Producto(id_producto)`
* `id_venta`: `FOREIGN KEY` referenciando a `Venta(id_venta)`
* `precio_unitario`: `CHECK (precio_unitario > 0)`, `NOT NULL`
* `cantidad_venta`: `CHECK (cantidad_venta > 0)`, `NOT NULL`

### Tabla: `Pago`
* `(id_venta, id_metodo)`: `PRIMARY KEY` (`pk_Pago`)
* `id_venta`: `FOREIGN KEY` referenciando a `Venta(id_venta)`
* `id_metodo`: `FOREIGN KEY` referenciando a `Metodo_pago(id_metodo)`
* `monto`: `CHECK (monto > 0)`, `NOT NULL`