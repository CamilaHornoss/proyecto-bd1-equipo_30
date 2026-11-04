# ETAPA V — TEMAS TÉCNICOS

PROYECTO: Tienda OGA  
BASE DE DATOS: ProyectoTiendaOGA  
MOTOR: Microsoft SQL Server Express

## Objetivo

La Etapa V incorpora mecanismos avanzados de SQL Server para mejorar la robustez, confiabilidad, seguridad, trazabilidad y rendimiento de la base de datos desarrollada en las etapas anteriores.

Los cinco temas obligatorios implementados son:

1. Procedimientos y funciones almacenadas.
2. Manejo de transacciones.
3. Triggers de auditoría.
4. Seguridad mediante usuarios, permisos y roles.
5. Optimización de consultas mediante índices.

## Estructura de la Etapa V

Los temas técnicos se encuentran organizados dentro de `sql/tecnico/`:

```text
sql/
└── tecnico/
    ├── procedimientos_funciones/
    │   ├── investigacion.md
    │   ├── scripts.sql
    │   └── evidencias/
    │       └── README.md
    │
    ├── transacciones/
    │   ├── investigacion.md
    │   ├── scripts.sql
    │   └── evidencias/
    │       └── README.md
    │
    ├── triggers_auditoria/
    │   ├── investigacion.md
    │   ├── scripts.sql
    │   └── evidencias/
    │       └── README.md
    │
    ├── seguridad/
    │   ├── investigacion.md
    │   ├── scripts.sql
    │   └── evidencias/
    │       └── README.md
    │
    └── indices/
        ├── investigacion.md
        ├── scripts.sql
        └── evidencias/
            └── README.md
```

Cada tema contiene:

- `investigacion.md`: desarrollo teórico, objetivo, ventajas, implementación y caso aplicado al sistema.
- `scripts.sql`: implementación en T-SQL y pruebas correspondientes.
- `evidencias/README.md`: documentación de los resultados obtenidos durante las pruebas.

## 1. Procedimientos y funciones almacenadas

Se implementaron procedimientos almacenados para gestionar operaciones sobre productos y funciones para realizar cálculos reutilizables.

Los principales objetos desarrollados son:

- `sp_InsertarProducto`
- `sp_ModificarProducto`
- `sp_EliminarProducto`
- `fn_CalcularImporteVenta`
- `fn_CalcularTotalComprasCliente`
- `fn_CalcularDescuento`

Estas rutinas permiten centralizar lógica de negocio, reducir código repetido y reutilizar operaciones frecuentes.

## 2. Manejo de transacciones

Se implementó el procedimiento:

`sp_RegistrarVentaCompleta`

Este procedimiento permite registrar una venta de manera transaccional.

La operación realiza:

1. Verificación del cliente.
2. Verificación del producto.
3. Control de stock.
4. Registro de la venta.
5. Registro del detalle.
6. Conservación del precio histórico.
7. Actualización del stock.
8. Confirmación de la operación.

Si alguna operación falla, se ejecuta un `ROLLBACK`, evitando que queden datos parciales o inconsistentes.

La implementación utiliza:

- `BEGIN TRANSACTION`
- `COMMIT`
- `ROLLBACK`
- `TRY...CATCH`
- `XACT_ABORT`
- mecanismos de bloqueo para el control de stock.

## 3. Triggers de auditoría

Se creó una tabla de auditoría:

`Auditoria_Producto`

y un trigger:

`tr_Auditoria_Producto`

El trigger se ejecuta automáticamente ante operaciones de:

- `INSERT`
- `UPDATE`
- `DELETE`

sobre la tabla `Producto`.

La auditoría registra información como:

- producto afectado;
- tipo de operación;
- fecha y hora;
- usuario;
- descripción anterior y nueva;
- precio anterior y nuevo;
- stock anterior y nuevo.

Esto permite mantener trazabilidad sobre las modificaciones realizadas en el catálogo.

## 4. Seguridad

Se implementaron usuarios, roles y permisos para demostrar mecanismos de control de acceso en SQL Server.

Se utilizan usuarios con distintos niveles de autorización y el rol:

`rol_consulta_productos`

Las pruebas permiten comprobar:

- acceso permitido mediante roles;
- acceso denegado a usuarios sin permisos;
- restricción de operaciones directas sobre tablas;
- ejecución controlada de procedimientos almacenados.

La implementación aplica el principio de mínimo privilegio, otorgando únicamente los permisos necesarios para cada operación.

## 5. Optimización mediante índices

Se desarrolló una prueba de rendimiento utilizando una tabla técnica denominada:

`VentaHistorica`

La tabla contiene 1.000.000 de registros de prueba y permite comparar el comportamiento de una consulta en tres escenarios:

1. Sin índice específico.
2. Con índice clustered sobre `fecha_venta`.
3. Con índice nonclustered de cobertura.

Para analizar el rendimiento se utilizan:

- `SET STATISTICS TIME ON`
- `SET STATISTICS IO ON`
- planes de ejecución de SQL Server.

La prueba permite observar el impacto de los índices sobre el acceso a grandes volúmenes de datos.

## Orden de ejecución

Antes de ejecutar los scripts de la Etapa V debe estar creada y cargada la base de datos utilizando los archivos correspondientes a la Etapa III:

1. `sql/ddl/crear_bd.sql`
2. `sql/ddl/dml/datos_pruebaProyecto.sql`

Luego, los temas técnicos deben ejecutarse en el siguiente orden:

1. `sql/tecnico/procedimientos_funciones/scripts.sql`
2. `sql/tecnico/transacciones/scripts.sql`
3. `sql/tecnico/triggers_auditoria/scripts.sql`
4. `sql/tecnico/seguridad/scripts.sql`
5. `sql/tecnico/indices/scripts.sql`

El orden resulta importante debido a que algunos temas reutilizan objetos creados previamente. Por ejemplo, el módulo de Seguridad utiliza el procedimiento `sp_RegistrarVentaCompleta`.

## Resultados

Las pruebas realizadas permitieron verificar:

- reutilización de lógica mediante procedimientos y funciones;
- consistencia de operaciones mediante transacciones;
- rollback ante errores;
- auditoría automática de modificaciones;
- control de accesos mediante usuarios, roles y permisos;
- mejora del rendimiento de consultas mediante índices.

De esta manera, la Etapa V complementa el diseño e implementación de las etapas anteriores incorporando mecanismos avanzados de administración y programación de bases de datos en SQL Server.
