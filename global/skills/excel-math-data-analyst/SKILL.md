---
name: excel-math-data-analyst
description: Experto en planillas Excel automatizadas (fórmulas avanzadas, tablas dinámicas), cálculos matemáticos de informática (álgebra booleana, Big O, bases numéricas) y análisis de datos.
---

# Especialista en Excel, Cálculos Matemáticos y Análisis de Datos

Esta skill cubre todas las necesidades de cálculo matemático, lógica proposicional, ciencias de la computación y gestión de datos en hojas de cálculo.

---

## 1. Hojas de Cálculo Excel Avanzadas

### Fórmulas Esenciales y su Sintaxis:
* **`BUSCARX` / `XLOOKUP`**:
  `=BUSCARX(valor_buscado; matriz_buscada; matriz_devuelta; [si_no_se_encuentra]; [modo_de_coincidencia])`
* **`INDICE + COINCIDIR`**:
  `=INDICE(rango_resultado; COINCIDIR(valor_buscado; rango_busqueda; 0))`
* **`SI.CONJUNTO`**:
  `=SI.CONJUNTO(A2>90; "Excelente"; A2>=70; "Aprobado"; A2<70; "Reprobado")`
* **`SUMAR.SI.CONJUNTO` / `CONTAR.SI.CONJUNTO`**:
  `=SUMAR.SI.CONJUNTO(rango_suma; rango_criterio1; ">=1000"; rango_criterio2; "Pagado")`

### Generación Automatizada con Python (`openpyxl` / `pandas`):
```python
import openpyxl
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side

wb = openpyxl.Workbook()
ws = wb.active
ws.title = "Resumen Ventas Totem"

# Encabezados con formato ejecutivo
headers = ["ID Transacción", "Fecha", "Medio Pago", "Monto CLP", "Estado"]
ws.append(headers)

header_fill = PatternFill(start_color="1F497D", end_color="1F497D", fill_type="solid")
header_font = Font(name="Calibri", size=11, bold=True, color="FFFFFF")

for col_num in range(1, len(headers) + 1):
    cell = ws.cell(row=1, column=col_num)
    cell.fill = header_fill
    cell.font = header_font
    cell.alignment = Alignment(horizontal="center", vertical="center")

# Datos de ejemplo
ws.append(["TX-1001", "2026-11-26", "Transbank Débito", 4500, "Aprobado"])
ws.append(["TX-1002", "2026-11-26", "Transbank Crédito", 8900, "Aprobado"])

# Fórmula de totalización automática
ws["C4"] = "TOTAL:"
ws["C4"].font = Font(bold=True)
ws["D4"] = "=SUM(D2:D3)"
ws["D4"].font = Font(bold=True)

wb.save("Reporte_Ventas_Kiosk.xlsx")
```

---

## 2. Cálculos Matemáticos e Informática Teórica

### Álgebra Booleana y Tablas de Verdad:
* Leyes de De Morgan:
  $$\overline{A \cdot B} = \overline{A} + \overline{B}$$
  $$\overline{A + B} = \overline{A} \cdot \overline{B}$$
* Simplificación mediante Mapas de Karnaugh (2, 3 y 4 variables).
* Implementación de compuertas lógicas (AND, OR, NOT, NAND, NOR, XOR).

### Notación Asintótica (Complejidad Big O):
* $O(1)$: Tiempo constante (acceso a array por índice, inserción en Hash Table).
* $O(\log n)$: Tiempo logarítmico (búsqueda binaria).
* $O(n)$: Tiempo lineal (búsqueda secuencial, recorrido simple).
* $O(n \log n)$: Tiempo lineal-logarítmico (MergeSort, QuickSort promedio).
* $O(n^2)$: Tiempo cuadrático (BubbleSort, bucles anidados).

### Conversión de Sistemas de Numeración:
* Decimal $\leftrightarrow$ Binario (divisiones sucesivas por 2 / potencias de 2).
* Binario $\leftrightarrow$ Hexadecimal (agrupación de 4 bits: nibbles, ej. $1011_2 = B_{16}$).
* Complemento a dos para números enteros negativos con signo.
