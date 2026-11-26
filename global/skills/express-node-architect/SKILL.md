---
name: express-node-architect
description: Arquitectura Express.js HTTPS, API REST, controladores, middleware CORS, integración PostgreSQL (pg) y resolución de red local para new-backen-local-costa.
---

# Skill: Express Node Architect (`new-backen-local-costa`)

Esta skill proporciona las directivas para la arquitectura backend Express.js y API REST local.

## 1. Arquitectura HTTPS y Middleware
- Utilizar `https.createServer` cargando certificados SSL locales de `certs/server.crt` y `certs/server.key`.
- Configurar middleware de CORS restrictivo o controlado para permitir comunicación fluida con la SPA del Tótem (`totem-boletosla v2`).
- Estandarizar el parsing de payloads JSON con `body-parser` / `express.json()`.

## 2. Acceso a Base de Datos PostgreSQL (`pg` v8.20.0)
- Emplear `pg.Pool` para gestionar conexiones eficientes a la base de datos PostgreSQL.
- Utilizar siempre consultas preparadas/parametrizadas (`pool.query('SELECT * FROM users WHERE id = $1', [id])`) para prevenir inyecciones SQL.
- Implementar manejo de errores de conexión con reintentos exponenciales.

## 3. Estructura de Controladores y Rutas
- Desacoplar rutas (`posRoutes.js`), controladores (`paymentController.js`, `posController.js`), utilidades (`posConnect.js`, `responseHandler.js`) y servicios (`transbankService.js`).
- Detección dinámica de IP de red local (`getNetworkIP()`) para binding de servidores locales en la intranet del kiosco.
