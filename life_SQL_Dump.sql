CREATE DATABASE  IF NOT EXISTS `cwslife_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cwslife_db`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: cwslife_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,'DELETED','2026-06-15 13:10:19.102919','Admin','Gallery Image Deleted','GALLERY'),(2,'UPDATED','2026-06-15 13:59:21.364308','Admin','Event Updated: Diwali bbbb','EVENT'),(3,'UPDATED','2026-06-15 13:59:44.396843','Admin','Event Updated: Diwali','EVENT'),(4,'ADDED','2026-06-15 14:00:04.015122','Admin','New Event Added: Independence Daysssssssssssssssssssssssss','EVENT'),(5,'DELETED','2026-06-15 14:00:33.597099','Admin','Social Gallery Deleted: dog','SOCIAL_GALLERY'),(6,'ADDED','2026-06-15 14:01:04.555510','Admin','Social Gallery Added: Social image','SOCIAL_GALLERY'),(7,'DELETED','2026-06-15 14:15:55.556006','Admin','Event Deleted: Independence Daysssssssssssssssssssssssss','EVENT'),(8,'ADDED','2026-06-17 10:33:42.817884','Admin','New Event Added: new event','EVENT'),(9,'DELETED','2026-06-17 10:34:07.318211','Admin','Event Deleted: new event','EVENT'),(10,'ADDED','2026-06-17 10:35:20.788574','Admin','New Event Added: Annual Blood Donation Camp','EVENT'),(11,'DELETED','2026-06-17 10:36:01.023178','Admin','Event Deleted: Annual Blood Donation Camp','EVENT'),(12,'ADDED','2026-06-17 10:36:50.861240','Admin','New Event Added: annual event','EVENT'),(13,'ADDED','2026-06-17 10:37:54.182331','Admin','New Event Added: Annual event fox','EVENT'),(14,'ADDED','2026-06-17 10:38:15.277294','Admin','New Event Added: Annual event fox','EVENT'),(15,'DELETED','2026-06-17 10:38:39.447459','Admin','Event Deleted: Annual event fox','EVENT'),(16,'ADDED','2026-06-17 10:39:06.672502','Admin','New Event Added: Annual event fox','EVENT'),(17,'DELETED','2026-06-17 10:39:52.353625','Admin','Event Deleted: Annual event fox','EVENT'),(18,'DELETED','2026-06-17 10:39:59.632997','Admin','Event Deleted: Annual event fox','EVENT'),(19,'ADDED','2026-06-17 10:40:40.020096','Admin','New Event Added: Annual fox event','EVENT'),(20,'ADDED','2026-06-17 10:52:01.772265','Admin','New Event Added: anual event','EVENT'),(21,'ADDED','2026-06-17 11:05:52.502450','Admin','New Event Added: hhhhhhhh','EVENT'),(22,'DELETED','2026-06-17 11:06:45.703512','Admin','Event Deleted: hhhhhhhh','EVENT'),(23,'DELETED','2026-06-17 11:06:56.393051','Admin','Event Deleted: anual event','EVENT'),(24,'DELETED','2026-06-17 11:07:04.965329','Admin','Event Deleted: Annual fox event','EVENT'),(25,'ADDED','2026-06-17 11:07:18.126401','Admin','New Event Added: annual event','EVENT'),(26,'DELETED','2026-06-17 11:07:37.338694','Admin','Event Deleted: annual event','EVENT'),(27,'DELETED','2026-06-17 11:07:58.294785','Admin','Event Deleted: annual event','EVENT'),(28,'ADDED','2026-06-17 12:30:11.138205','Admin','Gallery Image Added: our team','GALLERY'),(29,'ADDED','2026-06-17 12:31:22.753151','Admin','Social Contribution Added: new card','SOCIAL_CONTRIBUTION'),(30,'DELETED','2026-06-17 12:31:44.324089','Admin','Social Contribution Deleted: new card','SOCIAL_CONTRIBUTION'),(31,'ADDED','2026-06-17 14:20:23.122437','Admin','New Event Added: annual event','EVENT'),(32,'DELETED','2026-06-17 14:20:48.359186','Admin','Event Deleted: annual event','EVENT'),(33,'ADDED','2026-06-17 14:21:41.253974','Admin','New Event Added: new event','EVENT'),(34,'DELETED','2026-06-17 14:22:22.574396','Admin','Event Deleted: new event','EVENT'),(35,'ADDED','2026-06-17 15:19:51.542616','Admin','New Event Added: annual event','EVENT'),(36,'UPDATED','2026-06-17 15:20:21.836086','Admin','Event Updated: annual event','EVENT'),(37,'UPDATED','2026-06-17 15:29:21.183701','Admin','Event Updated: Gudi Padwa','EVENT'),(38,'UPDATED','2026-06-17 15:29:29.177038','Admin','Event Updated: Gudi Padwa','EVENT'),(39,'UPDATED','2026-06-17 15:30:17.454615','Admin','Social Gallery Updated: envoirmental cleanup.','SOCIAL_GALLERY'),(40,'ADDED','2026-06-17 15:36:13.916775','Admin','New Event Added: annual event','EVENT'),(41,'DELETED','2026-06-17 15:36:23.423829','Admin','Event Deleted: annual event','EVENT'),(42,'UPDATED','2026-06-17 15:36:30.790876','Admin','Event Updated: Gudi Padwa','EVENT'),(43,'UPDATED','2026-06-17 15:36:38.119128','Admin','Event Updated: Gudi Padwa','EVENT'),(44,'ADDED','2026-06-17 15:37:04.687135','Admin','New Event Added: Republic Day Celebration','EVENT'),(45,'DELETED','2026-06-17 15:37:12.404815','Admin','Event Deleted: Republic Day Celebration','EVENT'),(46,'DELETED','2026-06-17 15:44:56.096787','Admin','Event Deleted: annual event','EVENT'),(47,'UPDATED','2026-06-17 16:19:26.619481','Admin','Social Contribution Updated: Environmental cleanup','SOCIAL_CONTRIBUTION'),(48,'UPDATED','2026-06-17 16:19:53.630902','Admin','Social Contribution Updated: Environmental cleanup........','SOCIAL_CONTRIBUTION'),(49,'ADDED','2026-06-17 16:20:15.719755','Admin','Social Gallery Added: sdjjj','SOCIAL_GALLERY'),(50,'DELETED','2026-06-17 16:20:23.093850','Admin','Social Gallery Deleted: sdjjj','SOCIAL_GALLERY'),(51,'ADDED','2026-06-17 16:21:21.026199','Admin','Social Contribution Added: new card','SOCIAL_CONTRIBUTION'),(52,'DELETED','2026-06-17 16:21:44.334177','Admin','Social Contribution Deleted: new card','SOCIAL_CONTRIBUTION'),(53,'ADDED','2026-06-18 14:49:22.224711','Admin','New Event Added: Independence Day','EVENT'),(54,'DELETED','2026-06-18 14:49:33.677794','Admin','Event Deleted: Independence Day','EVENT'),(55,'ADDED','2026-06-18 15:05:34.146101','Admin','New Event Added: Independence Day','EVENT'),(56,'DELETED','2026-06-18 15:05:43.342414','Admin','Event Deleted: Independence Day','EVENT'),(57,'ADDED','2026-06-18 15:56:23.051131','Admin','New Event Added: new','EVENT'),(58,'DELETED','2026-06-18 15:56:36.087525','Admin','Event Deleted: new','EVENT'),(59,'ADDED','2026-06-18 16:09:34.282413','Admin','New Event Added: new','EVENT'),(60,'UPDATED','2026-06-18 16:22:10.157240','Admin','Social Contribution Updated: Karma foundation','SOCIAL_CONTRIBUTION'),(61,'UPDATED','2026-06-18 16:23:00.576914','Admin','Social Contribution Updated: Karma foundation','SOCIAL_CONTRIBUTION'),(62,'UPDATED','2026-06-18 16:34:22.658760','Admin','Event Updated: new','EVENT'),(63,'DELETED','2026-06-18 16:40:02.357974','Admin','Event Deleted: new','EVENT'),(64,'ADDED','2026-06-18 16:40:28.377267','Admin','New Event Added: new','EVENT'),(65,'ADDED','2026-06-18 16:43:45.416096','Admin','New Event Added: jbfcjdbc','EVENT'),(66,'DELETED','2026-06-18 16:46:01.707122','Admin','Event Deleted: jbfcjdbc','EVENT'),(67,'DELETED','2026-06-18 16:46:06.927080','Admin','Event Deleted: new','EVENT'),(68,'ADDED','2026-06-18 16:50:29.471353','Admin','New Event Added: new','EVENT'),(69,'ADDED','2026-06-18 16:51:05.160889','Admin','New Event Added: newdfffffffff','EVENT'),(70,'DELETED','2026-06-18 17:03:42.456406','Admin','Event Deleted: newdfffffffff','EVENT'),(71,'DELETED','2026-06-18 17:03:47.478160','Admin','Event Deleted: new','EVENT'),(72,'ADDED','2026-06-18 17:04:08.727101','Admin','New Event Added: hhhhhhhhhhh','EVENT'),(73,'ADDED','2026-06-18 17:04:44.429729','Admin','New Event Added: jbjhjb','EVENT'),(74,'DELETED','2026-06-18 17:06:43.815075','Admin','Event Deleted: hhhhhhhhhhh','EVENT'),(75,'DELETED','2026-06-18 17:06:49.532622','Admin','Event Deleted: jbjhjb','EVENT'),(76,'ADDED','2026-06-18 17:08:09.043902','Admin','New Event Added: new','EVENT'),(77,'DELETED','2026-06-18 17:09:04.890294','Admin','Event Deleted: new','EVENT'),(78,'DELETED','2026-06-19 09:56:53.695008','Admin','Social Gallery Deleted: Social image','SOCIAL_GALLERY'),(79,'DELETED','2026-06-19 09:57:45.600507','Admin','Social Gallery Deleted: envoirmental cleanup.','SOCIAL_GALLERY'),(80,'DELETED','2026-06-19 09:57:49.297959','Admin','Social Gallery Deleted: Disability Support','SOCIAL_GALLERY'),(81,'DELETED','2026-06-19 09:57:54.010425','Admin','Social Gallery Deleted: handicap girl','SOCIAL_GALLERY'),(82,'ADDED','2026-06-19 09:58:21.049273','Admin','Social Gallery Added: Social Service1','SOCIAL_GALLERY'),(83,'ADDED','2026-06-19 09:58:34.026431','Admin','Social Gallery Added: Social Service2','SOCIAL_GALLERY'),(84,'ADDED','2026-06-19 09:58:52.071106','Admin','Social Gallery Added: Social Service3','SOCIAL_GALLERY'),(85,'ADDED','2026-06-19 09:59:40.348593','Admin','Social Gallery Added: Social Service4','SOCIAL_GALLERY'),(86,'DELETED','2026-06-19 10:00:04.106984','Admin','Social Contribution Deleted: Environmental cleanup','SOCIAL_CONTRIBUTION'),(87,'ADDED','2026-06-19 10:00:31.280232','Admin','Social Contribution Added: Environmental cleanup','SOCIAL_CONTRIBUTION'),(88,'UPDATED','2026-06-19 10:11:42.822707','Admin','Event Updated: Holi','EVENT'),(89,'DELETED','2026-06-19 10:29:48.117399','Admin','Gallery Image Deleted','GALLERY'),(90,'DELETED','2026-06-19 10:29:51.445752','Admin','Gallery Image Deleted','GALLERY'),(91,'DELETED','2026-06-19 10:29:54.600947','Admin','Gallery Image Deleted','GALLERY'),(92,'DELETED','2026-06-19 10:29:57.629932','Admin','Gallery Image Deleted','GALLERY'),(93,'DELETED','2026-06-19 10:29:59.987500','Admin','Gallery Image Deleted','GALLERY'),(94,'DELETED','2026-06-19 10:30:02.693270','Admin','Gallery Image Deleted','GALLERY'),(95,'DELETED','2026-06-19 10:30:05.322252','Admin','Gallery Image Deleted','GALLERY'),(96,'DELETED','2026-06-19 10:30:08.860220','Admin','Gallery Image Deleted','GALLERY'),(97,'DELETED','2026-06-19 10:30:11.402719','Admin','Gallery Image Deleted','GALLERY'),(98,'DELETED','2026-06-19 10:30:13.633626','Admin','Gallery Image Deleted','GALLERY'),(99,'ADDED','2026-06-19 10:32:03.549563','Admin','Gallery Image Added: Team Outing','GALLERY'),(100,'ADDED','2026-06-19 10:32:53.074812','Admin','Gallery Image Added: Team Outing','GALLERY'),(101,'ADDED','2026-06-19 10:33:18.367326','Admin','Gallery Image Added: Team Outing','GALLERY'),(102,'ADDED','2026-06-19 10:33:49.890296','Admin','Gallery Image Added: Dusshera','GALLERY'),(103,'ADDED','2026-06-19 10:34:10.425274','Admin','Gallery Image Added: Dusshera','GALLERY'),(104,'ADDED','2026-06-19 10:34:34.117959','Admin','Gallery Image Added: Dusshera','GALLERY'),(105,'ADDED','2026-06-19 10:35:50.761090','Admin','Gallery Image Added: Diwali Celebration','GALLERY'),(106,'ADDED','2026-06-19 10:36:17.027613','Admin','Gallery Image Added: Diwali Celebration','GALLERY'),(107,'ADDED','2026-06-19 10:36:58.430582','Admin','Gallery Image Added: Diwali Celebration','GALLERY'),(108,'ADDED','2026-06-19 10:38:23.855348','Admin','Gallery Image Added: Republic Day Celebrations','GALLERY'),(109,'ADDED','2026-06-19 10:39:00.793458','Admin','Gallery Image Added: Republic Day Celebrations','GALLERY'),(110,'ADDED','2026-06-19 10:39:30.254880','Admin','Gallery Image Added: Republic Day Celebrations','GALLERY'),(111,'ADDED','2026-06-19 10:40:06.565332','Admin','Gallery Image Added: Gudi Padwa','GALLERY'),(112,'ADDED','2026-06-19 10:40:27.170120','Admin','Gallery Image Added: Gudi Padwa','GALLERY'),(113,'ADDED','2026-06-19 10:40:46.043689','Admin','Gallery Image Added: Gudi Padwa','GALLERY'),(114,'ADDED','2026-06-19 10:41:46.995014','Admin','Gallery Image Added: Makar Sankranti','GALLERY'),(115,'ADDED','2026-06-19 10:42:09.065076','Admin','Gallery Image Added: Makar Sankranti','GALLERY'),(116,'ADDED','2026-06-19 10:42:33.448008','Admin','Gallery Image Added: Makar Sankranti','GALLERY'),(117,'ADDED','2026-06-19 10:43:00.511140','Admin','Gallery Image Added: Holi Celebration','GALLERY'),(118,'ADDED','2026-06-19 10:43:24.451023','Admin','Gallery Image Added: Holi Celebration','GALLERY'),(119,'ADDED','2026-06-19 10:43:53.823169','Admin','Gallery Image Added: Holi Celebration','GALLERY'),(120,'ADDED','2026-06-19 10:44:24.580086','Admin','Gallery Image Added: Our Office','GALLERY'),(121,'ADDED','2026-06-19 10:44:53.352600','Admin','Gallery Image Added: Our Office','GALLERY'),(122,'ADDED','2026-06-19 10:46:02.158078','Admin','Gallery Image Added: Our Office','GALLERY'),(123,'ADDED','2026-06-19 10:46:41.611443','Admin','Gallery Image Added: Birthday Celebration','GALLERY'),(124,'ADDED','2026-06-19 10:47:05.422673','Admin','Gallery Image Added: Birthday Celebration','GALLERY'),(125,'ADDED','2026-06-19 10:47:38.083648','Admin','Gallery Image Added: Birthday Celebration','GALLERY'),(126,'ADDED','2026-06-19 10:48:01.916651','Admin','Gallery Image Added: Birthday Celebration','GALLERY'),(127,'ADDED','2026-06-19 10:48:24.419316','Admin','Gallery Image Added: Birthday Celebration','GALLERY'),(128,'ADDED','2026-06-19 10:48:53.324690','Admin','Gallery Image Added: Birthday Celebration','GALLERY'),(129,'ADDED','2026-06-19 10:49:28.927741','Admin','Gallery Image Added: Team Meetup','GALLERY'),(130,'ADDED','2026-06-19 10:49:47.996726','Admin','Gallery Image Added: Team Meetup','GALLERY'),(131,'ADDED','2026-06-19 10:50:08.979915','Admin','Gallery Image Added: Team Meetup','GALLERY'),(132,'ADDED','2026-06-19 10:50:40.433380','Admin','Gallery Image Added: Work Environment','GALLERY'),(133,'ADDED','2026-06-19 10:51:00.811116','Admin','Gallery Image Added: Work Environment','GALLERY'),(134,'ADDED','2026-06-19 10:51:22.932990','Admin','Gallery Image Added: Work Environment','GALLERY'),(135,'ADDED','2026-06-19 10:52:26.868995','Admin','Gallery Image Added: Our Team','GALLERY'),(136,'ADDED','2026-06-19 10:52:56.057608','Admin','Gallery Image Added: Our Team','GALLERY'),(137,'ADDED','2026-06-19 10:53:17.504000','Admin','Gallery Image Added: Our Team','GALLERY'),(138,'UPDATED','2026-06-19 11:33:17.611512','Admin','Gallery Image Updated: Our Office','GALLERY'),(139,'UPDATED','2026-06-19 11:34:15.216983','Admin','Gallery Image Updated: Our Team','GALLERY'),(140,'UPDATED','2026-06-19 11:57:43.803468','Admin','Social Contribution Updated: Karma foundation','SOCIAL_CONTRIBUTION');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_inquiries`
--

DROP TABLE IF EXISTS `contact_inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_inquiries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_inquiries`
--

LOCK TABLES `contact_inquiries` WRITE;
/*!40000 ALTER TABLE `contact_inquiries` DISABLE KEYS */;
INSERT INTO `contact_inquiries` VALUES (28,'Rahul','Sharma','rahul.sharma@example.com','+91 9876543210','I would like to know more about the career opportunities available at Creative Web Solution. I am interested in applying for the Frontend Developer position and would like to understand the application process, required skills, and interview rounds.','2026-06-19 04:22:00',1),(29,'Priya','Patel','priya@gmail.com','91 9823456781','We are looking for a technology partner to develop a corporate website for our organization. Please contact us to discuss the project requirements and estimated timeline.','2026-06-19 04:24:36',1);
/*!40000 ALTER TABLE `contact_inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_logs`
--

DROP TABLE IF EXISTS `email_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` text,
  `recipient_email` varchar(255) DEFAULT NULL,
  `sent_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_logs`
--

LOCK TABLES `email_logs` WRITE;
/*!40000 ALTER TABLE `email_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_subscribers`
--

DROP TABLE IF EXISTS `email_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_subscribers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `subscribed_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6waqk0ix4bvkngcq4fjm24aup` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_subscribers`
--

LOCK TABLES `email_subscribers` WRITE;
/*!40000 ALTER TABLE `email_subscribers` DISABLE KEYS */;
INSERT INTO `email_subscribers` VALUES (1,'dipali@creativewebsolution.in','2026-05-25 12:30:17.068009'),(2,'dipali@creativewebsolutio.in','2026-05-25 12:31:48.391603'),(3,'dipalicws@gmail.com','2026-06-05 14:17:58.313125'),(4,'dipali@creativewebsolution..in','2026-06-16 11:59:56.082998'),(5,'dipali@creativewebsolution....in','2026-06-16 12:05:13.082662'),(6,'dipali@creativewebsolution........in','2026-06-16 12:06:52.133189'),(7,'dipali@creativewebsolution............in','2026-06-16 12:07:04.565415'),(8,'dipali@creativewebsolution.....in','2026-06-16 12:10:38.292650'),(9,'jayashree@creativewebsolution.in','2026-06-16 12:23:33.882380');
/*!40000 ALTER TABLE `email_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_stats`
--

DROP TABLE IF EXISTS `event_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_stats` (
  `id` bigint NOT NULL,
  `total_deleted` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_stats`
