<div align="center">

# 🗄️ Proyecto Bases de Datos I — Tienda OGA

### Equipo 30

**Diseño, modelado e implementación de una base de datos relacional para la gestión de ventas, stock y cobranzas de Tienda OGA.**

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

El sistema está orientado a la gestión de **Tienda OGA**, un comercio minorista polirrubro, y busca centralizar la información actualmente administrada mediante planillas y procesos manuales.

El proyecto contempla principalmente:

- **Gestión de catálogo y stock:** clasificación jerárquica de artículos por categorías y marcas, control del stock disponible y generación de alertas automáticas cuando el inventario alcanza el stock mínimo de reposición.
- **Gestión de clientes:** registro de datos personales, fiscales, de contacto y domicilio.
- **Ventas y comprobantes:** registro de ventas con detalle de productos, cantidades y conservación del precio unitario histórico.
- **Pagos y cobranzas:** registro de pagos parciales o combinados mediante distintos medios de pago.
- **Control operativo:** seguimiento del estado de cada venta desde su creación hasta su entrega o cancelación.

---

## 🛠️ Tecnologías

<div align="center">

| Herramienta | Rol en el Proyecto |
| :--- | :--- |
| **Microsoft SQL Server (T-SQL)** | Sistema de Gestión de Bases de Datos Relacionales (RDBMS) |
| **ERDPlus** | Herramienta de diagramación conceptual (DER) |
| **Git & GitHub** | Control de versiones y colaboración |

</div>

---

## 🎯 Estado de las etapas

| Etapa | Pregunta que responde | Producto | Ubicación en Git | Estado |
| :--- | :--- | :--- | :--- | :---: |
| **I. Requerimientos** | ¿Qué necesita el negocio? | Requerimientos + reglas | `docs/etapa-01/` | ✅ |
| **II. Modelado** | ¿Cómo representamos la información? | DER + modelo relacional + 3FN | `docs/etapa-02/` | ✅ |
| **III. Implementación** | ¿Cómo construimos la BD? | DDL + DML | `docs/etapa-03/` + `sql/ddl/` + `sql/dml/` | ✅ |
| **IV. Consultas** | ¿Cómo obtenemos información? | SQL + casos de uso | `docs/etapa-04/` + `sql/consultas/` | 🚧 |
| **V. Temas técnicos** | ¿Cómo hacemos la solución más robusta? | Procedimientos, funciones, transacciones, triggers, seguridad e índices | `docs/etapa-05/` + `sql/tecnico/` | ⏳ |

---

## 📂 Estructura del repositorio

El repositorio se organiza siguiendo la estructura establecida para el proyecto:

```text
proyecto-bd1-equipo_30/
│
├── docs/
│   ├── etapa-01/
│   ├── etapa-02/
│   ├── etapa-03/
│   ├── etapa-04/
│   └── etapa-05/
│
├── sql/
│   ├── ddl/
│   ├── dml/
│   ├── consultas/
│   └── tecnico/
│
├── modelos/
│   └── der/
│
└── README.md
```

### 📁 Descripción de carpetas

| Carpeta | Contenido |
|---|---|
| `docs/etapa-01/` | Requerimientos y reglas de negocio |
| `docs/etapa-02/` | Documentación correspondiente al modelado |
| `docs/etapa-03/` | Documentación de la implementación |
| `docs/etapa-04/` | Documentación de consultas y casos de uso |
| `docs/etapa-05/` | Documentación de temas técnicos |
| `sql/ddl/` | Scripts de definición de la base de datos |
| `sql/dml/` | Scripts de manipulación y carga de datos |
| `sql/consultas/` | Consultas SQL y casos de uso |
| `sql/tecnico/` | Procedimientos, funciones, transacciones, triggers, seguridad e índices |
| `modelos/der/` | Diagramas Entidad-Relación y archivos de modelado |
| `README.md` | Presentación y documentación general del proyecto |

---

## 🚀 Puesta en marcha

1. Clonar el repositorio.
2. Conectarse a la instancia de **SQL Server** desde **SQL Server Management Studio (SSMS)**.
3. Abrir el archivo `sql/ddl/SQLProyecto.sql`.
4. Ejecutar el script completo para crear la base de datos y sus estructuras.

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
