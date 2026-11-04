# Alcance

## Incluye
- Registro de clientes y datos de contacto (`dni_cliente`).
- Catálogo de productos clasificados por categoría (excluyendo gestión de marcas por no ser necesaria).
- Control del stock actual de inventario.
- Registro de proveedores y compras de abastecimiento (`COMPRA` y `DETALLE_COMPRA`).
- Registro de ventas con detalle de productos, cantidades y precio unitario histórico (`VENTA` y `DETALLE_VENTA`).
- Registro de uno o más pagos por venta asociados a distintos métodos de pago (`PAGO` y `METODO_PAGO`).
- Estados operativos de ventas y compras.
- Consultas de comprobantes, informes de ventas y análisis avanzado de clientes.

## No incluye
- Facturación electrónica integrada con ARCA / AFIP.
- Logística de terceros y seguimiento por API de envíos.
- Gestión contable integral.
- Gestión de marcas, ya que no resulta necesaria para los requerimientos mínimos de este caso.

Estos procesos secundarios continuarán gestionándose de manera administrativa interna.
