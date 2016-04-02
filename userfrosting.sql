-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `uf_configuration`
--

DROP TABLE IF EXISTS `uf_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_configuration`
--

LOCK TABLES `uf_configuration` WRITE;
/*!40000 ALTER TABLE `uf_configuration` DISABLE KEYS */;
INSERT INTO `uf_configuration` VALUES (1,'website_name','BuyT'),(2,'website_url','localhost/UserFrosting-master/'),(3,'email','nilay@buyt.in'),(4,'activation','1'),(5,'resend_activation_threshold','0'),(6,'language','models/languages/en.php'),(8,'can_register','1'),(9,'new_user_title','New Member'),(11,'email_login','0'),(12,'token_timeout','10800'),(13,'version','0.2.2');
/*!40000 ALTER TABLE `uf_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_filelist`
--

DROP TABLE IF EXISTS `uf_filelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_filelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_filelist`
--

LOCK TABLES `uf_filelist` WRITE;
/*!40000 ALTER TABLE `uf_filelist` DISABLE KEYS */;
INSERT INTO `uf_filelist` VALUES (1,'account'),(2,'forms');
/*!40000 ALTER TABLE `uf_filelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_group_action_permits`
--

DROP TABLE IF EXISTS `uf_group_action_permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_group_action_permits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `permits` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_group_action_permits`
--

LOCK TABLES `uf_group_action_permits` WRITE;
/*!40000 ALTER TABLE `uf_group_action_permits` DISABLE KEYS */;
INSERT INTO `uf_group_action_permits` VALUES (1,1,'updateUserEmail','isLoggedInUser(user_id)'),(2,1,'updateUserPassword','isLoggedInUser(user_id)'),(3,1,'loadUser','isLoggedInUser(user_id)'),(4,1,'loadUserGroups','isLoggedInUser(user_id)'),(5,2,'updateUserEmail','always()'),(6,2,'updateUserPassword','always()'),(7,2,'updateUser','always()'),(8,2,'updateUserDisplayName','always()'),(9,2,'updateUserTitle','always()'),(10,2,'updateUserEnabled','always()'),(11,2,'loadUser','always()'),(12,2,'loadUserGroups','always()'),(13,2,'loadUsers','always()'),(14,2,'deleteUser','always()'),(15,2,'activateUser','always()'),(16,2,'loadGroups','always()');
/*!40000 ALTER TABLE `uf_group_action_permits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_group_page_matches`
--

DROP TABLE IF EXISTS `uf_group_page_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_group_page_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_group_page_matches`
--

LOCK TABLES `uf_group_page_matches` WRITE;
/*!40000 ALTER TABLE `uf_group_page_matches` DISABLE KEYS */;
INSERT INTO `uf_group_page_matches` VALUES (1,1,1),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(19,1,3),(21,1,6),(22,1,13),(23,1,15),(24,1,4);
/*!40000 ALTER TABLE `uf_group_page_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_groups`
--

DROP TABLE IF EXISTS `uf_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `home_page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_groups`
--

LOCK TABLES `uf_groups` WRITE;
/*!40000 ALTER TABLE `uf_groups` DISABLE KEYS */;
INSERT INTO `uf_groups` VALUES (1,'User',2,0,4),(2,'Administrator',0,0,5);
/*!40000 ALTER TABLE `uf_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_nav`
--

DROP TABLE IF EXISTS `uf_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(75) NOT NULL,
  `page` varchar(175) NOT NULL,
  `name` varchar(150) NOT NULL,
  `position` int(11) NOT NULL,
  `class_name` varchar(150) NOT NULL,
  `icon` varchar(150) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_nav`
--

LOCK TABLES `uf_nav` WRITE;
/*!40000 ALTER TABLE `uf_nav` DISABLE KEYS */;
INSERT INTO `uf_nav` VALUES (1,'left','account/dashboard_admin.php','Admin Dashboard',1,'dashboard-admin','fa fa-dashboard',0),(2,'left','account/users.php','Users',2,'users','fa fa-users',0),(3,'left','account/dashboard.php','Dashboard',3,'dashboard','fa fa-dashboard',0),(4,'left','account/account_settings.php','Account Settings',4,'settings','fa fa-gear',0),(5,'left-sub','#','Site Settings',5,'','fa fa-wrench',0),(6,'left-sub','account/site_settings.php','Site Configuration',6,'site-settings','fa fa-globe',5),(7,'left-sub','account/groups.php','Groups',7,'groups','fa fa-users',5),(8,'left-sub','account/site_authorization.php','Authorization',8,'site-pages','fa fa-key',5),(9,'top-main-sub','#','#USERNAME#',1,'site-settings','fa fa-user',0),(10,'top-main-sub','account/account_settings.php','Account Settings',1,'','fa fa-gear',9),(11,'top-main-sub','account/logout.php','Log Out',2,'','fa fa-power-off',9),(12,'left','account/form.php','User Form',9,'user_form','FontAwesome',0),(13,'left-sub','#','Edit Publishers',9,'edit-publishers','FontAwesome',0),(14,'left-sub','account/form_admin.php','Insert',10,'render-publisher','FontAwesome',18),(15,'left-sub','account/admin_insert.php','Edit Publisher',11,'edit-publisher','FontAwesome',13),(16,'left-sub','account/delete_form.php','Delete Publisher',12,'delete-publisher','FontAwesome',13),(18,'left-sub','#','Render Publisher',14,'render-publisher','FontAwesome',0),(19,'left-sub','account/update_form.php','Update',14,'update','FontAwesome',18),(20,'left','account/update_render_user.php','Update Render Publisher',15,'update-render-publisher','FontAwesome',0);
/*!40000 ALTER TABLE `uf_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_nav_group_matches`
--

DROP TABLE IF EXISTS `uf_nav_group_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_nav_group_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_nav_group_matches`
--

LOCK TABLES `uf_nav_group_matches` WRITE;
/*!40000 ALTER TABLE `uf_nav_group_matches` DISABLE KEYS */;
INSERT INTO `uf_nav_group_matches` VALUES (1,3,1),(2,4,1),(3,9,1),(4,10,1),(5,11,1),(6,1,2),(7,2,2),(8,5,2),(9,6,2),(10,7,2),(11,8,2),(12,12,1),(13,13,2),(14,14,2),(15,15,2),(16,16,2),(17,17,2),(18,18,2),(19,19,2),(20,20,1);
/*!40000 ALTER TABLE `uf_nav_group_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_pages`
--

DROP TABLE IF EXISTS `uf_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(150) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_pages`
--

LOCK TABLES `uf_pages` WRITE;
/*!40000 ALTER TABLE `uf_pages` DISABLE KEYS */;
INSERT INTO `uf_pages` VALUES (1,'forms/table_users.php',1),(3,'account/logout.php',1),(4,'account/dashboard.php',1),(5,'account/dashboard_admin.php',1),(6,'account/account_settings.php',1),(7,'account/site_authorization.php',1),(8,'account/site_settings.php',1),(9,'account/users.php',1),(10,'account/user_details.php',1),(11,'account/index.php',0),(12,'account/groups.php',1),(13,'forms/form_user.php',1),(14,'forms/form_group.php',1),(15,'forms/form_confirm_delete.php',1),(16,'forms/form_action_permits.php',1),(17,'account/404.php',0),(18,'account/admin_crud.php',0),(19,'account/admin_insert.php',1),(20,'account/crud.php',0),(21,'account/dashcopy.php',0),(22,'account/form.php',0),(23,'account/form2.php',0),(24,'account/form_admin.php',1),(25,'account/insert.php',0),(26,'account/render_insert.php',1),(27,'account/try.php',0),(28,'account/delete_form.php',0),(29,'account/formcopy.php',0),(30,'account/help.php',0),(31,'account/widget.php',0),(32,'account/ajax.php',0),(33,'account/dashboardAjax.php',0),(34,'account/delete.php',0),(35,'account/hello.php',0),(36,'account/processAjax.php',0),(37,'account/test.php',0),(38,'account/updateAjax.php',0),(39,'account/update_form.php',1),(40,'account/update_render_user.php',0);
/*!40000 ALTER TABLE `uf_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_plugin_configuration`
--

DROP TABLE IF EXISTS `uf_plugin_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_plugin_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `value` varchar(150) NOT NULL,
  `binary` int(1) NOT NULL,
  `variable` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_plugin_configuration`
--

LOCK TABLES `uf_plugin_configuration` WRITE;
/*!40000 ALTER TABLE `uf_plugin_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `uf_plugin_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_user_action_permits`
--

DROP TABLE IF EXISTS `uf_user_action_permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_user_action_permits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `permits` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_user_action_permits`
--

LOCK TABLES `uf_user_action_permits` WRITE;
/*!40000 ALTER TABLE `uf_user_action_permits` DISABLE KEYS */;
/*!40000 ALTER TABLE `uf_user_action_permits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_user_group_matches`
--

DROP TABLE IF EXISTS `uf_user_group_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_user_group_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_user_group_matches`
--

LOCK TABLES `uf_user_group_matches` WRITE;
/*!40000 ALTER TABLE `uf_user_group_matches` DISABLE KEYS */;
INSERT INTO `uf_user_group_matches` VALUES (1,1,1),(2,1,2),(3,2,1),(4,3,1),(5,4,1);
/*!40000 ALTER TABLE `uf_user_group_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf_users`
--

DROP TABLE IF EXISTS `uf_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(150) NOT NULL,
  `activation_token` varchar(225) NOT NULL,
  `last_activation_request` int(11) NOT NULL,
  `lost_password_request` tinyint(1) NOT NULL,
  `lost_password_timestamp` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(150) NOT NULL,
  `sign_up_stamp` int(11) NOT NULL,
  `last_sign_in_stamp` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Specifies if the account is enabled.  Disabled accounts cannot be logged in to, but they retain all of their data and settings.',
  `primary_group_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Specifies the primary group for the user.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf_users`
--

LOCK TABLES `uf_users` WRITE;
/*!40000 ALTER TABLE `uf_users` DISABLE KEYS */;
INSERT INTO `uf_users` VALUES (1,'adminuser','adminuser','$2y$10$q1SDuMMv2Ds8zOdzP71i7.khzSYYs//pnApcsNMMJzgInD57XiUDu','nilay@buyt.in','b9254d12fa5e4c49eac4daf3ff564668',1433402585,0,1433402585,1,'Master Account',1433402585,1435914859,1,2),(2,'nilay','nilay','$2y$10$mNr8baJSvjful4wF4XTvKuxdkogp9inzGYOttaBh5uwgVstpirtsG','nilayjain13@gmail.com','2b54dc4dee27b8b0332a6e12af20614e',1433478018,0,1433478018,1,'New Member',1433478018,1435905864,1,1),(3,'vaibhav','vaibhav','$2y$10$iRzwpUOH1BW9c8rpVFpczepn0kRCQ2fNv38Y2ZPr2R3ldvKa8HDJO','manveer@buyt.in','70d93d78b91e9df210d16d6e34935101',1434545288,0,1434545288,1,'New Member',1434545288,0,1,1),(4,'default','default','$2y$10$sG/Y4mwC0lAlpCDSG0RCqOJHfIHu9dJNm1E.YkIl4FjZgi7Tm3e66','vaibhav@buyt.in','2ab6fa3f9692d7009da3b1673de2685e',1434961091,0,1434961091,1,'New Member',1434961091,1434961190,1,1);
/*!40000 ALTER TABLE `uf_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-03 16:06:27
