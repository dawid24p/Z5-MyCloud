/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.13-MariaDB, for linux-systemd (x86_64)
--
-- Host: localhost    Database: srv126086_z5
-- ------------------------------------------------------
-- Server version	11.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `z5_break_ins`
--

DROP TABLE IF EXISTS `z5_break_ins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z5_break_ins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `ipaddress` varchar(45) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_time` (`username`,`datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z5_break_ins`
--

LOCK TABLES `z5_break_ins` WRITE;
/*!40000 ALTER TABLE `z5_break_ins` DISABLE KEYS */;
/*!40000 ALTER TABLE `z5_break_ins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z5_domeny`
--

DROP TABLE IF EXISTS `z5_domeny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z5_domeny` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` text NOT NULL,
  `port` int(11) NOT NULL,
  `user_id` smallint(6) NOT NULL,
  `errors` int(11) NOT NULL DEFAULT 0,
  `total_errors` int(11) NOT NULL DEFAULT 0,
  `failure` datetime DEFAULT NULL,
  `checked_at` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `detail` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_owner` (`user_id`,`host`(190),`port`),
  CONSTRAINT `z5_domeny_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `z5_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z5_domeny`
--

LOCK TABLES `z5_domeny` WRITE;
/*!40000 ALTER TABLE `z5_domeny` DISABLE KEYS */;
INSERT INTO `z5_domeny` VALUES
(1,'srv126086.seohost.com.pl',80,1,0,0,NULL,'2026-10-14 14:22:23','ok','Połączenie TCP poprawne.'),
(2,'srv126086.seohost.com.pl',443,1,0,0,NULL,'2026-10-14 14:22:23','ok','Połączenie TCP poprawne.'),
(3,'nieistniejacy.invalid',80,1,25,25,'2026-10-12 12:56:28','2026-10-14 14:22:23','failure','Nieistniejąca domena testowa.'),
(8,'example.invalid',443,1,13,13,'2026-10-12 13:02:30','2026-10-14 14:22:23','failure','Nieistniejąca domena testowa.'),
(9,'srv126086.seohost.com.pl',443,2,0,0,NULL,'2026-10-13 13:26:56','ok','Połączenie TCP poprawne.'),
(10,'przydzial.invalid',443,28,3,3,'2026-10-12 13:04:56','2026-10-13 13:26:56','failure','Nieistniejąca domena testowa.'),
(13,'grad.pl',443,31,0,0,NULL,'2026-10-15 10:59:10','ok','Połączenie TCP poprawne.'),
(14,'pbs.edu.pl',443,31,0,0,NULL,'2026-10-15 10:59:10','ok','Połączenie TCP poprawne.'),
(15,'qurka.vodna',443,31,12,12,'2026-10-15 10:54:06','2026-10-15 10:59:10','failure','Nie można rozwiązać nazwy DNS.');
/*!40000 ALTER TABLE `z5_domeny` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z5_goscieportalu`
--

DROP TABLE IF EXISTS `z5_goscieportalu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z5_goscieportalu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(45) NOT NULL,
  `datetime` datetime NOT NULL,
  `event_type` varchar(16) NOT NULL DEFAULT 'visit',
  `page` varchar(200) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `user_agent` varchar(1024) NOT NULL,
  `browser` varchar(120) DEFAULT NULL,
  `operating_system` varchar(120) DEFAULT NULL,
  `screen_width` int(10) unsigned DEFAULT NULL,
  `screen_height` int(10) unsigned DEFAULT NULL,
  `window_width` int(10) unsigned DEFAULT NULL,
  `window_height` int(10) unsigned DEFAULT NULL,
  `color_depth` tinyint(3) unsigned DEFAULT NULL,
  `cookies_enabled` tinyint(4) DEFAULT NULL,
  `java_enabled` tinyint(4) DEFAULT NULL,
  `language` varchar(35) DEFAULT NULL,
  `pixel_ratio` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visit_ip` (`ipaddress`),
  KEY `visit_time` (`datetime`),
  KEY `visit_event` (`event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z5_goscieportalu`
--

LOCK TABLES `z5_goscieportalu` WRITE;
/*!40000 ALTER TABLE `z5_goscieportalu` DISABLE KEYS */;
INSERT INTO `z5_goscieportalu` VALUES
(1,'93.159.60.249','2026-10-19 11:02:59','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'93.159.60.249','2026-10-19 11:03:03','login','/z5/weryfikuj3.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(3,'93.159.60.249','2026-10-19 11:03:03','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(4,'93.159.60.249','2026-10-19 11:03:31','visit','/z5/index4.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(5,'91.236.131.92','2026-10-19 11:06:29','visit','/z5/index3.php',NULL,'curl/7.76.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,'91.236.131.92','2026-10-19 11:07:44','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,'91.236.131.92','2026-10-19 11:07:44','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'91.236.131.92','2026-10-19 11:08:14','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'91.236.131.92','2026-10-19 11:08:15','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(14,'91.236.131.92','2026-10-19 11:08:15','visit','/z5/rejestruj.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(15,'91.236.131.92','2026-10-19 11:08:15','visit','/z5/index3.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(24,'91.236.131.92','2026-10-19 11:08:55','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(25,'91.236.131.92','2026-10-19 11:08:55','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(28,'91.236.131.92','2026-10-19 11:08:55','visit','/z5/rejestruj.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(29,'91.236.131.92','2026-10-19 11:08:55','visit','/z5/index3.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(53,'91.236.131.92','2026-10-19 11:08:58','visit','/z5/index3.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(55,'91.236.131.92','2026-10-19 11:08:58','visit','/z5/index3.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(57,'91.236.131.92','2026-10-19 11:08:58','visit','/z5/index3.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(59,'91.236.131.92','2026-10-19 11:08:58','visit','/z5/index3.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(62,'91.236.131.92','2026-10-19 11:10:35','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(76,'93.159.60.249','2026-10-19 11:13:46','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(77,'93.159.60.249','2026-10-19 11:13:50','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(78,'93.159.60.249','2026-10-19 11:13:51','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(79,'93.159.60.249','2026-10-19 11:13:53','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(80,'93.159.60.249','2026-10-19 11:13:57','login','/z5/weryfikuj3.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(81,'93.159.60.249','2026-10-19 11:13:57','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(82,'93.159.60.249','2026-10-19 11:15:14','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(83,'93.159.60.249','2026-10-19 11:15:18','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(84,'93.159.60.249','2026-10-19 11:15:34','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(85,'93.159.60.249','2026-10-19 11:16:15','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(86,'93.159.60.249','2026-10-19 11:16:30','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(87,'91.236.131.92','2026-10-19 11:16:31','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(88,'91.236.131.92','2026-10-19 11:16:31','login','/z5/weryfikuj3.php','admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(89,'91.236.131.92','2026-10-19 11:16:31','visit','/z5/index.php','admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(90,'91.236.131.92','2026-10-19 11:16:32','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(91,'93.159.60.249','2026-10-19 11:16:33','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(92,'93.159.60.249','2026-10-19 11:16:35','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(93,'93.159.60.249','2026-10-19 11:16:37','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(94,'93.159.60.249','2026-10-19 11:16:40','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(95,'93.159.60.249','2026-10-19 11:16:59','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(96,'93.159.60.249','2026-10-19 11:17:00','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(97,'93.159.60.249','2026-10-19 11:17:00','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(98,'93.159.60.249','2026-10-19 11:17:01','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(99,'93.159.60.249','2026-10-19 11:17:02','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(100,'93.159.60.249','2026-10-19 11:17:03','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(101,'93.159.60.249','2026-10-19 11:17:18','visit','/z5/cloud_logins.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(102,'93.159.60.249','2026-10-19 11:17:24','visit','/z5/index4.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(103,'91.236.131.92','2026-10-19 11:19:15','visit','/z5/index3.php',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(104,'91.236.131.92','2026-10-19 11:19:15','visit','/z5/rejestruj.php',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(105,'91.236.131.92','2026-10-19 11:19:15','visit','/z5/index3.php',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(115,'91.236.131.92','2026-10-19 11:19:16','visit','/z5/index3.php',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(117,'91.236.131.92','2026-10-19 11:19:16','visit','/z5/index3.php',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(120,'93.159.60.249','2026-10-19 11:20:10','visit','/z5/index4.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(121,'93.159.60.249','2026-10-19 11:20:11','visit','/z5/account_edit.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(122,'93.159.60.249','2026-10-19 11:20:29','visit','/z5/index4.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(123,'93.159.60.249','2026-10-19 11:20:36','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(124,'93.159.60.249','2026-10-19 11:20:43','login','/z5/weryfikuj3.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(125,'93.159.60.249','2026-10-19 11:20:43','visit','/z5/index.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(126,'93.159.60.249','2026-10-19 11:20:47','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(127,'93.159.60.249','2026-10-19 11:20:51','login','/z5/weryfikuj3.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(128,'93.159.60.249','2026-10-19 11:20:51','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(129,'93.159.60.249','2026-10-19 11:20:58','visit','/z5/index12.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(130,'93.159.60.249','2026-10-19 11:21:04','visit','/z5/index12.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(131,'91.236.131.92','2026-10-19 11:22:36','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(132,'91.236.131.92','2026-10-19 11:22:36','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(134,'91.236.131.92','2026-10-19 11:22:36','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(135,'93.159.60.249','2026-10-19 11:22:48','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(136,'93.159.60.249','2026-10-19 11:23:07','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(137,'91.236.131.92','2026-10-19 11:23:08','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(138,'91.236.131.92','2026-10-19 11:23:09','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(140,'91.236.131.92','2026-10-19 11:23:09','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(143,'91.236.131.92','2026-10-19 11:23:09','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(145,'91.236.131.92','2026-10-19 11:23:09','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(147,'91.236.131.92','2026-10-19 11:23:09','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(149,'91.236.131.92','2026-10-19 11:23:10','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(151,'91.236.131.92','2026-10-19 11:23:10','visit','/z5/index3.php',NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/156.0.0.0 Safari/537.36','Chrome Headless 156.0.0.0','Linux',1280,720,1280,720,24,1,0,'en-US',1.00),
(152,'93.159.60.249','2026-10-19 11:23:30','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(153,'93.159.60.249','2026-10-19 11:23:46','visit','/z5/index11.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(154,'93.159.60.249','2026-10-19 11:23:50','visit','/z5/index12.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(155,'93.159.60.249','2026-10-19 11:23:53','visit','/z5/index12.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(156,'93.159.60.249','2026-10-19 11:23:56','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(157,'93.159.60.249','2026-10-19 11:23:58','login','/z5/weryfikuj3.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(158,'93.159.60.249','2026-10-19 11:23:58','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(159,'93.159.60.249','2026-10-19 11:24:18','visit','/z5/index12.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(160,'93.159.60.249','2026-10-19 11:24:21','visit','/z5/index12.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(161,'93.159.60.249','2026-10-19 11:24:45','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(162,'93.159.60.249','2026-10-19 11:24:48','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(163,'93.159.60.249','2026-10-19 11:24:50','login','/z5/weryfikuj3.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(164,'93.159.60.249','2026-10-19 11:24:50','visit','/z5/index4.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(165,'93.159.60.249','2026-10-19 11:24:53','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(166,'93.159.60.249','2026-10-19 11:26:19','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(167,'93.159.60.249','2026-10-19 11:26:23','login','/z5/weryfikuj3.php','user1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(168,'93.159.60.249','2026-10-19 11:26:23','visit','/z5/index4.php','user1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(169,'93.159.60.249','2026-10-19 11:26:26','visit','/z5/index.php','user1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(170,'93.159.60.249','2026-10-19 11:26:30','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(171,'93.159.60.249','2026-10-19 11:26:54','login','/z5/weryfikuj3.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(172,'93.159.60.249','2026-10-19 11:26:54','visit','/z5/index4.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(173,'91.236.131.92','2026-10-19 11:27:09','login','/z5/weryfikuj3.php','admin','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(174,'91.236.131.92','2026-10-19 11:27:09','visit','/z5/tasks.php','admin','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(175,'91.236.131.92','2026-10-19 11:27:09','visit','/z5/tasks.php','admin','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(176,'91.236.131.92','2026-10-19 11:27:09','visit','/z5/tasks.php','admin','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(177,'91.236.131.92','2026-10-19 11:27:09','visit','/z5/tasks.php','admin','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(178,'91.236.131.92','2026-10-19 11:27:09','visit','/z5/tasks.php','admin','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(179,'91.236.131.92','2026-10-19 11:27:09','visit','/z5/tasks.php','admin','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(180,'91.236.131.92','2026-10-19 11:27:09','visit','/z5/tasks.php','admin','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(181,'93.159.60.249','2026-10-19 11:27:18','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(182,'93.159.60.249','2026-10-19 11:27:21','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(183,'93.159.60.249','2026-10-19 11:27:27','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(184,'93.159.60.249','2026-10-19 11:27:29','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(185,'93.159.60.249','2026-10-19 11:27:30','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(186,'93.159.60.249','2026-10-19 11:27:32','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(187,'93.159.60.249','2026-10-19 11:27:33','visit','/z5/cloud_logins.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(188,'93.159.60.249','2026-10-19 11:27:35','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(189,'93.159.60.249','2026-10-19 11:27:36','visit','/z5/cloud_security.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(190,'93.159.60.249','2026-10-19 11:27:39','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(191,'93.159.60.249','2026-10-19 11:28:06','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(192,'93.159.60.249','2026-10-19 11:28:08','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(193,'93.159.60.249','2026-10-19 11:28:11','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(194,'93.159.60.249','2026-10-19 11:28:13','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(195,'93.159.60.249','2026-10-19 11:28:42','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(196,'93.159.60.249','2026-10-19 11:28:49','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(197,'93.159.60.249','2026-10-19 11:29:01','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(198,'93.159.60.249','2026-10-19 11:29:02','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(199,'93.159.60.249','2026-10-19 11:37:10','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(200,'93.159.60.249','2026-10-19 11:37:12','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(201,'93.159.60.249','2026-10-19 11:37:14','visit','/z5/tasks.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(202,'93.159.60.249','2026-10-19 12:08:56','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(203,'93.159.60.249','2026-10-19 12:09:00','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(204,'93.159.60.249','2026-10-19 12:09:02','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(205,'93.159.60.249','2026-10-19 12:09:05','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(206,'93.159.60.249','2026-10-19 12:09:11','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(207,'93.159.60.249','2026-10-19 12:10:50','visit','/z6/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(208,'93.159.60.249','2026-10-19 12:10:53','login','/z6/weryfikuj3.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(209,'93.159.60.249','2026-10-19 12:10:53','visit','/z6/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(217,'91.236.131.92','2026-10-21 18:14:46','visit','/z5/index3.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(222,'91.236.131.92','2026-10-21 18:18:07','visit','/z5/index3.php',NULL,'Playwright/1.64.0 (x64; linux unknown) node/22.23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(223,'82.146.252.25','2026-10-21 19:04:12','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(224,'82.146.252.25','2026-10-21 19:04:18','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(225,'82.146.252.25','2026-10-21 19:04:29','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(226,'82.146.252.25','2026-10-21 19:04:39','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(227,'82.146.252.25','2026-10-21 19:04:51','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(228,'82.146.252.25','2026-10-21 19:05:01','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(229,'82.146.252.25','2026-10-21 19:05:17','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(230,'82.146.252.25','2026-10-21 19:05:26','login','/z5/weryfikuj3.php','user10','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(231,'82.146.252.25','2026-10-21 19:05:26','visit','/z5/index4.php','user10','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(232,'82.146.252.25','2026-10-21 19:05:43','visit','/z5/index.php','user10','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(233,'82.146.252.25','2026-10-21 19:05:55','visit','/z5/cloud_logins.php','user10','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(234,'82.146.252.25','2026-10-21 19:06:00','visit','/z5/index.php','user10','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(235,'82.146.252.25','2026-10-21 19:06:01','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(236,'188.146.128.19','2026-10-27 14:15:52','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1536,864,1536,730,24,1,0,'pl-PL',1.25),
(237,'188.146.128.19','2026-10-27 14:16:00','login','/z5/weryfikuj3.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1536,864,1536,730,24,1,0,'pl-PL',1.25),
(238,'188.146.128.19','2026-10-27 14:16:00','visit','/z5/index4.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1536,864,1536,730,24,1,0,'pl-PL',1.25),
(239,'188.146.128.19','2026-10-27 14:16:09','visit','/z5/cloud_security.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1536,864,1536,730,24,1,0,'pl-PL',1.25),
(240,'188.146.128.19','2026-10-27 14:16:12','visit','/z5/cloud_logins.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1536,864,1536,730,24,1,0,'pl-PL',1.25),
(241,'188.146.128.19','2026-10-27 14:16:18','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1536,864,1536,730,24,1,0,'pl-PL',1.25),
(242,'82.146.252.25','2026-10-28 20:08:41','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(243,'82.146.252.25','2026-10-28 20:08:42','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(244,'82.146.252.25','2026-10-28 20:08:52','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(245,'82.146.252.25','2026-10-28 20:08:54','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(246,'82.146.252.25','2026-10-28 20:08:55','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(247,'82.146.252.25','2026-10-28 20:09:00','login','/z5/weryfikuj3.php','user11','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(248,'82.146.252.25','2026-10-28 20:09:00','visit','/z5/index4.php','user11','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(249,'82.146.252.25','2026-10-28 20:09:05','visit','/z5/index.php','user11','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(250,'82.146.252.25','2026-10-28 20:09:17','visit','/z5/cloud_logins.php','user11','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(251,'82.146.252.25','2026-10-28 20:09:29','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(252,'82.146.252.25','2026-10-28 20:09:30','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(253,'82.146.252.25','2026-10-28 20:09:30','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(254,'82.146.252.25','2026-10-28 20:09:31','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(255,'82.146.252.25','2026-10-28 20:09:31','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:158.0) Gecko/20100101 Firefox/158.0','Firefox 158.0','Windows 10',1536,864,1536,731,24,1,0,'pl',1.25),
(256,'46.239.134.204','2026-10-29 11:22:24','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0','Firefox 159.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(257,'46.239.134.204','2026-10-29 11:22:27','login','/z5/weryfikuj3.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0','Firefox 159.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(258,'46.239.134.204','2026-10-29 11:22:27','visit','/z5/index4.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0','Firefox 159.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(259,'46.239.134.204','2026-10-29 11:22:30','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0','Firefox 159.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(260,'46.239.134.204','2026-10-29 11:22:45','visit','/z5/index.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0','Firefox 159.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(261,'79.162.7.84','2026-10-29 11:27:40','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(262,'79.162.7.84','2026-10-29 11:27:42','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(263,'79.162.7.84','2026-10-29 11:27:49','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(264,'79.162.7.84','2026-10-29 11:27:57','visit','/z5/rejestruj.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(265,'79.162.7.84','2026-10-29 11:27:59','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(266,'79.162.7.84','2026-10-29 11:28:02','login','/z5/weryfikuj3.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(267,'79.162.7.84','2026-10-29 11:28:02','visit','/z5/index4.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(268,'79.162.7.84','2026-10-29 11:28:09','visit','/z5/index.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(269,'79.162.7.84','2026-10-29 11:28:14','visit','/z5/index.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(270,'79.162.7.84','2026-10-29 11:28:15','visit','/z5/index.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(271,'79.162.7.84','2026-10-29 11:28:22','visit','/z5/index.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(272,'79.162.7.84','2026-10-29 11:28:35','visit','/z5/index.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(273,'79.162.7.84','2026-10-29 11:28:43','visit','/z5/index.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(274,'79.162.7.84','2026-10-29 11:28:51','visit','/z5/index.php','grad','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(275,'79.162.7.84','2026-10-29 11:28:53','visit','/z5/index3.php',NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','Chrome 156.0.0.0','Windows 10',1707,1067,1707,932,24,1,0,'en-US',1.50),
(276,'46.239.134.204','2026-10-29 11:35:24','visit','/z5/index12.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0','Firefox 159.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(277,'46.239.134.204','2026-10-29 11:35:26','visit','/z5/index12.php','admin','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0','Firefox 159.0','Windows 10',2208,1242,2208,974,24,1,0,'pl',0.87),
(278,'91.236.131.92','2026-10-29 16:18:27','visit','/z5/index3.php',NULL,'curl/7.76.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `z5_goscieportalu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z5_login_attempts`
--

DROP TABLE IF EXISTS `z5_login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z5_login_attempts` (
  `form_id` tinyint(3) unsigned NOT NULL,
  `login_key` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `locked_until` bigint(20) unsigned NOT NULL DEFAULT 0,
  `updated_at` bigint(20) unsigned NOT NULL,
  `failures` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`form_id`,`login_key`),
  KEY `attempts_updated` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z5_login_attempts`
--

LOCK TABLES `z5_login_attempts` WRITE;
/*!40000 ALTER TABLE `z5_login_attempts` DISABLE KEYS */;
INSERT INTO `z5_login_attempts` VALUES
(33,'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',0,1792407783,0),
(43,'0a041b9462caa4a31bac3567e0b6e6fd9100787db2ab433d96f6d178cabfce90',0,1792409183,0),
(43,'3b3b2a7b74fa24bfc79a1070be56ceca7b87afcd590ed93b857b8c3b50367ec5',0,1792606486,0),
(43,'5bbf1a9e0de062225a1bb7df8d8b3719591527b74950810f16b1a6bc6d7bd29b',0,1792609526,0),
(43,'81115e31e22a5801b197750ec12d7a51ad693aa017ecc8bca033cbd500a928b6',0,1793218140,0),
(43,'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',0,1793272947,0),
(43,'90ddece3c6bd7fffe83af4d6da7d1d47bdd3bc4b8c55e4fb6014a6197da2199e',0,1793273282,0),
(43,'ee7f57f26d4f0b5e76ad04f54480035d6d28751dbdb6dbb6df5863285e055dfb',0,1792606687,0);
/*!40000 ALTER TABLE `z5_login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z5_settings`
--

DROP TABLE IF EXISTS `z5_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z5_settings` (
  `name` varchar(40) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z5_settings`
--

LOCK TABLES `z5_settings` WRITE;
/*!40000 ALTER TABLE `z5_settings` DISABLE KEYS */;
INSERT INTO `z5_settings` VALUES
('poland_only','0');
/*!40000 ALTER TABLE `z5_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z5_users`
--

DROP TABLE IF EXISTS `z5_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z5_users` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `worker` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z5_users`
--

LOCK TABLES `z5_users` WRITE;
/*!40000 ALTER TABLE `z5_users` DISABLE KEYS */;
INSERT INTO `z5_users` VALUES
(1,'user1','pass1',NULL,1),
(2,'user2','pass2',NULL,1),
(14,'test123','test1234',NULL,0),
(27,'Dawid24p','Q@wertyuiop','d037b6414fced8bd7de7b13c06bf364fdad2b3b610a6d61cb74ddc5b8316c7da.png',0),
(28,'admin','admin','003792dc4ae8a2de5a44f1d8fde5473c605ec05dae40bb5b956fc0181ff048ee.png',0),
(31,'grad','grad',NULL,0),
(47,'user10','$2y$10$SpttA6dE4NBuSjYez5Sd3e1XfhlaElcotuDjxdVy5Uo1trcfuS9xu',NULL,0),
(48,'user11','$2y$10$O7ZZ4YgPcnHeLTLka1bpwudFnn.wNW3N19ZqDjAAa2wgCf8y30boe',NULL,0);
/*!40000 ALTER TABLE `z5_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-10-29 17:20:31
