\# MODELO RELACIONAL DE DATOS



A continuación se detalla la especificación formal del esquema relacional obtenido a partir del diagrama, indicando claves primarias (PK), claves foráneas (FK), atributos y restricciones de integridad referencial.



\## ESQUEMA TEXTUAL DE RELACIONES



\*\*Categorias\*\* (

PK: id\_categoria,

UQ: nombre\_categoria

)



\*\*Producto\*\* (

PK: id\_producto,

UQ: descripcion\_producto,

stock\_actual,

precio\_lista,

precio\_costo\_referencia,

FK: id\_categoria

)



FK `id\_categoria` referencia a `Categorias(id\_categoria)`.



\*\*Proveedor\*\* (

PK: id\_proveedor,

UQ: cuit\_proveedor

nombre\_proveedor,

UQ: telefono\_proveedor,

)



\*\*Compra\*\* (

PK: id\_compra,

fecha\_compra,

hora\_compra,

estado\_compra,

FK: id\_proveedor

)



FK `id\_proveedor` referencia a `Proveedor(id\_proveedor)`.



\*\*Detalle\_compra\*\* (

PK/FK: id\_producto,

PK/FK: id\_compra,

precio\_unitario\_compra,

cantidad\_compra

)



FK `id\_producto` referencia a `Producto(id\_producto)`.  

FK `id\_compra` referencia a `Compra(id\_compra)`.



\*\*Cliente\*\* (

PK: dni\_cliente,

nombre\_cliente,

apellido\_cliente,

UQ: telefono\_cliente,

calle,

altura,

localidad

)



\*\*Venta\*\* (

PK: id\_venta,

fecha\_venta,

hora\_venta,

estado\_venta,

FK: dni\_cliente

)



FK `dni\_cliente` referencia a `Cliente(dni\_cliente)`.



\*\*Detalle\_venta\*\* (

PK/FK: id\_producto,

PK/FK: id\_venta,

precio\_unitario,

cantidad_venta

)



FK `id\_producto` referencia a `Producto(id\_producto)`.  

FK `id\_venta` referencia a `Venta(id\_venta)`.



\*\*Metodo\_pago\*\* (

PK: id\_metodo,

UQ: nombre\_metodo

)



\*\*Pago\*\* (

PK: id\_pago,

FK: id\_venta,

FK: id\_metodo,

fecha\_pago,

hora\_pago

monto

referencia

)



FK `id\_venta` referencia a `Venta(id\_venta)`.  

FK `id\_metodo` referencia a `Metodo\_pago(id\_metodo)`.





\# DICCIONARIO DE DATOS



\## TABLA: Categorias



\*\*id\_categoria (PK):\*\* Identificador numérico único de la categoría.  



\*\*nombre\_categoria (UQ):\*\* Denominación de la categoría (no admite duplicados).





\## TABLA: Producto



\*\*id\_producto (PK):\*\* Código único identificador del producto.  



\*\*stock\_actual:\*\* Cantidad física disponible actualmente en inventario.  



\*\*descripcion\_producto (UQ):\*\* Descripción o detalle del producto.  



\*\*precio\_lista:\*\* Precio vigente establecido para la venta del producto.  



\*\*precio\_costo\_referencia:\*\* Costo estándar o última reposición del producto.



\*\*id\_categoria (FK):\*\* Identificador de la categoría a la que pertenece el producto. Referencia a `Categorias(id\_categoria)`.





\## TABLA: Proveedor



\*\*id\_proveedor (PK):\*\* Identificador único del proveedor dentro del sistema.  



\*\*nombre\_proveedor:\*\* Razón social o nombre comercial.



\*\*telefono (UQ):\*\* Número de contacto del proveedor.  



\*\*cuit\_proveedor (UQ):\*\* Clave Única de Identificación Tributaria fiscalmente única.




\## TABLA: Compra



\*\*id\_compra (PK):\*\* Identificador único de la operación u orden de compra.  



\*\*fecha\_compra:\*\* Fecha en la que se realizó la compra.  



\*\*hora\_compra:\*\* Hora en la que se registró la operación de compra.  



\*\*estado\_pedido:\*\* Estado actual de la orden de compra.  



\*\*id\_proveedor (FK):\*\* Identificador del proveedor al cual se realizó la compra. Referencia a `Proveedor(id\_proveedor)`.





