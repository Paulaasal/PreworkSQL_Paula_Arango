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
correo VARCHAR (255)
)
INSERT INTO clientes (nombre, correo)
VALUES ('ignacio','ignacio@gmail.com'),('paula','paula@gmail.com'),('monica','monica@gmail.com')
CREATE TABLE IF NOT EXISTS pedidos (
id SERIAL PRIMARY KEY,
fecha_pedido DATE,
cliente_id INT,
producto_id INT,
FOREIGN KEY (cliente_id) REFERENCES clientes(id),
FOREIGN KEY (producto_id) REFERENCES productos(id)
);
INSERT INTO pedidos (cliente_id, producto_id)
VALUES (2,5),(1,4),(2,2),(3,5)
SELECT clientes.nombre, productos.nombre
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.id
INNER JOIN productos ON pedidos.producto_id = productos.id;