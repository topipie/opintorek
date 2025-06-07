-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: testi_db2
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Current Database: `testi_db2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `testi_db2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `testi_db2`;

--
-- Table structure for table `arviointi`
--

DROP TABLE IF EXISTS `arviointi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arviointi` (
  `idArviointi` int NOT NULL AUTO_INCREMENT,
  `idOpiskelija` int NOT NULL,
  `idOpintojakso` int NOT NULL,
  `Arvosana` tinyint DEFAULT NULL,
  `Päiväys` date DEFAULT NULL,
  PRIMARY KEY (`idArviointi`),
  KEY `fk_Opiskelija_has_Opintojakso_Opintojakso1_idx` (`idOpintojakso`),
  KEY `fk_Opiskelija_has_Opintojakso_Opiskelija_idx` (`idOpiskelija`),
  CONSTRAINT `fk_Opiskelija_has_Opintojakso_Opintojakso1` FOREIGN KEY (`idOpintojakso`) REFERENCES `opintojakso` (`idOpintojakso`),
  CONSTRAINT `fk_Opiskelija_has_Opintojakso_Opiskelija` FOREIGN KEY (`idOpiskelija`) REFERENCES `opiskelija` (`idOpiskelija`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arviointi`
--

LOCK TABLES `arviointi` WRITE;
/*!40000 ALTER TABLE `arviointi` DISABLE KEYS */;
INSERT INTO `arviointi` VALUES (1,1,1,2,'2025-05-31'),(5,2,3,5,'2025-05-31'),(6,1,4,3,'2025-06-07'),(7,1,5,5,'2025-06-07'),(8,2,4,3,'2025-06-07');
/*!40000 ALTER TABLE `arviointi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opintojakso`
--

DROP TABLE IF EXISTS `opintojakso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opintojakso` (
  `idOpintojakso` int NOT NULL AUTO_INCREMENT,
  `Nimi` varchar(45) DEFAULT NULL,
  `Laajuus` tinyint DEFAULT NULL,
  `Koodi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOpintojakso`),
  UNIQUE KEY `Koodi_UNIQUE` (`Koodi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opintojakso`
--

LOCK TABLES `opintojakso` WRITE;
/*!40000 ALTER TABLE `opintojakso` DISABLE KEYS */;
INSERT INTO `opintojakso` VALUES (1,'Olio Ohjelmointi',5,'IN000433'),(3,'Tietokannat ja rajapinnat',5,'IN000434'),(4,'Matematiikan perusteet tietotekniikassa 2',5,'IN000123'),(5,'Johdatus ohjelmointiin',3,'T203403'),(6,'IN0003030',5,'Pilviohjelmointi');
/*!40000 ALTER TABLE `opintojakso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opiskelija`
--

DROP TABLE IF EXISTS `opiskelija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opiskelija` (
  `idOpiskelija` int NOT NULL AUTO_INCREMENT,
  `Etunimi` varchar(45) DEFAULT NULL,
  `Sukunimi` varchar(45) DEFAULT NULL,
  `Luokkatunnus` varchar(45) DEFAULT NULL,
  `Osoite` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOpiskelija`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opiskelija`
--

LOCK TABLES `opiskelija` WRITE;
/*!40000 ALTER TABLE `opiskelija` DISABLE KEYS */;
INSERT INTO `opiskelija` VALUES (1,'Aku','Ankka','Paratiisintie 13','TVT25KMO'),(2,'Roope','Ankka','Rahasäiliö','TVT25KMO'),(3,'Tauno','Pauno','TVT25KMO','Sairaalatie');
/*!40000 ALTER TABLE `opiskelija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `suoritus`
--

DROP TABLE IF EXISTS `suoritus`;
/*!50001 DROP VIEW IF EXISTS `suoritus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `suoritus` AS SELECT 
 1 AS `Sukunimi`,
 1 AS `Etunimi`,
 1 AS `Nimi`,
 1 AS `Arvosana`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `testi_db2`
--

USE `testi_db2`;

--
-- Final view structure for view `suoritus`
--

/*!50001 DROP VIEW IF EXISTS `suoritus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Testi_Teemu`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `suoritus` AS select `opiskelija`.`Sukunimi` AS `Sukunimi`,`opiskelija`.`Etunimi` AS `Etunimi`,`opintojakso`.`Nimi` AS `Nimi`,`arviointi`.`Arvosana` AS `Arvosana` from ((`opiskelija` join `arviointi` on((`opiskelija`.`idOpiskelija` = `arviointi`.`idOpiskelija`))) join `opintojakso` on((`opintojakso`.`idOpintojakso` = `arviointi`.`idOpintojakso`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-07 17:13:18
