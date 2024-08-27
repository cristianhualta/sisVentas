-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.22-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bdtunegociov2
CREATE DATABASE IF NOT EXISTS `bdtunegociov2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bdtunegociov2`;

-- Volcando estructura para tabla bdtunegociov2.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.categoria: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT IGNORE INTO `categoria` (`idcategoria`, `nombre`, `condicion`) VALUES
	(1, 'TV', 1),
	(2, 'MEDIAS', 1),
	(3, 'REMERAS', 1),
	(4, 'PANTALONES', 1),
	(5, 'CAMISAS', 1),
	(6, 'SWEATERS', 1),
	(7, 'CAMPERAS', 1),
	(8, 'BERMUDAS', 1),
	(9, 'CINTOS', 1),
	(10, 'BUFANDAS', 1),
	(11, 'PRUEBA', 1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `idcompra` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` int(11) NOT NULL,
  `idpersonal` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `fk_ingreso_persona_idx` (`idproveedor`),
  KEY `fk_compra_personal1_idx` (`idpersonal`),
  CONSTRAINT `fk_compra_personal1` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`idpersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT IGNORE INTO `compra` (`idcompra`, `idproveedor`, `idpersonal`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `estado`) VALUES
	(15, 3, 1, 'Boleta', '001', '00001', '2021-06-11 00:00:00', 0.00, 1.00, 'Aceptado');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.comp_pago
CREATE TABLE IF NOT EXISTS `comp_pago` (
  `id_comp_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `serie_comprobante` varchar(3) NOT NULL,
  `num_comprobante` varchar(7) NOT NULL,
  `condicion` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_comp_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.comp_pago: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `comp_pago` DISABLE KEYS */;
INSERT IGNORE INTO `comp_pago` (`id_comp_pago`, `nombre`, `serie_comprobante`, `num_comprobante`, `condicion`) VALUES
	(2, 'Boleta', '000', '9999999', 1),
	(3, 'Factura', '000', '9999999', 1),
	(4, 'Nota de Venta', '000', '9999999', 1);
/*!40000 ALTER TABLE `comp_pago` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.cuentas_por_cobrar
CREATE TABLE IF NOT EXISTS `cuentas_por_cobrar` (
  `idcpc` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `fecharegistro` datetime NOT NULL,
  `deudatotal` double NOT NULL,
  `fechavencimiento` date NOT NULL,
  `abonototal` decimal(11,2) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcpc`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bdtunegociov2.cuentas_por_cobrar: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `cuentas_por_cobrar` DISABLE KEYS */;
INSERT IGNORE INTO `cuentas_por_cobrar` (`idcpc`, `idventa`, `fecharegistro`, `deudatotal`, `fechavencimiento`, `abonototal`, `condicion`) VALUES
	(4, 47, '2021-06-17 00:00:00', 1400, '2021-07-31', 1400.00, 1),
	(5, 48, '2021-06-17 00:00:00', 39.2, '0000-00-00', 39.20, 1),
	(6, 49, '2021-06-17 00:00:00', 500, '0000-00-00', 500.00, 1),
	(7, 50, '2021-06-17 00:00:00', 500, '2021-07-01', 500.00, 1),
	(8, 51, '2021-06-17 00:00:00', 500, '2021-09-09', 500.00, 1),
	(9, 53, '2021-06-18 00:00:00', 505, '2021-06-30', 505.00, 1),
	(10, 54, '2021-06-18 00:00:00', 25, '2021-07-01', 25.00, 1),
	(11, 58, '2021-06-20 00:00:00', 1000, '2021-06-30', 1000.00, 1),
	(12, 61, '2021-06-22 00:00:00', 500, '2021-06-22', 500.00, 1),
	(13, 62, '2021-06-23 00:00:00', 500, '2021-06-23', 500.00, 1),
	(14, 65, '2021-06-25 00:00:00', 200, '2021-07-02', 200.00, 1),
	(15, 67, '2021-06-25 00:00:00', 4100, '2021-06-25', 4100.00, 1),
	(16, 68, '2021-06-29 00:00:00', 825, '2021-06-29', 825.00, 1),
	(17, 74, '2021-07-10 00:00:00', 500, '2021-07-10', 500.00, 0),
	(18, 75, '2021-07-11 00:00:00', 500, '2021-07-11', 0.00, 0),
	(19, 76, '2021-07-11 00:00:00', 500, '2021-07-11', 0.00, 0),
	(20, 77, '2021-07-12 00:00:00', 200, '2021-07-31', 4.00, 1);
/*!40000 ALTER TABLE `cuentas_por_cobrar` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.datos_negocio
CREATE TABLE IF NOT EXISTS `datos_negocio` (
  `id_negocio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) CHARACTER SET utf8 NOT NULL,
  `ndocumento` varchar(20) NOT NULL,
  `documento` int(11) NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 NOT NULL,
  `telefono` int(20) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `logo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pais` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `nombre_impuesto` varchar(10) NOT NULL,
  `monto_impuesto` float(4,2) NOT NULL,
  `moneda` varchar(10) NOT NULL,
  `simbolo` varchar(10) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_negocio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bdtunegociov2.datos_negocio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `datos_negocio` DISABLE KEYS */;
INSERT IGNORE INTO `datos_negocio` (`id_negocio`, `nombre`, `ndocumento`, `documento`, `direccion`, `telefono`, `email`, `logo`, `pais`, `ciudad`, `nombre_impuesto`, `monto_impuesto`, `moneda`, `simbolo`, `condicion`) VALUES
	(6, 'SISTEMA VENTAS', 'NIT', 2147483647, 'SOPOCACHI, NRO 757 LA PAZ BOLIVIA', 72144532, 'wil_river18@hotmail.com', '1647131197.jpg', 'BOLIVIA', 'La Paz', 'IVA', 16.00, 'Bolivia', 'BS/', 1);
/*!40000 ALTER TABLE `datos_negocio` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.detalle_compra
CREATE TABLE IF NOT EXISTS `detalle_compra` (
  `iddetalle_compra` int(11) NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_compra`),
  KEY `fk_detalle_ingreso_ingreso_idx` (`idcompra`),
  KEY `fk_detalle_compra_producto1_idx` (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.detalle_compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT IGNORE INTO `detalle_compra` (`iddetalle_compra`, `idcompra`, `idproducto`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
	(31, 15, 29, 1, 1.00, 101.00);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.detalle_cuentas_por_cobrar
CREATE TABLE IF NOT EXISTS `detalle_cuentas_por_cobrar` (
  `iddcpc` int(11) NOT NULL AUTO_INCREMENT,
  `idcpc` int(11) NOT NULL,
  `montopagado` decimal(11,2) NOT NULL,
  `fechapago` datetime DEFAULT current_timestamp(),
  `formapago` varchar(50) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iddcpc`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bdtunegociov2.detalle_cuentas_por_cobrar: ~37 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_cuentas_por_cobrar` DISABLE KEYS */;
INSERT IGNORE INTO `detalle_cuentas_por_cobrar` (`iddcpc`, `idcpc`, `montopagado`, `fechapago`, `formapago`, `observacion`) VALUES
	(13, 4, 400.00, '2021-06-17 14:35:07', 'Efectivo', ''),
	(14, 4, 200.00, '2021-06-17 14:35:56', 'Efectivo', ''),
	(15, 4, 800.00, '2021-06-17 14:39:15', 'Efectivo', ''),
	(16, 5, 10.00, '2021-06-17 17:40:13', 'Efectivo', ''),
	(17, 6, 500.00, '2021-06-17 18:06:38', 'Efectivo', 'paque todo el dia tal no molestar'),
	(18, 5, 29.20, '2021-06-17 18:06:50', 'Efectivo', ''),
	(19, 8, 20.00, '2021-06-17 18:33:13', 'Efectivo', ''),
	(20, 8, 80.00, '2021-06-17 18:34:54', 'Efectivo', ''),
	(21, 8, 20.00, '2021-06-17 18:38:39', 'Efectivo', ''),
	(22, 8, 80.00, '2021-06-17 18:40:11', 'Efectivo', ''),
	(23, 8, 300.00, '2021-06-17 18:40:51', 'Efectivo', ''),
	(24, 7, 200.00, '2021-06-17 18:41:01', 'Efectivo', ''),
	(25, 7, 300.00, '2021-06-17 18:41:13', 'Efectivo', ''),
	(26, 9, 100.00, '2021-06-18 12:18:29', 'Efectivo', ''),
	(27, 9, 405.00, '2021-06-18 12:19:04', 'Efectivo', 'pague'),
	(28, 10, 5.00, '2021-06-18 12:20:11', 'Efectivo', ''),
	(29, 10, 5.00, '2021-06-18 12:20:31', 'Efectivo', ''),
	(30, 10, 15.00, '2021-06-18 12:20:58', 'Efectivo', ''),
	(31, 11, 20.00, '2021-06-20 07:35:34', 'Efectivo', ''),
	(32, 11, 80.00, '2021-06-20 07:53:10', 'Efectivo', ''),
	(33, 11, 100.00, '2021-06-20 07:53:41', 'Transferencia', ''),
	(34, 11, 200.00, '2021-06-20 08:11:00', 'Efectivo', ''),
	(35, 12, 100.00, '2021-06-22 21:39:37', 'Efectivo', ''),
	(36, 12, 400.00, '2021-06-22 21:45:29', 'Efectivo', ''),
	(37, 13, 100.00, '2021-06-23 09:35:54', 'Efectivo', ''),
	(38, 13, 150.00, '2021-06-23 09:36:01', 'Efectivo', ''),
	(39, 14, 100.00, '2021-06-25 16:42:23', 'Efectivo', ''),
	(40, 14, 50.00, '2021-06-25 16:46:28', 'Efectivo', ''),
	(41, 15, 10.00, '2021-06-25 16:47:56', '', ''),
	(42, 15, 4090.00, '2021-06-25 21:04:24', 'Efectivo', ''),
	(43, 14, 50.00, '2021-06-25 21:04:29', 'Efectivo', ''),
	(44, 13, 250.00, '2021-06-25 21:04:35', 'Efectivo', ''),
	(45, 11, 600.00, '2021-06-25 21:04:46', 'Efectivo', ''),
	(46, 16, 10.00, '2021-06-29 22:25:31', '', ''),
	(47, 16, 815.00, '2021-06-29 22:25:47', 'Efectivo', ''),
	(48, 17, 500.00, '2021-07-11 09:36:49', 'Efectivo', ''),
	(49, 20, 4.00, '2021-07-12 08:27:28', 'Efectivo', '');
/*!40000 ALTER TABLE `detalle_cuentas_por_cobrar` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  KEY `fk_detalle_venta_venta_idx` (`idventa`),
  KEY `fk_detalle_venta_producto1_idx` (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.detalle_venta: ~35 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT IGNORE INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idproducto`, `cantidad`, `precio_venta`, `descuento`) VALUES
	(64, 47, 13, 1, 500.00, 0.00),
	(65, 47, 14, 1, 500.00, 0.00),
	(66, 47, 17, 1, 200.00, 0.00),
	(67, 47, 18, 1, 200.00, 0.00),
	(68, 48, 24, 1, 40.00, 0.00),
	(69, 49, 13, 1, 500.00, 0.00),
	(70, 50, 13, 1, 500.00, 0.00),
	(71, 51, 13, 1, 500.00, 0.00),
	(72, 52, 13, 1, 500.00, 0.00),
	(73, 53, 29, 5, 101.00, 0.00),
	(74, 54, 25, 1, 25.00, 0.00),
	(75, 55, 13, 1, 500.00, 0.00),
	(76, 56, 13, 1, 500.00, 0.00),
	(77, 57, 13, 2, 500.00, 0.00),
	(78, 58, 13, 2, 500.00, 0.00),
	(79, 59, 13, 1, 500.00, 0.00),
	(80, 60, 18, 1, 200.00, 0.00),
	(81, 61, 13, 1, 500.00, 0.00),
	(82, 62, 13, 1, 500.00, 0.00),
	(83, 64, 25, 1, 25.00, 0.00),
	(84, 65, 17, 1, 200.00, 0.00),
	(85, 66, 25, 1, 25.00, 0.00),
	(86, 67, 13, 2, 1800.00, 0.00),
	(87, 67, 14, 1, 500.00, 0.00),
	(88, 68, 25, 25, 25.00, 0.00),
	(89, 68, 17, 1, 200.00, 0.00),
	(90, 69, 14, 1, 500.00, 0.00),
	(91, 70, 25, 1, 25.00, 0.00),
	(92, 71, 14, 1, 500.00, 0.00),
	(93, 72, 14, 1, 500.00, 0.00),
	(94, 73, 14, 1, 500.00, 0.00),
	(95, 74, 14, 1, 500.00, 0.00),
	(96, 75, 14, 1, 500.00, 0.00),
	(97, 76, 14, 1, 500.00, 0.00),
	(98, 77, 16, 1, 200.00, 0.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.movimiento
CREATE TABLE IF NOT EXISTS `movimiento` (
  `idmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `tipo` varchar(25) NOT NULL,
  `vendedor` varchar(255) NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idmovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bdtunegociov2.movimiento: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT IGNORE INTO `movimiento` (`idmovimiento`, `fecha`, `tipo`, `vendedor`, `monto`, `descripcion`) VALUES
	(14, '2021-06-22 21:45:50', 'Egresos', 'Manuel Vargas', 500.00, 'Cierre de caja'),
	(17, '2021-07-01 09:18:08', 'Ingresos', 'Usuario Administrador', 500.00, ''),
	(18, '2021-07-02 09:31:34', 'Egresos', 'Usuario Administrador', 500.00, ''),
	(19, '2021-07-02 09:42:00', 'Ingresos', 'Usuario Administrador', 1000.00, '');
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.permiso
CREATE TABLE IF NOT EXISTS `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.permiso: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT IGNORE INTO `permiso` (`idpermiso`, `nombre`) VALUES
	(1, 'Inicio'),
	(2, 'Almacen'),
	(3, 'Compras'),
	(4, 'Ventas'),
	(5, 'Personal'),
	(6, 'Consulta Compras'),
	(7, 'Consulta Ventas'),
	(8, 'Configuracion');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.persona: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT IGNORE INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `fecha`) VALUES
	(2, 'Cliente', 'Ana Rubio Cortés', 'NIT', '12345678944', 'La Paz', '56524122', 'xd@ho.com', NULL),
	(3, 'Proveedor', 'Canabiogen', 'NIT', '12345678911', 'Cochabamba', '632514', 'Canabiogen@gmail.com', NULL),
	(4, 'Cliente', 'Juan Neira Vasques', 'NIT', '75662354', 'Santa Cruz', '123456', 'Cliente2@gmail.com', NULL),
	(5, 'Cliente', 'Prueba Cliente', 'NIT', '71883852', 'Calle #12', '123456789', 'email@hotmail.com', '2021-06-24');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.personal
CREATE TABLE IF NOT EXISTS `personal` (
  `idpersonal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL,
  PRIMARY KEY (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.personal: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT IGNORE INTO `personal` (`idpersonal`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `imagen`, `condicion`) VALUES
	(1, 'Usuario Administrador', 'CI', '71883851', 'La Paz', '123456', 'wil_river18@hotmail.com', 'Administrador', '1570311068.png', 1),
	(2, 'ROEL CHURATA QUISPE', 'CI', '2542522', 'kkaka', '855558', 'test1@test1.com', 'Vendedor', '1607292444.png', 1),
	(3, 'PRUEBA', 'CI', '78996532', 'Calle #12', '123456789', 'wilmernina18@gmail.com', 'Administrador', '1625439652.jpg', 1);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(250) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(11,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `imagen` varchar(50) NOT NULL DEFAULT 'anonymous.png',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  `modelo` varchar(100) DEFAULT NULL,
  `numserie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_producto_categoria1_idx` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.producto: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT IGNORE INTO `producto` (`idproducto`, `idcategoria`, `codigo`, `nombre`, `stock`, `precio`, `fecha`, `descripcion`, `imagen`, `condicion`, `modelo`, `numserie`) VALUES
	(13, 1, 'DFDF', 'SAMSUMG GALAXY A72', 0, 1800.00, '2021-06-08', 'SAMSUMG', '1624656994.jpg', 1, NULL, NULL),
	(14, 1, 'IICG', 'CURSO DE PRUEBA 2', 11, 500.00, '2021-06-10', 'CURSO 2', '1623459324.jpg', 1, NULL, NULL),
	(15, 4, 'IICG', 'BAKHOU BOXER', 10, 520.00, '2021-06-25', 'M', '1624657051.jpg', 1, NULL, NULL),
	(16, 1, 'NEZY', 'PRODUCTO', 9, 200.00, '2021-06-25', 'M', 'anonymous.png', 1, NULL, NULL),
	(17, 1, '25554', 'Coca Cola', 197, 200.00, '2021-06-11', 'xd', 'anonymous.png', 1, NULL, NULL),
	(18, 1, 'DDSDS', 'COCA SD', 198, 200.00, '2021-06-30', 'XD', 'anonymous.png', 1, NULL, NULL),
	(19, 1, 'IICG', 'Coca Cola', 10, 100.00, '2021-07-02', 'M', 'anonymous.png', 1, NULL, NULL),
	(20, 1, 'ed', 'fg', 400, 100.00, '2021-07-08', 'monto de inicio de caja', 'anonymous.png', 1, NULL, NULL),
	(21, 1, 'sdsdd', 'BAKHOU BOXER', 100, 80.00, '2021-06-11', 'ss', 'anonymous.png', 1, NULL, NULL),
	(22, 1, 'fggf', 'Manuel', 9, 1.00, '2021-06-11', 'kj', '1623461526.jpg', 1, NULL, NULL),
	(23, 1, 'f', 'no se gurda la imagen', 10, 100000.00, '0000-00-00', 'sdd', '1623461744.jpg', 1, NULL, NULL),
	(24, 1, 'ghghgh', 'esta si', 10, 40.00, '0000-00-00', 'monto de inicio de caja', 'anonymous.png', 1, NULL, NULL),
	(25, 1, '2442', 'pruebaaaa', 72, 25.00, '2021-05-15', 'dfdfdf\r\n', 'anonymous.png', 1, NULL, NULL),
	(26, 1, 'ASDSD', 'PROBANDO LA IMG', 200, 100.00, '2021-06-11', 'PROBANDO', 'anonymous.png', 1, NULL, NULL),
	(27, 1, 'SDASAS', 'PRUEBA IMG', 20, 5.00, '2021-06-11', 'XDD', '1623464750.jpeg', 1, NULL, NULL),
	(28, 1, 'HHJ', 'ererrtt', 20, 10.00, '2021-06-11', 'HGH', 'anonymous.png', 1, NULL, NULL),
	(29, 1, 'GHGH', 'FULL SMARTV HD', 10, 1200.00, '2021-06-11', 'LG', '1624656608.jpg', 1, 'm', 's'),
	(30, 1, '', 'CURSO DE PRUEBA 24444', 5, 85.00, '2021-07-04', 'M', '1625413837.png', 1, 'modelo', 'serie');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersonal` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_usuario_personal1_idx` (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT IGNORE INTO `usuario` (`idusuario`, `idpersonal`, `login`, `clave`, `condicion`) VALUES
	(1, 1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
	(4, 2, 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 1),
	(19, 3, 'AD', 'c7bf4bbdbcd88d9d7f7c7b299c94e9e52091af2fd2888ecf85a9d6a4160b4184', 1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.usuario_permiso
CREATE TABLE IF NOT EXISTS `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL,
  PRIMARY KEY (`idusuario_permiso`),
  KEY `fk_usuario_permiso_permiso_idx` (`idpermiso`),
  KEY `fk_usuario_permiso_usuario_idx` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.usuario_permiso: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_permiso` DISABLE KEYS */;
INSERT IGNORE INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
	(8, 1, 1),
	(9, 1, 2),
	(10, 1, 3),
	(11, 1, 4),
	(12, 1, 5),
	(13, 1, 5),
	(14, 1, 6),
	(15, 1, 7),
	(20, 4, 4),
	(21, 1, 8),
	(30, 5, 1),
	(31, 5, 2),
	(32, 5, 3),
	(33, 5, 4),
	(34, 5, 5),
	(35, 5, 6),
	(36, 5, 7),
	(37, 5, 8),
	(49, 19, 1),
	(50, 19, 2),
	(51, 19, 3),
	(52, 19, 4),
	(53, 19, 5),
	(54, 19, 6),
	(55, 19, 7),
	(56, 19, 8);
/*!40000 ALTER TABLE `usuario_permiso` ENABLE KEYS */;

-- Volcando estructura para tabla bdtunegociov2.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idPersonal` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `ventacredito` varchar(20) NOT NULL,
  `formapago` varchar(50) DEFAULT NULL,
  `numoperacion` varchar(100) DEFAULT NULL,
  `fechadeposito` datetime DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `totalrecibido` double DEFAULT NULL,
  `vuelto` double DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `DOV_Nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_persona_idx` (`idcliente`),
  KEY `fk_venta_Personal1_idx` (`idPersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdtunegociov2.venta: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT IGNORE INTO `venta` (`idventa`, `idcliente`, `idPersonal`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `ventacredito`, `formapago`, `numoperacion`, `fechadeposito`, `descuento`, `totalrecibido`, `vuelto`, `estado`, `DOV_Nombre`) VALUES
	(47, 2, 1, 'Boleta', '001', '0000001', '2021-06-17 00:00:00', 18.00, 1400.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(48, 4, 1, 'Boleta', '001', '0000002', '2021-04-01 00:00:00', 18.00, 39.20, 'Si', 'Transferencia', '', '0000-00-00 00:00:00', 2, 100, 60.8, 'Aceptado', NULL),
	(49, 2, 1, 'Boleta', '001', '0000003', '2021-06-17 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(50, 2, 1, 'Boleta', '001', '0000004', '2021-06-17 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 500, 'Aceptado', NULL),
	(51, 4, 1, 'Boleta', '001', '0000005', '2021-06-17 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(52, 2, 1, 'Boleta', '001', '0000006', '2021-06-17 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(53, 2, 1, 'Boleta', '001', '0000007', '2021-06-18 00:00:00', 18.00, 505.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(54, 4, 1, 'Boleta', '001', '0000008', '2021-05-01 00:00:00', 18.00, 25.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 50, 25, 'Aceptado', NULL),
	(55, 4, 1, 'Boleta', '001', '0000009', '2021-06-19 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(56, 2, 1, 'Factura', '001', '0000001', '2021-06-19 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(57, 4, 1, 'Nota', '001', '0000001', '2021-06-19 00:00:00', 0.00, 1000.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(58, 2, 1, 'Boleta', '001', '0000010', '2021-06-20 00:00:00', 18.00, 1000.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(59, 2, 1, 'Boleta', '001', '0000011', '2021-06-21 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(60, 2, 1, 'Boleta', '001', '0000012', '2021-06-21 00:00:00', 18.00, 180.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 10, 0, 0, 'Aceptado', NULL),
	(61, 2, 1, 'Boleta', '001', '0000013', '2021-06-22 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(62, 2, 1, 'Boleta', '001', '0000014', '2021-06-23 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(64, 2, 1, 'Boleta', '001', '0000015', '2021-06-25 00:00:00', 18.00, 25.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(65, 2, 1, 'Boleta', '001', '0000016', '2021-06-25 00:00:00', 18.00, 200.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(66, 4, 1, 'Boleta', '001', '0000017', '2021-06-25 00:00:00', 18.00, 25.00, 'No', 'Transferencia', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(67, 2, 1, 'Boleta', '001', '0000018', '2021-06-25 00:00:00', 18.00, 4100.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 5000, 900, 'Aceptado', NULL),
	(68, 2, 1, 'Boleta', '001', '0000019', '2021-06-29 00:00:00', 18.00, 825.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 1000, 175, 'Aceptado', NULL),
	(69, 2, 1, 'Boleta', '001', '0000020', '2021-07-01 00:00:00', 18.00, 500.00, 'No', 'Tarjeta', '0221212458454', '2021-07-01 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(70, 2, 2, 'Boleta', '001', '0000021', '2021-07-04 00:00:00', 18.00, 25.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(71, 2, 1, 'Boleta', '001', '0000022', '2021-07-04 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(72, 2, 1, 'Boleta', '001', '0000023', '2021-03-01 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(73, 2, 1, 'Boleta', '001', '0000024', '2021-07-08 00:00:00', 18.00, 500.00, 'No', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(74, 2, 1, 'Boleta', '001', '0000025', '2021-07-10 00:00:00', 18.00, 500.00, 'Si', 'Tarjeta', '11212', '2021-07-10 00:00:00', 0, 0, 0, 'Aceptado', NULL),
	(75, 2, 1, 'Boleta', '001', '0000026', '2021-07-11 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Anulado', NULL),
	(76, 2, 1, 'Boleta', '001', '0000027', '2021-07-11 00:00:00', 18.00, 500.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Anulado', NULL),
	(77, 4, 1, 'Boleta', '001', '0000028', '2021-07-12 00:00:00', 18.00, 200.00, 'Si', 'Efectivo', '', '0000-00-00 00:00:00', 0, 0, 0, 'Aceptado', NULL);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
