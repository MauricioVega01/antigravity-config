---
name: pos-hardware-backend-dev
description: Guía de integración técnica para el Backend Node.js POS Transbank (transbank-pos-sdk, serialport, comunicación RS232/USB, control de transacciones y puerto serie).
---

# Skill: POS Hardware Backend Development Guide (`new-backen-local-costa`)

Esta skill proporciona las directivas técnicas para el backend de comunicación física con terminales POS Transbank en Node.js.

## 1. Integración con `transbank-pos-sdk` (v3.0.1) y `serialport` (v9.2.8)
- Inicializar el puerto serie utilizando la tasa de baudios (baudRate) adecuada según la configuración física del equipo (ej. 115200 / 9600).
- Asegurar el cierre y liberación del puerto en bloques `finally` o durante señales de cierre del proceso (`SIGINT`, `SIGTERM`).
- Manejar reconexiones automáticas si el terminal POS se desconecta físicamente o sufre pérdidas de energía.

## 2. Gestión de Estado y Tiempos de Espera (Timeouts)
- Configurar tiempos límite estrictos para solicitudes de autorización de venta, anulación y cierre de lote.
- Transmitir respuestas estructuradas al frontend mediante `responseHandler.js` indicando códigos de respuesta claros (ej. éxito `00`, cancelación `01`, timeout `99`).
- Prevenir ejecuciones concurrentes o múltiples transacciones simultáneas en el mismo puerto serie con un cerrojo de estado (mutex / busylock).

## 3. Seguridad e Idempotencia en Transacciones
- Nunca registrar o almacenar claves, PAN de tarjetas o datos de banda/chip en archivos de log.
- Generar identificadores únicos de transacción (Ticket ID / Operation ID) para evitar doble cobro por reintentos de solicitudes HTTP.
