\# JUSTIFICACIÓN Y DECISIONES DE DISEÑO



El diseño del modelo relacional responde a las necesidades de un sistema comercial y de gestión de stock, priorizando la trazabilidad de las operaciones, la integridad de los datos y la correcta separación de las responsabilidades de cada entidad.



\## DESACOPLAMIENTO DE PRECIOS: PRECIO DE LISTA VS. PRECIO TRANSACCIONAL



\*\*Problema:\*\*  

Si solamente se almacenara `precio\_lista` en la tabla `Producto`, una modificación posterior del precio podría impedir conocer con precisión qué valor fue aplicado en una venta anterior.



\*\*Decisión:\*\*  

La tabla `Producto` conserva los valores generales del producto mediante:



\- `precio\_lista`

\- `precio\_compra`



Mientras que las tablas de detalle almacenan los precios efectivamente aplicados en cada transacción:



\- `Venta\_detalle.precio\_unitario`

\- `detalle\_compra.precio\_unitario\_compra`



De esta manera, el precio registrado en una operación queda asociado a esa compra o venta específica, independientemente de los cambios posteriores que puedan realizarse sobre los precios actuales del producto.



Esto permite conservar la trazabilidad histórica de las operaciones.



\## PAGOS MIXTOS O MÚLTIPLES POR VENTA



\*\*Problema:\*\*  

Una venta puede ser abonada utilizando distintos métodos de pago. Por ejemplo, una parte puede abonarse en efectivo y otra mediante transferencia.



\*\*Decisión:\*\*  

Se creó la relación `pago`, que vincula `Venta` con `Metodo\_pago` mediante una clave primaria compuesta por:



`(id\_venta, id\_metodo)`



Además, la tabla posee el atributo:



`monto`



De esta manera, se puede registrar qué importe de una determinada venta fue abonado mediante cada método de pago.



La estructura permite representar tanto ventas abonadas mediante un único método como ventas pagadas utilizando varios medios.



\## RELACIÓN ENTRE COMPRAS Y PROVEEDORES



\*\*Decisión:\*\*  

La relación entre `Proveedor` y `Compra` es de uno a muchos (1:N).



La tabla `Proveedor` utiliza:



`id\_proveedor`



como clave primaria.



La tabla `Compra` contiene:



`id\_proveedor`



como clave foránea que referencia a:



`Proveedor(id\_proveedor)`.



\*\*Justificación:\*\*  

Cada compra se encuentra asociada a un único proveedor, mientras que un mismo proveedor puede estar relacionado con múltiples compras realizadas a lo largo del tiempo.



El atributo `cuit\_proveedor` se mantiene como un dato propio del proveedor, pero no se utiliza como clave primaria del modelo. La identificación interna de cada proveedor se realiza mediante `id\_proveedor`.



Esta decisión permite separar la identificación interna utilizada por el sistema de los datos fiscales asociados al proveedor.



\## NORMALIZACIÓN DEL DOMICILIO DEL CLIENTE



\*\*Decisión:\*\*  

Se optó por almacenar los componentes principales del domicilio del cliente en atributos separados dentro de la tabla `Cliente`:



\- `calle`

\- `altura`

\- `localidad`



\*\*Justificación:\*\*  

Esta separación permite mantener los datos de dirección de forma atómica y facilita la realización de búsquedas, filtros y consultas por localidad o calle.



Al mismo tiempo, se evitó incorporar entidades adicionales para direcciones, provincias o códigos postales, ya que el modelo actual no requiere ese nivel adicional de complejidad.



De esta manera, se mantiene un equilibrio entre normalización y simplicidad del esquema.



\## SEPARACIÓN DE DATOS DEL CLIENTE Y LAS VENTAS



\*\*Decisión:\*\*  

Los datos personales y de contacto se almacenan únicamente en la tabla `Cliente`.



La tabla `Venta` contiene solamente:



`dni\_cliente`



como clave foránea.



\*\*Justificación:\*\*  

Esto evita repetir en cada venta información como:



\- `nombre\_cliente`

\- `apellido\_cliente`

\- `telefono\_cliente`

\- `calle`

\- `altura`

\- `localidad`



De esta forma, una modificación en los datos del cliente se realiza en un único lugar y se evitan inconsistencias derivadas de almacenar los mismos datos en múltiples registros.



\## SEPARACIÓN DE CATEGORÍAS Y PRODUCTOS



\*\*Decisión:\*\*  

Las categorías se almacenan en una entidad independiente denominada `Categorias`, compuesta por:



\- `id\_categoria`

\- `nombre\_categoria`



La tabla `Producto` incorpora `id\_categoria` como clave foránea.



\*\*Justificación:\*\*  

Esto evita repetir el nombre de una misma categoría para cada producto.



Además, permite que varios productos pertenezcan a una misma categoría manteniendo la información de la categoría centralizada.



\## USO DE TABLAS DE DETALLE EN COMPRAS Y VENTAS



\*\*Decisión:\*\*  

Se utilizaron las tablas:



\- `detalle\_compra`

\- `Venta\_detalle`



para resolver la relación entre las operaciones y los productos.



\*\*Justificación:\*\*  

Una compra puede contener varios productos y un producto puede aparecer en diferentes compras. Del mismo modo, una venta puede incluir varios productos y un producto puede participar en múltiples ventas.



Por este motivo, las relaciones son de muchos a muchos (N:M) y se resuelven mediante tablas intermedias.



Además, estas tablas permiten almacenar atributos propios de cada operación, como:



En `detalle\_compra`:



\- `precio\_unitario\_compra`

\- `cantidad\_compra`



En `Venta\_detalle`:



\- `precio\_unitario`

\- `cantidad`



Estos valores dependen de la combinación específica entre la operación y el producto.



\## MANEJO DE FECHAS Y HORAS SEPARADAS



\*\*Decisión:\*\*  

Las tablas transaccionales `Venta` y `Compra` almacenan la fecha y la hora en atributos independientes:



En `Venta`:



\- `fecha\_venta`

\- `hora\_venta`



En `Compra`:



\- `fecha\_compra`

\- `hora\_compra`



\*\*Justificación:\*\*  

La separación permite realizar consultas directamente sobre la fecha o sobre la hora según las necesidades del sistema.



Por ejemplo, se pueden obtener ventas realizadas en un día determinado, agrupar operaciones por fecha o analizar horarios de realización de las transacciones sin necesidad de separar ambos componentes durante cada consulta.



\## SEPARACIÓN DE LOS MÉTODOS DE PAGO



\*\*Decisión:\*\*  

Los métodos disponibles se almacenan en la tabla `Metodo\_pago`, utilizando:



\- `id\_metodo`

\- `nombre\_metodo`



La tabla `pago` referencia el método mediante `id\_metodo`.



\*\*Justificación:\*\*  

Esto evita repetir nombres como "Efectivo", "Transferencia" o "Tarjeta" en cada operación.



Además, permite incorporar nuevos métodos de pago sin modificar la estructura de la tabla `Venta`.

