INSERT INTO `proveedor` (nombre, descripcion, telefono, email, encargado) VALUES ("Grupo Jalisco", "Distribuidores de pimientos y productos picantes", "2222222", "jalisto@picantes.com", "John Travolta");
INSERT INTO `proveedor` (nombre, descripcion, telefono, email, encargado) VALUES ("Grupo Jalisco", "Distribuidores de pimientos y productos picantes", "2222222", "jalisto@picantes.com", "John Travolta");


insert into `marca`(nombre_marca, descripcion) values("Adidas", "Marca de zapatos, ropa y accesorios orientados al deporte o para aquellos que quieren verse casuales");
insert into `marca`(nombre_marca, descripcion) values("CAT", "Marca orientada a las personas que les gustan los productos duraderos con una apariencia fuerte");
insert into `marca`(nombre_marca, descripcion) values("Nike", "Marca de zapatos, ropa y accesorios orientados al deporte");

INSERT INTO `zona` (descripcion) VALUES ("Zona Rosa");
INSERT INTO `zona` (descripcion) VALUES ("Escalon norte");

INSERT INTO `categoria` (categoria) VALUES ("Deporte");
INSERT INTO `categoria` (categoria) VALUES ("Tecnologia");

INSERT INTO `usuario` (nombre, apellido, email, pass, status, is_admin, fecha_creacion) 
				VALUES ("Jorge", "Diaz", "jorge@mail.com", "123456", 1, 1, "2022/11/01");
INSERT INTO `usuario` (nombre, apellido, email, pass, status, is_admin, fecha_creacion) 
				VALUES ("Erick", "Alas", "erick@mail.com", "123456", 1, 1, "2022/11/01");
INSERT INTO `usuario` (nombre, apellido, email, pass, status, is_admin, fecha_creacion) 
				VALUES ("Matias", "Eduardo", "matias@mail.com", "123456", 1, 1, "2022/11/01");

INSERT INTO `producto` (codigo_producto, id_marca, descripcion_producto, id_categoria, id_proveedor, id_zona, id_usuario, precio, peso, IVA, status, unidades_disponibles) 
				VALUES ("1", 1, "zapatos deportivos", 1, 1, 1, 1, 5.00, 23.00, 13.00, 1, 20);
INSERT INTO `producto` (codigo_producto, id_marca, descripcion_producto, id_categoria, id_proveedor, id_zona, id_usuario, precio, peso, IVA, status, unidades_disponibles) 
				VALUES ("1", 2, "Tarjeta grafica", 2, 2, 1, 1, 5.00, 23.00, 13.00, 2, 20);
                
INSERT INTO `orden_compra` (cliente, telefono, email, status, tipo_operacion, total) 
					VALUES ("Jorge", "222222", "jorge@email.com", 1, "Transaccion", 130.00);

INSERT INTO `detalle_orden_compra` (id_orden_compra, id_producto, cantidad, precio_unitario, precio_TOTAL, fecha_creacion) 
					VALUES (1, 2, 1, 130, 130, "2022/11/01");
                    