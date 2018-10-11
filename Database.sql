-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: inzone-database
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.10-MariaDB

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
-- Table structure for table `άρθρο`
--

DROP TABLE IF EXISTS `άρθρο`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `άρθρο` (
  `ID` int(11) NOT NULL CHECK(`ID`>=0),
  `ημερομηνία` date NOT NULL,
  `κείμενο` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `τίτλος` varchar(170) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_μέλους` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `όνομα_κατηγορίας` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `email_a_idx` (`email_μέλους`),
  KEY `όνομα_κατηγορίας_idx` (`όνομα_κατηγορίας`),
  CONSTRAINT `email_μέλους` FOREIGN KEY (`email_μέλους`) REFERENCES `μέλος` (`email`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `όνομα_κατηγορίας` FOREIGN KEY (`όνομα_κατηγορίας`) REFERENCES `κατηγορία` (`Όνομα`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `αρμοδιότητα`
--

DROP TABLE IF EXISTS `αρμοδιότητα`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `αρμοδιότητα` (
  `ρόλος` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `μισθός` int(11) NOT NULL CHECK(`μισθός`>=0),
  `min` int(11) NOT NULL CHECK(`min`>=0),
  PRIMARY KEY (`ρόλος`),
  UNIQUE KEY `ρόλος_UNIQUE` (`ρόλος`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ασχολείται`
--

DROP TABLE IF EXISTS `ασχολείται`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ασχολείται` (
  `email_μελ` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `όνομα_κατ` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`όνομα_κατ`,`email_μελ`),
  KEY `όνομα_κατηγορίας_idx` (`όνομα_κατ`),
  KEY `email_μελ_idx` (`email_μελ`),
  CONSTRAINT `email_μελ` FOREIGN KEY (`email_μελ`) REFERENCES `μέλος` (`email`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `όνομα_κατ` FOREIGN KEY (`όνομα_κατ`) REFERENCES `κατηγορία` (`Όνομα`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `διαφήμιση`
--

DROP TABLE IF EXISTS `διαφήμιση`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `διαφήμιση` (
  `κωδικός` int(11) NOT NULL CHECK(`κωδικός`>=0),
  `εταιρεία` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `πλήθος προβολών` int(11) NOT NULL CHECK(`πλήθος προβολών`>=0),
  PRIMARY KEY (`κωδικός`),
  UNIQUE KEY `κωδικός_UNIQUE` (`κωδικός`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `κατηγορία`
--

DROP TABLE IF EXISTS `κατηγορία`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `κατηγορία` (
  `Όνομα` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Περιγραφή` varchar(145) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Όνομα`),
  UNIQUE KEY `Όνομα_UNIQUE` (`Όνομα`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `μέλος`
--

DROP TABLE IF EXISTS `μέλος`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `μέλος` (
  `όνομα` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `επίθετο` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ρόλος_αρμοδιότητας` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `ρόλος_idx` (`όνομα`,`email`,`επίθετο`),
  KEY `ρόλος_μ_idx` (`ρόλος_αρμοδιότητας`),
  CONSTRAINT `ρόλος_αρμοδιότητας` FOREIGN KEY (`ρόλος_αρμοδιότητας`) REFERENCES `αρμοδιότητα` (`ρόλος`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `προβάλλει`
--

DROP TABLE IF EXISTS `προβάλλει`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `προβάλλει` (
  `κωδικός_διαφήμισης` int(11) NOT NULL CHECK(`κωδικός_διαφήμισης`>=0),
  `id_άρθρου` int(11) NOT NULL CHECK(`id_άρθρου`>=0),
  PRIMARY KEY (`κωδικός_διαφήμισης`,`id_άρθρου`),
  KEY `id_άρθρου_idx` (`id_άρθρου`),
  CONSTRAINT `id_άρθρου` FOREIGN KEY (`id_άρθρου`) REFERENCES `άρθρο` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `κωδικός_διαφήμισης` FOREIGN KEY (`κωδικός_διαφήμισης`) REFERENCES `διαφήμιση` (`κωδικός`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'inzone-database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-23 19:49:05
