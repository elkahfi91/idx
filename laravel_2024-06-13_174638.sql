-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: laravel
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB

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
-- Table structure for table `adjusted_products`
--

DROP TABLE IF EXISTS `adjusted_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjusted_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adjusted_products_adjustment_id_foreign` (`adjustment_id`),
  KEY `adjusted_products_product_id_foreign` (`product_id`),
  CONSTRAINT `adjusted_products_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `adjusted_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjusted_products`
--

/*!40000 ALTER TABLE `adjusted_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjusted_products` ENABLE KEYS */;

--
-- Table structure for table `adjustments`
--

DROP TABLE IF EXISTS `adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustments`
--

/*!40000 ALTER TABLE `adjustments` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjustments` ENABLE KEYS */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(192) NOT NULL,
  `description` varchar(192) DEFAULT NULL,
  `image` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

--
-- Table structure for table `cash_registers`
--

DROP TABLE IF EXISTS `cash_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_registers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_registers_user_id_foreign` (`user_id`),
  KEY `cash_registers_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `cash_registers_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_registers`
--

/*!40000 ALTER TABLE `cash_registers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_registers` ENABLE KEYS */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'23TVd','Electronics',NULL,'2024-06-13 17:40:51','2024-06-13 17:40:51');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `thousand_separator` varchar(255) NOT NULL DEFAULT ',',
  `decimal_separator` varchar(255) NOT NULL DEFAULT '.',
  `exchange_rate` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES
(1,'Dirham Marocain','MAD','DH',',','.',NULL,'2024-06-13 17:40:54','2024-06-13 17:40:54');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(192) NOT NULL,
  `phone` varchar(192) NOT NULL,
  `email` varchar(192) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `tax_number` varchar(192) DEFAULT NULL,
  `wallet_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_wallet_id_foreign` (`wallet_id`),
  CONSTRAINT `customers_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES
(1,'John Doe','212600000000','customer@email.com ','Casablanca','Morocco','Casablanca, Morocco',NULL,NULL,'2024-06-13 17:40:51','2024-06-13 17:40:51');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `reference` varchar(192) NOT NULL,
  `details` varchar(192) DEFAULT NULL,
  `amount` double NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_category_id_foreign` (`category_id`),
  KEY `expenses_user_id_foreign` (`user_id`),
  KEY `expenses_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `expenses_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rtl` varchar(255) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES
