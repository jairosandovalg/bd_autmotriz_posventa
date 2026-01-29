CREATE TABLE dim_tiempo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    anio INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL
);


CREATE TABLE dim_sucursal (
    id INT IDENTITY(1,1) PRIMARY KEY,
    sucursal_id INT NOT NULL, -- ID del sistema OLTP
    nombre_sucursal VARCHAR(100) NOT NULL,
    direccion VARCHAR(200)
);


CREATE TABLE dim_vehiculo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    vehiculo_id INT NOT NULL, -- ID del sistema OLTP
    marca VARCHAR(50),
    modelo VARCHAR(50),
    anio INT
);


CREATE TABLE dim_servicio (
    id INT IDENTITY(1,1) PRIMARY KEY,
    servicio_id INT NOT NULL, -- ID del sistema OLTP
    nombre_servicio VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200)
);


CREATE TABLE hechos_servicios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    dim_tiempo_id INT NOT NULL,
    dim_sucursal_id INT NOT NULL,
    dim_vehiculo_id INT NOT NULL,
    dim_servicio_id INT NOT NULL,
    dim_tipo_transaccion_id INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL

    CONSTRAINT fk_hecho_tiempo 
        FOREIGN KEY (dim_tiempo_id) REFERENCES dim_tiempo(id),

    CONSTRAINT fk_hecho_sucursal 
        FOREIGN KEY (dim_sucursal_id) REFERENCES dim_sucursal(id),

    CONSTRAINT fk_hecho_vehiculo 
        FOREIGN KEY (dim_vehiculo_id) REFERENCES dim_vehiculo(id),

    CONSTRAINT fk_hecho_servicio 
        FOREIGN KEY (dim_servicio_id) REFERENCES dim_servicio(id),

);