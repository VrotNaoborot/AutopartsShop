-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: autoparts_shop
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Атрибут',7,'add_attribute'),(26,'Can change Атрибут',7,'change_attribute'),(27,'Can delete Атрибут',7,'delete_attribute'),(28,'Can view Атрибут',7,'view_attribute'),(29,'Can add Бренд авто',8,'add_brand'),(30,'Can change Бренд авто',8,'change_brand'),(31,'Can delete Бренд авто',8,'delete_brand'),(32,'Can view Бренд авто',8,'view_brand'),(33,'Can add Категория',9,'add_category'),(34,'Can change Категория',9,'change_category'),(35,'Can delete Категория',9,'delete_category'),(36,'Can view Категория',9,'view_category'),(37,'Can add Производитель',10,'add_manufacture'),(38,'Can change Производитель',10,'change_manufacture'),(39,'Can delete Производитель',10,'delete_manufacture'),(40,'Can view Производитель',10,'view_manufacture'),(41,'Can add Модель авто',11,'add_modelproduct'),(42,'Can change Модель авто',11,'change_modelproduct'),(43,'Can delete Модель авто',11,'delete_modelproduct'),(44,'Can view Модель авто',11,'view_modelproduct'),(45,'Can add Подкатегория',12,'add_subcategories'),(46,'Can change Подкатегория',12,'change_subcategories'),(47,'Can delete Подкатегория',12,'delete_subcategories'),(48,'Can view Подкатегория',12,'view_subcategories'),(49,'Can add Товар',13,'add_product'),(50,'Can change Товар',13,'change_product'),(51,'Can delete Товар',13,'delete_product'),(52,'Can view Товар',13,'view_product'),(53,'Can add cart item',14,'add_cartitem'),(54,'Can change cart item',14,'change_cartitem'),(55,'Can delete cart item',14,'delete_cartitem'),(56,'Can view cart item',14,'view_cartitem'),(57,'Can add cart',15,'add_cart'),(58,'Can change cart',15,'change_cart'),(59,'Can delete cart',15,'delete_cart'),(60,'Can view cart',15,'view_cart'),(61,'Can add model auto',16,'add_modelauto'),(62,'Can change model auto',16,'change_modelauto'),(63,'Can delete model auto',16,'delete_modelauto'),(64,'Can view model auto',16,'view_modelauto');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$0CiynIdA6CnxQBg0EmrcZa$+kkJzmNRjZQok8wy2aUszBCvncSJ53ml/fYvt7ESZ6c=','2024-12-13 13:09:36.192642',1,'Panu','','','123@gmail.com',1,1,'2024-12-13 13:09:15.299655');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-12-13 13:11:50.302269','1','MotorBw China',1,'[{\"added\": {}}]',10,1),(2,'2024-12-13 13:12:27.372919','2','MotorBw China',1,'[{\"added\": {}}]',10,1),(3,'2024-12-13 13:13:10.448076','1','Мотор',1,'[{\"added\": {}}]',9,1),(4,'2024-12-13 13:13:25.055525','1','Масло моторное',1,'[{\"added\": {}}]',12,1),(5,'2024-12-13 13:14:20.868624','2','Масло моторное',1,'[{\"added\": {}}]',12,1),(6,'2024-12-13 13:15:20.720758','3','Масло моторное',1,'[{\"added\": {}}]',12,1),(7,'2024-12-13 13:15:40.251575','4','Масло моторное',1,'[{\"added\": {}}]',12,1),(8,'2024-12-13 13:16:47.573572','1','Объем 5 л',1,'[{\"added\": {}}]',7,1),(9,'2024-12-13 13:17:50.590456','2','Объем 5 л',1,'[{\"added\": {}}]',7,1),(10,'2024-12-13 13:31:24.274418','3','Объем 5 л',1,'[{\"added\": {}}]',7,1),(11,'2024-12-13 13:35:41.072122','1','MotorBw China',3,'',10,1),(12,'2024-12-13 13:40:44.024916','2','Объем 5 л',3,'',7,1),(13,'2024-12-13 13:40:44.024916','1','Объем 5 л',3,'',7,1),(14,'2024-12-13 13:42:38.500342','1','Масло моторное 5W-40',1,'[{\"added\": {}}]',13,1),(15,'2024-12-14 18:52:23.325414','1','Audi',1,'[{\"added\": {}}]',8,1),(16,'2024-12-14 18:52:28.294234','2','BAIC',1,'[{\"added\": {}}]',8,1),(17,'2024-12-14 18:52:36.829410','3','BMW',1,'[{\"added\": {}}]',8,1),(18,'2024-12-14 18:52:47.807523','4','Cadillac',1,'[{\"added\": {}}]',8,1),(19,'2024-12-14 19:37:06.432332','1','A1',1,'[{\"added\": {}}]',16,1),(20,'2024-12-14 19:43:40.996333','1','Масло моторное 5W-40',2,'[]',13,1),(21,'2024-12-15 12:07:20.338391','4','Объем 1 л.',1,'[{\"added\": {}}]',7,1),(22,'2024-12-15 12:10:10.480901','2','Тормозная жидкость Lukoil',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'shop','attribute'),(8,'shop','brand'),(15,'shop','cart'),(14,'shop','cartitem'),(9,'shop','category'),(10,'shop','manufacture'),(16,'shop','modelauto'),(11,'shop','modelproduct'),(13,'shop','product'),(12,'shop','subcategories');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-13 13:06:49.279753'),(2,'auth','0001_initial','2024-12-13 13:06:49.580014'),(3,'admin','0001_initial','2024-12-13 13:06:49.661799'),(4,'admin','0002_logentry_remove_auto_add','2024-12-13 13:06:49.666689'),(5,'admin','0003_logentry_add_action_flag_choices','2024-12-13 13:06:49.671828'),(6,'contenttypes','0002_remove_content_type_name','2024-12-13 13:06:49.716835'),(7,'auth','0002_alter_permission_name_max_length','2024-12-13 13:06:49.750878'),(8,'auth','0003_alter_user_email_max_length','2024-12-13 13:06:49.767663'),(9,'auth','0004_alter_user_username_opts','2024-12-13 13:06:49.772147'),(10,'auth','0005_alter_user_last_login_null','2024-12-13 13:06:49.805179'),(11,'auth','0006_require_contenttypes_0002','2024-12-13 13:06:49.806180'),(12,'auth','0007_alter_validators_add_error_messages','2024-12-13 13:06:49.811181'),(13,'auth','0008_alter_user_username_max_length','2024-12-13 13:06:49.869693'),(14,'auth','0009_alter_user_last_name_max_length','2024-12-13 13:06:49.906293'),(15,'auth','0010_alter_group_name_max_length','2024-12-13 13:06:49.920209'),(16,'auth','0011_update_proxy_permissions','2024-12-13 13:06:49.925210'),(17,'auth','0012_alter_user_first_name_max_length','2024-12-13 13:06:49.963011'),(18,'sessions','0001_initial','2024-12-13 13:06:49.983182'),(19,'shop','0001_initial','2024-12-13 13:06:50.302786'),(20,'shop','0002_cart_cartitem','2024-12-13 17:51:24.116451'),(21,'shop','0003_modelauto','2024-12-14 19:29:38.501987'),(22,'shop','0004_alter_product_model_alter_modelauto_options_and_more','2024-12-14 19:42:02.000153');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('qbyp28mlsbzi4nnc9jz2kkutpegk44mn','.eJxVjLsOAiEURP-F2hCeApb2fsPmwoCsGkj2URn_3d1kC810c87Mmw20LnVY5zwNI9iFSXb67SKlZ247wIPavfPU2zKNke8KP-jMbx35dT3cv4NKc93WGgFFGBe0FVuA6CxBGCWRkWyIysIk75V30sDpcwlFS1mko2xBxD5f1xQ31A:1tM5QG:qKNdWfDoOKqbm0Kf1IIahTULMm5NbL5ylio7HQXjYOc','2024-12-27 13:09:36.200809');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_attribute`
--

DROP TABLE IF EXISTS `shop_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_attribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_attribute`
--

LOCK TABLES `shop_attribute` WRITE;
/*!40000 ALTER TABLE `shop_attribute` DISABLE KEYS */;
INSERT INTO `shop_attribute` VALUES (3,'Объем','5','л'),(4,'Объем','1','л.');
/*!40000 ALTER TABLE `shop_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_brand`
--

DROP TABLE IF EXISTS `shop_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_brand`
--

LOCK TABLES `shop_brand` WRITE;
/*!40000 ALTER TABLE `shop_brand` DISABLE KEYS */;
INSERT INTO `shop_brand` VALUES (1,'Audi'),(2,'BAIC'),(3,'BMW'),(4,'Cadillac'),(5,'Changan'),(6,'Chery'),(7,'Chevrolet'),(8,'Citroen'),(9,'Daewoo'),(10,'Exeed'),(11,'FAW'),(12,'Ford'),(13,'Geely'),(14,'Haval'),(15,'Honda'),(16,'Hyundai'),(17,'Infiniti'),(18,'JAC'),(19,'Jaguar'),(20,'Jeep'),(21,'Jetour'),(22,'Jetta'),(23,'Kaiyi'),(24,'Kia'),(25,'Land Rover'),(26,'Lexus'),(27,'Livan'),(28,'Lixiang'),(29,'Mazda'),(30,'Mercedes'),(31,'Mitsubishi'),(32,'Nissan'),(33,'Omada'),(34,'Opel'),(35,'Peugeot'),(36,'Porsche'),(37,'Renault'),(38,'Skoda'),(39,'Subaru'),(40,'Suzuki'),(41,'Tank'),(42,'Toyota'),(43,'Volkswagen'),(44,'Volvo'),(45,'Voyah'),(46,'ВАЗ'),(47,'ГАЗ'),(48,'Москвич'),(49,'УАЗ');
/*!40000 ALTER TABLE `shop_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cart`
--

DROP TABLE IF EXISTS `shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `shop_cart_user_id_27925ac6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart`
--

LOCK TABLES `shop_cart` WRITE;
/*!40000 ALTER TABLE `shop_cart` DISABLE KEYS */;
INSERT INTO `shop_cart` VALUES (1,'2024-12-13 18:07:37.544986',1);
/*!40000 ALTER TABLE `shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cartitem`
--

DROP TABLE IF EXISTS `shop_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_cartitem_cart_id_6bf1447e_fk_shop_cart_id` (`cart_id`),
  KEY `shop_cartitem_product_id_09e4b7dd_fk_shop_product_id` (`product_id`),
  CONSTRAINT `shop_cartitem_cart_id_6bf1447e_fk_shop_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `shop_cart` (`id`),
  CONSTRAINT `shop_cartitem_product_id_09e4b7dd_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`),
  CONSTRAINT `shop_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cartitem`
--

LOCK TABLES `shop_cartitem` WRITE;
/*!40000 ALTER TABLE `shop_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (1,'Мотор'),(2,'Тормозная система'),(3,'Трансмиссия'),(4,'Автокосметика'),(5,'Охлаждающие жидкости');
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_manufacture`
--

DROP TABLE IF EXISTS `shop_manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_manufacture` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_manufacture`
--

LOCK TABLES `shop_manufacture` WRITE;
/*!40000 ALTER TABLE `shop_manufacture` DISABLE KEYS */;
INSERT INTO `shop_manufacture` VALUES (2,'MotorBw','China');
/*!40000 ALTER TABLE `shop_manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_modelauto`
--

DROP TABLE IF EXISTS `shop_modelauto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_modelauto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brand_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_modelauto_brand_id_929d1b8f_fk_shop_brand_id` (`brand_id`),
  CONSTRAINT `shop_modelauto_brand_id_929d1b8f_fk_shop_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `shop_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_modelauto`
--

LOCK TABLES `shop_modelauto` WRITE;
/*!40000 ALTER TABLE `shop_modelauto` DISABLE KEYS */;
INSERT INTO `shop_modelauto` VALUES (1,'A1',1);
/*!40000 ALTER TABLE `shop_modelauto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `article` varchar(25) NOT NULL,
  `img1` varchar(100) NOT NULL,
  `img2` varchar(100) NOT NULL,
  `img3` varchar(100) NOT NULL,
  `img4` varchar(100) NOT NULL,
  `img5` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `type_product` varchar(50) NOT NULL,
  `price` int NOT NULL,
  `weight` int NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `manufacture_id` bigint NOT NULL,
  `model_id` bigint DEFAULT NULL,
  `subcategory_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_brand_id_505fec11_fk_shop_brand_id` (`brand_id`),
  KEY `shop_product_manufacture_id_58b72ca3_fk_shop_manufacture_id` (`manufacture_id`),
  KEY `shop_product_subcategory_id_38960212_fk_shop_subcategories_id` (`subcategory_id`),
  KEY `shop_product_model_id_c63c5e93_fk_shop_modelauto_id` (`model_id`),
  CONSTRAINT `shop_product_brand_id_505fec11_fk_shop_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `shop_brand` (`id`),
  CONSTRAINT `shop_product_manufacture_id_58b72ca3_fk_shop_manufacture_id` FOREIGN KEY (`manufacture_id`) REFERENCES `shop_manufacture` (`id`),
  CONSTRAINT `shop_product_model_id_c63c5e93_fk_shop_modelauto_id` FOREIGN KEY (`model_id`) REFERENCES `shop_modelauto` (`id`),
  CONSTRAINT `shop_product_subcategory_id_38960212_fk_shop_subcategories_id` FOREIGN KEY (`subcategory_id`) REFERENCES `shop_subcategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,'334422','1_SgcT1Hz.jpeg','1_HszzgvB.jpeg','1_Vywxd0i.jpeg','1_YfCqb4h.jpeg','1_IANlMiu.jpeg','Масло моторное 5W-40','parts',2500,1800,'3',NULL,2,NULL,1),(2,'511235','1_rrLlvx4.jpg','2_A8rIptD.jpg','1_wXmS4Em.jpg','2_58EKozC.jpg','1_yAgfdkK.jpg','Тормозная жидкость Lukoil','parts',900,900,NULL,NULL,2,NULL,2);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_attributes`
--

DROP TABLE IF EXISTS `shop_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_attributes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `attribute_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_product_attributes_product_id_attribute_id_5e77db1e_uniq` (`product_id`,`attribute_id`),
  KEY `shop_product_attribu_attribute_id_13ee8965_fk_shop_attr` (`attribute_id`),
  CONSTRAINT `shop_product_attribu_attribute_id_13ee8965_fk_shop_attr` FOREIGN KEY (`attribute_id`) REFERENCES `shop_attribute` (`id`),
  CONSTRAINT `shop_product_attributes_product_id_f50c210c_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_attributes`
--

LOCK TABLES `shop_product_attributes` WRITE;
/*!40000 ALTER TABLE `shop_product_attributes` DISABLE KEYS */;
INSERT INTO `shop_product_attributes` VALUES (1,1,3),(2,2,4);
/*!40000 ALTER TABLE `shop_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_subcategories`
--

DROP TABLE IF EXISTS `shop_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_subcategories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_subcategories_category_id_25a646aa_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_subcategories_category_id_25a646aa_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_subcategories`
--

LOCK TABLES `shop_subcategories` WRITE;
/*!40000 ALTER TABLE `shop_subcategories` DISABLE KEYS */;
INSERT INTO `shop_subcategories` VALUES (1,'Масло моторное',1),(2,'Тормозные жидкости',2),(3,'Трансмисионные масла',3),(4,'Комплекты сцепления',3),(5,'Шампуни и пены',4),(6,'Жидкости для омытеля стекла',4);
/*!40000 ALTER TABLE `shop_subcategories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 16:38:47
