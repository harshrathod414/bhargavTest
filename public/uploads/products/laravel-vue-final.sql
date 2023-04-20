-- phpMyAdmin SQL Dump
-- version 5.2.1deb1+jammy2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2023 at 07:00 PM
-- Server version: 8.0.32-0ubuntu0.22.04.2
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-vue-final`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `slug`, `name`, `short_description`, `created_at`, `updated_at`) VALUES
(17, 'size', 'Size', NULL, '2023-03-16 07:34:38', '2023-03-16 07:34:38'),
(18, 'color', 'Color', NULL, '2023-03-20 01:40:51', '2023-03-20 01:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_terms`
--

CREATE TABLE `attribute_terms` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `short_description` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_terms`
--

INSERT INTO `attribute_terms` (`id`, `slug`, `name`, `attribute_id`, `short_description`, `created_at`, `updated_at`) VALUES
(28, 'small', 'Small', 17, NULL, '2023-03-17 06:18:08', '2023-03-17 06:18:08'),
(29, 'red', 'Red', 18, NULL, '2023-03-20 01:41:49', '2023-03-20 01:41:49'),
(30, 'blue', 'Blue', 18, NULL, '2023-03-20 01:41:54', '2023-03-20 01:41:54'),
(31, 'medium', 'Medium', 17, NULL, '2023-03-20 01:42:14', '2023-03-20 01:42:14'),
(33, 'large', 'Large\r\n', 17, NULL, '2023-03-17 06:18:08', '2023-03-17 06:18:08'),
(34, 'orange', 'Orange', 18, NULL, '2023-03-28 14:08:02', '2023-03-28 14:08:02');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_term_product`
--

CREATE TABLE `attribute_term_product` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_term_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_term_variant`
--

CREATE TABLE `attribute_term_variant` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_term_id` bigint UNSIGNED NOT NULL,
  `variant_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_term_variant`
--

