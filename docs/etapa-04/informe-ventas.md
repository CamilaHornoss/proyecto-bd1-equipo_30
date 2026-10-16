DOCUMENTACION TECNICA: INFORME DE VENTAS

PROYECTO: Tienda OGA
MODULO: Consultas SQL
ARCHIVO ASOCIADO: sql/consultas/informe_ventas.sql

---

1. DESCRIPCION
Esta consulta resuelve el caso de uso CU-02. Genera un reporte gerencial para analizar el rendimiento comercial y el volumen de salida de los productos del catalogo de Tienda OGA.

2. TABLAS INVOLUCRADAS
- Categorias: Clasificacion general del rubro del producto.
- Producto: Descripcion del articulo y stock disponible al momento de la consulta.
- Detalle_venta: Cantidades unitarias y montos facturados por producto.
- Venta: Valida el estado activo de la venta (estado_venta = 1).

3. ELEMENTOS DE AGREGACION UTILIZADOS
- GROUP BY: Agrupa por categoria, identificador de producto, descripcion y stock actual.
- SUM(): Calcula el acumulado total de unidades fisicas despachadas y la suma monetaria de facturacion.
- COUNT(DISTINCT v.id_venta): Cuenta la cantidad de facturas unicas en las que participo el articulo, evitando duplicados por lineas de detalle.
- CAST(AVG(...) AS DECIMAL(10,2)): Calcula el precio medio de colocacion en el mercado con formato decimal estricto.
- ORDER BY DESC: Prioriza los productos que generaron mayores ingresos economicos a la tienda.