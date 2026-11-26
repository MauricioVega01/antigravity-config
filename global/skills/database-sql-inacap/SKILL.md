---
name: database-sql-inacap
description: Administrador y desarrollador de Bases de Datos Relacionales para INACAP (PostgreSQL, Oracle PL/SQL, SQL Server T-SQL, DDL, DML, Procedimientos, Triggers, Vistas y Normalización).
---

# Especialista en Bases de Datos SQL (PostgreSQL, Oracle PL/SQL, SQL Server)

Esta skill cubre todo el espectro de modelado, administración y desarrollo de bases de datos relacionales exigido en el currículum de **Analista Programador / Ingeniería en Informática**.

---

## 1. Sentencias DDL y DML Universales

### Creación de Tablas con Restricciones de Integridad:
```sql
CREATE TABLE pasajeros (
    id_pasajero SERIAL PRIMARY KEY,
    rut VARCHAR(12) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    fecha_registro TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_rut_valido CHECK (LENGTH(rut) >= 8)
);

CREATE TABLE boletos (
    id_boleto SERIAL PRIMARY KEY,
    id_pasajero INT NOT NULL,
    numero_asiento INT NOT NULL,
    monto_total NUMERIC(10, 2) NOT NULL,
    estado VARCHAR(20) DEFAULT 'EMITIDO',
    fecha_emision TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_boletos_pasajeros FOREIGN KEY (id_pasajero) 
        REFERENCES pasajeros(id_pasajero) ON DELETE RESTRICT,
    CONSTRAINT chk_monto_positivo CHECK (monto_total > 0)
);
```

### Consultas DML Avanzadas (JOINs, Subconsultas, Agregación):
```sql
-- Resumen de ventas por pasajero con más de 3 compras en el mes
SELECT 
    p.rut,
    p.nombre,
    COUNT(b.id_boleto) AS total_boletos,
    SUM(b.monto_total) AS total_gastado,
    AVG(b.monto_total) AS ticket_promedio
FROM pasajeros p
INNER JOIN boletos b ON p.id_pasajero = b.id_pasajero
WHERE b.fecha_emision >= DATE_TRUNC('month', CURRENT_DATE)
GROUP BY p.rut, p.nombre
HAVING COUNT(b.id_boleto) >= 3
ORDER BY total_gastado DESC;
```

---

## 2. Programación de Base de Datos Multi-Motor

### A. Oracle Database (PL/SQL): Procedimiento con Cursor y Manejo de Excepciones
```sql
CREATE OR REPLACE PROCEDURE sp_calcular_descuento_pasajero (
    p_rut IN VARCHAR2,
    p_descuento OUT NUMBER
) AS
    v_total_viajes NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_total_viajes
    FROM boletos b
    JOIN pasajeros p ON b.id_pasajero = p.id_pasajero
    WHERE p.rut = p_rut;

    IF v_total_viajes > 10 THEN
        p_descuento := 0.20; -- 20% descuento
    ELSIF v_total_viajes > 5 THEN
        p_descuento := 0.10; -- 10% descuento
    ELSE
        p_descuento := 0.00;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_descuento := 0.00;
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error calculando descuento: ' || SQLERRM);
END sp_calcular_descuento_pasajero;
/
```

### B. PostgreSQL (PL/pgSQL): Trigger para Auditoría de Cambios
```sql
CREATE OR REPLACE FUNCTION fn_auditoria_boletos()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO auditoria_boletos (id_boleto, estado_anterior, estado_nuevo, fecha_modificacion)
    VALUES (OLD.id_boleto, OLD.estado, NEW.estado, CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_auditoria_boletos
AFTER UPDATE OF estado ON boletos
FOR EACH ROW
EXECUTE FUNCTION fn_auditoria_boletos();
```

### C. SQL Server (T-SQL): Transacción Segura con `TRY...CATCH`
```sql
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE boletos 
    SET estado = 'PAGADO' 
    WHERE id_boleto = @IdBoleto;

    INSERT INTO pagos_totem (id_boleto, medio_pago, monto, fecha)
    VALUES (@IdBoleto, @MedioPago, @Monto, GETDATE());

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
```
