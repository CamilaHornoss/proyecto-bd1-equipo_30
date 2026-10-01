\# PROCESO DE NORMALIZACIÓN



El esquema fue normalizado hasta alcanzar la Tercera Forma Normal (3FN), buscando reducir redundancias y evitar anomalías de inserción, modificación y borrado.



\## PRIMERA FORMA NORMAL (1FN)



Una relación se encuentra en Primera Forma Normal (1FN) cuando todos sus atributos contienen valores atómicos, es decir, indivisibles, y no existen grupos repetitivos.



\### Atomicidad de los datos



En la tabla `Cliente`, los datos personales y del domicilio se almacenan en atributos separados:



\- `nombre\_cliente`

\- `apellido\_cliente`

\- `telefono\_cliente`

\- `calle`

\- `altura`

\- `localidad`



De esta manera, no se almacena el nombre completo ni la dirección completa dentro de un único atributo.



\### Eliminación de grupos repetitivos



En las operaciones de compra y venta no se almacenan varios productos dentro de un mismo atributo.



Para representar los productos correspondientes a cada operación se utilizan las tablas intermedias:



\- `detalle\_compra`

\- `Venta\_detalle`



Esto permite registrar cada producto de forma independiente junto con su cantidad y precio correspondiente.



\### Múltiples medios de pago



La posibilidad de utilizar distintos medios de pago para una venta se resolvió mediante la tabla `pago`.



De esta forma se evita incorporar atributos repetitivos dentro de `Venta`, como:



\- `metodo\_1`

\- `monto\_1`

\- `metodo\_2`

\- `monto\_2`



La relación entre una venta y sus métodos de pago queda representada mediante `id\_venta` e `id\_metodo`.





\## SEGUNDA FORMA NORMAL (2FN)



Una relación se encuentra en Segunda Forma Normal (2FN) cuando cumple con 1FN y todos los atributos no clave dependen funcionalmente de la clave primaria completa, evitando dependencias parciales.



\### Tablas con clave primaria simple



Las siguientes tablas poseen una clave primaria formada por un único atributo:



\- `Cliente` → `dni\_cliente`

\- `Proveedor` → `id\_proveedor`

\- `Categorias` → `id\_categoria`

\- `Producto` → `id\_producto`

\- `Compra` → `id\_compra`

\- `Venta` → `id\_venta`

\- `Metodo\_pago` → `id\_metodo`



Al poseer claves simples, no pueden presentar dependencias parciales respecto de una clave primaria compuesta.



\### Tabla detalle\_compra



La tabla `detalle\_compra` posee una clave primaria compuesta por:



`(id\_producto, id\_compra)`



Sus atributos:



\- `precio\_unitario\_compra`

\- `cantidad\_compra`



dependen de la combinación completa de producto y compra.



El precio unitario y la cantidad no dependen únicamente de `id\_producto` ni únicamente de `id\_compra`, sino del producto específico dentro de una determinada operación de compra.



\### Tabla Venta\_detalle



La tabla `Venta\_detalle` posee una clave primaria compuesta por:



`(id\_producto, id\_venta)`



Los atributos:



\- `precio\_unitario`

\- `cantidad`



dependen de la combinación completa entre el producto vendido y la venta en la que fue incluido.



Por lo tanto, no existen dependencias parciales.



\### Tabla pago



La tabla `pago` posee una clave primaria compuesta por:



`(id\_venta, id\_metodo)`



El atributo `monto` depende de la combinación entre la venta y el método de pago utilizado.



De esta manera, el monto representa cuánto fue abonado mediante un determinado método dentro de una venta específica.





\## TERCERA FORMA NORMAL (3FN)



Una relación se encuentra en Tercera Forma Normal (3FN) cuando cumple con 2FN y ningún atributo no clave depende transitivamente de la clave primaria.



\### Separación de las categorías de productos



La información correspondiente a las categorías se encuentra separada en la tabla `Categorias`.



`Producto` almacena únicamente:



`id\_categoria`



como clave foránea.



El atributo `nombre\_categoria` se encuentra en `Categorias` y depende de `id\_categoria`.



De esta forma se evita almacenar repetidamente el nombre de la categoría en cada producto.



La dependencia queda representada como:



`id\_producto → id\_categoria`



y:



`id\_categoria → nombre\_categoria`



manteniendo la información propia de la categoría fuera de la tabla `Producto`.



\### Separación de proveedores y compras



Los datos propios del proveedor se almacenan únicamente en la tabla `Proveedor`.



La tabla `Compra` contiene solamente `id\_proveedor` como clave foránea para identificar al proveedor asociado a cada compra.



Por lo tanto, atributos como:



\- `nombre\_proveedor`

\- `telefono`

\- `cuit\_proveedor`



no se repiten en cada registro de compra.



Esto evita anomalías de actualización si cambia algún dato del proveedor.



\### Separación de clientes y ventas



Los datos personales del cliente se almacenan exclusivamente en la tabla `Cliente`.



La tabla `Venta` contiene `dni\_cliente` como clave foránea.



Por lo tanto, atributos como:



\- `nombre\_cliente`

\- `apellido\_cliente`

\- `telefono\_cliente`

\- `calle`

\- `altura`

\- `localidad`



no se duplican en cada venta.



Esto permite que los datos propios del cliente dependan únicamente de `dni\_cliente`.



\### Separación de métodos de pago



La descripción del método de pago se encuentra almacenada en `Metodo\_pago`.



La tabla `pago` almacena únicamente `id\_metodo` como clave foránea, evitando repetir `nombre\_metodo` en cada operación de pago.



\### Precios de las operaciones



El modelo diferencia entre los precios generales asociados al producto y los precios registrados en cada operación.



En `Producto` se encuentran:



\- `precio\_lista`

\- `precio\_compra`



Mientras que los precios correspondientes a una operación específica se almacenan en:



\- `detalle\_compra.precio\_unitario\_compra`

\- `Venta\_detalle.precio\_unitario`



Los valores de las tablas de detalle representan el precio aplicado específicamente en esa compra o venta.



Por ejemplo:



`(id\_compra, id\_producto) → precio\_unitario\_compra`



y:



`(id\_venta, id\_producto) → precio\_unitario`



De esta forma, el precio aplicado en una operación depende de la clave de la relación de detalle correspondiente y no se obtiene necesariamente del precio actual almacenado en `Producto`.



\## RESULTADO DE LA NORMALIZACIÓN



Luego del proceso de normalización, el modelo queda compuesto por las siguientes relaciones:



\- `Categorias`

\- `Producto`

\- `Proveedor`

\- `Compra`

\- `detalle\_compra`

\- `Cliente`

\- `Venta`

\- `Venta\_detalle`

\- `Metodo\_pago`

\- `pago`



El esquema resultante cumple con los criterios analizados de 1FN, 2FN y 3FN, separando los datos según sus dependencias funcionales y utilizando claves primarias y foráneas para mantener las relaciones entre las tablas.

