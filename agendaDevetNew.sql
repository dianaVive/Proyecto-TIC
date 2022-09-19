-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.10.1-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table agenda_devet.agenda
CREATE TABLE IF NOT EXISTS `agenda` (
  `id_servicio` int(11) NOT NULL,
  `id_mascota` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_servicio`,`id_mascota`,`fecha`) USING BTREE,
  KEY `FK_mascota` (`id_mascota`),
  CONSTRAINT `FK_mascotas` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  CONSTRAINT `FK_servicios` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table agenda_devet.agenda: ~0 rows (approximately)
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;

-- Dumping structure for table agenda_devet.mascotas
CREATE TABLE IF NOT EXISTS `mascotas` (
  `id_mascota` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo_mascota` varchar(12) DEFAULT NULL,
  `tamano_mascota` varchar(12) DEFAULT NULL,
  `nombre_mascota` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `FK_usuario` (`id_usuario`),
  CONSTRAINT `FK_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table agenda_devet.mascotas: ~0 rows (approximately)
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;

-- Dumping structure for table agenda_devet.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(100) DEFAULT NULL,
  `costo` double(22,2) DEFAULT NULL,
  `cantidad_servicios` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table agenda_devet.servicios: ~4 rows (approximately)
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` (`id_servicio`, `nombre_servicio`, `costo`, `cantidad_servicios`) VALUES
	(1, 'Consulta medica', 50000.00, 20),
	(2, 'Guarderia', 10000.00, 8),
	(3, 'Peluqueria', 40000.00, 10),
	(4, 'Paseo', 10000.00, 5);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;

-- Dumping structure for table agenda_devet.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `contrasena_usuario` varchar(100) NOT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `apellido_usuario` varchar(100) DEFAULT NULL,
  `correo_usuario` varchar(100) DEFAULT NULL,
  `telefono_usuario` varchar(12) DEFAULT NULL,
  `premium` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table agenda_devet.usuarios: ~3 rows (approximately)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id_usuario`, `contrasena_usuario`, `nombre_usuario`, `apellido_usuario`, `correo_usuario`, `telefono_usuario`, `premium`) VALUES
	(10001, '123456', 'Diana', 'Viveros', 'dianavive@gmail.com', '3125714517', 1),
	(10853, 'adri010', 'Adriana', 'Perez', 'adriana@gmail.com', '3005789311', 1),
	(15424, '000123', 'Fabian', 'Orozco', 'fabi@gmail.com', '3165789311', 0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
