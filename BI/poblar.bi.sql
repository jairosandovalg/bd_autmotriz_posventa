use bd_autmotriz_postventa
select * from sucursal


-- Poblar dim_tiempo
SELECT 
	DISTINCT CONVERT(DATE,fecha_ingreso) AS 'fecha_transaccion',
	YEAR(fecha_ingreso) AS 'anio', 
	MONTH(fecha_ingreso) AS 'mes',
	DAY(fecha_ingreso) AS 'dia'
FROM orden_servicio;

-- Poblar dim_servicio
SELECT
	id_servicio AS servicio_id,
	nombre AS 'nombre_servicio',
	descripcion 
FROM servicios

-- poblar dim_sucursal
SELECT
	id_sucursal AS 'sucursal_id',
	nombre AS 'nombre_sucursal',
	direccion
FROM sucursal;

-- poblar dim_vehiculo
select * from vehiculos
SELECT
	id_vehiculo AS 'vehiculo_id',
	marca,
	modelo,
	anio
FROM vehiculos

--poblar hechos_transacciones
SELECT
	CAST(os.fecha_ingreso as date) dim_tiempo_id,
    ds.id_sucursal  AS dim_sucursal_id,
    dv.id_vehiculo  AS dim_vehiculo_id,
    dse.id_servicio AS dim_servicio_id,
    os.monto_final AS monto
FROM orden_servicio os
INNER JOIN cotizaciones c
    ON os.id_cotizacion = c.id_cotizacion
INNER JOIN vehiculos v
    ON c.id_vehiculo = v.id_vehiculo
INNER JOIN servicios s
    ON c.id_servicio = s.id_servicio
INNER JOIN vehiculos dv
    ON dv.id_vehiculo = v.id_vehiculo
INNER JOIN servicios dse
    ON dse.id_servicio = s.id_servicio
INNER JOIN sucursal ds
    ON ds.id_sucursal = v.id_sucursal;