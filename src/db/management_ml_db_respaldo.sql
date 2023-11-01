-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: management_ml_db_dev_pro
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrative_processes`
--

DROP TABLE IF EXISTS `administrative_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrative_processes` (
  `prc_id` int NOT NULL AUTO_INCREMENT,
  `process_label` varchar(100) NOT NULL,
  `prc_order` int NOT NULL,
  `prc_state` tinyint(1) NOT NULL DEFAULT (true),
  PRIMARY KEY (`prc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrative_processes`
--

LOCK TABLES `administrative_processes` WRITE;
/*!40000 ALTER TABLE `administrative_processes` DISABLE KEYS */;
INSERT INTO `administrative_processes` VALUES (1,'REGISTRO DE UNIDADES',1,1),(2,'VALIDACIÓN DE UNIDADES',2,1);
/*!40000 ALTER TABLE `administrative_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrative_processes_x_ocr`
--

DROP TABLE IF EXISTS `administrative_processes_x_ocr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrative_processes_x_ocr` (
  `ocr_id` int NOT NULL,
  `prc_id` int NOT NULL,
  `created_by_id` varchar(20) NOT NULL,
  `created_dete` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ocr_id`,`prc_id`),
  KEY `prc_id` (`prc_id`),
  CONSTRAINT `administrative_processes_x_ocr_ibfk_1` FOREIGN KEY (`ocr_id`) REFERENCES `ocr` (`ocr_id`),
  CONSTRAINT `administrative_processes_x_ocr_ibfk_2` FOREIGN KEY (`prc_id`) REFERENCES `administrative_processes` (`prc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrative_processes_x_ocr`
--

LOCK TABLES `administrative_processes_x_ocr` WRITE;
/*!40000 ALTER TABLE `administrative_processes_x_ocr` DISABLE KEYS */;
INSERT INTO `administrative_processes_x_ocr` VALUES (113,2,'1146441925','2023-10-27 21:30:15'),(114,2,'1146441925','2023-10-27 19:42:17'),(117,2,'1146441925','2023-10-27 20:53:30');
/*!40000 ALTER TABLE `administrative_processes_x_ocr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anomaly`
--

DROP TABLE IF EXISTS `anomaly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anomaly` (
  `anm_cod` varchar(5) NOT NULL,
  `anomaly_label` varchar(50) NOT NULL,
  PRIMARY KEY (`anm_cod`),
  UNIQUE KEY `anomaly_label` (`anomaly_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anomaly`
--

LOCK TABLES `anomaly` WRITE;
/*!40000 ALTER TABLE `anomaly` DISABLE KEYS */;
INSERT INTO `anomaly` VALUES ('07','APRENDIZAJE'),('09','AUSENTISMO'),('03','CALIDAD'),('10','CAPACITACION'),('02','DAÑO MECÁNICO'),('05','FALTANTE DE CORTE'),('04','FALTANTE DE INSUMOS'),('06','FALTANTE DE PREHORMADO'),('08','MOLDERIA/DESARROLLO'),('01','MONTAJE');
/*!40000 ALTER TABLE `anomaly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_label` varchar(50) NOT NULL,
  `color_id` varchar(10) NOT NULL,
  PRIMARY KEY (`color_id`),
  UNIQUE KEY `color_label` (`color_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES ('AMARILLO','1900'),('AZUL/NOCH','1417'),('BLANCO','1100'),('NEGRO','1200'),('PALO/ROSA','1603'),('PIEL','1300');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_type` (
  `dot_id` int NOT NULL AUTO_INCREMENT,
  `dot_label` varchar(50) NOT NULL,
  PRIMARY KEY (`dot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type`
--

LOCK TABLES `document_type` WRITE;
/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
INSERT INTO `document_type` VALUES (1,'CEDULA DE CIUDADANIA'),(2,'TARGETA DE IDENTIDAD'),(3,'CERTIFICADO EXEPCIONAL Y DE NACIONALIDAD');
/*!40000 ALTER TABLE `document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ean`
--

DROP TABLE IF EXISTS `ean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ean` (
  `ean_id` varchar(20) NOT NULL,
  PRIMARY KEY (`ean_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ean`
--

LOCK TABLES `ean` WRITE;
/*!40000 ALTER TABLE `ean` DISABLE KEYS */;
INSERT INTO `ean` VALUES ('7705531136770'),('7705531136787'),('7705531136794'),('7705531136800'),('7705531141828'),('7705531141835'),('7705531141842'),('7705531141859'),('7705531159922'),('7705531159939'),('7705531159946'),('7705531159953'),('7705531160560'),('7705531160577'),('7705531160584'),('7705531160591'),('7705531160605'),('7705531160606'),('7705531160607'),('7705531161833'),('7705531169631'),('7705531169632'),('7705531169633'),('7705531169634'),('7705531169754');
/*!40000 ALTER TABLE `ean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_code` varchar(20) NOT NULL,
  `emp_description` varchar(100) NOT NULL DEFAULT (_utf8mb4'Operario(a) de Máquina'),
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_x_modulo`
--

DROP TABLE IF EXISTS `employee_x_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_x_modulo` (
  `emp_code` varchar(20) NOT NULL,
  `mdl_id` int unsigned NOT NULL,
  PRIMARY KEY (`emp_code`,`mdl_id`),
  KEY `mdl_id` (`mdl_id`),
  CONSTRAINT `employee_x_modulo_ibfk_1` FOREIGN KEY (`emp_code`) REFERENCES `employee` (`emp_code`),
  CONSTRAINT `employee_x_modulo_ibfk_2` FOREIGN KEY (`mdl_id`) REFERENCES `modulo` (`mdl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_x_modulo`
--

LOCK TABLES `employee_x_modulo` WRITE;
/*!40000 ALTER TABLE `employee_x_modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_x_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environment`
--

DROP TABLE IF EXISTS `environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `environment` (
  `env_id` int NOT NULL AUTO_INCREMENT,
  `env_label` varchar(50) NOT NULL,
  `env_state` tinyint(1) NOT NULL DEFAULT (true),
  PRIMARY KEY (`env_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environment`
--

LOCK TABLES `environment` WRITE;
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
INSERT INTO `environment` VALUES (1,'MOVIL',1),(2,'WEB',1),(3,'DESKTOP',1);
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `mnu_id` int NOT NULL AUTO_INCREMENT,
  `mnu_label` varchar(50) NOT NULL,
  `mnu_state` tinyint(1) NOT NULL DEFAULT (true),
  `mnu_order_field` int NOT NULL,
  `master_id` int DEFAULT NULL,
  PRIMARY KEY (`mnu_id`),
  KEY `master_id` (`master_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `menu` (`mnu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Cuenta',1,1,NULL),(2,'Administarción',1,2,NULL),(3,'Procesos',1,3,NULL),(4,'Analiticas',1,4,NULL),(5,'Vista',1,5,NULL),(6,'Administrar perfíl',1,1,1),(7,'Cuentas',1,1,2),(8,'Items',1,2,2),(9,'Administración de Operarios',1,1,3),(10,'Administrar OCR',1,2,3),(11,'Administrar OP',1,3,3),(12,'Modulos',1,4,3),(13,'Analíticas OCR',1,1,4),(14,'Analíticas OP',1,2,4),(15,'Modulos',1,3,4),(16,'Administrar modulos',1,1,12),(17,'Asignación de modulos',1,2,12),(18,'Eficiencia',1,1,15),(19,'Cerrar sesión',1,2,1),(20,'Codigos De Barras',1,1,8),(21,'Colores',1,2,8),(22,'Modulos',1,3,8),(23,'Talla',1,4,8);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_x_environment`
--

DROP TABLE IF EXISTS `menu_x_environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_x_environment` (
  `mnu_id` int NOT NULL,
  `env_id` int NOT NULL,
  PRIMARY KEY (`mnu_id`,`env_id`),
  KEY `env_id` (`env_id`),
  CONSTRAINT `menu_x_environment_ibfk_1` FOREIGN KEY (`mnu_id`) REFERENCES `menu` (`mnu_id`),
  CONSTRAINT `menu_x_environment_ibfk_2` FOREIGN KEY (`env_id`) REFERENCES `environment` (`env_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_x_environment`
--

LOCK TABLES `menu_x_environment` WRITE;
/*!40000 ALTER TABLE `menu_x_environment` DISABLE KEYS */;
INSERT INTO `menu_x_environment` VALUES (1,1),(3,1),(4,1),(5,1),(6,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(18,1),(19,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3);
/*!40000 ALTER TABLE `menu_x_environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_x_environment_x_operation`
--

DROP TABLE IF EXISTS `menu_x_environment_x_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_x_environment_x_operation` (
  `mnu_id` int NOT NULL,
  `env_id` int NOT NULL,
  `ope_id` int NOT NULL,
  PRIMARY KEY (`mnu_id`,`env_id`,`ope_id`),
  KEY `ope_id` (`ope_id`),
  CONSTRAINT `menu_x_environment_x_operation_ibfk_1` FOREIGN KEY (`mnu_id`, `env_id`) REFERENCES `menu_x_environment` (`mnu_id`, `env_id`),
  CONSTRAINT `menu_x_environment_x_operation_ibfk_2` FOREIGN KEY (`ope_id`) REFERENCES `operation` (`ope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_x_environment_x_operation`
--

LOCK TABLES `menu_x_environment_x_operation` WRITE;
/*!40000 ALTER TABLE `menu_x_environment_x_operation` DISABLE KEYS */;
INSERT INTO `menu_x_environment_x_operation` VALUES (6,1,5),(6,2,5),(6,3,5),(6,2,6),(6,3,6),(19,1,7),(19,2,7),(19,3,7),(7,2,8),(7,3,8),(7,2,9),(7,3,9),(7,2,10),(7,3,10),(7,2,11),(7,3,11),(7,2,12),(7,3,12),(7,2,13),(7,3,13),(7,2,14),(7,3,14),(23,2,15),(23,3,15),(23,2,16),(23,3,16),(23,2,17),(23,3,17),(23,2,18),(23,3,18),(23,2,19),(23,3,19),(23,2,20),(23,3,20),(22,2,21),(22,3,21),(22,2,22),(22,3,22),(22,2,23),(22,3,23),(22,2,24),(22,3,24),(22,2,25),(22,3,25),(22,2,26),(22,3,26),(21,2,27),(21,3,27),(21,2,28),(21,3,28),(21,2,29),(21,3,29),(20,2,30),(20,3,30),(10,1,31),(10,3,31),(10,2,32),(10,3,32),(10,1,33),(10,2,33),(10,3,33),(10,1,34),(10,2,34),(10,3,34),(10,2,35),(10,3,35),(10,2,36),(10,3,36),(10,2,37),(10,3,37),(11,1,38),(11,2,38),(11,3,38),(11,2,39),(11,3,39),(11,2,40),(11,3,40),(11,1,41),(11,2,41),(11,3,41),(11,2,42),(11,3,42),(11,2,43),(11,3,43);
/*!40000 ALTER TABLE `menu_x_environment_x_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnu_x_env_x_ope_x_prf`
--

DROP TABLE IF EXISTS `mnu_x_env_x_ope_x_prf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mnu_x_env_x_ope_x_prf` (
  `mnu_id` int NOT NULL,
  `env_id` int NOT NULL,
  `ope_id` int NOT NULL,
  `prf_id` int NOT NULL,
  PRIMARY KEY (`mnu_id`,`env_id`,`ope_id`,`prf_id`),
  KEY `prf_id` (`prf_id`),
  CONSTRAINT `mnu_x_env_x_ope_x_prf_ibfk_1` FOREIGN KEY (`mnu_id`, `env_id`, `ope_id`) REFERENCES `menu_x_environment_x_operation` (`mnu_id`, `env_id`, `ope_id`),
  CONSTRAINT `mnu_x_env_x_ope_x_prf_ibfk_2` FOREIGN KEY (`prf_id`) REFERENCES `user_profile` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnu_x_env_x_ope_x_prf`
--

LOCK TABLES `mnu_x_env_x_ope_x_prf` WRITE;
/*!40000 ALTER TABLE `mnu_x_env_x_ope_x_prf` DISABLE KEYS */;
INSERT INTO `mnu_x_env_x_ope_x_prf` VALUES (6,1,5,1),(6,2,5,1),(6,2,6,1),(7,2,8,1),(7,2,9,1),(7,2,10,1),(7,2,11,1),(7,2,12,1),(7,2,13,1),(7,2,14,1),(10,1,31,1),(10,1,33,1),(10,1,34,1),(10,2,32,1),(10,2,33,1),(10,2,34,1),(10,2,35,1),(10,2,36,1),(10,2,37,1),(11,1,38,1),(11,1,41,1),(11,2,38,1),(11,2,39,1),(11,2,40,1),(11,2,41,1),(11,2,42,1),(11,2,43,1),(11,3,40,1),(11,3,41,1),(11,3,42,1),(11,3,43,1),(19,1,7,1),(19,2,7,1),(19,3,7,1),(20,2,30,1),(20,3,30,1),(21,2,27,1),(21,2,28,1),(21,2,29,1),(21,3,27,1),(21,3,28,1),(21,3,29,1),(22,2,21,1),(22,2,22,1),(22,2,23,1),(22,2,24,1),(22,2,25,1),(22,2,26,1),(22,3,21,1),(22,3,22,1),(22,3,23,1),(22,3,24,1),(22,3,25,1),(22,3,26,1),(23,2,15,1),(23,2,16,1),(23,2,17,1),(23,3,15,1),(23,3,16,1),(23,3,17,1),(23,3,18,1),(23,3,19,1),(23,3,20,1);
/*!40000 ALTER TABLE `mnu_x_env_x_ope_x_prf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `mdl_id` int unsigned NOT NULL,
  `number_employees` int unsigned DEFAULT (NULL),
  `number_machine` int DEFAULT NULL,
  `operation_state` tinyint(1) NOT NULL DEFAULT (true),
  `modulo_state` tinyint(1) NOT NULL DEFAULT (true),
  `mdl_label` varchar(50) NOT NULL,
  PRIMARY KEY (`mdl_id`),
  UNIQUE KEY `mdl_id` (`mdl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,11,NULL,1,1,'MODULO-1'),(2,11,NULL,1,1,'MODULO-2'),(3,9,NULL,1,1,'MODULO-3'),(4,5,NULL,1,1,'MODULO-4'),(5,9,NULL,1,1,'MODULO-5'),(6,8,NULL,1,1,'MODULO-6'),(7,8,NULL,1,1,'MODULO-7'),(8,9,NULL,1,1,'MODULO-8'),(9,10,NULL,1,1,'MODULO-9'),(10,7,NULL,1,1,'MODULO-10'),(11,8,NULL,1,1,'MODULO-11'),(12,10,NULL,1,1,'MODULO-12'),(13,12,NULL,1,1,'MODULO-13'),(14,10,NULL,1,1,'MODULO-14'),(15,7,NULL,1,1,'MODULO-15'),(16,8,NULL,1,1,'MODULO-16'),(17,10,NULL,1,1,'MODULO-17'),(18,11,NULL,1,1,'MODULO-18');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo_log`
--

DROP TABLE IF EXISTS `modulo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo_log` (
  `mdl_log_id` int NOT NULL AUTO_INCREMENT,
  `modify_modulo_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_modulo_by_id` varchar(50) NOT NULL,
  `modify_modulo_description` varchar(50) NOT NULL,
  `modified_modulo_value` varchar(50) NOT NULL,
  `mdl_id` int unsigned NOT NULL,
  PRIMARY KEY (`mdl_log_id`),
  KEY `mdl_id` (`mdl_id`),
  CONSTRAINT `modulo_log_ibfk_1` FOREIGN KEY (`mdl_id`) REFERENCES `modulo` (`mdl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo_log`
--

LOCK TABLES `modulo_log` WRITE;
/*!40000 ALTER TABLE `modulo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocr`
--

DROP TABLE IF EXISTS `ocr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocr` (
  `ocr_id` int NOT NULL AUTO_INCREMENT,
  `spe_color_id` varchar(10) NOT NULL,
  `spe_talla_id` varchar(10) NOT NULL,
  `spe_op_id` varchar(50) NOT NULL,
  `mdl_id` int unsigned NOT NULL,
  `dete_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_operation` time DEFAULT NULL,
  `finish_operation` time DEFAULT NULL,
  `units_cant` int unsigned NOT NULL DEFAULT (0),
  `register_by_id` varchar(20) NOT NULL,
  `ocr_state_description` enum('ENABLE','DISABLE') NOT NULL DEFAULT (_utf8mb4'ENABLE'),
  `ocr_state` tinyint(1) NOT NULL DEFAULT (true),
  `anm_cod` varchar(5) DEFAULT NULL,
  `ctg_id` int DEFAULT NULL,
  PRIMARY KEY (`ocr_id`),
  KEY `spe_op_id` (`spe_op_id`,`spe_talla_id`,`spe_color_id`),
  KEY `mdl_id` (`mdl_id`),
  KEY `anm_cod` (`anm_cod`),
  KEY `ctg_id` (`ctg_id`),
  CONSTRAINT `ocr_ibfk_1` FOREIGN KEY (`spe_op_id`, `spe_talla_id`, `spe_color_id`) REFERENCES `specifications_op` (`op_id`, `talla_id`, `color_id`),
  CONSTRAINT `ocr_ibfk_2` FOREIGN KEY (`mdl_id`) REFERENCES `modulo` (`mdl_id`),
  CONSTRAINT `ocr_ibfk_3` FOREIGN KEY (`anm_cod`) REFERENCES `anomaly` (`anm_cod`),
  CONSTRAINT `ocr_ibfk_4` FOREIGN KEY (`ctg_id`) REFERENCES `ocr_category` (`ctg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocr`
--

LOCK TABLES `ocr` WRITE;
/*!40000 ALTER TABLE `ocr` DISABLE KEYS */;
INSERT INTO `ocr` VALUES (110,'1200','40','MOB3548',3,'2023-10-13 22:09:12','04:58:23','05:50:45',50,'1146441925','ENABLE',1,NULL,NULL),(111,'1200','40','MOB3548',3,'2023-10-13 22:18:13','04:58:23','05:50:45',100,'1146441925','ENABLE',1,NULL,NULL),(112,'1200','38','MOB3548',3,'2023-10-23 19:23:57','10:25:45','11:25:45',25,'1146441925','ENABLE',1,'01',1),(113,'1200','38','MOB3548',3,'2023-10-23 19:26:39','11:25:45','12:25:45',200,'1146441925','ENABLE',1,'01',1),(114,'1200','38','MOB3548',3,'2023-10-23 20:45:01','12:54:37','01:54:32',10,'1146441925','ENABLE',1,NULL,1),(116,'1200','34','MOB3544',2,'2023-10-27 20:45:39','12:25:45','01:24:22',45,'1146441925','ENABLE',1,NULL,1),(117,'1200','34','MOB3544',2,'2023-10-27 20:46:53','01:25:45','02:24:22',50,'1146441925','ENABLE',1,NULL,1),(118,'1200','34','MOB3544',10,'2023-10-27 20:58:26','01:25:45','02:24:22',50,'1146441925','ENABLE',1,NULL,1);
/*!40000 ALTER TABLE `ocr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocr_category`
--

DROP TABLE IF EXISTS `ocr_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocr_category` (
  `ctg_id` int NOT NULL,
  `ctg_label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ctg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocr_category`
--

LOCK TABLES `ocr_category` WRITE;
/*!40000 ALTER TABLE `ocr_category` DISABLE KEYS */;
INSERT INTO `ocr_category` VALUES (1,'UNIDADES DE PRIMERA'),(2,'UNIDADES DE SEGUNDA');
/*!40000 ALTER TABLE `ocr_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocr_log`
--

DROP TABLE IF EXISTS `ocr_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocr_log` (
  `ocr_log_id` int NOT NULL AUTO_INCREMENT,
  `modify_ocr_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_ocr_by_id` varchar(50) NOT NULL,
  `modify_ocr_description` varchar(50) NOT NULL,
  `modified_ocr_value` varchar(50) NOT NULL,
  `ocr_id` int NOT NULL,
  PRIMARY KEY (`ocr_log_id`),
  KEY `ocr_id` (`ocr_id`),
  CONSTRAINT `ocr_log_ibfk_1` FOREIGN KEY (`ocr_id`) REFERENCES `ocr` (`ocr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocr_log`
--

LOCK TABLES `ocr_log` WRITE;
/*!40000 ALTER TABLE `ocr_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocr_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `op`
--

DROP TABLE IF EXISTS `op`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `op` (
  `op` varchar(50) NOT NULL,
  `ref` varchar(20) NOT NULL,
  `cant_ocr` int NOT NULL DEFAULT (0),
  `cant_planned` double NOT NULL DEFAULT (0),
  `cant_completed` double NOT NULL DEFAULT (0),
  `op_state` tinyint(1) NOT NULL DEFAULT (true),
  `op_state_description` enum('ENABLE','DISABLE') NOT NULL DEFAULT (_utf8mb4'ENABLE'),
  `op_creation_dete` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`op`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `op`
--

LOCK TABLES `op` WRITE;
/*!40000 ALTER TABLE `op` DISABLE KEYS */;
INSERT INTO `op` VALUES ('MOB3544','MAR110669',3,650,145,1,'ENABLE','2023-10-12 16:17:05'),('MOB3548','MAR110669',5,1000,385,1,'ENABLE','2023-10-13 10:10:09'),('MOB3674','MAR110666',0,1000,0,1,'ENABLE','2023-10-27 15:16:18'),('MOB3709','MAR110558',0,1450,0,1,'ENABLE','2023-10-27 14:59:25'),('MOB3714','MAR110685',0,650,0,1,'ENABLE','2023-10-12 16:28:52'),('MOP3917','MAR8237',0,2700,0,1,'ENABLE','2023-10-27 14:55:28');
/*!40000 ALTER TABLE `op` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `op_log`
--

DROP TABLE IF EXISTS `op_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `op_log` (
  `op_log_id` int NOT NULL AUTO_INCREMENT,
  `modify_op_dete` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_op_by_id` varchar(50) NOT NULL,
  `modify_op_description` varchar(50) NOT NULL,
  `modify_op_value` varchar(20) NOT NULL,
  `op_id` varchar(50) NOT NULL,
  PRIMARY KEY (`op_log_id`),
  KEY `op_id` (`op_id`),
  CONSTRAINT `op_log_ibfk_1` FOREIGN KEY (`op_id`) REFERENCES `op` (`op`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `op_log`
--

LOCK TABLES `op_log` WRITE;
/*!40000 ALTER TABLE `op_log` DISABLE KEYS */;
INSERT INTO `op_log` VALUES (1,'2023-10-12 21:17:05','1146441925','APERTURA DE OP','NINGUNO','MOB3544'),(2,'2023-10-12 21:28:52','1146441925','APERTURA DE OP','NINGUNO','MOB3714'),(3,'2023-10-13 15:10:09','1146441925','APERTURA DE OP','NINGUNO','MOB3548'),(4,'2023-10-27 19:55:28','1146441925','APERTURA DE OP','NINGUNO','MOP3917'),(5,'2023-10-27 19:59:25','1146441925','APERTURA DE OP','NINGUNO','MOB3709'),(6,'2023-10-27 20:16:18','1146441925','APERTURA DE OP','NINGUNO','MOB3674');
/*!40000 ALTER TABLE `op_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `op_process_log`
--

DROP TABLE IF EXISTS `op_process_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `op_process_log` (
  `op_id` varchar(50) NOT NULL,
  `op_dete_open_task` datetime DEFAULT NULL,
  `op_dete_close_task` datetime DEFAULT NULL,
  `op_dete_open_planned` datetime DEFAULT NULL,
  `op_dete_close_planned` datetime DEFAULT NULL,
  PRIMARY KEY (`op_id`),
  CONSTRAINT `op_process_log_ibfk_1` FOREIGN KEY (`op_id`) REFERENCES `op` (`op`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `op_process_log`
--

LOCK TABLES `op_process_log` WRITE;
/*!40000 ALTER TABLE `op_process_log` DISABLE KEYS */;
INSERT INTO `op_process_log` VALUES ('MOB3544','2023-10-27 15:45:39',NULL,NULL,NULL);
/*!40000 ALTER TABLE `op_process_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `ope_id` int NOT NULL AUTO_INCREMENT,
  `operation_label` varchar(50) NOT NULL,
  PRIMARY KEY (`ope_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` VALUES (5,'Ver Perfíl'),(6,'Editar Perfíl'),(7,'Eliminar Sesión'),(8,'Crear Cuenta'),(9,'Editar Cuenta'),(10,'Ver Cuentas Habilidatas'),(11,'Ver Cuentas Deshabilitadas'),(12,'Habilitar Cuenta'),(13,'Deshabilar Cuenta'),(14,'Buscar Cuenta'),(15,'Crear Talla'),(16,'Editar Talla'),(17,'Ver Tallas'),(18,'Ver Tallas Deshabilitadas'),(19,'Habilitar Talla'),(20,'Deshabilar Talla'),(21,'Agregar Módulo'),(22,'Editar Módulo'),(23,'Ver Detalles de Modulós'),(24,'Ver Módulos Deshabilitados'),(25,'Habilitar Módulo'),(26,'Deshabilar Módulo'),(27,'Agregar Color'),(28,'Editar Nombre de Color'),(29,'Ver Colores Disponibles'),(30,'Agregar Código de Barras'),(31,'Crear OCR'),(32,'Eliminar OCR'),(33,'Editar OCR'),(34,'Ver OCR'),(35,'Deshabilitar OCR'),(36,'Habilitar OCR'),(37,'Buscar OCR'),(38,'Abrir OP'),(39,'Eliminar OP'),(40,'Editar OP'),(41,'Ver Todas las OP'),(42,'Ver OP Deshabilitadas'),(43,'Ver OP Habilitadas'),(44,'Habilitar OP'),(45,'Buscar OP'),(46,'Agregar Operario'),(47,'Eliminar Operario'),(48,'Editar Detalles de Operario'),(49,'Ver Todos los Operarios(a)'),(50,'Ver Operarios Deshabilitados'),(51,'Ver Operarios Habilitados'),(52,'Habilitar Operario'),(53,'Buscar Operario');
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spe_op_log`
--

DROP TABLE IF EXISTS `spe_op_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spe_op_log` (
  `spe_log_id` int NOT NULL AUTO_INCREMENT,
  `modify_spe_op_dete` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_spe_op_by_id` varchar(50) NOT NULL,
  `modify_spe_op_description` varchar(50) NOT NULL,
  `modify_spe_op_value` varchar(20) NOT NULL,
  `op_id` varchar(50) NOT NULL,
  `talla_id` varchar(10) NOT NULL,
  `color_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`spe_log_id`),
  KEY `op_id` (`op_id`,`talla_id`,`color_id`),
  CONSTRAINT `spe_op_log_ibfk_1` FOREIGN KEY (`op_id`, `talla_id`, `color_id`) REFERENCES `specifications_op` (`op_id`, `talla_id`, `color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spe_op_log`
--

LOCK TABLES `spe_op_log` WRITE;
/*!40000 ALTER TABLE `spe_op_log` DISABLE KEYS */;
INSERT INTO `spe_op_log` VALUES (14,'2023-10-27 19:55:28','1146441925','APERTURA DE OP','NINGUNO','MOP3917','L','1603'),(15,'2023-10-27 19:55:28','1146441925','APERTURA DE OP','NINGUNO','MOP3917','M','1603'),(16,'2023-10-27 19:55:29','1146441925','APERTURA DE OP','NINGUNO','MOP3917','S','1603'),(17,'2023-10-27 19:55:29','1146441925','APERTURA DE OP','NINGUNO','MOP3917','XL','1603'),(18,'2023-10-27 19:59:25','1146441925','APERTURA DE OP','NINGUNO','MOB3709','34','1300'),(19,'2023-10-27 19:59:25','1146441925','APERTURA DE OP','NINGUNO','MOB3709','36','1300'),(20,'2023-10-27 19:59:25','1146441925','APERTURA DE OP','NINGUNO','MOB3709','38','1300'),(21,'2023-10-27 19:59:25','1146441925','APERTURA DE OP','NINGUNO','MOB3709','40','1300'),(22,'2023-10-27 20:16:18','1146441925','APERTURA DE OP','NINGUNO','MOB3674','34','1100'),(23,'2023-10-27 20:16:18','1146441925','APERTURA DE OP','NINGUNO','MOB3674','36','1100'),(24,'2023-10-27 20:16:18','1146441925','APERTURA DE OP','NINGUNO','MOB3674','38','1100'),(25,'2023-10-27 20:16:18','1146441925','APERTURA DE OP','NINGUNO','MOB3674','40','1100');
/*!40000 ALTER TABLE `spe_op_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spe_op_process_log`
--

DROP TABLE IF EXISTS `spe_op_process_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spe_op_process_log` (
  `color_id` varchar(10) NOT NULL,
  `talla_id` varchar(10) NOT NULL,
  `op_id` varchar(50) NOT NULL,
  `spe_op_dete_open_task` datetime DEFAULT NULL,
  `spe_op_dete_close_task` datetime DEFAULT NULL,
  `spe_op_dete_open_planned` datetime DEFAULT NULL,
  `spe_op_dete_close_planned` datetime DEFAULT NULL,
  PRIMARY KEY (`op_id`,`talla_id`,`color_id`),
  CONSTRAINT `spe_op_process_log_ibfk_1` FOREIGN KEY (`op_id`, `talla_id`, `color_id`) REFERENCES `specifications_op` (`op_id`, `talla_id`, `color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spe_op_process_log`
--

LOCK TABLES `spe_op_process_log` WRITE;
/*!40000 ALTER TABLE `spe_op_process_log` DISABLE KEYS */;
INSERT INTO `spe_op_process_log` VALUES ('1200','34','MOB3544','2023-10-27 15:45:39',NULL,NULL,NULL);
/*!40000 ALTER TABLE `spe_op_process_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specifications_op`
--

DROP TABLE IF EXISTS `specifications_op`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specifications_op` (
  `color_id` varchar(10) NOT NULL,
  `talla_id` varchar(10) NOT NULL,
  `op_id` varchar(50) NOT NULL,
  `cant_ocr` int NOT NULL DEFAULT (0),
  `cant_spe_planned` double NOT NULL DEFAULT (0),
  `cant_spe_completed` double NOT NULL DEFAULT (0),
  `spe_state` tinyint(1) NOT NULL DEFAULT (true),
  `spe_state_description` enum('ENABLE','DISABLE') NOT NULL DEFAULT (_utf8mb4'ENABLE'),
  `ean_id` varchar(15) NOT NULL,
  `spe_op_creation_dete` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`op_id`,`talla_id`,`color_id`),
  KEY `talla_id` (`talla_id`),
  KEY `color_id` (`color_id`),
  KEY `specifications_op_ibfk_4` (`ean_id`),
  CONSTRAINT `specifications_op_ibfk_1` FOREIGN KEY (`op_id`) REFERENCES `op` (`op`),
  CONSTRAINT `specifications_op_ibfk_2` FOREIGN KEY (`talla_id`) REFERENCES `talla` (`tll_id`),
  CONSTRAINT `specifications_op_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  CONSTRAINT `specifications_op_ibfk_4` FOREIGN KEY (`ean_id`) REFERENCES `ean` (`ean_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specifications_op`
--

LOCK TABLES `specifications_op` WRITE;
/*!40000 ALTER TABLE `specifications_op` DISABLE KEYS */;
INSERT INTO `specifications_op` VALUES ('1200','34','MOB3544',3,200,145,1,'ENABLE','7705531160607','2023-10-12 16:17:30'),('1200','36','MOB3544',0,150,0,1,'ENABLE','7705531160607','2023-10-12 16:17:23'),('1200','38','MOB3544',0,150,0,1,'ENABLE','7705531160607','2023-10-12 16:17:20'),('1200','40','MOB3544',0,150,0,1,'ENABLE','7705531160607','2023-10-12 16:17:05'),('1200','32','MOB3548',0,100,0,1,'ENABLE','7705531160560','2023-10-13 10:10:09'),('1200','34','MOB3548',0,300,0,1,'ENABLE','7705531160577','2023-10-13 10:10:09'),('1200','36','MOB3548',0,300,0,1,'ENABLE','7705531160584','2023-10-13 10:10:09'),('1200','38','MOB3548',3,200,235,1,'ENABLE','7705531160591','2023-10-13 10:10:09'),('1200','40','MOB3548',2,100,150,1,'ENABLE','7705531160607','2023-10-13 10:10:09'),('1100','34','MOB3674',0,150,0,1,'ENABLE','7705531159922','2023-10-27 15:16:18'),('1100','36','MOB3674',0,350,0,1,'ENABLE','7705531159939','2023-10-27 15:16:18'),('1100','38','MOB3674',0,350,0,1,'ENABLE','7705531159946','2023-10-27 15:16:18'),('1100','40','MOB3674',0,150,0,1,'ENABLE','7705531159953','2023-10-27 15:16:18'),('1300','34','MOB3709',0,300,0,1,'ENABLE','7705531136770','2023-10-27 14:59:25'),('1300','36','MOB3709',0,550,0,1,'ENABLE','7705531136787','2023-10-27 14:59:25'),('1300','38','MOB3709',0,400,0,1,'ENABLE','7705531136794','2023-10-27 14:59:25'),('1300','40','MOB3709',0,200,0,1,'ENABLE','7705531136800','2023-10-27 14:59:25'),('1100','34','MOB3714',0,100,0,1,'ENABLE','7705531169634','2023-10-12 16:29:26'),('1100','36','MOB3714',0,150,0,1,'ENABLE','7705531169633','2023-10-12 16:29:12'),('1100','38','MOB3714',0,200,0,1,'ENABLE','7705531169632','2023-10-12 16:29:02'),('1100','40','MOB3714',0,200,0,1,'ENABLE','7705531169631','2023-10-12 16:28:52'),('1603','L','MOP3917',0,800,0,1,'ENABLE','7705531141842','2023-10-27 14:55:28'),('1603','M','MOP3917',0,1100,0,1,'ENABLE','7705531141835','2023-10-27 14:55:28'),('1603','S','MOP3917',0,400,0,1,'ENABLE','7705531141828','2023-10-27 14:55:29'),('1603','XL','MOP3917',0,400,0,1,'ENABLE','7705531141859','2023-10-27 14:55:29');
/*!40000 ALTER TABLE `specifications_op` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talla`
--

DROP TABLE IF EXISTS `talla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talla` (
  `tll_id` varchar(10) NOT NULL,
  PRIMARY KEY (`tll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talla`
--

LOCK TABLES `talla` WRITE;
/*!40000 ALTER TABLE `talla` DISABLE KEYS */;
INSERT INTO `talla` VALUES ('32'),('34'),('36'),('38'),('40'),('L'),('M'),('S'),('X'),('XL');
/*!40000 ALTER TABLE `talla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_information`
--

DROP TABLE IF EXISTS `user_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_information` (
  `user_document_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_description` varchar(50) NOT NULL DEFAULT (_utf8mb4'OPERARIO'),
  `user_state` tinyint(1) NOT NULL DEFAULT (true),
  `user_state_description` enum('ENABLE','DISABLE') NOT NULL DEFAULT (_utf8mb4'ENABLE'),
  `user_create_dete` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_id` int NOT NULL,
  `document_type_id` int NOT NULL,
  PRIMARY KEY (`user_document_id`),
  KEY `profile_id` (`profile_id`),
  KEY `document_type_id` (`document_type_id`),
  CONSTRAINT `user_information_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `user_profile` (`pro_id`),
  CONSTRAINT `user_information_ibfk_2` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`dot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_information`
--

LOCK TABLES `user_information` WRITE;
/*!40000 ALTER TABLE `user_information` DISABLE KEYS */;
INSERT INTO `user_information` VALUES ('1078917089','ANA IVIS RENTERIA RENTERIA','$2b$10$SrgM.HBpTY2F38gb2oNNnuV6oYN.fUYWwsLPRTJZnfaEGpK4AUNa2','Auxiliar de Bodega',1,'ENABLE','2023-10-26 15:17:50',4,1),('1146441925','DAVID ESTEBAN MORALES ÑUSTES','$2b$10$4o2HAunW/fgIi2wa3gBL4eeFcEjqiPAJ3cqtTu7zx8KCd3xXsYvSy','Desarrollador junior',1,'ENABLE','2023-09-21 12:29:24',1,1),('1152460381','DANIELA RESTREPO TABORDA','$2b$10$gG/gG1eMjeacmYS2l2XCZuw1M4l1k4oQ7zDfttjNXhY0AnunGZiPy','Analista de Proyecto',1,'ENABLE','2023-09-21 12:54:48',3,1),('43635027','MARTA LUCIA VARGAS TREJOS','$2b$10$kP/fFt88t4pukA.12qlPwOrwOaG6sjSUlMc.hYlnuNzdN4S48OIl2','Analista de Contabilidad',1,'ENABLE','2023-10-10 08:56:14',4,1),('43668419','CARMEN PATRICIA GARCIA ','$2b$10$zGaCsKB81JoHdXE/WVHxSegBM7Vhq2VZy9A5Q8KmoYUv3nIbNDtgO','Gerente de Producción',1,'ENABLE','2023-09-25 10:33:48',5,1);
/*!40000 ALTER TABLE `user_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_information_log`
--

DROP TABLE IF EXISTS `user_information_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_information_log` (
  `user_log_id` int NOT NULL AUTO_INCREMENT,
  `modify_user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_user_by_id` varchar(50) NOT NULL,
  `modify_user_description` varchar(50) NOT NULL,
  `user_document_id` varchar(50) NOT NULL,
  PRIMARY KEY (`user_log_id`),
  KEY `user_document_id` (`user_document_id`),
  CONSTRAINT `user_information_log_ibfk_1` FOREIGN KEY (`user_document_id`) REFERENCES `user_information` (`user_document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_information_log`
--

LOCK TABLES `user_information_log` WRITE;
/*!40000 ALTER TABLE `user_information_log` DISABLE KEYS */;
INSERT INTO `user_information_log` VALUES (3,'2023-09-21 17:29:24','1146441925','CREATED USER','1146441925'),(4,'2023-09-21 17:54:48','1146441925','CREATED USER','1152460381'),(5,'2023-09-25 15:33:48','1146441925','CREATED USER','43668419'),(6,'2023-10-10 13:56:14','1146441925','CREATED USER','43635027'),(7,'2023-10-26 20:17:50','1146441925','CREATED USER','1078917089');
/*!40000 ALTER TABLE `user_information_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `pro_id` int NOT NULL AUTO_INCREMENT,
  `pro_state` tinyint(1) NOT NULL DEFAULT (true),
  `profile_label` varchar(50) NOT NULL,
  `master_id` int DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `master_id` (`master_id`),
  CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `user_profile` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,1,'ADMINISTRADOR',NULL),(2,1,'ADMINISTRADOR DE PROCESOS',1),(3,1,'OPERARIO (PLANTA)',2),(4,1,'OPERARIO (FACTURACION)',2),(5,1,'INVITADO',NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'management_ml_db_dev_pro'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ANOMALY_SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ANOMALY_SET`(

	IN _ocr_id INT,

    IN _anm_code VARCHAR(5)

)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN 

		ROLLBACK;

        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

    IF EXISTS(SELECT *FROM OCR WHERE ocr_id=_ocr_id) THEN

		IF EXISTS(SELECT *FROM ANOMALY WHERE anm_code=_anm_code)THEN 

			START TRANSACTION;

				UPDATE OCR SET anm_code=_anm_code WHERE ocr_id=_ocr_id;

            COMMIT;

        ELSE 

			SELECT 0 AS RESPONSE, 'ERROR REFERENCES ANOMALY (NOT FOUND)' AS MESSAGE; 

        END IF;

    ELSE

		SELECT 0 AS RESPONSE, 'OCR NOT FOUND' AS MESSAGE;

    END IF; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_AUTH_ROLES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_AUTH_ROLES`()
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN 

		SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

	SELECT profile_label, pro_id FROM USER_PROFILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_CREDENTIALS_OPERATIONS_BY_ENV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_CREDENTIALS_OPERATIONS_BY_ENV`(
	IN _env_id INT
)
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;
    END;
    IF EXISTS(SELECT *FROM ENVIRONMENT WHERE env_id=_env_id) THEN
		SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;
		SELECT
		ENV.env_id,
		ENV.env_label AS ENTORNO,
		MNU.mnu_id AS MENU_ID,
		MNU.mnu_label AS FATHER,
		MNU.master_id AS MASTER_ID_FATHER,
		MNU_CHILD.mnu_id AS CHILD_ID,
		MNU_CHILD.mnu_label AS CHILD,
		MNU_CHILD.mnu_order_field AS CHILD_ORDER,
		OPE.operation_label AS OPERACIONES_VALIDAS
		FROM MENU_X_ENVIRONMENT MXE
		LEFT JOIN ENVIRONMENT ENV ON MXE.env_id=ENV.env_id
		LEFT JOIN MENU MNU ON MXE.mnu_id=MNU.mnu_id
		LEFT JOIN MENU MNU_CHILD ON MNU.mnu_id=MNU_CHILD.master_id
		LEFT JOIN MENU_X_ENVIRONMENT_X_OPERATION MXEXO ON MXEXO.mnu_id=MXE.mnu_id AND MXEXO.env_id=MXE.env_id
		right JOIN OPERATION OPE ON MXEXO.ope_id=OPE.ope_id WHERE ENV.env_id=_env_id;
    ELSE 
		SELECT 0 AS RESPONSE, 'ENVIRONMENT NOT FOUND' AS MESSAGE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_EAN_CREATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_EAN_CREATE`(

	IN _color_id VARCHAR(10),

    IN _talla_label VARCHAR(10),

    IN _op_id VARCHAR(50),

    IN _ean varchar(30)

)
BEGIN 

	DECLARE _talla_id INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

		ROLLBACK;

		SELECT -1 AS RESPONSE,'SOMETHING WENT WRONG' AS MESSAGE;

    END;

    SELECT tll_id INTO _talla_id FROM TALLA WHERE tll_label=_talla_label;

    IF EXISTS(SELECT *FROM SPECIFICATIONS_OP WHERE

    color_id=_color_id AND

    talla_id=_talla_id AND 

    op_id=_op_id 

    )THEN 

		INSERT INTO EAN(

        	color_id,

			talla_id,

			op_id,

            ean

        )

        VALUES(

        	_color_id,

			_talla_id,

			_op_id,

            _ean

        );

        SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;

    ELSE 

		SELECT 0 AS RESPONSE, 'SPECIFICATIONS_OP NO FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_EMPLOYEE_ASSIGNMENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_EMPLOYEE_ASSIGNMENT`(

	IN _ocr_id INT,

    IN _emp_code VARCHAR(20)

)
BEGIN

	DECLARE _register_by_id VARCHAR(50);

    DECLARE _mdl_id INT;

    DECLARE cant_operarios INT;

    

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 

    BEGIN

		ROLLBACK;

        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

    IF EXISTS(SELECT *FROM OCR WHERE ocr_id=_ocr_id)THEN 

		IF EXISTS(SELECT *FROM EMPLOYEE WHERE emp_code=_emp_code)THEN 

			START TRANSACTION; 

				-- SELECT mdl_id,register_by_id INTO _mdl_id,_register_by_id FROM OCR WHERE ocr_id=_ocr_id;

				INSERT INTO EMPLOYEE_X_OCR(

                ocr_id,

                emp_code) 

                VALUES(

                _ocr_id,

                _emp_code);

                

                SELECT mdl_id,register_by_id INTO _mdl_id,_register_by_id  

                FROM OCR WHERE ocr_id=_ocr_id;

                

                SELECT number_employees INTO cant_operarios 

                FROM MODULO WHERE mdl_id=_mdl_id;

				

                UPDATE MODULO SET number_employees=cant_operarios+1 WHERE mdl_id=_mdl_id;

                

                INSERT INTO MODULO_LOG(

                modify_modulo_by_id, 

                modify_modulo_description, 

                modified_modulo_value, 

                mdl_id) 

                VALUES(

                _register_by_id,

                'SE INSERTÓ UN(A) NUEVO(A) OPERARIO(A)',

                _emp_code,

                _mdl_id);

                

                SELECT 1 AS RESPONSE, 'SUCCESS' AS MESSAGE;

			COMMIT;

        ELSE

			SELECT 0 AS RESPONSE, 'EMPLOYEE NOT FOUND' AS MESSAGE;

        END IF;

    ELSE

		SELECT 0 AS RESPONSE, 'OCR NOT FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_EMPLOYEE_GET_BY_OCR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_EMPLOYEE_GET_BY_OCR`(

	IN _ocr_id INT

)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN 

		ROLLBACK;

        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

    IF EXISTS(SELECT *FROM OCR WHERE ocr_id=_ocr_id)THEN 

		SELECT EMP.emp_code,EMP.emp_description,EMP.creation_date FROM EMPLOYEE_X_OCR EXO 

		INNER JOIN EMPLOYEE EMP ON EXO.emp_code=EMP.emp_code WHERE EXO.ocr_id=_ocr_id;

    ELSE 

		SELECT 0 AS RESPONSE, 'ELEMENT NO FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_EMPLOYEE_REMOVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_EMPLOYEE_REMOVE`(

	IN _ocr_id INT,

    IN _emp_code VARCHAR(20)

)
BEGIN 

	DECLARE _register_by_id VARCHAR(50);

    DECLARE _mdl_id INT;

    DECLARE cant_operarios INT;

    

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 

    BEGIN

		ROLLBACK;

        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

	IF EXISTS(SELECT *FROM EMPLOYEE_X_OCR WHERE ocr_id=_ocr_id AND emp_code=_emp_code )THEN 

		START TRANSACTION ;

			UPDATE EMPLOYEE_X_OCR SET emp_x_ocr_state=FALSE WHERE ocr_id=_ocr_id AND emp_code=_emp_code;

            

            SELECT register_by_id, mdl_id INTO _register_by_id, _mdl_id FROM OCR WHERE ocr_id=_ocr_id;

            SELECT number_employees INTO cant_operarios FROM MODULO WHERE mdl_id=_mdl_id;

            

            UPDATE MODULO SET number_employees=cant_operarios-1 WHERE mdl_id=_mdl_id;

            

            INSERT INTO MODULO_LOG(

                modify_modulo_by_id, 

                modify_modulo_description, 

                modified_modulo_value, 

                mdl_id) 

                VALUES(

                _register_by_id,

                'SE ELIMINÓ UN(A) OPERARIO(A)',

                _emp_code,

                _mdl_id);

			

				SELECT 1 AS RESPONSE, 'SUCCESS' AS MESSAGE;

        COMMIT;

    ELSE 

		SELECT 0 AS RESPONSE, 'ELEMENT NOT FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ML_DB_MODULO_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ML_DB_MODULO_GET`(
	IN _mdl_id INT
)
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;
    END;

    IF EXISTS( SELECT *FROM MODULO WHERE mdl_id=_mdl_id)THEN
		SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;
        SELECT 
		OCR.spe_op_id,
		OCR.spe_talla_id,
		MDL.mdl_label,
		MDL.number_employees
		FROM SPECIFICATIONS_OP SPE 
		RIGHT JOIN OCR ON SPE.op_id = OCR.spe_op_id AND SPE.color_id = OCR.spe_color_id AND SPE.talla_id = OCR.spe_talla_id
		LEFT JOIN MODULO MDL ON OCR.mdl_id=MDL.mdl_id WHERE MDL.mdl_id=_mdl_id ORDER BY OCR.dete_creation DESC LIMIT 1;
		
        SELECT *FROM OCR 
		LEFT JOIN ADMINISTRATIVE_PROCESSES_X_OCR APO ON OCR.ocr_id=APO.ocr_id
		LEFT JOIN ADMINISTRATIVE_PROCESSES APR ON APO.prc_id=APR.prc_id
		WHERE OCR.mdl_id=_mdl_id ORDER BY dete_creation DESC;
        
    ELSE

		SELECT 0 AS RESPONSE, 'MODULO NOT FOUND' AS MESSGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ML_DB_OCR_CHECK_IN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ML_DB_OCR_CHECK_IN`(

	IN _ocr_id INT,
    IN _check_in_by VARCHAR(50)

)
BEGIN 

	 DECLARE EXIT HANDLER FOR SQLEXCEPTION

     BEGIN

		 ROLLBACK;
         SELECT -1 AS RESPONSE, 'ERROR' AS MESSAGE;

     END;

    IF EXISTS (SELECT *FROM OCR WHERE ocr_id=_ocr_id) THEN 
		START TRANSACTION;
			
			SELECT 1 AS RESPONSE, 'OCR CHECKED';
			INSERT INTO ADMINISTRATIVE_PROCESSES_X_OCR(prc_id,ocr_id,created_by_id) VALUES(2,_ocr_id,_check_in_by);
            
		COMMIT;
    ELSE 

		SELECT 0 AS RESPONSE,'OCR NOT FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ML_DB_OCR_GET_ALL_BY_SPE_OP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ML_DB_OCR_GET_ALL_BY_SPE_OP`(
	IN _op_id VARCHAR(50),
    IN _color_id VARCHAR(10),
    IN _talla_id INT
)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 

		ROLLBACK;
        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG'AS MESSAGE;

	END;

    IF EXISTS(SELECT*FROM SPECIFICATIONS_OP WHERE op_id=_op_id AND color_id=_color_id AND talla_id=_talla_id)THEN
		SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;
		-- SELECT *FROM OCR WHERE spe_op_id=_op_id AND spe_color_id=_color_id AND spe_talla_id=_talla_id ORDER BY dete_creation DESC;
        SELECT OP.op,
        OP.ref,
        SPE.color_id,
        SPE.talla_id,
        SPE.ean_id,
        CLR.color_label,
        OCR.ocr_id,
		OCR.mdl_id,
        OCR.dete_creation,
        OCR.start_operation,
        OCR.finish_operation,
        OCR.units_cant,
        OCR.register_by_id,
		OCR.ocr_state_description,
        OCR.ocr_state,OCR.anm_cod
		FROM OP 
		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id
		RIGHT JOIN TALLA TLL ON SPE.talla_id=TLL.tll_id
		RIGHT JOIN COLOR CLR ON SPE.color_id=CLR.color_id
		RIGHT JOIN OCR ON SPE.color_id=OCR.spe_color_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.op_id=OCR.spe_op_id
		WHERE OCR.spe_op_id=_op_id AND OCR.spe_color_id=_color_id AND OCR.spe_talla_id=_talla_id  ORDER BY OCR.dete_creation DESC;

    ELSE 

		SELECT 0 AS RESPONSE, 'OP no found' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ML_DB_OCR_REGISTER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ML_DB_OCR_REGISTER`(

	IN _start_operation TIME,
	IN _finish_operation TIME,
	IN _register_by_id VARCHAR(50),
    IN _mdl_id INT,
    IN _units_cant INT,
	IN _color_id VARCHAR(10),
    IN _talla_id VARCHAR(10),
    IN _op_id VARCHAR(50),
    IN _anomaly_cod VARCHAR(5),
    IN _ctg_id INT

)
BEGIN 

	DECLARE cant_ocr_op INT;
    DECLARE cant_completed_op DOUBLE;
    DECLARE cant_planned_op DOUBLE;
    
    DECLARE cant_ocr_spe_op INT;
    DECLARE cant_completed_spe_op DOUBLE;
    DECLARE cant_planned_spe_op DOUBLE;
    DECLARE _id INT;

	 -- DECLARE EXIT HANDLER FOR SQLEXCEPTION

     -- BEGIN
		--  ROLLBACK;
         -- SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;
     -- END;

    

	IF EXISTS(SELECT *FROM SPECIFICATIONS_OP
    WHERE color_id=_color_id 
    AND talla_id=_talla_id
    AND op_id=_op_id) THEN

		SELECT cant_ocr,
		cant_completed,
        cant_planned INTO 
		cant_ocr_op,
		cant_completed_op,
        cant_planned_op
		FROM OP WHERE op=_op_id;

		SELECT cant_ocr,
		cant_spe_completed,
        cant_spe_planned INTO 
		cant_ocr_spe_op,
		cant_completed_spe_op,
        cant_planned_spe_op
		FROM SPECIFICATIONS_OP 
		WHERE color_id=_color_id 
		AND talla_id=_talla_id
		AND op_id=_op_id;
        

		START TRANSACTION;
			IF(cant_ocr_spe_op=0)THEN
				INSERT INTO SPE_OP_PROCESS_LOG
                (color_id,
                talla_id,
                op_id,
                spe_op_dete_open_task)
                VALUES
                (_color_id,
                _talla_id,
                _op_id,
                current_time());
            END IF;
			
            IF(cant_ocr_op=0)THEN 
				INSERT INTO OP_PROCESS_LOG
                (op_id,
                op_dete_open_task)
                VALUES
                (_op_id,
                current_timestamp());
            END IF;
            
            IF(cant_completed_op+_units_cant>=cant_planned_op)THEN 
				UPDATE OP_PROCESS_LOG SET op_dete_close_task=current_timestamp() WHERE op=_op_id;
            END IF;
            
			IF(cant_completed_spe_op+_units_cant>=cant_planned_spe_op)THEN 
				UPDATE SPE_OP_PROCESS_LOG SET spe_op_dete_close_task=current_timestamp() WHERE color_id=_color_id 
				AND talla_id=_talla_id
				AND op_id=_op_id;
            END IF;
            
			INSERT INTO OCR(
			start_operation,
            finish_operation,
            register_by_id,
            units_cant,
			mdl_id,
			spe_color_id,
			spe_talla_id,
			spe_op_id,
            anm_cod,
            ctg_id) 
			VALUES(	
			_start_operation,
            _finish_operation,
            _register_by_id,
            _units_cant,
			_mdl_id,
			_color_id,
			_talla_id,
			_op_id,
            _anomaly_cod,
            _ctg_id);

            SELECT LAST_INSERT_ID() INTO _id;

            UPDATE OP SET 
			cant_completed=_units_cant+cant_completed_op,
			cant_ocr=cant_ocr_op+1
			WHERE op=_op_id;

			UPDATE SPECIFICATIONS_OP SET
			cant_spe_completed=_units_cant+cant_completed_spe_op,
			cant_ocr=cant_ocr_spe_op+1
			WHERE color_id=_color_id 
			AND talla_id=_talla_id
			AND op_id=_op_id;

		COMMIT;

		SELECT 1 AS RESPONSE, 'ELEMENT INSERTED' AS MESSAGE;
        SELECT _id AS ocr_id;

    ELSE 

		SELECT 0 AS RESPONSE, 'OP SPECIFICATIONS NOT FOUND' AS MESSAGE;

    END IF; 

    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ML_DB_OP_GET_COMPLETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ML_DB_OP_GET_COMPLETE`(
	IN _op_id VARCHAR(20)
)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
		SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;
    END;

    IF EXISTS (SELECT *FROM OP WHERE op=_op_id)THEN 
    
		SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;
		SELECT 
		OP.op,
		OP.ref,
		OP.cant_ocr,
		OP.cant_planned AS cant_planned_op,
		OP.cant_completed AS cant_completed_op,
		-- OPP.op_dete_open_task AS dete_open_task_op,
		-- OPP.op_dete_close_task AS dete_close_task_op, 
		-- OPP.op_dete_open_planned AS dete_open_planned_op, 
		-- OPP.op_dete_close_planned AS dete_close_planned_op, 
		SPE.cant_ocr AS amount_ocr_det_op,
		SPE.cant_spe_planned AS amount_planned_det_op,
		SPE.cant_spe_completed AS amount_completed_det_op,
		-- SOP.spe_op_dete_open_task AS dete_open_task_det_op, 
		-- SOP.spe_op_dete_close_task AS dete_close_task_det_op,
		-- SOP.spe_op_dete_open_planned AS dete_open_planned_det_op, 
		-- SOP.spe_op_dete_close_planned AS dete_close_planned_det_op,
		CLR.color_label, 
		CLR.color_id,
		TLL.tll_id,
		EAN.ean_id
		FROM OP 
		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id
		LEFT JOIN EAN ON SPE.ean_id=EAN.ean_id
		LEFT JOIN COLOR CLR ON SPE.color_id=CLR.color_id
		LEFT JOIN TALLA TLL ON SPE.talla_id=TLL.tll_id
		-- RIGHT JOIN OP_PROCESS_LOG OPP ON OP.op=OPP.op_id
		-- RIGHT JOIN SPE_OP_PROCESS_LOG SOP ON SPE.color_id=SOP.color_id AND SPE.talla_id=SOP.talla_id AND SPE.op_id=SOP.op_id
		WHERE OP.op=_op_id;

    ELSE 

		SELECT 0 AS RESPONSE, 'OP NOT FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ML_DB_OP_OPEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ML_DB_OP_OPEN`(
	
	IN _op_id VARCHAR(50),
    IN _ref VARCHAR(20),
    IN _talla_id VARCHAR(10),
    IN _ean_id VARCHAR(20),
	IN _color_id VARCHAR(10),
    IN _color_label VARCHAR(100),
    IN _cant_spe_planned DOUBLE,
    IN _cant_spe_completed DOUBLE,
    IN _open_by_id VARCHAR(20)

)
BEGIN 

	DECLARE _cant_op_planned DOUBLE;
    DECLARE _cant_op_completed DOUBLE;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		 ROLLBACK;
         SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESAGGE;
	END;

	IF NOT EXISTS( SELECT *FROM TALLA WHERE tll_id=_talla_id)THEN 
			INSERT INTO TALLA(tll_id) VALUES(_talla_id);
	END IF;
    
	IF NOT EXISTS(SELECT *FROM COLOR WHERE color_id=_color_id)THEN
			INSERT INTO COLOR(color_id,color_label) VALUES(_color_id,_color_label);
	END IF;
	
	IF NOT EXISTS(SELECT *FROM EAN WHERE ean_id=_ean_id )THEN
			INSERT INTO EAN(ean_id) VALUES(_ean_id);
	END IF;

	IF NOT EXISTS (SELECT *FROM OP WHERE op=_op_id)THEN 
	
		START TRANSACTION;
			INSERT INTO OP(
				op,
				ref,
				cant_planned,
				cant_completed
			)
			VALUES(
				_op_id,
				_ref,
				_cant_spe_planned,
				_cant_spe_completed
			);
			
			INSERT INTO OP_LOG(
				modify_op_by_id,
				modify_op_description,
				modify_op_value,
				op_id
			)
			VALUES(
				_open_by_id,
				'APERTURA DE OP',
				'NINGUNO',
				_op_id
			);
            
            INSERT INTO SPECIFICATIONS_OP(
				color_id,
				talla_id,
				op_id,
				ean_id,
                cant_spe_planned,
				cant_spe_completed
			)
			VALUES(
				_color_id,
				_talla_id,
				_op_id,
				_ean_id,
                _cant_spe_planned,
				_cant_spe_completed
			);
			
            INSERT INTO SPE_OP_LOG(
				modify_spe_op_by_id,
				modify_spe_op_description,
				modify_spe_op_value,
				op_id,
                talla_id,
                color_id
            ) 
            VALUES(
            	_open_by_id,
				'APERTURA DE OP',
				'NINGUNO',
				_op_id,
                _talla_id,
                _color_id
            );
		COMMIT;
        SELECT 1 AS RESPONSE, 'QUERY SUCCESS' AS MESSAGE;
	ELSE 
		START TRANSACTION;
        
        SELECT cant_planned,cant_completed INTO _cant_op_planned,_cant_op_completed FROM OP WHERE op=_op_id;

			UPDATE OP SET 
            cant_planned=_cant_op_planned + _cant_spe_planned,
            cant_completed=_cant_spe_completed+_cant_op_completed
            WHERE op=_op_id; 
            
			INSERT INTO SPECIFICATIONS_OP(
				color_id,
				talla_id,
				op_id,
				ean_id,
                cant_spe_planned,
				cant_spe_completed
			)
			VALUES(
				_color_id,
				_talla_id,
				_op_id,
				_ean_id,
                _cant_spe_planned,
				_cant_spe_completed
			);
			
            INSERT INTO SPE_OP_LOG(
				modify_spe_op_by_id,
				modify_spe_op_description,
				modify_spe_op_value,
				op_id,
                talla_id,
                color_id
            ) 
            VALUES(
            	_open_by_id,
				'APERTURA DE OP',
				'NINGUNO',
				_op_id,
                _talla_id,
                _color_id
            );
        COMMIT;
        SELECT 1 AS RESPONSE, 'QUERY SUCCESS' AS MESSAGE;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ML_DB_SESION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ML_DB_SESION`(
	IN _user_document_id VARCHAR(50)
)
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN

		ROLLBACK;
        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

    IF (_user_document_id='NONE') THEN
    
		SELECT 1 AS RESPONSE, 'SUCCESSFUL QUERY' as MESSAGE;
        --
		SELECT  OP.op,
        OP.ref,
        OP.cant_ocr,
        OP.cant_planned,
        OP.cant_completed FROM OP 
        LEFT JOIN OP_PROCESS_LOG OPL ON OP.op=OPL.op_id 
        ORDER BY OPL.op_dete_open_task DESC LIMIT 50;

        --

		SELECT OP.op,
        OP.ref,
        SPE.color_id,
        SPE.talla_id,
        CLR.color_label,
        EAN.ean,
        ANM.anomaly_label,
        OCR.ocr_id,
		OCR.mdl_id,
        OCR.dete_creation,
        OCR.start_operation,
        OCR.finish_operation,
        OCR.units_cant,
        OCR.register_by_id,
		OCR.ocr_state_description,
        OCR.ocr_state,
        OCR.anm_cod
		FROM OP 
		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id
		RIGHT JOIN COLOR CLR ON SPE.color_id=CLR.color_id
        LEFT JOIN EAN ON SPE.color_id=EAN.color_id AND SPE.talla_id=EAN.talla_id AND SPE.op_id=EAN.op_id
		RIGHT JOIN OCR ON SPE.color_id=OCR.spe_color_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.op_id=OCR.spe_op_id 
		LEFT JOIN ANOMALY ANM ON OCR.anm_cod=ANM.anm_cod
        ORDER BY OCR.dete_creation DESC LIMIT 4;

        --

		SELECT *FROM ANOMALY;
        --
        SELECT *FROM TALLA;

    ELSE 

		SELECT 1 AS RESPONSE, 'SUCCESSFUL QUERY' as MESSAGE;
        --
        SELECT  OP.op,
        OP.ref,
        OP.cant_ocr,
        OP.cant_planned,
        OP.cant_completed FROM OP 
		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id
		RIGHT JOIN OCR ON SPE.op_id=OCR.spe_op_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.color_id=OCR.spe_color_id
		WHERE OCR.register_by_id=_user_document_id GROUP BY (OP.op) 
        ORDER BY OP.op DESC LIMIT 50;

        --

		SELECT OP.op,
        OP.ref,
        SPE.color_id,
        SPE.talla_id,
        SPE.ean_id,
        CLR.color_label,
        ANM.anomaly_label,
        OCR.ocr_id,
		OCR.mdl_id,
        OCR.dete_creation,
        OCR.start_operation,
        OCR.finish_operation,
        OCR.units_cant,
        OCR.register_by_id,
		OCR.ocr_state_description,
        OCR.ocr_state,
        OCR.anm_cod
		FROM OP 
		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id
		RIGHT JOIN TALLA TLL ON SPE.talla_id=TLL.tll_id
		RIGHT JOIN COLOR CLR ON SPE.color_id=CLR.color_id
		RIGHT JOIN OCR ON SPE.color_id=OCR.spe_color_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.op_id=OCR.spe_op_id
        LEFT JOIN ANOMALY ANM ON OCR.anm_cod=ANM.anm_cod
        WHERE OCR.register_by_id=_user_document_id ORDER BY OCR.dete_creation DESC LIMIT 4;
        --

		SELECT *FROM ANOMALY;

        --

        SELECT *FROM TALLA;

    END IF;

		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ML_DB_USER_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ML_DB_USER_GET`(

	IN _user_document_id VARCHAR(20)

)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN
		ROLLBACK;
        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG';
    END;

	IF EXISTS (SELECT *FROM USER_INFORMATION WHERE user_document_id=_user_document_id)THEN 
		SELECT 1 AS RESPONSE, 'SUCCES QUERY' AS MESSAGE;
		SELECT 
        user_document_id,
        user_name,
        user_password,
        user_description,
        user_state,
        user_state_description,
        user_create_dete,
        profile_id,
        document_type_id,
        profile_label,
        master_id
        FROM USER_INFORMATION UIF 
		LEFT JOIN USER_PROFILE UPR ON UIF.profile_id=UPR.pro_id 
        WHERE user_document_id=_user_document_id;
    ELSE 
		SELECT 0 AS RESPONSE,'User no found' AS MESAGGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_ML_DB_USER_REGISTER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_ML_DB_USER_REGISTER`(

	IN _user_name VARCHAR(50),
    IN _user_password VARCHAR(100),
    IN _user_document_id VARCHAR(20),
    IN _user_description VARCHAR(50),
    IN _profile_id INT,
    IN _document_type_id INT,
    IN _create_by_id VARCHAR(20)

)
BEGIN

	IF NOT EXISTS (SELECT *FROM USER_INFORMATION WHERE user_document_id =_user_document_id)THEN 

		START TRANSACTION; 

			INSERT INTO USER_INFORMATION(
			user_name,
			user_password,
			user_document_id,
			user_description,
			profile_id,
			document_type_id)

			VALUES(
			_user_name,
			_user_password,
			_user_document_id,
			_user_description,
			_profile_id,
			_document_type_id);

            INSERT INTO USER_INFORMATION_LOG(
				modify_user_by_id,
				modify_user_description,
				user_document_id
            ) VALUES(
				_create_by_id,
                'CREATED USER',
                _user_document_id
            );
            -- SELECT 1 AS RESPONSE, 'REGISTERED USER' AS MESSAGE,_user_document_id AS USER_ID ;
			SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;
            SELECT 
			user_document_id,
			user_name,
			user_password,
			user_description,
			user_state,
			user_state_description,
			user_create_dete,
			profile_id,
			document_type_id,
			profile_label,
			master_id
            FROM USER_INFORMATION UIF 
			LEFT JOIN USER_PROFILE UPR ON UIF.profile_id=UPR.pro_id 
			WHERE user_document_id=_user_document_id;

        COMMIT;

    ELSE 

		SELECT 0 AS RESPONSE, 'User already exist' AS MESSAGE,NULL AS USER_ID;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_OCRS_GET_BY_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_OCRS_GET_BY_USER`(

	IN _user_document_id VARCHAR(20)

)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

		ROLLBACK;

        SELECT -1 AS RESPONSE;

    END;

    IF EXISTS(

		SELECT OP.op,OP.ref,SPE.color_id,SPE.talla_id,CLR.color_label,TLL.tll_label,OCR.ocr_id,

		OCR.mdl_id,OCR.dete_creation,OCR.start_operation,OCR.finish_operation,OCR.units_cant,OCR.register_by_id,

		OCR.ocr_state_description,OCR.ocr_state,OCR.anm_cod

		FROM OP 

		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id

		RIGHT JOIN TALLA TLL ON SPE.talla_id=TLL.tll_id

		RIGHT JOIN COLOR CLR ON SPE.color_id=CLR.color_id

		RIGHT JOIN OCR ON SPE.color_id=OCR.spe_color_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.op_id=OCR.spe_op_id

		WHERE OCR.register_by_id=_user_document_id

    ) THEN  

		SELECT 1 RESPONSE,'SUCCESS QUERY' AS MESSAGE;

		SELECT OP.op,

        OP.ref,

        SPE.color_id,

        SPE.talla_id,

        CLR.color_label,

        TLL.tll_label,

        EAN.ean,

        OCR.ocr_id,

		OCR.mdl_id,

        OCR.dete_creation,

        OCR.start_operation,

        OCR.finish_operation,

        OCR.units_cant,

        OCR.register_by_id,

		OCR.ocr_state_description,

        OCR.ocr_state,

        OCR.anm_cod

		FROM OP 

		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id

		RIGHT JOIN TALLA TLL ON SPE.talla_id=TLL.tll_id

		RIGHT JOIN COLOR CLR ON SPE.color_id=CLR.color_id

        LEFT JOIN EAN ON SPE.color_id=EAN.color_id AND SPE.talla_id=EAN.talla_id AND SPE.op_id=EAN.op_id

		RIGHT JOIN OCR ON SPE.color_id=OCR.spe_color_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.op_id=OCR.spe_op_id

		WHERE OCR.register_by_id=_user_document_id ORDER BY OCR.dete_creation DESC;

    ELSE 

		SELECT 0 AS RESPONSE, 'ELEMENTS NOT FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_OCR_CREATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_OCR_CREATE`(

    IN _start_operation TIME,

    IN _register_by_id VARCHAR(50),

    IN _mdl_id INT,

	IN _color_id VARCHAR(10),

    IN _talla_id VARCHAR(10),

    IN _op_id VARCHAR(50)

)
BEGIN 



	DECLARE cant_ocr_op INT;

    DECLARE cant_ocr_spe_op INT;

	DECLARE _id INT;

    

    DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

	ROLLBACK;

        SELECT '-1' AS RESPONSE, 'SOMENTHING WENT WRONG' AS MESSAGE;

    END;

    

    IF EXISTS(SELECT *FROM SPECIFICATIONS_OP

    WHERE color_id=_color_id 

    AND talla_id=_talla_id

    AND op_id=_op_id) THEN

    

		START TRANSACTION;

			INSERT INTO OCR(

			start_operation,

            register_by_id,

			mdl_id,

			spe_color_id,

			spe_talla_id,

			spe_op_id) 

			VALUES(	

			_start_operation,

            _register_by_id,

			_mdl_id,

			_color_id,

			_talla_id,

			_op_id);

			SELECT LAST_INSERT_ID() INTO _id;

            

			SELECT cant_ocr INTO 

			cant_ocr_op

			FROM OP WHERE op=_op_id;

			

			SELECT cant_ocr INTO 

			cant_ocr_spe_op

			FROM SPECIFICATIONS_OP 

            WHERE color_id=_color_id 

			AND talla_id=_talla_id

			AND op_id=_op_id;

			

            INSERT INTO PROCESS_LOG(ocr_id,process_start) VALUES(_id,TRUE);

            INSERT INTO CHECK_PROCESS(

            	ocr_id

            ) VALUES(_id);

            

            SELECT 1 AS RESPONSE, 'SUCCESSFULY QUERY' AS MESSAGE;

            SELECT _id AS OCR_ID; 

		COMMIT;

	ELSE 

		ROLLBACK;

        SELECT 0 AS RESPONSE, 'Incorrect arguments'; 

	END IF;

    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_OCR_DISABLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_OCR_DISABLE`(

	IN _ocr_id INT,

    IN _disable_by VARCHAR(50)

)
BEGIN 

	DECLARE cant_ocr_op INT;

    DECLARE cant_completed_op DOUBLE;

    DECLARE cant_incompleted_op DOUBLE;

    

    DECLARE cant_ocr_spe_op INT;

    DECLARE cant_completed_spe_op DOUBLE;

    DECLARE cant_incompleted_spe_op DOUBLE;

    

    DECLARE _color_id VARCHAR(10);

    DECLARE _talla_id VARCHAR(10);

    DECLARE _op_id VARCHAR(50);

    

    DECLARE enable_state BOOLEAN;

    DECLARE _units_cant INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

     BEGIN

		 ROLLBACK;

         SELECT -1 AS RESPONSE, 'ERROR' AS MESSAGE;

     END;



    IF EXISTS(SELECT *FROM OCR WHERE ocr_id=_ocr_id) THEN 

		

        SELECT spe_color_id,spe_talla_id,spe_op_id, ocr_state,units_cant

		INTO _color_id,_talla_id,_op_id,enable_state,_units_cant

		FROM OCR WHERE ocr_id=_ocr_id;

        

        IF enable_state=true THEN

		START TRANSACTION;

			UPDATE OCR SET ocr_state=false,ocr_state_description='DISABLE',disable_by=_disable_by,disable_dete_ocr=CURRENT_TIMESTAMP WHERE ocr_id=_ocr_id;

            SELECT cant_ocr,

			cant_completed,

			cant_incompleted INTO 

			cant_ocr_op,

			cant_completed_op,

			cant_incompleted_op

			FROM OP WHERE op=_op_id;

			

			SELECT cant_ocr,

			cant_spe_completed,

			cant_spe_incompleted INTO 

			cant_ocr_spe_op,

			cant_completed_spe_op,

			cant_incompleted_spe_op

			FROM SPECIFICATIONS_OP 

            WHERE color_id=_color_id 

			AND talla_id=_talla_id

			AND op_id=_op_id;

            

            UPDATE OP SET 

			cant_completed=cant_completed_op-_units_cant,

			cant_ocr=cant_ocr_op-1

			WHERE op=_op_id;

			

			UPDATE SPECIFICATIONS_OP SET

			cant_spe_completed=cant_completed_spe_op-_units_cant,

			cant_ocr=cant_ocr_spe_op-1

			WHERE color_id=_color_id 

			AND talla_id=_talla_id

			AND op_id=_op_id;

            

            SELECT 1 AS RESPONSE, 'Element disabled';

        COMMIT;

        ELSE 

			SELECT 0 AS RESPONSE, 'Element no enabled'; 

        END IF;

    ELSE 

		SELECT 0 AS RESPONSE, 'Element no found' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_OCR_GET_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_OCR_GET_ALL`()
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

		ROLLBACK;

        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG';

    END;

    IF EXISTS (

		SELECT *FROM OP 

		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id

		RIGHT JOIN TALLA TLL ON SPE.talla_id=TLL.tll_id

		RIGHT JOIN COLOR CLR ON SPE.color_id=CLR.color_id

		RIGHT JOIN OCR ON SPE.color_id=OCR.spe_color_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.op_id=OCR.spe_op_id

    ) THEN 

		SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;

		SELECT OP.op,OP.ref,SPE.color_id,SPE.talla_id,CLR.color_label,TLL.tll_label,OCR.ocr_id,

        OCR.mdl_id,OCR.dete_creation,OCR.start_operation,OCR.finish_operation,OCR.units_cant,OCR.register_by_id,

        OCR.ocr_state_description,OCR.ocr_state,OCR.anm_cod

        FROM OP 

		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id

		RIGHT JOIN TALLA TLL ON SPE.talla_id=TLL.tll_id

		RIGHT JOIN COLOR CLR ON SPE.color_id=CLR.color_id

		RIGHT JOIN OCR ON SPE.color_id=OCR.spe_color_id 

        AND SPE.talla_id=OCR.spe_talla_id AND SPE.op_id=OCR.spe_op_id;

    ELSE 

		SELECT 0 AS RESPONSE, 'Elements no found';

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_OCR_SEND` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_OCR_SEND`(

	IN _ocr_id INT,

    IN _finish_operation TIME,

	IN _units_cant INT  

)
BEGIN 

	DECLARE cant_ocr_op INT;

    DECLARE cant_completed_op DOUBLE;

    DECLARE cant_ocr_spe_op INT;

    DECLARE cant_completed_spe_op DOUBLE;

    DECLARE _op_id VARCHAR(20);

    DECLARE _color_id VARCHAR(10);

    DECLARE _talla_id INT;

    

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

		ROLLBACK;

        SELECT '-1' AS RESPONSE, 'SOMENTHING WENT WRONG' AS MESSAGE;

    END;

    

    IF EXISTS(SELECT *FROM OCR WHERE ocr_id=_ocr_id)THEN

    

		SELECT spe_op_id,spe_color_id,spe_talla_id

		INTO _op_id,_color_id,_talla_id

		FROM OCR WHERE ocr_id=_ocr_id;

        

		IF EXISTS(SELECT *FROM SPECIFICATIONS_OP

		WHERE color_id=_color_id 

		AND talla_id=_talla_id

		AND op_id=_op_id) THEN



			START TRANSACTION;

				UPDATE OCR SET units_cant=_units_cant,finish_operation=_finish_operation WHERE ocr_id=_ocr_id;

				UPDATE PROCESS_LOG SET process_finish=TRUE WHERE ocr_id=_ocr_id;

				

				SELECT cant_ocr,

				cant_completed INTO 

				cant_ocr_op,

				cant_completed_op

				FROM OP WHERE op=_op_id;

				

				SELECT cant_ocr,

				cant_spe_completed INTO 

				cant_ocr_spe_op,

				cant_completed_spe_op

				FROM SPECIFICATIONS_OP 

				WHERE color_id=_color_id 

				AND talla_id=_talla_id

				AND op_id=_op_id;

				

				UPDATE OP SET 

				cant_completed=_units_cant+cant_completed_op,

				cant_ocr=cant_ocr_op+1

				WHERE op=_op_id;

				

				UPDATE SPECIFICATIONS_OP SET

				cant_spe_completed=_units_cant+cant_completed_spe_op,

				cant_ocr=cant_ocr_spe_op+1

				WHERE color_id=_color_id 

				AND talla_id=_talla_id

				AND op_id=_op_id;

                

                SELECT 1 AS RESPONSE, 'OCR sended' AS MESSAGE;

		ELSE 

			ROLLBACK;

			SELECT 0 AS RESPONSE, 'Incorrect arguments'; 

		END IF;

		COMMIT;

    ELSE 

	SELECT 0 AS RESPONSE, 'OCR no found' AS MESSAGE;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_OCR_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_OCR_UPDATE`(

	IN _ocr_id INT, 

    IN cant_updated INT,

    IN update_by_id VARCHAR(50)

)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

		ROLLBACK;

        SELECT -1 AS RESPONSE;

    END; 

    IF EXISTS(SELECT *FROM OCR WHERE ocr_id=_ocr_id)THEN

		START TRANSACTION;

			UPDATE OCR SET units_cant=cant_updated WHERE ocr_id=_ocr_id;

            INSERT INTO OCR_LOG(

                modify_ocr_by_id,

				modify_ocr_description,

				modified_ocr_value,

				ocr_id

            )VALUES(

				update_by_id,

                'SE EDITÓ LA CANTIDAD DE REGISTROS EN LA OCR',

                cant_updated,

                _ocr_id

            );

            

        COMMIT;

    ELSE 

		SELECT 0 AS RESPONSE, 'OCR NO FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_OP_GET_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_OP_GET_ALL`()
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT -1 AS RESPONSE, 'SOMENTHING WENT WRONG' AS MESSAGE;
    END;

    IF EXISTS(SELECT*FROM OP)THEN 
    
		SELECT 1 AS RESPONSE, 'SUCCESSFUL QUERY' AS MESSAGE;
		SELECT*FROM OP ORDER BY dete_open_task DESC;
		SELECT *FROM SPECIFICATIONS_OP ORDER BY dete_open_task DESC;
        
    ELSE 
		SELECT 0 AS RESPONSE, 'ELEMENTS NOT FOUND' AS MESSAGE;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_OP_GET_BY_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_OP_GET_BY_USER`(

	IN _user_id VARCHAR(20)

)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION 

	BEGIN
		ROLLBACK;
        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;
	END;

    IF EXISTS(
		SELECT OP.op,OP.ref,OP.cant_ocr,OP.cant_planned,OP.cant_completed FROM OP 
		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id
		RIGHT JOIN OCR ON SPE.op_id=OCR.spe_op_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.color_id=OCR.spe_color_id
		WHERE OCR.register_by_id=_user_id

    ) THEN
		select 1 AS RESPONSE, 'SUCCESSFUL QUERY' as MESSAGE;
		SELECT OP.op,OP.ref,OP.cant_ocr,OP.cant_planned,OP.cant_completed FROM OP 
		RIGHT JOIN SPECIFICATIONS_OP SPE ON OP.op=SPE.op_id
		RIGHT JOIN OCR ON SPE.op_id=OCR.spe_op_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.color_id=OCR.spe_color_id
		WHERE OCR.register_by_id=_user_id GROUP BY (OP.op);

    ELSE 

		SELECT 0 AS RESPONSE, 'Element no found' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_OP_GET_ONE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_OP_GET_ONE`(

	IN _op VARCHAR(50)

)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 

    BEGIN

		ROLLBACK;

        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

    IF EXISTS(SELECT *FROM OP WHERE op=_op)THEN 

		SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;

		SELECT *FROM OP WHERE op=_op;

    ELSE 

		SELECT 0 AS RESPONSE, 'ELEMENT NOT FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_PROFILE_VALID_OBJECT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_PROFILE_VALID_OBJECT`(

	IN _prf_id INT 

)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 

    BEGIN

		ROLLBACK;

		SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

	IF EXISTS (SELECT *FROM USER_PROFILE WHERE pro_id=_prf_id)THEN 

		SELECT distinct(OBJ.object_label) AS 'VALID OBJECT' FROM OBJECT OBJ 

		LEFT JOIN OPERATION_X_OBJECT OOB ON OBJ.obj_id=OOB.obj_id

		LEFT JOIN OPERATION_X_OBJECT_X_PROFILE OOP ON OOB.op_ob_id=OOP.ope_obj_id

		LEFT JOIN USER_PROFILE UPR ON OOP.prf_id=UPR.pro_id WHERE UPR.pro_id=_prf_id;

    ELSE 

		SELECT 0 AS RESPONSE, 'Profile no found' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_PROFILE_VALID_OPERATIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_PROFILE_VALID_OPERATIONS`(

	IN _prf_id INT 

)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 

    BEGIN

		ROLLBACK;

		SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

	IF EXISTS (SELECT *FROM USER_PROFILE WHERE pro_id=_prf_id)THEN 

		SELECT OOB.name_ope_obj AS 'VALID OPERATIONS' FROM USER_PROFILE UPR 

		LEFT JOIN OPERATION_X_OBJECT_X_PROFILE OOP ON UPR.pro_id=OOP.prf_id

		LEFT JOIN OPERATION_X_OBJECT OOB ON OOP.ope_obj_id=OOB.op_ob_id WHERE UPR.pro_id=_prf_id;

    ELSE 

		SELECT 0 AS RESPONSE, 'Profile no found' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_SPE_OP_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_SPE_OP_GET`(

	IN _op_id VARCHAR(50)

)
BEGIN 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

		ROLLBACK;

        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG' AS MESSAGE;

    END;

    IF EXISTS (SELECT *FROM SPECIFICATIONS_OP WHERE op_id=_op_id)THEN

		SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;

		SELECT 

        CLR.color_label,

		TLL.tll_label,

        CLR.color_id,

		TLL.tll_id,

		SPE.op_id,

		SPE.cant_ocr,

		SPE.cant_spe_planned,

		SPE.cant_spe_completed,

		SPE.dete_open_task,

		SPE.dete_close_task,

		SPE.spe_state,

		SPE.spe_state_description,

		SPE.dete_open_planned,

		SPE.dete_close_planed

        FROM SPECIFICATIONS_OP SPE

		INNER JOIN COLOR CLR ON SPE.color_id=CLR.color_id

		INNER JOIN TALLA TLL ON SPE.talla_id=TLL.tll_id

        WHERE op_id=_op_id AND SPE.cant_spe_completed<>0;

    ELSE 

		SELECT 0 AS RESPONSE, 'ELEMENT NOT FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_SPE_OP_GET_BY_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_SPE_OP_GET_BY_USER`(

	IN _op_id VARCHAR(50),

    IN _user_document_id VARCHAR(50)

)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION 

    BEGIN

		ROLLBACK;

        SELECT -1 AS RESPONSE,'SOMETHING WENT WRONG' AS MESSAGE;

    END;

	IF EXISTS (SELECT *FROM SPECIFICATIONS_OP WHERE op_id=_op_id)THEN

		SELECT 1 AS RESPONSE, 'SUCCESS QUERY' AS MESSAGE;

		SELECT

		  TLL.tll_label,

		  TLL.tll_id,

		  CLR.color_label,

		  CLR.color_id,

		  SPE.talla_id,

		  SPE.op_id,

		  SPE.cant_ocr,

		  SPE.cant_spe_planned,

		  SPE.cant_spe_completed,

		  SPE.dete_open_task,

		  SPE.dete_close_task,

		  SPE.spe_state,

		  SPE.spe_state_description,

		  SPE.dete_open_planned,

		  SPE.dete_close_planed

		FROM SPECIFICATIONS_OP SPE

		INNER JOIN COLOR CLR ON SPE.color_id=CLR.color_id

		INNER JOIN TALLA TLL ON SPE.talla_id=TLL.tll_id

		RIGHT JOIN OCR ON SPE.color_id=OCR.spe_color_id AND SPE.talla_id=OCR.spe_talla_id AND SPE.op_id=OCR.spe_op_id

		WHERE SPE.op_id=_op_id AND OCR.register_by_id=_user_document_id

		GROUP BY 

			TLL.tll_label,

			TLL.tll_id,

			CLR.color_label,

			CLR.color_id,

			SPE.talla_id, 

			SPE.op_id, 

			SPE.cant_ocr, 

			SPE.cant_spe_planned,

			SPE.cant_spe_completed,

			SPE.dete_open_task,

			SPE.dete_close_task,

			SPE.spe_state, 

			SPE.spe_state_description, 

			SPE.dete_open_planned,

			SPE.dete_close_planed;

    ELSE 

		SELECT 0 AS RESPONSE, 'ELEMENT NOT FOUND' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MANAGEMENT_USER_DISABLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MANAGEMENT_USER_DISABLE`(

	IN _user_document_id VARCHAR(20),

    IN _modify_user_by_id VARCHAR(20)

)
BEGIN 

	DECLARE user_state_cond BOOLEAN;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION

    BEGIN

		ROLLBACK;

        SELECT -1 AS RESPONSE, 'SOMETHING WENT WRONG';

    END;



	IF EXISTS (SELECT *FROM USER_INFORMATION WHERE user_document_id=_user_document_id)THEN

		SELECT user_state INTO user_state_cond FROM USER_INFORMATION WHERE user_document_id=_user_document_id;

        IF user_state_cond=TRUE THEN 

			START TRANSACTION;

				UPDATE USER_INFORMATION SET user_state=FALSE, user_state_description='DISABLE' WHERE user_document_id=_user_document_id;

				INSERT INTO USER_INFORMATION_LOG(

                    modify_user_by_id,

					modify_user_description,

					user_document_id

                ) VALUES(

					_modify_user_by_id,

                    'USER DISABLED',

                    _user_document_id

                );

                SELECT 1 AS RESPONSE, 'User disabled' AS MESSAGE;

            COMMIT;

        ELSE 

			SELECT 0 AS RESPONSE, 'User already disabled' AS MESSAGE;

        END IF; 

    ELSE 

		SELECT 0 AS RESPONSE, 'User no found' AS MESSAGE;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-27 17:00:12