INSERT INTO `attribute_term_variant` (`id`, `attribute_term_id`, `variant_id`, `created_at`, `updated_at`) VALUES
(22, 28, 14, '2023-04-13 12:41:23', '2023-04-13 12:41:23'),
(23, 29, 14, '2023-04-13 12:41:23', '2023-04-13 12:41:23'),
(24, 34, 15, '2023-04-13 12:50:39', '2023-04-13 12:50:39'),
(25, 28, 15, '2023-04-13 12:50:39', '2023-04-13 12:50:39'),
(26, 34, 16, '2023-04-13 12:50:59', '2023-04-13 12:50:59'),
(27, 33, 16, '2023-04-13 12:50:59', '2023-04-13 12:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `brand_image` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `parent_id`, `description`, `brand_image`, `created_at`, `updated_at`) VALUES
(19, 'dfg', 'dfg', NULL, NULL, NULL, '2023-03-16 08:14:09', '2023-03-16 08:14:09'),
(20, 'l;lk;', 'l-lk-', NULL, NULL, NULL, '2023-03-23 00:38:46', '2023-03-23 00:38:46'),
(21, 'sdf', 'sdf', NULL, 'sdfsf', NULL, '2023-03-23 00:38:59', '2023-03-23 00:38:59');

-- --------------------------------------------------------

--
-- Table structure for table `brand_product`
--

CREATE TABLE `brand_product` (
  `id` bigint UNSIGNED NOT NULL,
  `brand_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_product`
--

INSERT INTO `brand_product` (`id`, `brand_id`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 19, 21, '2023-04-05 13:29:51', '2023-04-05 13:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `guest_id`, `user_id`, `created_at`, `updated_at`) VALUES
('bd3cdefd-889b-4016-9f14-7b0c609a6df4', NULL, 1, '2023-04-13 07:47:18', '2023-04-13 07:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `variant_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `variant_id`, `image`, `quantity`, `created_at`, `updated_at`) VALUES
(160, 'bd3cdefd-889b-4016-9f14-7b0c609a6df4', 21, 14, 'product-image-product-1680701391.png', 1, '2023-04-13 07:47:19', '2023-04-13 07:47:19'),
(161, 'bd3cdefd-889b-4016-9f14-7b0c609a6df4', 22, 15, 'product-image-test-1680701460.png', 1, '2023-04-13 07:47:36', '2023-04-13 07:47:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `description`, `parent_id`, `created_at`, `updated_at`, `category_image`) VALUES
(66, 'dfgfdg', 'dfg', 'dfg', NULL, '2023-03-16 06:39:33', '2023-03-17 00:39:41', 'category-image-dfg-1679033381.jpg'),
(67, 'asdf', 'sdf', 'sdf', 66, '2023-03-23 00:23:59', '2023-03-23 00:23:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(6, 67, 21, '2023-04-05 13:29:51', '2023-04-05 13:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_status` tinyint NOT NULL COMMENT '0 = ACTIVE, 1 = INACTIVE',
  `discount_type` tinyint NOT NULL COMMENT '1 = Free Dis and 2 = Percentage Dis and 3 = Flat Dis',
  `discount_value` decimal(11,2) NOT NULL,
  `allow_free_shipping` tinyint NOT NULL COMMENT '0 = NO, 1 = YES',
  `maximum_spend` decimal(11,2) NOT NULL,
  `minimum_spend` decimal(11,2) NOT NULL,
  `usage_limt_coupon` int DEFAULT NULL,
  `usage_limit_user` int DEFAULT NULL,
  `specific_categories` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specific_product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` tinyint NOT NULL COMMENT '1 = All Users, 2 = New Users, 3 = Old Users, 4 = Specific Users	',
  `product_categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_used_no` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_user`
--

CREATE TABLE `coupon_user` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_15_074150_create_permission_tables', 2),
(6, '2023_02_15_111143_create_posts_table', 3),
(7, '2023_02_22_093126_create_products_table', 4),
(8, '2023_02_22_093901_create_variants_table', 5),
(9, '2023_02_22_093126_create_products_tables', 6),
(10, '2023_02_22_093901_create_variants_tables', 6),
(11, '2023_02_23_055059_create_categories_table', 7),
(13, '2023_02_23_093126_create_products_tables', 8),
(14, '2023_02_23_093123_create_products_tables', 9),
(15, '2023_02_23_071118_create_carts_table', 10),
(16, '2023_02_23_071114_create_carts_table', 11),
(17, '2023_02_24_130634_create_gcarts_table', 11),
(19, '2023_02_27_071114_create_carts_table', 12),
(20, '2023_02_27_132351_create_options_table', 13),
(21, '2023_02_28_113940_create_orders_table', 14),
(22, '2023_02_28_113959_create_order_items_table', 15),
(23, '2023_02_28_071114_create_carts_table', 16),
(25, '2023_02_28_122025_create_cart_items_table', 17),
(26, '2023_03_01_093830_create_attributes_table', 18),
(27, '2023_03_01_094313_create_attribute_terms_table', 18),
(28, '2023_03_01_101005_create_attribute_term_product_table', 19),
(29, '2023_03_01_101022_create_attribute_term_variant_table', 19),
(30, '2023_02_23_055525_create_variants_table', 19),
(31, '2023_03_13_061829_create_category_product', 20),
(32, '2023_03_13_061724_create_brands_table', 21),
(33, '2023_03_13_061854_create_brand_product', 22),
(34, '2023_03_13_063025_create_tags_table', 22),
(35, '2023_03_13_063052_create_product_tag', 23),
(36, '2023_03_13_063809_create_coupons_table', 24),
(37, '2023_03_13_065306_create_coupon_user', 25);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint UNSIGNED NOT NULL,
  `option_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `option_key`, `option_value`, `created_at`, `updated_at`) VALUES
(1, 'shipping_charge', '10', '2023-02-27 13:26:18', '2023-02-27 13:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_charge` decimal(11,2) DEFAULT NULL,
  `total_amount` decimal(11,2) NOT NULL,
  `order_status` tinyint NOT NULL COMMENT '0 = PENDING, 1 = PROCESSING, 2 = ON HOLD, 3 = COMPLETED, 4 = CANCELLED, 5 = FAILED, 6 = DRAFT',
  `billing_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_street_address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_street_address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_pincode` int NOT NULL,
  `shipping_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_street_address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_street_address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_pincode` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `shipping_charge`, `total_amount`, `order_status`, `billing_first_name`, `billing_last_name`, `billing_company_name`, `billing_street_address_line_1`, `billing_street_address_line_2`, `billing_city`, `billing_state`, `billing_country`, `billing_pincode`, `shipping_first_name`, `shipping_last_name`, `shipping_company_name`, `shipping_street_address_line_1`, `shipping_street_address_line_2`, `shipping_city`, `shipping_state`, `shipping_country`, `shipping_pincode`, `email`, `phone_no`, `created_at`, `updated_at`) VALUES
(6, 1, 10.00, 69.00, 2, 'admin', 'admin', NULL, 'sdfdsfsf', NULL, 'city', 'state', 'United States', 121212, 'admin', 'admin', NULL, 'sdfdsfsf', NULL, 'city', 'state', 'United States', 121212, 'admin@admin.com', '1231231231', '2023-03-03 01:25:53', '2023-03-07 13:17:27'),
(7, 1, 10.00, 252.00, 5, 'admin', 'test', NULL, 'test', NULL, 'asd', 'fdf', 'United States', 323232, 'admin', 'test', NULL, 'test', NULL, 'asd', 'fdf', 'United States', 323232, 'admin@admin.com', '1212121212', '2023-03-07 00:39:55', '2023-03-07 13:17:25'),
(8, 1, 10.00, 115.00, 4, 'admin', 'trsd', NULL, 'fsdfsdf', NULL, 'sdfdsf', 'df', 'United States', 32423, 'admin', 'trsd', NULL, 'fsdfsdf', NULL, 'sdfdsf', 'df', 'United States', 32423, 'admin@admin.com', '1231231231', '2023-03-07 02:17:53', '2023-03-07 13:17:21'),
(9, 1, 10.00, 171.00, 3, 'admin', 'admin', NULL, '1234', NULL, 'city', 'state', 'United States', 123123, 'admin', 'admin', NULL, '1234', NULL, 'city', 'state', 'United States', 123123, 'admin@admin.com', '1312312312', '2023-03-07 06:20:48', '2023-03-07 06:20:48'),
(10, 1, 10.00, 704.00, 3, 'admin', 'test', NULL, '123', NULL, 'ahmedabad', 'state', 'United States', 12312, 'admin', 'test', NULL, '123', NULL, 'ahmedabad', 'state', 'United States', 12312, 'admin@admin.com', '1231231311', '2023-03-07 07:27:47', '2023-03-07 07:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `variant_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` bigint NOT NULL,
  `unit_amount` decimal(11,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `variant_id`, `quantity`, `unit_amount`, `created_at`, `updated_at`) VALUES
(4, 6, NULL, NULL, 3, 23.00, '2023-03-03 01:25:53', '2023-03-03 01:25:53'),
(5, 7, NULL, NULL, 6, 42.00, '2023-03-07 00:39:55', '2023-03-07 00:39:55'),
(6, 8, NULL, NULL, 5, 23.00, '2023-03-07 02:17:53', '2023-03-07 02:17:53'),
(7, 9, NULL, NULL, 3, 23.00, '2023-03-07 06:20:48', '2023-03-07 06:20:48'),
(8, 9, NULL, NULL, 3, 34.00, '2023-03-07 06:20:49', '2023-03-07 06:20:49'),
(9, 10, NULL, NULL, 2, 320.00, '2023-03-07 07:27:47', '2023-03-07 07:27:47'),
(10, 10, NULL, NULL, 2, 32.00, '2023-03-07 07:27:47', '2023-03-07 07:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(34, 'show_dashboard', 'web', '2022-12-27 05:53:54', '2022-12-27 05:53:54'),
(35, 'add_user', 'web', '2022-12-27 05:53:54', '2022-12-27 05:53:54'),
(36, 'edit_user', 'web', '2022-12-27 05:53:54', '2022-12-27 05:53:54'),
(37, 'delete_user', 'web', '2022-12-27 05:53:54', '2022-12-27 05:53:54'),
(38, 'show_user', 'web', '2022-12-27 05:53:55', '2022-12-27 05:53:55'),
(39, 'add_role', 'web', '2022-12-27 05:53:55', '2022-12-27 05:53:55'),
(40, 'edit_role', 'web', '2022-12-27 05:53:55', '2022-12-27 05:53:55'),
(41, 'delete_role', 'web', '2022-12-27 05:53:55', '2022-12-27 05:53:55'),
(42, 'show_role', 'web', '2022-12-27 05:53:55', '2022-12-27 05:53:55'),
(43, 'add_permission', 'web', '2022-12-27 05:53:55', '2022-12-27 05:53:55'),
(44, 'edit_permission', 'web', '2022-12-27 05:53:55', '2022-12-27 05:53:55'),
(45, 'delete_permission', 'web', '2022-12-27 05:53:55', '2022-12-27 05:53:55'),
(46, 'show_permission', 'web', '2022-12-27 05:53:55', '2022-12-27 05:53:55'),
(47, 'add_product', 'web', '2022-12-27 05:53:56', '2022-12-27 05:53:56'),
(48, 'edit_product', 'web', '2022-12-27 05:53:56', '2022-12-27 05:53:56'),
(49, 'delete_product', 'web', '2022-12-27 05:53:56', '2022-12-27 05:53:56'),
(50, 'show_product', 'web', '2022-12-27 05:53:56', '2022-12-27 05:53:56'),
(51, 'add_order', 'web', '2022-12-27 05:53:56', '2022-12-27 05:53:56'),
(52, 'edit_order', 'web', '2022-12-27 05:53:56', '2022-12-27 05:53:56'),
(53, 'delete_order', 'web', '2022-12-27 05:53:56', '2022-12-27 05:53:56'),
(54, 'show_order', 'web', '2022-12-27 05:53:56', '2022-12-27 05:53:56'),
(55, 'cancel_order', 'web', '2022-12-27 05:53:56', '2022-12-27 05:53:56'),
(56, 'show_taxonomy', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(57, 'edit_taxonomy', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(58, 'delete_taxonomy', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(59, 'add_attribute', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(60, 'edit_attribute', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(61, 'delete_attribute', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(62, 'show_attribute', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(63, 'show_taxonomy_attribute', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(64, 'edit_taxonomy__attribute', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(65, 'delete_taxonomy__attribute', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(66, 'show_taxonomy__attribute', 'web', '2022-12-27 05:53:57', '2022-12-27 05:53:57'),
(67, 'show_home', 'web', NULL, NULL),
(69, 'add_category', 'web', '2022-12-27 06:14:26', '2022-12-27 06:14:26'),
(70, 'edit_category', 'web', '2022-12-27 06:14:26', '2022-12-27 06:14:26'),
(71, 'delete_category', 'web', '2022-12-27 06:14:26', '2022-12-27 06:14:26'),
(72, 'show_category', 'web', '2022-12-27 06:14:26', '2022-12-27 06:14:26'),
(73, 'add_brand', 'web', '2022-12-27 06:14:26', '2022-12-27 06:14:26'),
(74, 'edit_brand', 'web', '2022-12-27 06:14:27', '2022-12-27 06:14:27'),
(75, 'delete_brand', 'web', '2022-12-27 06:14:27', '2022-12-27 06:14:27'),
(76, 'show_brand', 'web', '2022-12-27 06:14:27', '2022-12-27 06:14:27'),
(77, 'show_cart', 'web', '2022-12-28 00:46:08', '2022-12-28 00:46:08'),
(78, 'add_cart', 'web', '2022-12-28 01:19:54', '2022-12-28 01:19:54'),
(79, 'edit_cart', 'web', '2022-12-28 01:21:14', '2022-12-28 01:21:14'),
(80, 'delete_cart', 'web', '2022-12-28 01:21:19', '2022-12-28 01:21:19'),
(81, 'buy_now', 'web', '2022-12-28 01:28:51', '2022-12-28 01:28:51'),
(82, 'add_tag', 'web', '2022-12-28 01:46:58', '2022-12-28 01:46:58'),
(83, 'edit_tag', 'web', '2022-12-28 01:46:58', '2022-12-28 01:46:58'),
(84, 'delete_tag', 'web', '2022-12-28 01:46:58', '2022-12-28 01:46:58'),
(85, 'show_tag', 'web', '2022-12-28 01:46:58', '2022-12-28 01:46:58'),
(86, 'edit_attribute_value', 'web', '2022-12-28 02:04:15', '2022-12-28 02:04:15'),
(87, 'delete_attribute_value', 'web', '2022-12-28 02:04:15', '2022-12-28 02:04:15'),
(88, 'show_attribute_value', 'web', '2022-12-28 02:04:16', '2022-12-28 02:04:16'),
(89, 'add_attribute_value', 'web', '2022-12-28 02:04:16', '2022-12-28 02:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', '95b202ebdacd7c806b2a560b0bfc0a50cd3f32d43f84ca83afb4560acd1a895d', '[\"*\"]', NULL, NULL, '2023-02-15 06:11:52', '2023-02-15 06:11:52'),
(2, 'App\\Models\\User', 1, 'MyApp', '9c230a479336ec6789b3cd72bb6939d4f523baa5bf1b3b7315cefc19025aeef0', '[\"*\"]', NULL, NULL, '2023-02-15 06:34:45', '2023-02-15 06:34:45'),
(3, 'App\\Models\\User', 1, 'MyApp', '8d8f2531a4925fa1e3c80ee6b30e742750c3bc4d3dc7b882a433eecdf82d31d4', '[\"*\"]', NULL, NULL, '2023-02-15 06:41:31', '2023-02-15 06:41:31'),
(4, 'App\\Models\\User', 1, 'MyApp', '57aaf43ea2d0eb6611ef39cc5d356c307539769328f4ea0aa776271d7c806558', '[\"*\"]', NULL, NULL, '2023-02-15 06:51:56', '2023-02-15 06:51:56'),
(5, 'App\\Models\\User', 1, 'MyApp', '484d498ccbfe411e3d67c97c76aefb9045d70fcd35a53ea0305e8338368d7bda', '[\"*\"]', NULL, NULL, '2023-02-15 06:55:01', '2023-02-15 06:55:01'),
(6, 'App\\Models\\User', 1, 'MyApp', 'f9e66139da1d9d0a0529354978e6aea6f5dcc6d27e97936184f14aa4c9d601fd', '[\"*\"]', NULL, NULL, '2023-02-15 06:58:33', '2023-02-15 06:58:33'),
(7, 'App\\Models\\User', 1, 'MyApp', '93875d81412c476f75315009625599cb7963303676feeca10fa6c1ec9ecf022a', '[\"*\"]', NULL, NULL, '2023-02-15 06:59:15', '2023-02-15 06:59:15'),
(8, 'App\\Models\\User', 1, 'MyApp', 'd5d5bbbea9187a6740da49bd2a230fd65d857c155f16d149d4343715bdb1c360', '[\"*\"]', NULL, NULL, '2023-02-15 07:07:41', '2023-02-15 07:07:41'),
(9, 'App\\Models\\User', 1, 'MyApp', '6c55d50e993e9cf72d93f7b360d5f2484eecec148f7e2ba68d1ada0f23f84fbf', '[\"*\"]', NULL, NULL, '2023-02-15 07:10:09', '2023-02-15 07:10:09'),
(10, 'App\\Models\\User', 1, 'MyApp', 'd01ebd449a12f0fb225f6cac7570a5c56afe939f102ba898da78888692844074', '[\"*\"]', NULL, NULL, '2023-02-15 07:12:09', '2023-02-15 07:12:09'),
(11, 'App\\Models\\User', 1, 'MyApp', '2781ed30274a202274da33abd9ac08ca72d6563ba14dd678875ba8e543613b20', '[\"*\"]', NULL, NULL, '2023-02-15 07:15:20', '2023-02-15 07:15:20'),
(13, 'App\\Models\\User', 1, 'MyApp', '8467045ad8113aff509ce5b83ec805be655c329d6d459e720b96151957813438', '[\"*\"]', '2023-02-15 07:19:48', NULL, '2023-02-15 07:19:40', '2023-02-15 07:19:48'),
(15, 'App\\Models\\User', 1, 'MyApp', '1d645d99c7b82ffd201edaa6a35ac9bdfa48cf4d9ab93aa8f37875f5ab561a7f', '[\"*\"]', NULL, NULL, '2023-02-16 07:41:25', '2023-02-16 07:41:25'),
(16, 'App\\Models\\User', 1, 'MyApp', 'ff9073efa5d968de21ef078368bf6b100c2a76ba49ca3bc0348c1d4bcf406313', '[\"*\"]', NULL, NULL, '2023-02-16 07:58:57', '2023-02-16 07:58:57'),
(17, 'App\\Models\\User', 1, 'MyApp', '3dba42f56551554c311baa0ea1d7e8513e623c1d3aa2eaf567d26297b1f6ed9e', '[\"*\"]', NULL, NULL, '2023-02-16 07:59:40', '2023-02-16 07:59:40'),
(18, 'App\\Models\\User', 1, 'MyApp', '4ae388f9cac92f8eb10c204859e44996fda4bc564c80975a7e9c999b7086a320', '[\"*\"]', NULL, NULL, '2023-02-16 08:04:02', '2023-02-16 08:04:02'),
(19, 'App\\Models\\User', 1, 'MyApp', 'd4606d3601d61f1b10f9ff5c947413c316a62f4e4c40c6f47a9da5de6e9de77f', '[\"*\"]', NULL, NULL, '2023-02-17 00:18:39', '2023-02-17 00:18:39'),
(20, 'App\\Models\\User', 1, 'MyApp', '2f09bd9cf998690c687a012eedbb4c0f4e6fcdb1569ca3cff0defa60718a0051', '[\"*\"]', NULL, NULL, '2023-02-17 00:18:55', '2023-02-17 00:18:55'),
(21, 'App\\Models\\User', 1, 'MyApp', 'ccea7ddf4af568890b7ded0ef9725c088f834d3703732f904cb217de104945f5', '[\"*\"]', NULL, NULL, '2023-02-17 01:11:19', '2023-02-17 01:11:19'),
(22, 'App\\Models\\User', 1, 'MyApp', '4fe2040a5361f15ecef546186e9c0a735ba1694ebaa9ddf8cbee2879ca6fc85c', '[\"*\"]', NULL, NULL, '2023-02-17 01:13:11', '2023-02-17 01:13:11'),
(23, 'App\\Models\\User', 1, 'MyApp', 'f0b507c7d957a584af5577c184054a24563cb45c6f21fc54aa3ec43d12879e91', '[\"*\"]', NULL, NULL, '2023-02-17 01:13:40', '2023-02-17 01:13:40'),
(24, 'App\\Models\\User', 1, 'MyApp', '27af56276a668b50839f6fa2fc2d86c6927ede3625bffb89e3dd395ce6db7d78', '[\"*\"]', NULL, NULL, '2023-02-17 01:17:57', '2023-02-17 01:17:57'),
(25, 'App\\Models\\User', 1, 'MyApp', '52ca7e7e9bc6ae20ef58b12ad0d3c312d770c3ea7cca2845110fa496993346d7', '[\"*\"]', NULL, NULL, '2023-02-17 01:19:52', '2023-02-17 01:19:52'),
(26, 'App\\Models\\User', 1, 'MyApp', '1777da798b26119bca1a35987db74075ff3bf649b68caa8227e5bfb1f8744d00', '[\"*\"]', NULL, NULL, '2023-02-17 01:21:24', '2023-02-17 01:21:24'),
(27, 'App\\Models\\User', 2, 'MyApp', 'f1ce83cafa24d051eb44ce8f9dca60ae766974cb6ba20c21b2e815d2aa31edf0', '[\"*\"]', NULL, NULL, '2023-02-17 01:28:08', '2023-02-17 01:28:08'),
(29, 'App\\Models\\User', 1, 'MyApp', 'b8424b72e5e6e7eac62e453bf4d62c0ff1356eccdbad7fb33bab7b1bef6ae547', '[\"*\"]', NULL, NULL, '2023-02-17 02:11:23', '2023-02-17 02:11:23'),
(30, 'App\\Models\\User', 1, 'MyApp', '2c55ff50edcf826f9a3ee3f70a40e0a8f806b6396ef16d1baf81bb8a09fa690f', '[\"*\"]', NULL, NULL, '2023-02-17 02:12:47', '2023-02-17 02:12:47'),
(31, 'App\\Models\\User', 1, 'MyApp', '4707885b399bb639e8cb73c9112564b1a6900983d7f6509ffb3158c1aea2eb93', '[\"*\"]', NULL, NULL, '2023-02-17 02:14:13', '2023-02-17 02:14:13'),
(32, 'App\\Models\\User', 1, 'MyApp', 'bde2d27dbac8cebdf30ffb3caf81a5491ee2941794d68daa18c9905b58578417', '[\"*\"]', NULL, NULL, '2023-02-17 02:15:23', '2023-02-17 02:15:23'),
(33, 'App\\Models\\User', 1, 'MyApp', 'f269f4e82d84b724169ab9c078c41b61502c3418e5b73ad8ac61dd9a301c64e1', '[\"*\"]', NULL, NULL, '2023-02-17 02:22:54', '2023-02-17 02:22:54'),
(34, 'App\\Models\\User', 1, 'MyApp', 'cc1b5da4077f4269d0340dc5dd9ae65142725e0ef41c27e9f7547175471855be', '[\"*\"]', NULL, NULL, '2023-02-17 02:29:24', '2023-02-17 02:29:24'),
(35, 'App\\Models\\User', 1, 'MyApp', 'fb0715fb2b1a65d64285807b94fa902668df6de1a9675165ca4f69cf842d94d4', '[\"*\"]', NULL, NULL, '2023-02-17 03:38:37', '2023-02-17 03:38:37'),
(36, 'App\\Models\\User', 1, 'MyApp', 'b20a94e59e228dbdb42c9481ce7f57077113d0fcbca8ddb6e64fea52d2c7a90a', '[\"*\"]', NULL, NULL, '2023-02-17 03:53:15', '2023-02-17 03:53:15'),
(38, 'App\\Models\\User', 1, 'MyApp', 'ed6e99add6d877be3ed5785e01f6df71d1c2559c0657641228d3e0ee5981629f', '[\"*\"]', NULL, NULL, '2023-02-17 04:13:27', '2023-02-17 04:13:27'),
(39, 'App\\Models\\User', 1, 'MyApp', '5446eace64f77e0bc9b9481a29ae0d5bfcf8505b216e0eb4aa9a56bfd55d7593', '[\"*\"]', NULL, NULL, '2023-02-17 04:15:07', '2023-02-17 04:15:07'),
(40, 'App\\Models\\User', 1, 'MyApp', '07ddfec688fc765aed6de254e6886296db9d3783504d7b1bd9d624da6f0c0a98', '[\"*\"]', NULL, NULL, '2023-02-17 04:18:31', '2023-02-17 04:18:31'),
(41, 'App\\Models\\User', 1, 'MyApp', 'dd21c73c1a445b798301497bf8516a5b33719e0d9b4f0d60c941fa3967ae57f1', '[\"*\"]', NULL, NULL, '2023-02-17 04:18:57', '2023-02-17 04:18:57'),
(42, 'App\\Models\\User', 1, 'MyApp', 'ba9e3aa9efbeb807a6b837cab1cbee5961e795146d61cd27dda8e3e67f57c0e3', '[\"*\"]', '2023-02-17 04:34:17', NULL, '2023-02-17 04:34:14', '2023-02-17 04:34:17'),
(43, 'App\\Models\\User', 1, 'MyApp', '0f063360365d016dd0a7a95b84c084c28a3a7f2c82f55866942b8c9bd0534c9f', '[\"*\"]', NULL, NULL, '2023-02-17 05:08:37', '2023-02-17 05:08:37'),
(44, 'App\\Models\\User', 1, 'MyApp', '280d765fe150f116a228c344271f4e15fbf6270106b275a7ab8a654c5f3a24de', '[\"*\"]', NULL, NULL, '2023-02-17 05:09:24', '2023-02-17 05:09:24'),
(45, 'App\\Models\\User', 1, 'MyApp', '02c494cfe56d002ce852620fb49c2b02b1f7b6ecfe17455ad360b86b1df8c480', '[\"*\"]', NULL, NULL, '2023-02-17 05:15:05', '2023-02-17 05:15:05'),
(46, 'App\\Models\\User', 1, 'MyApp', 'b982146c1a30f5796c933732e4ef75ac6e095c3f2693c882646dccf8e75d9ee4', '[\"*\"]', NULL, NULL, '2023-02-17 05:17:14', '2023-02-17 05:17:14'),
(47, 'App\\Models\\User', 1, 'MyApp', '28f10d44a1a81e1eb8efd6790a6b6a5844db2112c2ac394aa5d31998087cc2bf', '[\"*\"]', NULL, NULL, '2023-02-17 05:17:15', '2023-02-17 05:17:15'),
(48, 'App\\Models\\User', 1, 'MyApp', '428b657df3ce609bdf21f7c226420670cdfc2811470d513b388089cbc166327b', '[\"*\"]', '2023-02-17 05:53:48', NULL, '2023-02-17 05:50:04', '2023-02-17 05:53:48'),
(49, 'App\\Models\\User', 1, 'MyApp', '12c2cc2d8a74f3e64a6b1b15fec5efff1e36d909323fd9cc3932be8fb29c94fe', '[\"*\"]', NULL, NULL, '2023-02-17 05:53:34', '2023-02-17 05:53:34'),
(50, 'App\\Models\\User', 1, 'MyApp', '212b9dad6e8398256c3437388e19b1a181856f68b59142add4ba93f9f268bf5f', '[\"*\"]', NULL, NULL, '2023-02-17 05:53:40', '2023-02-17 05:53:40'),
(51, 'App\\Models\\User', 1, 'MyApp', 'e9463170cbaa45a211302bb7ef08b91591e07a148a48a8b7a7e27bc98a8c9c11', '[\"*\"]', NULL, NULL, '2023-02-17 05:53:48', '2023-02-17 05:53:48'),
(53, 'App\\Models\\User', 1, 'MyApp', '6f209e1577885e7f338624b7a04024314772a76a82b334c444ad756cbd4451d5', '[\"*\"]', NULL, NULL, '2023-02-17 07:04:53', '2023-02-17 07:04:53'),
(54, 'App\\Models\\User', 1, 'MyApp', 'bb2c8baaf4b2dc3d8c092832967f79d6b5659f2536c9ac890d5a15cb262b7867', '[\"*\"]', NULL, NULL, '2023-02-17 07:06:12', '2023-02-17 07:06:12'),
(55, 'App\\Models\\User', 1, 'MyApp', 'd63e10b265a5d60e4520275678cd5f2fa5c49dcf89bc5a1e211f500d4b0e676b', '[\"*\"]', NULL, NULL, '2023-02-17 07:09:45', '2023-02-17 07:09:45'),
(56, 'App\\Models\\User', 1, 'MyApp', 'aa2419aba991f3cc52854aabefeb6123f4e992eee4751e05452f43b86dbb854b', '[\"*\"]', NULL, NULL, '2023-02-17 07:10:59', '2023-02-17 07:10:59'),
(57, 'App\\Models\\User', 1, 'MyApp', 'e9c4f767d0c0d7c37d2d790559d221388d1892a03bf18ceed34a8137b1083b97', '[\"*\"]', NULL, NULL, '2023-02-17 07:12:01', '2023-02-17 07:12:01'),
(58, 'App\\Models\\User', 1, 'MyApp', 'd44028ec8f188593d1ba33b901a12b1eeb97d05bf6ad3a3ce7eaf23cac7c1e2e', '[\"*\"]', NULL, NULL, '2023-02-17 07:12:23', '2023-02-17 07:12:23'),
(59, 'App\\Models\\User', 1, 'MyApp', '1c5afcd44a337ed3f7fd0e8ed2d385827d57733199cb9ca5337c1cc8c7e7203b', '[\"*\"]', NULL, NULL, '2023-02-17 07:13:03', '2023-02-17 07:13:03'),
(60, 'App\\Models\\User', 1, 'MyApp', 'e1c2b26c154554d3f2ad75e3657bae76e0ecde677613c17cee4ea4416ed7e1bb', '[\"*\"]', NULL, NULL, '2023-02-17 07:13:29', '2023-02-17 07:13:29'),
(61, 'App\\Models\\User', 1, 'MyApp', '85a51f265ee7e95eba49958b2aecba17e2da9b2f21dc7c1eb8e4b0fdcf79df6c', '[\"*\"]', NULL, NULL, '2023-02-17 07:14:07', '2023-02-17 07:14:07'),
(62, 'App\\Models\\User', 1, 'MyApp', 'fde48badb7aca469aaa039b103a2d9a92a876b42f3f1a1baae57a50e8792e264', '[\"*\"]', NULL, NULL, '2023-02-17 07:14:59', '2023-02-17 07:14:59'),
(63, 'App\\Models\\User', 1, 'MyApp', '1772ff9472fd7d2f794afea5eaf884501fdac02ac88e7e74d2af26ed4b2d6a82', '[\"*\"]', NULL, NULL, '2023-02-17 07:15:46', '2023-02-17 07:15:46'),
(64, 'App\\Models\\User', 1, 'MyApp', '25bff31f4af2929a7c62f1fe7c6f260ff131e03c6aa89013563b266eb5317e07', '[\"*\"]', NULL, NULL, '2023-02-17 07:16:33', '2023-02-17 07:16:33'),
(65, 'App\\Models\\User', 1, 'MyApp', '3563ec111453d72477f7c8aae3432d485b601afcfc6576984fd72e0817aefa13', '[\"*\"]', NULL, NULL, '2023-02-17 07:18:37', '2023-02-17 07:18:37'),
(66, 'App\\Models\\User', 1, 'MyApp', '01fc1ace7d9cdbbdce6bc039accba77f9106da80f43fa0933e3ee913e93960a4', '[\"*\"]', NULL, NULL, '2023-02-17 08:10:56', '2023-02-17 08:10:56'),
(67, 'App\\Models\\User', 1, 'MyApp', 'a94973d64888b9fb9672480256fcc8e2b3d3916555d3a938235b6f671071514f', '[\"*\"]', NULL, NULL, '2023-02-17 08:11:03', '2023-02-17 08:11:03'),
(68, 'App\\Models\\User', 1, 'MyApp', 'd9897195a676a4dcfb77f539b04893efd564fecadeed4c9bd1a37cf8c3b678cc', '[\"*\"]', NULL, NULL, '2023-02-17 08:11:09', '2023-02-17 08:11:09'),
(69, 'App\\Models\\User', 1, 'MyApp', '86ec43317a494ac771ea0720e69e9b4d5740e75dddd5e5f7c24108ff5a868426', '[\"*\"]', NULL, NULL, '2023-02-17 08:11:54', '2023-02-17 08:11:54'),
(70, 'App\\Models\\User', 1, 'MyApp', '6c90e3e01a46b34a8b6e3a1eef8eede54cbcb931a953bb9efcea4b8011c6560a', '[\"*\"]', NULL, NULL, '2023-02-17 08:12:46', '2023-02-17 08:12:46'),
(71, 'App\\Models\\User', 1, 'MyApp', 'd982ed493e1da15d30e1303fa1e523ae1e523d50325f9804102b0857af7464f1', '[\"*\"]', NULL, NULL, '2023-02-17 08:15:10', '2023-02-17 08:15:10'),
(72, 'App\\Models\\User', 1, 'MyApp', '68847d6bc44e308fcfaefc4c69f50708cd347b53a3d0359fbd52a66564403a07', '[\"*\"]', NULL, NULL, '2023-02-17 08:16:10', '2023-02-17 08:16:10'),
(73, 'App\\Models\\User', 1, 'MyApp', 'a836aa627b422c58ee59889cac1034ca71ce248051d83720c3183f45d99ff129', '[\"*\"]', NULL, NULL, '2023-02-17 08:18:33', '2023-02-17 08:18:33'),
(74, 'App\\Models\\User', 1, 'MyApp', '6b1ea631c4b35e6ce4a9995424e19752fe5b5730a0eb3742a934492175e63840', '[\"*\"]', NULL, NULL, '2023-02-17 08:38:06', '2023-02-17 08:38:06'),
(75, 'App\\Models\\User', 1, 'MyApp', 'c8279745e8ed7e3ea59c6b707f08a32d285bc64abbe2e772457fa2fcc6556e93', '[\"*\"]', NULL, NULL, '2023-02-21 01:57:46', '2023-02-21 01:57:46'),
(76, 'App\\Models\\User', 1, 'MyApp', '5b9ebcc9438e5a217591d14fa66b02380a079a3708fd1a2e4a5e852ed7ca9d0c', '[\"*\"]', NULL, NULL, '2023-02-21 02:05:51', '2023-02-21 02:05:51'),
(77, 'App\\Models\\User', 1, 'MyApp', '66b29bd4425874e9bd486083b784ee6db4d7f411717e2a6b19cc23ddf611aade', '[\"*\"]', NULL, NULL, '2023-02-21 02:06:51', '2023-02-21 02:06:51'),
(78, 'App\\Models\\User', 1, 'MyApp', '1fa50ad3ae081d26e1bce06fe954cae6422fe909e064b43ac7def81edb7f57e0', '[\"*\"]', NULL, NULL, '2023-02-21 02:15:24', '2023-02-21 02:15:24'),
(79, 'App\\Models\\User', 1, 'MyApp', 'e8b8c24895cfe479f83f94b415ba73b758f1dc05415d8fbeb4faea3da6a11b4e', '[\"*\"]', NULL, NULL, '2023-02-21 02:16:05', '2023-02-21 02:16:05'),
(80, 'App\\Models\\User', 1, 'MyApp', '3daae5b6789be2ca26bc2a09c6c3b25ebc3c9146b3a6ce37a894759058d85128', '[\"*\"]', NULL, NULL, '2023-02-21 02:17:21', '2023-02-21 02:17:21'),
(81, 'App\\Models\\User', 1, 'MyApp', 'aef2e97f56d7a69679d5980e620cc94fb4e1d0258a472f2e3193c726d12f04c1', '[\"*\"]', NULL, NULL, '2023-02-21 03:30:35', '2023-02-21 03:30:35'),
(82, 'App\\Models\\User', 1, 'MyApp', '2de537474ef7b9370fbe9021af408148a84dd6b2d78c17c95832ec26be69a379', '[\"*\"]', NULL, NULL, '2023-02-21 04:09:03', '2023-02-21 04:09:03'),
(83, 'App\\Models\\User', 1, 'MyApp', '966cf0ea8f624a9aebda53ade254a8a45af9dd05921aeb85d396eeec447d84df', '[\"*\"]', NULL, NULL, '2023-02-21 04:09:19', '2023-02-21 04:09:19'),
(84, 'App\\Models\\User', 1, 'MyApp', '6f8a237ced7e0e55bcdd9c1a4fcf6e4aecff1713b57c4bc48ad217f30ac29c1e', '[\"*\"]', NULL, NULL, '2023-02-21 04:11:06', '2023-02-21 04:11:06'),
(85, 'App\\Models\\User', 1, 'MyApp', 'd3a3ac2cda3f4586390fc939183067a1b40db71f2ccfcbaab5fc829f30d84edf', '[\"*\"]', NULL, NULL, '2023-02-21 04:11:08', '2023-02-21 04:11:08'),
(86, 'App\\Models\\User', 1, 'MyApp', '78f3dd664bb019dd8d652d8f0cfa8aef97d099cdf8df0a8c9103536e7e455012', '[\"*\"]', NULL, NULL, '2023-02-21 04:11:09', '2023-02-21 04:11:09'),
(87, 'App\\Models\\User', 1, 'MyApp', '5bbf094d2a36fd61e29aaf1563a56a1ed4f88be6929697a9d9c9827cc0d415bd', '[\"*\"]', NULL, NULL, '2023-02-21 04:12:52', '2023-02-21 04:12:52'),
(88, 'App\\Models\\User', 1, 'MyApp', 'fe824e8fa1af892241cbd7b8a5749c375bd150b3220e9931d70ceb32d33b67cb', '[\"*\"]', NULL, NULL, '2023-02-21 04:13:16', '2023-02-21 04:13:16'),
(89, 'App\\Models\\User', 1, 'MyApp', 'eb4368a1c428eb74b7d508e2728d121a13ee24bf7ea369c4d241539fccbae6d0', '[\"*\"]', NULL, NULL, '2023-02-21 04:14:39', '2023-02-21 04:14:39'),
(90, 'App\\Models\\User', 1, 'MyApp', '6e0a9d8020e9ea8548e393ec9d3cde76cde91f6f501f391dc6c8deb30661db46', '[\"*\"]', NULL, NULL, '2023-02-21 04:15:55', '2023-02-21 04:15:55'),
(94, 'App\\Models\\User', 1, 'MyApp', '2559cb596cff761206dc3d689531e8289e5688b599f78d01d23c2ac48e91a9a4', '[\"*\"]', NULL, NULL, '2023-02-21 05:20:32', '2023-02-21 05:20:32'),
(95, 'App\\Models\\User', 1, 'MyApp', 'f0100702c6046b9e3fff7a773643f6a4518b26a566701de7eca52fb9ff3d4de9', '[\"*\"]', '2023-02-21 05:33:47', NULL, '2023-02-21 05:33:38', '2023-02-21 05:33:47'),
(109, 'App\\Models\\User', 1, 'MyApp', 'fd04602d871da31da0c6a9f50d6df46d72a8d33a5a4e870ca255b1c722c624e1', '[\"*\"]', NULL, NULL, '2023-02-22 01:56:00', '2023-02-22 01:56:00'),
(110, 'App\\Models\\User', 1, 'MyApp', 'd1ca79774587b4c2f836d2a419b6d67f01d2a89edaa65c07c0ab66c5daf70140', '[\"*\"]', NULL, NULL, '2023-02-22 01:56:18', '2023-02-22 01:56:18'),
(111, 'App\\Models\\User', 1, 'MyApp', '23e120436b3fea56f52e04cd868b781f9a8c9699edaed1e53c02b87f5ab4fbd1', '[\"*\"]', NULL, NULL, '2023-02-22 01:56:19', '2023-02-22 01:56:19'),
(112, 'App\\Models\\User', 1, 'MyApp', '5352755c646d83e7cb160ac551e8091ad212b4546ae2d58c7bb3322cccee9f43', '[\"*\"]', NULL, NULL, '2023-02-22 01:56:21', '2023-02-22 01:56:21'),
(126, 'App\\Models\\User', 1, 'MyApp', '372321a2a1351326d0abe6c626c08610c44153ad888cd4473cdd21490027b9dc', '[\"*\"]', '2023-02-24 04:44:52', NULL, '2023-02-24 04:43:12', '2023-02-24 04:44:52'),
(134, 'App\\Models\\User', 1, 'MyApp', '0d9c967e9bd837dd8eadd9c36f2b64d29037f63270cff744a25f6e3bb1c02f06', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:10', '2023-02-24 05:23:10'),
(135, 'App\\Models\\User', 1, 'MyApp', '1228c6055bbafee7f3aa976b6b1a011b2bc2936d1d761a11cad22b9c80596909', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:11', '2023-02-24 05:23:11'),
(136, 'App\\Models\\User', 1, 'MyApp', '34546e2a10b40bfaea81eba89d79074f73996007fb0172de5b53468b03029e58', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:14', '2023-02-24 05:23:14'),
(137, 'App\\Models\\User', 1, 'MyApp', 'c083098e3a91135f314d972572669712904c0f952228ce0826f77188f9e7bb69', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:15', '2023-02-24 05:23:15'),
(138, 'App\\Models\\User', 1, 'MyApp', '060e8dacccf2f45a3df8b98ccd300fb3090b42eb78d0a6b89017020dbdd087cf', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:17', '2023-02-24 05:23:17'),
(139, 'App\\Models\\User', 1, 'MyApp', '28818ad4149e89d176fae5c2adbaa6efb863fbfa72ea87cb16ffca06a6d73431', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:19', '2023-02-24 05:23:19'),
(140, 'App\\Models\\User', 1, 'MyApp', '1a5c97c7392c8befa36a248b92318996b6287492f4a6d314e6e021e7aa90d99e', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:45', '2023-02-24 05:23:45'),
(141, 'App\\Models\\User', 1, 'MyApp', 'ccb41d8075d0d57efe8dbd53b12e81f4434a6f1b7f32929a6c5e7941edf8beba', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:47', '2023-02-24 05:23:47'),
(142, 'App\\Models\\User', 1, 'MyApp', '48eaeac8a21d0366975b408939a7eff9703633c4f66cb5c9c57273398774e20f', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:58', '2023-02-24 05:23:58'),
(143, 'App\\Models\\User', 1, 'MyApp', 'c6f85f02a2baf7344fcc5615477e200b6d16c98973b7b6863d17407d3b68e5bf', '[\"*\"]', NULL, NULL, '2023-02-24 05:23:58', '2023-02-24 05:23:58'),
(144, 'App\\Models\\User', 1, 'MyApp', '8169d12460287b0660a7d8e9bde4ddd9107726fc4782260c1390562d9c52936d', '[\"*\"]', NULL, NULL, '2023-02-24 05:24:12', '2023-02-24 05:24:12'),
(145, 'App\\Models\\User', 1, 'MyApp', '6858c6614c246105ccbb2193afbea01657374a7d51d18bc630858468364aa120', '[\"*\"]', NULL, NULL, '2023-02-24 05:24:12', '2023-02-24 05:24:12'),
(146, 'App\\Models\\User', 1, 'MyApp', '7baba2b2f0fe6b035913bf0efa91415e00587652139b20081ec54494fcbb339e', '[\"*\"]', NULL, NULL, '2023-02-24 05:24:13', '2023-02-24 05:24:13'),
(147, 'App\\Models\\User', 1, 'MyApp', '4f7880c644e6fd3b5fe43734dd963160f6190ed698aaf634de2d5db70e731f43', '[\"*\"]', NULL, NULL, '2023-02-24 05:24:13', '2023-02-24 05:24:13'),
(148, 'App\\Models\\User', 1, 'MyApp', '3e681a2027dd3dc147ab288c9b5dff6f7bb2756dfadb0fc0789177c6451027a5', '[\"*\"]', NULL, NULL, '2023-02-24 05:24:25', '2023-02-24 05:24:25'),
(149, 'App\\Models\\User', 1, 'MyApp', '6e5a5c4cd7e98ab80bd69975282989494577e4b7bc3df1386a88c530285adb48', '[\"*\"]', NULL, NULL, '2023-02-24 05:24:44', '2023-02-24 05:24:44'),
(150, 'App\\Models\\User', 1, 'MyApp', '9cd30158646c53ef1955facd1d5267b1710c5f4ec1582813bdec00fa7a71536b', '[\"*\"]', NULL, NULL, '2023-02-24 05:25:27', '2023-02-24 05:25:27'),
(151, 'App\\Models\\User', 1, 'MyApp', '6bfe6703f57aadf10ee66212142c8b0d35e9f8bb8295493fc7f69d4494b7187e', '[\"*\"]', NULL, NULL, '2023-02-24 05:25:38', '2023-02-24 05:25:38'),
(152, 'App\\Models\\User', 1, 'MyApp', '763d24944fb547b4082dfd01ae675a5c869418f2d58b801ec6098bccb4703046', '[\"*\"]', NULL, NULL, '2023-02-24 05:25:38', '2023-02-24 05:25:38'),
(153, 'App\\Models\\User', 1, 'MyApp', 'b5b1f89023ce86997df16ae6f4a1137a280ad3056f1391d6bb2eafd039587e95', '[\"*\"]', NULL, NULL, '2023-02-24 05:25:57', '2023-02-24 05:25:57'),
(154, 'App\\Models\\User', 1, 'MyApp', '59d547997ea6d89f94be6eb298ff19978b608e19807645dff845d74d7936baf6', '[\"*\"]', NULL, NULL, '2023-02-24 05:25:58', '2023-02-24 05:25:58'),
(155, 'App\\Models\\User', 1, 'MyApp', '6a7277e94bb6b94c2333f5a0d62284e112c880dbcf77c7954dd367ccb4523a00', '[\"*\"]', NULL, NULL, '2023-02-24 05:25:58', '2023-02-24 05:25:58'),
(156, 'App\\Models\\User', 1, 'MyApp', '2697c59fb6f4bac1bf76bc93fdb3a8e244437fb9904209b5e5fa722b2e6dbc8c', '[\"*\"]', NULL, NULL, '2023-02-24 05:26:29', '2023-02-24 05:26:29'),
(157, 'App\\Models\\User', 1, 'MyApp', '3fd77bec236644d05685363627259ec07e9fe0a118770da1fcb9c47bc1d20711', '[\"*\"]', NULL, NULL, '2023-02-24 05:26:30', '2023-02-24 05:26:30'),
(158, 'App\\Models\\User', 1, 'MyApp', 'c0c7e9be036d5bc028b910f5bb3209e77c40a9fe8b9907263b47dcda20d9c022', '[\"*\"]', NULL, NULL, '2023-02-24 05:26:30', '2023-02-24 05:26:30'),
(159, 'App\\Models\\User', 1, 'MyApp', 'cd96873f3230c016a5102d6f9c6e38f96ca57b69a957625fa5f8650d5c7d6030', '[\"*\"]', NULL, NULL, '2023-02-24 05:26:31', '2023-02-24 05:26:31'),
(160, 'App\\Models\\User', 1, 'MyApp', 'ec13833a5054f335e43506920c4ee9c0978c044f65526662ac6d7a32e0748611', '[\"*\"]', NULL, NULL, '2023-02-24 05:26:33', '2023-02-24 05:26:33'),
(162, 'App\\Models\\User', 1, 'MyApp', '9e3ce2fd2e6325729568f42d89c36b35841a745da43227d2573b4e8ab9f4f1fb', '[\"*\"]', NULL, NULL, '2023-02-24 05:26:40', '2023-02-24 05:26:40'),
(163, 'App\\Models\\User', 1, 'MyApp', '8302447adf28e03f80fc48ee95919201dbac6817d95e870241b97b5a44e819ac', '[\"*\"]', NULL, NULL, '2023-02-24 05:31:42', '2023-02-24 05:31:42'),
(164, 'App\\Models\\User', 1, 'MyApp', '74001f0e374d60470c167650305c991fe086ca67d4cbd3f95541061e456124d2', '[\"*\"]', NULL, NULL, '2023-02-24 05:31:43', '2023-02-24 05:31:43'),
(165, 'App\\Models\\User', 1, 'MyApp', '1fcf42f9bf0624aaed90e39bff82a0863f0515117cb2304bbd4a80367591ef1b', '[\"*\"]', NULL, NULL, '2023-02-24 05:31:50', '2023-02-24 05:31:50'),
(166, 'App\\Models\\User', 1, 'MyApp', '4c3eebc0b53e0d577793c0611cfe291e1ae634b3970339dbd82828cd164fa837', '[\"*\"]', NULL, NULL, '2023-02-24 05:31:50', '2023-02-24 05:31:50'),
(167, 'App\\Models\\User', 1, 'MyApp', '3887f66232261466ba02750b0bb29d3416b20654445fc89bc77c607413d79740', '[\"*\"]', NULL, NULL, '2023-02-24 05:31:52', '2023-02-24 05:31:52'),
(168, 'App\\Models\\User', 1, 'MyApp', '847f03a7b92ed12256d32b4b0ee8d2dd838cf0177233200564a6a9af9f926293', '[\"*\"]', NULL, NULL, '2023-02-24 05:32:01', '2023-02-24 05:32:01'),
(169, 'App\\Models\\User', 1, 'MyApp', 'e03c30df8cd9039c952e7a5a94ed11cbf7f78de8f01a8804311572a43b35ec3e', '[\"*\"]', NULL, NULL, '2023-02-24 05:37:52', '2023-02-24 05:37:52'),
(171, 'App\\Models\\User', 1, 'MyApp', '9aa7897aaea02c2d441df7841aaa66ee22cc7ded1e62c9c3ed23806cc8c74fe0', '[\"*\"]', NULL, NULL, '2023-02-24 05:38:00', '2023-02-24 05:38:00'),
(172, 'App\\Models\\User', 1, 'MyApp', '854fac2faa10f55d5b289658119021e2f4fa6a4d45e62580aac33ce9c400f296', '[\"*\"]', NULL, NULL, '2023-02-24 05:38:34', '2023-02-24 05:38:34'),
(173, 'App\\Models\\User', 1, 'MyApp', 'dd1b67cce261fa365382a96ba79d1a023644dc34e384d3472c80e85081a6bb3d', '[\"*\"]', NULL, NULL, '2023-02-24 05:38:35', '2023-02-24 05:38:35'),
(174, 'App\\Models\\User', 1, 'MyApp', '3bdcc45995988b101566cbc483c7e04f8291dba35c0e94c0b924281150cd4f57', '[\"*\"]', NULL, NULL, '2023-02-24 05:38:35', '2023-02-24 05:38:35'),
(175, 'App\\Models\\User', 1, 'MyApp', 'c5a2228cd978d7b056e8647ba8d7430529aa70aca10a882a1dc69acf7c72ee96', '[\"*\"]', NULL, NULL, '2023-02-24 05:38:36', '2023-02-24 05:38:36'),
(176, 'App\\Models\\User', 1, 'MyApp', '78d29dae4fabc580ba41b12752c029bdd5925c0c146d0d6bedaaa3cb9fffff6d', '[\"*\"]', NULL, NULL, '2023-02-24 05:38:37', '2023-02-24 05:38:37'),
(177, 'App\\Models\\User', 1, 'MyApp', '4eff329eb5fb2eb5f49d7ce0dea03b0b7e45386517e6acf4af2a2ffefc5cdecf', '[\"*\"]', NULL, NULL, '2023-02-24 05:38:38', '2023-02-24 05:38:38'),
(178, 'App\\Models\\User', 1, 'MyApp', 'd8d0ec37f641965c1c5ff6641d874d273090c8b14ba76655cc35d13bb394d7e5', '[\"*\"]', NULL, NULL, '2023-02-24 05:38:38', '2023-02-24 05:38:38'),
(179, 'App\\Models\\User', 1, 'MyApp', '5b30412f6032f58ff9d0156249541a4fb7628a54a0be49f7f27818fd30bcec95', '[\"*\"]', NULL, NULL, '2023-02-24 05:39:06', '2023-02-24 05:39:06'),
(180, 'App\\Models\\User', 1, 'MyApp', '0a12f5889f24f986e455aa728bdbd606d112020d20323574b7d1e69cc59297ca', '[\"*\"]', NULL, NULL, '2023-02-24 05:39:07', '2023-02-24 05:39:07'),
(181, 'App\\Models\\User', 1, 'MyApp', 'b0bbeb376c0c9a384c5141baf3058ead87baf025d2b4490488c459d49664ef09', '[\"*\"]', NULL, NULL, '2023-02-24 05:39:07', '2023-02-24 05:39:07'),
(183, 'App\\Models\\User', 1, 'MyApp', 'cedc0febf3c78392ffde8d7462def10a1b45749084a60cf32726843f60e6897b', '[\"*\"]', NULL, NULL, '2023-02-24 05:39:48', '2023-02-24 05:39:48'),
(184, 'App\\Models\\User', 1, 'MyApp', 'b41cf8ea955320cc82a6d587ba754f7ca037371d60c5b8b360e087d06101c002', '[\"*\"]', NULL, NULL, '2023-02-24 05:40:17', '2023-02-24 05:40:17'),
(185, 'App\\Models\\User', 1, 'MyApp', '619bd9c7e051d322281d87291540244a3be0c79530009de26b9ea7bbaa3cf8dd', '[\"*\"]', NULL, NULL, '2023-02-24 05:40:19', '2023-02-24 05:40:19'),
(186, 'App\\Models\\User', 1, 'MyApp', '6b42d3355fbd52b6645cba5b6130b3efc3d806f423e3ecc5cd474f8f1926a616', '[\"*\"]', NULL, NULL, '2023-02-24 05:40:47', '2023-02-24 05:40:47'),
(187, 'App\\Models\\User', 1, 'MyApp', 'cb0d0c98d9b9ba8d3ea6956dd981fd2b4c25c0864bff5206f15bf1e0fbc82faf', '[\"*\"]', NULL, NULL, '2023-02-24 05:41:20', '2023-02-24 05:41:20'),
(188, 'App\\Models\\User', 1, 'MyApp', 'f79e6c581bb448dfa9f976dd9d4f9d0de057f3f8de59c6b7f6f6594f91451079', '[\"*\"]', NULL, NULL, '2023-02-24 05:41:22', '2023-02-24 05:41:22'),
(189, 'App\\Models\\User', 1, 'MyApp', '64695b7152001dfad0f136f583402b7587f6746b2b52eaa9b79e2f3e74fbb6a4', '[\"*\"]', NULL, NULL, '2023-02-24 05:41:50', '2023-02-24 05:41:50'),
(190, 'App\\Models\\User', 1, 'MyApp', '82b695f147c14bb018ded484834385f27c835493b4e13389830a794f20fd984b', '[\"*\"]', NULL, NULL, '2023-02-24 05:42:14', '2023-02-24 05:42:14'),
(191, 'App\\Models\\User', 1, 'MyApp', 'f5b5f659ced680568ab877c14d1001349c4a87349885006ea912bcd3f466f071', '[\"*\"]', NULL, NULL, '2023-02-24 05:42:18', '2023-02-24 05:42:18'),
(192, 'App\\Models\\User', 1, 'MyApp', '4494c445e37b6b97856b0dcb20b7e8e2585378a8b0eb4515be180d2f88811871', '[\"*\"]', NULL, NULL, '2023-02-24 05:44:26', '2023-02-24 05:44:26'),
(193, 'App\\Models\\User', 1, 'MyApp', 'b64004738cf984fe8322e7de24bea61ca2779a3be34ee5bca63294548e618fbb', '[\"*\"]', NULL, NULL, '2023-02-24 05:44:31', '2023-02-24 05:44:31'),
(194, 'App\\Models\\User', 1, 'MyApp', '33fd7bb0f8f3297be0df785ac65f9bc4c33e202fb4f1a033fa378a05e26970cb', '[\"*\"]', NULL, NULL, '2023-02-24 05:44:55', '2023-02-24 05:44:55'),
(195, 'App\\Models\\User', 1, 'MyApp', '2e155f09520ed97495f17a503fa7935a3b61dbb09fbf63222e63c2e48c3f7573', '[\"*\"]', NULL, NULL, '2023-02-24 05:44:56', '2023-02-24 05:44:56'),
(196, 'App\\Models\\User', 1, 'MyApp', '61c2dcc754bb0f590ddf180996485a319e00788b8aabea4dfce2ddbe7d829c8f', '[\"*\"]', NULL, NULL, '2023-02-24 05:44:57', '2023-02-24 05:44:57'),
(197, 'App\\Models\\User', 1, 'MyApp', 'abdc7d41747e42f13608c98601d7634769889a4ac491df6ccf06bdede8ba1029', '[\"*\"]', NULL, NULL, '2023-02-24 05:45:00', '2023-02-24 05:45:00'),
(198, 'App\\Models\\User', 1, 'MyApp', 'd584ca0b5889cd11f87917e258fdb4ce8020f982abad2300f6603acfed5546bd', '[\"*\"]', NULL, NULL, '2023-02-24 05:45:46', '2023-02-24 05:45:46'),
(199, 'App\\Models\\User', 1, 'MyApp', 'd0859b76656a66d523a3bd9bd97f45a6ceea399f0369eac7805bb1f289b9f7aa', '[\"*\"]', NULL, NULL, '2023-02-24 05:45:48', '2023-02-24 05:45:48'),
(200, 'App\\Models\\User', 1, 'MyApp', '55a85754e63915af71b110b9c520b0aab74977618d10b65d2f1329913597040c', '[\"*\"]', NULL, NULL, '2023-02-24 05:45:57', '2023-02-24 05:45:57'),
(201, 'App\\Models\\User', 1, 'MyApp', 'd06c10b7a9c0e33d3450b63e6f622028cfc5910bc8e355270406a4974162b678', '[\"*\"]', NULL, NULL, '2023-02-24 05:46:01', '2023-02-24 05:46:01'),
(203, 'App\\Models\\User', 1, 'MyApp', 'ca18d422c1c3f8205db4568c6123e7a9a2faad7dcab8f239e40d810829b52a78', '[\"*\"]', NULL, NULL, '2023-02-24 05:47:13', '2023-02-24 05:47:13'),
(204, 'App\\Models\\User', 1, 'MyApp', '9c4079ec5dbe2294e46469888e1624f559956d9e2d6c0391c6d8bad4b6a69c4d', '[\"*\"]', NULL, NULL, '2023-02-24 05:49:11', '2023-02-24 05:49:11'),
(205, 'App\\Models\\User', 1, 'MyApp', 'c0ec76d1a4a6dd2a385b9edd4ea6036d087b3dd75b65ef35a5172a9d4d01da11', '[\"*\"]', NULL, NULL, '2023-02-24 05:49:13', '2023-02-24 05:49:13'),
(206, 'App\\Models\\User', 1, 'MyApp', '1a63c55ceab0e5485669c8d32c0f97f0e9d39a013db93fdd9fcd66cd8b5a75d0', '[\"*\"]', NULL, NULL, '2023-02-24 05:49:43', '2023-02-24 05:49:43'),
(207, 'App\\Models\\User', 1, 'MyApp', '96e8a10393e98ddf851fabce0eeeeb7f7dae23aece2fa813ccd8d46144d2997f', '[\"*\"]', NULL, NULL, '2023-02-24 05:49:46', '2023-02-24 05:49:46'),
(208, 'App\\Models\\User', 1, 'MyApp', '7df303b6254f08006af8bc8f248219c281e2e96c35bba98d1d05bb9a31d746bf', '[\"*\"]', NULL, NULL, '2023-02-24 05:49:48', '2023-02-24 05:49:48'),
(209, 'App\\Models\\User', 1, 'MyApp', '68b1f75c4a9e2561790ada18b9eaf3b099c71becb50103434a8991a28e99eaf6', '[\"*\"]', NULL, NULL, '2023-02-24 05:50:58', '2023-02-24 05:50:58'),
(210, 'App\\Models\\User', 1, 'MyApp', '4f2b627cc27ded2f0d34ba6891f6c1af8fd90dfaabffd1c2687e1c95cc8dd66a', '[\"*\"]', NULL, NULL, '2023-02-24 05:50:58', '2023-02-24 05:50:58'),
(211, 'App\\Models\\User', 1, 'MyApp', '15686dc0f445785fd1f81f5ed4d1519046ffd7a3ea869c7b3d56edd118e26c56', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:01', '2023-02-24 05:51:01'),
(212, 'App\\Models\\User', 1, 'MyApp', 'd8047b89339471db550c417910e13cc0c1bc3d0b61795520273c5289ab45eb60', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:01', '2023-02-24 05:51:01'),
(213, 'App\\Models\\User', 1, 'MyApp', '373ee8c010f65b55bb8b652a9e4a526bdf8fc8a4afd7707e38806a89017a64e8', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:07', '2023-02-24 05:51:07'),
(214, 'App\\Models\\User', 1, 'MyApp', 'cfadd2bb5997b24563d1bd97d57f87e7f5e57f0a7925cd43d21b98a23a08a42c', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:11', '2023-02-24 05:51:11'),
(215, 'App\\Models\\User', 1, 'MyApp', '1661cd9de1e96d213b0193c4dc05c0e0f5337bcfa563f0c373da875a6a0d689b', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:11', '2023-02-24 05:51:11'),
(216, 'App\\Models\\User', 1, 'MyApp', '064a2d8a5ce944b12cc1bba178db738c8fd6bda532bfed591a6d436b79349af3', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:14', '2023-02-24 05:51:14'),
(217, 'App\\Models\\User', 1, 'MyApp', 'b37997f3a3b681a7f07c9f9c7be9609d9992b309244e1ef85dc44ad1c9118776', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:14', '2023-02-24 05:51:14'),
(218, 'App\\Models\\User', 1, 'MyApp', 'fce5800e214be399b94ca163912b686e429161ad22288f523035edc304188c7d', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:16', '2023-02-24 05:51:16'),
(219, 'App\\Models\\User', 1, 'MyApp', '6e2d249c98ffd2d34ac15e1193695fc1144d1496c36a34a2e9a64368ae7517d7', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:32', '2023-02-24 05:51:32'),
(220, 'App\\Models\\User', 1, 'MyApp', '72113fdbed7ddc3611bea1e73a859513e43be7b26bcdcd6b38165743cd664f0e', '[\"*\"]', NULL, NULL, '2023-02-24 05:51:32', '2023-02-24 05:51:32'),
(221, 'App\\Models\\User', 1, 'MyApp', '6ae9ff45e51dc9ee56c4f57699c9728bb9da1e9bac28e1302cc036630b46216e', '[\"*\"]', NULL, NULL, '2023-02-24 05:53:19', '2023-02-24 05:53:19'),
(260, 'App\\Models\\User', 1, 'MyApp', 'ee43ff1f8c9e0fa40d914d499b8268fe9dc76f593f48256cc9e244fb655c1a00', '[\"*\"]', '2023-03-07 07:25:55', NULL, '2023-03-07 07:25:54', '2023-03-07 07:25:55'),
(261, 'App\\Models\\User', 1, 'MyApp', '8ced8e24b8c26645bd3881e153e12632a712ed43d52d38910b92505a61a7ae3e', '[\"*\"]', '2023-03-07 07:26:04', NULL, '2023-03-07 07:25:57', '2023-03-07 07:26:04'),
(268, 'App\\Models\\User', 1, 'MyApp', '9afeea2b25ab2fda6bb610d8b1ee9969fa4bd3e1b4ff3fca2a841320579bb670', '[\"*\"]', '2023-03-07 07:35:30', NULL, '2023-03-07 07:35:22', '2023-03-07 07:35:30'),
(269, 'App\\Models\\User', 1, 'MyApp', 'c876b126154dd8f29d9b2cfb1825524cb14c652de2c5ab18abcd9c667caa40eb', '[\"*\"]', '2023-03-07 07:36:36', NULL, '2023-03-07 07:35:31', '2023-03-07 07:36:36'),
(302, 'App\\Models\\User', 1, 'MyApp', '27e154071320e395116ecd0244c18b81e153daa2fbe95cd6113670334d47e597', '[\"*\"]', '2023-04-12 01:17:00', NULL, '2023-04-12 01:09:05', '2023-04-12 01:17:00'),
(399, 'App\\Models\\User', 1, 'MyApp', '11e7c4febbf5d9f8323036c8be477e2b90e7d0e875aa8b7b30bb7dc60dbfbae6', '[\"*\"]', '2023-04-13 07:00:24', NULL, '2023-04-13 06:59:39', '2023-04-13 07:00:24'),
(403, 'App\\Models\\User', 1, 'MyApp', '748bd63fcf68601b2b4ca579e265a4f0ee0004734afcb434acca4fca8fd6dc06', '[\"*\"]', '2023-04-13 07:58:21', NULL, '2023-04-13 07:47:26', '2023-04-13 07:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'post1', 'descriptin1', 'slug', '2023-02-15 11:14:27', '2023-02-15 11:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(11,2) NOT NULL,
  `sales_price` decimal(11,2) DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` bigint NOT NULL,
  `primary_cat_id` bigint UNSIGNED DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` bigint NOT NULL,
  `img_alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_status` tinyint NOT NULL COMMENT '"1 = IN STOCK, 2 = OUT OF STOCK, 3 = ONBACKOREDER"',
  `sold_individually` tinyint NOT NULL COMMENT '"0 = NO LIMIT, 1 = Limit purchases to 1 item per order"',
  `weight` int DEFAULT NULL,
  `dim_length` int DEFAULT NULL,
  `allow_backorders` tinyint NOT NULL DEFAULT '0' COMMENT '1 => Yes 0 => No',
  `product_type` tinyint NOT NULL COMMENT '0 => simple 1 => variable',
  `dim_width` int DEFAULT NULL,
  `dim_height` int DEFAULT NULL,
  `up_sells` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cross_sells` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_note` tinytext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL COMMENT '1=DRAFT 2=Review 3=Published',
  `menu_oreder` int NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `enable_reviews` tinyint NOT NULL COMMENT '"0 = NO, 1 = YES',
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `short_description`, `price`, `sales_price`, `sku`, `quantity`, `primary_cat_id`, `product_image`, `img_caption`, `stock`, `img_alt`, `stock_status`, `sold_individually`, `weight`, `dim_length`, `allow_backorders`, `product_type`, `dim_width`, `dim_height`, `up_sells`, `cross_sells`, `purchase_note`, `status`, `menu_oreder`, `start_date`, `enable_reviews`, `end_date`, `created_at`, `updated_at`) VALUES
(21, 'Tshirt', 'tshirt', '<p>Reveal your elegant personality by wearing our Rayon Cotton Shirt. This soft and breathable shirt made in premium quality Rayon fabric has a clean and classic structure. Easy-to-wear wardrobe staples that combine classic and contemporary styles.</p>', '<p>short description</p>', 12.00, 12.00, 'sku', 12, NULL, 'product-image-product-1680701391.png', 'sd', 12, 'sd', 1, 0, 12, 12, 1, 1, 12, NULL, NULL, NULL, NULL, 3, 0, NULL, 1, NULL, '2023-04-05 07:59:51', '2023-04-13 12:56:09'),
(22, 'Shirt', 'shirt', '<p>Reveal your elegant personality by wearing our Rayon Cotton Shirt. This soft and breathable shirt made in premium quality Rayon fabric has a clean and classic structure. Easy-to-wear wardrobe staples that combine classic and contemporary styles.\n\n</p>', '<p>short description</p>', 12.00, 12.00, 'sku', 12, NULL, 'product-image-test-1680701460.png', NULL, 21, NULL, 1, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, NULL, '2023-04-05 08:01:00', '2023-04-13 12:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', NULL, NULL),
(9, 'user', 'web', '2023-03-28 01:26:27', '2023-03-28 01:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(34, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `email`, `last_name`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '', 0, NULL, '$2y$10$4OdkuJINs9Ft110G..A9A.wjb0YWggktftnGiXqRWygHJhZtl9UN6', NULL, '2023-02-15 02:08:01', '2023-02-15 02:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint UNSIGNED NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `sale_price` decimal(11,2) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `sku`, `price`, `sale_price`, `short_description`, `product_id`, `created_at`, `updated_at`) VALUES
(14, 'red-small', 45.00, 23.00, NULL, 21, '2023-04-13 12:40:26', '2023-04-13 12:40:26'),
(15, 'orange-small', 34.00, 43.00, NULL, 22, '2023-04-13 12:50:04', '2023-04-13 12:50:04'),
(16, 'orange-large', 65.00, 65.00, NULL, 22, '2023-04-13 12:50:04', '2023-04-13 12:50:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_slug_unique` (`slug`);

--
-- Indexes for table `attribute_terms`
--
ALTER TABLE `attribute_terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_terms_slug_unique` (`slug`),
  ADD KEY `attribute_terms_attribute_id_foreign` (`attribute_id`),
  ADD KEY `attribute_terms_name_index` (`name`);

--
-- Indexes for table `attribute_term_product`
--
ALTER TABLE `attribute_term_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_term_product_attribute_term_id_foreign` (`attribute_term_id`),
  ADD KEY `attribute_term_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `attribute_term_variant`
--
ALTER TABLE `attribute_term_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_term_variant_attribute_term_id_foreign` (`attribute_term_id`),
  ADD KEY `attribute_term_variant_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`),
  ADD KEY `brands_title_index` (`title`),
  ADD KEY `brands_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `brand_product`
--
ALTER TABLE `brand_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_product_brand_id_product_id_unique` (`brand_id`,`product_id`),
  ADD KEY `brand_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_title_slug_index` (`title`,`slug`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_product_product_id_category_id_unique` (`product_id`,`category_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_name_short_description_index` (`name`,`short_description`);

--
-- Indexes for table `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_user_product_id_coupon_id_unique` (`product_id`,`coupon_id`),
  ADD KEY `coupon_user_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_variant_id_foreign` (`variant_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_primary_cat_id_foreign` (`primary_cat_id`),
  ADD KEY `products_sku_title_slug_index` (`sku`,`title`,`slug`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_tag_product_id_tag_id_unique` (`product_id`,`tag_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`),
  ADD KEY `tags_title_index` (`title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_sku_index` (`sku`),
  ADD KEY `variants_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `attribute_terms`
--
ALTER TABLE `attribute_terms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `attribute_term_product`
--
ALTER TABLE `attribute_term_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attribute_term_variant`
--
ALTER TABLE `attribute_term_variant`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `brand_product`
--
ALTER TABLE `brand_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_user`
--
ALTER TABLE `coupon_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=404;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_terms`
--
ALTER TABLE `attribute_terms`
  ADD CONSTRAINT `attribute_terms_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_term_product`
--
ALTER TABLE `attribute_term_product`
  ADD CONSTRAINT `attribute_term_product_attribute_term_id_foreign` FOREIGN KEY (`attribute_term_id`) REFERENCES `attribute_terms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_term_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_term_variant`
--
ALTER TABLE `attribute_term_variant`
  ADD CONSTRAINT `attribute_term_variant_attribute_term_id_foreign` FOREIGN KEY (`attribute_term_id`) REFERENCES `attribute_terms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_term_variant_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Constraints for table `brand_product`
--
ALTER TABLE `brand_product`
  ADD CONSTRAINT `brand_product_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brand_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD CONSTRAINT `coupon_user_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_user_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_primary_cat_id_foreign` FOREIGN KEY (`primary_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
