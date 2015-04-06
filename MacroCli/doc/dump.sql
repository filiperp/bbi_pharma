CREATE DATABASE  IF NOT EXISTS `pharma` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pharma`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pharma
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_date` datetime DEFAULT NULL,
  `log_user` varchar(100) DEFAULT NULL,
  `log_import` varchar(50) DEFAULT NULL,
  `log_action` varchar(50) DEFAULT NULL,
  `log_msg` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7222 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;

/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack`
--

DROP TABLE IF EXISTS `stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `distributor` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `period` datetime DEFAULT NULL,
  `pathorigem` varchar(512) DEFAULT NULL,
  `pathdestino` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack`
--

LOCK TABLES `stack` WRITE;
/*!40000 ALTER TABLE `stack` DISABLE KEYS */;

/*!40000 ALTER TABLE `stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stackitem`
--

DROP TABLE IF EXISTS `stackitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
/*
stackID,nome,cd,material,vendamedia,estoquechao,estoquetransito,estoquependente,estoquetotal,diaschao,diastotal,ean,tipo,valor,periodo
*/

CREATE TABLE `stackitem` (
  `stackID` bigint(128) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cd` varchar(100) DEFAULT NULL,
  `material` varchar(512) DEFAULT NULL,
  `vendamedia` double DEFAULT NULL,
  `estoquechao` double DEFAULT NULL,
  `estoquetransito` double DEFAULT NULL,
  `estoquependente` double DEFAULT NULL,
  `estoquetotal` double DEFAULT NULL,
  `diaschao` double DEFAULT NULL,
  `diastotal` double DEFAULT NULL,
  `ean` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `periodo` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stackitem`
--

LOCK TABLES `stackitem` WRITE;
/*!40000 ALTER TABLE `stackitem` DISABLE KEYS */;

/*!40000 ALTER TABLE `stackitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-25 10:16:14
