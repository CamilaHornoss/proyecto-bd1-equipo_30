# CASOS DE USO DEL SISTEMA - ETAPA 04

PROYECTO: Tienda OGA
BASE DE DATOS: ProyectoTiendaOGA

---

1. INTRODUCCION
En esta etapa se documenta el comportamiento funcional del sistema Tienda OGA a traves de los Casos de Uso (CU) principales que requieren la recuperacion y procesamiento de datos mediante sentencias SQL.

---

2. ESPECIFICACION DE CASOS DE USO

CU-01: Generacion de Comprobante de Venta
- Actor: Vendedor / Cajero.
- Proposito: Obtener de manera estructurada los datos de un ticket de compra tras concretar una transaccion.
- Precondiciones: La venta debe existir registrada en la tabla Venta junto con sus renglones en Detalle_venta.
- Flujo Principal:
  1. El usuario selecciona o ingresa el identificador de la venta (id_venta).
  2. El sistema recupera los datos del cliente, la fecha y hora de la operacion.
  3. El sistema lista cada producto incluido, cantidad y precio unitario.
  4. El sistema totaliza los subtotales e informa las vias de cobro utilizadas (Pago).
- Archivo SQL asociado: sql/consultas/comprobante_venta.sql

CU-02: Emision de Informe Gerencial de Ventas
- Actor: Administrador / Dueno del Negocio.
- Proposito: Analizar el volumen de ventas, rotacion de articulos y recaudacion total agrupada por producto y categoria.
- Precondiciones: Deben existir ventas en estado concretado (estado_venta = 1).
- Flujo Principal:
  1. El administrador solicita el reporte de ventas del catalogo.
  2. El sistema realiza la consolidacion agrupando por categoria y articulo.
  3. Se calculan las metricas clave: unidades despachadas, recaudacion total y precio medio.
  4. Los resultados se ordenan de mayor a menor segun ingresos generados.
- Archivo SQL asociado: sql/consultas/informe_ventas.sql

CU-03: Consulta Avanzada de Clientes Destacados
- Actor: Responsable Comercial / Marketing.
- Proposito: Identificar el segmento de compradores cuyo consumo acumulado supera el promedio general de la tienda para la toma de decisiones comerciales.
- Precondiciones: Existencia de historial transaccional de ventas y clientes registrados.
- Flujo Principal:
  1. El sistema calcula el ticket promedio de compra por cliente de toda la base de datos.
  2. Filtra a aquellos clientes cuya suma acumulada de compras sea estrictamente mayor a dicho promedio.
  3. Retorna la informacion de contacto, localidad, cantidad de operaciones y monto total invertido.
- Archivo SQL asociado: sql/consultas/consulta_avanzada.sql