# Reglas de Negocio

## RN.01 - Identificación y registro de clientes

Toda venta debe estar asociada obligatoriamente a un cliente registrado mediante su número de DNI o CUIT.

De cada cliente se almacena:

- Nombre.
- Apellido o razón social.
- Número de teléfono de contacto.
- Dirección: calle, número y localidad.

El número de DNI/CUIT es único en el sistema.

## RN.02 - Organización del catálogo

Todo producto comercializado se identifica mediante un código alfanumérico único (`cod_producto`).

Cada producto pertenece de manera obligatoria a una Categoría y a una Marca, evitando redundancias en la descripción.

De cada producto se registra:

- Descripción.
- Precio de lista vigente.
- Stock actual.
- Stock mínimo de reposición.

## RN.03 - Control y descuento automático de stock

Una venta no puede confirmarse si la cantidad solicitada de un artículo supera el stock disponible en el inventario.

Al registrarse la venta, el sistema descuenta automáticamente las unidades vendidas del stock actual del producto.

Si el stock remanente resulta menor o igual al stock mínimo, el sistema marcará el producto en estado de alerta para reposición.

## RN.04 - Historial de precios unitarios en el detalle de venta

Cada venta se compone de un encabezado general y uno o varios renglones en `DETALLE_VENTA`.

En cada renglón se debe registrar obligatoriamente el precio unitario histórico de venta al momento exacto de la operación junto con la cantidad adquirida.

Las actualizaciones posteriores en el precio de lista de la tabla de productos no alterarán bajo ninguna circunstancia los montos facturados en operaciones ya asentadas.

## RN.05 - Cobranzas y múltiples medios de pago

Una venta puede cancelarse mediante uno o varios pagos utilizando los métodos habilitados por el comercio:

- Efectivo.
- Transferencia bancaria.
- Tarjeta de débito.
- Tarjeta de crédito.
- Mercado Pago.

De cada pago se registra:

- Fecha y hora.
- Método utilizado.
- Monto abonado.
- Número de comprobante o referencia.

La suma total de los pagos asignados a una venta debe coincidir exactamente con el importe final liquidado.

## RN.06 - Unicidad de ítems por venta

Una venta no puede contener renglones duplicados para un mismo producto.

Si el cliente solicita unidades adicionales de un artículo ya cargado, el sistema actualizará el campo de cantidad en el renglón correspondiente del detalle.

## RN.07 - Estado y ciclo del pedido

Cada venta cuenta con un estado operativo que refleja el ciclo de vida del pedido:

- Pendiente de pago.
- Pagado.
- Preparado.
- Entregado.
- Cancelado.

Esto permite supervisar los despachos y entregas de mercadería.
