# Reglas de Negocio

## RN.01 - Identificación y registro de clientes

Toda venta debe estar asociada obligatoriamente a un cliente registrado mediante su número de documento (`dni_cliente`).

De cada cliente se almacena:

- DNI (Clave primaria).
- Nombre.
- Apellido.
- Número de teléfono de contacto (`telefono_cliente`).
- Dirección: calle, altura y localidad.

El número de DNI es único en el sistema.

## RN.02 - Organización del catálogo

Todo producto comercializado se identifica mediante un código numérico autoincremental (`id_producto`).

Cada producto pertenece de manera obligatoria a una Categoría, evitando redundancias en la descripción. No se gestionan marcas.

De cada producto se registra:

- Descripción.
- Precio de lista vigente.
- Precio de costo de referencia.
- Stock actual disponible.

## RN.03 - Control y descuento automático de stock

Una venta no puede confirmarse si la cantidad solicitada de un artículo supera el stock disponible en el inventario.

Al registrarse la venta, el sistema descuenta automáticamente las unidades vendidas del stock actual del producto.

## RN.04 - Historial de precios unitarios en el detalle de venta y compra

Cada venta se compone de un encabezado general y uno o varios renglones en `DETALLE_VENTA`. 
Del mismo modo, cada compra a proveedores cuenta con un encabezado en `COMPRA` y renglones en `DETALLE_COMPRA`.

En cada renglón de venta se debe registrar obligatoriamente el precio unitario histórico al momento exacto de la operación junto con la cantidad adquirida. En los renglones de compra se registra el `precio_unitario_compra`.

Las actualizaciones posteriores en los precios no alterarán bajo ninguna circunstancia los montos de operaciones ya asentadas.

## RN.05 - Cobranzas y múltiples medios de pago

Una venta puede cancelarse mediante uno o varios pagos utilizando los métodos habilitados por el comercio (Efectivo, Transferencia / QR, Tarjeta de Crédito, etc.).

De cada pago se registra:

- Fecha y hora.
- Método utilizado.
- Monto abonado.
- Número de referencia o comprobante.

## RN.06 - Unicidad de ítems por venta o compra

Una venta o compra no puede contener renglones duplicados para un mismo producto (validado por su clave primaria compuesta en las tablas de detalle).

## RN.07 - Ciclo de operaciones y gestión de proveedores

El sistema contempla la relación con proveedores (`PROVEEDOR`), permitiendo registrar órdenes de abastecimiento (`COMPRA`) vinculadas a un proveedor específico, manteniendo el control de la trazabilidad comercial de entrada y salida de mercadería.
