JUSTIFICACION Y DECISIONES DE DISENO

El diseno del modelo relacional responde a las reglas de negocio tipicas de un sistema comercial y de gestion de stock, priorizando la trazabilidad historica, la integridad de los saldos y la separacion de responsabilidades.


1. DESACOPLAMIENTO DE PRECIOS: PRECIO DE LISTA VS PRECIO TRANSACCIONAL

- Problema: Si solo se almacena precio_lista en la tabla Producto, cualquier actualizacion de precios modificaria retroactivamente los reportes de ventas pasadas.
- Decision: Producto.precio_lista actua como el catalogo vigente sugerido. En cambio, Venta_detalle.precio_unitario y detalle_compra.precio_compra congelan el valor monetario acordado al momento exacto de la transaccion. Esto preserva la fidelidad contable del negocio en el tiempo.


2. PAGOS MIXTOS O MULTIPLES POR VENTA

- Problema: Un cliente puede saldar una compra combinando metodos (por ejemplo, parte en efectivo y parte con transferencia).
- Decision: Se creo la relacion Pago vinculando Venta y Metodo_pago mediante clave primaria compuesta (id_venta, id_metodo) con el atributo Monto. Esto soporta tanto cobros unicos como cobros divididos de forma escalable.


3. INDEPENDENCIA ENTRE COMPRAS Y PROVEEDORES

- Decision: La relacion entre Proveedor y Compra es de 1 a N (cuit_proveedor foranea en Compra).
- Justificacion: Una orden de abastecimiento se emite a un unico proveedor consolidado, mientras que un proveedor puede abastecer multiples pedidos en el tiempo. El CUIT se adopto como clave natural primaria por ser unico e invariante en el ambito impositivo.


4. NORMALIZACION DEL DOMICILIO DEL CLIENTE

- Decision: Se opto por una separacion basica a nivel de campos (calle, altura, localidad) dentro de la tabla Cliente.
- Justificacion: Otorga la granularidad requerida para filtros de envios locales y logistica sin introducir una sobrecarga excesiva de tablas auxiliares (como provincias o codigos postales), manteniendo el modelo agil y enfocado en el nucleo comercial.


5. MANEJO DE FECHAS Y HORAS SEPARADAS

- Decision: Las entidades transaccionales (Venta y Compra) poseen campos independientes para fecha y hora.
- Justificacion: Facilita la indexacion y consultas analiticas agrupadas directamente por fecha (como cierre de caja diario o balance mensual) sin necesidad de aplicar funciones de conversion o truncado en las consultas SQL.
