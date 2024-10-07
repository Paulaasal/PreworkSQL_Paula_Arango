/*Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico)*/
CREATE TABLE IF NOT EXISTS Productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	precio DECIMAL
)
/*Inserta al menos cinco registros en la tabla "Productos". */
INSERT INTO productos (nombre, precio)
VALUES ('camiseta',20.00),('jersey',35.00),('pantalones',40.00),('americana',69.00),('zapatos',49.00)
/* Actualiza el precio de un producto en la tabla "Productos".*/ 
UPDATE Productos
SET precio = 67.5
WHERE id = 4
/*Elimina un producto de la tabla "Productos".*/
DELETE FROM productos
WHERE id = 1
/* Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/
CREATE TABLE IF NOT EXISTS clientes (
id SERIAL PRIMARY KEY,
nombre VARCHAR(255),
correo VARCHAR (255),
producto_id INT
FOREIGN KEY (producto_id) REFERENCES productos(id)
);
INSERT INTO clientes (nombre, correo, producto_id)
VALUES ('ignacio','ignacio@gmail.com',2),('paula','paula@gmail.com',3),('monica','monica@gmail.com',4)
SELECT clientes.nombre, productos.nombre
FROM clientes
INNER JOIN productos ON productos.id=clientes.producto_id;
