/*  Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero)*/
CREATE TABLE IF NOT EXISTS usuarios(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
)
/*Inserta dos registros en la tabla usuarios*/
INSERT INTO usuarios (nombre,edad)
VALUES ('eduardo',43),('marta',34)
/*Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE usuarios
SET edad=32
WHERE id=1
/*Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM usuarios
WHERE id=2
/* 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE ciudades(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255),
	pais VARCHAR (255)
)
/* Inserta al menos tres registros en la tabla "ciudades"*/
INSERT INTO ciudades (nombre,pais)
VALUES ('madrid','españa'),('bogota','colombia'),('caracas','venezuela'),('paris','francia')
/* crea una foreign key en la tabla "usuarios" que se relaciona con la columna "id" de la tabla "ciudades"*/
ALTER TABLE usuarios 
ADD ciudad_id INT;
ALTER TABLE usuarios
ADD CONSTRAINT FK_ciudad_id
FOREIGN KEY (ciudad_id)
REFERENCES ciudades(id);
/* Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/
UPDATE usuarios 
SET ciudad_id = 1
WHERE id = 1
SELECT usuarios.nombre, ciudades.pais, ciudades.nombre
FROM ciudades
lEFT JOIN usuarios
ON usuarios.ciudad_id = ciudades.id;
/* Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/
SELECT*FROM usuarios
INNER JOIN ciudades 
ON usuarios.ciudad_id = ciudades.id