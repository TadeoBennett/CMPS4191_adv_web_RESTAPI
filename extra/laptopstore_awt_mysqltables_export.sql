SET foreign_key_checks = 0;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS laptops;
DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS brands;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS key_permissions;
DROP TABLE IF EXISTS permissions;
DROP TABLE IF EXISTS methods;
DROP TABLE IF EXISTS user_keys;


CREATE TABLE `users` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `role_id` INT,
  `firstname` varchar(255),
  `lastname` varchar(255),
  `username` varchar(255),
  `email` varchar(255),
  `address` INT,
  `phone` varchar(255),
  `age` INT,
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
  `brand` varchar(255),
  `status` int,
  `created_at` timestamp
);

CREATE TABLE `categories` (
  `category_id` INT PRIMARY KEY AUTO_INCREMENT,
  `category` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `feedback` (
  `review_id` INT PRIMARY KEY AUTO_INCREMENT,
  `customer_id` INT,
  `review_count` int,
  `message` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `user_keys` (
  `key_id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT,
  `key` varchar(255),
  `expired` int,
  `created_at` timestamp,
  `status` bool
);

CREATE TABLE `key_permissions` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `key_id` INT,
  `permission_id` INT,
  `method_id` INT,
  `created_at` timestamp,
  `status` bool
);

CREATE TABLE `permissions` (
  `permission_id` INT PRIMARY KEY AUTO_INCREMENT,
  `parent` varchar(255),
  `resource` varchar(255),
  `created_at` timestamp,
  `status` bool
);

CREATE TABLE `methods` (
  `method_id` INT PRIMARY KEY AUTO_INCREMENT,
  `method` varchar(255),
  `created_at` timestamp
);

ALTER TABLE `users` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`address`) REFERENCES `addresses` (`address_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

ALTER TABLE `orders` ADD FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`laptop_id`) ON DELETE CASCADE;

ALTER TABLE `laptops` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

ALTER TABLE `laptops` ADD FOREIGN KEY (`brand`) REFERENCES `brands` (`brand_id`);

ALTER TABLE `feedback` ADD FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

ALTER TABLE `user_keys` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)  ON DELETE CASCADE;

ALTER TABLE `key_permissions` ADD FOREIGN KEY (`key_id`) REFERENCES `user_keys` (`key_id`) ON DELETE CASCADE;

ALTER TABLE `key_permissions` ADD FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`);

ALTER TABLE `key_permissions` ADD FOREIGN KEY (`method_id`) REFERENCES `methods` (`method_id`);
