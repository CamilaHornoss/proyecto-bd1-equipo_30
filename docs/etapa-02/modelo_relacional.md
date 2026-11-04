# MODELO RELACIONAL DE DATOS



A continuación se detalla la especificación formal del esquema relacional obtenido a partir del diagrama, indicando claves primarias (PK), claves foráneas (FK), atributos y restricciones de integridad referencial.



## ESQUEMA TEXTUAL DE RELACIONES



**Categorias** (

PK: id_categoria,

UQ: nombre_categoria

)



**Producto** (

PK: id_producto,

UQ: descripcion_producto,

stock_actual,

precio_lista,

precio_costo_referencia,

FK: id_categoria

)



FK `id_categoria` referencia a `Categorias(id_categoria)`.



**Proveedor** (

PK: id_proveedor,

UQ: cuit_proveedor,

nombre_proveedor,

UQ: telefono_proveedor,

)



**Compra** (

PK: id_compra,

fecha_compra,

hora_compra,

estado_compra,

FK: id_proveedor

)



FK `id_proveedor` referencia a `Proveedor(id_proveedor)`.



**Detalle_compra** (

PK/FK: id_producto,

PK/FK: id_compra,

precio_unitario_compra,

cantidad_compra

)



FK `id_producto` referencia a `Producto(id_producto)`.  

FK `id_compra` referencia a `Compra(id_compra)`.



**Cliente** (

PK: dni_cliente,

nombre_cliente,

apellido_cliente,

UQ: telefono_cliente,

calle,

altura,

localidad

)



**Venta** (

PK: id_venta,

fecha_venta,

hora_venta,

estado_venta,

FK: dni_cliente

)



FK `dni_cliente` referencia a `Cliente(dni_cliente)`.



**Detalle_venta** (

PK/FK: id_producto,

PK/FK: id_venta,

precio_unitario,

cantidad_venta

)



FK `id_producto` referencia a `Producto(id_producto)`.  

FK `id_venta` referencia a `Venta(id_venta)`.



**Metodo_pago** (

PK: id_metodo,

UQ: nombre_metodo

)



**Pago** (

PK: id_pago,

FK: id_venta,

FK: id_metodo,

fecha_pago,

hora_pago,

monto,

referencia

)



FK `id_venta` referencia a `Venta(id_venta)`.  

FK `id_metodo` referencia a `Metodo_pago(id_metodo)`.





# DICCIONARIO DE DATOS



## TABLA: Categorias



**id_categoria (PK):** Identificador numérico único de la categoría.  



**nombre_categoria (UQ):** Denominación de la categoría (no admite duplicados).





## TABLA: Producto



**id_producto (PK):** Código único identificador del producto.  



**stock_actual:** Cantidad física disponible actualmente en inventario.  



**descripcion_producto (UQ):** Descripción o detalle del producto.  



**precio_lista:** Precio vigente establecido para la venta del producto.  



**precio_costo_referencia:** Costo estándar o última reposición del producto.



**id_categoria (FK):** Identificador de la categoría a la que pertenece el producto. Referencia a `Categorias(id_categoria)`.





## TABLA: Proveedor



**id_proveedor (PK):** Identificador único del proveedor dentro del sistema.  



**nombre_proveedor:** Razón social o nombre comercial.



**telefono_proveedor (UQ):** Número de contacto del proveedor.  



**cuit_proveedor (UQ):** Clave Única de Identificación Tributaria fiscalmente única.




## TABLA: Compra



**id_compra (PK):** Identificador único de la operación u orden de compra.  



**fecha_compra:** Fecha en la que se realizó la compra.  



**hora_compra:** Hora en la que se registró la operación de compra.  



**estado_compra:** Estado actual de la orden de compra.  
