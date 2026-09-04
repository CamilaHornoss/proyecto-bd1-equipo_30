Etapa I: Requerimientos y Dominio del Negocio (Sin Proveedores)
1. Descripción del Caso y Alcance del Sistema
Tienda OGA es un emprendimiento comercial polirrubro dedicado a la venta minorista directa de artículos variados, abarcando electrónica y tecnología (tablets, cámaras de seguridad, tiras de luces LED neón, entre otros) y artículos para el hogar y ferretería (griferías, secaplatos, picaportes, entre otros).

El crecimiento sostenido en las consultas y pedidos a través de canales digitales y ventas presenciales hace indispensable sustituir las planillas de cálculo por un sistema de información centralizado. El sistema resolverá los problemas comunes de desfasaje de inventario, errores al calcular totales y la dispersión en los registros de cobros multicanal.

Alcance del Sistema:

Gestión de Catálogo y Stock: Clasificación por categorías y marcas, con seguimiento en tiempo real del stock disponible y alertas de stock mínimo.

Padrón de Clientes: Registro de datos personales, fiscales y de contacto para facturación y envíos.

Proceso de Ventas y Comprobantes: Registro de ventas con renglones de detalle, congelamiento estricto de precios unitarios históricos y actualización automática de stock.

Control de Pagos y Cobranzas: Registro de transacciones con soporte para cobros fraccionados o combinados en múltiples medios de pago (efectivo, transferencia, tarjetas, Mercado Pago).

El alcance excluye facturación electrónica conectada a webhooks de AFIP/ARCA e integración con empresas de encomiendas de terceros, gestionándose internamente por la administración de la tienda.

2. Reglas de Negocio (RN)
RN.01 (Identificación y Registro de Clientes): Toda venta debe estar asociada a un cliente registrado con su número de DNI o CUIT. De cada cliente se almacena obligatoriamente nombre, apellido (o razón social), número de teléfono de contacto y dirección (calle, número y localidad). El DNI/CUIT es único en el sistema.

RN.02 (Organización del Catálogo): Todo producto comercializado se identifica mediante un código alfanumérico único (cod_producto). Cada producto pertenece obligatoriamente a una Categoría (ej. "Tecnología", "Hogar") y a una Marca (ej. "Gadnic", "Genérica", "Piazza"), evitando redundancias de texto. De cada producto se registra descripción, precio de lista vigente, stock actual y stock mínimo de reposición.

RN.03 (Control y Descuento Automático de Stock): Una venta no puede confirmarse si la cantidad solicitada de un artículo supera el stock actual disponible. Al registrarse la venta, el sistema descuenta automáticamente las unidades vendidas del inventario del producto. Si el stock actual es menor o igual al stock mínimo, el sistema marcará el producto en estado de alerta para reposición.

RN.04 (Historial de Precios Unitarios en el Detalle de Venta): Cada venta se compone de un encabezado y uno o varios ítems detallados en DETALLE_VENTA. En cada ítem se debe registrar de forma obligatoria el precio unitario histórico de venta al momento exacto de la operación junto con la cantidad vendida. Modificaciones posteriores en el precio de lista de la tabla PRODUCTO no afectarán bajo ninguna circunstancia los montos de ventas ya asentadas.

RN.05 (Cobranzas y Múltiples Medios de Pago): Una venta puede cancelarse mediante uno o más pagos utilizando los métodos habilitados por la tienda (efectivo, transferencia bancaria, tarjeta de débito, tarjeta de crédito, Mercado Pago). De cada pago se registra la fecha/hora, el método utilizado, el monto abonado y el número de comprobante o referencia de la operación. La suma total de los pagos asignados a una venta debe coincidir exactamente con el importe final facturado.

RN.06 (Unicidad de Ítems por Venta): Una venta no puede contener renglones duplicados para un mismo producto. Si el cliente agrega más unidades del mismo artículo, se actualiza el campo cantidad en el renglón correspondiente del detalle.

RN.07 (Estado y Entrega del Pedido): Cada venta cuenta con un estado operativo que refleja el ciclo del pedido (ej. Pendiente de pago, Pagado, Preparado, Entregado, Cancelado), permitiendo controlar los despachos locales de mercadería.

3. Esquema Relacional Propuesto (7 Tablas en 3FN)
Al retirar proveedores, el esquema mantiene un nivel óptimo de normalización (3FN) y una complejidad sólida para la cátedra:

CLIENTE (dni_cuit, nombre, apellido, telefono, direccion, localidad)

CATEGORIA (id_categoria, nombre_categoria)

MARCA (id_marca, nombre_marca)

PRODUCTO (cod_producto, descripcion, precio_lista, stock_actual, stock_minimo, id_categoria, id_marca)

VENTA (id_venta, fecha_hora, estado_pedido, dni_cliente)

DETALLE_VENTA (id_venta, cod_producto, cantidad, precio_unitario_historico)

METODO_PAGO (id_metodo, nombre_metodo)

PAGO_VENTA (id_pago, fecha_pago, monto, nro_referencia, id_venta, id_metodo)

4. Justificación del Cumplimiento de Formas Normales (3FN)
1FN: Cada celda almacena un único valor atómico (no hay listas de productos ni datos agrupados en columnas) y todas las tablas poseen clave primaria definida.

2FN: No existen dependencias parciales. En DETALLE_VENTA (cuya clave es compuesta: id_venta + cod_producto), los atributos cantidad y precio_unitario_historico dependen de la combinación completa de la venta y el producto.

3FN: No hay dependencias transitivas. El nombre de la categoría y de la marca se separaron en sus propias tablas (CATEGORIA y MARCA), evitando que dependan indirectamente a través del código de producto. Lo mismo aplica para METODO_PAGO respecto al cobro realizado.
