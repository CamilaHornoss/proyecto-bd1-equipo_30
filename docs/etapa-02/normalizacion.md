PROCESO DE NORMALIZACION

El esquema fue normalizado hasta alcanzar la Tercera Forma Normal (3FN), garantizando la eliminacion de redundancias y evitando anomalias de insercion, modificacion y borrado.


1. PRIMERA FORMA NORMAL (1FN)

Una relacion esta en 1FN si todos los atributos contienen valores atomicos (indivisibles) y no existen grupos repetitivos.

- Atomicidad de datos de contacto y domicilio: En la tabla Cliente, la direccion se descompuso en campos elementales (calle, altura, localidad) en lugar de almacenar una cadena de texto combinada. Lo mismo aplica para nombre y apellido.
- Eliminacion de grupos repetitivos: En compras y ventas no se almacenan listas de productos dentro de un mismo registro. Se desprenden las relaciones intermedias detalle_compra y Venta_detalle.
- Multiples medios de cobro: La posibilidad de abonar una venta con diferentes medios de pago se resolvio mediante la entidad intermedia Pago, evitando columnas repetitivas como metodo_1, monto_1, metodo_2, monto_2.


2. SEGUNDA FORMA NORMAL (2FN)

Una relacion esta en 2FN si esta en 1FN y todos los atributos que no forman parte de ninguna clave candidata dependen funcionalmente de manera completa de la clave primaria (no existen dependencias parciales en claves compuestas).

- Tablas con clave simple: Cliente, Proveedor, Categorias, Producto, Compra, Venta y Metodo_pago estan en 2FN por definicion, ya que sus claves primarias constan de un unico atributo.
- Tablas intermedias con clave compuesta:
  * En detalle_compra (PK: id_compra, id_producto), tanto precio_compra como cantidad_compra dependen de la combinacion exacta del producto comprado en esa compra puntual, no de uno solo por separado.
  * En Venta_detalle (PK: id_venta, id_producto), cantidad y precio_unitario dependen de que producto se vendio en que venta especifica.
  * En Pago (PK: id_venta, id_metodo), Monto depende de cuanto se abono con ese metodo especifico en esa venta en particular.


3. TERCERA FORMA NORMAL (3FN)

Una relacion esta en 3FN si esta en 2FN y ningun atributo no clave depende transitivamente de la clave primaria.

- Categorizacion de productos: En lugar de guardar el nombre de la categoria directamente en Producto (lo que generaria dependencias del tipo id_producto -> id_categoria -> descripcion_categoria), se aislo la entidad Categorias, eliminando redundancia en descripciones repetidas.
- Separacion de ordenes y participantes: En Venta, los atributos del cliente no se duplican (solo se almacena dni_cliente). De la misma forma, en Compra solo se registra cuit_proveedor, evitando anomalias de actualizacion en los datos del proveedor o cliente.
- Historicos de precios: La presencia de precio_unitario en Venta_detalle y precio_compra en detalle_compra no rompe la 3FN, ya que no dependen funcionalmente de Producto en tiempo actual, sino que representan un hecho transaccional inmutable (precio historico al momento de la operacion).
