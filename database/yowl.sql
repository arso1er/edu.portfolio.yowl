-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: yowl
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'www.google.com','Google',5,'Excellent search engine','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',6,'2022-01-10 18:44:22','2022-01-10 18:44:22'),(2,'www.yahoo.com','Yahoo',3,'Just average','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',6,'2022-01-10 18:46:23','2022-01-10 18:46:23'),(3,'www.amazon.com','Amazon',5,'The best','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',6,'2022-01-10 18:51:50','2022-01-10 18:51:50'),(4,'stackoverflow.com','Stack Overflow',5,'I love it','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',6,'2022-01-10 18:53:33','2022-01-10 18:53:33'),(5,'www.namecheap.com','Namecheap',4,'Very good service','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',6,'2022-01-10 18:55:13','2022-01-10 18:55:13'),(6,'www.digitalocean.com','DigitalOcean',4,'Good VPS provider','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',6,'2022-01-10 18:56:17','2022-01-10 18:56:17'),(7,'www.yahoo.com','Yahoo',2,'Could be better','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',5,'2022-01-10 18:58:25','2022-01-10 18:58:25'),(8,'www.amazon.com','Amazon',4,'Will use again','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',4,'2022-01-10 19:02:06','2022-01-10 19:02:06'),(9,'stackoverflow.com','Stack Overflow',5,'Life saver','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',3,'2022-01-10 19:03:07','2022-01-10 19:03:07'),(10,'www.namecheap.com','Namecheap',4,'Reliable','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',2,'2022-01-10 19:05:58','2022-01-10 19:05:58'),(11,'www.digitalocean.com','DigitalOcean',3,'Just OK','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id massa ut nunc mattis feugiat vitae nec libero. Vivamus gravida dictum tempor. Donec ac rutrum ex, nec suscipit dui. Nunc egestas efficitur eros eget finibus. Vestibulum consequat elementum dapibus. In gravida odio vel enim dapibus, quis convallis diam hendrerit. Nunc malesuada lorem ut sapien vulputate, non maximus nisi maximus. Curabitur eget nibh ultrices leo suscipit fermentum. Mauris placerat ex vitae orci egestas ultrices. Vestibulum ac nisl interdum, scelerisque arcu eget, aliquam libero. Nulla id nisi lacus. Aenean vitae metus urna. Proin et ligula eu nunc tincidunt commodo. Aliquam rutrum est vitae mi feugiat malesuada.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis orci erat, facilisis eget nisi nec, fermentum tincidunt eros. Vestibulum dapibus consectetur lectus, vel volutpat orci aliquam nec. Vestibulum ut sollicitudin risus, a maximus ante. Nunc bibendum eros sed accumsan molestie. Nulla volutpat at neque ut consectetur. Nulla facilisi. Donec neque enim, bibendum quis diam quis, pretium placerat magna. Vestibulum ullamcorper dolor ac tempus vehicula. Fusce sit amet risus lobortis, tempor mi eu, eleifend nunc. In dictum velit eu leo vestibulum consequat.</p>',1,'2022-01-10 19:09:08','2022-01-10 19:09:08');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2021_12_24_155821_create_comments_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (11,'App\\Models\\User',1,'mytokenkey','dda2dc9533eb490c6db19d22227e136698a6625f4ac1d9100c515797bbbde6bd','[\"*\"]','2022-01-10 19:09:08','2022-01-10 19:07:54','2022-01-10 19:09:08');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Oliver','oliver@gmail.com',NULL,'$2y$10$6JsU0Zzpv8mMUZFIGw7Dwup9PvrvM54bh3AydKLoAa500LdfZks1y','oliver','user','/images/users/user-1641843246.jpg',NULL,'2022-01-10 18:34:06','2022-01-10 18:34:06'),(2,'Jillian','jillian@gmail.com',NULL,'$2y$10$Cgn4NNmuACDaJU4snwj0aOWY9Nh45aLcHJ8JXEoWLwQUw6XtFLyV2','jillian','user','/images/users/user-1641843308.jpg',NULL,'2022-01-10 18:35:08','2022-01-10 18:35:08'),(3,'Elena','elena@gmail.com',NULL,'$2y$10$Wiz3WJI/thm.DHaL9/aU3uBLiTPQc1KdVN9369e.DEGSjYzBPDMty','elena','user','/images/users/user-1641843363.jpg',NULL,'2022-01-10 18:36:03','2022-01-10 18:36:03'),(4,'Abraham','abraham@gmail.com',NULL,'$2y$10$0lAQZ6s14ost1HQmg0ZA9eyN25xBnjJvBxXkdNl/jvoJGNetPpwy2','abraham','user','/images/users/user-1641843402.jpg',NULL,'2022-01-10 18:36:42','2022-01-10 18:36:42'),(5,'Yasmine','yasmine@gmail.com',NULL,'$2y$10$j.YW3VG.HmGPF61/kCAW6OQgL7gpkbIyXh92ejqpaIiOQqNbZiSUS','yasmine','user','/images/users/user-1641843450.jpg',NULL,'2022-01-10 18:37:30','2022-01-10 18:37:30'),(6,'Kimberly','kimberly@gmail.com',NULL,'$2y$10$MWwd4UKn9rd0G397oQmsWe1hr1m/rr2e4maUgZm3nRDKFSef5VHGe','kimberly','user','/images/users/user-1641843484.jpg',NULL,'2022-01-10 18:38:04','2022-01-10 18:38:04');
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

-- Dump completed on 2022-01-10 21:20:50
