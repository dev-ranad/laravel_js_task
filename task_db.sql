-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2023 at 08:32 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_post` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2020_08_28_072131_create_blog_categories_table', 3),
(7, '2020_08_28_072234_create_blogs_table', 3),
(8, '2020_08_28_103502_create_variants_table', 3),
(10, '2020_08_28_104103_create_blog_tags_table', 3),
(14, '2020_08_28_063029_create_products_table', 4),
(15, '2020_08_28_103644_create_product_images_table', 4),
(16, '2020_08_31_065549_create_product_variants_table', 4),
(17, '2020_08_31_073704_create_product_variant_prices_table', 4),
(18, '2020_08_31_081510_create_product_variant_price_relation_table', 4);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `sku`, `description`, `created_at`, `updated_at`) VALUES
(16, 'Hillary Benson', 'Autem libero deserun', 'Eius nisi unde at re', '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(18, 'zillary Benson', 'Autem libero deseruns', 'Eius nisi unde at re', '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(19, 'Dillary Benson', 'Autem libero 3213', 'Eius nisi unde at re', '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(20, 'Dillary Benson', 'Autem libero asddf', 'Eius nisi unde at re', '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(21, 'Dillary Benson', 'Autem libero asas', 'Eius nisi unde at re', '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(31, 'Hilary Howard', 'Eiusmod cupiditate e', 'Aut maiores recusand', '2023-03-17 13:17:02', '2023-03-17 13:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `file_path`, `thumbnail`, `created_at`, `updated_at`) VALUES
(19, 31, 'uploads/product/thumb_573139846.jpeg', 31, '2023-03-17 13:17:00', '2023-03-17 13:17:03'),
(20, 31, 'uploads/product/thumb_880321908.jpg', 32, '2023-03-18 00:34:35', '2023-03-18 00:34:35'),
(21, 31, 'uploads/product/thumb_2060851067.jpeg', 31, '2023-03-18 00:57:40', '2023-03-18 00:57:40'),
(22, 31, 'uploads/product/thumb_123401644.jpeg', 32, '2023-03-18 00:58:38', '2023-03-18 00:58:38'),
(23, 31, 'uploads/product/thumb_1457218448.jpeg', 31, '2023-03-18 01:01:11', '2023-03-18 01:01:11'),
(24, 31, 'uploads/product/thumb_856595501.jpeg', 31, '2023-03-18 01:01:50', '2023-03-18 01:01:50'),
(25, 31, 'uploads/product/thumb_573000176.jpeg', 31, '2023-03-18 01:17:10', '2023-03-18 01:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `variant`, `variant_id`, `product_id`, `created_at`, `updated_at`) VALUES
(113, 'test', 1, 16, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(114, 'testt', 1, 16, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(115, 'gfdgfg', 1, 16, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(116, 'dfsd', 2, 16, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(117, 'sdfssdg', 6, 16, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(118, 'test', 1, 18, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(119, 'testt', 1, 18, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(120, 'gfdgfg', 1, 18, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(121, 'dfsd', 2, 18, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(122, 'sdfssdg', 6, 18, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(123, 'test', 1, 19, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(124, 'testt', 1, 19, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(125, 'gfdgfg', 1, 19, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(126, 'dfsd', 2, 19, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(127, 'sdfssdg', 6, 19, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(128, 'test', 1, 20, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(129, 'testt', 1, 20, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(130, 'gfdgfg', 1, 20, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(131, 'dfsd', 2, 20, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(132, 'sdfssdg', 6, 20, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(133, 'test', 1, 21, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(134, 'testt', 1, 21, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(135, 'gfdgfg', 1, 21, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(136, 'dfsd', 2, 21, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(137, 'sdfssdg', 6, 21, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(148, 'Omnis', 6, 31, '2023-03-17 13:17:03', '2023-03-17 13:17:03'),
(149, 'tew', 1, 31, '2023-03-17 13:17:03', '2023-03-17 13:17:03'),
(150, 'tes', 1, 31, '2023-03-17 13:17:03', '2023-03-17 13:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_prices`
--

CREATE TABLE `product_variant_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_one` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variant_two` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variant_three` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variant_prices`
--

INSERT INTO `product_variant_prices` (`id`, `product_variant_one`, `product_variant_two`, `product_variant_three`, `price`, `stock`, `product_id`, `created_at`, `updated_at`) VALUES
(80, 113, 116, 117, 11, 2, 16, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(81, 114, 116, 117, 22, 3, 16, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(82, 115, 116, 117, 33, 5, 16, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(83, 113, 116, 117, 11, 2, 18, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(84, 114, 116, 117, 22, 3, 18, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(85, 115, 116, 117, 33, 5, 18, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(86, 113, 116, 117, 11, 2, 19, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(87, 114, 116, 117, 22, 3, 19, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(88, 115, 116, 117, 33, 5, 19, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(89, 113, 116, 117, 11, 2, 20, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(90, 114, 116, 117, 22, 3, 20, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(91, 115, 116, 117, 33, 5, 20, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(92, 113, 116, 117, 11, 2, 21, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(93, 114, 116, 117, 22, 3, 21, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(94, 115, 116, 117, 33, 5, 21, '2023-03-16 16:11:19', '2023-03-16 16:11:19'),
(95, 150, 150, 150, 10, 1, 31, '2023-03-17 13:17:03', '2023-03-17 13:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$10$NfLWLL9Mj6dCi0fQ3TBqWO53ZFsDlGUZmFl.gILMhHDHVi34XwWKW', NULL, '2020-08-28 00:03:42', '2020-08-28 00:03:42'),
(2, 'Md Fazle Rabby', 'frranad1@gmail.com', NULL, '$2y$10$TtWYq0qS9df8yOBgHtH2NuQPEfhUd5EkK49HL6CAaXg9rdrj7K2DK', 'vYIrnB0JvSKMd8SIF5XeIcKKlk2YGhDvTUimgAbu7QNEm0f8Vzrmx960MFHR', '2023-03-16 04:42:11', '2023-03-16 04:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'asdfadsf', NULL, '2020-08-31 08:53:32'),
(2, 'Size', 'adfsasdf', NULL, '2020-08-31 08:54:28'),
(6, 'Style', 'Description', '2020-08-31 09:46:24', '2020-08-31 09:46:24'),
(7, 'Test', 'Test note', '2023-03-16 04:45:17', '2023-03-16 04:45:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_tags_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variants_variant_id_foreign` (`variant_id`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variant_prices`
--
ALTER TABLE `product_variant_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_variant_prices_product_variant_one_foreign` (`product_variant_one`),
  ADD KEY `product_variant_prices_product_variant_two_foreign` (`product_variant_two`),
  ADD KEY `product_variant_prices_product_variant_three_foreign` (`product_variant_three`);

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
  ADD UNIQUE KEY `variants_title_unique` (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `product_variant_prices`
--
ALTER TABLE `product_variant_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`);

--
-- Constraints for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD CONSTRAINT `blog_tags_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variant_prices`
--
ALTER TABLE `product_variant_prices`
  ADD CONSTRAINT `product_variant_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_prices_product_variant_one_foreign` FOREIGN KEY (`product_variant_one`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_prices_product_variant_three_foreign` FOREIGN KEY (`product_variant_three`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_prices_product_variant_two_foreign` FOREIGN KEY (`product_variant_two`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
