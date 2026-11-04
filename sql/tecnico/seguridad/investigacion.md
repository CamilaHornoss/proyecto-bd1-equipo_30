# Seguridad: usuarios, permisos y roles

## 1. Definición y objetivo

La seguridad controla qué usuarios pueden acceder a los datos y qué operaciones pueden realizar.

## 2. Ventajas y aplicaciones

Permite aplicar mínimo privilegio, separar responsabilidades y proteger tablas sensibles.

## 3. Implementación

Se crean usuarios `WITHOUT LOGIN` y el rol `rol_consulta_productos`.

## 4. Caso aplicado

Se compara acceso por rol, acceso denegado e inserción directa bloqueada sobre `Venta`.

## 5. Demostración y resultados

El script usa `EXECUTE AS USER` para demostrar cada permiso.
