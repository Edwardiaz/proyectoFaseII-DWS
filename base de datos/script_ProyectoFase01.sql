CREATE DATABASE  IF NOT EXISTS `inventario`;
USE `inventario`;

CREATE TABLE `proveedor` (
  `id` INT NOT NULL auto_increment,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `encargado` VARCHAR(1150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `marca` (
	`id` INT NOT NULL auto_increment,
    `nombre_marca` VARCHAR(100) DEFAULT NULL,
    `descripcion` VARCHAR(300) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `zona` ( /*ubicacion del producto*/
	`id` INT NOT NULL auto_increment,
    `descripcion` VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `categoria` (
	`id` INT NOT NULL auto_increment,
    `categoria` VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
	`id` INT NOT NULL auto_increment,
    `nombre` VARCHAR(100) DEFAULT NULL,
    `apellido` VARCHAR(100) DEFAULT NULL,
    `email` VARCHAR(200) DEFAULT NULL,
    `pass` VARCHAR(60) DEFAULT NULL,
    `status` TINYINT DEFAULT NULL,
    `is_admin` TINYINT DEFAULT NULL,
    `fecha_creacion` DATE DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `producto` (
	`id` INT NOT NULL auto_increment,
    `codigo_producto` VARCHAR(100) DEFAULT NULL,
    `id_marca` INT DEFAULT NULL,
    `descripcion_producto` VARCHAR(200) DEFAULT NULL,
    `id_categoria` INT NOT NULL,
    `id_proveedor` INT NOT NULL,
    `id_zona` INT NOT NULL,
    `id_usuario` INT NOT NULL, /*Usuario que lo ha ingresado al sistema*/
    `precio` FLOAT DEFAULT NULL,
    `peso` FLOAT DEFAULT NULL,
    `IVA` FLOAT DEFAULT NULL,
    `status` TINYINT NOT NULL,
    `unidades_disponibles` INT(4) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK_marca` (`id_marca`),
	KEY `FK_categora` (`id_categoria`),
	KEY `FK_proveedor` (`id_proveedor`),
	KEY `FK_zona` (`id_zona`),
    KEY `FK_usuario` (`id_usuario`),
	CONSTRAINT `FK_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT `FK_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT `FK_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT `FK_zona` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT `FK_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `orden_compra` (
	`id` INT NOT NULL auto_increment,
    `cliente` VARCHAR(200) DEFAULT NULL,
    `telefono` VARCHAR(15) DEFAULT NULL,
    `email` VARCHAR(200) DEFAULT NULL,
    `status` TINYINT DEFAULT NULL,
    `tipo_operacion` VARCHAR(50) DEFAULT NULL, /*COMPRA o VENTA, ENTRADA o SALIDA*/
    `TOTAL` FLOAT DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `detalle_orden_compra` (
	`id` INT NOT NULL auto_increment,
    `id_orden_compra` INT DEFAULT NULL,
    `id_producto` INT NOT NULL,
    `cantidad` INT DEFAULT NULL,
    `precio_unitario` FLOAT DEFAULT NULL,
    `precio_TOTAL` FLOAT DEFAULT NULL,
    `fecha_creacion` DATE DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK_orden_compra` (`id_orden_compra`),
	KEY `FK_producto` (`id_producto`),
	CONSTRAINT `FK_orden_compra` FOREIGN KEY (`id_orden_compra`) REFERENCES `orden_compra` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT `FK_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
