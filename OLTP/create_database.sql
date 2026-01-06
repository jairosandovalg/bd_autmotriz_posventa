--bd_autmotriz_postventa;
create database bd_autmotriz_postventa;
go

--Persona Juridica
CREATE TABLE persona_juridica (
    id_persona_juridica INT IDENTITY(1,1) PRIMARY KEY,
    ruc CHAR(11) UNIQUE NOT NULL,
    razon_social VARCHAR(150) NOT NULL,
    celular VARCHAR(200) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    tipo_empresa VARCHAR(50) NOT NULL,
    rubro VARCHAR(100) NOT NULL,
    fecha_emision DATE NOT NULL
);


--Personas Naturales
CREATE TABLE persona_naturales (
    id_persona_natural INT IDENTITY(1,1) PRIMARY KEY,
    numero_documento CHAR(8) UNIQUE NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero VARCHAR(20) NOT NULL,
    estado_civil VARCHAR(20) NOT NULL,
);


--Cientes
CREATE TABLE clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    id_persona INT NOT NULL,
    tipo_cliente VARCHAR(30) NOT NULL,

    CONSTRAINT fk_cliente_persona_natural
        FOREIGN KEY (id_persona)
        REFERENCES persona_naturales(id_persona_natural),

    CONSTRAINT fk_cliente_persona_juridica
        FOREIGN KEY (id_persona)
        REFERENCES persona_juridica(id_persona_juridica)
);

--Sucursal
CREATE TABLE sucursal (
    id_sucursal INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    id_jefe_posventa INT NOT NULL
);

--Tipo vehiculo
CREATE TABLE tipo_vehiculo (
    id_tipo_vehiculo INT IDENTITY(1,1) PRIMARY KEY,
    id_vehiculo INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,	
);


--Vehiculos
CREATE TABLE vehiculos (
    id_vehiculo INT IDENTITY(1,1) PRIMARY KEY,
    id_sucursal INT NOT NULL,
	id_tipo_vehiculo int not null,
    id_cliente INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    kilometraje INT NOT NULL,

    CONSTRAINT fk_vehiculo_sucursal
        FOREIGN KEY (id_sucursal)
        REFERENCES sucursal(id_sucursal),

    CONSTRAINT fk_vehiculo_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),


    CONSTRAINT fk_tipo_vehiculo_vehiculo
        FOREIGN KEY (id_tipo_vehiculo)
        REFERENCES tipo_vehiculo(id_tipo_vehiculo)
);


--Tecnicos
CREATE TABLE tecnicos (
    id_tecnico INT IDENTITY(1,1)PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    comision DECIMAL(5,2) NOT NULL
);


--Servicios
CREATE TABLE servicios (
    id_servicio INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NOT NULL
);

--Orden Servicio
CREATE TABLE orden_servicio (
    id_orden INT IDENTITY(1,1) PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_tecnico INT NOT NULL,
    id_vehiculo INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    moneda VARCHAR(10) NOT NULL,
    monto_final DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_orden_servicio_servicio
        FOREIGN KEY (id_servicio)
        REFERENCES servicios(id_servicio),

    CONSTRAINT fk_orden_servicio_tecnico
        FOREIGN KEY (id_tecnico)
        REFERENCES tecnicos(id_tecnico),

    CONSTRAINT fk_orden_servicio_vehiculo
        FOREIGN KEY (id_vehiculo)
        REFERENCES vehiculos(id_vehiculo)
);
