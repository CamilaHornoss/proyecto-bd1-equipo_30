<div align="center">

# 🗄️ Proyecto Bases de Datos I — Tienda OGA

### Equipo 30

**Diseño, modelado e implementación de una base de datos relacional para la gestión de ventas, stock, compras y cobranzas de Tienda OGA.**

<br>

[![Last Commit](https://img.shields.io/github/last-commit/CamilaHornoss/proyecto-bd1-equipo_30?style=for-the-badge&logo=git&logoColor=white&color=7c3aed)](https://github.com/CamilaHornoss/proyecto-bd1-equipo_30/commits/main)
[![Commits](https://img.shields.io/github/commit-activity/t/CamilaHornoss/proyecto-bd1-equipo_30?style=for-the-badge&logo=github&logoColor=white&color=10b981)](https://github.com/CamilaHornoss/proyecto-bd1-equipo_30/commits/main)
![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-CC292B?style=for-the-badge&logo=databricks&logoColor=white)
![ERDPlus](https://img.shields.io/badge/ERDPlus-Modelado%20DER-0ea5e9?style=for-the-badge&logo=diagramsdotnet&logoColor=white)
![GitHub](https://img.shields.io/badge/Git%20%26%20GitHub-Control%20de%20versiones-181717?style=for-the-badge&logo=github&logoColor=white)

<br>
</div>

---

![Infografía Tienda OGA](https://github.com/user-attachments/assets/28ef8640-dde2-497b-95b0-6c0df0e6ea0b)

---

## 📖 Sobre el proyecto

Proyecto integrador de la asignatura **Bases de Datos I**, realizado por el **Equipo 30**.

El sistema está orientado a la gestión de **Tienda OGA**, un comercio minorista polirrubro dedicado a la venta de artículos de tecnología, seguridad, iluminación, ferretería y hogar.

Actualmente parte de la información del negocio se administra mediante planillas y registros manuales. El proyecto propone centralizar esa información mediante una base de datos relacional que permita mantener datos consistentes, trazables y organizados.

El proyecto contempla principalmente:

- **Gestión de clientes:** registro de DNI, nombre, apellido, teléfono y domicilio.
- **Gestión de categorías y productos:** clasificación de productos por categoría, registro de precios y control del stock actual.
- **Gestión de proveedores:** almacenamiento de datos de proveedores vinculados al abastecimiento del comercio.
- **Gestión de compras:** registro de órdenes de compra y detalle de los productos adquiridos a cada proveedor.
- **Ventas y comprobantes:** registro de ventas con detalle de productos, cantidades y conservación del precio unitario histórico.
- **Pagos y cobranzas:** registro de uno o más pagos por venta asociados a diferentes métodos de pago.
- **Estados operativos:** seguimiento de los estados correspondientes a las operaciones de compra y venta.
- **Consultas e informes:** generación de comprobantes, informes de ventas y consultas avanzadas.
- **Temas técnicos:** implementación de procedimientos, funciones, transacciones, triggers de auditoría, seguridad e índices.

---

## 🛠️ Tecnologías

<div align="center">

| Herramienta | Rol en el Proyecto |
| :--- | :--- |
| **Microsoft SQL Server (T-SQL)** | Sistema de Gestión de Bases de Datos Relacionales (RDBMS) |
| **SQL Server Management Studio (SSMS)** | Desarrollo, ejecución y validación de scripts |
| **ERDPlus** | Herramienta de diagramación conceptual (DER) |
| **Git & GitHub** | Control de versiones y colaboración |

</div>

---

## 🎯 Estado de las etapas

| Etapa | Pregunta que responde | Producto | Ubicación en Git | Estado |
| :--- | :--- | :--- | :--- | :---: |
| **I. Requerimientos** | ¿Qué necesita el negocio? | Descripción + alcance + reglas de negocio | `docs/etapa-01/` | ✅ |
| **II. Modelado** | ¿Cómo representamos la información? | DER + modelo relacional + 3FN | `docs/etapa-02/` | ✅ |
| **III. Implementación** | ¿Cómo construimos la BD? | DDL + DML + restricciones + validaciones | `docs/etapa-03/` + `sql/ddl/` + `sql/dml/` | ✅ |
| **IV. Consultas** | ¿Cómo obtenemos información? | SQL + casos de uso | `docs/etapa-04/` + `sql/consultas/` | ✅ |
| **V. Temas técnicos** | ¿Cómo hacemos la solución más robusta? | Procedimientos, funciones, transacciones, triggers, seguridad e índices | `docs/etapa-05/` + `sql/tecnico/` | ✅ |

---

## 📂 Estructura del repositorio

El repositorio se organiza siguiendo las etapas establecidas para el proyecto:

```text
proyecto-bd1-equipo_30/
│
├── docs/
│   ├── etapa-01/
│   │   ├── alcance.md
│   │   ├── decisiones-diseno.md
│   │   ├── descripcion-caso.md
│   │   └── reglas-negocio.md
│   │
│   ├── etapa-02/
│   │   ├── der/
│   │   │   └── der-etapa02.png
│   │   ├── Proyecto_etapa2.png
│   │   ├── decisiones-de-diseño.md
│   │   ├── modelo_relacional.md
│   │   └── normalizacion.md
│   │
│   ├── etapa-03/
│   │   ├── implementacion.md
│   │   ├── pruebas-validacion.md
│   │   └── restricciones_de_integridad_tienda_oga.md
│   │
│   ├── etapa-04/
│   │   ├── casos-uso.md
│   │   ├── comprobante_venta.md
│   │   ├── consulta-avanzada.md
│   │   └── informe-ventas.md
│   │
│   └── etapa-05/
│       └── README.md
│
├── sql/
│   ├── ddl/
│   │   ├── crear_bd.sql
│   │   └── implementacion_fisica_tienda_oga.md
│   │
│   ├── dml/
│   │   └── datos_pruebaProyecto.sql
│   │
│   ├── consultas/
│   │   ├── comprobante_venta.sql
│   │   ├── consulta_avanzada.sql
│   │   └── informe_ventas.sql
│   │
│   └── tecnico/
│       ├── procedimientos_funciones/
│       │   ├── investigacion.md
│       │   ├── scripts.sql
│       │   └── evidencias/
│       │       └── README.md
│       │
│       ├── transacciones/
│       │   ├── investigacion.md
│       │   ├── scripts.sql
│       │   └── evidencias/
│       │       └── README.md
│       │
│       ├── triggers_auditoria/
│       │   ├── investigacion.md
│       │   ├── scripts.sql
│       │   └── evidencias/
│       │       └── README.md
│       │
│       ├── seguridad/
│       │   ├── investigacion.md
│       │   ├── scripts.sql
│       │   └── evidencias/
│       │       └── README.md
│       │
│       └── indices/
│           ├── investigacion.md
│           ├── scripts.sql
│           └── evidencias/
│               └── README.md
│
└── README.md
```

---

## 📁 Descripción de carpetas

| Carpeta | Contenido |
|---|---|
| `docs/etapa-01/` | Descripción del caso, alcance, reglas de negocio y decisiones iniciales |
| `docs/etapa-02/` | DER, modelo relacional, normalización y decisiones de diseño |
| `docs/etapa-03/` | Documentación correspondiente a la implementación física y validaciones |
| `docs/etapa-04/` | Documentación de consultas y casos de uso |
| `docs/etapa-05/` | Documentación general de los temas técnicos |
| `sql/ddl/` | Script de creación de la base de datos, tablas, claves y restricciones |
| `sql/dml/` | Carga de datos de prueba |
| `sql/consultas/` | Comprobante de venta, informe de ventas y consulta avanzada |
| `sql/tecnico/procedimientos_funciones/` | Procedimientos y funciones almacenadas |
| `sql/tecnico/transacciones/` | Manejo de transacciones y control de stock |
| `sql/tecnico/triggers_auditoria/` | Triggers y mecanismos de auditoría |
| `sql/tecnico/seguridad/` | Usuarios, roles y permisos |
| `sql/tecnico/indices/` | Optimización de consultas mediante índices |
| `README.md` | Presentación y documentación general del proyecto |

---

## 🗃️ Modelo de datos

El modelo relacional de Tienda OGA se encuentra normalizado hasta **Tercera Forma Normal (3FN)**.

El esquema está compuesto por las siguientes relaciones:

- `Categorias`
- `Producto`
- `Proveedor`
- `Compra`
- `Detalle_compra`
- `Cliente`
- `Venta`
- `Detalle_venta`
- `Metodo_pago`
- `Pago`

Las tablas `Detalle_compra` y `Detalle_venta` permiten resolver las relaciones entre productos y operaciones.

Los precios aplicados en cada compra y venta se almacenan en las tablas de detalle, permitiendo conservar el valor histórico de cada operación independientemente de modificaciones posteriores en los precios actuales del producto.

La tabla `Pago` permite registrar uno o varios pagos asociados a una misma venta y relacionarlos con los distintos métodos almacenados en `Metodo_pago`.

---

## 📋 Etapa I — Requerimientos

Durante la primera etapa se realizó el análisis inicial del problema.

Se documentaron:

- descripción del caso;
- alcance del sistema;
- reglas de negocio;
- decisiones iniciales de diseño.

El alcance incluye clientes, productos, categorías, proveedores, compras, ventas, pagos, métodos de pago, stock y consultas de gestión.

Se excluyen procesos como facturación electrónica integrada con ARCA/AFIP, logística externa, gestión contable integral y gestión de marcas.

---

## 🧩 Etapa II — Modelado

La segunda etapa corresponde al diseño conceptual y lógico de la base de datos.

Se desarrollaron:

- Diagrama Entidad-Relación.
- Modelo relacional.
- Diccionario de datos.
- Claves primarias.
- Claves foráneas.
- Restricciones de integridad referencial.
- Proceso de normalización hasta 3FN.
- Justificación de las principales decisiones de diseño.

La estructura resultante busca minimizar redundancias y mantener correctamente las dependencias entre los datos.

---

## 🏗️ Etapa III — Implementación

La implementación física se realizó utilizando **Microsoft SQL Server y T-SQL**.

El script principal:

`sql/ddl/crear_bd.sql`

crea:

- la base de datos `ProyectoTiendaOGA`;
- tablas;
- claves primarias;
- claves foráneas;
- restricciones `UNIQUE`;
- restricciones `CHECK`;
- relaciones entre las entidades.

Los datos de prueba se encuentran en:

`sql/dml/datos_pruebaProyecto.sql`

Este archivo carga información de:

- clientes;
- métodos de pago;
- proveedores;
- categorías;
- productos;
- compras;
- detalles de compra;
- ventas;
- detalles de venta;
- pagos.

También incluye consultas de validación para controlar la cantidad de registros y verificar la relación entre importes de ventas y pagos.

---

## 🔎 Etapa IV — Consultas

La Etapa IV incorpora consultas SQL destinadas a resolver necesidades concretas del negocio.

### Comprobante de venta

Archivo:

`sql/consultas/comprobante_venta.sql`

Permite recuperar información relacionada con una venta:

- número de comprobante;
- fecha y hora;
- datos del cliente;
- productos;
- cantidades;
- precios históricos;
- subtotales;
- total de la operación;
- métodos de pago.

### Informe de ventas

Archivo:

`sql/consultas/informe_ventas.sql`

Utiliza:

- `INNER JOIN`;
- `GROUP BY`;
- `SUM`;
- `COUNT`;
- `AVG`;
- filtros por estado;
- filtros por rango de fechas;
- `ORDER BY`.

Permite analizar productos, categorías, unidades vendidas y recaudación.

### Consulta avanzada

Archivo:

`sql/consultas/consulta_avanzada.sql`

Combina:

- múltiples tablas;
- funciones de agregación;
- agrupamientos;
- `HAVING`;
- subconsultas.

Su objetivo es identificar clientes cuyo consumo acumulado supera el promedio calculado a partir de las ventas registradas.

---

## ⚙️ Etapa V — Temas técnicos

La Etapa V incorpora mecanismos avanzados de SQL Server destinados a mejorar la robustez, confiabilidad, seguridad, trazabilidad y rendimiento de la solución.

Los temas desarrollados son:

### 1. Procedimientos y funciones almacenadas

Ubicación:

`sql/tecnico/procedimientos_funciones/`

Se implementan procedimientos para realizar operaciones controladas sobre productos:

- `sp_InsertarProducto`
- `sp_ModificarProducto`
- `sp_EliminarProducto`

También se implementan funciones reutilizables:

- `fn_CalcularImporteVenta`
- `fn_CalcularTotalComprasCliente`
- `fn_CalcularDescuento`

Estas rutinas permiten centralizar lógica de negocio y reducir código repetido.

### 2. Manejo de transacciones

Ubicación:

`sql/tecnico/transacciones/`

Se implementa:

`sp_RegistrarVentaCompleta`

El procedimiento permite:

1. verificar la existencia del cliente;
2. verificar el producto;
3. controlar el stock;
4. registrar la venta;
5. registrar su detalle;
6. conservar el precio histórico;
7. descontar el stock;
8. confirmar la operación.

Se utilizan mecanismos como:

- `BEGIN TRANSACTION`;
- `COMMIT`;
- `ROLLBACK`;
- `TRY...CATCH`;
- `XACT_ABORT`;
- bloqueo del registro de producto durante el control de stock.

Si alguna operación falla, la transacción se revierte evitando registros parciales.

### 3. Triggers de auditoría

Ubicación:

`sql/tecnico/triggers_auditoria/`

Se implementa una tabla de auditoría y un trigger asociado a `Producto`.

La auditoría permite registrar:

- producto afectado;
- tipo de operación;
- fecha y hora;
- usuario;
- valores anteriores;
- valores nuevos.

De esta manera se mantiene trazabilidad sobre modificaciones realizadas en el catálogo.

### 4. Seguridad

Ubicación:

`sql/tecnico/seguridad/`

Se implementan:

- usuarios;
- roles;
- permisos;
- restricciones de acceso.

Las pruebas permiten demostrar la diferencia entre usuarios autorizados y no autorizados y aplicar el principio de mínimo privilegio.

También se demuestra que un usuario puede recibir permiso para ejecutar un procedimiento almacenado sin necesidad de obtener permisos directos de modificación sobre las tablas.

### 5. Optimización mediante índices

Ubicación:

`sql/tecnico/indices/`

Se analiza el efecto de los índices sobre consultas aplicadas a un volumen elevado de información.

La prueba utiliza una tabla técnica denominada:

`VentaHistorica`

con **1.000.000 de registros**.

Se comparan tres escenarios:

1. consulta sin índice específico;
2. índice clustered sobre `fecha_venta`;
3. índice nonclustered de cobertura.

Para analizar el rendimiento se utilizan:

- `SET STATISTICS TIME ON`;
- `SET STATISTICS IO ON`;
- planes de ejecución de SQL Server.

Esto permite observar cómo los índices pueden reducir el trabajo realizado por el motor durante una consulta.

---

## 🚀 Puesta en marcha

### 1. Clonar el repositorio

Clonar o descargar el proyecto desde GitHub.

### 2. Conectarse a SQL Server

Abrir **SQL Server Management Studio (SSMS)** y conectarse a una instancia de SQL Server.

### 3. Crear la base de datos

Ejecutar:

`sql/ddl/crear_bd.sql`

Este script crea la base:

`ProyectoTiendaOGA`

junto con sus tablas, claves, relaciones y restricciones.

### 4. Cargar datos de prueba

Ejecutar:

`sql/dml/datos_pruebaProyecto.sql`

### 5. Ejecutar consultas

Los scripts correspondientes a la Etapa IV se encuentran en:

`sql/consultas/`

### 6. Ejecutar temas técnicos

Los scripts correspondientes a la Etapa V se encuentran en:

`sql/tecnico/`

El orden recomendado es:

1. `sql/tecnico/procedimientos_funciones/scripts.sql`
2. `sql/tecnico/transacciones/scripts.sql`
3. `sql/tecnico/triggers_auditoria/scripts.sql`
4. `sql/tecnico/seguridad/scripts.sql`
5. `sql/tecnico/indices/scripts.sql`

---

## 👥 Integrantes

<div align="center">

### Grupo 30

| Integrante | Usuario de GitHub |
| :--- | :--- |
| **Christian Gabriel Jesús Gómez** | [@Chris10TS](https://github.com/Chris10TS) |
| **Camila Paloma Hornos** | [@CamilaHornoss](https://github.com/CamilaHornoss) |
| **Selenia Agustina Gómez** | [@seleniagomez](https://github.com/seleniagomez) |
| **Camila Hernández González** | [@CamilaHernande7](https://github.com/CamilaHernande7) |
| **Bruno Fabricio González Oviedo** | [@FabricioGonzalez99](https://github.com/FabricioGonzalez99) |

</div>

---

<div align="center">

⭐ **Bases de Datos I — Tienda OGA · Equipo 30** ⭐

</div>
