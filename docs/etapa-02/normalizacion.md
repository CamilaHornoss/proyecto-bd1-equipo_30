# PROCESO DE NORMALIZACIÓN



El esquema fue normalizado hasta alcanzar la Tercera Forma Normal (3FN), buscando reducir redundancias y evitar anomalías de inserción, modificación y borrado.



## PRIMERA FORMA NORMAL (1FN)



Una relación se encuentra en Primera Forma Normal (1FN) cuando todos sus atributos contienen valores atómicos, es decir, indivisibles, y no existen grupos repetitivos.



### Atomicidad de los datos



En la tabla `Cliente`, los datos personales y del domicilio se almacenan en atributos separados:



- `nombre_cliente`

- `apellido_cliente`

- `telefono_cliente`

- `calle`

- `altura`

- `localidad`



De esta manera, no se almacena el nombre completo ni la dirección completa dentro de un único atributo.



### Eliminación de grupos repetitivos



En las operaciones de compra y venta no se almacenan varios productos dentro de un mismo atributo.



Para representar los productos correspondientes a cada operación se utilizan las tablas intermedias:



- `Detalle_compra`

- `Detalle_venta`



Esto permite registrar cada producto de forma independiente junto con su cantidad y precio correspondiente.



### Múltiples medios de pago



La posibilidad de utilizar distintos medios de pago para una venta se resolvió mediante la tabla `Pago`.



De esta forma se evita incorporar atributos repetitivos dentro de `Venta`, como:



- `metodo_1`

- `monto_1`

- `metodo_2`

- `monto_2`



La relación entre una venta y sus métodos de pago queda representada mediante `id_venta` e `id_metodo`.





## SEGUNDA FORMA NORMAL (2FN)



Una relación se encuentra en Segunda Forma Normal (2FN) cuando cumple con 1FN y todos los atributos no clave dependen funcionalmente de la clave primaria completa, evitando dependencias parciales.



### Tablas con clave primaria simple



Las siguientes tablas poseen una clave primaria formada por un único atributo:



- `Cliente` → `dni_cliente`

- `Proveedor` → `id_proveedor`

- `Categorias` → `id_categoria`

- `Producto` → `id_producto`

- `Compra` → `id_compra`

- `Venta` → `id_venta`

- `Metodo_pago` → `id_metodo`

- `Pago` → `id_pago`



Al poseer claves simples, no pueden presentar dependencias parciales respecto de una clave primaria compuesta.



### Tabla detalle_compra



La tabla `Detalle_compra` posee una clave primaria compuesta por:



`(id_producto, id_compra)`



Sus atributos:



- `precio_unitario_compra`

- `cantidad_compra`



dependen de la combinación completa de producto y compra.



El precio unitario y la cantidad no dependen únicamente de `id_producto` ni únicamente de `id_compra`, sino del producto específico dentro de una determinada operación de compra.



### Tabla Detalle_venta



La tabla `Detalle_venta` posee una clave primaria compuesta por:



`(id_producto, id_venta)`



Los atributos:



- `precio_unitario`

- `cantidad_venta`



dependen de la combinación completa entre el producto vendido y la venta en la que fue incluido.



Por lo tanto, no existen dependencias parciales.



### Tabla Pago



Los atributos de `Pago` dependen de su clave primaria simple `id_pago`.



`id_venta` e `id_metodo` permiten relacionar cada pago con la venta correspondiente y con el método de pago utilizado.





## TERCERA FORMA NORMAL (3FN)



Una relación se encuentra en Tercera Forma Normal (3FN) cuando cumple con 2FN y ningún atributo no clave depende transitivamente de la clave primaria.



### Separación de las categorías de productos



La información correspondiente a las categorías se encuentra separada en la tabla `Categorias`.



`Producto` almacena únicamente:



`id_categoria`



como clave foránea.



El atributo `nombre_categoria` se encuentra en `Categorias` y depende de `id_categoria`.



De esta forma se evita almacenar repetidamente el nombre de la categoría en cada producto.



La dependencia queda representada como:



`id_producto → id_categoria`



y:



`id_categoria → nombre_categoria`



manteniendo la información propia de la categoría fuera de la tabla `Producto`.



### Separación de proveedores y compras



Los datos propios del proveedor se almacenan únicamente en la tabla `Proveedor`.



La tabla `Compra` contiene solamente `id_proveedor` como clave foránea para identificar al proveedor asociado a cada compra.



Por lo tanto, atributos como:



- `nombre_proveedor`

- `telefono_proveedor`

- `cuit_proveedor`



no se repiten en cada registro de compra.



Esto evita anomalías de actualización si cambia algún dato del proveedor.



### Separación de clientes y ventas



Los datos personales del cliente se almacenan exclusivamente en la tabla `Cliente`.



La tabla `Venta` contiene `dni_cliente` como clave foránea.



Por lo tanto, atributos como:



- `nombre_cliente`

- `apellido_cliente`

- `telefono_cliente`

- `calle`

- `altura`

- `localidad`



no se duplican en cada venta.



Esto permite que los datos propios del cliente dependan únicamente de `dni_cliente`.



### Separación de métodos de pago



La descripción del método de pago se encuentra almacenada en `Metodo_pago`.



La tabla `Pago` almacena únicamente `id_metodo` como clave foránea, evitando repetir `nombre_metodo` en cada operación de pago.



### Precios de las operaciones



El modelo diferencia entre los precios generales asociados al producto y los precios registrados en cada operación.



En `Producto` se encuentran:



- `precio_lista`

- `precio_costo_referencia`



Mientras que los precios correspondientes a una operación específica se almacenan en:



- `Detalle_compra.precio_unitario_compra`

- `Detalle_venta.precio_unitario`



Los valores de las tablas de detalle representan el precio aplicado específicamente en esa compra o venta.



Por ejemplo:



`(id_compra, id_producto) → precio_unitario_compra`



y:



`(id_venta, id_producto) → precio_unitario`



De esta forma, el precio aplicado en una operación depende de la clave de la relación de detalle correspondiente y no se obtiene necesariamente del precio actual almacenado en `Producto`.



## RESULTADO DE LA NORMALIZACIÓN



Luego del proceso de normalización, el modelo queda compuesto por las siguientes relaciones:



- `Categorias`

- `Producto`

- `Proveedor`

- `Compra`

- `Detalle_compra`

- `Cliente`

- `Venta`

- `Detalle_venta`

- `Metodo_pago`

- `Pago`



El esquema resultante cumple con los criterios analizados de 1FN, 2FN y 3FN, separando los datos según sus dependencias funcionales y utilizando claves primarias y foráneas para mantener las relaciones entre las tablas.
