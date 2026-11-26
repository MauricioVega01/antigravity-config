---
name: power-bi-dax-specialist
description: Especialista en Power BI, modelado dimensional (Star Schema), fórmulas DAX avanzadas, funciones de Time Intelligence y ETL con Power Query (M).
---

# Especialista en Power BI, Modelado Dimensional y DAX

Esta skill proporciona las mejores prácticas de Microsoft para el diseño de modelos analíticos de datos, fórmulas DAX de alto rendimiento y tableros interactivos de Business Intelligence.

---

## 1. Principios de Modelado Dimensional (Star Schema)

* **Tablas de Hechos (`Fact_...`)**:
  * Contienen eventos numéricos medibles (ventas, pagos, transacciones de boletos).
  * Columnas clave: Claves foráneas (FK) a las dimensiones y métricas numéricas.
  * Granularidad uniforme: Cada fila representa exactamente un evento atómico.
* **Tablas de Dimensiones (`Dim_...`)**:
  * Contienen contexto descriptivo para filtrar y agrupar (Fechas, Clientes, Rutas, Máquinas Totem).
  * Clave primaria única (surrogate key o ID de negocio).
* **Reglas de Oro de Relaciones**:
  * Relaciones `1 a Varios` (`1:*`) con dirección de filtro cruzado **Único** (Single). Evitar relaciones bidireccionales salvo justificación estricta.

---

## 2. Fórmulas DAX: Estándar y Mejores Prácticas

### Buenas Prácticas Mandatorias:
1. **Siempre cualificar columnas**: `Tabla[Columna]` (nunca `[Columna]`).
2. **Nunca cualificar medidas**: `[Medida]` (nunca `Tabla[Medida]`).
3. **Usar Variables (`VAR` / `RETURN`)**: Mejora la legibilidad, facilita la depuración y evita re-calcular expresiones costosas.
4. **Manejo Seguro de Divisiones**: Utilizar siempre `DIVIDE(numerador, denominador, [alternativa])` en lugar de `/` para prevenir errores de división por cero.

### Ejemplos de Medidas DAX Críticas:

#### Total Ventas y Ticket Promedio:
```dax
Total Ventas = 
SUM(Fact_Ventas[MontoCLP])
```

```dax
Ticket Promedio = 
DIVIDE(
    [Total Ventas],
    COUNTROWS(Fact_Ventas),
    0
)
```

#### Ventas del Año Anterior (Time Intelligence):
```dax
Ventas Año Anterior = 
CALCULATE(
    [Total Ventas],
    SAMEPERIODLASTYEAR(Dim_Calendario[Fecha])
)
```

#### Crecimiento Porcentual Interanual (YoY%):
```dax
Crecimiento YoY % = 
VAR _VentaActual = [Total Ventas]
VAR _VentaAnterior = [Ventas Año Anterior]
VAR _Diferencia = _VentaActual - _VentaAnterior
RETURN
    DIVIDE(_Diferencia, _VentaAnterior, 0)
```

#### Ventas Acumuladas del Año (YTD):
```dax
Ventas Acumuladas YTD = 
TOTALYTD(
    [Total Ventas],
    Dim_Calendario[Fecha]
)
```

---

## 3. Power Query (Lenguaje M) para ETL
* Tipado estricto en el origen para evitar transformaciones costosas en DAX.
* Eliminación temprana de columnas y filas no utilizadas en el reporte.
* Creación de tabla de calendario dinámica continua desde la fecha mínima hasta la fecha máxima de las transacciones.
