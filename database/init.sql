-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: service_com
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `iconPath` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d5456fd7e4c4866fec8ada1fa10` (`parentId`),
  CONSTRAINT `FK_d5456fd7e4c4866fec8ada1fa10` FOREIGN KEY (`parentId`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `serviceId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c0354a9a009d3bb45a08655ce3b` (`userId`),
  KEY `FK_216033d3cc678b06b9852dc5cdb` (`serviceId`),
  CONSTRAINT `FK_216033d3cc678b06b9852dc5cdb` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_c0354a9a009d3bb45a08655ce3b` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `user1Id` int NOT NULL,
  `user2Id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2fead4b87956dc04d2d7dcfb7fe` (`user1Id`),
  KEY `FK_bd797de2916a7f89d1ed185c02e` (`user2Id`),
  CONSTRAINT `FK_2fead4b87956dc04d2d7dcfb7fe` FOREIGN KEY (`user1Id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_bd797de2916a7f89d1ed185c02e` FOREIGN KEY (`user2Id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
INSERT INTO `conversation` (`createdAt`, `updatedAt`, `deletedAt`, `id`, `user1Id`, `user2Id`) VALUES ('2024-04-21 16:35:30.488755','2024-04-21 16:40:06.000000','2024-04-21 16:40:06.000000',1,1,4),('2024-04-22 10:15:48.888257','2024-04-22 13:31:30.000000','2024-04-22 13:31:30.000000',5,3,4),('2024-04-22 11:29:54.295405','2024-04-22 11:29:54.295405',NULL,14,1,3),('2024-04-22 12:24:52.186420','2024-04-22 12:27:34.000000','2024-04-22 12:27:34.000000',15,1,4),('2024-04-29 20:51:27.352580','2024-04-29 20:51:27.352580',NULL,16,3,4),('2024-05-05 20:29:49.149065','2024-05-05 20:29:49.149065',NULL,17,11,13),('2024-05-26 13:49:19.661332','2024-05-26 13:49:19.661332',NULL,18,3,11),('2024-05-26 21:21:52.386502','2024-05-26 21:21:52.386502',NULL,19,11,1),('2024-05-27 00:40:28.128887','2024-05-27 00:40:28.128887',NULL,20,11,15),('2024-05-28 10:11:11.792797','2024-05-28 10:11:11.792797',NULL,21,17,15);
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `sender_id` int DEFAULT NULL,
  `recipient_id` int DEFAULT NULL,
  `conversationId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c0ab99d9dfc61172871277b52f6` (`sender_id`),
  KEY `FK_3318a3c87e7795d769d5b96e564` (`recipient_id`),
  KEY `FK_7cf4a4df1f2627f72bf6231635f` (`conversationId`),
  CONSTRAINT `FK_3318a3c87e7795d769d5b96e564` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7cf4a4df1f2627f72bf6231635f` FOREIGN KEY (`conversationId`) REFERENCES `conversation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_c0ab99d9dfc61172871277b52f6` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`createdAt`, `updatedAt`, `deletedAt`, `id`, `text`, `sender_id`, `recipient_id`, `conversationId`) VALUES ('2024-04-22 10:15:48.895175','2024-04-22 13:31:30.000000','2024-04-22 13:31:30.000000',5,'this is an updated message from 3 to 4',3,4,5),('2024-04-22 11:29:54.318261','2024-04-22 12:23:00.000000','2024-04-22 12:23:00.000000',13,'this a message from 1 to 3',1,3,14),('2024-04-22 11:30:34.545104','2024-04-22 11:30:34.545104',NULL,14,'this a reply from 3 to 1',1,3,14),('2024-04-22 12:24:52.215678','2024-04-22 12:24:52.215678',NULL,15,'this a message from 1 to 4',1,4,15),('2024-04-22 12:25:49.171785','2024-04-22 12:25:49.171785',NULL,16,'this a second message from 1 to 4',1,4,15),('2024-04-29 20:51:27.395065','2024-04-29 20:51:27.395065',NULL,17,'this a second message from 3 to 4',3,4,16),('2024-04-29 20:53:03.894903','2024-04-29 20:53:03.894903',NULL,18,'this a second message from 3 to 4',3,4,16),('2024-04-29 20:57:48.543636','2024-04-29 20:57:48.543636',NULL,19,'this a second message from 1 to 3',1,3,14),('2024-04-29 21:16:49.159894','2024-04-29 21:16:49.159894',NULL,20,'this a second message from 1 to 3',1,3,14),('2024-04-29 21:26:34.926883','2024-04-29 21:26:34.926883',NULL,21,'this a second message from 1 to 3',1,3,14),('2024-05-05 20:29:49.174440','2024-05-05 20:29:49.174440',NULL,22,'from 11 to 13',11,13,17),('2024-05-05 20:30:56.027435','2024-05-05 20:30:56.027435',NULL,23,'from 13 to 11',13,11,17),('2024-05-05 20:31:48.834352','2024-05-05 20:31:48.834352',NULL,24,'from 11 to 13',11,13,17),('2024-05-05 20:32:40.363682','2024-05-05 20:32:40.363682',NULL,25,'from 11 to 13',11,13,17),('2024-05-05 20:33:37.684579','2024-05-05 20:33:37.684579',NULL,26,'from 11 to 13',11,13,17),('2024-05-05 20:33:58.527071','2024-05-05 20:33:58.527071',NULL,27,'from 13 to 11',13,11,17),('2024-05-05 20:40:44.602224','2024-05-05 20:40:44.602224',NULL,28,'from 11 to 13',11,13,17),('2024-05-05 20:40:48.116924','2024-05-05 20:40:48.116924',NULL,29,'from 13 to 11',13,11,17),('2024-05-05 20:41:52.000929','2024-05-05 20:41:52.000929',NULL,30,'from 11 to 13',11,13,17),('2024-05-05 20:41:55.049255','2024-05-05 20:41:55.049255',NULL,31,'from 13 to 11',13,11,17),('2024-05-05 20:41:59.341791','2024-05-05 20:41:59.341791',NULL,32,'from 11 to 13',11,13,17),('2024-05-05 20:43:01.732360','2024-05-05 20:43:01.732360',NULL,33,'from 13 to 11',13,11,17),('2024-05-05 20:44:31.219342','2024-05-05 20:44:31.219342',NULL,34,'from 13 to 11',13,11,17),('2024-05-05 20:44:38.623720','2024-05-05 20:44:38.623720',NULL,35,'from 11 to 13',11,13,17),('2024-05-05 20:44:47.798930','2024-05-05 20:44:47.798930',NULL,36,'from 13 to 11',13,11,17),('2024-05-05 20:46:23.529449','2024-05-05 20:46:23.529449',NULL,37,'from 13 to 11',13,11,17),('2024-05-05 20:46:28.714950','2024-05-05 20:46:28.714950',NULL,38,'from 11 to 13',11,13,17),('2024-05-05 20:46:38.133466','2024-05-05 20:46:38.133466',NULL,39,'from 13 to 11',13,11,17),('2024-05-05 21:12:30.110634','2024-05-05 21:12:30.110634',NULL,40,'from 11 to 13',11,13,17),('2024-05-06 11:06:32.317603','2024-05-06 11:06:32.317603',NULL,41,'from 11 to 13',11,13,17),('2024-05-06 11:06:47.610667','2024-05-06 11:06:47.610667',NULL,42,'from 13 to 11',13,11,17),('2024-05-06 12:00:45.588321','2024-05-06 12:00:45.588321',NULL,43,'from 11 to 13',11,13,17),('2024-05-06 12:01:03.724947','2024-05-06 12:01:03.724947',NULL,44,'from 13 to 11',13,11,17),('2024-05-06 16:04:40.417604','2024-05-06 16:04:40.417604',NULL,45,'from 13 to 11',13,11,17),('2024-05-06 16:12:49.206324','2024-05-06 16:12:49.206324',NULL,46,'salut ',11,13,17),('2024-05-06 16:13:16.733398','2024-05-06 16:13:16.733398',NULL,47,'from 13 to 11',13,11,17),('2024-05-06 16:14:54.246450','2024-05-06 16:14:54.246450',NULL,48,'from 13 to 11',13,11,17),('2024-05-06 16:14:54.939346','2024-05-06 16:14:54.939346',NULL,49,'from 13 to 11',13,11,17),('2024-05-06 16:14:55.446259','2024-05-06 16:14:55.446259',NULL,50,'from 13 to 11',13,11,17),('2024-05-06 16:14:56.071632','2024-05-06 16:14:56.071632',NULL,51,'from 13 to 11',13,11,17),('2024-05-06 18:40:51.775736','2024-05-06 18:40:51.775736',NULL,52,'aziz',11,13,17),('2024-05-06 18:42:52.673345','2024-05-06 18:42:52.673345',NULL,53,'aziz',11,13,17),('2024-05-06 18:42:59.285648','2024-05-06 18:42:59.285648',NULL,54,'salut',11,13,17),('2024-05-06 18:42:59.941812','2024-05-06 18:42:59.941812',NULL,55,'',11,13,17),('2024-05-06 18:43:03.888588','2024-05-06 18:43:03.888588',NULL,56,'salut',11,13,17),('2024-05-06 18:57:54.699541','2024-05-06 18:57:54.699541',NULL,57,'hello',11,13,17),('2024-05-06 18:58:00.313536','2024-05-06 18:58:00.313536',NULL,58,'how are you',11,13,17),('2024-05-06 19:37:54.448051','2024-05-06 19:37:54.448051',NULL,59,'hello',11,13,17),('2024-05-06 19:37:55.855895','2024-05-06 19:37:55.855895',NULL,60,'heloo',11,13,17),('2024-05-06 19:38:21.642216','2024-05-06 19:38:21.642216',NULL,61,'hello',11,13,17),('2024-05-08 10:09:28.387290','2024-05-08 10:09:28.387290',NULL,62,'salu patron',11,13,17),('2024-05-08 10:18:12.642572','2024-05-08 10:18:12.642572',NULL,63,'aaa',11,13,17),('2024-05-08 10:22:25.034995','2024-05-08 10:22:25.034995',NULL,64,'aaaaaaaaaaa',11,13,17),('2024-05-08 10:39:31.580790','2024-05-08 10:39:31.580790',NULL,65,'from 13 to 11',13,11,17),('2024-05-08 10:39:36.682074','2024-05-08 10:39:36.682074',NULL,66,'from 13 to 11',13,11,17),('2024-05-08 10:39:49.101053','2024-05-08 10:39:49.101053',NULL,67,'from 13 to 11',13,11,17),('2024-05-08 10:41:38.266649','2024-05-08 10:41:38.266649',NULL,68,'hello',11,13,17),('2024-05-08 10:41:42.360959','2024-05-08 10:41:42.360959',NULL,69,'from 13 to 11',13,11,17),('2024-05-08 10:41:45.448824','2024-05-08 10:41:45.448824',NULL,70,'gooof',11,13,17),('2024-05-09 11:53:57.759048','2024-05-09 11:53:57.759048',NULL,71,'hhj',11,13,17),('2024-05-25 15:32:43.730053','2024-05-25 15:32:43.730053',NULL,72,'azaa',11,13,17),('2024-05-25 15:45:40.089697','2024-05-25 15:45:40.089697',NULL,73,'',11,13,17),('2024-05-25 15:45:40.342601','2024-05-25 15:45:40.342601',NULL,74,'',11,13,17),('2024-05-25 15:45:40.795415','2024-05-25 15:45:40.795415',NULL,75,'',11,13,17),('2024-05-25 15:45:41.055425','2024-05-25 15:45:41.055425',NULL,76,'',11,13,17),('2024-05-25 15:45:41.299357','2024-05-25 15:45:41.299357',NULL,77,'',11,13,17),('2024-05-25 15:45:41.527817','2024-05-25 15:45:41.527817',NULL,78,'',11,13,17),('2024-05-25 15:45:41.747565','2024-05-25 15:45:41.747565',NULL,79,'',11,13,17),('2024-05-25 15:45:41.995186','2024-05-25 15:45:41.995186',NULL,80,'',11,13,17),('2024-05-25 15:45:42.224057','2024-05-25 15:45:42.224057',NULL,81,'',11,13,17),('2024-05-26 14:55:58.202223','2024-05-26 14:55:58.202223',NULL,82,'',11,13,17),('2024-05-26 16:02:11.773796','2024-05-26 16:02:11.773796',NULL,83,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',11,13,17),('2024-05-26 16:02:20.403569','2024-05-26 16:02:20.403569',NULL,84,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',11,13,17),('2024-05-26 17:18:16.454819','2024-05-26 17:18:16.454819',NULL,85,'mess',11,13,17),('2024-05-26 20:33:27.709266','2024-05-26 20:33:27.709266',NULL,86,'salut',11,13,17),('2024-05-26 20:34:06.261164','2024-05-26 20:34:06.261164',NULL,87,'salut aziz',11,13,17),('2024-05-26 20:44:18.154034','2024-05-26 20:44:18.154034',NULL,88,'aaaa',11,13,17),('2024-05-26 20:44:24.662297','2024-05-26 20:44:24.662297',NULL,89,'hello',11,13,17),('2024-05-26 20:45:36.765467','2024-05-26 20:45:36.765467',NULL,90,'hello',11,13,17),('2024-05-26 20:45:41.538784','2024-05-26 20:45:41.538784',NULL,91,'yes',11,13,17),('2024-05-26 20:46:35.154636','2024-05-26 20:46:35.154636',NULL,92,'hello',11,13,17),('2024-05-26 21:21:52.411974','2024-05-26 21:21:52.411974',NULL,93,'hello',11,1,19),('2024-05-26 21:21:58.108262','2024-05-26 21:21:58.108262',NULL,94,'error',11,1,19),('2024-05-26 21:22:00.189444','2024-05-26 21:22:00.189444',NULL,95,'goof',11,1,19),('2024-05-26 21:25:32.534197','2024-05-26 21:25:32.534197',NULL,96,'azziz',11,1,19),('2024-05-26 21:26:27.790043','2024-05-26 21:26:27.790043',NULL,97,'bb',11,3,18),('2024-05-26 21:26:32.475077','2024-05-26 21:26:32.475077',NULL,98,'aziz',11,3,18),('2024-05-26 21:26:33.747260','2024-05-26 21:26:33.747260',NULL,99,'',11,3,18),('2024-05-26 22:59:10.782666','2024-05-26 22:59:10.782666',NULL,100,'comment allez vous',13,11,17),('2024-05-26 22:59:29.214924','2024-05-26 22:59:29.214924',NULL,101,'why',13,11,17),('2024-05-26 23:00:22.616247','2024-05-26 23:00:22.616247',NULL,102,'why',13,11,17),('2024-05-26 23:22:33.306467','2024-05-26 23:22:33.306467',NULL,103,'yes',13,11,17),('2024-05-26 23:28:35.829697','2024-05-26 23:28:35.829697',NULL,104,'aziz',13,11,17),('2024-05-26 23:48:25.781263','2024-05-26 23:48:25.781263',NULL,105,'aziz',13,11,17),('2024-05-26 23:49:16.859451','2024-05-26 23:49:16.859451',NULL,106,'yes*',13,11,17),('2024-05-26 23:49:19.880942','2024-05-26 23:49:19.880942',NULL,107,'pourquoi',13,11,17),('2024-05-26 23:49:23.862657','2024-05-26 23:49:23.862657',NULL,108,'tout va bien',13,11,17),('2024-05-26 23:49:39.219895','2024-05-26 23:49:39.219895',NULL,109,'pour',11,3,18),('2024-05-26 23:49:44.533060','2024-05-26 23:49:44.533060',NULL,110,'oui',11,3,18),('2024-05-27 00:11:05.667769','2024-05-27 00:11:05.667769',NULL,111,'salut',13,11,17),('2024-05-27 00:11:14.814236','2024-05-27 00:11:14.814236',NULL,112,'hello',11,13,17),('2024-05-27 00:11:19.722621','2024-05-27 00:11:19.722621',NULL,113,'wilyey',13,11,17),('2024-05-27 00:11:22.937432','2024-05-27 00:11:22.937432',NULL,114,'wilyey',11,13,17),('2024-05-27 00:11:25.636847','2024-05-27 00:11:25.636847',NULL,115,'wilyey',13,11,17),('2024-05-27 00:11:28.429739','2024-05-27 00:11:28.429739',NULL,116,'wilyey',11,13,17),('2024-05-27 00:23:32.635984','2024-05-27 00:23:32.635984',NULL,117,'hello',11,13,17),('2024-05-27 00:23:37.037325','2024-05-27 00:23:37.037325',NULL,118,'how are you',13,11,17),('2024-05-27 00:23:42.728945','2024-05-27 00:23:42.728945',NULL,119,'fine and you ?',13,11,17),('2024-05-27 00:23:47.731793','2024-05-27 00:23:47.731793',NULL,120,'hello man',11,3,18),('2024-05-27 00:39:16.691651','2024-05-27 00:39:16.691651',NULL,121,'yes and you',11,13,17),('2024-05-27 00:39:21.055015','2024-05-27 00:39:21.055015',NULL,122,'okay',13,11,17),('2024-05-27 00:42:03.341836','2024-05-27 00:42:03.341836',NULL,123,'hello',15,11,20),('2024-05-27 00:42:25.919191','2024-05-27 00:42:25.919191',NULL,124,'how are you',11,15,20),('2024-05-27 00:52:32.690902','2024-05-27 00:52:32.690902',NULL,125,'not so good',15,11,20),('2024-05-27 00:52:38.906454','2024-05-27 00:52:38.906454',NULL,126,'working late on a project',15,11,20),('2024-05-27 00:52:47.522522','2024-05-27 00:52:47.522522',NULL,127,'me too',11,15,20),('2024-05-27 00:53:05.375607','2024-05-27 00:53:05.375607',NULL,128,'rira bien qui rira le dernier',11,15,20),('2024-05-27 00:53:08.750511','2024-05-27 00:53:08.750511',NULL,129,'oui oui',15,11,20),('2024-05-27 01:13:05.027513','2024-05-27 01:13:05.027513',NULL,130,'salut',11,13,17),('2024-05-27 01:13:20.712853','2024-05-27 01:13:20.712853',NULL,131,'pouquoi',13,11,17),('2024-05-27 01:14:44.985740','2024-05-27 01:14:44.985740',NULL,132,'poo',11,13,17),('2024-05-27 01:17:23.653539','2024-05-27 01:17:23.653539',NULL,133,'aziz',11,13,17),('2024-05-27 01:17:26.658199','2024-05-27 01:17:26.658199',NULL,134,'pour',13,11,17),('2024-05-27 01:23:39.308388','2024-05-27 01:23:39.308388',NULL,135,'add',11,13,17),('2024-05-27 01:23:43.970922','2024-05-27 01:23:43.970922',NULL,136,'aaa',13,11,17),('2024-05-27 01:24:28.470768','2024-05-27 01:24:28.470768',NULL,137,'message de jhon a abdelhak',11,13,17),('2024-05-27 01:24:45.483261','2024-05-27 01:24:45.483261',NULL,138,'pour ',15,11,20),('2024-05-27 03:13:57.810317','2024-05-27 03:13:57.810317',NULL,139,'aa',11,13,17),('2024-05-27 03:14:16.996549','2024-05-27 03:14:16.996549',NULL,140,'salut',11,15,20),('2024-05-27 03:14:20.816384','2024-05-27 03:14:20.816384',NULL,141,'tres bien',15,11,20),('2024-05-28 10:11:55.201972','2024-05-28 10:11:55.201972',NULL,142,'helllo',15,17,21),('2024-05-28 10:31:47.768398','2024-05-28 10:31:47.768398',NULL,143,'test message',11,1,19),('2024-05-28 10:31:50.087486','2024-05-28 10:31:50.087486',NULL,144,'done',11,1,19),('2024-05-28 11:13:46.048340','2024-05-28 11:13:46.048340',NULL,145,'test ',11,13,17),('2024-05-28 11:14:11.750663','2024-05-28 11:14:11.750663',NULL,146,'j\'ai compris',11,15,20),('2024-05-28 12:36:02.773118','2024-05-28 12:36:02.773118',NULL,147,'aziz',15,11,20),('2024-05-28 12:36:11.452263','2024-05-28 12:36:11.452263',NULL,148,'test',15,11,20),('2024-05-28 12:36:42.068301','2024-05-28 12:36:42.068301',NULL,149,'aziz',11,13,17),('2024-05-31 14:29:38.047883','2024-05-31 14:29:38.047883',NULL,150,'hello',11,13,17),('2024-05-31 14:30:07.232608','2024-05-31 14:30:07.232608',NULL,151,'so',11,13,17),('2024-05-31 14:51:13.330143','2024-05-31 14:51:13.330143',NULL,152,'salut',11,13,17),('2024-05-31 14:53:03.284733','2024-05-31 14:53:03.284733',NULL,153,'h',11,13,17),('2024-05-31 14:53:23.675914','2024-05-31 14:53:23.675914',NULL,154,'so',11,13,17),('2024-05-31 14:53:33.981121','2024-05-31 14:53:33.981121',NULL,155,'so',11,13,17),('2024-05-31 14:58:13.723724','2024-05-31 14:58:13.723724',NULL,156,'new',11,13,17),('2024-05-31 14:58:17.027766','2024-05-31 14:58:17.027766',NULL,157,'it added',11,13,17),('2024-05-31 16:46:46.052253','2024-05-31 16:46:46.052253',NULL,158,'Hello man ',11,13,17),('2024-05-31 16:46:49.340955','2024-05-31 16:46:49.340955',NULL,159,'how are you doing ',11,13,17),('2024-05-31 16:46:56.283576','2024-05-31 16:46:56.283576',NULL,160,'i wish we could meet soon',11,13,17),('2024-05-31 17:02:36.936489','2024-05-31 17:02:36.936489',NULL,161,'oh me too',13,11,17),('2024-05-31 17:06:42.522284','2024-05-31 17:06:42.522284',NULL,162,'so where can we meet mister',13,11,17),('2024-05-31 17:41:37.879023','2024-05-31 17:41:37.879023',NULL,163,'in Baristas coffee . fine ?',11,13,17),('2024-05-31 17:41:57.834820','2024-05-31 17:41:57.834820',NULL,164,'sure I ll be there',13,11,17),('2024-05-31 17:54:33.542784','2024-05-31 17:54:33.542784',NULL,165,'',11,13,17);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `emitterId` int NOT NULL,
  `receiverId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7469fbff7ecc1e40cb05392519f` (`emitterId`),
  KEY `FK_758d70a0e61243171e785989070` (`receiverId`),
  CONSTRAINT `FK_7469fbff7ecc1e40cb05392519f` FOREIGN KEY (`emitterId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_758d70a0e61243171e785989070` FOREIGN KEY (`receiverId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `status` enum('En attente de confirmaiton','Confirmé','Finie') NOT NULL DEFAULT 'En attente de confirmaiton',
  `date` datetime NOT NULL,
  `serviceId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_caabe91507b3379c7ba73637b84` (`userId`),
  KEY `FK_c721e93645fdc15f040096d1eaa` (`serviceId`),
  CONSTRAINT `FK_c721e93645fdc15f040096d1eaa` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_caabe91507b3379c7ba73637b84` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order-service`
--

DROP TABLE IF EXISTS `order-service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order-service` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `serviceId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_96777f015e619190e30be5adc6a` (`orderId`),
  KEY `FK_2c522e2eb396567790ea0377f59` (`serviceId`),
  CONSTRAINT `FK_2c522e2eb396567790ea0377f59` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_96777f015e619190e30be5adc6a` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order-service`
--

LOCK TABLES `order-service` WRITE;
/*!40000 ALTER TABLE `order-service` DISABLE KEYS */;
/*!40000 ALTER TABLE `order-service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profession` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `categoryId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e6da677e2377c1cb73a64f9a82f` (`categoryId`),
  KEY `FK_74101d849e467bab84ff142cf86` (`userId`),
  CONSTRAINT `FK_74101d849e467bab84ff142cf86` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_e6da677e2377c1cb73a64f9a82f` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `userId` int NOT NULL,
  `serviceId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a6c53dfc89ba3188b389ef29a62` (`userId`),
  KEY `FK_3462e3638471c356591d5926309` (`serviceId`),
  CONSTRAINT `FK_3462e3638471c356591d5926309` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_a6c53dfc89ba3188b389ef29a62` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `imagePath` varchar(255) NOT NULL,
  `basePrice` int NOT NULL,
  `professionId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_264f4f00b22cbe3e2dd88dedf01` (`professionId`),
  CONSTRAINT `FK_264f4f00b22cbe3e2dd88dedf01` FOREIGN KEY (`professionId`) REFERENCES `profession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime(6) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gouvernorat` varchar(255) NOT NULL,
  `delegation` varchar(255) NOT NULL,
  `profileImagePath` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','USER','SERVICE_PROVIDER') NOT NULL DEFAULT 'USER',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e12875dfb3b1d92d7d7c5377e2` (`email`),
  UNIQUE KEY `IDX_e2e02f59d9d115d5c6af3739eb` (`salt`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`createdAt`, `updatedAt`, `deletedAt`, `id`, `firstName`, `lastName`, `gouvernorat`, `delegation`, `profileImagePath`, `role`, `email`, `password`, `salt`, `document`, `status`) VALUES ('2024-04-21 14:22:26.814987','2024-04-21 14:22:26.814987',NULL,1,'John','Doe','Tunis','La Marsa','aa','USER','john@example.com','$2b$10$ACyrGuHR4OfiiEjQ6Av2HuCJWI4ChnSGyDXPcWk08pwwxaQSsku9y','$2b$10$ACyrGuHR4OfiiEjQ6Av2Hu',NULL,NULL),('2024-04-21 16:32:16.090292','2024-04-21 16:32:16.090292',NULL,3,'Aziz','Ben Dhiab','Tunis','La Marsa','aa','USER','john2@example.com','$2b$10$XGCxvN9cVU/.OWyEaOyg2ePXujbk4GCHTyT7i8JzeECxq.AsjTeg.','$2b$10$XGCxvN9cVU/.OWyEaOyg2e',NULL,NULL),('2024-04-21 16:32:51.576356','2024-04-21 16:32:51.576356',NULL,4,'Aziz 2','Ben Dhiab','Tunis','La Marsa','aa','USER','aziz@example.com','$2b$10$eJbRahjnpRxUdbmtnaTnMe1ZxdjZZ8luYpbyD2uSaqgW7WTtrWBzq','$2b$10$eJbRahjnpRxUdbmtnaTnMe',NULL,NULL),('2024-04-22 12:03:46.249826','2024-04-22 12:03:46.249826',NULL,5,'Aziz 4','Ben Dhiab','Tunis','La Marsa','aa','USER','kamel@example.com','$2b$10$ILlXmFnBiRQtXVlGlJFC/ub9pU8vNNLD36UNtaFaRYtldfxGP2jGi','$2b$10$ILlXmFnBiRQtXVlGlJFC/u',NULL,NULL),('2024-05-03 13:08:56.592695','2024-05-03 13:08:56.592695',NULL,6,'John','Doe','Tunis','Ariana',NULL,'USER','johndoe@example.com','$2b$10$LBbf2Gi2THcNRrhVNafzJOhlk0a0zwppR/8xOkVBksAK5THc69JNG','$2b$10$LBbf2Gi2THcNRrhVNafzJO',NULL,NULL),('2024-05-03 13:12:10.530970','2024-05-03 13:12:10.530970',NULL,8,'John','Doe','Tunis','Ariana',NULL,'USER','johndoe11@example.com','$2b$10$O2nzjFFtzdI6AU/7kCStC.RJUPxDOpiiBfQDksHtJgA96e1HDD.jm','$2b$10$O2nzjFFtzdI6AU/7kCStC.',NULL,NULL),('2024-05-03 13:44:46.463570','2024-05-03 13:44:46.463570',NULL,11,'Jhon','Doe','Tunis','Ariana',NULL,'USER','testetestestews@gmail.com','$2b$10$5VbuDhSvcJlUOdbCW7ZM..JtBUukacu5EDr6lXsmiDgEyInM0nHzm','$2b$10$5VbuDhSvcJlUOdbCW7ZM..',NULL,NULL),('2024-05-03 13:47:26.992613','2024-05-27 00:55:26.554315',NULL,13,'Abdelhak','President','Tunis','Ariana',NULL,'SERVICE_PROVIDER','tes@gmail.com','$2b$10$agyAb/fJ/SvStR4g4iSWCuU2tuGOfptn7vHoMVdODlAezicd9dwxi','$2b$10$agyAb/fJ/SvStR4g4iSWCu',NULL,NULL),('2024-05-03 14:30:52.964888','2024-05-03 14:30:52.964888',NULL,14,'Jhon','Doe','Tunis','Ariana','C:\\Users\\PAVILION\\source\\repos\\service-com-backend\\dist\\uploads\\profile-images\\1714743052949emploi.png','SERVICE_PROVIDER','aaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com','$2b$10$Rd8RwVEihbcINw06sWo2s.SFa4I9MT4vu0ZCrky7jo5pvz2oSvzdy','$2b$10$Rd8RwVEihbcINw06sWo2s.',NULL,NULL),('2024-05-26 22:54:49.610495','2024-05-26 22:54:49.610495',NULL,15,'Jemila','Chihi','Ezzahra','Ben Arous',NULL,'USER','bendhiab.aziz2@gmail.com','$2b$10$oYkL2uMqPyWmXmIaF78fu.pqN4DBsS8nulvi8Srbhx3SAwMvZ63IW','$2b$10$oYkL2uMqPyWmXmIaF78fu.',NULL,NULL),('2024-05-28 09:53:47.467643','2024-05-28 09:53:47.467643',NULL,16,'Kamel','Ben mrad','Ezzahra','Ben arous',NULL,'USER','aa@gmail.com','$2b$10$m2PKNhHV3jNnBdteIX.lQOv1vQkCxjmxGonLRfFQjbVLXZWnbx.Uu','$2b$10$m2PKNhHV3jNnBdteIX.lQO',NULL,NULL),('2024-05-28 10:02:36.230580','2024-05-28 10:02:36.230580',NULL,17,'Jhon','Doe','Tunis','Ariana','uploads\\profile-images\\171688695622611111.jpg','USER','testetes@gmail.com','$2b$10$mR2j2GJx004gdl4kaS4tr.9fFPDSj17QgxEE13tvf55J5Kf3cTgE.','$2b$10$mR2j2GJx004gdl4kaS4tr.',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 23:16:08
