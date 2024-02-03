-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: airline
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `CUSTOMERS_NAME` varchar(20) DEFAULT NULL,
  `CUSTOMERS_LAST_NAME` varchar(20) DEFAULT NULL,
  `CUSTOMERS_ID` decimal(5,0) NOT NULL,
  `CITIZENSHIP` varchar(45) DEFAULT NULL,
  `BIRTHDATE` date DEFAULT NULL,
  PRIMARY KEY (`CUSTOMERS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('NIKOS','KOUKOS',15,'GREEK','1969-09-06'),('KONSTANTINOS','PAPADOPOULOS',23,'GREEK','1983-07-12'),('VINCENT','CASSEL',34,'FRENCH','1966-11-23'),('YIANNIS','OIKONOMIDIS',37,'GREEK','1967-03-12'),('BENEDICT','CUMBERBATCH',42,'BRITISH','1976-07-19');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flights` (
  `FLIGHT_NO` decimal(5,0) NOT NULL,
  `DEPARTURE` varchar(30) DEFAULT NULL,
  `ARRIVAL` varchar(30) DEFAULT NULL,
  `FLIGHT_TYPE` varchar(15) DEFAULT NULL,
  `SEATS` decimal(3,0) DEFAULT NULL,
  `FREE_SEATS` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`FLIGHT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'ATHENS','MOSCOW','ABROAD',100,32),(2,'SKG','CHANIA','HOME',70,15),(3,'SKG','PARIS','ABROAD',200,21),(4,'ATHENS','LONDON','ABROAD',230,0),(5,'ATHENS','CHIOS','HOME',100,5);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `flights_updatable`
--

DROP TABLE IF EXISTS `flights_updatable`;
/*!50001 DROP VIEW IF EXISTS `flights_updatable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `flights_updatable` (
  `FLIGHT_NO` tinyint NOT NULL,
  `DEPARTURE` tinyint NOT NULL,
  `ARRIVAL` tinyint NOT NULL,
  `FLIGHT_TYPE` tinyint NOT NULL,
  `SEATS` tinyint NOT NULL,
  `FREE_SEATS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `flights_view`
--

DROP TABLE IF EXISTS `flights_view`;
/*!50001 DROP VIEW IF EXISTS `flights_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `flights_view` (
  `FLIGHT_NO` tinyint NOT NULL,
  `DEPARTURE` tinyint NOT NULL,
  `ARRIVAL` tinyint NOT NULL,
  `FLIGHT_TYPE` tinyint NOT NULL,
  `SEATS` tinyint NOT NULL,
  `FREE_SEATS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `RESERVATIONS_NO` decimal(5,0) NOT NULL,
  `CUSTOMERS_ID` decimal(5,0) NOT NULL,
  `CLIENT_CODE` decimal(5,0) NOT NULL,
  `FLIGHT_NO` decimal(5,0) NOT NULL,
  `COST` decimal(5,0) NOT NULL,
  PRIMARY KEY (`RESERVATIONS_NO`),
  KEY `CUSTOMERS_ID_FK` (`CUSTOMERS_ID`),
  KEY `FLIGHT_NO_FK` (`FLIGHT_NO`),
  CONSTRAINT `CUSTOMERS_ID_FK` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `customers` (`CUSTOMERS_ID`),
  CONSTRAINT `FLIGHT_NO_FK` FOREIGN KEY (`FLIGHT_NO`) REFERENCES `flights` (`FLIGHT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (25,15,35,1,70),(69,42,78,4,200),(78,23,49,2,25),(89,37,26,5,65),(179,34,46,3,130);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `reservations_insertable`
--

DROP TABLE IF EXISTS `reservations_insertable`;
/*!50001 DROP VIEW IF EXISTS `reservations_insertable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `reservations_insertable` (
  `CUSTOMERS_ID` tinyint NOT NULL,
  `CLIENT_CODE` tinyint NOT NULL,
  `FLIGHT_NO` tinyint NOT NULL,
  `COST` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `reservations_view`
--

DROP TABLE IF EXISTS `reservations_view`;
/*!50001 DROP VIEW IF EXISTS `reservations_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `reservations_view` (
  `RESERVATIONS_NO` tinyint NOT NULL,
  `CUSTOMERS_ID` tinyint NOT NULL,
  `CLIENT_CODE` tinyint NOT NULL,
  `FLIGHT_NO` tinyint NOT NULL,
  `COST` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `flights_updatable`
--

/*!50001 DROP TABLE IF EXISTS `flights_updatable`*/;
/*!50001 DROP VIEW IF EXISTS `flights_updatable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `flights_updatable` AS select `flights`.`FLIGHT_NO` AS `FLIGHT_NO`,`flights`.`DEPARTURE` AS `DEPARTURE`,`flights`.`ARRIVAL` AS `ARRIVAL`,`flights`.`FLIGHT_TYPE` AS `FLIGHT_TYPE`,`flights`.`SEATS` AS `SEATS`,`flights`.`FREE_SEATS` AS `FREE_SEATS` from `flights` where `flights`.`FREE_SEATS` > 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `flights_view`
--

/*!50001 DROP TABLE IF EXISTS `flights_view`*/;
/*!50001 DROP VIEW IF EXISTS `flights_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `flights_view` AS select `flights`.`FLIGHT_NO` AS `FLIGHT_NO`,`flights`.`DEPARTURE` AS `DEPARTURE`,`flights`.`ARRIVAL` AS `ARRIVAL`,`flights`.`FLIGHT_TYPE` AS `FLIGHT_TYPE`,`flights`.`SEATS` AS `SEATS`,`flights`.`FREE_SEATS` AS `FREE_SEATS` from `flights` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservations_insertable`
--

/*!50001 DROP TABLE IF EXISTS `reservations_insertable`*/;
/*!50001 DROP VIEW IF EXISTS `reservations_insertable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservations_insertable` AS select `reservations`.`CUSTOMERS_ID` AS `CUSTOMERS_ID`,`reservations`.`CLIENT_CODE` AS `CLIENT_CODE`,`reservations`.`FLIGHT_NO` AS `FLIGHT_NO`,`reservations`.`COST` AS `COST` from `reservations` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservations_view`
--

/*!50001 DROP TABLE IF EXISTS `reservations_view`*/;
/*!50001 DROP VIEW IF EXISTS `reservations_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservations_view` AS select `reservations`.`RESERVATIONS_NO` AS `RESERVATIONS_NO`,`reservations`.`CUSTOMERS_ID` AS `CUSTOMERS_ID`,`reservations`.`CLIENT_CODE` AS `CLIENT_CODE`,`reservations`.`FLIGHT_NO` AS `FLIGHT_NO`,`reservations`.`COST` AS `COST` from `reservations` */;
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

-- Dump completed on 2022-12-13 17:03:31
