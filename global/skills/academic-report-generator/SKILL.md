---
name: academic-report-generator
description: Generador de informes técnicos, tesis, presentaciones ejecutivas y documentos académicos bajo normas INACAP y APA 7ma edición con automatización en Word (.docx) y PDF.
---

# Generador de Informes Académicos y Técnicos INACAP

Esta skill guía la redacción, maquetación y generación automatizada de informes formales, avances de proyecto de título, entregables de asignaturas y presentaciones ejecutivas.

---

## 1. Estructura Estándar de Informes INACAP

Todo informe técnico debe estructurarse con la siguiente rigurosidad:

1. **Portada Institucional**:
   * Institución: Universidad Tecnológica de Chile INACAP
   * Área: Tecnologías de Información y Ciberseguridad
   * Carrera: Analista Programador / Ingeniería en Informática
   * Título del Proyecto / Informe
   * Asignatura y Sección
   * Nombre del Docente
   * Integrantes (Nombre completo y RUT)
   * Ciudad y Fecha (ej. Santiago, 2026)
2. **Índice de Contenidos, Índice de Tablas e Índice de Figuras**.
3. **Introducción**:
   * Contexto de la problemática abordada.
   * Justificación (por qué es necesario el desarrollo de software o la solución).
   * Alcance y limitaciones del proyecto.
4. **Objetivos**:
   * **Objetivo General**: Verbo en infinitivo (Diseñar, Desarrollar, Implementar, Evaluar) que engloba la totalidad del proyecto.
   * **Objetivos Específicos** (3 a 5 objetivos ordenados metodológicamente):
     1. Levantar y documentar requerimientos funcionales y no funcionales.
     2. Diseñar la arquitectura de software y el modelo de datos normalizado en 3FN.
     3. Construir los módulos de frontend y backend con pruebas de integración.
     4. Validar el sistema mediante pruebas de aceptación de usuario.
5. **Desarrollo Metodológico y Técnico**:
   * Metodología de desarrollo (Scrum / RUP / Cascada).
   * Requerimientos funcionales (RF) y no funcionales (RNF).
   * Modelos UML (Casos de Uso, Clases, Secuencia).
   * Diccionario de Datos y script DDL de base de datos.
   * Pruebas de software y evidencias de funcionamiento (capturas con pie de figura numerado: *Figura 1: Pantalla principal de ventas*).
6. **Conclusiones**:
   * Evaluación de cumplimiento de objetivos.
   * Dificultades encontradas y soluciones aplicadas.
   * Trabajo futuro y recomendaciones de escalabilidad.
7. **Bibliografía y Referencias (Normas APA 7ma Edición)**:
   * Formato: Apellido, Inicial. (Año). *Título del libro o artículo*. Editorial o Sitio Web. URL.

---

## 2. Automatización: Generación de Documentos Word (.docx) con Python

Cuando se solicite generar el archivo `.docx`, genera y ejecuta un script utilizando `python-docx` con estilo profesional:

```python
import docx
from docx.shared import Inches, Pt, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH

doc = docx.Document()

# Configuración de márgenes estándar (2.5 cm = ~1 pulgada)
for section in doc.sections:
    section.top_margin = Inches(1)
    section.bottom_margin = Inches(1)
    section.left_margin = Inches(1)
    section.right_margin = Inches(1)

# Título Principal
title = doc.add_paragraph()
run = title.add_run("INFORME TÉCNICO: SISTEMA INTEGRAL DE VENTAS")
run.bold = True
run.font.size = Pt(18)
run.font.name = "Calibri"
title.alignment = WD_ALIGN_PARAGRAPH.CENTER

# Párrafo con interlineado 1.5
p = doc.add_paragraph()
p.paragraph_format.line_spacing = 1.5
r = p.add_run("1. Introducción\nEl presente proyecto aborda la modernización de los puntos de venta...")
r.font.size = Pt(11)
r.font.name = "Calibri"

doc.save("Informe_INACAP.docx")
```

---

## 3. Generación de Presentaciones Ejecutivas (.pptx)

Estructura para presentaciones de defensa de proyectos:
- Diapositiva 1: Portada y presentación del equipo.
- Diapositiva 2: Planteamiento del Problema y Oportunidad de Negocio.
- Diapositiva 3: Objetivos del Proyecto.
- Diapositiva 4: Arquitectura de la Solución (Diagrama de Componentes).
- Diapositiva 5: Modelo de Base de Datos y Casos de Uso Críticos.
- Diapositiva 6: Demostración Funcional / Flujo de Navegación.
- Diapositiva 7: Resultados de Pruebas y Rendimiento.
- Diapositiva 8: Conclusiones y Retorno de Inversión (ROI).