\## TABLA: Detalle\_compra



\*\*id\_producto (PK, FK):\*\* Producto incluido en la orden de compra. Referencia a `Producto(id\_producto)`.  



\*\*id\_compra (PK, FK):\*\* Compra a la que pertenece el detalle. Referencia a `Compra(id\_compra)`.  



\*\*precio\_unitario\_compra:\*\* Precio unitario pagado por el producto en esa compra específica.  



\*\*cantidad\_compra:\*\* Cantidad de unidades adquiridas del producto.



La clave primaria de `detalle\_compra` está compuesta por `id\_producto` e `id\_compra`.





\## TABLA: Cliente



\*\*dni\_cliente (PK):\*\* Documento Nacional de Identidad que identifica de forma única al cliente.  



\*\*nombre\_cliente:\*\* Nombres del cliente.  



\*\*apellido\_cliente:\*\* Apellidos del cliente.  



\*\*telefono\_cliente (UQ):\*\* Número de teléfono de contacto del cliente.  



\*\*calle:\*\* Nombre de la calle correspondiente al domicilio del cliente.  



\*\*altura:\*\* Numeración correspondiente al domicilio del cliente.  



\*\*localidad:\*\* Localidad o ciudad de residencia del cliente.





\## TABLA: Venta



\*\*id\_venta (PK):\*\* Identificador único de la operación de venta.  



\*\*fecha\_venta:\*\* Fecha en la que se realizó la venta.  



\*\*hora\_venta:\*\* Hora en la que se registró la venta.  



\*\*estado\_venta:\*\* Estado actual del pedido asociado a la venta.  



\*\*dni\_cliente (FK):\*\* Cliente que realizó la compra. Referencia a `Cliente(dni\_cliente)`.





\## TABLA: Detalle\_venta



\*\*id\_producto (PK, FK):\*\* Producto incluido en la venta. Referencia a `Producto(id\_producto)`.  



\*\*id\_venta (PK, FK):\*\* Venta a la que pertenece el detalle. Referencia a `Venta(id\_venta)`.  



\*\*precio\_unitario:\*\* Precio unitario aplicado al producto en el momento de la venta.  



\*\*cantidad_venta:\*\* Cantidad de unidades vendidas.



La clave primaria de `Venta\_detalle` está compuesta por `id\_producto` e `id\_venta`.





\## TABLA: Metodo\_pago



\*\*id\_metodo (PK):\*\* Identificador único del método de pago.  



\*\*nombre\_metodo (UQ):\*\* Denominación del medio (ej. Efectivo, Transferencia, Tarjeta de Débito).





\## TABLA: Pago



\*\*id\_pago (PK):\*\* Identificador único del recibo/transacción de cobro.



\*\*id\_venta (FK):\*\* Identificador de la venta que se está abonando. Referencia a `Venta(id\_venta)`.  



\*\*id\_metodo (FK):\*\* Identificador del método utilizado para realizar el pago. Referencia a `Metodo\_pago(id\_metodo)`.  



\*\*fecha\_pago:\*\* Fecha en la que se acreditó el importe.



\*\*hora\_pago:\*\* Hora de registración del cobro.



\*\*monto:\*\* Importe correspondiente al método de pago utilizado.



\*\*referencia:\*\* Código de comprobante, número de cupón posnet o identificador de transferencia.



La clave primaria de `pago` está compuesta por `id\_venta` e `id\_metodo`.





\# RESTRICCIONES DE INTEGRIDAD REFERENCIAL



\- `Producto.id\_categoria` debe existir previamente en `Categorias.id\_categoria`.

\- `Compra.id\_proveedor` debe existir previamente en `Proveedor.id\_proveedor`.

\- `Detalle\_compra.id\_producto` debe existir previamente en `Producto.id\_producto`.

\- `Detalle\_compra.id\_compra` debe existir previamente en `Compra.id\_compra`.

\- `Venta.dni\_cliente` debe existir previamente en `Cliente.dni\_cliente`.

\- `Detalle\_venta.id\_producto` debe existir previamente en `Producto.id\_producto`.

\- `Detalle\_venta.id\_venta` debe existir previamente en `Venta.id\_venta`.

\- `Pago.id\_venta` debe existir previamente en `Venta.id\_venta`.

\- `Pago.id\_metodo` debe existir previamente en `Metodo\_pago.id\_metodo`.

