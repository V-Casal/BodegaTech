-- BodegaTech - Script de Inventario
-- Autor: Valentín Casal
-- Fecha: 29/06/2026

CREATE DATABASE BodegaTech; --creo la base de datos llamada BodegaTech

USE BodegaTech; --le indico que usemos la base de datos BodegaTech creada anteriormente

-- SECCIÓN DDL - DEFINO LA ESTRUCTURA --

DROP TABLE IF EXISTS inventario; -- si existiera la tabla inventario anteriormente, la elimino para que no ocurran errores al ejecutar los scripts

--Creación de la tabla del inventario de BodegaTech, con la cual vamos a trabajar
CREATE TABLE inventario( --a partir de acá voy a crear las columnas que contiene la tabla, indicando el tipo de dato que lleva, como también las PK y FK
id_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY, --la columna id_producto admite solo enteros, sin permitir nulos y es la Primary Key de esta tabla. Defino el autoincremental ya que los datos que vamos a cargar el id_producto se va incrementando de 1 en 1 a partir del 1
nombre_producto varchar(100) NOT NULL, --la columna nombre_producto admite el tipo de dato de texto hasta 100 caracteres, no admite valores nulos
categoria varchar(50) NOT NULL, --la columna categoria es similar a la anterior, en este caso admite solo 50 caracteres
precio_unitario decimal(10,2) NOT NULL, --esta columna como datos recibe decimales, permitiendo hasta 10 digitoss con 2 decimales, tampoco admite nulos
stock_actual int NOT NULL, --esta columna refleja las unidades disponibles, lo que debe ser un numero entero sin admitir valores nulos
stock_minimo int NOT NULL, --es el umbral minimo de reposicion
fecha_ingreso date NOT NULL, --esta columna como dato admite una fecha la cual refiere al ingreso del producto, no permite nulos
activo tinyint NOT NULL --en esta columna se pondra un 1 cuando el producto esta disponible o un 0 cuando este discontinuado, sin admitir valores nulos
);

SELECT * FROM inventario; --verifico que la tabla se haya creado correctamente, chequeo cada una de sus columnas

-- SECCIÓN DML - TRABAJAMOS CON LOS DATOS --

-- Cargo los datos iniciales para la tabla de inventario creada
INSERT INTO inventario --le digo que voy e insertar datos a la tabla inventario
(nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo) --aclaro a todas las columnas que les voy a agregar datos, no aparece id_producto porque fue creada con autoincrementación
VALUES --a partir de aca comienzo a escribir los datos que agrego
('Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1), --escribo cada fila una por una, separando por comas para definir a que columna corresponde cada dato
('Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
('Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
('Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
('Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
('Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
('Hub USB-C 7 puertos',	'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
('Webcam HD 1080p',	'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
('SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
('Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

SELECT * FROM inventario; --verifico que los datos se hayan cargado correctamente observando como queda la tabla inventario

-- Simulo unas ventas del dia, borrando algunos productos del inventario, actualizando la columna de stock_actual
UPDATE inventario SET stock_actual = 12 WHERE id_producto = 1; -- cambio el stock del id_producto = 1, al valor original le resto las 3 unidades que se vendieron
UPDATE inventario SET stock_actual = 68 WHERE id_producto = 2; -- cambio el stock del id_producto = 2 a 68 unidades, al valor original le resto las 12 que se vendieron
UPDATE inventario SET stock_actual = 30 WHERE id_producto = 6; -- hago lo mismo con el id_producto = 6

SELECT * FROM inventario; --observo la tabla verificando si se realizaron bien las modificaciones

-- Modifico el estado del id_producto = 8 ya que fue discontinuado por el proveedor:
UPDATE inventario SET activo = 0 WHERE id_producto = 8; -- siempre uso la clausula WHERE para que la modificacion se realice sobre ese unico producto y no sobre todos

--Paso final: Realizo el último SELECT de validacion para ver la tabla y confirmar que las modificaciones se realizaron correctamente:
SELECT * FROM inventario;