--

LOCK TABLES `event_stats` WRITE;
/*!40000 ALTER TABLE `event_stats` DISABLE KEYS */;
INSERT INTO `event_stats` VALUES (1,31);
/*!40000 ALTER TABLE `event_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime(6) DEFAULT NULL,
  `delete_count` int NOT NULL,
  `update_count` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (4,'Gudi Padwa','Festival','2026-03-19','Mark the beginning of a new year with optimism and fresh energy. Join us for a simple celebration embracing tradition, new beginnings, and team bonding.','/uploads/events/gudi.jpeg','PAST','2026-05-14 10:45:24','2026-06-17 15:36:38.111508',0,4),(5,'Holi','Festival','2026-03-07','Add colors to your workday with a fun-filled Holi celebration. Enjoy music, light activities, and festive treats while strengthening team connections in a joyful environment.','/uploads/events/1781844100682_holi10.jpeg','PAST','2026-05-14 10:45:24','2026-06-19 10:11:42.779158',0,1),(6,'Women Day','Event','2026-03-12','Celebrate and appreciate the incredible women in our workplace. Participate in engaging sessions, recognition activities, and discussions promoting equality and empowerment.','/uploads/events/womesday.png','PAST','2026-05-14 10:45:24',NULL,0,0),(19,'Independence Day','Event','2026-08-15','Celebrate the spirit of unity and patriotism at our workplace. Join us for a flag hoisting ceremony, team activities, and a short cultural program honoring our nation’s journey and values.',NULL,'UPCOMING','2026-05-18 09:54:35','2026-06-03 15:53:51.797953',0,0),(21,'Ganesh Chaturthi','Festival','2026-09-14','Join us in welcoming Lord Ganesha with devotion and positivity. Experience traditional rituals, festive decor, and a joyful gathering that brings togetherness to our workplace.',NULL,'UPCOMING','2026-05-21 07:34:57',NULL,0,0),(22,'Diwali Celebration','Festival','2025-10-22','Celebrated the festival of lights with decorations, sweets, cultural performances, and joyful moments shared among team members.','/uploads/events/diwali.jpg','PAST','2026-05-21 08:04:55',NULL,0,0),(23,'Dussehra Celebration','Festival','2025-10-02','Team members gathered to celebrate the victory of good over evil with cultural activities and festive traditions.','/uploads/events/dusra10.jpg','PAST','2026-05-21 08:04:55',NULL,0,0),(24,'Republic Day Celebration','Event','2026-01-26','Celebrated Republic Day with patriotic activities, flag hoisting, and team participation honoring the spirit of the nation.','/uploads/events/republic4.jpeg','PAST','2026-05-21 08:04:55','2026-06-10 13:30:13.090148',0,2),(25,'Dussehra','Festival','2026-10-12','Celebrate the triumph of good over evil with a meaningful office gathering. Enjoy cultural activities and symbolic traditions that inspire positivity, growth, and success.',NULL,'UPCOMING','2026-05-21 08:32:38',NULL,0,0),(32,'Diwali','Festival','2026-09-22','Celebrate the festival of lights with colorful decorations, cultural performances, sweets, and joyful moments that spread happiness and positivity across the workplace.',NULL,'UPCOMING','2026-05-25 07:04:17','2026-06-15 13:59:44.382177',0,2),(35,'Christmas','Festival','2026-12-25','Enjoy the Christmas celebration with festive decorations, fun games, gift exchanges, music, and cheerful moments with colleagues and friends.',NULL,'UPCOMING','2026-05-25 10:03:48',NULL,0,0);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_path` varchar(255) DEFAULT NULL,
  `upload_date` datetime(6) DEFAULT NULL,
  `category` enum('CWS_VIDEO','birthday','events','infrastructure','team') DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `large_image_path` varchar(255) DEFAULT NULL,
  `medium_image_path` varchar(255) DEFAULT NULL,
  `small_image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (20,NULL,'2026-06-13 12:26:37.328000','CWS_VIDEO',NULL,'Office Video','/gallery/1781333797306_newvideo.mp4',NULL,NULL),(27,NULL,'2026-06-19 10:32:03.527000','team',NULL,'Team Outing','/gallery/large_1781845321680_pooja9.jpeg','/gallery/medium_1781845321680_pooja9.jpeg','/gallery/small_1781845321680_pooja9.jpeg'),(28,NULL,'2026-06-19 10:32:53.058000','team',NULL,'Team Outing','/gallery/large_1781845371702_pooja5.jpeg','/gallery/medium_1781845371702_pooja5.jpeg','/gallery/small_1781845371702_pooja5.jpeg'),(29,NULL,'2026-06-19 10:33:18.359000','team',NULL,'Team Outing','/gallery/large_1781845397199_pooja10.jpeg','/gallery/medium_1781845397199_pooja10.jpeg','/gallery/small_1781845397199_pooja10.jpeg'),(30,NULL,'2026-06-19 10:33:49.881000','events',NULL,'Dusshera','/gallery/large_1781845424818_dusra6.jpg','/gallery/medium_1781845424818_dusra6.jpg','/gallery/small_1781845424818_dusra6.jpg'),(31,NULL,'2026-06-19 10:34:10.417000','events',NULL,'Dusshera','/gallery/large_1781845446996_dusra2.jpg','/gallery/medium_1781845446996_dusra2.jpg','/gallery/small_1781845446996_dusra2.jpg'),(32,NULL,'2026-06-19 10:34:34.107000','events',NULL,'Dusshera','/gallery/large_1781845470402_dusra10.jpg','/gallery/medium_1781845470402_dusra10.jpg','/gallery/small_1781845470402_dusra10.jpg'),(33,NULL,'2026-06-19 10:35:50.753000','events',NULL,'Diwali Celebration','/gallery/large_1781845546962_diwalinew51.jpg','/gallery/medium_1781845546962_diwalinew51.jpg','/gallery/small_1781845546962_diwalinew51.jpg'),(34,NULL,'2026-06-19 10:36:17.015000','events',NULL,'Diwali Celebration','/gallery/large_1781845571690_diwali91.jpg','/gallery/medium_1781845571690_diwali91.jpg','/gallery/small_1781845571690_diwali91.jpg'),(35,NULL,'2026-06-19 10:36:58.416000','events',NULL,'Diwali Celebration','/gallery/large_1781845610708_admingallery7.png','/gallery/medium_1781845610708_admingallery7.png','/gallery/small_1781845610708_admingallery7.png'),(36,NULL,'2026-06-19 10:38:23.855000','events',NULL,'Republic Day Celebrations','/gallery/large_1781845696548_republic4.jpeg','/gallery/medium_1781845696548_republic4.jpeg','/gallery/small_1781845696548_republic4.jpeg'),(37,NULL,'2026-06-19 10:39:00.786000','events',NULL,'Republic Day Celebrations','/gallery/large_1781845733820_republic1.jpeg','/gallery/medium_1781845733820_republic1.jpeg','/gallery/small_1781845733820_republic1.jpeg'),(38,NULL,'2026-06-19 10:39:30.231000','events',NULL,'Republic Day Celebrations','/gallery/large_1781845763502_republic2.jpeg','/gallery/medium_1781845763502_republic2.jpeg','/gallery/small_1781845763502_republic2.jpeg'),(39,NULL,'2026-06-19 10:40:06.558000','events',NULL,'Gudi Padwa','/gallery/large_1781845805440_padwa13.jpeg','/gallery/medium_1781845805440_padwa13.jpeg','/gallery/small_1781845805440_padwa13.jpeg'),(40,NULL,'2026-06-19 10:40:27.170000','events',NULL,'Gudi Padwa','/gallery/large_1781845825820_padwa006.jpeg','/gallery/medium_1781845825820_padwa006.jpeg','/gallery/small_1781845825820_padwa006.jpeg'),(41,NULL,'2026-06-19 10:40:46.026000','events',NULL,'Gudi Padwa','/gallery/large_1781845845228_gudi.jpeg','/gallery/medium_1781845845228_gudi.jpeg','/gallery/small_1781845845228_gudi.jpeg'),(42,NULL,'2026-06-19 10:41:46.988000','events',NULL,'Makar Sankranti','/gallery/large_1781845905690_sankrant3.jpeg','/gallery/medium_1781845905690_sankrant3.jpeg','/gallery/small_1781845905690_sankrant3.jpeg'),(43,NULL,'2026-06-19 10:42:09.055000','events',NULL,'Makar Sankranti','/gallery/large_1781845927829_sankrant2.jpeg','/gallery/medium_1781845927829_sankrant2.jpeg','/gallery/small_1781845927829_sankrant2.jpeg'),(44,NULL,'2026-06-19 10:42:33.432000','events',NULL,'Makar Sankranti','/gallery/large_1781845952079_sankrant1.jpeg','/gallery/medium_1781845952079_sankrant1.jpeg','/gallery/small_1781845952079_sankrant1.jpeg'),(45,NULL,'2026-06-19 10:43:00.495000','events',NULL,'Holi Celebration','/gallery/large_1781845978818_holicelebration.png','/gallery/medium_1781845978818_holicelebration.png','/gallery/small_1781845978818_holicelebration.png'),(46,NULL,'2026-06-19 10:43:24.436000','events',NULL,'Holi Celebration','/gallery/large_1781846003190_holi4.jpeg','/gallery/medium_1781846003190_holi4.jpeg','/gallery/small_1781846003190_holi4.jpeg'),(47,NULL,'2026-06-19 10:43:53.813000','events',NULL,'Holi Celebration','/gallery/large_1781846026432_holi10.jpeg','/gallery/medium_1781846026432_holi10.jpeg','/gallery/small_1781846026432_holi10.jpeg'),(48,NULL,'2026-06-19 10:44:24.557000','infrastructure',NULL,'Our Office','/gallery/large_1781846063609_officeimg4.png','/gallery/medium_1781846063609_officeimg4.png','/gallery/small_1781846063609_officeimg4.png'),(49,NULL,'2026-06-19 10:44:53.344000','infrastructure',NULL,'Our Office','/gallery/large_1781846093032_officeimg3.jpg','/gallery/medium_1781846093032_officeimg3.jpg','/gallery/small_1781846093032_officeimg3.jpg'),(50,NULL,'2026-06-19 10:46:02.154000','infrastructure',NULL,'Our Office','/gallery/large_1781848996939_admingallery15.jpg','/gallery/medium_1781848996939_admingallery15.jpg','/gallery/small_1781848996939_admingallery15.jpg'),(51,NULL,'2026-06-19 10:46:41.595000','birthday',NULL,'Birthday Celebration','/gallery/large_1781846200469_cake7.jpeg','/gallery/medium_1781846200469_cake7.jpeg','/gallery/small_1781846200469_cake7.jpeg'),(52,NULL,'2026-06-19 10:47:05.414000','birthday',NULL,'Birthday Celebration','/gallery/large_1781846224366_praveen1.jpeg','/gallery/medium_1781846224366_praveen1.jpeg','/gallery/small_1781846224366_praveen1.jpeg'),(53,NULL,'2026-06-19 10:47:38.071000','birthday',NULL,'Birthday Celebration','/gallery/large_1781846252791_birthday1.jpeg','/gallery/medium_1781846252791_birthday1.jpeg','/gallery/small_1781846252791_birthday1.jpeg'),(54,NULL,'2026-06-19 10:48:01.910000','birthday',NULL,'Birthday Celebration','/gallery/large_1781846280978_hrbirthday.jpeg','/gallery/medium_1781846280978_hrbirthday.jpeg','/gallery/small_1781846280978_hrbirthday.jpeg'),(55,NULL,'2026-06-19 10:48:24.402000','birthday',NULL,'Birthday Celebration','/gallery/large_1781846303830_pranavbirthday.jpeg','/gallery/medium_1781846303830_pranavbirthday.jpeg','/gallery/small_1781846303830_pranavbirthday.jpeg'),(56,NULL,'2026-06-19 10:48:53.324000','birthday',NULL,'Birthday Celebration','/gallery/large_1781846326837_birthday2.jpeg','/gallery/medium_1781846326837_birthday2.jpeg','/gallery/small_1781846326837_birthday2.jpeg'),(57,NULL,'2026-06-19 10:49:28.912000','team',NULL,'Team Meetup','/gallery/large_1781846367921_pooja9.jpeg','/gallery/medium_1781846367921_pooja9.jpeg','/gallery/small_1781846367921_pooja9.jpeg'),(58,NULL,'2026-06-19 10:49:47.980000','team',NULL,'Team Meetup','/gallery/large_1781846387167_pooja6.jpeg','/gallery/medium_1781846387167_pooja6.jpeg','/gallery/small_1781846387167_pooja6.jpeg'),(59,NULL,'2026-06-19 10:50:08.964000','team',NULL,'Team Meetup','/gallery/large_1781846407903_pooja5.jpeg','/gallery/medium_1781846407903_pooja5.jpeg','/gallery/small_1781846407903_pooja5.jpeg'),(60,NULL,'2026-06-19 10:50:40.433000','infrastructure',NULL,'Work Environment','/gallery/large_1781846439344_work5.jpg','/gallery/medium_1781846439344_work5.jpg','/gallery/small_1781846439344_work5.jpg'),(61,NULL,'2026-06-19 10:51:00.805000','infrastructure',NULL,'Work Environment','/gallery/large_1781846459520_gallery4.jpg','/gallery/medium_1781846459520_gallery4.jpg','/gallery/small_1781846459520_gallery4.jpg'),(62,NULL,'2026-06-19 10:51:22.932000','infrastructure',NULL,'Work Environment','/gallery/large_1781846481639_gallery3.jpg','/gallery/medium_1781846481639_gallery3.jpg','/gallery/small_1781846481639_gallery3.jpg'),(63,NULL,'2026-06-19 10:52:26.855000','team',NULL,'Our Team','/gallery/large_1781846544390_office.JPG','/gallery/medium_1781846544390_office.JPG','/gallery/small_1781846544390_office.JPG'),(64,NULL,'2026-06-19 10:52:56.041000','team',NULL,'Our Team','/gallery/large_1781849051048_Blogs3.JPG','/gallery/medium_1781849051048_Blogs3.JPG','/gallery/small_1781849051048_Blogs3.JPG'),(65,NULL,'2026-06-19 10:53:17.487000','team',NULL,'Our Team','/gallery/large_1781846595810_gallerytwo.png','/gallery/medium_1781846595810_gallerytwo.png','/gallery/small_1781846595810_gallerytwo.png');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `job_id` bigint NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL,
  `description` text,
  `education` text,
  `experience` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `openings` int DEFAULT NULL,
  `posted_on` date DEFAULT NULL,
  `requirements` text,
  `responsibilities` text,
  `roles` text,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `application_count` int DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `key_skills` text,
  `work_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Design','Design intuitive and engaging user experiences for web and mobile products while collaborating with cross-functional teams.',' Bachelor\'s degree in Graphic Design, UI/UX Design, or related field','0-2 Years',NULL,NULL,'2026-06-17','Experience :  0-2 years of professional experience.\nProficiency in Adobe Creative Suite (Photoshop, Illustrator, InDesign), Sketch, Visual Studio, and Adobe XD\nStrong understanding of typography, color theory, and layout principles\nExperience with responsive design and mobile-first principles\nExcellent communication and teamwork skills\nAbility to work on multiple projects simultaneously and meet deadlines.','Create visually appealing graphics for various digital platforms\nDesign user-friendly interfaces for websites and mobile applications\nDevelop wireframes, prototypes, and mockups to effectively communicate design ideas\nCollaborate with cross-functional teams to ensure designs meet project requirements\nStay updated on industry trends and best practices in graphic design and UI/UX design',NULL,'Active','Ux/Ui Designer','Full-Time',0,'2026-06-30','Figma , Wireframing, Prototyping','WFH'),(2,'Engineering','Build responsive and high-performance web applications using modern frontend technologies.','Bachelor\'s degree in Computer Science, Information Technology, or related field. Relevant certifications in frontend technologies are a plus.','0-2 Years',NULL,NULL,'2026-06-19','xperience: 0-3 years of professional experience.\nStrong knowledge of HTML, CSS, and JavaScript.\nFamiliarity with modern frontend frameworks such as React, Angular, or Vue.js.\nUnderstanding of responsive web design principles.\nKnowledge of version control systems like Git.\nGood problem-solving and debugging skills.','Develop responsive and user-friendly web applications.\nConvert UI/UX designs into functional web pages.\nOptimize applications for maximum speed and scalability.\nCollaborate with backend developers and designers.\nEnsure cross-browser and cross-device compatibility.\nMaintain and improve existing website features.',NULL,'Active','Frontend Developer','Full-Time',0,'2026-06-30','HTML , CSS, JavaScript','WFH'),(3,'Engineering','Develop scalable backend systems, APIs, and integrations to support robust applications.','Bachelor\'s degree in Computer Science, Software Engineering, or related field. Backend development certifications are an added advantage.','0-3 Years',NULL,NULL,'2026-06-19','Experience: 0-3 years of professional experience.\nStrong knowledge of Node.js, Java, Python, or similar backend technologies.\nExperience working with databases such as MySQL, PostgreSQL, or MongoDB.\nUnderstanding of API development and integration.\nKnowledge of authentication and authorization mechanisms.\nFamiliarity with Git and software development best practices.','Design, develop, and maintain server-side applications.\nBuild and manage RESTful APIs and web services.\nOptimize application performance and database queries.\nCollaborate with frontend developers for seamless integration.\nEnsure security, scalability, and reliability of applications.\nTroubleshoot and resolve backend-related issues.',NULL,'Active','Backend Developer','Full-Time',0,'2026-07-24','Node.js, APIs,Database','WFH'),(4,'Marketing','Plan and execute digital marketing campaigns to increase brand visibility and generate leads.','Bachelor\'s degree in Marketing, Business Administration, Communications, or related field. Certifications in Digital Marketing, SEO, or Google Ads are preferred.','0-3 Years',NULL,NULL,'2026-06-19','Experience: 0-3 years of professional experience.\nKnowledge of SEO, SEM, and social media marketing.\nFamiliarity with Google Analytics and digital marketing tools.\nStrong communication and content creation skills.\nBasic understanding of email marketing campaigns.\nAnalytical mindset with attention to detail.','Plan and execute digital marketing campaigns.\nManage social media platforms and online advertising.\nCreate engaging content for websites and social channels.\nMonitor campaign performance and generate reports.\nConduct keyword research and SEO optimization.\nAnalyze market trends and competitor activities.',NULL,'Active','Digital Marketing Executive ','Full-Time',0,'2026-08-21','SEO, Social Media, Campaigns','WFH'),(5,'Analystics','Build responsive and high-performance web applications using modern frontend technologies and database integrations.','Bachelor\'s degree in Data Science, Statistics, Mathematics, Computer Science, or related field. Certifications in Data Analytics or Business Intelligence are a plus.','0-3 Years',NULL,NULL,'2026-06-19','Experience: 0-3 years of professional experience.\nStrong knowledge of Excel, SQL, and data analysis techniques.\nFamiliarity with Power BI, Tableau, or similar visualization tools.\nBasic understanding of statistics and data modeling.\nExcellent analytical and problem-solving skills.\nAbility to interpret and communicate data insights effectively.','Collect, clean, and analyze large datasets.\nCreate reports, dashboards, and visualizations.\nIdentify trends and insights to support business decisions.\nCollaborate with teams to understand data requirements.\nEnsure data accuracy and consistency.\nPresent findings and recommendations to stakeholders.',NULL,'Active','Data Analyst','Full-Time',0,'2026-08-29','HTML, CSS, Database','WFH');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
INSERT INTO `password_reset_tokens` VALUES (4,'dipalikshirsagar0607@gmail.com','fc8d0e8f-6729-4aa9-aba2-87157d45a6dc','2026-05-04 07:40:16',0,'2026-05-04 07:10:17'),(5,'dipali@creativewebsolution.in','3ca3a18d-8d79-43c1-9987-633605ca3484','2026-06-17 09:35:25',0,'2026-06-17 09:05:25');
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_contribution`
--

DROP TABLE IF EXISTS `social_contribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_contribution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `page_link` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK4c4kkpa6psranxuqu3jtqp8ip` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_contribution`
--

LOCK TABLES `social_contribution` WRITE;
/*!40000 ALTER TABLE `social_contribution` DISABLE KEYS */;
INSERT INTO `social_contribution` VALUES (17,'Our animal welfare initiatives focus on supporting stray animals, promoting awareness about animal care, and responsible treatment of animals.','/uploads/1781850463581_karma Foundation.png','http://127.0.0.1:5501/frontend/karma-foundation.html','Karma foundation'),(26,'We organized a local park cleanup to support environmental sustainability and awareness.','/uploads/1781843431252_1 (1).png','http://127.0.0.1:5501/frontend/environmental-clean-up.html','Environmental cleanup');
/*!40000 ALTER TABLE `social_contribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_gallery`
--

DROP TABLE IF EXISTS `social_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_gallery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKcd64us85d6byaiulbhnhtxqiv` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_gallery`
--

LOCK TABLES `social_gallery` WRITE;
/*!40000 ALTER TABLE `social_gallery` DISABLE KEYS */;
INSERT INTO `social_gallery` VALUES (5,'/uploads/1780464444963_2 (2).png','Group Discussion'),(16,'/uploads/1781843300988_1 (4).png','Social Service1'),(17,'/uploads/1781843314017_1 (1).png','Social Service2'),(18,'/uploads/1781843332061_AW3.png','Social Service3'),(19,'/uploads/1781843380297_socialservice6.png','Social Service4');
/*!40000 ALTER TABLE `social_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_career_form`
--

DROP TABLE IF EXISTS `user_career_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_career_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `job_id` bigint DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `resume_file_name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_career_form`
--

LOCK TABLES `user_career_form` WRITE;
/*!40000 ALTER TABLE `user_career_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_career_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dipali Kshirsagar','dipali@creativewebsolution.in','Admin@1234',NULL,'SUPER_ADMIN','2026-04-06 12:55:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_visitors` int DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,155,NULL,'2026-06-19 12:29:58.189060');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-19 12:34:10
