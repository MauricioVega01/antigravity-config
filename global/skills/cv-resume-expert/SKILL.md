---
name: cv-resume-expert
description: Experto en redacción, optimización ATS, estructura STAR y diseño de Currículum Vitae (CV) de alto impacto para desarrolladores y profesionales IT.
---

# Especialista en CV y Currículum Vitae Tech (ATS-Friendly & STAR)

Esta skill está diseñada para transformar trayectorias académicas y laborales en currículums profesionales de alto impacto, optimizados para superar los filtros de software **ATS (Applicant Tracking Systems)** y captar la atención de reclutadores técnicos en los primeros 6 segundos de lectura.

---

## 1. Principios de Diseño ATS-Friendly

Para garantizar una lectura 100% libre de errores por los robots de selección (Workday, Taleo, Greenhouse, Lever, Get on Board):
1. **Tipografía estándar y limpia**: Arial, Calibri, Helvetica o Inter (tamaño 10 a 11pt para cuerpo, 14 a 16pt para títulos).
2. **Estructura en una sola columna**: Evitar tablas complejas, cuadros de texto flotantes, barras de habilidades en porcentaje (ej. "JavaScript 80%") o íconos gráficos que confunden al parser ATS.
3. **Encabezados estándar reconocibles**:
   - `Datos de Contacto` (Nombre, Teléfono, Correo profesional, Ciudad/País, LinkedIn, GitHub/Portafolio).
   - `Resumen Profesional` (3-4 líneas con rol, años de experiencia/formación, stack principal e impacto).
   - `Habilidades Técnicas` (Lenguajes, Frameworks, Bases de Datos, Herramientas, Metodologías).
   - `Experiencia Laboral / Proyectos Relevantes` (Cronológico inverso).
   - `Educación y Certificaciones`.
4. **Longitud**: Máximo **1 página** para perfiles Junior/Semi-Senior (o hasta 2 páginas para Senior con más de 7 años de experiencia demostrable).

---

## 2. Redacción de Impacto: Fórmula XYZ de Google & Método STAR

Nunca redactar tareas como una lista pasiva de deberes (ej. *"Hacía el backend"*). Cada punto de experiencia debe seguir la **Fórmula XYZ**:
> **"Logré [X], medido cuantitativamente por [Y], implementando [Z]"**

* ❌ **Débil**: *"Desarrollé la interfaz de un punto de venta en Vue."*
*  **Fuerte (Fórmula XYZ)**: *"Diseñé e implementé la interfaz táctil del Tótem Kiosk en Vue 2.7 y Vite, reduciendo el tiempo promedio de compra de boletos en un 35% y manteniendo una disponibilidad del 99.8% en producción."*

* ❌ **Débil**: *"Manejé bases de datos PostgreSQL y consultas."*
*  **Fuerte (Fórmula XYZ)**: *"Optimicé el esquema relacional y consultas en PostgreSQL mediante índices B-Tree/GIN, reduciendo la latencia de respuesta de la API Node.js de 450ms a menos de 80ms en horas pico."*

---

## 3. Adaptación Quirúrgica por Oferta Laboral (Tailoring)

Cuando el usuario comparta la descripción de una vacante:
1. **Extraer Palabras Clave Mandatorias**: Identificar tecnologías excluyentes, metodologías (Scrum, CI/CD) y habilidades blandas requeridas.
2. **Reordenar y Destacar**: Ajustar la sección de habilidades y los puntos de los proyectos para que las palabras clave de la oferta aparezcan en el tercio superior del CV.
3. **Calcular Porcentaje de Coincidencia (Match Score)** y alertar de vacíos que se deban justificar.

---

## 4. Exportación Automatizada (Python / Markdown)

Generar la versión final en Markdown estructurado y proveer el script Python (`python-docx` o WeasyPrint) para compilar inmediatamente el archivo `.docx` o `.pdf` listo para enviar.
