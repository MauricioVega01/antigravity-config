---
name: totem-code-review
description: GuÃ­a de revisiÃ³n de cÃ³digo y aseguramiento de calidad para el proyecto Totem Pullman Costa.
---

# Skill: Code Review & Quality Assurance

Esta skill define la lista de verificaciÃ³n (checklist) para revisar cÃ³digo antes de fusionar o desplegar en los tÃ³tems.

## Lista de VerificaciÃ³n (Checklist)

1. **GestiÃ³n de Recursos y Limpieza**
   - [ ] Â¿Todos los `setInterval` y `setTimeout` tienen su correspondiente `clearInterval` / `clearTimeout`?
   - [ ] Â¿Se eliminan todos los `addEventListener` en `beforeDestroy` / `onUnmounted`?
   - [ ] Â¿Las conexiones WebSocket o ActionCable se desconectan al salir de la vista?

2. **UI/UX TÃ¡ctil**
   - [ ] Â¿Todos los botones interactivos miden al menos 48x48px?
   - [ ] Â¿El teclado virtual aparece y desaparece correctamente sin tapar la entrada de texto?
   - [ ] Â¿El temporizador de inactividad de 30 segundos funciona correctamente?

3. **Manejo de Errores**
   - [ ] Â¿Las llamadas a API / POS tienen bloques `try...catch`?
   - [ ] Â¿Se muestra un mensaje amigable al pasajero si falla la conexiÃ³n?

4. **CompilaciÃ³n y Build**
   - [ ] Â¿El comando `npm run build` o `vite build` finaliza exitosamente sin advertencias crÃ­ticas?

