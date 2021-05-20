-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: test_bench
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data_entity_action_insert`
--

DROP TABLE IF EXISTS `data_entity_action_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_entity_action_insert` (
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `entity_action_type_id` int(10) unsigned NOT NULL,
  `entity_action_desc` varchar(1000) NOT NULL,
  `entity_action_data` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`entity_entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_action_insert`
--

LOCK TABLES `data_entity_action_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_action_insert` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_entity_action_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_entity_action_insert_AFTER_INSERT` AFTER INSERT ON `data_entity_action_insert` FOR EACH ROW BEGIN
	 CALL create_entity_action(
		NEW.entity_id, 
        NEW.entity_entity_id, 
		NEW.entity_action_type_id,
		NEW.entity_action_desc, 
		NEW.entity_action_data);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_entity_insert`
--

DROP TABLE IF EXISTS `data_entity_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_entity_insert` (
  `id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_name` varchar(45) NOT NULL,
  `entity_type_name` varchar(45) NOT NULL,
  `entity_desc` text,
  `creation_type` enum('AUTO','MAN') NOT NULL,
  `should_have_tool_tip` varchar(5) NOT NULL,
  `tool_tip_text` varchar(250) DEFAULT NULL,
  `new_version_category` enum('MAJOR','MINOR','BUILD') NOT NULL,
  `entity_parent_id` int(10) unsigned NOT NULL COMMENT 'id	entity_test_id	entity_test_name	entity_id	created_by_employee_id	entity_test_parent	description	initial_value	expected_value	received_value	insert_value	failure_halts_test	test_category_primary	test_category_secondary	test_created\n',
  `entity_parent_entity_id` int(10) unsigned NOT NULL COMMENT 'id	entity_test_id	entity_test_name	entity_id	created_by_employee_id	entity_test_parent	description	initial_value	expected_value	received_value	insert_value	failure_halts_test	test_category_primary	test_category_secondary	test_created\n',
  `endl` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_id`,`entity_name`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entityParentId INT UNSIGNED,\n    IN entityParentEntityId INT UNSIGNED,\n    ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_insert`
--

LOCK TABLES `data_entity_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_insert` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_entity_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_entity_insert_AFTER_INSERT` AFTER INSERT ON `data_entity_insert` FOR EACH ROW BEGIN
	CALL create_new_entity(
		NEW.id,
		NEW.entity_id, 
        NEW.entity_name, 
        NEW.entity_type_name, 
        NEW.entity_desc, 
        NEW.creation_type, 
        NEW.entity_parent_id, 
        NEW.entity_parent_entity_id, 
        NEW.should_have_tool_tip,
        NEW.tool_tip_text,
        NEW.new_version_category);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_entity_test_insert`
--

DROP TABLE IF EXISTS `data_entity_test_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_entity_test_insert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_test_row_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_name` varchar(200) NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `created_by_employee_id` varchar(45) NOT NULL,
  `entity_test_parent_row_id` int(10) unsigned DEFAULT NULL,
  `entity_test_parent_id` int(10) unsigned DEFAULT NULL,
  `description` text,
  `test_function` varchar(250) NOT NULL COMMENT 'Value at the start of the test',
  `data_in` text COMMENT 'Expected value at the end of the test',
  `data_out` text COMMENT 'Value from another source',
  `data_expected` text COMMENT 'Value at the start of the test',
  `failure_halts_test` tinyint(4) NOT NULL DEFAULT '0',
  `test_category_primary` varchar(45) NOT NULL,
  `test_category_secondary` varchar(45) DEFAULT NULL,
  `test_created` date NOT NULL,
  `endl` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_test_row_id`,`entity_test_id`,`entity_test_name`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`),
  UNIQUE KEY `entity_test_id_UNIQUE` (`entity_test_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_test_row_id_UNIQUE` (`entity_test_row_id`),
  KEY `fk_entity_test_employee1_idx` (`created_by_employee_id`),
  CONSTRAINT `fk_entity_test_employee10` FOREIGN KEY (`created_by_employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_entity_test_insert`
--

LOCK TABLES `data_entity_test_insert` WRITE;
/*!40000 ALTER TABLE `data_entity_test_insert` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_entity_test_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_entity_test_insert_AFTER_INSERT` AFTER INSERT ON `data_entity_test_insert` FOR EACH ROW BEGIN
	CALL `create_new_entity_test_case`(		
		NEW.entity_test_row_id, 
		NEW.entity_test_id, 
        NEW.entity_id, 
        NEW.entity_entity_id,
        NEW.entity_test_name,
		NEW.created_by_employee_id, 
        NEW.`description`, 
        NEW.test_function, 
        NEW.data_in, 
        NEW.data_out, 
        NEW.data_expected, 
		NEW.failure_halts_test,          
        NEW.test_category_primary, 
        NEW.test_category_secondary,
        NEW.test_created, 
        'MAJOR',
        NEW.entity_test_parent_row_id,
        NEW.entity_test_parent_id,
        NULL, NULL);        
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_test_suite_insert`
--

DROP TABLE IF EXISTS `data_test_suite_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_test_suite_insert` (
  `row_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL COMMENT 'row_id	test_suite_id	test_suite_name	test_suite_parent_row_id	test_suite_parent_id	category_type_name	endl\n\n',
  `test_suite_name` varchar(45) NOT NULL,
  `test_suite_parent_row_id` int(10) unsigned DEFAULT NULL,
  `test_suite_parent_id` int(10) unsigned DEFAULT NULL,
  `test_suite_notes` text,
  `category_type_name` varchar(500) NOT NULL,
  `endl` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_test_suite_insert`
--

LOCK TABLES `data_test_suite_insert` WRITE;
/*!40000 ALTER TABLE `data_test_suite_insert` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_test_suite_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_test_suite_insert_AFTER_INSERT` AFTER INSERT ON `data_test_suite_insert` FOR EACH ROW BEGIN
	CALL create_new_test_suite(
			NEW.row_id, 
            NEW.test_suite_id, 
			NEW.test_suite_name, 
            NEW.test_suite_notes, 
			NEW.test_suite_parent_row_id, 
            NEW.test_suite_parent_id, 
			'MAJOR');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `data_version_to_do`
