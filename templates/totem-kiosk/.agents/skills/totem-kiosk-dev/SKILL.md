---
name: totem-kiosk-dev
description: Guía de integración de Hardware para Totems Pullman Costa (Vue 2.7, POS Transbank, Impresoras ESC/POS / ZPL, Teclado Virtual Táctil y Screensaver Publicitario).
---

# Skill: Totem Kiosk Hardware Development Guide

Esta skill proporciona los procedimientos técnicos para interactuar con los periféricos físicos del Tótem Pullman Costa.

## 1. Integración de Impresora Térmica (`ticket.zpl` / ESC/POS)
- Validar la existencia de la conexión con la impresora antes de enviar comandos de corte o impresión.
- Utilizar plantillas ZPL (`src/lib/ticket.zpl`) o secuencias ESC/POS estructurando: Encabezado Pullman Costa, Número de Boleto, Origen/Destino, Asiento, Fecha/Hora, Tarifa, RUT del Pasajero, Código QR/Barra de validación y Pie Legal.
- Encapsular la llamada en bloques `try...finally` garantizando la liberación inmediata del recurso USB/Serie.

## 2. Pantalla Publicitaria por Inactividad (Idle ScreenSaver)
- Temporizador centralizado en `src/mixins/idleTimer.js`. Captura eventos táctiles globales (`click`, `touchstart`, `pointerdown`, `mousemove`).
- Al cumplirse el tiempo de inactividad (ej. 30 segundos), transiciona limpiamente a `<IdleAdScreenSaver />`.
- Consultar el endpoint local `https://${ipServer}:3000/api/videos/list` para reproducciones en bucle de videos MP4 locales, ahorrando ancho de banda.
- Cualquier toque en el salvapantallas restablece el flujo y regresa a la pantalla principal (`Home.vue`).

## 3. Teclado Virtual Táctil (`KeyboardTouch.vue`)
- Desplegar diseños dinámicos (`layout`):
  - **Numérico**: Para RUT y Teléfono.
  - **Alfanumérico**: Para Nombres, Apellidos y Correo Electrónico.
- Ajustar automáticamente el scroll del contenedor para que el campo enfocado permanezca completamente visible sobre el teclado.

## 4. Integración con POS Físico Transbank
- Pasar del simulador (`dev`) a la máquina física (`prod`) mediante la variable de entorno `VITE_APP_GDS_MODE`.
- En caso de cancelación por usuario, error de lectura de chip/banda o timeout en el POS, mostrar un mensaje de reintento intuitivo sin desconfigurar la selección del viaje o asiento.
