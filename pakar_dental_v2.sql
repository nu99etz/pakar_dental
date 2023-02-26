-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pakar_dental
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB-0+deb11u1

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
-- Table structure for table `certainly_factor`
--

DROP TABLE IF EXISTS `certainly_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certainly_factor` (
  `id_certainly_factor` int(11) NOT NULL AUTO_INCREMENT,
  `id_gejala` int(11) DEFAULT NULL,
  `id_penyakit` int(11) DEFAULT NULL,
  `mb_value` float DEFAULT NULL,
  `md_value` float DEFAULT NULL,
  PRIMARY KEY (`id_certainly_factor`),
  KEY `id_gejala` (`id_gejala`),
  KEY `id_penyakit` (`id_penyakit`),
  CONSTRAINT `certainly_factor_ibfk_1` FOREIGN KEY (`id_gejala`) REFERENCES `ms_gejala` (`id_ms_gejala`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `certainly_factor_ibfk_2` FOREIGN KEY (`id_penyakit`) REFERENCES `ms_penyakit` (`id_ms_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=583 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certainly_factor`
--

LOCK TABLES `certainly_factor` WRITE;
/*!40000 ALTER TABLE `certainly_factor` DISABLE KEYS */;
INSERT INTO `certainly_factor` VALUES (298,1,1,1,0.1),(299,2,1,1,0.1),(300,3,1,1,0.6),(301,5,1,1,0),(302,6,1,0.8,0.2),(303,7,1,0.9,0.2),(304,8,1,0.8,0.1),(305,9,1,0.5,0.2),(306,10,1,0.5,0.3),(307,12,1,1,0),(308,19,1,0.9,0.6),(309,20,1,0.9,0.4),(310,21,1,1,0),(311,22,1,0.7,0.3),(312,24,1,0.7,0.3),(313,25,1,0.8,0.4),(314,26,1,0.9,0.2),(315,27,1,0.8,0.2),(316,28,1,0.5,0.2),(317,32,1,0.7,0.3),(318,33,1,0.8,0.4),(319,34,1,0.5,0.2),(320,37,1,0.9,0.3),(321,39,1,0.9,0.2),(322,1,2,0.8,0.5),(323,2,2,0.9,0.2),(324,3,2,0.8,0.1),(325,5,2,1,0),(326,6,2,0.8,0.2),(327,7,2,0.9,0.1),(328,8,2,0.7,0.3),(329,9,2,0.5,0.2),(330,10,2,0.5,0.2),(331,12,2,1,0),(332,19,2,0.7,0.2),(333,20,2,0.8,0.2),(334,22,2,0.9,0.1),(335,24,2,0.9,0.1),(336,25,2,0.7,0.4),(337,27,2,0.7,0.5),(338,28,2,0.5,0.2),(339,33,2,0.8,0.4),(340,35,2,0.4,0.2),(341,37,2,0.5,0.3),(342,39,2,0.8,0.2),(343,1,3,0.8,0.3),(344,2,3,0.8,0.1),(345,3,3,0.8,0.1),(346,5,3,1,0),(347,6,3,0.8,0.1),(348,7,3,0.9,0.1),(349,8,3,0.7,0.3),(350,9,3,0.5,0.2),(351,10,3,0.9,0.2),(352,12,3,1,0),(353,19,3,0.8,0.4),(354,20,3,0.7,0.4),(355,22,3,0.8,0.2),(356,24,3,0.8,0.5),(357,25,3,0.9,0.2),(358,26,3,0.8,0.1),(359,27,3,0.9,0.4),(360,28,3,0.5,0.2),(361,32,3,0.7,0.3),(362,33,3,0.8,0.4),(363,35,3,0.4,0.2),(364,37,3,0.5,0.3),(365,38,3,0.7,0.1),(366,39,3,0.7,0.1),(367,1,4,0.8,0.5),(368,2,4,0.8,0.2),(369,3,4,0.8,0.6),(370,5,4,0.8,0.1),(371,6,4,0.7,0.1),(372,7,4,0.9,0.1),(373,8,4,0.8,0.3),(374,9,4,0.7,0.3),(375,10,4,0.7,0.1),(376,11,4,0.8,0.4),(377,12,4,0.8,0.3),(378,13,4,0.8,0.2),(379,14,4,0.9,0.1),(380,16,4,0.8,0.5),(381,20,4,0.8,0.2),(382,21,4,0.5,0.1),(383,22,4,0.6,0.1),(384,26,4,0.7,0.2),(385,27,4,0.9,0.3),(386,28,4,0.8,0.2),(387,29,4,0.7,0.3),(388,30,4,0.7,0.3),(389,32,4,0.7,0.3),(390,33,4,0.6,0.2),(391,35,4,0.4,0.2),(392,36,4,0.9,0.3),(393,39,4,0.5,0.1),(394,1,5,1,0.1),(395,2,5,1,0.1),(396,5,5,1,0.1),(397,16,5,0.8,0.2),(398,19,5,0.7,0.3),(399,20,5,0.9,0.5),(400,22,5,0.6,0.1),(401,34,5,0.8,0.2),(402,37,5,0.2,0.1),(403,38,5,0.8,0.2),(404,1,6,0.8,0.1),(405,2,6,1,0.1),(406,3,6,0.5,0.1),(407,5,6,1,0.1),(408,6,6,0.8,0.1),(409,7,6,0.8,0.1),(410,8,6,0.9,0.2),(411,9,6,0.5,0.1),(412,10,6,0.6,0.2),(413,11,6,0.7,0.5),(414,12,6,1,0),(415,19,6,0.8,0.1),(416,20,6,0.7,0.1),(417,22,6,0.9,0.1),(418,24,6,0.9,0.1),(419,31,6,0.7,0.3),(420,34,6,0.5,0.3),(421,37,6,0.6,0.1),(422,1,7,0.6,0.1),(423,2,7,0.8,0.3),(424,4,7,0.8,0.3),(425,11,7,1,0.1),(426,12,7,0.7,0.1),(427,13,7,0.9,0.1),(428,14,7,0.9,0.3),(429,18,7,0.7,0.1),(430,21,7,0.9,0.2),(431,22,7,0.9,0.2),(432,25,7,0.8,0.3),(433,27,7,0.8,0.2),(434,28,7,0.8,0.2),(435,33,7,0.7,0.2),(436,35,7,0.4,0.2),(437,39,7,0,0),(438,1,8,0.7,0.3),(439,2,8,0.6,0.1),(440,4,8,1,0),(441,11,8,0.7,0.3),(442,18,8,0.9,0.1),(443,21,8,0.7,0.1),(444,22,8,0.7,0.4),(445,25,8,0.9,0.2),(446,26,8,0.7,0.3),(447,27,8,0,0),(448,28,8,0.7,0.1),(449,33,8,0.7,0.4),(450,35,8,0.5,0.2),(451,36,8,0.8,0.1),(452,39,8,0,0),(453,1,9,0.8,0.2),(454,2,9,0.8,0.3),(455,3,9,0.6,0.2),(456,4,9,1,0),(457,12,9,0.8,0.4),(458,13,9,0.8,0.1),(459,18,9,0.6,0.1),(460,21,9,0.8,0.2),(461,22,9,0.6,0.1),(462,24,9,1,0),(463,25,9,0.8,0.4),(464,30,9,0,0),(465,34,9,0.5,0.3),(466,36,9,0.9,0.2),(467,39,9,0,0),(468,5,10,1,0),(469,14,10,0.8,0.1),(470,21,10,0.7,0.1),(471,23,10,0.9,0.6),(472,24,10,0.8,0.2),(473,1,11,0.7,0.3),(474,2,11,0.9,0.2),(475,10,11,0.7,0.2),(476,12,11,0.8,0.3),(477,13,11,0.8,0.2),(478,21,11,0.7,0.1),(479,2,12,0.4,0.1),(480,8,12,1,0.1),(481,13,12,0.7,0.2),(482,14,12,0.7,0.2),(483,20,12,0.8,0.2),(484,22,12,0.9,0.2),(485,26,12,0.9,0.3),(486,27,12,0.8,0.2),(487,28,12,0.5,0.2),(488,32,12,0.7,0.3),(489,33,12,0.7,0.3),(490,35,12,0.5,0.2),(491,37,12,0.3,0.1),(492,39,12,0.5,0.1),(493,4,13,0.8,0.4),(494,5,13,0.8,0.1),(495,6,13,0.7,0.3),(496,7,13,0.6,0.3),(497,14,13,0.8,0.2),(498,21,13,0.8,0.2),(499,23,13,0.8,0.2),(500,1,14,1,0.2),(501,2,14,1,0.1),(502,3,14,0.8,0.1),(503,4,14,1,0.1),(504,5,14,0.7,0.2),(505,6,14,0.8,0.5),(506,7,14,0.7,0.1),(507,8,14,0.9,0.1),(508,9,14,1,0.1),(509,10,14,0.8,0.4),(510,12,14,1,0),(511,13,14,0.9,0.2),(512,14,14,0.8,0.2),(513,16,14,0.7,0.2),(514,21,14,1,0),(515,22,14,0.5,0.1),(516,24,14,0.8,0.2),(517,28,14,0.5,0.2),(518,30,14,0.8,0.3),(519,34,14,0.9,0.2),(520,35,14,0.9,0.1),(521,36,14,0.9,0.2),(522,38,14,0.7,0.2),(523,39,14,0,0),(524,2,15,0.5,0.2),(525,8,15,1,0),(526,13,15,0.8,0.2),(527,21,15,0.8,0.2),(528,23,15,0.7,0.2),(529,27,15,0.9,0.3),(530,28,15,0.5,0.2),(531,33,15,0.8,0.3),(532,35,15,0.5,0.2),(533,37,15,0.3,0.2),(534,39,15,0,0),(535,5,16,0.5,0.1),(536,6,16,0.5,0.1),(537,15,16,1,0.3),(538,1,17,1,0.1),(539,2,17,0.8,0.1),(540,3,17,0.7,0.3),(541,4,17,1,0),(542,11,17,0.8,0.4),(543,12,17,0.9,0.4),(544,16,17,0.5,0.2),(545,20,17,0.7,0.2),(546,22,17,0.9,0.1),(547,35,17,0.9,0.3),(548,37,17,0.5,0.2),(549,39,17,0.5,0.2),(550,2,18,0.7,0.1),(551,8,18,1,0),(552,14,18,0.8,0.2),(553,21,18,0.9,0.2),(554,22,18,0.9,0.1),(555,27,18,0.9,0.5),(556,28,18,0.6,0.2),(557,32,18,0.6,0.1),(558,33,18,0.5,0.2),(559,35,18,0.9,0.3),(560,37,18,0,0),(561,39,18,0.5,0.2),(562,8,19,1,0),(563,17,19,1,0.1),(564,21,19,0.8,0.2),(565,22,19,0.9,0.2),(566,35,19,0.9,0.3),(567,37,19,0,0),(568,39,19,0.5,0.2),(569,10,20,0.9,0.1),(570,16,20,0.7,0.1),(571,21,20,0.9,0.1),(572,22,20,0.8,0.2),(573,34,20,0.9,0.1),(574,36,20,0.8,0.4),(575,39,20,0.5,0.2),(576,10,21,0.9,0.1),(577,16,21,0.7,0.1),(578,21,21,0.9,0.3),(579,22,21,0.8,0.2),(580,34,21,0.8,0.1),(581,36,21,0.9,0.2),(582,39,21,0.5,0.2);
/*!40000 ALTER TABLE `certainly_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_konsultasi_gejala`
--

DROP TABLE IF EXISTS `detail_konsultasi_gejala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_konsultasi_gejala` (
  `id_detail_konsultasi_gejala` int(11) NOT NULL AUTO_INCREMENT,
  `id_konsultasi` int(11) DEFAULT NULL,
  `id_gejala` int(11) DEFAULT NULL,
  `nilai_kepercayaan` double DEFAULT NULL,
  PRIMARY KEY (`id_detail_konsultasi_gejala`),
  KEY `id_konsultasi` (`id_konsultasi`),
  KEY `id_gejala` (`id_gejala`),
  CONSTRAINT `detail_konsultasi_gejala_ibfk_1` FOREIGN KEY (`id_konsultasi`) REFERENCES `konsultasi` (`id_konsultasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_konsultasi_gejala_ibfk_2` FOREIGN KEY (`id_gejala`) REFERENCES `ms_gejala` (`id_ms_gejala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_konsultasi_gejala`
--

LOCK TABLES `detail_konsultasi_gejala` WRITE;
/*!40000 ALTER TABLE `detail_konsultasi_gejala` DISABLE KEYS */;
INSERT INTO `detail_konsultasi_gejala` VALUES (33,5,5,1),(34,5,14,1),(35,5,21,1),(36,5,23,1),(37,6,8,1),(38,6,14,1),(39,6,20,1),(40,6,22,1),(41,6,27,1),(42,6,31,1),(43,6,35,1),(44,6,37,1),(45,6,39,1),(46,7,1,1),(47,7,2,1),(48,7,7,1),(49,7,12,1),(50,7,21,1),(51,7,22,1),(52,7,35,1),(53,7,37,1),(54,7,39,1),(55,8,1,1),(56,8,2,1),(57,8,6,1),(58,8,7,1),(59,8,18,1),(60,8,21,1),(61,8,23,1),(62,8,25,1),(63,8,35,1),(64,8,36,1),(65,8,39,1),(66,9,5,0.6),(67,9,14,0.6),(68,9,21,0.8),(69,9,23,1),(70,10,1,1),(71,10,2,1),(72,10,6,1),(73,10,7,1),(74,10,18,1),(75,10,21,1),(76,10,23,1),(77,10,25,1),(78,10,35,1),(79,10,36,1),(80,10,39,1),(81,11,1,1),(82,11,2,1),(83,11,6,1),(84,11,7,1),(85,11,18,1),(86,11,21,1),(87,11,23,1),(88,11,25,1),(89,11,35,1),(90,11,36,1),(91,11,39,1),(92,12,5,0.6),(93,12,14,0.6),(94,12,21,0.8),(95,12,23,1);
/*!40000 ALTER TABLE `detail_konsultasi_gejala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_konsultasi_penyakit`
--

DROP TABLE IF EXISTS `detail_konsultasi_penyakit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_konsultasi_penyakit` (
  `id_detail_konsultasi_penyakit` int(11) NOT NULL AUTO_INCREMENT,
  `id_konsultasi` int(11) DEFAULT NULL,
  `id_penyakit` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `presentase_cf` double DEFAULT NULL,
  PRIMARY KEY (`id_detail_konsultasi_penyakit`),
  KEY `detail_konsultasi_penyakit_ibfk_1` (`id_konsultasi`),
  KEY `detail_konsultasi_penyakit_ibfk_2` (`id_penyakit`),
  CONSTRAINT `detail_konsultasi_penyakit_ibfk_1` FOREIGN KEY (`id_konsultasi`) REFERENCES `konsultasi` (`id_konsultasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_konsultasi_penyakit_ibfk_2` FOREIGN KEY (`id_penyakit`) REFERENCES `ms_penyakit` (`id_ms_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_konsultasi_penyakit`
--

LOCK TABLES `detail_konsultasi_penyakit` WRITE;
/*!40000 ALTER TABLE `detail_konsultasi_penyakit` DISABLE KEYS */;
INSERT INTO `detail_konsultasi_penyakit` VALUES (38,5,10,1,NULL),(39,5,16,1,NULL),(40,5,13,2,60),(41,5,11,2,60),(42,6,19,1,NULL),(43,6,1,2,70),(44,6,2,2,60),(45,6,3,2,60),(46,6,6,2,50),(47,6,4,2,40),(48,6,12,2,40),(49,6,17,2,30),(50,6,18,2,30),(51,6,19,2,30),(52,6,20,2,30),(53,6,21,2,30),(54,7,1,1,NULL),(55,7,2,1,NULL),(56,7,3,1,NULL),(57,7,4,1,NULL),(58,7,5,1,NULL),(59,7,6,1,NULL),(60,7,7,1,NULL),(61,7,8,1,NULL),(62,7,9,1,NULL),(63,7,11,1,NULL),(64,7,14,1,NULL),(65,7,17,1,NULL),(66,7,1,2,70),(67,7,2,2,60),(68,7,3,2,60),(69,7,11,2,60),(70,7,6,2,50),(71,7,4,2,40),(72,7,12,2,40),(73,7,17,2,30),(74,7,18,2,30),(75,7,19,2,30),(76,7,20,2,30),(77,7,21,2,30),(78,8,1,2,100),(79,8,14,2,100),(80,8,3,2,100),(81,8,8,2,100),(82,8,4,2,100),(83,8,6,2,100),(84,8,2,2,100),(85,8,9,2,99),(86,8,17,2,99),(87,8,7,2,99),(88,8,18,2,97),(89,8,13,2,93),(90,8,11,2,93),(91,8,20,2,92),(92,8,21,2,92),(93,8,15,2,90),(94,8,19,2,89),(95,8,12,2,71),(96,9,4,1,NULL),(97,9,10,1,NULL),(98,9,13,1,NULL),(99,9,14,1,NULL),(100,9,13,2,92),(101,9,10,2,92),(102,9,14,2,91),(103,9,4,2,79),(104,10,1,1,NULL),(105,10,2,1,NULL),(106,10,3,1,NULL),(107,10,4,1,NULL),(108,10,6,1,NULL),(109,10,7,1,NULL),(110,10,8,1,NULL),(111,10,9,1,NULL),(112,10,11,1,NULL),(113,10,14,1,NULL),(114,10,17,1,NULL),(115,10,12,1,NULL),(116,10,15,1,NULL),(117,10,18,1,NULL),(118,10,13,1,NULL),(119,10,19,1,NULL),(120,10,20,1,NULL),(121,10,21,1,NULL),(122,10,1,2,100),(123,10,14,2,100),(124,10,3,2,100),(125,10,8,2,100),(126,10,4,2,100),(127,10,6,2,100),(128,10,2,2,100),(129,10,9,2,99),(130,10,17,2,99),(131,10,7,2,99),(132,10,18,2,97),(133,10,13,2,93),(134,10,11,2,93),(135,10,20,2,92),(136,10,21,2,92),(137,10,15,2,90),(138,10,19,2,89),(139,10,12,2,71),(140,11,1,1,NULL),(141,11,2,1,NULL),(142,11,3,1,NULL),(143,11,4,1,NULL),(144,11,6,1,NULL),(145,11,7,1,NULL),(146,11,8,1,NULL),(147,11,9,1,NULL),(148,11,11,1,NULL),(149,11,14,1,NULL),(150,11,17,1,NULL),(151,11,12,1,NULL),(152,11,15,1,NULL),(153,11,18,1,NULL),(154,11,13,1,NULL),(155,11,19,1,NULL),(156,11,20,1,NULL),(157,11,21,1,NULL),(158,11,1,2,100),(159,11,14,2,100),(160,11,3,2,99.9136),(161,11,8,2,99.8488),(162,11,4,2,99.741952),(163,11,6,2,99.73),(164,11,2,2,99.62368),(165,11,9,2,99.28),(166,11,17,2,99.16),(167,11,7,2,98.8),(168,11,18,2,96.64),(169,11,13,2,93.28),(170,11,11,2,92.8),(171,11,20,2,91.6),(172,11,21,2,91.6),(173,11,15,2,90.2),(174,11,19,2,88.8),(175,11,12,2,70.6),(176,12,4,1,NULL),(177,12,10,1,NULL),(178,12,13,1,NULL),(179,12,14,1,NULL),(180,12,13,2,92.27904),(181,12,10,2,91.5552),(182,12,14,2,91.04),(183,12,4,2,79.4912);
/*!40000 ALTER TABLE `detail_konsultasi_penyakit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konsultasi`
--

DROP TABLE IF EXISTS `konsultasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konsultasi` (
  `id_konsultasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `tanggal_konsultasi` date DEFAULT NULL,
  PRIMARY KEY (`id_konsultasi`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `konsultasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konsultasi`
--

LOCK TABLES `konsultasi` WRITE;
/*!40000 ALTER TABLE `konsultasi` DISABLE KEYS */;
INSERT INTO `konsultasi` VALUES (1,1,'2022-10-28'),(2,1,'2022-10-28'),(3,1,'2022-12-20'),(4,13,'2022-12-25'),(5,1,'2023-02-20'),(6,1,'2023-02-23'),(7,1,'2023-02-23'),(8,1,'2023-02-23'),(9,1,'2023-02-23'),(10,1,'2023-02-24'),(11,1,'2023-02-24'),(12,1,'2023-02-24');
/*!40000 ALTER TABLE `konsultasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontak`
--

DROP TABLE IF EXISTS `kontak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kontak` (
  `id_kontak` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `subject` varchar(65) NOT NULL,
  PRIMARY KEY (`id_kontak`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontak`
--

LOCK TABLES `kontak` WRITE;
/*!40000 ALTER TABLE `kontak` DISABLE KEYS */;
INSERT INTO `kontak` VALUES (1,'sjdfkj','sdkljsdj@gmail.com','sdksdksd'),(2,'aji','aji@gmail.com','sdnhsdsdksdj'),(3,'iyos','iyos@gmail.com','ksskdkdsdsk');
/*!40000 ALTER TABLE `kontak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_gejala`
--

DROP TABLE IF EXISTS `ms_gejala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_gejala` (
  `id_ms_gejala` int(11) NOT NULL AUTO_INCREMENT,
  `id_ms_kategori_gejala` int(11) DEFAULT NULL,
  `kode_gejala` varchar(255) DEFAULT NULL,
  `nama_gejala` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ms_gejala`),
  KEY `id_ms_kategori_gejala` (`id_ms_kategori_gejala`),
  CONSTRAINT `ms_gejala_ibfk_1` FOREIGN KEY (`id_ms_kategori_gejala`) REFERENCES `ms_kategori_gejala` (`id_ms_kategori_gejala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_gejala`
--

LOCK TABLES `ms_gejala` WRITE;
/*!40000 ALTER TABLE `ms_gejala` DISABLE KEYS */;
INSERT INTO `ms_gejala` VALUES (1,1,'G01','Diam'),(2,1,'G02','Makan '),(3,1,'G03','Tidur '),(4,2,'G04','Merah Bibir'),(5,2,'G05','Pipi Dalam '),(6,2,'G06','Bibir Atas'),(7,2,'G07','Bibir Bawah'),(8,2,'G08','Lidah'),(9,2,'G09','Dasar Mulut'),(10,2,'G10','Gusi'),(11,2,'G11','Sudut Bibir'),(12,3,'G12','Sariawan'),(13,3,'G13','Bercak Merah'),(14,3,'G14','Bercak Putih'),(15,3,'G15','Bercak Hitam'),(16,3,'G16','Benjolan'),(17,3,'G17','Celah'),(18,3,'G18','Pengelupasan'),(19,4,'G19','<3 Hari'),(20,4,'G20','<7 Hari'),(21,4,'G21','>7 Hari'),(22,5,'G22','Ya'),(23,5,'G23','Tidak'),(24,6,'G24','Tergigit'),(25,6,'G25','Alergi'),(26,6,'G26','Autoimun'),(27,6,'G27','Obat'),(28,7,'G28','Diabetes Mellitus'),(29,7,'G29','Hipertensi'),(30,7,'G30','Kanker'),(31,7,'G31','Asma'),(32,7,'G32','Gangguan Pencernaan'),(33,7,'G33','Gangguan Darah'),(34,8,'G34','Ya'),(35,8,'G35','Tidak'),(36,9,'G36','Ya'),(37,9,'G37','Tidak '),(38,10,'G38','Ya'),(39,10,'G39','Tidak');
/*!40000 ALTER TABLE `ms_gejala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_kategori_gejala`
--

DROP TABLE IF EXISTS `ms_kategori_gejala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_kategori_gejala` (
  `id_ms_kategori_gejala` int(11) NOT NULL AUTO_INCREMENT,
  `nama_ms_kategori` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ms_kategori_gejala`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_kategori_gejala`
--

LOCK TABLES `ms_kategori_gejala` WRITE;
/*!40000 ALTER TABLE `ms_kategori_gejala` DISABLE KEYS */;
INSERT INTO `ms_kategori_gejala` VALUES (1,'Nyeri'),(2,'Lokasi'),(3,'Bentuk Kelainan'),(4,'Muncul Kapan'),(5,'Kambuhan'),(6,'Diketahui Penyebabnya'),(7,'Riwayat Kesehatan'),(8,'Pembengkakan'),(9,'Apakah Pernah Berdarah'),(10,'Apakah Ada Bercak Atau Kondisi Yang Sama Ditemukan Di Kulit '),(11,'Apakah Pernah Diobati');
/*!40000 ALTER TABLE `ms_kategori_gejala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_penyakit`
--

DROP TABLE IF EXISTS `ms_penyakit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ms_penyakit` (
  `id_ms_penyakit` int(11) NOT NULL AUTO_INCREMENT,
  `kode_penyakit` varchar(255) DEFAULT NULL,
  `nama_penyakit` varchar(255) DEFAULT NULL,
  `solusi_penyakit` text DEFAULT NULL,
  PRIMARY KEY (`id_ms_penyakit`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_penyakit`
--

LOCK TABLES `ms_penyakit` WRITE;
/*!40000 ALTER TABLE `ms_penyakit` DISABLE KEYS */;
INSERT INTO `ms_penyakit` VALUES (1,'P01','RAS Mayor','Dapat Menggunakan Obat Kumur Antiseptik Atau Air Garam, Menambah Asupan Nutrisi (buah Dan Sayur), Manajemen Stres (jika Perlu Dapat Berkonsultasi Ke Psikolog/psikiater), Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(2,'P02','RAS Minor','Dapat Menggunakan Obat Kumur Antiseptik Atau Air Garam, Menambah Asupan Nutrisi (buah Dan Sayur), Manajemen Stress (jika Perlu Dapat Berkonsultasi Ke Psikolog/psikiater), Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(3,'P03','RAS Herpetiformis','Dapat Menggunakan Obat Kumur Antiseptik Atau Air Garam, Menambah Asupan Nutrisi (buah Dan Sayur), Manajemen Stres (jika Perlu Dapat Berkonsultasi Ke Psikolog/psikiater), Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(4,'P04','Kandidiasis','Dapat Menggunakan Obat Kumur Antiseptik Atau Air Garam, Hindari Merokok, Kontrol Rutin Ke Dokter Jika Memiliki Riwayat Penyakit Lain, Tetap Rutin Gosok Gigi Dan Lidah Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi Atau Dokter Gigi Spesialis Penyakit Mulut.'),(5,'P05','Parotitis','Sering Mengkonsumsi Air Putih Yang Banyak Untuk Menghindari Dehidrasi Akibat Demam, Istirahat Yang Cukup, Makan Makanan Yang Lembut (bubur), Menambah Asupan Nutrisi (buah Dan Sayur), Kompres Pipi Dengan Air Hangat/air Dingin, Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(6,'P06','Ulser Traumatitis','Dapat Mengoleskan Salep Kortikosteroid Topikal Triamcinolone Acetonide 0,1%, Kumur Dengan Obat Kumur Antiseptik Atau Air Garam, Tetap Rutin Gosok Gigi.'),(7,'P07','Angular Cheilitis','Rutin Mengkonsumsi Asupan Nutrisi (buah Dan Sayur), Memperbaiki Gigi Palsu (apabila Penyakitnya Terjadi Akibat Pemakaian Gigi Palsu), Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(8,'P08','Exfoliative Cheilitis','Rutin Menambah Asupan Nutrisi (buah Dan Sayur), Hindari Menghisap/menjilati Bibir, Manajemen Stres (jika Perlu Dapat Berkonsultasi Ke Psikolog/psikiater), Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(9,'P09','Actinic Cheilitis','Menggunakan Pelembab Bibir Atau Tabir Surya Yang Mengandung SPF, Hindari Merokok, Hindari Menghisap Bibir, Hindari Kontak Langsung Dengan Matahari (masker Wajah, Payung, Dll) Menambah Asupan Nutrisi (buah Dan Sayur), Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(10,'P10','Linea Alba Buccalis','Tidak Memerlukan Perawatan Karena Merupakan Kondisi Yang Normal Dan Tidak Berbahaya, Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(11,'P11','Nicotinic Stomatitis','Berhenti Merokok Dengan Cara Manajemen Stres (bila Merokok Adalah Pelarian Dari Stres), Konsultasi Ke Psikolog Atau Psikiater Untuk Melakukan Psikoterapi Dalam Program Penghentian Merokok Atau Terapi Stres, Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(12,'P12','Geographic Tongue','Tidak Memerlukan Perawatan Karena Merupakan Kondisi Yang Normal Dan Tidak Berbahaya, Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(13,'P13','Fordyce\'s Granules','Tidak Memerlukan Perawatan Karena Merupakan Kondisi Yang Normal Dan Tidak Berbahaya, Jika Kondisi Tersebut Mengganggu Penampilan Maka Dapat Dilakukan Perawatan Laser Ablasi CO2, Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi. '),(14,'P14','Kanker Mulut','Dugaan Keganasan / Kanker Mulut, Segera Ke Dokter Gigi, Dokter Gigi Spesialis Penyakit Mulut, Atau Dokter Gigi Spesialis Bedah Mulut Dan Maksilofasial Untuk Pemeriksaan Lebih Lanjut. Perawatan Dapat Dilakukan Dengan Operasi Untuk Pengangkatan Sel Kanker, Terapi Radiasi, Kemoterapi, Kombinasi Operasi Dan Radiasi. Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(15,'P15','Median Rhomboid Glossitis','Tidak Memerlukan Perawatan Karena Merupakan Kondisi Yang Normal Dan Tidak Berbahaya, Jika Memakai Gigi Palsu Maka Harus Rutin Membersihkan Gigi Palsunya, Hindari Merokok, Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(16,'P16','Pigmentasi','Tidak Memerlukan Perawatan Karena Merupakan Kondisi Yang Normal Dan Tidak Berbahaya, Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(17,'P17','Herpes Labialis','Konsumsi Air Putih Yang Banyak, Istirahat Yang Cukup, Makan Makanan Yang Lembut (bubur), Makan Makanan Tinggi Kalori Dan Tinggi Protein (diet TKTP), Menginformasikan Bahwa Ini Merupakan Penyakit Yang Menular Sehingga Diharapkan Isolasi Atau Tidak Kontak Dengan Orang Lain, Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Periksakan Lebih Lanjut Ke Dokter Gigi, Dokter Gigi Spesialis Penyakit Mulut Atau Dokter Gigi Spesialis Kulit Dan Kelamin.'),(18,'P18','Coated Tongue','Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur), Rutin Membersihkan Lidah Dari Sisa-sisa Makanan Yang Mungkin Menyelip Diantara Sela-sela Lidah, Konsumsi Air Putih Delapan Gelas Per Hari, Makan Makanan Berserat  Seperti Sayur Dan Bervitamin, Mengurangi Konsumsi Rokok Maupun Kopi Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(19,'P19','Fisured Tongue','Tidak Memerlukan Perawatan Karena Merupakan Kondisi Yang Normal Dan Tidak Berbahaya, Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur), Rutin Membersihkan Lidah Dari Sisa-sisa Makanan Yang Mungkin Menyelip Di Antara Sela-sela Lidah Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(20,'P20','Torus Mandibularis','Tidak Memerlukan Perawatan Karena Merupakan Kondisi Yang Normal Dan Tidak Berbahaya, Namun Jika Ingin Membuat/menggunakan Gigi Palsu Maka Harus Dilakukan Tindakan Operasi Pengangkatan Benjolan Tulang Tersebut. Selain Itu Tetap Rutin Gosok Gigi Dua Kali Sehari (sesudah Sarapan Dan Sebelum Tidur) Serta Kontrol Rutin 6 Bulan Sekali Ke Dokter Gigi.'),(21,'P21','Torus Palatinus','Tidak Memerlukan Perawatan Karena Merupakan Kondisi Yang Normal Dan Tidak Berbahaya, Namun Jika Ingin Membuat/menggunakan Gigi Palsu Maka Harus Dilakukan Tindakan Operasi Pengangkatan Benjolan Tulang Tersebut. Selain Itu Tetap Rutin Gosok Gigi Dua Kali Sehari.');
/*!40000 ALTER TABLE `ms_penyakit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_tlp` varchar(15) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (11,13,'Nugget','Jagiran Lor','0989289484','2022-12-25','L','2022-12-25 03:50:46','2022-12-25 03:50:46'),(12,14,'Yoga','Jakarta','08474774','2022-12-14','L','2022-12-25 05:27:05','2022-12-25 05:27:05'),(13,15,'Yahya','jagiran','08976533','2008-01-30','L','2022-12-25 05:27:58','2022-12-25 05:27:58');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Super Admin'),(2,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `id_rule` int(11) NOT NULL AUTO_INCREMENT,
  `id_ms_penyakit` int(11) DEFAULT NULL,
  `gejala` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_rule`),
  KEY `id_ms_penyakit` (`id_ms_penyakit`),
  CONSTRAINT `rule_ibfk_1` FOREIGN KEY (`id_ms_penyakit`) REFERENCES `ms_penyakit` (`id_ms_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (23,1,'1,2,3,5,6,7,8,9,10,12,19,20,21,22,24,25,26,27,28,32,33,34,37,39'),(24,2,'1,2,3,5,6,7,8,9,10,12,19,20,22,24,25,27,28,33,35,37,39'),(25,3,'1,2,3,5,6,7,8,9,10,12,19,20,22,24,25,26,27,28,32,33,35,37,38,39'),(26,4,'1,2,3,5,6,7,8,9,10,11,12,13,14,16,20,21,22,26,27,28,29,30,32,33,35,36,39'),(27,5,'1,2,5,16,19,20,22,34,37,38'),(28,6,'1,2,3,5,6,7,8,9,10,11,12,19,20,22,24,31,34,37'),(29,7,'1,2,4,11,12,13,14,18,21,22,25,27,28,33,35,39'),(30,8,'1,2,4,11,18,21,22,25,26,27,28,33,35,36,39'),(31,9,'1,2,3,4,12,13,18,21,22,24,25,30,34,36,39'),(32,10,'5,14,21,23,24'),(33,11,'1,2,10,12,13,21'),(34,12,'2,8,13,14,20,22,26,27,28,32,33,35,37,39'),(35,13,'4,5,6,7,14,21,23'),(36,14,'1,2,3,4,5,6,7,8,9,10,12,13,14,16,21,22,24,28,30,34,35,36,38,39'),(37,15,'2,8,13,21,23,27,28,33,35,37,39'),(38,16,'5,6,15'),(39,17,'1,2,3,4,11,12,16,20,22,35,37,39'),(40,18,'2,8,14,21,22,27,28,32,33,35,37,39'),(41,19,'8,17,21,22,35,37,39'),(42,20,'10,16,21,22,34,36,39'),(43,21,'10,16,21,22,34,36,39');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_breadth`
--

DROP TABLE IF EXISTS `rule_breadth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_breadth` (
  `id_rule_breadth` int(11) NOT NULL AUTO_INCREMENT,
  `id_rule` int(11) DEFAULT NULL,
  `parent_ms_gejala` int(11) DEFAULT NULL,
  `child_ms_gejala` int(11) DEFAULT NULL,
  `id_ms_penyakit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rule_breadth`),
  KEY `rule_breadth_ibfk_1` (`id_rule`),
  KEY `rule_breadth_ibfk_2` (`parent_ms_gejala`),
  KEY `rule_breadth_ibfk_3` (`child_ms_gejala`),
  KEY `rule_breadth_ibfk_4` (`id_ms_penyakit`),
  CONSTRAINT `rule_breadth_ibfk_1` FOREIGN KEY (`id_rule`) REFERENCES `rule` (`id_rule`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rule_breadth_ibfk_2` FOREIGN KEY (`parent_ms_gejala`) REFERENCES `ms_gejala` (`id_ms_gejala`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rule_breadth_ibfk_3` FOREIGN KEY (`child_ms_gejala`) REFERENCES `ms_gejala` (`id_ms_gejala`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rule_breadth_ibfk_4` FOREIGN KEY (`id_ms_penyakit`) REFERENCES `ms_penyakit` (`id_ms_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=603 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_breadth`
--

LOCK TABLES `rule_breadth` WRITE;
/*!40000 ALTER TABLE `rule_breadth` DISABLE KEYS */;
INSERT INTO `rule_breadth` VALUES (318,23,1,2,NULL),(319,23,2,3,NULL),(320,23,3,5,NULL),(321,23,5,6,NULL),(322,23,6,7,NULL),(323,23,7,8,NULL),(324,23,8,9,NULL),(325,23,9,10,NULL),(326,23,10,12,NULL),(327,23,12,19,NULL),(328,23,19,20,NULL),(329,23,20,21,NULL),(330,23,21,22,NULL),(331,23,22,24,NULL),(332,23,24,25,NULL),(333,23,25,26,NULL),(334,23,26,27,NULL),(335,23,27,28,NULL),(336,23,28,32,NULL),(337,23,32,33,NULL),(338,23,33,34,NULL),(339,23,34,37,NULL),(340,23,37,39,NULL),(341,23,39,NULL,1),(342,24,1,2,NULL),(343,24,2,3,NULL),(344,24,3,5,NULL),(345,24,5,6,NULL),(346,24,6,7,NULL),(347,24,7,8,NULL),(348,24,8,9,NULL),(349,24,9,10,NULL),(350,24,10,12,NULL),(351,24,12,19,NULL),(352,24,19,20,NULL),(353,24,20,22,NULL),(354,24,22,24,NULL),(355,24,24,25,NULL),(356,24,25,27,NULL),(357,24,27,28,NULL),(358,24,28,33,NULL),(359,24,33,35,NULL),(360,24,35,37,NULL),(361,24,37,39,NULL),(362,24,39,NULL,2),(363,25,1,2,NULL),(364,25,2,3,NULL),(365,25,3,5,NULL),(366,25,5,6,NULL),(367,25,6,7,NULL),(368,25,7,8,NULL),(369,25,8,9,NULL),(370,25,9,10,NULL),(371,25,10,12,NULL),(372,25,12,19,NULL),(373,25,19,20,NULL),(374,25,20,22,NULL),(375,25,22,24,NULL),(376,25,24,25,NULL),(377,25,25,26,NULL),(378,25,26,27,NULL),(379,25,27,28,NULL),(380,25,28,32,NULL),(381,25,32,33,NULL),(382,25,33,35,NULL),(383,25,35,37,NULL),(384,25,37,38,NULL),(385,25,38,39,NULL),(386,25,39,NULL,3),(387,26,1,2,NULL),(388,26,2,3,NULL),(389,26,3,5,NULL),(390,26,5,6,NULL),(391,26,6,7,NULL),(392,26,7,8,NULL),(393,26,8,9,NULL),(394,26,9,10,NULL),(395,26,10,11,NULL),(396,26,11,12,NULL),(397,26,12,13,NULL),(398,26,13,14,NULL),(399,26,14,16,NULL),(400,26,16,20,NULL),(401,26,20,21,NULL),(402,26,21,22,NULL),(403,26,22,26,NULL),(404,26,26,27,NULL),(405,26,27,28,NULL),(406,26,28,29,NULL),(407,26,29,30,NULL),(408,26,30,32,NULL),(409,26,32,33,NULL),(410,26,33,35,NULL),(411,26,35,36,NULL),(412,26,36,39,NULL),(413,26,39,NULL,4),(414,27,1,2,NULL),(415,27,2,5,NULL),(416,27,5,16,NULL),(417,27,16,19,NULL),(418,27,19,20,NULL),(419,27,20,22,NULL),(420,27,22,34,NULL),(421,27,34,37,NULL),(422,27,37,38,NULL),(423,27,38,NULL,5),(424,28,1,2,NULL),(425,28,2,3,NULL),(426,28,3,5,NULL),(427,28,5,6,NULL),(428,28,6,7,NULL),(429,28,7,8,NULL),(430,28,8,9,NULL),(431,28,9,10,NULL),(432,28,10,11,NULL),(433,28,11,12,NULL),(434,28,12,19,NULL),(435,28,19,20,NULL),(436,28,20,22,NULL),(437,28,22,24,NULL),(438,28,24,31,NULL),(439,28,31,34,NULL),(440,28,34,37,NULL),(441,28,37,NULL,6),(442,29,1,2,NULL),(443,29,2,4,NULL),(444,29,4,11,NULL),(445,29,11,12,NULL),(446,29,12,13,NULL),(447,29,13,14,NULL),(448,29,14,18,NULL),(449,29,18,21,NULL),(450,29,21,22,NULL),(451,29,22,25,NULL),(452,29,25,27,NULL),(453,29,27,28,NULL),(454,29,28,33,NULL),(455,29,33,35,NULL),(456,29,35,39,NULL),(457,29,39,NULL,7),(458,30,1,2,NULL),(459,30,2,4,NULL),(460,30,4,11,NULL),(461,30,11,18,NULL),(462,30,18,21,NULL),(463,30,21,22,NULL),(464,30,22,25,NULL),(465,30,25,26,NULL),(466,30,26,27,NULL),(467,30,27,28,NULL),(468,30,28,33,NULL),(469,30,33,35,NULL),(470,30,35,36,NULL),(471,30,36,39,NULL),(472,30,39,NULL,8),(473,31,1,2,NULL),(474,31,2,3,NULL),(475,31,3,4,NULL),(476,31,4,12,NULL),(477,31,12,13,NULL),(478,31,13,18,NULL),(479,31,18,21,NULL),(480,31,21,22,NULL),(481,31,22,24,NULL),(482,31,24,25,NULL),(483,31,25,30,NULL),(484,31,30,34,NULL),(485,31,34,36,NULL),(486,31,36,39,NULL),(487,31,39,NULL,9),(488,32,5,14,NULL),(489,32,14,21,NULL),(490,32,21,23,NULL),(491,32,23,24,NULL),(492,32,24,NULL,10),(493,33,1,2,NULL),(494,33,2,10,NULL),(495,33,10,12,NULL),(496,33,12,13,NULL),(497,33,13,21,NULL),(498,33,21,NULL,11),(499,34,2,8,NULL),(500,34,8,13,NULL),(501,34,13,14,NULL),(502,34,14,20,NULL),(503,34,20,22,NULL),(504,34,22,26,NULL),(505,34,26,27,NULL),(506,34,27,28,NULL),(507,34,28,32,NULL),(508,34,32,33,NULL),(509,34,33,35,NULL),(510,34,35,37,NULL),(511,34,37,39,NULL),(512,34,39,NULL,12),(513,35,4,5,NULL),(514,35,5,6,NULL),(515,35,6,7,NULL),(516,35,7,14,NULL),(517,35,14,21,NULL),(518,35,21,23,NULL),(519,35,23,NULL,13),(520,36,1,2,NULL),(521,36,2,3,NULL),(522,36,3,4,NULL),(523,36,4,5,NULL),(524,36,5,6,NULL),(525,36,6,7,NULL),(526,36,7,8,NULL),(527,36,8,9,NULL),(528,36,9,10,NULL),(529,36,10,12,NULL),(530,36,12,13,NULL),(531,36,13,14,NULL),(532,36,14,16,NULL),(533,36,16,21,NULL),(534,36,21,22,NULL),(535,36,22,24,NULL),(536,36,24,28,NULL),(537,36,28,30,NULL),(538,36,30,34,NULL),(539,36,34,35,NULL),(540,36,35,36,NULL),(541,36,36,38,NULL),(542,36,38,39,NULL),(543,36,39,NULL,14),(544,37,2,8,NULL),(545,37,8,13,NULL),(546,37,13,21,NULL),(547,37,21,23,NULL),(548,37,23,27,NULL),(549,37,27,28,NULL),(550,37,28,33,NULL),(551,37,33,35,NULL),(552,37,35,37,NULL),(553,37,37,39,NULL),(554,37,39,NULL,15),(555,38,5,6,NULL),(556,38,6,15,NULL),(557,38,15,NULL,16),(558,39,1,2,NULL),(559,39,2,3,NULL),(560,39,3,4,NULL),(561,39,4,11,NULL),(562,39,11,12,NULL),(563,39,12,16,NULL),(564,39,16,20,NULL),(565,39,20,22,NULL),(566,39,22,35,NULL),(567,39,35,37,NULL),(568,39,37,39,NULL),(569,39,39,NULL,17),(570,40,2,8,NULL),(571,40,8,14,NULL),(572,40,14,21,NULL),(573,40,21,22,NULL),(574,40,22,27,NULL),(575,40,27,28,NULL),(576,40,28,32,NULL),(577,40,32,33,NULL),(578,40,33,35,NULL),(579,40,35,37,NULL),(580,40,37,39,NULL),(581,40,39,NULL,18),(582,41,8,17,NULL),(583,41,17,21,NULL),(584,41,21,22,NULL),(585,41,22,35,NULL),(586,41,35,37,NULL),(587,41,37,39,NULL),(588,41,39,NULL,19),(589,42,10,16,NULL),(590,42,16,21,NULL),(591,42,21,22,NULL),(592,42,22,34,NULL),(593,42,34,36,NULL),(594,42,36,39,NULL),(595,42,39,NULL,20),(596,43,10,16,NULL),(597,43,16,21,NULL),(598,43,21,22,NULL),(599,43,22,34,NULL),(600,43,34,36,NULL),(601,43,36,39,NULL),(602,43,39,NULL,21);
/*!40000 ALTER TABLE `rule_breadth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_konsultasi`
--

DROP TABLE IF EXISTS `tmp_konsultasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_konsultasi` (
  `id_tmp_konsultasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_ms_gejala` int(11) DEFAULT NULL,
  `id_prev_gejala` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `answer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tmp_konsultasi`),
  KEY `tmp_konsultasi_ibfk_1` (`id_ms_gejala`),
  KEY `tmp_konsultasi_ibfk_2` (`id_prev_gejala`),
  KEY `tmp_konsultasi_ibfk_3` (`id_user`),
  CONSTRAINT `tmp_konsultasi_ibfk_1` FOREIGN KEY (`id_ms_gejala`) REFERENCES `ms_gejala` (`id_ms_gejala`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tmp_konsultasi_ibfk_2` FOREIGN KEY (`id_prev_gejala`) REFERENCES `ms_gejala` (`id_ms_gejala`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tmp_konsultasi_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_konsultasi`
--

LOCK TABLES `tmp_konsultasi` WRITE;
/*!40000 ALTER TABLE `tmp_konsultasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_konsultasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) DEFAULT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Aan Super Admin','aan_admin','e10adc3949ba59abbe56e057f20f883e','2022-10-15 15:24:00'),(2,2,'Aan User','aan_user','e10adc3949ba59abbe56e057f20f883e','2022-10-15 15:24:00'),(13,2,'Nugget','nu99etz','e10adc3949ba59abbe56e057f20f883e','2022-12-25 03:50:46'),(14,2,'Yoga','yoga1234','e10adc3949ba59abbe56e057f20f883e','2022-12-25 05:27:05'),(15,2,'Yahya','yahya123','e10adc3949ba59abbe56e057f20f883e','2022-12-25 05:27:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-26 13:30:26
