# Totem Pullman Costa Workspace Rules

## 1. Arquitectura y Tecnologías
- **Frontend Kiosk**: Vue 2.7 + Vite (`@vitejs/plugin-vue2`), Vuex (`vuex-persistedstate`), Vue Router.
- **Backend Local**: Node.js / Express HTTPS (`new-backen-local-costa`), PostgreSQL (`pg`), `serialport` (v9.x), `transbank-pos-sdk` (v3.x).
- **Periféricos de Hardware**: Terminal POS Transbank físico (RS232/USB), Impresoras térmicas de boletos (ESC/POS / ZPL).

## 2. Directivas Críticas de Hardware y UI Táctil
- **Tamaño de Controles Táctiles**: Todo elemento interactivo (botones, inputs, selecciones) debe medir al menos 48x48px con espaciado amplio para uso táctil de pasajeros.
- **Teclado Virtual (`KeyboardTouch.vue`)**:
  - Validar siempre que el layout (Numérico para RUT/Teléfono, Alfanumérico para Nombres/Email) se active según el campo.
  - Asegurar el auto-scroll para evitar que el teclado cubra el campo activo.
- **Salvapantallas por Inactividad (`IdleScreenSaver`)**:
  - Respetar el temporizador centralizado (30 segundos). No alterar la lógica de reseteo ante toques globales.
- **Transbank POS & Manejo de Conexión Serial**:
  - Proteger el puerto serie con mutex/busylock para impedir transacciones concurrentes simultáneas.
  - Tiempos de espera (timeouts) estrictos con manejo seguro de desconexión y liberación de recursos en bloques `finally`.
  - Jamás registrar datos de tarjetas, PAN, CVV ni pistas magnéticas en logs ni archivos temporales.

## 3. Pruebas y Validación antes de Desplegar
- Validar siempre con `npm run build` o `vite build` que no existan errores de empaquetado.
- En entorno `dev`, utilizar los simuladores correspondientes sin alterar la lógica de producción (`VITE_APP_GDS_MODE`).
- Probar el flujo completo: Selección de origen/destino -> Asiento -> Datos pasajero -> Pago POS -> Emisión e impresión de boleto.
