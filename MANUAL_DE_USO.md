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

## 6. Catálogo de Agentes y Skills (58 Skills Categorizadas)

En Antigravity no necesitas activar manualmente cada skill; el modelo detecta el contexto de tu consulta y activa automáticamente la skill adecuada. Aquí tienes el mapa completo de capacidades:

### 🧩 A. Orquestación y Planificación de Arquitectura
* **`gem-orchestrator`**: Líder técnico orquestador. Detecta fases, descompone tareas complejas, delega en subagentes y sintetiza resultados.
* **`gem-planner`**: Diseñador de planes de ejecución en olas (`wave plans`), descomposición de tareas con dependencias y criterios de aceptación.
* **`project-architecture-planner`**: Planificador de arquitectura holística, evaluación de tech stacks, diagramas Mermaid interactivos y escalabilidad.
* **`context-architect`**: Experto en mapear dependencias y efectos dominó antes de cambios multi-archivo o grandes refactorizaciones.

### 🧪 B. Control de Calidad (QA), Testing y Analizadores
* **`qa-subagent`**: Subagente meticuloso de QA para diseño de planes de pruebas, cacería de bugs y análisis de casos borde.
* **`quality-playbook`**: Auditoría exhaustiva de calidad (fitness-to-purpose, Council of Three spec audit y parches verificados con TDD).
* **`test-gap-audit`**: **Analizador de tests**. Audita código no probado, falsas coberturas, contratos de API sin validar y pruebas obsoletas.
* **`playwright-tester`**: Modo de pruebas E2E automatizadas con Playwright en navegadores.
* **`gem-browser-tester`**: Tester E2E de flujos de usuario, regresiones visuales y accesibilidad en vivo con Puppeteer.
* **`react19-test-guardian`**: Guardián de suites de prueba. Corrige tests rotos de Jest/Vitest y no para hasta alcanzar **0 fallos**.
* **`tdd-red` / `tdd-green` / `tdd-refactor`**: Tríada estricta de Test-Driven Development (escribir prueba que falle -> código mínimo -> refactorizar).

### 🎨 C. Especialistas en Frontend
* **`expert-react-frontend-engineer`**: React 19.2, Server Components, Server Actions, modern hooks, TypeScript y optimización de renderizado.
* **`expert-nextjs-developer`**: Next.js 16, App Router, Cache Components, Turbopack y SSR de alto rendimiento.
* **`vuejs-expert`**: Vue 2.7 y Vue 3 con Vite, Vuex/Pinia y optimización de reactividad táctil.
* **`frontend-performance-investigator`**: Diagnóstico de Core Web Vitals, Lighthouse, layout shifts y tareas largas de JavaScript.
* **`premium-frontend-ui`**: Diseño de interfaces premium con microinteracciones, motion, tipografía y estética refinada.
* **`web-design-reviewer`**: Detección de fallos de maquetación, breakpoints responsivos y consistencia visual en pantallas reales.
* **`accessibility`**: Cumplimiento estricto WCAG 2.1/2.2 AA/AAA, navegación por teclado y lectores de pantalla.
* **`frontend-ux`**: Maquetación limpia en HTML/CSS/JS sin añadir dependencias innecesarias.

### ⚙️ D. Backend y Bases de Datos
* **`api-architect`**: Arquitecto de APIs RESTful resilientes (circuit breakers, rate limiting, bulkheads, DTOs y mocks).
* **`express-node-architect`**: Node.js + Express HTTPS, middlewares CORS, conexión a PostgreSQL (`pg`) y APIs locales.
* **`python-backend`**: FastAPI / Python robusto con esquemas Pydantic, manejo de async y rutas protegidas.
* **`postgresql-dba`**: DBA de PostgreSQL: `EXPLAIN ANALYZE`, creación de índices `CONCURRENTLY`, particionado y connection pooling.
* **`postgresql-optimization`**: Tipos avanzados de Postgres, JSONB, arrays, búsqueda de texto completo y window functions.
* **`postgresql-code-review`**: Revisión de código enfocada en Postgres, Row Level Security (RLS) y prevención de table locks.

### 🛡️ E. Seguridad, CI/CD y DevOps
* **`sast-sca-security-analyzer`**: Análisis estático de vulnerabilidades (SAST), dependencias (SCA) y mapeo CWE.
* **`security-review`**: Escaneo de seguridad OWASP Top 10, inyección SQL, control de acceso y datos sensibles.
* **`secret-scanning`**: Detección de tokens, llaves privadas y credenciales antes de commitear.
* **`devops-expert`**: Empaquetado offline, Vite build, servicios de Windows Kiosk (NSSM/PM2) y certificados SSL locales.
* **`github-actions-expert`**: Workflows de GitHub Actions, permisos least-privilege y OIDC.
* **`se-gitops-ci-specialist`**: Despliegues automatizados, pipelines CI/CD y estabilidad operativa.

