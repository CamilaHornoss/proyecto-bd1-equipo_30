# IMPLEMENTACION FISICA DE LA BASE DE DATOS

**PROYECTO:** Tienda OGA  
**SISTEMA DE GESTION DE BASE DE DATOS:** Microsoft SQL Server  
**MODULO:** Definicion de Datos (DDL)  
**ARCHIVO DE SCRIPT ASOCIADO:** crear_bd.sql  

---

## 1. OBJETIVO DEL DOCUMENTO

El presente documento describe la implementacion fisica del esquema relacional para el sistema de gestion comercial de Tienda OGA. Se detallan las consideraciones de diseno, el orden jerarquico de ejecucion del script crear_bd.sql y la justificacion tecnica de los tipos de datos y restricciones aplicadas.

## 2. DECISIONES DE DISENO TECNICO

### 2.1 Identificadores y Claves Primarias

- Claves subrogadas mediante IDENTITY(1,1): Se aplicaron identificadores numericos enteros autoincrementales en tablas transaccionales y maestras (Metodo_pago, Proveedor, Categorias, Venta, Compra, Producto) para optimizar los indices y simplificar las referencias externas.
- Clave natural en Cliente: Se utilizo dni_cliente como clave primaria natural no nula, dado que identifica de forma univoca y obligatoria a los clientes dentro del ambito operativo nacional.
- Claves primarias compuestas: Las tablas de detalle (Detalle_venta, Detalle_compra) y la tabla Pago implementan claves compuestas de dos atributos. Esto asegura que no se dupliquen registros para una misma combinacion (por ejemplo, impedir que un mismo producto se liste dos veces dentro de la misma cabecera de venta o compra).

### 2.2 Precision Numerica y Dominios

- Precios y Montos: Se definieron con tipo DECIMAL(10,2) para evitar errores de redondeo inherentes a los tipos de coma flotante en operaciones de facturacion y cobro.
- Cantidades y Stock: Se definieron como INT, vinculadas a restricciones CHECK para impedir importes y cantidades menores o iguales a cero.

## 3. ORDEN JERARQUICO DE EJECUCION (DEPENDENCIAS DDL)

Para evitar conflictos de integridad referencial durante la corrida del script crear_bd.sql, las tablas deben crearse respetando estrictamente el siguiente orden por niveles:

### Nivel 1: Tablas Maestras Independientes (Sin Claves Foraneas)

1. Cliente: Registra los datos de los compradores.
2. Metodo_pago: Catalogo de formas de cobro disponibles.
3. Proveedor: Informacion de contacto y CUIT de proveedores mayoristas.
4. Categorias: Clasificacion de los articulos del catalogo.

### Nivel 2: Tablas Transaccionales y de Catalogo (Con Claves Foraneas Simples)

5. Venta: Cabecera de operaciones comerciales. Depende de Cliente mediante dni_cliente.
6. Compra: Cabecera de adquisicion de mercaderia. Depende de Proveedor mediante id_proveedor.
7. Producto: Inventario y catalogo comercial. Depende de Categorias mediante id_categoria.

### Nivel 3: Tablas de Detalle y Pagos (Relaciones N:M y Claves Compuestas)

8. Detalle_compra: Renglones adquiridos en cada compra. Depende de Producto y Compra.
9. Detalle_venta: Renglones facturados en cada transaccion. Depende de Producto y Venta.
10. Pago: Cancelacion financiera de ventas. Depende de Venta y Metodo_pago.

## 4. VERIFICACION DE REGLAS DE INTEGRIDAD

El script crear_bd.sql garantiza:

- Integridad de Entidad: Claves primarias simples y compuestas definidas como NOT NULL de forma estricta.
- Integridad Referencial: Restricciones FOREIGN KEY que previenen registros huerfanos entre cabeceras y detalles.
- Integridad de Dominio: Restricciones CHECK en importes y cantidades para asegurar valores positivos.
- Claves Alternativas: Restricciones UNIQUE en telefonos, CUITs y descripciones de producto para eliminar redundancias operativas.
