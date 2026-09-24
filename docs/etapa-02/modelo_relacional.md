MODELO RELACIONAL DE DATOS

A continuacion se detalla la especificacion formal del esquema relacional obtenido a partir del diagrama, indicando claves primarias (PK), claves foraneas (FK), atributos y restricciones de integridad referencial.


1. ESQUEMA TEXTUAL DE RELACIONES

- Categorias (PK: id_categoria, descripcion)

- Producto (PK: id_producto, stock_actual, descripcion, precio_lista, FK: id_categoria)
  FK id_categoria referencia a Categorias(id_categoria)

- Proveedor (PK: cuit_proveedor, nombre_proveedor, telefono)

- Compra (PK: id_compra, fecha, hora, estado_pedido, FK: cuit_proveedor)
  FK cuit_proveedor referencia a Proveedor(cuit_proveedor)

- detalle_compra (PK/FK: id_producto, PK/FK: id_compra, precio_compra, cantidad_compra)
  FK id_producto referencia a Producto(id_producto)
  FK id_compra referencia a Compra(id_compra)

- Cliente (PK: dni_cliente, nombre, apellido, telefono, calle, altura, localidad)

- Venta (PK: id_venta, fecha, hora, estado_pedido, FK: dni_cliente)
  FK dni_cliente referencia a Cliente(dni_cliente)

- Venta_detalle (PK/FK: id_producto, PK/FK: id_venta, precio_unitario, cantidad)
  FK id_producto referencia a Producto(id_producto)
  FK id_venta referencia a Venta(id_venta)

- Metodo_pago (PK: id_metodo, nombre_metodo)

- Pago (PK/FK: id_venta, PK/FK: id_metodo, Monto)
  FK id_venta referencia a Venta(id_venta)
  FK id_metodo referencia a Metodo_pago(id_metodo)


2. DICCIONARIO DE DATOS

TABLA: Categorias
- id_categoria (PK): Identificador numerico unico de la categoria.
- descripcion: Nombre o descripcion de la categoria.

TABLA: Producto
- id_producto (PK): Codigo unico identificador del producto.
- stock_actual: Cantidad fisica disponible en inventario.
- descripcion: Detalle descriptivo o nombre del producto.
- precio_lista: Precio base vigente para la venta.
- id_categoria (FK): Categoria a la que pertenece el producto.

TABLA: Proveedor
- cuit_proveedor (PK): CUIT identificatorio fiscal del proveedor.
- nombre_proveedor: Razon social o nombre comercial.
- telefono: Numero de contacto del proveedor.

TABLA: Compra
- id_compra (PK): Identificador univoco del comprobante u orden de compra.
- fecha: Fecha de realizacion de la compra.
- hora: Hora exacta del registro de compra.
- estado_pedido: Estado logistico y administrativo de la orden.
- cuit_proveedor (FK): Proveedor al que se le realizo la compra.

TABLA: detalle_compra
- id_producto (PK, FK): Producto adquirido en la orden de compra.
- id_compra (PK, FK): Orden de compra asociada.
- precio_compra: Precio unitario de costo pactado en esa compra puntual.
- cantidad_compra: Unidades adquiridas en el pedido.

TABLA: Cliente
- dni_cliente (PK): Documento Nacional de Identidad del cliente.
- nombre: Nombres de pila del cliente.
- apellido: Apellidos del cliente.
- telefono: Telefono de contacto.
- calle: Nombre de la arteria del domicilio.
- altura: Numeracion catastral de la direccion.
- localidad: Ciudad o localidad de residencia.

TABLA: Venta
- id_venta (PK): Identificador univoco de la transaccion de venta.
- fecha: Fecha de emision de la venta.
- hora: Hora de concrecion de la venta.
- estado_pedido: Estado del pedido (pendiente, entregado, cancelado).
- dni_cliente (FK): Cliente que realizo la compra.

TABLA: Venta_detalle
- id_producto (PK, FK): Producto vendido en la transaccion.
- id_venta (PK, FK): Venta asociada.
- precio_unitario: Precio historico de venta unitario al momento del cobro.
- cantidad: Cantidad de unidades vendidas.

TABLA: Metodo_pago
- id_metodo (PK): Identificador unico del medio de cobro o pago.
- nombre_metodo: Denominacion del metodo (Efectivo, Transferencia, Tarjeta).

TABLA: Pago
- id_venta (PK, FK): Venta que se esta cancelando o abonando.
- id_metodo (PK, FK): Medio de pago utilizado.
- Monto: Importe asignado a ese metodo de pago puntual.
