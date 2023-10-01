DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS laptops;
DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS brands;
DROP TABLE IF EXISTS categories;


CREATE TABLE `users` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `role_id` INT,
  `firstname` varchar(255),
  `lastname` varchar(255),
  `username` varchar(255),
  `email` varchar(255),
  `address` INT,
  `password` varchar(255),
  `member` bool,
  `status` bool,
  `created_at` timestamp
);

CREATE TABLE `roles` (
  `role_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `addresses` (
  `address_id` INT PRIMARY KEY AUTO_INCREMENT,
  `address` varchar(255),
  `created_at` timestamp
);


CREATE TABLE `orders` (
  `order_id` INT PRIMARY KEY AUTO_INCREMENT,
  `customer_id` INT,
  `laptop_id` INT,
  `created_at` timestamp
);

CREATE TABLE `laptops` (
  `laptop_id` INT PRIMARY KEY AUTO_INCREMENT,
  `category_id` INT,
  `name` varchar(255),
  `brand` int,
  `cpu_type` varchar(255),
  `cpu_name` varchar(255),
  `ram` int,
  `ram_type` varchar(255),
  `storage_type` varchar(255),
  `storage_capacity` int,
  `has_gpu` bool,
  `gpu_type` varchar(255),
  `display` varchar(255),
  `resolution` varchar(255),
  `operating_system` varchar(255),
  `price` int,
  `status` bool,
  `created_at` timestamp
);

CREATE TABLE `brands` (
  `brand_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `status` int,
  `created_at` timestamp
);

CREATE TABLE `categories` (
  `category_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `feedback` (
  `review_id` INT PRIMARY KEY AUTO_INCREMENT,
  `customer_id` INT,
  `review_count` int,
  `message` varchar(255),
  `created_at` timestamp
);

ALTER TABLE `users` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`address`) REFERENCES `addresses` (`address_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`laptop_id`);

ALTER TABLE `laptops` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

ALTER TABLE `laptops` ADD FOREIGN KEY (`brand`) REFERENCES `brands` (`brand_id`);

ALTER TABLE `feedback` ADD FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`);