(1,'English','en','0','1',0,NULL,NULL),
(2,'Arabic','ar','0','1',0,NULL,NULL),
(3,'French','fr','0','1',1,NULL,NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2021_01_14_192129_create_permission_tables',1),
(6,'2021_03_08_020247_create_brands_table',1),
(7,'2021_03_08_020247_create_role_user_table',1),
(8,'2021_03_08_020247_create_warehouses_table',1),
(9,'2021_07_14_145038_create_categories_table',1),
(10,'2021_07_14_145047_create_products_table',1),
(11,'2021_07_16_010005_create_uploads_table',1),
(12,'2021_07_22_003941_create_adjustments_table',1),
(13,'2021_07_22_004043_create_adjusted_products_table',1),
(14,'2021_07_28_192608_create_expense_categories_table',1),
(15,'2021_07_28_192616_create_expenses_table',1),
(16,'2021_07_29_165419_create_customers_table',1),
(17,'2021_07_29_165440_create_suppliers_table',1),
(18,'2021_07_31_015923_create_currencies_table',1),
(19,'2021_07_31_140531_create_settings_table',1),
(20,'2021_07_31_201003_create_sales_table',1),
(21,'2021_07_31_212446_create_sale_details_table',1),
(22,'2021_08_07_192203_create_sale_payments_table',1),
(23,'2021_08_08_021108_create_purchases_table',1),
(24,'2021_08_08_021131_create_purchase_payments_table',1),
(25,'2021_08_08_021713_create_purchase_details_table',1),
(26,'2021_08_08_175345_create_sale_returns_table',1),
(27,'2021_08_08_175358_create_sale_return_details_table',1),
(28,'2021_08_08_175406_create_sale_return_payments_table',1),
(29,'2021_08_08_222603_create_purchase_returns_table',1),
(30,'2021_08_08_222612_create_purchase_return_details_table',1),
(31,'2021_08_08_222646_create_purchase_return_payments_table',1),
(32,'2021_08_16_015031_create_quotations_table',1),
(33,'2021_08_16_155013_create_quotation_details_table',1),
(34,'2022_03_08_020247_create_product_warehouse_table',1),
(35,'2022_04_06_155633_create_user_warehouse_table',1),
(36,'2022_10_03_150306_create_languages_table',1),
(37,'2022_10_04_011149_create_media_table',1),
(38,'2022_10_08_000000_create_wallets_table',1),
(39,'2022_10_09_211033_create_sessions_table',1),
(40,'2022_11_09_180555_create_printers_table',1),
(41,'2022_11_22_132743_create_cash_registers_table',1),
(42,'2022_12_01_113333_add_online_stores_settings_table',1),
(43,'2022_12_16_153636_add_wallet_id_to_customer_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `connection_type` enum('network','windows','linux') NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') NOT NULL DEFAULT 'default',
  `char_per_line` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;

--
-- Table structure for table `product_warehouse`
--

DROP TABLE IF EXISTS `product_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_warehouse` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_warehouse_product_id_foreign` (`product_id`),
  KEY `product_warehouse_warehouse_id_foreign` (`warehouse_id`),
  CONSTRAINT `product_warehouse_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_warehouse_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_warehouse`
--

/*!40000 ALTER TABLE `product_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_warehouse` ENABLE KEYS */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `barcode_symbology` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `stock_alert` int(11) NOT NULL,
  `order_tax` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `tax_type` tinyint(4) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_code_unique` (`code`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_warehouse_id_foreign` (`warehouse_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,1,NULL,NULL,'iPhone 12','SwpRI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(2,1,NULL,NULL,'iPhone 12','yi3HC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(3,1,NULL,NULL,'iPhone 12','SVlGo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(4,1,NULL,NULL,'iPhone 12','9WwRI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(5,1,NULL,NULL,'iPhone 12','KdcWp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(6,1,NULL,NULL,'iPhone 12','COvGo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(7,1,NULL,NULL,'iPhone 12','lLlCh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(8,1,NULL,NULL,'iPhone 12','7z249','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(9,1,NULL,NULL,'iPhone 12','kYUoT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(10,1,NULL,NULL,'iPhone 12','SfrVR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(11,1,NULL,NULL,'iPhone 12','q2mtb','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(12,1,NULL,NULL,'iPhone 12','kueqU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(13,1,NULL,NULL,'iPhone 12','kAUPJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(14,1,NULL,NULL,'iPhone 12','td7oN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(15,1,NULL,NULL,'iPhone 12','YDrFo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(16,1,NULL,NULL,'iPhone 12','sAmJt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(17,1,NULL,NULL,'iPhone 12','8qp6q','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(18,1,NULL,NULL,'iPhone 12','Jhtvg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(19,1,NULL,NULL,'iPhone 12','xbyDd','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(20,1,NULL,NULL,'iPhone 12','W3L3a','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(21,1,NULL,NULL,'iPhone 12','XUXdN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(22,1,NULL,NULL,'iPhone 12','nC0lh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(23,1,NULL,NULL,'iPhone 12','gD1J5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(24,1,NULL,NULL,'iPhone 12','ECcO3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(25,1,NULL,NULL,'iPhone 12','4Y26Q','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(26,1,NULL,NULL,'iPhone 12','40tBw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(27,1,NULL,NULL,'iPhone 12','tuZ1H','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(28,1,NULL,NULL,'iPhone 12','wMJom','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(29,1,NULL,NULL,'iPhone 12','H7N3W','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(30,1,NULL,NULL,'iPhone 12','1uxW2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(31,1,NULL,NULL,'iPhone 12','outgt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(32,1,NULL,NULL,'iPhone 12','qmlwt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(33,1,NULL,NULL,'iPhone 12','iUkig','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(34,1,NULL,NULL,'iPhone 12','ADzEH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(35,1,NULL,NULL,'iPhone 12','NQ4yw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(36,1,NULL,NULL,'iPhone 12','xOssP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(37,1,NULL,NULL,'iPhone 12','JarCV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(38,1,NULL,NULL,'iPhone 12','MMQZ7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(39,1,NULL,NULL,'iPhone 12','POmUo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(40,1,NULL,NULL,'iPhone 12','3FNhT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(41,1,NULL,NULL,'iPhone 12','XB9Sa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(42,1,NULL,NULL,'iPhone 12','xsu0d','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(43,1,NULL,NULL,'iPhone 12','hu3GY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(44,1,NULL,NULL,'iPhone 12','2VGBu','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(45,1,NULL,NULL,'iPhone 12','dNyCO','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(46,1,NULL,NULL,'iPhone 12','WVnMB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(47,1,NULL,NULL,'iPhone 12','YROeB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(48,1,NULL,NULL,'iPhone 12','Wk2S7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(49,1,NULL,NULL,'iPhone 12','Rb2II','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(50,1,NULL,NULL,'iPhone 12','mueSL','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(51,1,NULL,NULL,'iPhone 12','ReHvh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(52,1,NULL,NULL,'iPhone 12','QKRde','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(53,1,NULL,NULL,'iPhone 12','Tq9ct','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(54,1,NULL,NULL,'iPhone 12','f1Nl1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(55,1,NULL,NULL,'iPhone 12','ADBQc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(56,1,NULL,NULL,'iPhone 12','B542u','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(57,1,NULL,NULL,'iPhone 12','NvQz8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(58,1,NULL,NULL,'iPhone 12','Ljl7l','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(59,1,NULL,NULL,'iPhone 12','1mJf4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(60,1,NULL,NULL,'iPhone 12','5ZVGC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(61,1,NULL,NULL,'iPhone 12','o5nEk','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(62,1,NULL,NULL,'iPhone 12','x0uEh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(63,1,NULL,NULL,'iPhone 12','jf0x7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(64,1,NULL,NULL,'iPhone 12','6ROl3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(65,1,NULL,NULL,'iPhone 12','ER00s','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(66,1,NULL,NULL,'iPhone 12','5Uoq5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(67,1,NULL,NULL,'iPhone 12','zleeZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(68,1,NULL,NULL,'iPhone 12','NUmm2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(69,1,NULL,NULL,'iPhone 12','6NeRI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(70,1,NULL,NULL,'iPhone 12','nQ5QP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(71,1,NULL,NULL,'iPhone 12','b9IN6','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(72,1,NULL,NULL,'iPhone 12','0lwQX','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(73,1,NULL,NULL,'iPhone 12','59r6J','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(74,1,NULL,NULL,'iPhone 12','ZJA7V','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(75,1,NULL,NULL,'iPhone 12','ENCdy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(76,1,NULL,NULL,'iPhone 12','FC6lL','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(77,1,NULL,NULL,'iPhone 12','N8zc7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(78,1,NULL,NULL,'iPhone 12','fElSp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(79,1,NULL,NULL,'iPhone 12','TwjYq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(80,1,NULL,NULL,'iPhone 12','rKSdl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(81,1,NULL,NULL,'iPhone 12','opgHU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(82,1,NULL,NULL,'iPhone 12','CMLvm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(83,1,NULL,NULL,'iPhone 12','R0oMF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(84,1,NULL,NULL,'iPhone 12','OggNI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(85,1,NULL,NULL,'iPhone 12','mMftN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(86,1,NULL,NULL,'iPhone 12','NVKTF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(87,1,NULL,NULL,'iPhone 12','pj3sD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(88,1,NULL,NULL,'iPhone 12','MBc6w','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(89,1,NULL,NULL,'iPhone 12','BQysZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(90,1,NULL,NULL,'iPhone 12','dPMkF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(91,1,NULL,NULL,'iPhone 12','QH7ev','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(92,1,NULL,NULL,'iPhone 12','6h1Sv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(93,1,NULL,NULL,'iPhone 12','z3ew5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(94,1,NULL,NULL,'iPhone 12','PKXbr','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(95,1,NULL,NULL,'iPhone 12','obn2G','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(96,1,NULL,NULL,'iPhone 12','6Pkf0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(97,1,NULL,NULL,'iPhone 12','Nu2I4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(98,1,NULL,NULL,'iPhone 12','tGU6m','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(99,1,NULL,NULL,'iPhone 12','OshTs','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(100,1,NULL,NULL,'iPhone 12','uxPcy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(101,1,NULL,NULL,'iPhone 12','WZ5Zo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(102,1,NULL,NULL,'iPhone 12','mmIqB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(103,1,NULL,NULL,'iPhone 12','EZK5O','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(104,1,NULL,NULL,'iPhone 12','iW3RY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(105,1,NULL,NULL,'iPhone 12','PZc4q','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(106,1,NULL,NULL,'iPhone 12','TTSdb','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(107,1,NULL,NULL,'iPhone 12','11FIi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(108,1,NULL,NULL,'iPhone 12','3dtmu','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(109,1,NULL,NULL,'iPhone 12','NnfFI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(110,1,NULL,NULL,'iPhone 12','fVYmJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(111,1,NULL,NULL,'iPhone 12','VLEJr','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(112,1,NULL,NULL,'iPhone 12','82X4M','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(113,1,NULL,NULL,'iPhone 12','E9wp9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(114,1,NULL,NULL,'iPhone 12','L8Tg4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(115,1,NULL,NULL,'iPhone 12','iI8zZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(116,1,NULL,NULL,'iPhone 12','DGOv2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(117,1,NULL,NULL,'iPhone 12','FSdYi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(118,1,NULL,NULL,'iPhone 12','dTBT6','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(119,1,NULL,NULL,'iPhone 12','ikKaN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(120,1,NULL,NULL,'iPhone 12','szulc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(121,1,NULL,NULL,'iPhone 12','voAGR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(122,1,NULL,NULL,'iPhone 12','UGJpn','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(123,1,NULL,NULL,'iPhone 12','ipLZc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(124,1,NULL,NULL,'iPhone 12','wuLwr','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(125,1,NULL,NULL,'iPhone 12','C313p','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(126,1,NULL,NULL,'iPhone 12','C47y8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(127,1,NULL,NULL,'iPhone 12','d7oBA','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(128,1,NULL,NULL,'iPhone 12','EdVzK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(129,1,NULL,NULL,'iPhone 12','qWVad','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(130,1,NULL,NULL,'iPhone 12','0E9MD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(131,1,NULL,NULL,'iPhone 12','hp6ny','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(132,1,NULL,NULL,'iPhone 12','NLas6','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(133,1,NULL,NULL,'iPhone 12','HT1BA','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(134,1,NULL,NULL,'iPhone 12','8ypnm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(135,1,NULL,NULL,'iPhone 12','XjhOK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(136,1,NULL,NULL,'iPhone 12','h9GbN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(137,1,NULL,NULL,'iPhone 12','cItbk','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(138,1,NULL,NULL,'iPhone 12','VWMLr','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(139,1,NULL,NULL,'iPhone 12','G4hP3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(140,1,NULL,NULL,'iPhone 12','cOwxZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(141,1,NULL,NULL,'iPhone 12','ldjxJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(142,1,NULL,NULL,'iPhone 12','5oi8T','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(143,1,NULL,NULL,'iPhone 12','gvHbh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(144,1,NULL,NULL,'iPhone 12','nt1KC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(145,1,NULL,NULL,'iPhone 12','HwBag','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(146,1,NULL,NULL,'iPhone 12','KymVC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(147,1,NULL,NULL,'iPhone 12','D1wko','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(148,1,NULL,NULL,'iPhone 12','HtpLC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(149,1,NULL,NULL,'iPhone 12','O0IGB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(150,1,NULL,NULL,'iPhone 12','sDLAB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(151,1,NULL,NULL,'iPhone 12','cwIAH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(152,1,NULL,NULL,'iPhone 12','Ml6tm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(153,1,NULL,NULL,'iPhone 12','LR1CT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(154,1,NULL,NULL,'iPhone 12','BBGUD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(155,1,NULL,NULL,'iPhone 12','tmtCy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(156,1,NULL,NULL,'iPhone 12','xgKpG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(157,1,NULL,NULL,'iPhone 12','b8F2M','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(158,1,NULL,NULL,'iPhone 12','2jsol','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(159,1,NULL,NULL,'iPhone 12','3D17r','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(160,1,NULL,NULL,'iPhone 12','LBjuA','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(161,1,NULL,NULL,'iPhone 12','cN7hd','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(162,1,NULL,NULL,'iPhone 12','PtnNf','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(163,1,NULL,NULL,'iPhone 12','ddbFy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(164,1,NULL,NULL,'iPhone 12','kCWpC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(165,1,NULL,NULL,'iPhone 12','QW9fG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(166,1,NULL,NULL,'iPhone 12','jwoTH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(167,1,NULL,NULL,'iPhone 12','Pwazn','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(168,1,NULL,NULL,'iPhone 12','NuENH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(169,1,NULL,NULL,'iPhone 12','fgiIw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(170,1,NULL,NULL,'iPhone 12','VnHBO','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(171,1,NULL,NULL,'iPhone 12','Lo729','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(172,1,NULL,NULL,'iPhone 12','aL61K','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(173,1,NULL,NULL,'iPhone 12','2bCtR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(174,1,NULL,NULL,'iPhone 12','01rZC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(175,1,NULL,NULL,'iPhone 12','Mksxc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(176,1,NULL,NULL,'iPhone 12','ClfWi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(177,1,NULL,NULL,'iPhone 12','Suj0S','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(178,1,NULL,NULL,'iPhone 12','XiUBK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(179,1,NULL,NULL,'iPhone 12','YO3Hk','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(180,1,NULL,NULL,'iPhone 12','ECsNu','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(181,1,NULL,NULL,'iPhone 12','LgaWe','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(182,1,NULL,NULL,'iPhone 12','RlYpC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(183,1,NULL,NULL,'iPhone 12','2URKC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(184,1,NULL,NULL,'iPhone 12','nWnoW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(185,1,NULL,NULL,'iPhone 12','ulsnH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(186,1,NULL,NULL,'iPhone 12','pxqDz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(187,1,NULL,NULL,'iPhone 12','DM6Oy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(188,1,NULL,NULL,'iPhone 12','L0dMe','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(189,1,NULL,NULL,'iPhone 12','gJHq7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(190,1,NULL,NULL,'iPhone 12','TVISc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(191,1,NULL,NULL,'iPhone 12','QINos','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(192,1,NULL,NULL,'iPhone 12','D5Omh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(193,1,NULL,NULL,'iPhone 12','WN4T0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(194,1,NULL,NULL,'iPhone 12','Gzfnw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(195,1,NULL,NULL,'iPhone 12','ez9fJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(196,1,NULL,NULL,'iPhone 12','COX3K','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(197,1,NULL,NULL,'iPhone 12','cjb0F','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(198,1,NULL,NULL,'iPhone 12','cifc3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(199,1,NULL,NULL,'iPhone 12','99DJ8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(200,1,NULL,NULL,'iPhone 12','zKPVN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(201,1,NULL,NULL,'iPhone 12','h7508','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(202,1,NULL,NULL,'iPhone 12','Fkewt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(203,1,NULL,NULL,'iPhone 12','2ysc2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(204,1,NULL,NULL,'iPhone 12','uKgQX','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(205,1,NULL,NULL,'iPhone 12','8CnqJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(206,1,NULL,NULL,'iPhone 12','APpWy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(207,1,NULL,NULL,'iPhone 12','PXeIl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(208,1,NULL,NULL,'iPhone 12','sChZ7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(209,1,NULL,NULL,'iPhone 12','9LJhx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(210,1,NULL,NULL,'iPhone 12','Zxtit','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(211,1,NULL,NULL,'iPhone 12','tHmbq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(212,1,NULL,NULL,'iPhone 12','wVrDQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(213,1,NULL,NULL,'iPhone 12','skfUu','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(214,1,NULL,NULL,'iPhone 12','QiXqW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(215,1,NULL,NULL,'iPhone 12','rlWNk','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(216,1,NULL,NULL,'iPhone 12','WweOK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(217,1,NULL,NULL,'iPhone 12','NnwI2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(218,1,NULL,NULL,'iPhone 12','6EEVl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(219,1,NULL,NULL,'iPhone 12','1J1K3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(220,1,NULL,NULL,'iPhone 12','5SlLr','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(221,1,NULL,NULL,'iPhone 12','GiCfi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(222,1,NULL,NULL,'iPhone 12','KKmJ5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(223,1,NULL,NULL,'iPhone 12','zNufC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(224,1,NULL,NULL,'iPhone 12','4LZ8M','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(225,1,NULL,NULL,'iPhone 12','hw89z','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(226,1,NULL,NULL,'iPhone 12','fZvck','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(227,1,NULL,NULL,'iPhone 12','p2Ysx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(228,1,NULL,NULL,'iPhone 12','iUAj7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(229,1,NULL,NULL,'iPhone 12','dblkq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(230,1,NULL,NULL,'iPhone 12','5wlxh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(231,1,NULL,NULL,'iPhone 12','14YkU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(232,1,NULL,NULL,'iPhone 12','xRLEn','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(233,1,NULL,NULL,'iPhone 12','ovgIm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(234,1,NULL,NULL,'iPhone 12','KyyXw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(235,1,NULL,NULL,'iPhone 12','0afVJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(236,1,NULL,NULL,'iPhone 12','6STrQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(237,1,NULL,NULL,'iPhone 12','vfQVh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(238,1,NULL,NULL,'iPhone 12','vQRNg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(239,1,NULL,NULL,'iPhone 12','nUKJX','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(240,1,NULL,NULL,'iPhone 12','ENGng','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(241,1,NULL,NULL,'iPhone 12','C2t7A','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(242,1,NULL,NULL,'iPhone 12','bILAP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(243,1,NULL,NULL,'iPhone 12','BN5Ya','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(244,1,NULL,NULL,'iPhone 12','rJAEd','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(245,1,NULL,NULL,'iPhone 12','FTjtR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(246,1,NULL,NULL,'iPhone 12','50DES','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(247,1,NULL,NULL,'iPhone 12','tbYg8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(248,1,NULL,NULL,'iPhone 12','1DKu0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(249,1,NULL,NULL,'iPhone 12','6w2LO','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(250,1,NULL,NULL,'iPhone 12','89iKI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(251,1,NULL,NULL,'iPhone 12','eexu9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(252,1,NULL,NULL,'iPhone 12','wT7yJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(253,1,NULL,NULL,'iPhone 12','5XPlZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(254,1,NULL,NULL,'iPhone 12','byObD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(255,1,NULL,NULL,'iPhone 12','LCEcz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(256,1,NULL,NULL,'iPhone 12','Gs0ZP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(257,1,NULL,NULL,'iPhone 12','3PcPH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(258,1,NULL,NULL,'iPhone 12','9eUtg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(259,1,NULL,NULL,'iPhone 12','dA8DW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(260,1,NULL,NULL,'iPhone 12','mPrur','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(261,1,NULL,NULL,'iPhone 12','wFFVf','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(262,1,NULL,NULL,'iPhone 12','0q407','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(263,1,NULL,NULL,'iPhone 12','7nGxw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(264,1,NULL,NULL,'iPhone 12','TmB4I','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(265,1,NULL,NULL,'iPhone 12','bHcBW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(266,1,NULL,NULL,'iPhone 12','qpDLi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(267,1,NULL,NULL,'iPhone 12','X69pt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(268,1,NULL,NULL,'iPhone 12','4Hkc1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(269,1,NULL,NULL,'iPhone 12','jCnDT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(270,1,NULL,NULL,'iPhone 12','gvVT2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(271,1,NULL,NULL,'iPhone 12','34bI2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(272,1,NULL,NULL,'iPhone 12','ooKIM','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(273,1,NULL,NULL,'iPhone 12','uWjas','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(274,1,NULL,NULL,'iPhone 12','usO9h','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(275,1,NULL,NULL,'iPhone 12','g0LE1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(276,1,NULL,NULL,'iPhone 12','Pz2fS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(277,1,NULL,NULL,'iPhone 12','AeMaD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(278,1,NULL,NULL,'iPhone 12','rDip4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(279,1,NULL,NULL,'iPhone 12','B3NiU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(280,1,NULL,NULL,'iPhone 12','rIIJi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(281,1,NULL,NULL,'iPhone 12','nb3di','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(282,1,NULL,NULL,'iPhone 12','VyVwo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(283,1,NULL,NULL,'iPhone 12','HdJ1l','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(284,1,NULL,NULL,'iPhone 12','DlVuP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(285,1,NULL,NULL,'iPhone 12','ALP1E','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(286,1,NULL,NULL,'iPhone 12','kccKE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(287,1,NULL,NULL,'iPhone 12','hqa75','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(288,1,NULL,NULL,'iPhone 12','0JEjJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(289,1,NULL,NULL,'iPhone 12','FfZk6','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(290,1,NULL,NULL,'iPhone 12','KUYOL','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(291,1,NULL,NULL,'iPhone 12','cf5dR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(292,1,NULL,NULL,'iPhone 12','hyaS8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(293,1,NULL,NULL,'iPhone 12','OMq1h','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(294,1,NULL,NULL,'iPhone 12','f3tbR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(295,1,NULL,NULL,'iPhone 12','SCR73','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(296,1,NULL,NULL,'iPhone 12','WsPkp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(297,1,NULL,NULL,'iPhone 12','TT7dm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(298,1,NULL,NULL,'iPhone 12','FWOw4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(299,1,NULL,NULL,'iPhone 12','KP0E3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(300,1,NULL,NULL,'iPhone 12','dAaKi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(301,1,NULL,NULL,'iPhone 12','oEhTQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(302,1,NULL,NULL,'iPhone 12','vFyYe','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(303,1,NULL,NULL,'iPhone 12','N5fiJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(304,1,NULL,NULL,'iPhone 12','MwgD2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(305,1,NULL,NULL,'iPhone 12','shGVP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(306,1,NULL,NULL,'iPhone 12','Ufu0r','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(307,1,NULL,NULL,'iPhone 12','xir0h','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(308,1,NULL,NULL,'iPhone 12','4rcIm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(309,1,NULL,NULL,'iPhone 12','jkg9n','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(310,1,NULL,NULL,'iPhone 12','IsReN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(311,1,NULL,NULL,'iPhone 12','yPAME','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(312,1,NULL,NULL,'iPhone 12','9hn6I','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(313,1,NULL,NULL,'iPhone 12','kECJQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(314,1,NULL,NULL,'iPhone 12','s1oft','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(315,1,NULL,NULL,'iPhone 12','QBeMe','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(316,1,NULL,NULL,'iPhone 12','lO8oZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(317,1,NULL,NULL,'iPhone 12','gA6bR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(318,1,NULL,NULL,'iPhone 12','QgnTj','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(319,1,NULL,NULL,'iPhone 12','elNSH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(320,1,NULL,NULL,'iPhone 12','PZHnH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(321,1,NULL,NULL,'iPhone 12','raVoh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(322,1,NULL,NULL,'iPhone 12','Oktxh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(323,1,NULL,NULL,'iPhone 12','B3kR4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(324,1,NULL,NULL,'iPhone 12','qMdZw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(325,1,NULL,NULL,'iPhone 12','TTa2Z','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(326,1,NULL,NULL,'iPhone 12','SynAQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(327,1,NULL,NULL,'iPhone 12','7sctv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(328,1,NULL,NULL,'iPhone 12','hd4NI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(329,1,NULL,NULL,'iPhone 12','iNKqa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(330,1,NULL,NULL,'iPhone 12','KCC6Y','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(331,1,NULL,NULL,'iPhone 12','REA8c','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(332,1,NULL,NULL,'iPhone 12','j48bz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(333,1,NULL,NULL,'iPhone 12','5VHHE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(334,1,NULL,NULL,'iPhone 12','ihWFX','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(335,1,NULL,NULL,'iPhone 12','05lrN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(336,1,NULL,NULL,'iPhone 12','D9TMJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(337,1,NULL,NULL,'iPhone 12','As74K','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(338,1,NULL,NULL,'iPhone 12','7nERC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(339,1,NULL,NULL,'iPhone 12','s8bYD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(340,1,NULL,NULL,'iPhone 12','yWnwV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(341,1,NULL,NULL,'iPhone 12','2UkIo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(342,1,NULL,NULL,'iPhone 12','PDsGi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(343,1,NULL,NULL,'iPhone 12','I8Sp2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(344,1,NULL,NULL,'iPhone 12','f28th','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(345,1,NULL,NULL,'iPhone 12','jByZV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(346,1,NULL,NULL,'iPhone 12','o7XRM','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(347,1,NULL,NULL,'iPhone 12','pePuF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(348,1,NULL,NULL,'iPhone 12','lHqTj','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(349,1,NULL,NULL,'iPhone 12','VMIMC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(350,1,NULL,NULL,'iPhone 12','MpMPO','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(351,1,NULL,NULL,'iPhone 12','p1sng','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(352,1,NULL,NULL,'iPhone 12','aagKJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(353,1,NULL,NULL,'iPhone 12','opSQJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(354,1,NULL,NULL,'iPhone 12','mOZJk','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(355,1,NULL,NULL,'iPhone 12','jQEAF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(356,1,NULL,NULL,'iPhone 12','ja5kF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(357,1,NULL,NULL,'iPhone 12','MWDRW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(358,1,NULL,NULL,'iPhone 12','JLYZe','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(359,1,NULL,NULL,'iPhone 12','tN9ra','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(360,1,NULL,NULL,'iPhone 12','lMMs1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(361,1,NULL,NULL,'iPhone 12','wIZL8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(362,1,NULL,NULL,'iPhone 12','zJBVc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(363,1,NULL,NULL,'iPhone 12','KVwUo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(364,1,NULL,NULL,'iPhone 12','vTlfm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(365,1,NULL,NULL,'iPhone 12','IQ5fh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(366,1,NULL,NULL,'iPhone 12','WJsPZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(367,1,NULL,NULL,'iPhone 12','eXnBb','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(368,1,NULL,NULL,'iPhone 12','hnGX9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(369,1,NULL,NULL,'iPhone 12','hO9RZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(370,1,NULL,NULL,'iPhone 12','6j5SG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(371,1,NULL,NULL,'iPhone 12','EPB2d','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(372,1,NULL,NULL,'iPhone 12','oSJVy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(373,1,NULL,NULL,'iPhone 12','nC5D0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(374,1,NULL,NULL,'iPhone 12','3EgPy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(375,1,NULL,NULL,'iPhone 12','2CnTI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(376,1,NULL,NULL,'iPhone 12','v7NsF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(377,1,NULL,NULL,'iPhone 12','OZX0a','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(378,1,NULL,NULL,'iPhone 12','greIg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(379,1,NULL,NULL,'iPhone 12','PFsIo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(380,1,NULL,NULL,'iPhone 12','fCKjg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(381,1,NULL,NULL,'iPhone 12','6IyI2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(382,1,NULL,NULL,'iPhone 12','VLNp9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(383,1,NULL,NULL,'iPhone 12','f2j3m','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(384,1,NULL,NULL,'iPhone 12','WIqnq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(385,1,NULL,NULL,'iPhone 12','NXJCn','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(386,1,NULL,NULL,'iPhone 12','wziT8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(387,1,NULL,NULL,'iPhone 12','dZICj','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(388,1,NULL,NULL,'iPhone 12','8bBK9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(389,1,NULL,NULL,'iPhone 12','rwbHq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(390,1,NULL,NULL,'iPhone 12','IqK2t','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(391,1,NULL,NULL,'iPhone 12','BAe4T','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(392,1,NULL,NULL,'iPhone 12','vO5vK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(393,1,NULL,NULL,'iPhone 12','9SF84','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(394,1,NULL,NULL,'iPhone 12','FSE90','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(395,1,NULL,NULL,'iPhone 12','ogyQW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(396,1,NULL,NULL,'iPhone 12','vLwI0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(397,1,NULL,NULL,'iPhone 12','TRnUi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(398,1,NULL,NULL,'iPhone 12','GULBe','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(399,1,NULL,NULL,'iPhone 12','VIL7a','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(400,1,NULL,NULL,'iPhone 12','afDtG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(401,1,NULL,NULL,'iPhone 12','AfUYC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(402,1,NULL,NULL,'iPhone 12','nwRMu','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(403,1,NULL,NULL,'iPhone 12','WhegC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(404,1,NULL,NULL,'iPhone 12','1GbKS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(405,1,NULL,NULL,'iPhone 12','juMK9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(406,1,NULL,NULL,'iPhone 12','dL9jX','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(407,1,NULL,NULL,'iPhone 12','CCx9m','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(408,1,NULL,NULL,'iPhone 12','0venc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(409,1,NULL,NULL,'iPhone 12','9QVi7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(410,1,NULL,NULL,'iPhone 12','9G0QG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(411,1,NULL,NULL,'iPhone 12','HYZH8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(412,1,NULL,NULL,'iPhone 12','YJNpI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(413,1,NULL,NULL,'iPhone 12','osD1C','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(414,1,NULL,NULL,'iPhone 12','AplPt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(415,1,NULL,NULL,'iPhone 12','soFia','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(416,1,NULL,NULL,'iPhone 12','vOXeQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(417,1,NULL,NULL,'iPhone 12','ETv1D','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(418,1,NULL,NULL,'iPhone 12','W4Cvu','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(419,1,NULL,NULL,'iPhone 12','GVJI1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:52','2024-06-13 17:40:52'),
(420,1,NULL,NULL,'iPhone 12','WcErQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(421,1,NULL,NULL,'iPhone 12','d93vY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(422,1,NULL,NULL,'iPhone 12','2VFDy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(423,1,NULL,NULL,'iPhone 12','wpmmA','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(424,1,NULL,NULL,'iPhone 12','d5bGT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(425,1,NULL,NULL,'iPhone 12','26Vmf','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(426,1,NULL,NULL,'iPhone 12','QNMlj','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(427,1,NULL,NULL,'iPhone 12','eWzMq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(428,1,NULL,NULL,'iPhone 12','5WaSv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(429,1,NULL,NULL,'iPhone 12','EtR4X','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(430,1,NULL,NULL,'iPhone 12','dyYSr','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(431,1,NULL,NULL,'iPhone 12','n0r8D','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(432,1,NULL,NULL,'iPhone 12','KqZTs','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(433,1,NULL,NULL,'iPhone 12','8FT8Q','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(434,1,NULL,NULL,'iPhone 12','MdS7g','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(435,1,NULL,NULL,'iPhone 12','UCNMI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(436,1,NULL,NULL,'iPhone 12','4iprF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(437,1,NULL,NULL,'iPhone 12','crjaI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(438,1,NULL,NULL,'iPhone 12','Hdf8L','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(439,1,NULL,NULL,'iPhone 12','eYG65','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(440,1,NULL,NULL,'iPhone 12','0X1wJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(441,1,NULL,NULL,'iPhone 12','SQ7NZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(442,1,NULL,NULL,'iPhone 12','xJtjR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(443,1,NULL,NULL,'iPhone 12','wwZgv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(444,1,NULL,NULL,'iPhone 12','TwX3k','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(445,1,NULL,NULL,'iPhone 12','aElZR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(446,1,NULL,NULL,'iPhone 12','MyZgH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(447,1,NULL,NULL,'iPhone 12','643QV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(448,1,NULL,NULL,'iPhone 12','CshYL','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(449,1,NULL,NULL,'iPhone 12','VRaFY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(450,1,NULL,NULL,'iPhone 12','NocWg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(451,1,NULL,NULL,'iPhone 12','HThfs','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(452,1,NULL,NULL,'iPhone 12','7qQGJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(453,1,NULL,NULL,'iPhone 12','WQ1fY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(454,1,NULL,NULL,'iPhone 12','2G0hk','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(455,1,NULL,NULL,'iPhone 12','GtCw6','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(456,1,NULL,NULL,'iPhone 12','yxEmg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(457,1,NULL,NULL,'iPhone 12','WrBYK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(458,1,NULL,NULL,'iPhone 12','FxSuG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(459,1,NULL,NULL,'iPhone 12','HNXq4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(460,1,NULL,NULL,'iPhone 12','SC9Ec','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(461,1,NULL,NULL,'iPhone 12','Bom17','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(462,1,NULL,NULL,'iPhone 12','AEkTK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(463,1,NULL,NULL,'iPhone 12','qRghJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(464,1,NULL,NULL,'iPhone 12','CN0AS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(465,1,NULL,NULL,'iPhone 12','PUm8a','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(466,1,NULL,NULL,'iPhone 12','ysjR2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(467,1,NULL,NULL,'iPhone 12','GqUgf','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(468,1,NULL,NULL,'iPhone 12','4X40O','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(469,1,NULL,NULL,'iPhone 12','TsH4U','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(470,1,NULL,NULL,'iPhone 12','wbYFP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(471,1,NULL,NULL,'iPhone 12','AoKpE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(472,1,NULL,NULL,'iPhone 12','mUuJr','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(473,1,NULL,NULL,'iPhone 12','mftVl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(474,1,NULL,NULL,'iPhone 12','qzT0i','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(475,1,NULL,NULL,'iPhone 12','Jy0P5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(476,1,NULL,NULL,'iPhone 12','Gp4IS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(477,1,NULL,NULL,'iPhone 12','w0jv7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(478,1,NULL,NULL,'iPhone 12','wVMcm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(479,1,NULL,NULL,'iPhone 12','hSrpp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(480,1,NULL,NULL,'iPhone 12','ANwkp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(481,1,NULL,NULL,'iPhone 12','fWlzF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(482,1,NULL,NULL,'iPhone 12','ET5gv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(483,1,NULL,NULL,'iPhone 12','r3Wux','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(484,1,NULL,NULL,'iPhone 12','K9fh0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(485,1,NULL,NULL,'iPhone 12','DjDEW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(486,1,NULL,NULL,'iPhone 12','ievX7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(487,1,NULL,NULL,'iPhone 12','j9pEP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(488,1,NULL,NULL,'iPhone 12','GSKDR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(489,1,NULL,NULL,'iPhone 12','GCn1S','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(490,1,NULL,NULL,'iPhone 12','gcy39','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(491,1,NULL,NULL,'iPhone 12','flIXt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(492,1,NULL,NULL,'iPhone 12','ZRYjK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(493,1,NULL,NULL,'iPhone 12','B27Um','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(494,1,NULL,NULL,'iPhone 12','4D83G','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(495,1,NULL,NULL,'iPhone 12','F2ZyP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(496,1,NULL,NULL,'iPhone 12','n9d6j','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(497,1,NULL,NULL,'iPhone 12','ISu5U','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(498,1,NULL,NULL,'iPhone 12','wYYeE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(499,1,NULL,NULL,'iPhone 12','9Rp2A','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(500,1,NULL,NULL,'iPhone 12','HUtNJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(501,1,NULL,NULL,'iPhone 12','ydUej','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(502,1,NULL,NULL,'iPhone 12','RC97H','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(503,1,NULL,NULL,'iPhone 12','5e8x0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(504,1,NULL,NULL,'iPhone 12','cMZdU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(505,1,NULL,NULL,'iPhone 12','sIDNb','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(506,1,NULL,NULL,'iPhone 12','GHCcI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(507,1,NULL,NULL,'iPhone 12','Ynl9z','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(508,1,NULL,NULL,'iPhone 12','ajhXQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(509,1,NULL,NULL,'iPhone 12','aputa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(510,1,NULL,NULL,'iPhone 12','OTKXt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(511,1,NULL,NULL,'iPhone 12','ILCTf','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(512,1,NULL,NULL,'iPhone 12','bmgN9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(513,1,NULL,NULL,'iPhone 12','4DxAz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(514,1,NULL,NULL,'iPhone 12','W9gxS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(515,1,NULL,NULL,'iPhone 12','saJkV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(516,1,NULL,NULL,'iPhone 12','PQ73w','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(517,1,NULL,NULL,'iPhone 12','nrPSQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(518,1,NULL,NULL,'iPhone 12','rkEyN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(519,1,NULL,NULL,'iPhone 12','e2nwP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(520,1,NULL,NULL,'iPhone 12','qnhzy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(521,1,NULL,NULL,'iPhone 12','tUUjx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(522,1,NULL,NULL,'iPhone 12','dA9iy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(523,1,NULL,NULL,'iPhone 12','Ishwx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(524,1,NULL,NULL,'iPhone 12','LueA1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(525,1,NULL,NULL,'iPhone 12','11nnM','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(526,1,NULL,NULL,'iPhone 12','hhQfv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(527,1,NULL,NULL,'iPhone 12','o8R6z','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(528,1,NULL,NULL,'iPhone 12','OBZYs','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(529,1,NULL,NULL,'iPhone 12','8i3Rt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(530,1,NULL,NULL,'iPhone 12','ZXKco','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(531,1,NULL,NULL,'iPhone 12','7DxOs','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(532,1,NULL,NULL,'iPhone 12','ZatNa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(533,1,NULL,NULL,'iPhone 12','QDQdy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(534,1,NULL,NULL,'iPhone 12','mlTFc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(535,1,NULL,NULL,'iPhone 12','7ZhqU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(536,1,NULL,NULL,'iPhone 12','zwO6u','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(537,1,NULL,NULL,'iPhone 12','gUUMF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(538,1,NULL,NULL,'iPhone 12','CcrzY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(539,1,NULL,NULL,'iPhone 12','M38Xf','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(540,1,NULL,NULL,'iPhone 12','tnkyn','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(541,1,NULL,NULL,'iPhone 12','G8u4y','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(542,1,NULL,NULL,'iPhone 12','Vgf6Y','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(543,1,NULL,NULL,'iPhone 12','kGuAD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(544,1,NULL,NULL,'iPhone 12','guYwv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(545,1,NULL,NULL,'iPhone 12','UaGn5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(546,1,NULL,NULL,'iPhone 12','nLmpT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(547,1,NULL,NULL,'iPhone 12','UPHOq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(548,1,NULL,NULL,'iPhone 12','Kn3ur','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(549,1,NULL,NULL,'iPhone 12','iEtP4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(550,1,NULL,NULL,'iPhone 12','jlbGh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(551,1,NULL,NULL,'iPhone 12','w4opJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(552,1,NULL,NULL,'iPhone 12','MB1bS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(553,1,NULL,NULL,'iPhone 12','xzSEp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(554,1,NULL,NULL,'iPhone 12','lGgDq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(555,1,NULL,NULL,'iPhone 12','x7IvQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(556,1,NULL,NULL,'iPhone 12','RwDkv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(557,1,NULL,NULL,'iPhone 12','YEMv7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(558,1,NULL,NULL,'iPhone 12','zLdDY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(559,1,NULL,NULL,'iPhone 12','FlqJa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(560,1,NULL,NULL,'iPhone 12','33zTE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(561,1,NULL,NULL,'iPhone 12','q6Rur','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(562,1,NULL,NULL,'iPhone 12','GXnKz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(563,1,NULL,NULL,'iPhone 12','FamoF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(564,1,NULL,NULL,'iPhone 12','MsAEc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(565,1,NULL,NULL,'iPhone 12','4OmU9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(566,1,NULL,NULL,'iPhone 12','ypfuV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(567,1,NULL,NULL,'iPhone 12','azbMe','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(568,1,NULL,NULL,'iPhone 12','fFwpB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(569,1,NULL,NULL,'iPhone 12','GbAwP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(570,1,NULL,NULL,'iPhone 12','woxLI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(571,1,NULL,NULL,'iPhone 12','mvsjR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(572,1,NULL,NULL,'iPhone 12','gScLj','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(573,1,NULL,NULL,'iPhone 12','QKd4M','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(574,1,NULL,NULL,'iPhone 12','7zZuL','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(575,1,NULL,NULL,'iPhone 12','zm5im','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(576,1,NULL,NULL,'iPhone 12','lLkmt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(577,1,NULL,NULL,'iPhone 12','BS5Ia','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(578,1,NULL,NULL,'iPhone 12','oaQnM','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(579,1,NULL,NULL,'iPhone 12','3ITky','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(580,1,NULL,NULL,'iPhone 12','PDHsH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(581,1,NULL,NULL,'iPhone 12','xtk2C','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(582,1,NULL,NULL,'iPhone 12','z6AVW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(583,1,NULL,NULL,'iPhone 12','Qsomp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(584,1,NULL,NULL,'iPhone 12','4KrRM','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(585,1,NULL,NULL,'iPhone 12','Z8dTD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(586,1,NULL,NULL,'iPhone 12','PHYb8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(587,1,NULL,NULL,'iPhone 12','pmPVE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(588,1,NULL,NULL,'iPhone 12','Dk5Tb','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(589,1,NULL,NULL,'iPhone 12','o7h2p','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(590,1,NULL,NULL,'iPhone 12','Es0Gx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(591,1,NULL,NULL,'iPhone 12','5OOaQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(592,1,NULL,NULL,'iPhone 12','6c3Ch','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(593,1,NULL,NULL,'iPhone 12','iW2dC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(594,1,NULL,NULL,'iPhone 12','NyJ5h','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(595,1,NULL,NULL,'iPhone 12','fk1vz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(596,1,NULL,NULL,'iPhone 12','LeSD5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(597,1,NULL,NULL,'iPhone 12','g32b5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(598,1,NULL,NULL,'iPhone 12','kCkjo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(599,1,NULL,NULL,'iPhone 12','aPZLV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(600,1,NULL,NULL,'iPhone 12','o2dpI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(601,1,NULL,NULL,'iPhone 12','z803g','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(602,1,NULL,NULL,'iPhone 12','HqnNg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(603,1,NULL,NULL,'iPhone 12','0fTFS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(604,1,NULL,NULL,'iPhone 12','TpLY8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(605,1,NULL,NULL,'iPhone 12','daJ7M','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(606,1,NULL,NULL,'iPhone 12','xPv80','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(607,1,NULL,NULL,'iPhone 12','V7PEF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(608,1,NULL,NULL,'iPhone 12','ah7ut','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(609,1,NULL,NULL,'iPhone 12','JTgHR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(610,1,NULL,NULL,'iPhone 12','dyQF3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(611,1,NULL,NULL,'iPhone 12','1pfe7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(612,1,NULL,NULL,'iPhone 12','Pm0OR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(613,1,NULL,NULL,'iPhone 12','hjXoR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(614,1,NULL,NULL,'iPhone 12','Mh9RB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(615,1,NULL,NULL,'iPhone 12','y8SSu','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(616,1,NULL,NULL,'iPhone 12','iXCjw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(617,1,NULL,NULL,'iPhone 12','zdTFp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(618,1,NULL,NULL,'iPhone 12','1QPXa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(619,1,NULL,NULL,'iPhone 12','rQbjK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(620,1,NULL,NULL,'iPhone 12','0cL5P','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(621,1,NULL,NULL,'iPhone 12','PQF1l','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(622,1,NULL,NULL,'iPhone 12','QeDRW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(623,1,NULL,NULL,'iPhone 12','Di9Nc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(624,1,NULL,NULL,'iPhone 12','2Ozls','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(625,1,NULL,NULL,'iPhone 12','quvJT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(626,1,NULL,NULL,'iPhone 12','I8uMR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(627,1,NULL,NULL,'iPhone 12','DpQX7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(628,1,NULL,NULL,'iPhone 12','PgIl3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(629,1,NULL,NULL,'iPhone 12','EHHVs','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(630,1,NULL,NULL,'iPhone 12','r8MN9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(631,1,NULL,NULL,'iPhone 12','a9dhz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(632,1,NULL,NULL,'iPhone 12','ki2RY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(633,1,NULL,NULL,'iPhone 12','wwcPN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(634,1,NULL,NULL,'iPhone 12','bTSSP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(635,1,NULL,NULL,'iPhone 12','YaPRg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(636,1,NULL,NULL,'iPhone 12','Oh9xE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(637,1,NULL,NULL,'iPhone 12','F8Uvb','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(638,1,NULL,NULL,'iPhone 12','OhoN5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(639,1,NULL,NULL,'iPhone 12','QOc6G','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(640,1,NULL,NULL,'iPhone 12','ZNAta','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(641,1,NULL,NULL,'iPhone 12','kJR57','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(642,1,NULL,NULL,'iPhone 12','Cns42','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(643,1,NULL,NULL,'iPhone 12','T0fQV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(644,1,NULL,NULL,'iPhone 12','mQvDw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(645,1,NULL,NULL,'iPhone 12','YNO5U','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(646,1,NULL,NULL,'iPhone 12','B64iJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(647,1,NULL,NULL,'iPhone 12','tRKNR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(648,1,NULL,NULL,'iPhone 12','zXbu0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(649,1,NULL,NULL,'iPhone 12','hfHux','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(650,1,NULL,NULL,'iPhone 12','mKc4x','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(651,1,NULL,NULL,'iPhone 12','ZMqq8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(652,1,NULL,NULL,'iPhone 12','2NAVi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(653,1,NULL,NULL,'iPhone 12','MlCem','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(654,1,NULL,NULL,'iPhone 12','McAZh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(655,1,NULL,NULL,'iPhone 12','zav3J','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(656,1,NULL,NULL,'iPhone 12','oXqMB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(657,1,NULL,NULL,'iPhone 12','FXfiC','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(658,1,NULL,NULL,'iPhone 12','Dw7Ci','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(659,1,NULL,NULL,'iPhone 12','u4K19','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(660,1,NULL,NULL,'iPhone 12','ADMqV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(661,1,NULL,NULL,'iPhone 12','qcHOz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(662,1,NULL,NULL,'iPhone 12','TLLoR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(663,1,NULL,NULL,'iPhone 12','US8IK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(664,1,NULL,NULL,'iPhone 12','2SibS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(665,1,NULL,NULL,'iPhone 12','nz5KP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(666,1,NULL,NULL,'iPhone 12','25rMZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(667,1,NULL,NULL,'iPhone 12','uXpuW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(668,1,NULL,NULL,'iPhone 12','lTMpJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(669,1,NULL,NULL,'iPhone 12','uwU9f','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(670,1,NULL,NULL,'iPhone 12','94jmX','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(671,1,NULL,NULL,'iPhone 12','UkDtg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(672,1,NULL,NULL,'iPhone 12','TuIc5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(673,1,NULL,NULL,'iPhone 12','8MOST','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(674,1,NULL,NULL,'iPhone 12','pkLHQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(675,1,NULL,NULL,'iPhone 12','8VLq2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(676,1,NULL,NULL,'iPhone 12','Mv1sB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(677,1,NULL,NULL,'iPhone 12','1C1II','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(678,1,NULL,NULL,'iPhone 12','RQshZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(679,1,NULL,NULL,'iPhone 12','DpDdK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(680,1,NULL,NULL,'iPhone 12','a9VpI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(681,1,NULL,NULL,'iPhone 12','8dm4c','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(682,1,NULL,NULL,'iPhone 12','wzP5y','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(683,1,NULL,NULL,'iPhone 12','R5T3O','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(684,1,NULL,NULL,'iPhone 12','bEC9j','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(685,1,NULL,NULL,'iPhone 12','gennZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(686,1,NULL,NULL,'iPhone 12','mTJog','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(687,1,NULL,NULL,'iPhone 12','NHQwH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(688,1,NULL,NULL,'iPhone 12','NstLR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(689,1,NULL,NULL,'iPhone 12','z4pmL','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(690,1,NULL,NULL,'iPhone 12','hgZDk','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(691,1,NULL,NULL,'iPhone 12','yhc4h','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(692,1,NULL,NULL,'iPhone 12','RlNIp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(693,1,NULL,NULL,'iPhone 12','SW73O','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(694,1,NULL,NULL,'iPhone 12','zeP8H','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(695,1,NULL,NULL,'iPhone 12','OoXDm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(696,1,NULL,NULL,'iPhone 12','ZJ7B3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(697,1,NULL,NULL,'iPhone 12','PXMHm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(698,1,NULL,NULL,'iPhone 12','N066L','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(699,1,NULL,NULL,'iPhone 12','vvgOD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(700,1,NULL,NULL,'iPhone 12','GAVYR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(701,1,NULL,NULL,'iPhone 12','bOWHm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(702,1,NULL,NULL,'iPhone 12','3Pnlr','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(703,1,NULL,NULL,'iPhone 12','nbBoF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(704,1,NULL,NULL,'iPhone 12','HCaTW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(705,1,NULL,NULL,'iPhone 12','9YhFy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(706,1,NULL,NULL,'iPhone 12','Unplb','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(707,1,NULL,NULL,'iPhone 12','iKMWk','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(708,1,NULL,NULL,'iPhone 12','DYalO','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(709,1,NULL,NULL,'iPhone 12','mHDL7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(710,1,NULL,NULL,'iPhone 12','PSn39','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(711,1,NULL,NULL,'iPhone 12','uItxs','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(712,1,NULL,NULL,'iPhone 12','fgu67','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(713,1,NULL,NULL,'iPhone 12','rN7dh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(714,1,NULL,NULL,'iPhone 12','kcnz2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(715,1,NULL,NULL,'iPhone 12','syurx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(716,1,NULL,NULL,'iPhone 12','iao12','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(717,1,NULL,NULL,'iPhone 12','qkthq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(718,1,NULL,NULL,'iPhone 12','sdcK7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(719,1,NULL,NULL,'iPhone 12','OAEdU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(720,1,NULL,NULL,'iPhone 12','G9uqq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(721,1,NULL,NULL,'iPhone 12','sh58A','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(722,1,NULL,NULL,'iPhone 12','9Yo4e','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(723,1,NULL,NULL,'iPhone 12','pXbCz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(724,1,NULL,NULL,'iPhone 12','z4G2I','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(725,1,NULL,NULL,'iPhone 12','QjGCT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(726,1,NULL,NULL,'iPhone 12','a4MtX','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(727,1,NULL,NULL,'iPhone 12','WzyTn','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(728,1,NULL,NULL,'iPhone 12','UWMUz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(729,1,NULL,NULL,'iPhone 12','IsolY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(730,1,NULL,NULL,'iPhone 12','1WF8o','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(731,1,NULL,NULL,'iPhone 12','TFsHX','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(732,1,NULL,NULL,'iPhone 12','r4VSy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(733,1,NULL,NULL,'iPhone 12','W8BnN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(734,1,NULL,NULL,'iPhone 12','D5n8W','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(735,1,NULL,NULL,'iPhone 12','MqZAx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(736,1,NULL,NULL,'iPhone 12','rSHXv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(737,1,NULL,NULL,'iPhone 12','VMynP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(738,1,NULL,NULL,'iPhone 12','MZbEa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(739,1,NULL,NULL,'iPhone 12','mmzUk','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(740,1,NULL,NULL,'iPhone 12','kIJdR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(741,1,NULL,NULL,'iPhone 12','tkwqS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(742,1,NULL,NULL,'iPhone 12','uqxIp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(743,1,NULL,NULL,'iPhone 12','OOdV5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(744,1,NULL,NULL,'iPhone 12','W3Tp2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(745,1,NULL,NULL,'iPhone 12','frHQ2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(746,1,NULL,NULL,'iPhone 12','Vu1Vd','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(747,1,NULL,NULL,'iPhone 12','sJXfj','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(748,1,NULL,NULL,'iPhone 12','3KLAy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(749,1,NULL,NULL,'iPhone 12','ggG00','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(750,1,NULL,NULL,'iPhone 12','3G7Aq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(751,1,NULL,NULL,'iPhone 12','mVJld','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(752,1,NULL,NULL,'iPhone 12','9URNy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(753,1,NULL,NULL,'iPhone 12','ei3I8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(754,1,NULL,NULL,'iPhone 12','ZsBmN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(755,1,NULL,NULL,'iPhone 12','zC0lB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(756,1,NULL,NULL,'iPhone 12','IIfdo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(757,1,NULL,NULL,'iPhone 12','SkXYR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(758,1,NULL,NULL,'iPhone 12','4Olhz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(759,1,NULL,NULL,'iPhone 12','Z0jWa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(760,1,NULL,NULL,'iPhone 12','JzciV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(761,1,NULL,NULL,'iPhone 12','4hRHc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(762,1,NULL,NULL,'iPhone 12','BX0eE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(763,1,NULL,NULL,'iPhone 12','RZPcA','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(764,1,NULL,NULL,'iPhone 12','0RcTE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(765,1,NULL,NULL,'iPhone 12','iBwdn','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(766,1,NULL,NULL,'iPhone 12','9y27j','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(767,1,NULL,NULL,'iPhone 12','Np75J','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(768,1,NULL,NULL,'iPhone 12','M9YMw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(769,1,NULL,NULL,'iPhone 12','GD7K1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(770,1,NULL,NULL,'iPhone 12','Srqfh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(771,1,NULL,NULL,'iPhone 12','S2Tbi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(772,1,NULL,NULL,'iPhone 12','hwMT5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(773,1,NULL,NULL,'iPhone 12','b71ED','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(774,1,NULL,NULL,'iPhone 12','NSVOy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(775,1,NULL,NULL,'iPhone 12','o4nSp','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(776,1,NULL,NULL,'iPhone 12','NUwnP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(777,1,NULL,NULL,'iPhone 12','UhLx8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(778,1,NULL,NULL,'iPhone 12','C03X8','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(779,1,NULL,NULL,'iPhone 12','BJAxe','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(780,1,NULL,NULL,'iPhone 12','GpEki','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(781,1,NULL,NULL,'iPhone 12','HGEMB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(782,1,NULL,NULL,'iPhone 12','bz7ZR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(783,1,NULL,NULL,'iPhone 12','Yx619','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(784,1,NULL,NULL,'iPhone 12','k8B5J','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(785,1,NULL,NULL,'iPhone 12','QKNRf','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(786,1,NULL,NULL,'iPhone 12','oKscT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(787,1,NULL,NULL,'iPhone 12','4kM1N','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(788,1,NULL,NULL,'iPhone 12','lLwm1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(789,1,NULL,NULL,'iPhone 12','7YeRr','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(790,1,NULL,NULL,'iPhone 12','GzyAv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(791,1,NULL,NULL,'iPhone 12','CshfV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(792,1,NULL,NULL,'iPhone 12','PuMIF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(793,1,NULL,NULL,'iPhone 12','RD0yG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(794,1,NULL,NULL,'iPhone 12','c404B','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(795,1,NULL,NULL,'iPhone 12','YZ0S1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(796,1,NULL,NULL,'iPhone 12','VLNDw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(797,1,NULL,NULL,'iPhone 12','gLNkP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(798,1,NULL,NULL,'iPhone 12','6GR0B','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(799,1,NULL,NULL,'iPhone 12','RURNt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(800,1,NULL,NULL,'iPhone 12','64g7V','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(801,1,NULL,NULL,'iPhone 12','m9Vuh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(802,1,NULL,NULL,'iPhone 12','1VuVc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(803,1,NULL,NULL,'iPhone 12','bzb7Z','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(804,1,NULL,NULL,'iPhone 12','CKL1F','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(805,1,NULL,NULL,'iPhone 12','VtNzG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(806,1,NULL,NULL,'iPhone 12','Jrv1U','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(807,1,NULL,NULL,'iPhone 12','19lFZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(808,1,NULL,NULL,'iPhone 12','Al13v','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(809,1,NULL,NULL,'iPhone 12','RyFzA','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(810,1,NULL,NULL,'iPhone 12','sq6qU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:53','2024-06-13 17:40:53'),
(811,1,NULL,NULL,'iPhone 12','RdwcJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(812,1,NULL,NULL,'iPhone 12','4ZRqx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(813,1,NULL,NULL,'iPhone 12','eeLX5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(814,1,NULL,NULL,'iPhone 12','pJNyK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(815,1,NULL,NULL,'iPhone 12','c7eVq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(816,1,NULL,NULL,'iPhone 12','rVviO','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(817,1,NULL,NULL,'iPhone 12','dChPB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(818,1,NULL,NULL,'iPhone 12','E8zYS','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(819,1,NULL,NULL,'iPhone 12','QUvjx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(820,1,NULL,NULL,'iPhone 12','MNFEa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(821,1,NULL,NULL,'iPhone 12','r1MiQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(822,1,NULL,NULL,'iPhone 12','h9HUj','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(823,1,NULL,NULL,'iPhone 12','0X8DP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(824,1,NULL,NULL,'iPhone 12','8vgmE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(825,1,NULL,NULL,'iPhone 12','uJMCE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(826,1,NULL,NULL,'iPhone 12','ZJr4u','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(827,1,NULL,NULL,'iPhone 12','f1F94','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(828,1,NULL,NULL,'iPhone 12','Aab4W','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(829,1,NULL,NULL,'iPhone 12','X8EM1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(830,1,NULL,NULL,'iPhone 12','WwoQs','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(831,1,NULL,NULL,'iPhone 12','pJu27','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(832,1,NULL,NULL,'iPhone 12','KyaPm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(833,1,NULL,NULL,'iPhone 12','coZ5g','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(834,1,NULL,NULL,'iPhone 12','UBkFg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(835,1,NULL,NULL,'iPhone 12','37MBu','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(836,1,NULL,NULL,'iPhone 12','Tc6xY','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(837,1,NULL,NULL,'iPhone 12','OaEF4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(838,1,NULL,NULL,'iPhone 12','8C4Di','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(839,1,NULL,NULL,'iPhone 12','Hd5gx','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(840,1,NULL,NULL,'iPhone 12','2uUvG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(841,1,NULL,NULL,'iPhone 12','w7Anh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(842,1,NULL,NULL,'iPhone 12','xuvXT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(843,1,NULL,NULL,'iPhone 12','vZUZv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(844,1,NULL,NULL,'iPhone 12','2i7NR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(845,1,NULL,NULL,'iPhone 12','K2Kaz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(846,1,NULL,NULL,'iPhone 12','8FGYU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(847,1,NULL,NULL,'iPhone 12','HrFQH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(848,1,NULL,NULL,'iPhone 12','IqrBP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(849,1,NULL,NULL,'iPhone 12','qgUWh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(850,1,NULL,NULL,'iPhone 12','KQVAo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(851,1,NULL,NULL,'iPhone 12','mUolv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(852,1,NULL,NULL,'iPhone 12','ThKYj','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(853,1,NULL,NULL,'iPhone 12','6ox4T','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(854,1,NULL,NULL,'iPhone 12','cBGZi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(855,1,NULL,NULL,'iPhone 12','HwLgT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(856,1,NULL,NULL,'iPhone 12','ZDkAE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(857,1,NULL,NULL,'iPhone 12','74Eee','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(858,1,NULL,NULL,'iPhone 12','iMFGG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(859,1,NULL,NULL,'iPhone 12','SR1Po','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(860,1,NULL,NULL,'iPhone 12','CtVTy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(861,1,NULL,NULL,'iPhone 12','rOK7t','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(862,1,NULL,NULL,'iPhone 12','OmPBj','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(863,1,NULL,NULL,'iPhone 12','ybggt','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(864,1,NULL,NULL,'iPhone 12','0Jy8N','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(865,1,NULL,NULL,'iPhone 12','BDGDG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(866,1,NULL,NULL,'iPhone 12','G1WUy','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(867,1,NULL,NULL,'iPhone 12','RBOfF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(868,1,NULL,NULL,'iPhone 12','RWLix','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(869,1,NULL,NULL,'iPhone 12','tk1LV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(870,1,NULL,NULL,'iPhone 12','OgsEM','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(871,1,NULL,NULL,'iPhone 12','AnEXz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(872,1,NULL,NULL,'iPhone 12','tQdSo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(873,1,NULL,NULL,'iPhone 12','hevgn','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(874,1,NULL,NULL,'iPhone 12','qGC5T','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(875,1,NULL,NULL,'iPhone 12','mIqFX','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(876,1,NULL,NULL,'iPhone 12','dpXn7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(877,1,NULL,NULL,'iPhone 12','dYAsF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(878,1,NULL,NULL,'iPhone 12','iR4kF','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(879,1,NULL,NULL,'iPhone 12','Pn9wU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(880,1,NULL,NULL,'iPhone 12','GO70B','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(881,1,NULL,NULL,'iPhone 12','aVoNf','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(882,1,NULL,NULL,'iPhone 12','653eG','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(883,1,NULL,NULL,'iPhone 12','M69DU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(884,1,NULL,NULL,'iPhone 12','h2oyU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(885,1,NULL,NULL,'iPhone 12','75Xpv','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(886,1,NULL,NULL,'iPhone 12','kUlVz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(887,1,NULL,NULL,'iPhone 12','nLN26','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(888,1,NULL,NULL,'iPhone 12','DYPNU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(889,1,NULL,NULL,'iPhone 12','BYKSD','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(890,1,NULL,NULL,'iPhone 12','mj6P3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(891,1,NULL,NULL,'iPhone 12','m280n','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(892,1,NULL,NULL,'iPhone 12','icdrB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(893,1,NULL,NULL,'iPhone 12','1HwC5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(894,1,NULL,NULL,'iPhone 12','768ZH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(895,1,NULL,NULL,'iPhone 12','PpLr7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(896,1,NULL,NULL,'iPhone 12','uxlWZ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(897,1,NULL,NULL,'iPhone 12','45rey','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(898,1,NULL,NULL,'iPhone 12','FFUW9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(899,1,NULL,NULL,'iPhone 12','H1lxE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(900,1,NULL,NULL,'iPhone 12','b1NX6','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(901,1,NULL,NULL,'iPhone 12','C8YHm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(902,1,NULL,NULL,'iPhone 12','MKdog','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(903,1,NULL,NULL,'iPhone 12','hTIHI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(904,1,NULL,NULL,'iPhone 12','6iiUJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(905,1,NULL,NULL,'iPhone 12','6BBVI','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(906,1,NULL,NULL,'iPhone 12','Nf5rd','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(907,1,NULL,NULL,'iPhone 12','vvzPc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(908,1,NULL,NULL,'iPhone 12','3vReK','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(909,1,NULL,NULL,'iPhone 12','835Wq','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(910,1,NULL,NULL,'iPhone 12','CkcYl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(911,1,NULL,NULL,'iPhone 12','fKu7j','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(912,1,NULL,NULL,'iPhone 12','lFu0D','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(913,1,NULL,NULL,'iPhone 12','atroP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(914,1,NULL,NULL,'iPhone 12','Mclz5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(915,1,NULL,NULL,'iPhone 12','HvEJm','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(916,1,NULL,NULL,'iPhone 12','2DkLP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(917,1,NULL,NULL,'iPhone 12','2HQSs','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(918,1,NULL,NULL,'iPhone 12','nvWkJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(919,1,NULL,NULL,'iPhone 12','w9Yzl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(920,1,NULL,NULL,'iPhone 12','xFWcB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(921,1,NULL,NULL,'iPhone 12','fvxrT','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(922,1,NULL,NULL,'iPhone 12','V2fWn','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(923,1,NULL,NULL,'iPhone 12','e33cA','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(924,1,NULL,NULL,'iPhone 12','YbkQE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(925,1,NULL,NULL,'iPhone 12','BgoYo','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(926,1,NULL,NULL,'iPhone 12','D1InV','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(927,1,NULL,NULL,'iPhone 12','JGqs5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(928,1,NULL,NULL,'iPhone 12','eE7Ce','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(929,1,NULL,NULL,'iPhone 12','lTHgW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(930,1,NULL,NULL,'iPhone 12','jwpBR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(931,1,NULL,NULL,'iPhone 12','GH5l3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(932,1,NULL,NULL,'iPhone 12','koe0K','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(933,1,NULL,NULL,'iPhone 12','cgPR3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(934,1,NULL,NULL,'iPhone 12','GaT32','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(935,1,NULL,NULL,'iPhone 12','riX89','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(936,1,NULL,NULL,'iPhone 12','i1olb','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(937,1,NULL,NULL,'iPhone 12','SXDE0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(938,1,NULL,NULL,'iPhone 12','V0h2v','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(939,1,NULL,NULL,'iPhone 12','NhKG2','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(940,1,NULL,NULL,'iPhone 12','XsBBl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(941,1,NULL,NULL,'iPhone 12','ErIwQ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(942,1,NULL,NULL,'iPhone 12','uRCv9','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(943,1,NULL,NULL,'iPhone 12','iSNHl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(944,1,NULL,NULL,'iPhone 12','BT9bR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(945,1,NULL,NULL,'iPhone 12','75ctw','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(946,1,NULL,NULL,'iPhone 12','t2vxM','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(947,1,NULL,NULL,'iPhone 12','1lG32','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(948,1,NULL,NULL,'iPhone 12','4KWV3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(949,1,NULL,NULL,'iPhone 12','Wf39K','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(950,1,NULL,NULL,'iPhone 12','HKNa4','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(951,1,NULL,NULL,'iPhone 12','7n2GR','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(952,1,NULL,NULL,'iPhone 12','fAQyz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(953,1,NULL,NULL,'iPhone 12','jM8ML','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(954,1,NULL,NULL,'iPhone 12','erKSi','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(955,1,NULL,NULL,'iPhone 12','E4k35','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(956,1,NULL,NULL,'iPhone 12','Pzf35','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(957,1,NULL,NULL,'iPhone 12','sDIpg','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(958,1,NULL,NULL,'iPhone 12','R6JcA','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(959,1,NULL,NULL,'iPhone 12','puGnW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(960,1,NULL,NULL,'iPhone 12','MYw5j','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(961,1,NULL,NULL,'iPhone 12','11oTH','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(962,1,NULL,NULL,'iPhone 12','twN52','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(963,1,NULL,NULL,'iPhone 12','VvG1e','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(964,1,NULL,NULL,'iPhone 12','B3RWB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(965,1,NULL,NULL,'iPhone 12','lrHSL','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(966,1,NULL,NULL,'iPhone 12','loNNl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(967,1,NULL,NULL,'iPhone 12','UTsgh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(968,1,NULL,NULL,'iPhone 12','9bFWc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(969,1,NULL,NULL,'iPhone 12','zrKDc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(970,1,NULL,NULL,'iPhone 12','vBwHW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(971,1,NULL,NULL,'iPhone 12','8KMj7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(972,1,NULL,NULL,'iPhone 12','7k4mP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(973,1,NULL,NULL,'iPhone 12','qpfW3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(974,1,NULL,NULL,'iPhone 12','cKKnJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(975,1,NULL,NULL,'iPhone 12','Tixfa','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(976,1,NULL,NULL,'iPhone 12','zPoU5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(977,1,NULL,NULL,'iPhone 12','65cJl','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(978,1,NULL,NULL,'iPhone 12','GuM8T','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(979,1,NULL,NULL,'iPhone 12','mAAsB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(980,1,NULL,NULL,'iPhone 12','zp3Z1','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(981,1,NULL,NULL,'iPhone 12','p8c2M','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(982,1,NULL,NULL,'iPhone 12','4jsdW','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(983,1,NULL,NULL,'iPhone 12','Cwm6z','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(984,1,NULL,NULL,'iPhone 12','KW8mO','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(985,1,NULL,NULL,'iPhone 12','lmOJP','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(986,1,NULL,NULL,'iPhone 12','CBIXN','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(987,1,NULL,NULL,'iPhone 12','aeDgB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(988,1,NULL,NULL,'iPhone 12','6ASA5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(989,1,NULL,NULL,'iPhone 12','eqok5','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(990,1,NULL,NULL,'iPhone 12','mKdY3','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(991,1,NULL,NULL,'iPhone 12','xpXh7','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(992,1,NULL,NULL,'iPhone 12','2VuLh','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(993,1,NULL,NULL,'iPhone 12','eIf57','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(994,1,NULL,NULL,'iPhone 12','6VEoB','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(995,1,NULL,NULL,'iPhone 12','9mutc','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(996,1,NULL,NULL,'iPhone 12','Nnlb0','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(997,1,NULL,NULL,'iPhone 12','pSKVE','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(998,1,NULL,NULL,'iPhone 12','EG5FU','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(999,1,NULL,NULL,'iPhone 12','rORUJ','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54'),
(1000,1,NULL,NULL,'iPhone 12','t5ZYz','C39',10,1000,1000,'pcs',10,0,'iPhone 12',1,0,'https://www.apple.com/v/iphone/home/ah/images/overview/compare/compare_iphone_12__f2x.png','2024-06-13 17:40:54','2024-06-13 17:40:54');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  KEY `purchase_details_product_id_foreign` (`product_id`),
  CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_details`
--

/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;

--
-- Table structure for table `purchase_payments`
--

DROP TABLE IF EXISTS `purchase_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_payments_purchase_id_foreign` (`purchase_id`),
  CONSTRAINT `purchase_payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_payments`
--

/*!40000 ALTER TABLE `purchase_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_payments` ENABLE KEYS */;

--
-- Table structure for table `purchase_return_details`
--

DROP TABLE IF EXISTS `purchase_return_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_return_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_return_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_return_details_purchase_return_id_foreign` (`purchase_return_id`),
  KEY `purchase_return_details_product_id_foreign` (`product_id`),
  CONSTRAINT `purchase_return_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_return_details_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_return_details`
--

/*!40000 ALTER TABLE `purchase_return_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_return_details` ENABLE KEYS */;

--
-- Table structure for table `purchase_return_payments`
--

DROP TABLE IF EXISTS `purchase_return_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_return_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_return_id` bigint(20) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_return_payments_purchase_return_id_foreign` (`purchase_return_id`),
  CONSTRAINT `purchase_return_payments_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_return_payments`
--

/*!40000 ALTER TABLE `purchase_return_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_return_payments` ENABLE KEYS */;

--
-- Table structure for table `purchase_returns`
--

DROP TABLE IF EXISTS `purchase_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_returns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_returns_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `purchase_returns_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_returns`
--

/*!40000 ALTER TABLE `purchase_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_returns` ENABLE KEYS */;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;

--
-- Table structure for table `quotation_details`
--

DROP TABLE IF EXISTS `quotation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotation_details_quotation_id_foreign` (`quotation_id`),
  KEY `quotation_details_product_id_foreign` (`product_id`),
  CONSTRAINT `quotation_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `quotation_details_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation_details`
--

/*!40000 ALTER TABLE `quotation_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotation_details` ENABLE KEYS */;

--
-- Table structure for table `quotations`
--

DROP TABLE IF EXISTS `quotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotations_customer_id_foreign` (`customer_id`),
  CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotations`
--

/*!40000 ALTER TABLE `quotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotations` ENABLE KEYS */;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_user_id` (`user_id`),
  KEY `role_user_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES
(1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'Super Admin','web','2024-06-13 17:40:51','2024-06-13 17:40:51');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

--
-- Table structure for table `sale_details`
--

DROP TABLE IF EXISTS `sale_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_details_sale_id_foreign` (`sale_id`),
  KEY `sale_details_product_id_foreign` (`product_id`),
  CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_details`
--

/*!40000 ALTER TABLE `sale_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_details` ENABLE KEYS */;

--
-- Table structure for table `sale_payments`
--

DROP TABLE IF EXISTS `sale_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_payments_sale_id_foreign` (`sale_id`),
  CONSTRAINT `sale_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_payments`
--

/*!40000 ALTER TABLE `sale_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_payments` ENABLE KEYS */;

--
-- Table structure for table `sale_return_details`
--

DROP TABLE IF EXISTS `sale_return_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_return_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_return_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_return_details_sale_return_id_foreign` (`sale_return_id`),
  KEY `sale_return_details_product_id_foreign` (`product_id`),
  CONSTRAINT `sale_return_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sale_return_details_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_return_details`
--

/*!40000 ALTER TABLE `sale_return_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_return_details` ENABLE KEYS */;

--
-- Table structure for table `sale_return_payments`
--

DROP TABLE IF EXISTS `sale_return_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_return_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_return_id` bigint(20) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_return_payments_sale_return_id_foreign` (`sale_return_id`),
  CONSTRAINT `sale_return_payments_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_return_payments`
--

/*!40000 ALTER TABLE `sale_return_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_return_payments` ENABLE KEYS */;

--
-- Table structure for table `sale_returns`
--

DROP TABLE IF EXISTS `sale_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_returns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_returns_customer_id_foreign` (`customer_id`),
  CONSTRAINT `sale_returns_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_returns`
--

/*!40000 ALTER TABLE `sale_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_returns` ENABLE KEYS */;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `shipping_status` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_customer_id_foreign` (`customer_id`),
  CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `company_phone` varchar(255) NOT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `default_currency_id` int(11) NOT NULL,
  `default_currency_position` varchar(255) NOT NULL,
  `notification_email` varchar(255) NOT NULL,
  `footer_text` text NOT NULL,
  `company_address` text NOT NULL,
  `default_client_id` int(11) DEFAULT NULL,
  `default_warehouse_id` int(11) DEFAULT NULL,
  `default_language` varchar(192) NOT NULL DEFAULT 'fr',
  `is_invoice_footer` tinyint(1) NOT NULL DEFAULT 0,
  `invoice_footer` varchar(192) DEFAULT NULL,
  `company_tax` varchar(192) DEFAULT NULL,
  `is_rtl` tinyint(1) NOT NULL DEFAULT 1,
  `sale_prefix` varchar(25) NOT NULL DEFAULT 'SA-',
  `purchase_prefix` varchar(25) NOT NULL DEFAULT 'PR-',
  `quotation_prefix` varchar(25) NOT NULL DEFAULT 'DE-',
  `salepayment_prefix` varchar(25) NOT NULL DEFAULT 'SP-',
  `purchasepayment_prefix` varchar(25) NOT NULL DEFAULT 'PR-',
  `show_email` tinyint(1) NOT NULL DEFAULT 1,
  `show_address` tinyint(1) NOT NULL DEFAULT 1,
  `show_order_tax` tinyint(1) NOT NULL DEFAULT 1,
  `show_discount` tinyint(1) NOT NULL DEFAULT 1,
  `show_shipping` tinyint(1) NOT NULL DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `woocommerce_store_url` varchar(255) DEFAULT NULL,
  `woocommerce_api_key` varchar(255) DEFAULT NULL,
  `woocommerce_api_secret` varchar(255) DEFAULT NULL,
  `shopify_store_url` varchar(255) DEFAULT NULL,
  `shopify_api_key` varchar(255) DEFAULT NULL,
  `shopify_api_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
(1,'Mystock','contact@hotech.ma','212 5 22 22 22 22','logo.png',1,'left','1','Mystock is a free open source stock management system','Rue 1, Casablanca, Maroc',1,1,'fr',1,'Thank you for your business','0',1,'SA-','PR-','DE-','SP-','PR-',1,1,1,1,1,'browser',NULL,'2024-06-13 17:40:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(192) NOT NULL,
  `email` varchar(192) DEFAULT NULL,
  `phone` varchar(192) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `tax_number` varchar(192) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `folder` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;

--
-- Table structure for table `user_warehouse`
--

DROP TABLE IF EXISTS `user_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_warehouse` (
  `user_id` bigint(20) unsigned NOT NULL,
  `warehouse_id` bigint(20) unsigned NOT NULL,
  KEY `user_warehouse_user_id` (`user_id`),
  KEY `user_warehouse_warehouse_id` (`warehouse_id`),
  CONSTRAINT `user_warehouse_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_warehouse_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_warehouse`
--

/*!40000 ALTER TABLE `user_warehouse` DISABLE KEYS */;
INSERT INTO `user_warehouse` VALUES
(1,1),
(1,2);
/*!40000 ALTER TABLE `user_warehouse` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(192) NOT NULL,
  `email` varchar(192) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(192) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_all_warehouses` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_id` int(11) DEFAULT NULL,
  `default_client_id` int(11) DEFAULT NULL,
  `default_warehouse_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Admin','admin@gmail.com','$2y$10$hJlXl8Nc0NjSMijk/PtiXul.hgdO004xpl8gSnbG7N9wbbAZeRcpm','avatar.png','0123456789',1,1,1,NULL,NULL,NULL,NULL,NULL,'2024-06-13 17:40:51','2024-06-13 17:40:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recieved_amount` varchar(192) DEFAULT NULL,
  `sent_amount` varchar(192) DEFAULT NULL,
  `balance` varchar(192) DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_user_id_foreign` (`user_id`),
  KEY `wallets_customer_id_foreign` (`customer_id`),
  KEY `wallets_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `wallets_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `wallets_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(192) NOT NULL,
  `city` varchar(192) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(192) DEFAULT NULL,
  `email` varchar(192) DEFAULT NULL,
  `country` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES
(1,'default','casablanca',NULL,'061234567896','default@casa.ma','morocco','2024-06-13 17:40:54.000000','2024-06-13 17:40:54.000000',NULL),
(2,'secend','casablanca',NULL,'061234567898','secend@casa.ma','morocco','2024-06-13 17:40:54.000000','2024-06-13 17:40:54.000000',NULL);
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;

--
-- Dumping routines for database 'laravel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-13 17:46:50
