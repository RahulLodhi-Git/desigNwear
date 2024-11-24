-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 04:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `designwear`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `full_name` varchar(2000) NOT NULL,
  `contact_number` varchar(2000) NOT NULL,
  `alternate_number` varchar(2000) DEFAULT NULL,
  `address_line_1` text NOT NULL,
  `address_line_2` text DEFAULT NULL,
  `landmark` int(255) DEFAULT NULL,
  `country_id` int(255) NOT NULL,
  `state_id` int(255) NOT NULL,
  `city` varchar(2000) NOT NULL,
  `email` varchar(2000) NOT NULL,
  `location_coordinates` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cloth_materials`
--

CREATE TABLE `cloth_materials` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `last_change_user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cloth_materials`
--

INSERT INTO `cloth_materials` (`id`, `name`, `created_at`, `updated_at`, `last_change_user_id`) VALUES
(1, 'Pure Cotton', '2024-06-20 10:27:45.000000', '2024-06-20 10:27:45.000000', 12),
(2, 'Nylon', '2024-06-20 10:28:07.000000', '2024-06-20 10:28:07.000000', 12),
(3, 'CM_03', '2024-06-20 10:28:25.000000', '2024-06-20 10:28:25.000000', 12),
(4, 'CM_04', '2024-06-20 10:28:25.000000', '2024-06-20 10:28:25.000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cloth_styles`
--

