-------------------------------------------
--Inserción de datos
-------------------------------------------

--github: https://github.com/jairosandovalg/bd_autmotriz_posventa

INSERT INTO tipo_vehiculo (nombre, descripcion) VALUES
('Sedán', 'Vehículo de turismo'),
('SUV', 'Vehículo deportivo utilitario'),
('Pickup', 'Vehículo de carga ligera'),
('Camión', 'Vehículo de carga pesada'),
('Motocicleta', 'Vehículo de dos ruedas');

INSERT INTO sucursal (nombre, direccion, celular, jefe_posventa) VALUES
('Sucursal Centro', 'Av. Central 123', '999111222', 'Carlos Pérez'),
('Sucursal Norte', 'Av. Norte 456', '999333444', 'Ana Torres'),
('Sucursal Sur', 'Av. Sur 789', '999555666', 'Luis Gómez'),
('Sucursal Este', 'Av. Este 321', '999777888', 'María López'),
('Sucursal Oeste', 'Av. Oeste 654', '999999000', 'Jorge Ramos');



INSERT INTO tecnicos (nombre, apellido, celular, email, categoria, comision, fecha_ingreso) VALUES
('Juan', 'Mendoza', '988111111', 'juan@mail.com', 'Senior', 10, '2022-01-10'),
('Pedro', 'Rojas', '988222222', 'pedro@mail.com', 'Junior', 5, '2023-03-15'),
('Luis', 'Salazar', '988333333', 'luis@mail.com', 'Senior', 12, '2021-07-20'),
('Carlos', 'Vega', '988444444', 'carlos@mail.com', 'Semi-Senior', 8, '2022-11-05'),
('Miguel', 'Torres', '988555555', 'miguel@mail.com', 'Junior', 5, '2024-02-01');

INSERT INTO servicios (nombre, descripcion) VALUES
('Mantenimiento', 'Mantenimiento preventivo'),
('Cambio de aceite', 'Cambio de aceite y filtro'),
('Alineación', 'Alineación y balanceo'),
('Frenos', 'Revisión de frenos'),
('Diagnóstico', 'Diagnóstico computarizado');

INSERT INTO clientes (tipo_cliente) VALUES
('N'),
('J')

INSERT INTO persona_naturales 
(numero_documento, nombres, apellidos, celular, email, fecha_nacimiento, genero, estado_civil, cliente_id)
VALUES
('70111111', 'José', 'Pérez', '977111111', 'jose@mail.com', '1990-05-10', 'M', 'Soltero', 6),
('70222222', 'María', 'Luna', '977222222', 'maria@mail.com', '1988-09-15', 'F', 'Casada', 7)

INSERT INTO persona_juridica 
( ruc, razon_social, celular, email, tipo_empresa, rubro, fecha_emision, cliente_id)
VALUES
('20111111111', 'Transporte Perú SAC', '966111111', 'contacto@tp.com', 'SAC', 'Transporte', '2018-06-01', 6),
('20222222222', 'Logística Andes SRL', '966222222', 'info@andes.com', 'SRL', 'Logística', '2020-09-10', 7);

INSERT INTO vehiculos 
(id_sucursal, id_tipo_vehiculo, id_cliente, placa, marca, modelo, anio, kilometraje)
VALUES
(6, 1, 6, 'ABC-123', 'Toyota', 'Corolla', 2019, 45000),
(2, 2, 6, 'DEF-456', 'Hyundai', 'Tucson', 2020, 38000),
(3, 3, 6, 'GHI-789', 'Ford', 'Ranger', 2018, 60000),
(4, 1, 7, 'JKL-321', 'Nissan', 'Sentra', 2021, 25000),
(5, 2, 7, 'MNO-654', 'Kia', 'Sportage', 2022, 15000)



INSERT INTO cotizaciones 
(id_cliente, fecha_cotizacion, moneda, total_estimado, estado, id_vehiculo, observaciones, id_servicio)
VALUES
(6,'2024-01-01','PEN',350,'Aprobado',2,'-',1),
(6,'2024-01-05','PEN',180,'Pendiente',3,'-',2),
(6,'2024-01-10','PEN',400,'Aprobado',2,'-',3),
(6,'2024-01-12','PEN',220,'Aprobado',2,'-',4),
(6,'2024-01-15','PEN',500,'Aprobado',3,'-',1),
(6,'2024-01-18','PEN',150,'Pendiente',3,'-',2),
(6,'2024-01-20','PEN',600,'Aprobado',4,'-',5),
(6,'2024-01-22','PEN',280,'Aprobado',4,'-',3),
(6,'2024-01-25','PEN',320,'Aprobado',5,'-',1),
(7,'2024-01-28','PEN',200,'Pendiente',5,'-',2),
(7,'2024-02-01','PEN',410,'Aprobado',6,'-',4),
(7,'2024-02-03','PE',360,'Aprobado',2,'-',5),
(7,'2024-02-05','PEN',290,'Pendiente',3,'-',3),
(7,'2024-02-08','PEN',470,'Aprobado',4,'-',1),
(7,'2024-02-10','PEN',190,'Aprobado',5,'-',2),
(7,'2024-02-12','PEN',330,'Pendiente',6,'-',3),
(7,'2024-02-15','PEN',520,'Aprobado',2,'-',1),
(7,'2024-02-18','PEN',210,'Aprobado',3,'-',4),
(7,'2024-02-20','PEN',480,'Pendiente',4,'-',5),
(6,'2024-02-22','PEN',260,'Aprobado',5,'-',3);




INSERT INTO orden_servicio 
(id_tecnico, fecha_ingreso, fecha_salida, moneda, monto_final, id_cotizacion)
VALUES
(1,'2024-01-02','2024-01-03','PEN',350,21),
(2,'2024-01-06','2024-01-07','PEN',180,22),
(3,'2024-01-11','2024-01-12','PEN',400,23),
(4,'2024-01-13','2024-01-14','PEN',220,4),
(5,'2024-01-16','2024-01-17','PEN',500,5),
(1,'2024-01-19','2024-01-20','PEN',150,6),
(2,'2024-01-21','2024-01-22','PEN',600,7),
(3,'2024-01-23','2024-01-24','PEN',280,8),
(4,'2024-01-26','2024-01-27','PEN',320,9),
(5,'2024-01-29','2024-01-30','PEN',200,10),
(1,'2024-02-02','2024-02-03','PEN',410,11),
(2,'2024-02-04','2024-02-05','PEN',360,12),
(3,'2024-02-06','2024-02-07','PEN',290,13),
(4,'2024-02-09','2024-02-10','PEN',470,14),
(5,'2024-02-11','2024-02-12','PEN',190,15),
(1,'2024-02-13','2024-02-14','PEN',330,16),
(2,'2024-02-16','2024-02-17','PEN',520,17),
(3,'2024-02-19','2024-02-20','PEN',210,18),
(4,'2024-02-21','2024-02-22','PEN',480,19),
(5,'2024-02-23','2024-02-24','PEN',260,20);













