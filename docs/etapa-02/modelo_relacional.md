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



**id_proveedor (FK):** Identificador del proveedor al cual se realizó la compra. Referencia a `Proveedor(id_proveedor)`.





## TABLA: Detalle_compra



**id_producto (PK, FK):** Producto incluido en la orden de compra. Referencia a `Producto(id_producto)`.  



**id_compra (PK, FK):** Compra a la que pertenece el detalle. Referencia a `Compra(id_compra)`.  



**precio_unitario_compra:** Precio unitario pagado por el producto en esa compra específica.  



**cantidad_compra:** Cantidad de unidades adquiridas del producto.



La clave primaria de `detalle_compra` está compuesta por `id_producto` e `id_compra`.





## TABLA: Cliente



**dni_cliente (PK):** Documento Nacional de Identidad que identifica de forma única al cliente.  



**nombre_cliente:** Nombres del cliente.  



**apellido_cliente:** Apellidos del cliente.  



**telefono_cliente (UQ):** Número de teléfono de contacto del cliente.  



**calle:** Nombre de la calle correspondiente al domicilio del cliente.  



**altura:** Numeración correspondiente al domicilio del cliente.  



**localidad:** Localidad o ciudad de residencia del cliente.





## TABLA: Venta



**id_venta (PK):** Identificador único de la operación de venta.  



**fecha_venta:** Fecha en la que se realizó la venta.  



**hora_venta:** Hora en la que se registró la venta.  



**estado_venta:** Estado actual del pedido asociado a la venta.  



**dni_cliente (FK):** Cliente que realizó la compra. Referencia a `Cliente(dni_cliente)`.





## TABLA: Detalle_venta



**id_producto (PK, FK):** Producto incluido en la venta. Referencia a `Producto(id_producto)`.  



**id_venta (PK, FK):** Venta a la que pertenece el detalle. Referencia a `Venta(id_venta)`.  



**precio_unitario:** Precio unitario aplicado al producto en el momento de la venta.  



**cantidad_venta:** Cantidad de unidades vendidas.



La clave primaria de `Detalle_venta` está compuesta por `id_producto` e `id_venta`.





## TABLA: Metodo_pago



**id_metodo (PK):** Identificador único del método de pago.  



**nombre_metodo (UQ):** Denominación del medio (ej. Efectivo, Transferencia, Tarjeta de Débito).





## TABLA: Pago



**id_pago (PK):** Identificador único del recibo/transacción de cobro.



**id_venta (FK):** Identificador de la venta que se está abonando. Referencia a `Venta(id_venta)`.  



**id_metodo (FK):** Identificador del método utilizado para realizar el pago. Referencia a `Metodo_pago(id_metodo)`.  



**fecha_pago:** Fecha en la que se acreditó el importe.



**hora_pago:** Hora de registración del cobro.



**monto:** Importe correspondiente al método de pago utilizado.



**referencia:** Código de comprobante, número de cupón posnet o identificador de transferencia.



La clave primaria de `pago` es `id_pago`. `id_venta` e `id_metodo` son claves foráneas.





# RESTRICCIONES DE INTEGRIDAD REFERENCIAL



- `Producto.id_categoria` debe existir previamente en `Categorias.id_categoria`.

- `Compra.id_proveedor` debe existir previamente en `Proveedor.id_proveedor`.

- `Detalle_compra.id_producto` debe existir previamente en `Producto.id_producto`.

- `Detalle_compra.id_compra` debe existir previamente en `Compra.id_compra`.

- `Venta.dni_cliente` debe existir previamente en `Cliente.dni_cliente`.

- `Detalle_venta.id_producto` debe existir previamente en `Producto.id_producto`.

- `Detalle_venta.id_venta` debe existir previamente en `Venta.id_venta`.

- `Pago.id_venta` debe existir previamente en `Venta.id_venta`.

- `Pago.id_metodo` debe existir previamente en `Metodo_pago.id_metodo`.
