-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.9.1-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para agenda_devet
CREATE DATABASE IF NOT EXISTS `agenda_devet` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `agenda_devet`;

-- Volcando estructura para tabla agenda_devet.agenda
CREATE TABLE IF NOT EXISTS `agenda` (
  `id_servicio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_servicio`,`id_usuario`,`fecha`) USING BTREE,
  KEY `FK_usuario` (`id_usuario`),
  CONSTRAINT `FK_servicios` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  CONSTRAINT `FK_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla agenda_devet.agenda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;

-- Volcando estructura para tabla agenda_devet.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(100) DEFAULT NULL,
  `costo` double(22,2) DEFAULT NULL,
  `cantidad_servicios` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla agenda_devet.servicios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` (`id_servicio`, `nombre_servicio`, `costo`, `cantidad_servicios`) VALUES
	(1, 'Consulta medica', 50000.00, 20),
	(2, 'Guarderia', 10000.00, 8),
	(3, 'Peluqueria', 40000.00, 10),
	(4, 'Paseo', 10000.00, 5);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;

-- Volcando estructura para tabla agenda_devet.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `contrasena_usuario` varchar(100) NOT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `apellido_usuario` varchar(100) DEFAULT NULL,
  `correo_usuario` varchar(100) DEFAULT NULL,
  `telefono_usuario` varchar(12) DEFAULT NULL,
  `tipo_mascota` varchar(12) DEFAULT NULL,
  `tamano_mascota` varchar(12) DEFAULT NULL,
  `nombre_mascota` varchar(12) DEFAULT NULL,
  `saldo_usuario` double(22,2) DEFAULT NULL,
  `premium` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla agenda_devet.usuarios: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id_usuario`, `contrasena_usuario`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `telefono_usuario`, `tipo_mascota`, `tamano_mascota`, `nombre_mascota`, `saldo_usuario`, `premium`) VALUES
	(10001, '123456', 'Diana', 'Viveros', 'dianavive@gmail.com', '3125714517', 'gato', 'mediano', 'Arya', 10000.00, 1),
	(10853, 'adri010', 'Adriana', 'Perez', 'adriana@gmail.com', '3005789311', 'perro', 'Grande', 'Rambo', 50000.00, 1),
	(15424, '000123', 'Fabian', 'Orozco', 'fabi@gmail.com', '3165789311', 'tortuga', 'pequena', 'Lisa', 80000.00, 0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
