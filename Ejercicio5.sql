/*  Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto).*/
CREATE TABLE IF NOT EXISTS clientes(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255)
);
/* Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".*/
INSERT INTO clientes (id, nombre)
VALUES (1, 'John');
/*Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".*/
UPDATE clientes
SET nombre = 'John Doe'
WHERE id = 1;
/* Elimina el clliente con id=1 de la tabla 'Clientes'*/
DELETE FROM clientes 
WHERE id = 1;
/*Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero).*/
CREATE TABLE IF NOT EXISTS pedidos (
	id SERIAL PRIMARY KEY, 
	cliente_id INT
);
/*Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/
INSERT INTO pedidos (id, cliente_id)
VALUES (1,1)
/* Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".*/
UPDATE pedidos 
SET cliente_id = 2
WHERE id = 1; 
/* Elimina el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM  pedidos 
WHERE id = 1;
/* Lee todos los pedidos de la tabla "Pedidos".*/
SELECT*FROM pedidos
/* Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto).*/
CREATE TABLE IF NOT EXISTS productos(
	id INT,
	nombre VARCHAR (255)
);
/* Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/
INSERT INTO productos (id, nombre)
VALUES (1, 'Camisa')
/* Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".*/
UPDATE productos 
SET nombre = 'pantalón'
WHERE id = 1
/* Elimina el producto con id=1 de la tabla "Productos".*/
DELETE FROM productos
WHERE id=1
/* Lee todos los productos de la tabla "Productos".*/
SELECT * FROM productos
/* Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).*/
CREATE TABLE IF NOT EXISTS DetallesPedido (
	pedido_id INT,
	producto_id INT
);
/* Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".*/
INSERT INTO detallespedido (pedido_id, producto_id)
VALUES (1, 1)
/* Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".*/
UPDATE detallespedido
SET pedido_id = 2
WHERE pedido_id= 1;
/* Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/
DELETE FROM detallespedido
WHERE pedido_id= 1;
/* Lee todos los detalles de pedido de la tabla "DetallesPedido".*/
SELECT *FROM detallespedido
/* Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join.*/
DELETE FROM detallespedido
WHERE pedido_id = 2
ALTER TABLE detallespedido
ADD CONSTRAINT FK_pedido_id
FOREIGN KEY (pedido_id)REFERENCES pedidos(id);
ALTER TABLE pedidos
ADD CONSTRAINT FK_cliente_id
FOREIGN KEY (cliente_id)REFERENCES clientes(id);
SELECT clientes.nombre AS "Nombre cliente",
	pedidos.id AS "id pedido"
FROM clientes
INNER JOIN pedidos 
ON clientes.id = pedidos.cliente_id;
/* Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join.*/
SELECT * FROM clientes
LEFT JOIN pedidos
ON clientes.id = pedidos.cliente_id;
/* Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.*/
ALTER TABLE productos
ADD CONSTRAINT pk_productos PRIMARY KEY (id)
ALTER TABLE detallespedido
ADD CONSTRAINT FK_producto_id
FOREIGN KEY (producto_id)
REFERENCES productos(id);
SELECT 
	productos.nombre AS "nombre producto",
	clientes.nombre AS "cliente",
	pedidos.id AS "id pedido"
FROM pedidos
INNER JOIN detallespedido ON detallespedido.pedido_id = pedidos.id
INNER JOIN productos ON detallespedido.producto_id = productos.id
INNER JOIN clientes ON clientes.id = pedidos.cliente_id;
/* Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.*/
SELECT * FROM pedidos
LEFT JOIN detallespedido ON detallespedido.pedido_id = pedidos.id
LEFT JOIN productos ON detallespedido.producto_id = productos.id
LEFT JOIN clientes ON clientes.id = pedidos.cliente_id;
/* Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes".*/
ALTER TABLE clientes
ADD COLUMN teléfono VARCHAR (255);
/* Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero.*/
ALTER TABLE clientes 
ALTER COLUMN teléfono TYPE INT USING teléfono::INTEGER;
/* Elimina la columna "telefono" de la tabla "Clientes".*/
ALTER TABLE clientes 
DROP COLUMN teléfono;
/* Cambia el nombre de la tabla "Clientes" a "Usuarios".*/
ALTER TABLE clientes
RENAME TO usuarios; 
/* Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo".*/
ALTER TABLE usuarios
RENAME COLUMN nombre TO nombre_completo;
/* Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/
ALTER TABLE usuarios
ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);