### 🧹 F. Refactorización y Control de Deuda Técnica
* **`principal-software-engineer`**: Mentoría técnica al estilo Martin Fowler: principios SOLID, GoF y arquitectura pragmática.
* **`gem-code-simplifier`**: Eliminación de código muerto, reducción de complejidad cognitiva y guard clauses.
* **`tech-debt-remediation-plan`**: Detección y priorización de deuda técnica con matriz de impacto y riesgo (1-5).
* **`refactor`** & **`refactor-method-complexity-reduce`**: Extracción quirúrgica de métodos y refactorizaciones seguras.
* **`wg-code-alchemist`** & **`wg-code-sentinel`**: Transformación de código hacia Clean Code y guardianes de diseño.

### 📋 G. Flujo de Trabajo, Git y Gestión de Tickets
* **`git-github-expert`**: Conventional Commits, ramas protegidas, resolución de conflictos y plantillas de PR.
* **`jira-agile-specialist`**: Desglose de Epics, User Stories INVEST y criterios Gherkin (`Given/When/Then`).
* **`monday-specialist`**: Orquestación de tableros Monday.com y resolución de bugs vía IDs de pulso.
* **`terminal-helper`**: Construcción rápida de comandos PowerShell y Bash.

### 🖥️ H. Hardware & Kioscos Especializados
* **`totem-kiosk-dev`**: Integración de periféricos, pantallas táctiles, teclado virtual e impresoras térmicas ESC/POS/ZPL.
* **`pos-hardware-backend-dev`**: Comunicación serial RS232 con terminales POS Transbank (`transbank-pos-sdk`).
* **`totem-code-review`**: Checklist específico para evitar regresiones en tótems antes de desplegar a producción.

### 🎓 I. INACAP & Analista Programador (Académico, Modelamiento, Ofimática y BI)
* **`inacap-analista-programador`**: Modelamiento y diseño de software formal. Diagramas de Casos de Uso con tablas de especificación completa (Actores, Pre/Postcondiciones, Happy Path y Excepciones), Diagramas de Clases UML, Diagramas de Secuencia y Normalización de BD (1FN, 2FN, 3FN).
* **`academic-report-generator`**: Redacción y estructura formal de informes técnicos, tesis y presentaciones ejecutivas bajo normas institucionales INACAP y **citas APA 7ma edición**. Genera y exporta documentos Word (`.docx`) y presentaciones (`.pptx`) con scripts Python automatizados.
* **`excel-math-data-analyst`**: Especialista en hojas de cálculo Excel (`BUSCARX`, `INDICE+COINCIDIR`, tablas dinámicas, dashboards con `openpyxl`/`pandas`) y ciencias de la computación teóricas (álgebra booleana, simplificación por Karnaugh, notación Big O y conversión de bases binario/hexadecimal/complemento a 2).
* **`power-bi-dax-specialist`**: Inteligencia de negocios con Power BI. Modelado dimensional (Esquema Estrella Fact/Dim), fórmulas DAX avanzadas (`CALCULATE`, Time Intelligence `TOTALYTD`, `SAMEPERIODLASTYEAR`) y ETL con Power Query (M).
* **`database-sql-inacap`**: Desarrollo y administración integral de bases de datos relacionales multi-motor para INACAP: **PostgreSQL** (`PL/pgSQL`), **Oracle Database** (`PL/SQL` con cursores y excepciones) y **SQL Server** (`T-SQL` con transacciones seguras `TRY...CATCH`).

### 💼 J. Carrera Profesional, CV, Portafolios y Reclutamiento Tech
* **`cv-resume-expert`**: Redactor y optimizador de Currículum Vitae (CV) de alto impacto. Formato **ATS-Friendly** (sin tablas rotas ni gráficos ilegibles por parsers), aplicación de la **fórmula XYZ de Google** (*"Logré X, medido por Y, implementando Z"*), adaptación quirúrgica por oferta laboral y exportación a Word/PDF.
* **`portfolio-showcase-architect`**: Diseñador de portafolios web y perfiles de GitHub estelares (`username/username`). Convierte proyectos en casos de estudio de ingeniería con arquitectura Mermaid, stack, desafíos de concurrencia/hardware superados y métricas.
* **`job-search-recruiter-scout`**: Scout y mentor de postulación en portales tech (LinkedIn, Get on Board, Trabajando.com, ChileTrabajos, Indeed). Análisis de encaje (Match Score 0-100%), detección de palabras clave y redacción de **Cartas de Presentación (Cover Letters)** persuasivas.
* **`interview-prep`**: Entrenador y simulador de entrevistas técnicas y de RRHH. Práctica de preguntas conductuales con metodología **STAR**, preguntas de arquitectura/System Design en 5 pasos y asesoría en bandas y negociación salarial.
* **`linkedin-career-optimizer`**: Optimizador de perfil de LinkedIn para captar reclutadores (SEO en Titular, sección "Acerca de" con storytelling) y redactor de publicaciones técnicas de alta visibilidad con tipografía Unicode.

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
