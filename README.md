# antigravity-config — entorno portable para Windows

Plantilla privada de configuracion global de Antigravity, versionable y utilizable en PC de casa y PC de oficina (solo cuando las politicas de la oficina lo permitan).

## Que instala
- `global/AGENTS.md` -> `%USERPROFILE%\.gemini\AGENTS.md` (reglas globales siempre activas con soporte Mermaid y prevención de regresiones).
- `global/skills/*/SKILL.md` -> `%USERPROFILE%\.gemini\config\skills\<skill>\SKILL.md` (skills globales curadas para Git, GitHub, Jira, Monday, Python, DevOps, etc.).
- `templates/breakingchains/` opcional: `AGENTS.md` y `.agents/skills/` en la raiz de BreakingChains.
- `templates/totem-kiosk/` opcional: `AGENTS.md` y `.agents/skills/` en la raiz de proyectos Totem Pullman Costa.
- `mcp/mcp.example.json`: Plantilla de servidores MCP (Puppeteer, Fetch, PostgreSQL).
- No copia MCP con credenciales privadas, tokens, sesiones, settings del IDE ni datos sensibles.

## Requisitos
Windows PowerShell 5.1 o PowerShell 7; Git opcional (necesario si quieres sincronizar con GitHub). No requiere permisos de administrador.

## Primera instalacion (desde PowerShell, dentro de la carpeta del repositorio)
```powershell
.\scripts\Install-AntigravityConfig.ps1 -WhatIf
.\scripts\Install-AntigravityConfig.ps1
.\scripts\Test-Configuration.ps1
```

Si Windows bloquea la ejecucion, utiliza **solo para esa sesion**:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
Revisa el script antes. No cambies la politica global.

Si ya tienes reglas/skills, el script **omite conflictos**. Para reemplazarlos con copia de seguridad local dentro de `backups/`:
```powershell
.\scripts\Install-AntigravityConfig.ps1 -Force
```

## BreakingChains (opcional, solo si quieres instalar sus reglas dentro del proyecto)
```powershell
.\scripts\Install-BreakingChainsTemplate.ps1 -ProjectPath 'D:\DJ RADIO IA' -WhatIf
.\scripts\Install-BreakingChainsTemplate.ps1 -ProjectPath 'D:\DJ RADIO IA'
```
Si ya existe un AGENTS.md no se sobreescribe salvo `-Force`.

## Totem Pullman Costa (opcional, para backend o frontends de Totem)
```powershell
.\scripts\Install-TotemTemplate.ps1 -ProjectPath 'C:\Users\WIT2026\Documents\new-backen-local-costa' -WhatIf
.\scripts\Install-TotemTemplate.ps1 -ProjectPath 'C:\Users\WIT2026\Documents\new-backen-local-costa'
```
Inyecta reglas de hardware (POS Transbank, impresoras ESC/POS/ZPL, teclado táctil, idle timer) y skills correspondientes en `.agents/skills`.

## GitHub — configuracion en cualquier PC
1. Crea manualmente en GitHub un repositorio **privado** llamado `antigravity-config`.
2. Desde la carpeta descomprimida, inicializa Git y enlaza TU URL real:
```powershell
git init
git add .
git status
git commit -m "Initial portable Antigravity configuration"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/antigravity-config.git
git push -u origin main
```
3. En el segundo PC, clona y ejecuta instalacion:
```powershell
git clone https://github.com/TU_USUARIO/antigravity-config.git
cd antigravity-config
.\scripts\Install-AntigravityConfig.ps1
.\scripts\Test-Configuration.ps1
```
4. Para actualizar las reglas en otro PC:
```powershell
git pull --ff-only
.\scripts\Install-AntigravityConfig.ps1 -Force
```
`-Force` crea copias de seguridad solo para los archivos que reemplaza. Usa `git status` antes de hacer cambios y revisa el diff antes de subirlos.

## Que NO se sincroniza
- Inicio de sesion Google, estado del agente, conversaciones o modelos disponibles.
- MCP con secretos y OAuth, extensiones, instalaciones de Node/Python, rutas locales y preferencias particulares del editor.
- Bases de datos, bibliotecas musicales ni archivos privados.
- Sincroniza tu **configuracion declarativa**, no tu cuenta de Google o las credenciales de cada PC.

## MCP
Gestiona MCP desde las preferencias del IDE en cada PC; consulta `mcp/README.md`. Evita commitear el archivo `mcp_config.json` incluso en repositorios privados.

## Resolucion de problemas
- Si las skills no aparecen, usa el panel del agente -> Customizations -> Skills. Reinicia/reabre el IDE y verifica la version instalada.
- Revisa si `~/.gemini/AGENTS.md` ya existia: el script lo conserva por defecto.
- No apuntes el instalador a carpetas de red no confiables ni ejecutes un script modificado por terceros.

Documentacion: https://antigravity.google/docs/rules/ y https://antigravity.google/docs/skills
