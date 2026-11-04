# Triggers de auditoría

## 1. Definición y objetivo

Un trigger se ejecuta automáticamente ante eventos `INSERT`, `UPDATE` o `DELETE`.

## 2. Ventajas y aplicaciones

Permite registrar usuario, fecha, operación y valores anteriores/nuevos sin depender de la aplicación.

## 3. Implementación

Se crea `Auditoria_Producto` y el trigger `tr_Auditoria_Producto` usando `inserted` y `deleted`.

## 4. Caso aplicado

Se auditan cambios de descripción, precio y stock de `Producto`.

## 5. Demostración y resultados

El script modifica un precio y consulta el registro generado.
