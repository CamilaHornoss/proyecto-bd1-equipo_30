# IMPLEMENTACION FISICA DE LA BASE DE DATOS
PROYECTO: Tienda OGA
SISTEMA DE GESTION DE BASE DE DATOS: Microsoft SQL Server
MODULO: Definicion de Datos (DDL)
ARCHIVO DE SCRIPT ASOCIADO: crear_bd.sql

1. OBJETIVO DEL DOCUMENTO
El presente documento describe la implementación física del esquema relacional para el sistema de gestión comercial de Tienda OGA. Se detallan las consideraciones de diseño, el orden jerárquico de ejecución del script crear_bd.sql y la justificación técnica de los tipos de datos y restricciones aplicadas.

2. DECISIONES DE DISEÑO TÉCNICO
2.1 Identificadores y Claves Primarias
- Claves subrogadas mediante IDENTITY(1,1): Se aplican identificadores numéricos enteros autoincrementales en tablas transaccionales y maestras (Metodo_pago, Proveedor, Categorias, Venta, Compra, Producto, Pago) para optimizar los índices y simplificar las referencias externas.
- Clave natural en Cliente: Se utiliza dni_cliente como clave primaria natural no nula, dado que identifica de forma univoca y obligatoria a los clientes dentro del ámbito operativo nacional.
- Claves primarias compuestas: Las tablas de detalle (Detalle_venta, Detalle_compra) implementan claves compuestas de dos atributos (id_producto combinado con id_venta o id_compra). Esto asegura que no se dupliquen registros para una misma combinación (por ejemplo, impedir que un mismo producto se liste dos veces dentro de la misma cabecera de venta o compra). Por su parte, la tabla Pago utiliza una clave primaria simple (id_pago) para permitir de manera flexible múltiples registros de cobro asociados a una misma venta.

2.2 Precisión Numérica y Dominios
- Precios y Montos: Se definieron con tipo DECIMAL(10,2) para evitar errores de redondeo inherentes a los tipos de coma flotante en operaciones de facturación, cobro y costos.
- Cantidades y Stock: Se definieron como INT, vinculadas a restricciones CHECK para impedir importaciones, precios y cantidades menores o iguales a cero.

3. ORDEN JERARQUICO DE EJECUCION (DEPENDENCIAS DDL)
Para evitar conflictos de integridad referencial durante la ejecución del script crear_bd.sql, las tablas deben crearse respetando estrictamente el siguiente orden por niveles:

Nivel 1: Tablas Maestras Independientes (Sin Claves Foraneas)
1. Cliente: Registro de los datos de los compradores.
2. Metodo_pago: Catálogo de formas de cobro disponibles.
3. Proveedor: Información de contacto y CUIT de proveedores mayoristas.
4. Categorias: Clasificación de los artículos del catálogo.

Nivel 2: Tablas Transaccionales y de Catálogo (Con Claves Foraneas Simples)
1. Venta: Cabecera de operaciones comerciales. Depende de Cliente mediante dni_cliente.
2. Compra: Cabecera de adquisicion de mercaderia. Depende de Proveedor mediante id_proveedor.
3. Producto: Inventario y catalogo comercial. Depende de Categorias mediante id_categoria.

Nivel 3: Tablas de Detalle y Pagos (Relaciones N:M y Dependencias Complejas)
1. Detalle_compra: Renglones adquiridos en cada compra. Depende de Producto y Compra (Clave compuesta).
2. Detalle_venta: Renglones facturados en cada transacción. Depende de Producto y Venta (Clave compuesta).
3. Pago: Cancelación financiera de ventas. Depende de Venta y Método_pago (Clave primaria simple id_pago).

4. VERIFICACION DE REGLAS DE INTEGRIDAD
El script crear_bd.sql garantiza:
- Integridad de Entidad: Claves primarias simples y compuestas definidas como NOT NULL de forma estricta.
- Integridad Referencial: Restricciones FOREIGN KEY que previenen registros huerfanos entre cabeceras, detalles y pagos.
- Integridad de Dominio: Restricciones CHECK en importaciones, precios y cantidades para asegurar valores positivos.
- Claves Alternativas: Restricciones ÚNICAS en teléfonos, CUITs y descripciones de producto para eliminar redundancias operativas.
