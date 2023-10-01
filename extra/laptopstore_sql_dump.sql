-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2023 at 12:08 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptopstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `address`, `created_at`) VALUES
(1, 'Belize', '2023-09-30 22:08:07'),
(2, 'Corozal', '2023-09-30 22:08:07'),
(3, 'OrangeWalk', '2023-09-30 22:08:07'),
(4, 'Cayo', '2023-09-30 22:08:07'),
(5, 'StannCreek', '2023-09-30 22:08:07'),
(6, 'Toledo', '2023-09-30 22:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `name`, `status`, `created_at`) VALUES
(1, 'Apple', 1, '2023-09-30 22:08:07'),
(2, 'Dell', 1, '2023-09-30 22:08:07'),
(3, 'HP (Hewlett-Packard)', 1, '2023-09-30 22:08:07'),
(4, 'Lenovo', 1, '2023-09-30 22:08:07'),
(5, 'Acer', 1, '2023-09-30 22:08:07'),
(6, 'Asus', 1, '2023-09-30 22:08:07'),
(7, 'Microsoft', 1, '2023-09-30 22:08:07'),
(8, 'MSI (Micro-Star International)', 1, '2023-09-30 22:08:07'),
(9, 'Samsung', 1, '2023-09-30 22:08:07'),
(10, 'LG', 1, '2023-09-30 22:08:07'),
(11, 'Sony (Sony VAIO)', 1, '2023-09-30 22:08:07'),
(12, 'Toshiba', 1, '2023-09-30 22:08:07'),
(13, 'Razer', 1, '2023-09-30 22:08:07'),
(14, 'Alienware (a subsidiary of Dell)', 1, '2023-09-30 22:08:07'),
(15, 'Huawei', 1, '2023-09-30 22:08:07'),
(16, 'Gigabyte', 1, '2023-09-30 22:08:07'),
(17, 'Fujitsu', 1, '2023-09-30 22:08:07'),
(18, 'Panasonic', 1, '2023-09-30 22:08:07'),
(19, 'Google (Pixelbook)', 1, '2023-09-30 22:08:07'),
(20, 'LG (Gram)', 1, '2023-09-30 22:08:07'),
(21, 'Chuwi', 1, '2023-09-30 22:08:07'),
(22, 'Xiaomi', 1, '2023-09-30 22:08:07'),
(23, 'Gateway', 1, '2023-09-30 22:08:07'),
(24, 'Medion', 1, '2023-09-30 22:08:07'),
(25, 'Aorus', 1, '2023-09-30 22:08:07'),
(26, 'System76', 1, '2023-09-30 22:08:07'),
(27, 'Vaio (Independent from Sony)', 1, '2023-09-30 22:08:07'),
(28, 'Dynabook (formerly Toshiba)', 1, '2023-09-30 22:08:07'),
(29, 'Clevo (primarily an ODM)', 1, '2023-09-30 22:08:07'),
(30, 'Eluktronics', 1, '2023-09-30 22:08:07'),
(31, 'Eurocom', 1, '2023-09-30 22:08:07'),
(32, 'HCL', 1, '2023-09-30 22:08:07'),
(33, 'Vizio', 1, '2023-09-30 22:08:07'),
(34, 'Purism', 1, '2023-09-30 22:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `created_at`) VALUES
(1, 'Ultrabook', '2023-09-30 22:08:07'),
(2, 'Gaming Laptop', '2023-09-30 22:08:07'),
(3, 'Business Laptop', '2023-09-30 22:08:07'),
(4, '2-in-1 (convertible or Hybrid)', '2023-09-30 22:08:07'),
(5, 'Chromebooks', '2023-09-30 22:08:07'),
(6, 'Workstations', '2023-09-30 22:08:07'),
(7, 'Budget', '2023-09-30 22:08:07'),
(8, 'Rugged', '2023-09-30 22:08:07'),
(9, 'Student', '2023-09-30 22:08:07'),
(10, 'Multimedia', '2023-09-30 22:08:07'),
(11, 'Travel', '2023-09-30 22:08:07'),
(12, 'Laptops for Creative Professionals', '2023-09-30 22:08:07'),
(13, 'Education', '2023-09-30 22:08:07'),
(14, 'High-Performance', '2023-09-30 22:08:07'),
(15, 'Linux', '2023-09-30 22:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `review_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `review_count` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`review_id`, `customer_id`, `review_count`, `message`, `created_at`) VALUES
(1, 2, 4, 'Exceptional Service and easy to use buying experience! Would Recommend!!', '2023-09-30 22:08:07'),
(2, 3, 3, 'Took longer than expected for delivery, but I am still happy with the product. The service was nice.', '2023-09-30 22:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `laptops`
--

CREATE TABLE `laptops` (
  `laptop_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `cpu_type` varchar(255) DEFAULT NULL,
  `cpu_name` varchar(255) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `ram_type` varchar(255) DEFAULT NULL,
  `storage_type` varchar(255) DEFAULT NULL,
  `storage_capacity` int(11) DEFAULT NULL,
  `has_gpu` tinyint(1) DEFAULT NULL,
  `gpu_type` varchar(255) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `operating_system` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laptops`
--

INSERT INTO `laptops` (`laptop_id`, `category_id`, `name`, `brand`, `cpu_type`, `cpu_name`, `ram`, `ram_type`, `storage_type`, `storage_capacity`, `has_gpu`, `gpu_type`, `display`, `resolution`, `operating_system`, `price`, `status`, `created_at`) VALUES
(1, 1, 'Laptop Alpha', 8, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 256, 1, 'NVIDIA GeForce GTX 1650', '15.6\" LED', 'Full HD', 'Windows 10', 999, 1, '2023-09-30 22:08:07'),
(2, 2, 'Laptop Beta', 10, 'AMD', 'Ryzen 7', 16, 'DDR4', 'NVMe SSD', 512, 1, 'NVIDIA GeForce RTX 3070', '17.3\" IPS', '4K UHD', 'Windows 11', 1499, 1, '2023-09-30 22:08:07'),
(3, 3, 'Laptop Gamma', 3, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 512, 1, 'NVIDIA GeForce RTX 3060', '15.6\" IPS', 'Full HD', 'Windows 10', 1299, 1, '2023-09-30 22:08:07'),
(4, 4, 'Laptop Delta', 15, 'AMD', 'Ryzen 5', 12, 'DDR4', 'HDD', 128, 0, NULL, '14\" LCD', 'HD', 'Linux', 699, 1, '2023-09-30 22:08:07'),
(5, 5, 'Laptop Epsilon', 8, 'Intel', 'Core i9', 32, 'DDR4', 'SSD', 1000, 1, 'NVIDIA GeForce RTX 3080', '17.3\" OLED', '4K UHD', 'Windows 10', 2499, 1, '2023-09-30 22:08:07'),
(6, 6, 'Laptop Zeta', 5, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 512, 1, 'NVIDIA GeForce GTX 1660 Ti', '15.6\" LED', 'Full HD', 'Windows 11', 1199, 1, '2023-09-30 22:08:07'),
(7, 7, 'Laptop Eta', 2, 'AMD', 'Ryzen 5', 8, 'DDR4', 'SSD', 256, 1, 'AMD Radeon Graphics', '14\" IPS', 'Full HD', 'Windows 10', 899, 1, '2023-09-30 22:08:07'),
(8, 8, 'Laptop Theta', 4, 'Intel', 'Core i3', 4, 'DDR3', 'HDD', 500, 0, NULL, '13.3\" LED', 'HD', 'Windows 10', 499, 1, '2023-09-30 22:08:07'),
(9, 9, 'Laptop Iota', 9, 'AMD', 'Ryzen 9', 32, 'DDR4', 'NVMe SSD', 1000, 1, 'NVIDIA GeForce RTX 3060', '15.6\" IPS', 'Full HD', 'Windows 11', 1599, 1, '2023-09-30 22:08:07'),
(10, 10, 'Laptop Kappa', 11, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 512, 1, 'Intel Iris Xe Graphics', '14\" IPS', 'Full HD', 'Windows 11', 1299, 1, '2023-09-30 22:08:07'),
(11, 11, 'Laptop Lambda', 14, 'AMD', 'Ryzen 5', 8, 'DDR4', 'SSD', 256, 1, 'AMD Radeon Graphics', '13.3\" LED', 'Full HD', 'Windows 10', 799, 1, '2023-09-30 22:08:07'),
(12, 12, 'Laptop Mu', 1, 'Intel', 'Celeron', 4, 'DDR3', 'HDD', 320, 0, NULL, '15.6\" LED', 'HD', 'Windows 10', 399, 1, '2023-09-30 22:08:07'),
(13, 13, 'Laptop Nu', 7, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 256, 1, 'Intel UHD Graphics', '15.6\" LED', 'Full HD', 'Windows 10', 699, 1, '2023-09-30 22:08:07'),
(14, 14, 'Laptop Xi', 12, 'AMD', 'Ryzen 3', 8, 'DDR4', 'SSD', 512, 0, NULL, '14\" LCD', 'HD', 'Linux', 549, 1, '2023-09-30 22:08:07'),
(15, 15, 'Laptop Omicron', 6, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 512, 1, 'Intel Iris Xe Graphics', '15.6\" IPS', 'Full HD', 'Windows 10', 849, 1, '2023-09-30 22:08:07'),
(16, 16, 'Laptop Pi', 3, 'AMD', 'Ryzen 7', 16, 'DDR4', 'NVMe SSD', 1000, 1, 'NVIDIA GeForce GTX 1660 Ti', '17.3\" IPS', 'Full HD', 'Windows 11', 1399, 1, '2023-09-30 22:08:07'),
(17, 17, 'Laptop Rho', 5, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 256, 1, 'NVIDIA GeForce GTX 1650', '15.6\" LED', 'Full HD', 'Windows 11', 1199, 1, '2023-09-30 22:08:07'),
(18, 18, 'Laptop Sigma', 2, 'AMD', 'Ryzen 9', 32, 'DDR4', 'SSD', 1000, 1, 'NVIDIA GeForce RTX 3070', '17.3\" OLED', '4K UHD', 'Windows 11', 1899, 1, '2023-09-30 22:08:07'),
(19, 19, 'Laptop Tau', 13, 'Intel', 'Core i3', 4, 'DDR3', 'HDD', 500, 0, NULL, '13.3\" LED', 'HD', 'Windows 10', 499, 1, '2023-09-30 22:08:07'),
(20, 20, 'Laptop Upsilon', 4, 'Intel', 'Core i7', 16, 'DDR4', 'NVMe SSD', 512, 1, 'NVIDIA GeForce GTX 1660 Ti', '15.6\" IPS', 'Full HD', 'Windows 10', 1299, 1, '2023-09-30 22:08:07'),
(21, 12, 'Laptop Mu', 7, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 512, 1, 'Intel UHD Graphics', '14\" LED', 'Full HD', 'Windows 10', 749, 1, '2023-09-30 22:08:07'),
(22, 6, 'Laptop Chi', 8, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 256, 1, 'Intel UHD Graphics', '15.6\" LED', 'Full HD', 'Windows 10', 799, 1, '2023-09-30 22:08:07'),
(23, 11, 'Laptop Psi', 2, 'AMD', 'Ryzen 3', 8, 'DDR4', 'SSD', 256, 0, NULL, '14\" LCD', 'HD', 'Linux', 549, 1, '2023-09-30 22:08:07'),
(24, 3, 'Laptop Omega', 9, 'Intel', 'Core i7', 16, 'DDR4', 'NVMe SSD', 1000, 1, 'NVIDIA GeForce GTX 1660 Ti', '17.3\" IPS', 'Full HD', 'Windows 11', 1399, 1, '2023-09-30 22:08:07'),
(25, 5, 'Laptop Zeta', 10, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 256, 1, 'NVIDIA GeForce GTX 1650', '15.6\" LED', 'Full HD', 'Windows 11', 1199, 1, '2023-09-30 22:08:07'),
(26, 7, 'Laptop Eta', 14, 'AMD', 'Ryzen 9', 32, 'DDR4', 'SSD', 1000, 1, 'NVIDIA GeForce RTX 3070', '17.3\" OLED', '4K UHD', 'Windows 11', 1899, 1, '2023-09-30 22:08:07'),
(27, 2, 'Laptop Theta', 3, 'Intel', 'Core i3', 4, 'DDR3', 'HDD', 500, 0, NULL, '13.3\" LED', 'HD', 'Windows 10', 499, 1, '2023-09-30 22:08:07'),
(28, 13, 'Laptop Iota', 1, 'AMD', 'Ryzen 7', 16, 'DDR4', 'NVMe SSD', 1000, 1, 'NVIDIA GeForce RTX 3060', '15.6\" IPS', 'Full HD', 'Windows 11', 1599, 1, '2023-09-30 22:08:07'),
(29, 4, 'Laptop Kappa', 6, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 512, 1, 'Intel Iris Xe Graphics', '14\" IPS', 'Full HD', 'Windows 11', 1299, 1, '2023-09-30 22:08:07'),
(30, 1, 'Laptop Lambda', 5, 'AMD', 'Ryzen 5', 8, 'DDR4', 'SSD', 256, 0, NULL, '15.6\" LED', 'Full HD', 'Windows 10', 899, 1, '2023-09-30 22:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `laptop_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `laptop_id`, `created_at`) VALUES
(1, 2, 1, '2023-09-30 22:08:07'),
(2, 3, 2, '2023-09-30 22:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `created_at`) VALUES
(1, 'employee', '2023-09-30 22:08:07'),
(2, 'customer', '2023-09-30 22:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `member` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `firstname`, `lastname`, `username`, `email`, `address`, `password`, `member`, `status`, `created_at`) VALUES
(1, 1, 'Tadeo', 'Bennett', 'TBennett', 'tadeo@gmail.com', 4, 'Tadeo2002', 0, 1, '2023-09-30 22:08:07'),
(2, 2, 'William', 'Locario', 'WLocario', 'william@gmail.com', 6, 'William2002', 1, 1, '2023-09-30 22:08:07'),
(3, 2, 'Victor', 'Castillo', 'VCastillo', 'victor@gmail.com', 2, 'Victor2002', 0, 1, '2023-09-30 22:08:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `laptops`
--
ALTER TABLE `laptops`
  ADD PRIMARY KEY (`laptop_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `laptop_id` (`laptop_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `address` (`address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `laptops`
--
ALTER TABLE `laptops`
  MODIFY `laptop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `laptops`
--
ALTER TABLE `laptops`
  ADD CONSTRAINT `laptops_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `laptops_ibfk_2` FOREIGN KEY (`brand`) REFERENCES `brands` (`brand_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`laptop_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`address`) REFERENCES `addresses` (`address_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