--

DROP TABLE IF EXISTS `data_version_to_do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_version_to_do` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `todo_desc` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_version_to_do`
--

LOCK TABLES `data_version_to_do` WRITE;
/*!40000 ALTER TABLE `data_version_to_do` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_version_to_do` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `data_version_to_do_AFTER_INSERT` AFTER INSERT ON `data_version_to_do` FOR EACH ROW BEGIN
	CALL create_entity_todo(NEW.entity_id, NEW.todo_desc);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `element` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_row_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `employee_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`employee_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_email_employee_idx` (`employee_id`),
  CONSTRAINT `fk_email_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'sbrown@dakarsoftware.com','','SB_1\r');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `employee_type_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_employee_employee_type1_idx` (`employee_type_id`),
  CONSTRAINT `fk_employee_employee_type1` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('SB_1','Steve','Brown','1\r');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_type`
--

DROP TABLE IF EXISTS `employee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_type` (
  `id` varchar(10) NOT NULL,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_type`
--

LOCK TABLES `employee_type` WRITE;
/*!40000 ALTER TABLE `employee_type` DISABLE KEYS */;
INSERT INTO `employee_type` VALUES ('1','QA\r'),('2','Developer\r');
/*!40000 ALTER TABLE `employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_name` varchar(100) NOT NULL,
  `entity_details_id` int(10) unsigned DEFAULT NULL,
  `entity_type_id` int(10) unsigned NOT NULL,
  `entity_type_entity_type_name` varchar(45) NOT NULL COMMENT 'The entiry''s parent.\nZero = no parent',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `parent_entity_id` int(10) unsigned DEFAULT NULL,
  `entity_help_id` int(10) unsigned DEFAULT NULL,
  `is_element` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_entity_type_details1_idx` (`entity_details_id`,`id`),
  KEY `fk_entity_entity_type1_idx` (`entity_type_id`,`entity_type_entity_type_name`),
  KEY `fk_entity_entity3_idx` (`entity_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_entity4_idx` (`entity_id`),
  KEY `fk_entity_entity1_idx` (`parent_id`,`parent_entity_id`),
  KEY `fk_entity_entity_help1_idx` (`entity_help_id`,`id`),
  CONSTRAINT `fk_entity_entity1` FOREIGN KEY (`parent_id`, `parent_entity_id`) REFERENCES `entity` (`id`, `entity_id`),
  CONSTRAINT `fk_entity_entity_help1` FOREIGN KEY (`entity_help_id`, `id`) REFERENCES `entity_help` (`id`, `entity_id`),
  CONSTRAINT `fk_entity_entity_type1` FOREIGN KEY (`entity_type_id`, `entity_type_entity_type_name`) REFERENCES `entity_type` (`id`, `entity_type_name`),
  CONSTRAINT `fk_entity_entity_type_details1` FOREIGN KEY (`entity_details_id`, `id`) REFERENCES `entity_details` (`id`, `entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity`
--

LOCK TABLES `entity` WRITE;
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_action`
--

DROP TABLE IF EXISTS `entity_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_action_desc` varchar(1000) NOT NULL,
  `entity_action_function` varchar(250) NOT NULL,
  `entity_action_data_in` text COMMENT 'Any data the entity might need, i.e. user name.',
  `entity_action_data_out` text COMMENT 'Any data the entity might need, i.e. user name.',
  `entity_action_data_expected` text COMMENT 'Any data the entity might need, i.e. user name.',
  `entity_action_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`),
  KEY `fk_entity_action_entity_action_type1_idx` (`entity_action_type_id`),
  CONSTRAINT `fk_entity_action_entity_action_type1` FOREIGN KEY (`entity_action_type_id`) REFERENCES `entity_action_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_action`
--

LOCK TABLES `entity_action` WRITE;
/*!40000 ALTER TABLE `entity_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_action_type`
--

DROP TABLE IF EXISTS `entity_action_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_action_type` (
  `id` int(10) unsigned NOT NULL,
  `entity_action_type_parent_id` int(10) unsigned NOT NULL,
  `entity_action_type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`entity_action_type_parent_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_action_type_entity_action_type1_idx` (`entity_action_type_parent_id`),
  CONSTRAINT `fk_entity_action_type_entity_action_type1` FOREIGN KEY (`entity_action_type_parent_id`) REFERENCES `entity_action_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_action_type`
--

LOCK TABLES `entity_action_type` WRITE;
/*!40000 ALTER TABLE `entity_action_type` DISABLE KEYS */;
INSERT INTO `entity_action_type` VALUES (1,1,'Click\r'),(2,2,'Data In\r'),(3,3,'Data Out\r'),(4,4,'Data InOut\r'),(5,5,'Function\r'),(6,6,'Select\r'),(7,7,'Info\r'),(8,8,'Container\r');
/*!40000 ALTER TABLE `entity_action_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_can_have_action`
--

DROP TABLE IF EXISTS `entity_can_have_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_can_have_action` (
  `entity_action_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_action_id`,`entity_id`,`entity_entity_id`),
  UNIQUE KEY `entity_id_version_action_id` (`entity_action_id`),
  KEY `fk_entity_can_have_action_entity1_idx` (`entity_id`,`entity_entity_id`),
  CONSTRAINT `fk_entity_can_have_action_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_has_entity_action_entity_action1` FOREIGN KEY (`entity_action_id`, `entity_id`) REFERENCES `entity_action` (`id`, `entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_can_have_action`
--

LOCK TABLES `entity_can_have_action` WRITE;
/*!40000 ALTER TABLE `entity_can_have_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_can_have_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_details`
--

DROP TABLE IF EXISTS `entity_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `description` text,
  `date_added` date NOT NULL,
  `creation_type` enum('AUTO','MAN') NOT NULL DEFAULT 'MAN' COMMENT 'AUTO: The test was not in the DB when run from the TestBench (TB) so the TB added it to this DB.\nMAN: The test was added to this DB before it was run in the TB.\n\nNote: the name of the test case should match that in the TB or another TC will be added.',
  `last_tested_date` date DEFAULT NULL,
  `last_tested_time` time DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_details`
--

LOCK TABLES `entity_details` WRITE;
/*!40000 ALTER TABLE `entity_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entity_details_BEFORE_INSERT` BEFORE INSERT ON `entity_details` FOR EACH ROW BEGIN
	SET NEW.date_added = now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entity_has_element`
--

DROP TABLE IF EXISTS `entity_has_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_has_element` (
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_id`,`entity_entity_id`,`element_id`),
  KEY `fk_entity_has_element_element1_idx` (`element_id`),
  KEY `fk_entity_has_element_entity1_idx` (`entity_id`,`entity_entity_id`),
  CONSTRAINT `fk_entity_has_element_element1` FOREIGN KEY (`element_id`) REFERENCES `element` (`id`),
  CONSTRAINT `fk_entity_has_element_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_has_element`
--

LOCK TABLES `entity_has_element` WRITE;
/*!40000 ALTER TABLE `entity_has_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_has_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_has_version`
--

DROP TABLE IF EXISTS `entity_has_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_has_version` (
  `version_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`entity_id`,`entity_entity_id`),
  KEY `fk_entity_has_version_version1_idx` (`version_id`),
  KEY `fk_entity_has_version_entity1_idx` (`entity_id`,`entity_entity_id`),
  CONSTRAINT `fk_entity_has_version_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`),
  CONSTRAINT `fk_entity_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_has_version`
--

LOCK TABLES `entity_has_version` WRITE;
/*!40000 ALTER TABLE `entity_has_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_has_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_help`
--

DROP TABLE IF EXISTS `entity_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_help` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `has_tool_tip` varchar(5) NOT NULL DEFAULT 'FALSE',
  `tool_tip_text` varchar(500) DEFAULT NULL,
  `help_file_name` varchar(250) DEFAULT NULL,
  `help_text` text,
  PRIMARY KEY (`id`,`entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_id_UNIQUE` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_help`
--

LOCK TABLES `entity_help` WRITE;
/*!40000 ALTER TABLE `entity_help` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_help` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `entity_help_AFTER_INSERT` AFTER INSERT ON `entity_help` FOR EACH ROW BEGIN
	UPDATE entity SET entity_help_id = NEW.id WHERE id = NEW.entity_Id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entity_test`
--

DROP TABLE IF EXISTS `entity_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `entity_test_name` varchar(200) NOT NULL,
  `description` text,
  `created_on` date NOT NULL,
  `test_function` varchar(250) NOT NULL COMMENT 'Value at the start of the test',
  `data_in` varchar(1000) DEFAULT NULL COMMENT 'Expected value at the end of the test',
  `data_out` varchar(1000) DEFAULT NULL COMMENT 'Value from another source',
  `data_expected` varchar(1000) DEFAULT NULL,
  `failure_halts_test` tinyint(4) NOT NULL DEFAULT '0',
  `created_by_employee_id` varchar(45) NOT NULL,
  `last_run_date` date DEFAULT NULL,
  `last_run_time` time DEFAULT NULL,
  `parent_test_row_id` int(10) unsigned DEFAULT NULL,
  `parent_test_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_test_id`,`entity_id`,`entity_entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_test_employee1_idx` (`created_by_employee_id`),
  KEY `fk_entity_test_entity_test2_idx` (`entity_test_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_test_result_entity_test1_idx` (`entity_test_id`) /*!80000 INVISIBLE */,
  KEY `fk_entity_test_has_one_or_more_categories1_idx` (`entity_test_id`),
  KEY `fk_test_suite_has_entity_test1_idx` (`entity_test_id`),
  KEY `fk_entity_test_has_version_entity_test1_idx` (`entity_test_id`),
  KEY `fk_entity_test_entity1_idx` (`entity_id`,`entity_entity_id`),
  KEY `fk_entity_test_entity_test1_idx` (`parent_test_row_id`,`parent_test_id`),
  CONSTRAINT `fk_entity_test_employee1` FOREIGN KEY (`created_by_employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_test_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_entity_test_entity_test1` FOREIGN KEY (`parent_test_row_id`, `parent_test_id`) REFERENCES `entity_test` (`id`, `entity_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test`
--

LOCK TABLES `entity_test` WRITE;
/*!40000 ALTER TABLE `entity_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_category`
--

DROP TABLE IF EXISTS `entity_test_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_test_category_name` varchar(45) NOT NULL,
  `entity_test_category_description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_category`
--

LOCK TABLES `entity_test_category` WRITE;
/*!40000 ALTER TABLE `entity_test_category` DISABLE KEYS */;
INSERT INTO `entity_test_category` VALUES (1,'None','No test category\r'),(2,'App','Overall test for the app\r'),(3,'Group App Functions','A group of app functions eg a module\r'),(4,'Group Module Functions','A group of functions for a module\r'),(5,'Group Data','An entity that groups related data\r'),(6,'Group Controls','An entity that groups controls\r'),(7,'Redirect','An entity that redirects the user eg button\r'),(8,'Info','An entity that supplies information eg info bar\r'),(9,'Display Image','Displays an image\r'),(10,'Data In/Out','Has data in and out eg text box\r'),(11,'Data In','Has data in eg text box\r'),(12,'Data Out','Has data out eg label\r'),(13,'Display Child','Displays a child form/pop up form etc\r'),(14,'Perform Function','The entity does something\r');
/*!40000 ALTER TABLE `entity_test_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_has_one_or_more_test_categories`
--

DROP TABLE IF EXISTS `entity_test_has_one_or_more_test_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_has_one_or_more_test_categories` (
  `entity_test_category_id` int(10) unsigned NOT NULL,
  `category_level` tinyint(4) NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entity_test_category_id`,`entity_test_id`,`entity_test_entity_test_id`),
  KEY `fk_entity_test_has_entity_test_category_entity_test_categor_idx` (`entity_test_category_id`),
  KEY `fk_entity_test_has_one_or_more_test_categories_entity_test1_idx` (`entity_test_id`,`entity_test_entity_test_id`),
  CONSTRAINT `fk_entity_test_has_entity_test_category_entity_test_category1` FOREIGN KEY (`entity_test_category_id`) REFERENCES `entity_test_category` (`id`),
  CONSTRAINT `fk_entity_test_has_one_or_more_test_categories_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_entity_test_id`) REFERENCES `entity_test` (`id`, `entity_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_has_one_or_more_test_categories`
--

LOCK TABLES `entity_test_has_one_or_more_test_categories` WRITE;
/*!40000 ALTER TABLE `entity_test_has_one_or_more_test_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_test_has_one_or_more_test_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_has_version`
--

DROP TABLE IF EXISTS `entity_test_has_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_has_version` (
  `version_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`entity_test_id`,`entity_test_entity_test_id`),
  KEY `fk_entity_test_has_version_version1_idx` (`version_id`),
  KEY `fk_entity_test_has_version_entity_test1_idx` (`entity_test_id`,`entity_test_entity_test_id`),
  CONSTRAINT `fk_entity_test_has_version_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_entity_test_id`) REFERENCES `entity_test` (`id`, `entity_test_id`),
  CONSTRAINT `fk_entity_test_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_has_version`
--

LOCK TABLES `entity_test_has_version` WRITE;
/*!40000 ALTER TABLE `entity_test_has_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_test_has_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_test_result`
--

DROP TABLE IF EXISTS `entity_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_test_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `result_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_passed` enum('Pass','Fail','NR') DEFAULT NULL,
  `test_ignored` enum('TRUE','FALSE') NOT NULL,
  `comments` text,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_id` int(10) unsigned NOT NULL,
  `entity_test_entity_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`entity_test_id`,`entity_test_entity_test_id`,`entity_test_entity_id`,`entity_test_entity_entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_test_result_entity_test1_idx` (`entity_test_id`,`entity_test_entity_test_id`,`entity_test_entity_id`,`entity_test_entity_entity_id`),
  CONSTRAINT `fk_entity_test_result_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_entity_test_id`, `entity_test_entity_id`, `entity_test_entity_entity_id`) REFERENCES `entity_test` (`id`, `entity_test_id`, `entity_id`, `entity_entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_test_result`
--

LOCK TABLES `entity_test_result` WRITE;
/*!40000 ALTER TABLE `entity_test_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_todo`
--

DROP TABLE IF EXISTS `entity_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_todo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_entity_id` int(10) unsigned NOT NULL,
  `when_was_todo_added` date NOT NULL,
  `todo_desc` varchar(1000) NOT NULL,
  `is_todo_done` tinyint(4) DEFAULT '0',
  `when_was_todo_done` date DEFAULT NULL,
  PRIMARY KEY (`id`,`entity_id`,`entity_entity_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_entity_todo_entity1_idx` (`entity_id`,`entity_entity_id`),
  CONSTRAINT `fk_entity_todo_entity1` FOREIGN KEY (`entity_id`, `entity_entity_id`) REFERENCES `entity` (`id`, `entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_todo`
--

LOCK TABLES `entity_todo` WRITE;
/*!40000 ALTER TABLE `entity_todo` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_type`
--

DROP TABLE IF EXISTS `entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entity_type` (
  `id` int(10) unsigned NOT NULL,
  `entity_type_name` varchar(45) NOT NULL,
  `entity_type_parent_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`entity_type_name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `entity_name_UNIQUE` (`entity_type_name`),
  KEY `fk_entity_type_entity_type1_idx` (`entity_type_parent_id`),
  CONSTRAINT `fk_entity_type_entity_type1` FOREIGN KEY (`entity_type_parent_id`) REFERENCES `entity_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_type`
--

LOCK TABLES `entity_type` WRITE;
/*!40000 ALTER TABLE `entity_type` DISABLE KEYS */;
INSERT INTO `entity_type` VALUES (1,'Root',1),(2,'Application',1),(26,'Function',1),(33,'Text',1),(35,'Container',1),(38,'FaFa',1),(3,'Module',2),(6,'Form',2),(4,'Module Category',3),(5,'Module Sub-Category',4),(7,'Popup Form',6),(8,'Parent Form',6),(9,'Child Form',6),(10,'Nav Bar',6),(11,'Info Bar',6),(12,'Grid',6),(13,'Image',6),(14,'Control',6),(27,' Titlebar',6),(28,' Header 1',6),(29,' Header 2',6),(30,' Header 3',6),(31,' Header 4',6),(32,' Header 5',6),(34,'Paragraph',6),(36,'Accordion',6),(15,'List',14),(16,'Tab',14),(17,'Text Out',14),(18,'Text In',14),(19,'Text In/Out',14),(20,'Combo',14),(21,'Label',14),(22,'Button',14),(23,'Button - Redirect',21),(24,'Button - Display',21),(25,'Button - Function',21),(37,'Accordion Key',36);
/*!40000 ALTER TABLE `entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_test_result`
--

DROP TABLE IF EXISTS `import_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `import_test_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '	has_tool_tip	tool_tip_text	initial_value	expected_value	received_value	insert_value	failure_halts_test	run_by	pass_fail_or_not_run	fail_severity	fail_reason	test_complete_notes\n',
  `test_run_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_parent` int(10) unsigned NOT NULL,
  `entity_test_version_id` int(10) unsigned NOT NULL,
  `entity_test_version_num` varchar(11) DEFAULT NULL,
  `entity_test_name` varchar(100) NOT NULL,
  `entity_test_description` text,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_name` varchar(100) NOT NULL,
  `entity_type_name` varchar(45) NOT NULL,
  `entity_description` text,
  `entity_last_tested_date` date DEFAULT NULL,
  `entity_last_tested_time` time DEFAULT NULL,
  `has_tool_tip` enum('TRUE','FALSE') NOT NULL,
  `tool_tip_text` varchar(500) DEFAULT NULL,
  `initial_value` varchar(1000) DEFAULT NULL,
  `expected_value` varchar(1000) DEFAULT NULL,
  `received_value` varchar(1000) DEFAULT NULL,
  `insert_value` varchar(1000) DEFAULT NULL,
  `failure_halts_test` tinyint(4) DEFAULT NULL,
  `run_by` varchar(45) NOT NULL,
  `pass_fail_or_not_run` enum('Pass','Fail','NR') NOT NULL DEFAULT 'NR',
  `fail_severity` enum('1','2','3','4','5') DEFAULT NULL,
  `fail_reason` varchar(45) DEFAULT NULL,
  `test_complete_notes` text,
  `endl` varchar(4) NOT NULL,
  PRIMARY KEY (`id`,`test_run_id`,`test_suite_id`,`entity_test_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_test_result`
--

LOCK TABLES `import_test_result` WRITE;
/*!40000 ALTER TABLE `import_test_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_test_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `import_test_result_AFTER_INSERT` AFTER INSERT ON `import_test_result` FOR EACH ROW BEGIN
	/*SET @IMPORT_TEST_RUN_ID_RESULT = NEW.test_run_id;
    SET @IMPORT_TEST_RUN_BY_EMP_ID = NEW.run_by;
	CALL add_test_case_result(
		NEW.pass_fail_or_not_run,
		NEW.test_complete_notes,
		NEW.entity_test_version_id,
		NEW.entity_test_id,
		NEW.entity_id);*/
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `test_insert_has_parent`
--

DROP TABLE IF EXISTS `test_insert_has_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_insert_has_parent` (
  `entity_test_id` int(10) unsigned NOT NULL,
  `parent_test_id` int(10) unsigned NOT NULL,
  `parent_test_version_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_test_id`,`parent_test_id`),
  UNIQUE KEY `entity_test_id_UNIQUE` (`entity_test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_insert_has_parent`
--

LOCK TABLES `test_insert_has_parent` WRITE;
/*!40000 ALTER TABLE `test_insert_has_parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_insert_has_parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run`
--

DROP TABLE IF EXISTS `test_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_run` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_run_name` varchar(100) NOT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run`
--

LOCK TABLES `test_run` WRITE;
/*!40000 ALTER TABLE `test_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run_has_test_suite`
--

DROP TABLE IF EXISTS `test_run_has_test_suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_run_has_test_suite` (
  `test_suite_id` int(10) unsigned NOT NULL,
  `test_suite_row_id` int(10) unsigned NOT NULL,
  `test_run_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`test_suite_id`,`test_suite_row_id`,`test_run_id`),
  UNIQUE KEY `test_run_id_suite_id_ver_num_UNIQUE` (`test_run_id`,`test_suite_id`,`test_suite_row_id`),
  KEY `fk_test_run_has_test_suite_test_run1_idx` (`test_run_id`),
  KEY `fk_test_run_has_test_suite_test_suite1` (`test_suite_row_id`,`test_suite_id`),
  CONSTRAINT `fk_test_run_has_test_suite_test_run1` FOREIGN KEY (`test_run_id`) REFERENCES `test_run` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_test_run_has_test_suite_test_suite1` FOREIGN KEY (`test_suite_row_id`, `test_suite_id`) REFERENCES `test_suite` (`id`, `test_suite_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run_has_test_suite`
--

LOCK TABLES `test_run_has_test_suite` WRITE;
/*!40000 ALTER TABLE `test_run_has_test_suite` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_run_has_test_suite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_run_result`
--

DROP TABLE IF EXISTS `test_run_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_run_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_run_id` int(10) unsigned NOT NULL,
  `test_run_run_by_employee_id` varchar(45) NOT NULL,
  `result_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `number_test_cases_run` mediumint(9) NOT NULL,
  `number_failures` mediumint(9) NOT NULL,
  `number_passed` mediumint(9) NOT NULL,
  `number_ignored` mediumint(9) NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`,`test_run_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_run_result_test_run1_idx` (`test_run_id`),
  KEY `fk_test_run_result_employee1_idx` (`test_run_run_by_employee_id`),
  CONSTRAINT `fk_test_run_result_employee1` FOREIGN KEY (`test_run_run_by_employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_test_run_result_test_run1` FOREIGN KEY (`test_run_id`) REFERENCES `test_run` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_run_result`
--

LOCK TABLES `test_run_result` WRITE;
/*!40000 ALTER TABLE `test_run_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_run_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite`
--

DROP TABLE IF EXISTS `test_suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_suite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_suite_id` int(10) unsigned NOT NULL,
  `test_suite_name` varchar(100) DEFAULT NULL,
  `test_suite_notes` text,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `parent_test_suite_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`test_suite_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_suite_test_suite2_idx` (`test_suite_id`) /*!80000 INVISIBLE */,
  KEY `fk_test_suite_test_suite3_idx` (`test_suite_id`),
  KEY `fk_test_suite_test_suite1_idx` (`parent_id`,`parent_test_suite_id`),
  CONSTRAINT `fk_test_suite_test_suite1` FOREIGN KEY (`parent_id`, `parent_test_suite_id`) REFERENCES `test_suite` (`id`, `test_suite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite`
--

LOCK TABLES `test_suite` WRITE;
/*!40000 ALTER TABLE `test_suite` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_suite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite_has_entity_test`
--

DROP TABLE IF EXISTS `test_suite_has_entity_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_suite_has_entity_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_suite_row_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_test_id` int(10) unsigned NOT NULL,
  `entity_test_entity_id` int(10) unsigned NOT NULL,
  `entity_test_entity_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_test_suite_has_entity_test_entity_test1_idx` (`entity_test_id`,`entity_test_entity_test_id`,`entity_test_entity_id`,`entity_test_entity_entity_id`),
  KEY `fk_test_suite_has_entity_test_test_suite1` (`test_suite_row_id`,`test_suite_id`),
  CONSTRAINT `fk_test_suite_has_entity_test_entity_test1` FOREIGN KEY (`entity_test_id`, `entity_test_entity_test_id`, `entity_test_entity_id`, `entity_test_entity_entity_id`) REFERENCES `entity_test` (`id`, `entity_test_id`, `entity_id`, `entity_entity_id`),
  CONSTRAINT `fk_test_suite_has_entity_test_test_suite1` FOREIGN KEY (`test_suite_row_id`, `test_suite_id`) REFERENCES `test_suite` (`id`, `test_suite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite_has_entity_test`
--

LOCK TABLES `test_suite_has_entity_test` WRITE;
/*!40000 ALTER TABLE `test_suite_has_entity_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_suite_has_entity_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite_has_version`
--

DROP TABLE IF EXISTS `test_suite_has_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_suite_has_version` (
  `version_id` int(10) unsigned NOT NULL,
  `test_suite_id` int(10) unsigned NOT NULL,
  `test_suite_test_suite_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`version_id`,`test_suite_id`,`test_suite_test_suite_id`),
  KEY `fk_test_suite_has_version_version1_idx` (`version_id`),
  KEY `fk_test_suite_has_version_test_suite1_idx` (`test_suite_id`,`test_suite_test_suite_id`),
  CONSTRAINT `fk_test_suite_has_version_test_suite1` FOREIGN KEY (`test_suite_id`, `test_suite_test_suite_id`) REFERENCES `test_suite` (`id`, `test_suite_id`),
  CONSTRAINT `fk_test_suite_has_version_version1` FOREIGN KEY (`version_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite_has_version`
--

LOCK TABLES `test_suite_has_version` WRITE;
/*!40000 ALTER TABLE `test_suite_has_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_suite_has_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(200) NOT NULL COMMENT 'Either the test name of the entity name',
  `version_note` text NOT NULL,
  `version_type` enum('ENTITY','TEST','TEST_SUITE') NOT NULL,
  `major` smallint(6) NOT NULL DEFAULT '1',
  `minor` smallint(6) NOT NULL DEFAULT '0',
  `build` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20  9:59:11
