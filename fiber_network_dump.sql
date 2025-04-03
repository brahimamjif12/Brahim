-- MySQL dump 10.13  Distrib 9.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: fiber_network
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `CARD`
--

DROP TABLE IF EXISTS `CARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARD` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `card_type` varchar(50) DEFAULT NULL,
  `fiber_id` varchar(50) DEFAULT NULL,
  `structure_id` int DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `structure_id` (`structure_id`),
  CONSTRAINT `CARD_ibfk_1` FOREIGN KEY (`structure_id`) REFERENCES `STRUCTURE` (`structure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARD`
--

LOCK TABLES `CARD` WRITE;
/*!40000 ALTER TABLE `CARD` DISABLE KEYS */;
INSERT INTO `CARD` VALUES (1,'Input','Fiber001',1),(2,'Output','Fiber002',1);
/*!40000 ALTER TABLE `CARD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIBER_CONNECTIONS`
--

DROP TABLE IF EXISTS `FIBER_CONNECTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FIBER_CONNECTIONS` (
  `connection_id` int NOT NULL AUTO_INCREMENT,
  `from_fiber` varchar(50) DEFAULT NULL,
  `to_fiber` varchar(50) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL,
  PRIMARY KEY (`connection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIBER_CONNECTIONS`
--

LOCK TABLES `FIBER_CONNECTIONS` WRITE;
/*!40000 ALTER TABLE `FIBER_CONNECTIONS` DISABLE KEYS */;
INSERT INTO `FIBER_CONNECTIONS` VALUES (1,'Fiber001','Fiber002','INACTIVE');
/*!40000 ALTER TABLE `FIBER_CONNECTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STRUCTURE`
--

DROP TABLE IF EXISTS `STRUCTURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STRUCTURE` (
  `structure_id` int NOT NULL AUTO_INCREMENT,
  `structure_name` varchar(255) NOT NULL,
  PRIMARY KEY (`structure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STRUCTURE`
--

LOCK TABLES `STRUCTURE` WRITE;
/*!40000 ALTER TABLE `STRUCTURE` DISABLE KEYS */;
INSERT INTO `STRUCTURE` VALUES (1,'Central Rack A');
/*!40000 ALTER TABLE `STRUCTURE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-03  9:59:12
