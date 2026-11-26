# Manual de Instalación, Configuración y Uso Portable de Antigravity

Esta guía describe cómo implementar, sincronizar y utilizar este entorno completo de agentes, directivas globales y servidores MCP en **cualquier PC** (oficina, casa, laptop) en cuestión de minutos.

---

## 1. Requisitos Previos

Antes de comenzar en una máquina nueva, asegúrate de tener instalado:
1. **Windows PowerShell 5.1** o **PowerShell 7** (incluido por defecto en Windows 10/11).
2. **Git**: [git-scm.com](https://git-scm.com/)
3. **Node.js (LTS v20+ o v24)**: [nodejs.org](https://nodejs.org/) (necesario para ejecutar los servidores MCP mediante `npx`).
4. **Google Antigravity / Gemini Code Assist** instalado y con sesión iniciada (Google AI Pro).

---

## 2. Instalación en un Nuevo PC (Paso a Paso)

### Paso 1: Clonar el Repositorio
Abre PowerShell en tu carpeta de trabajo preferida (ej. `C:\Users\TU_USUARIO\Documents`) y clona tu repositorio privado:

```powershell
cd C:\Users\$env:USERNAME\Documents
git clone https://github.com/MauricioVega01/antigravity-config.git
cd antigravity-config
```

### Paso 2: Ejecutar el Instalador Automatizado
Si Windows tiene restringida la ejecución de scripts en esa sesión de PowerShell, permite la ejecución temporalmente:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Ejecuta el script de instalación:
```powershell
# Simulación previa para ver qué hará (sin tocar nada):
.\scripts\Install-AntigravityConfig.ps1 -WhatIf

# Instalación real:
.\scripts\Install-AntigravityConfig.ps1

# Si ya existían skills locales y quieres forzar el reemplazo con backup automático:
.\scripts\Install-AntigravityConfig.ps1 -Force
```

> **¿Qué hace este script?**
> * Copia `global/AGENTS.md` a `C:\Users\TU_USUARIO\.gemini\AGENTS.md` (reglas activas en todos tus proyectos).
> * Copia todas las skills de `global/skills/` a `C:\Users\TU_USUARIO\.gemini\config\skills/`.
> * Crea copias de seguridad fechadas en `backups/` si algún archivo fue reemplazado con `-Force`.

---

## 3. Configuración de Servidores MCP (Navegador, Base de Datos, Git)

Los servidores MCP otorgan herramientas reales al modelo (abrir navegadores, consultar bases de datos, etc.). Por seguridad, sus rutas y credenciales **no se suben a GitHub** y se configuran localmente en cada PC.

### Paso 1: Copiar la Plantilla MCP
Copia el archivo de plantilla a tu perfil local de Antigravity:
```powershell
# Asegurar que el directorio config existe
New-Item -ItemType Directory -Force -Path "$HOME\.gemini\config" | Out-Null

# Copiar la plantilla MCP a tu configuración local
Copy-Item -LiteralPath ".\mcp\mcp.example.json" -Destination "$HOME\.gemini\config\mcp_config.json" -Force
```

### Paso 2: Ajustar Credenciales Locales (Opcional)
Abre el archivo generado en tu editor:
```powershell
notepad "$HOME\.gemini\config\mcp_config.json"
```

El archivo incluye los siguientes servidores listos para usar:
* **`puppeteer`**: Permite al agente abrir navegadores locales para validar UI y capturar pantallas en `localhost`.
* **`fetch`**: Búsqueda e inspección de documentación técnica y APIs web.
* **`git`**: Operaciones de inspección de ramas y logs.
* **`sequential-thinking`**: Razonamiento secuencial estructurado para problemas complejos.
* **`postgres-local`**: Conexión a tu PostgreSQL local (si tu clave local es distinta a `postgres`, cámbiala aquí).

---

## 4. Verificación del Entorno

Ejecuta el script de diagnóstico integral:
```powershell
.\scripts\Test-Configuration.ps1
```

Deberás ver una salida con indicadores verdes `[OK]`:
* `[OK] Regla Global instalada`
* `[OK] MCPs Configurados (5): puppeteer, fetch, git, sequential-thinking, postgres-local`
* `[OK] Skills Globales (55 activas)`
* `Rama activa: main` y estado del remoto.

---

## 5. Uso de Plantillas en Proyectos Específicos

Cuando clones o crees un proyecto en ese equipo, puedes inyectarle sus directivas especializadas en 1 solo comando:

### A. Para Proyectos de Tótems Pullman Costa (`Vue 2.7` / `Node Express` / `POS Transbank`)
```powershell
.\scripts\Install-TotemTemplate.ps1 -ProjectPath 'C:\Ruta\A\Tu\Proyecto-Totem'
```
* **Qué inyecta:** 
  * `AGENTS.md` en la raíz del proyecto con reglas de botones táctiles $\ge$ 48px, teclado virtual, temporizador de inactividad de 30s, mutex en el puerto serie de Transbank e impresoras ZPL/ESC-POS.
  * `.agents/skills/` con `totem-kiosk-dev`, `pos-hardware-backend-dev` y `totem-code-review`.

### B. Para Proyectos de BreakingChains (`FastAPI` / `Web Audio API`)
```powershell
.\scripts\Install-BreakingChainsTemplate.ps1 -ProjectPath 'C:\Ruta\A\BreakingChains'
```
* Inyecta reglas de renderizado de ondas de audio, SQLite y preservación de reproductores DJ.

---

## 6. Catálogo de Agentes y Skills: ¿Cómo utilizarlos?

En Antigravity no necesitas activar manualmente cada skill; el modelo detecta el contexto de tu consulta y activa automáticamente la skill adecuada. Sin embargo, puedes guiarlo mencionando el rol:

| Rol / Skill | Cómo invocarlo / Cuándo usarlo |
| :--- | :--- |
| **`git-github-expert`** | *"Revisa el diff, arma un commit convencional y redacta el Pull Request"* |
| **`jira-agile-specialist`** | *"Toma este requerimiento y transfórmalo en un Epic con User Stories y criterios Gherkin Given/When/Then"* |
| **`monday-specialist`** | *"Tengo el bug MON-452. Analiza el contexto, reproduce el error y genera el update para Monday"* |
| **`postgresql-dba`** | *"Optimiza esta consulta con EXPLAIN ANALYZE y diseña un índice CONCURRENTLY"* |
| **`principal-software-engineer`**| *"Revisa la arquitectura de este módulo bajo principios SOLID y minimiza la deuda técnica"* |
| **`gem-code-simplifier`** | *"Simplifica este archivo, reduce complejidad ciclomática y elimina código muerto sin alterar funcionalidad"* |
| **`terminal-helper`** | *"Dame el comando PowerShell para buscar procesos huérfanos o filtrar puertos en uso"* |
| **`code-review`** | *"Haz una auditoría de seguridad y revisión de calidad a este PR antes de fusionar"* |
| **`totem-code-review`** | *"Revisa este componente Vue bajo el checklist de pantallas táctiles de Pullman Costa"* |

---

## 7. Flujo de Sincronización entre Equipos (Casa ⟷ Oficina)

### Cuando hagas cambios o agregues una nueva skill en un PC:
```powershell
git status
git add .
git commit -m "feat(skills): agregar nueva skill especializada"
git push origin main
```

### Cuando llegues al otro PC:
```powershell
cd C:\Users\$env:USERNAME\Documents\antigravity-config
git pull --ff-only
.\scripts\Install-AntigravityConfig.ps1 -Force
.\scripts\Test-Configuration.ps1
```
¡Y en menos de 10 segundos tu otro equipo tendrá exactamente las mismas directivas, skills y herramientas actualizadas!
