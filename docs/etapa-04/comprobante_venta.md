# DOCUMENTACION TECNICA: COMPROBANTE DE VENTA

PROYECTO: Tienda OGA
MODULO: Consultas SQL
ARCHIVO ASOCIADO: sql/consultas/comprobante_venta.sql

---

## 1. DESCRIPCION
Esta consulta satisface la necesidad transaccional del caso de uso CU-01. Resuelve la reconstruccion completa de una factura comercial a partir de un modelo relacional normalizado.

## 2. TABLAS INVOLUCRADAS
- Venta: Provee cabecera de transaccion (id_venta, fecha_venta, hora_venta).
- Cliente: Provee identidad y contacto del comprador (dni_cliente, nombre, apellido, direccion, telefono).
- Detalle_venta: Tabla asociativa con cantidades y precios historicos al momento del cobro.
- Producto: Provee descripcion del articulo comercializado.
- Pago y Metodo_pago: Provee el desglose del medio financiero utilizado (Efectivo, QR, Tarjeta).

## 3. JUSTIFICACION TECNICA DE LA CONSULTA
- Uso de INNER JOIN: Asegura que solo se devuelvan transacciones validas que tengan coherencia referencial entre cabecera, cliente y lineas de detalle.
- Calculo dinamico de subtotal: Se obtiene mediante la operacion aritmetica (dv.cantidad_venta * dv.precio_unitario), evitando almacenar subtotales redundantes en las tablas y respetando la normalizacion.
- Desacoplamiento del pago: Se implementa la consulta de pagos de forma complementaria para contemplar compras abonadas mediante multiples metodos de cobro mixtos.