CREATE TABLE `cloth_styles` (
  `id` int(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `last_change_user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cloth_styles`
--

INSERT INTO `cloth_styles` (`id`, `name`, `created_at`, `updated_at`, `last_change_user_id`) VALUES
(1, 'Regular', '2024-06-20 10:29:20.000000', '2024-06-20 10:29:20.000000', 12),
(2, 'OverSized', '2024-06-20 10:29:20.000000', '2024-06-20 10:30:26.424202', 12);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_records`
--

CREATE TABLE `delivery_records` (
  `id` int(255) NOT NULL,
  `order_id` int(255) NOT NULL,
  `order_item_id` int(255) NOT NULL,
  `delivery_address_id` int(255) NOT NULL,
  `billing_address_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `expected_delivery_date` varchar(2000) NOT NULL,
  `delivery_parttner` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(255) NOT NULL,
  `payment_id` int(255) NOT NULL,
  `total` int(255) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `user_id` int(255) NOT NULL,
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `coupon_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(255) NOT NULL,
  `order_id` int(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `billing_address_id` int(255) NOT NULL,
  `delivery_address_id` int(255) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `design_id` int(255) NOT NULL,
  `size` varchar(500) NOT NULL,
  `cloth_material_id` int(255) NOT NULL,
  `cloth_style_type_id` int(255) NOT NULL,
  `refund_status` varchar(500) DEFAULT NULL,
  `refund_reason` varchar(500) DEFAULT NULL,
  `refund` tinyint(1) DEFAULT NULL,
  `replace` tinyint(1) DEFAULT NULL,
  `replace_status` varchar(500) DEFAULT NULL,
  `replace_reason` varchar(500) DEFAULT NULL,
  `customer_feedback_Id` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `delivery_detail_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments_records`
--

CREATE TABLE `payments_records` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL,
  `coupon_id` int(255) NOT NULL,
  `status` varchar(500) NOT NULL,
  `provider` varchar(500) NOT NULL,
  `amount` int(255) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `is_any_coupon_applied` tinyint(1) NOT NULL,
  `coupon_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `full_name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `role` varchar(200) NOT NULL DEFAULT 'user',
  `username` varchar(500) DEFAULT NULL,
  `password` varchar(500) NOT NULL,
  `avatar_url` varchar(5000) DEFAULT NULL,
  `country_code` int(255) DEFAULT 91,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `mobile_number` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `email`, `role`, `username`, `password`, `avatar_url`, `country_code`, `created_at`, `updated_at`, `mobile_number`) VALUES
(16, 'rahul', 'David2@dnw.com', 'user', NULL, '$2b$10$z.l76JsHh2whawZEA9xLpu17Dlj5WAp.fCO/0xaOG4pIgdWuxSGBO', NULL, 91, '2024-06-12 14:26:28.792129', '2024-06-12 14:26:28.792129', NULL),
(17, 'rahul', 'David2s@dnw.com', 'user', NULL, '$2b$10$IeTxpuWsqCSxzqFcnsKYH.NDzRLImR9II.oI1aVYK0NQAUDSwm6XW', NULL, 91, '2024-06-12 14:27:20.132364', '2024-06-12 14:27:20.132364', NULL),
(15, 'rahul', 'David@dnw.com', 'user', NULL, '$2b$10$N1VSEeUfsjjr83U6Qf70k.nRs.NnPBLM134B9SEPmkrpRGJaorq6W', NULL, 91, '2024-06-12 14:24:52.168645', '2024-06-12 14:24:52.168645', NULL),
(14, 'rahul', 'karan@dnw.com', 'user', NULL, '$2b$10$gSobNMjyHHhLgrA9mKjL2uA0sVnFBdr7NWgrD2mS.NVKarSJmpS8a', NULL, 91, '2024-06-12 14:23:55.031113', '2024-06-12 14:23:55.031113', NULL),
(13, 'rahul', 'kavya@dnw.com', 'user', NULL, '$2b$10$GMh0nLLxrw7QowEN0PLhYujgYDk6J3.3sNSxzqXqpLtcqV7VGJkvW', NULL, 91, '2024-06-12 14:18:12.233493', '2024-06-12 14:18:12.233493', NULL),
(12, 'rahul', 'tesdeddedyt@dnw.com', 'user', NULL, '$2b$10$PIoXNOcMsBM.6WA8qGqMguusv7IOdvzKfr.Hclv5GMPYj025C2y4G', NULL, 91, '2024-06-12 14:13:33.387251', '2024-06-12 14:13:33.387251', NULL),
(11, 'rahul', 'tesdeddeyt@dnw.com', 'user', NULL, '$2b$10$03NrOhN0rWHybsk7yoG5kOPSXBFibmsm5AXUhN0xhij1u.q4.f1ka', NULL, 91, '2024-06-12 14:10:29.822498', '2024-06-12 14:10:29.822498', NULL),
(10, 'rahul', 'tesdedeyt@dnw.com', 'user', NULL, '$2b$10$J5CCAjeJ28EGKv9ALU54quCWLYHN5GuvJAElSS5vVRDXbtW6DVmsW', NULL, 91, '2024-06-12 14:10:03.443767', '2024-06-12 14:10:03.443767', NULL),
(8, 'rahul', 'tesedet@dnw.com', 'user', NULL, '$2b$10$W11oA2F9ftKMLcw595S2Tu8wjXIZIgLX5tpmvncYJ2..mHKn1eWHq', NULL, 91, '2024-06-12 07:28:59.498998', '2024-06-12 07:28:59.498998', NULL),
(9, 'rahul', 'tesedeyt@dnw.com', 'user', NULL, '$2b$10$BO8bBF0FuWmfi4Dtf4K.wOJNe89fg10xPpWvlF.GVADsqaXsSyQfS', NULL, 91, '2024-06-12 08:06:03.518686', '2024-06-12 08:06:03.518686', NULL),
(7, 'rahul', 'teseet@dnw.com', 'user', NULL, '$2b$10$.LTSU32sZlyyJ1nRwOkbCu.yIvaeqd1TeOZg1gv2whDv.HEKnT6C.', NULL, 91, '2024-06-12 07:28:35.715126', '2024-06-12 07:28:35.715126', NULL),
(6, 'rahul', 'teset@dnw.com', 'user', NULL, '$2b$10$cOaB6OsKs3zyvca.NiNrv.AKHqw9DRgULJd9mnJvYqLwHrljM44jG', NULL, 91, '2024-06-12 07:20:20.431196', '2024-06-12 07:20:20.431196', NULL),
(5, 'rahul', 'tesst@dnw.com', 'user', NULL, '$2b$10$Jnk/3pIdjDgatcAYG3pERunvcx5Qa6g6xdp2MRKx4ICOaom0UHFge', NULL, 91, '2024-06-12 07:19:54.891057', '2024-06-12 07:19:54.891057', NULL),
(1, 'rahul', 'test@dnw.com', 'user', NULL, '$2b$10$6PRtffz0kCiszWt1kiRsluvp/tctfs.9kPbArUYTWUGxKYpxcM5gy', NULL, 91, '2024-06-12 07:14:16.118536', '2024-06-12 07:14:16.118536', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cloth_materials`
--
ALTER TABLE `cloth_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cloth_styles`
--
ALTER TABLE `cloth_styles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_records`
--
ALTER TABLE `delivery_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments_records`
--
ALTER TABLE `payments_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `mobile_number` (`mobile_number`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cloth_materials`
--
ALTER TABLE `cloth_materials`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cloth_styles`
--
ALTER TABLE `cloth_styles`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_records`
--
ALTER TABLE `delivery_records`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments_records`
--
ALTER TABLE `payments_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
