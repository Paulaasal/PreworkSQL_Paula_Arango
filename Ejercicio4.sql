CREATE TABLE IF NOT EXISTS usuarios (
id SERIAL PRIMARY KEY,
nombre VARCHAR(255),
correo VARCHAR (255),
)
CREATE TABLE IF NOT EXISTS Productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	precio DECIMAL
)
INSERT INTO productos (nombre, precio)
VALUES ('camiseta',20.00),('jersey',35.00),('pantalones',40.00),('americana',69.00),('zapatos',49.00)
/* Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE IF NOT EXISTS pedidos(
	id SERIAL PRIMARY KEY,
	id_usuario INT,
	id_producto INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_producto) REFERENCES productos(id)
);
/*Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/
INSERT INTO pedidos (id_usuario, id_producto)
VALUES (7,3),(8,2),(8,5)
/*Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).*/
SELECT 
COALESCE(usuarios.nombre, 'Sin usuario') AS nombre_usuario, 
COALESCE(Productos.nombre, 'Sin producto') AS nombre_producto
FROM usuarios
LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario
LEFT JOIN Productos ON pedidos.id_producto = productos.id;
/*Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/
SELECT usuarios.nombre
FROM usuarios
LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario;
/*Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE pedidos
ADD cantidad INT;
UPDATE pedidos 
SET cantidad = CASE
WHEN id = 1 THEN 2
WHEN id = 2 THEN 1
WHEN id = 3 THEN 2
END 
WHERE id IN (1,2,3)


