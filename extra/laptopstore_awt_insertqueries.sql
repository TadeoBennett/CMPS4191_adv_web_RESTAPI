--  insert the roles
INSERT INTO `roles` (`role_id`, `name`, `created_at`) VALUES
 (NULL, 'employee', current_timestamp()),
 (NULL, 'customer', current_timestamp());



--  insert the addresses
INSERT INTO `addresses` (`address_id`, `address`, `created_at`) VALUES 
 (NULL, 'Belize', current_timestamp()),
 (NULL, 'Corozal', current_timestamp()),
 (NULL, 'OrangeWalk', current_timestamp()),
 (NULL, 'Cayo', current_timestamp()),
 (NULL, 'StannCreek', current_timestamp()),
 (NULL, 'Toledo', current_timestamp());


--  insert categories
INSERT INTO `categories` (`category_id`, `name`, `created_at`) VALUES
 (NULL, 'Ultrabook', current_timestamp()),
 (NULL, 'Gaming Laptop', current_timestamp()),
 (NULL, 'Business Laptop', current_timestamp()),
 (NULL, '2-in-1 (convertible or Hybrid)', current_timestamp()),
 (NULL, 'Chromebooks', current_timestamp()),
 (NULL, 'Workstations', current_timestamp()),
 (NULL, 'Budget', current_timestamp()),
 (NULL, 'Rugged', current_timestamp()),
 (NULL, 'Student', current_timestamp()),
 (NULL, 'Multimedia', current_timestamp()),
 (NULL, 'Travel', current_timestamp()),
 (NULL, 'Laptops for Creative Professionals', current_timestamp()),
 (NULL, 'Education', current_timestamp()),
 (NULL, 'High-Performance', current_timestamp()),
 (NULL, 'Linux', current_timestamp());


--  insert 3 students
INSERT INTO `users` (`role_id`, `firstname`, `lastname`, `username`, `email`, `address`, `phone`, `age`, `password`, `member`, `status`, `created_at`) VALUES 
 (1, 'Tadeo', 'Bennett', 'TBennett', 'tadeo@gmail.com', '4', '', 21, 'Tadeo2002', '0', '1', current_timestamp()),
 (2, 'William', 'Locario', 'WLocario', 'william@gmail.com', '6', '', 22, 'William2002', '1', '1', current_timestamp()), 
 (2, 'Victor', 'Castillo', 'VCastillo', 'victor@gmail.com', '2', '', 19, 'Victor2002', '0', '1', current_timestamp());


--  insert brands
INSERT INTO `brands` (`name`, `status`, `created_at`)
VALUES
('Apple', 1, NOW()),
('Dell', 1, NOW()),
('HP (Hewlett-Packard)', 1, NOW()),
('Lenovo', 1, NOW()),
('Acer', 1, NOW()),
('Asus', 1, NOW()),
('Microsoft', 1, NOW()),
('MSI (Micro-Star International)', 1, NOW()),
('Samsung', 1, NOW()),
('LG', 1, NOW()),
('Sony (Sony VAIO)', 1, NOW()),
('Toshiba', 1, NOW()),
('Razer', 1, NOW()),
('Alienware (a subsidiary of Dell)', 1, NOW()),
('Huawei', 1, NOW()),
('Gigabyte', 1, NOW()),
('Fujitsu', 1, NOW()),
('Panasonic', 1, NOW()),
('Google (Pixelbook)', 1, NOW()),
('LG (Gram)', 1, NOW()),
('Chuwi', 1, NOW()),
('Xiaomi', 1, NOW()),
('Gateway', 1, NOW()),
('Medion', 1, NOW()),
('Aorus', 1, NOW()),
('System76', 1, NOW()),
('Vaio (Independent from Sony)', 1, NOW()),
('Dynabook (formerly Toshiba)', 1, NOW()),
('Clevo (primarily an ODM)', 1, NOW()),
('Eluktronics', 1, NOW()),
('Eurocom', 1, NOW()),
('HCL', 1, NOW()),
('Vizio', 1, NOW()),
('Purism', 1, NOW());



-- insert 30 laptops
INSERT INTO `laptops` (`category_id`, `name`, `brand`, `cpu_type`, `cpu_name`, `ram`, `ram_type`, `storage_type`, `storage_capacity`, `has_gpu`, `gpu_type`, `display`, `resolution`, `operating_system`, `price`, `status`, `created_at`)
VALUES
--  Laptop 
(1, 'Laptop Alpha', 8, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 256, 1, 'NVIDIA GeForce GTX 1650', '15.6" LED', 'Full HD', 'Windows 10', 999, 1, NOW()),
--  Laptop 
(2, 'Laptop Beta', 10, 'AMD', 'Ryzen 7', 16, 'DDR4', 'NVMe SSD', 512, 1, 'NVIDIA GeForce RTX 3070', '17.3" IPS', '4K UHD', 'Windows 11', 1499, 1, NOW()),
--  Laptop 
(3, 'Laptop Gamma', 3, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 512, 1, 'NVIDIA GeForce RTX 3060', '15.6" IPS', 'Full HD', 'Windows 10', 1299, 1, NOW()),
--  Laptop 
(4, 'Laptop Delta', 15, 'AMD', 'Ryzen 5', 12, 'DDR4', 'HDD', 128, 0, NULL, '14" LCD', 'HD', 'Linux', 699, 1, NOW()), -- ipnoib
--  Laptop 
(5, 'Laptop Epsilon', 8, 'Intel', 'Core i9', 32, 'DDR4', 'SSD', 1000, 1, 'NVIDIA GeForce RTX 3080', '17.3" OLED', '4K UHD', 'Windows 10', 2499, 1, NOW()),
--  Laptop 
(6, 'Laptop Zeta', 5, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 512, 1, 'NVIDIA GeForce GTX 1660 Ti', '15.6" LED', 'Full HD', 'Windows 11', 1199, 1, NOW()),
--  Laptop 
(7, 'Laptop Eta', 2, 'AMD', 'Ryzen 5', 8, 'DDR4', 'SSD', 256, 1, 'AMD Radeon Graphics', '14" IPS', 'Full HD', 'Windows 10', 899, 1, NOW()),
--  Laptop 
(8, 'Laptop Theta', 4, 'Intel', 'Core i3', 4, 'DDR3', 'HDD', 500, 0, NULL, '13.3" LED', 'HD', 'Windows 10', 499, 1, NOW()),
--  Laptop 
(9, 'Laptop Iota', 9, 'AMD', 'Ryzen 9', 32, 'DDR4', 'NVMe SSD', 1000, 1, 'NVIDIA GeForce RTX 3060', '15.6" IPS', 'Full HD', 'Windows 11', 1599, 1, NOW()),
--  Laptop 1
(10, 'Laptop Kappa', 11, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 512, 1, 'Intel Iris Xe Graphics', '14" IPS', 'Full HD', 'Windows 11', 1299, 1, NOW()),
--  Laptop 1
(11, 'Laptop Lambda', 14, 'AMD', 'Ryzen 5', 8, 'DDR4', 'SSD', 256, 1, 'AMD Radeon Graphics', '13.3" LED', 'Full HD', 'Windows 10', 799, 1, NOW()),
--  Laptop 1
(12, 'Laptop Mu', 1, 'Intel', 'Celeron', 4, 'DDR3', 'HDD', 320, 0, NULL, '15.6" LED', 'HD', 'Windows 10', 399, 1, NOW()),
--  Laptop 1
(13, 'Laptop Nu', 7, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 256, 1, 'Intel UHD Graphics', '15.6" LED', 'Full HD', 'Windows 10', 699, 1, NOW()),
--  Laptop 1
(14, 'Laptop Xi', 12, 'AMD', 'Ryzen 3', 8, 'DDR4', 'SSD', 512, 0, NULL, '14" LCD', 'HD', 'Linux', 549, 1, NOW()),
--  Laptop 1
(15, 'Laptop Omicron', 6, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 512, 1, 'Intel Iris Xe Graphics', '15.6" IPS', 'Full HD', 'Windows 10', 849, 1, NOW()),
--  Laptop 1
(16, 'Laptop Pi', 3, 'AMD', 'Ryzen 7', 16, 'DDR4', 'NVMe SSD', 1000, 1, 'NVIDIA GeForce GTX 1660 Ti', '17.3" IPS', 'Full HD', 'Windows 11', 1399, 1, NOW()),
--  Laptop 1
(17, 'Laptop Rho', 5, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 256, 1, 'NVIDIA GeForce GTX 1650', '15.6" LED', 'Full HD', 'Windows 11', 1199, 1, NOW()),
--  Laptop 
(18, 'Laptop Sigma', 2, 'AMD', 'Ryzen 9', 32, 'DDR4', 'SSD', 1000, 1, 'NVIDIA GeForce RTX 3070', '17.3" OLED', '4K UHD', 'Windows 11', 1899, 1, NOW()),
--  Laptop 1
(19, 'Laptop Tau', 13, 'Intel', 'Core i3', 4, 'DDR3', 'HDD', 500, 0, NULL, '13.3" LED', 'HD', 'Windows 10', 499, 1, NOW()),
--  Laptop 2
(20, 'Laptop Upsilon', 4, 'Intel', 'Core i7', 16, 'DDR4', 'NVMe SSD', 512, 1, 'NVIDIA GeForce GTX 1660 Ti', '15.6" IPS', 'Full HD', 'Windows 10', 1299, 1, NOW()),
--  Laptop 2
(12, 'Laptop Mu', 7, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 512, 1, 'Intel UHD Graphics', '14" LED', 'Full HD', 'Windows 10', 749, 1, NOW()),
--  Laptop 2
(6, 'Laptop Chi', 8, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 256, 1, 'Intel UHD Graphics', '15.6" LED', 'Full HD', 'Windows 10', 799, 1, NOW()),
--  Laptop 2
(11, 'Laptop Psi', 2, 'AMD', 'Ryzen 3', 8, 'DDR4', 'SSD', 256, 0, NULL, '14" LCD', 'HD', 'Linux', 549, 1, NOW()),
--  Laptop 2
(3, 'Laptop Omega', 9, 'Intel', 'Core i7', 16, 'DDR4', 'NVMe SSD', 1000, 1, 'NVIDIA GeForce GTX 1660 Ti', '17.3" IPS', 'Full HD', 'Windows 11', 1399, 1, NOW()),
--  Laptop 2
(5, 'Laptop Zeta', 10, 'Intel', 'Core i5', 8, 'DDR4', 'SSD', 256, 1, 'NVIDIA GeForce GTX 1650', '15.6" LED', 'Full HD', 'Windows 11', 1199, 1, NOW()),
--  Laptop 2
(7, 'Laptop Eta', 14, 'AMD', 'Ryzen 9', 32, 'DDR4', 'SSD', 1000, 1, 'NVIDIA GeForce RTX 3070', '17.3" OLED', '4K UHD', 'Windows 11', 1899, 1, NOW()),
--  Laptop 2
(2, 'Laptop Theta', 3, 'Intel', 'Core i3', 4, 'DDR3', 'HDD', 500, 0, NULL, '13.3" LED', 'HD', 'Windows 10', 499, 1, NOW()),
--  Laptop 2
(13, 'Laptop Iota', 1, 'AMD', 'Ryzen 7', 16, 'DDR4', 'NVMe SSD', 1000, 1, 'NVIDIA GeForce RTX 3060', '15.6" IPS', 'Full HD', 'Windows 11', 1599, 1, NOW()),
--  Laptop 2
(4, 'Laptop Kappa', 6, 'Intel', 'Core i7', 16, 'DDR4', 'SSD', 512, 1, 'Intel Iris Xe Graphics', '14" IPS', 'Full HD', 'Windows 11', 1299, 1, NOW()),
--  Laptop 3
(1, 'Laptop Lambda', 5, 'AMD', 'Ryzen 5', 8, 'DDR4', 'SSD', 256, 0, NULL, '15.6" LED', 'Full HD', 'Windows 10', 899, 1, NOW());


INSERT INTO `feedback` (`review_id`, `customer_id`, `review_count`, `message`, `created_at`) 
VALUES 
(NULL, '2', '4', 'Exceptional Service and easy to use buying experience! Would Recommend!!', current_timestamp()), 
(NULL, '3', '3', 'Took longer than expected for delivery, but I am still happy with the product. The service was nice.', current_timestamp());


INSERT INTO `orders` (`order_id`, `customer_id`, `laptop_id`, `created_at`) 
VALUES 
 (NULL, '2', '1', current_timestamp()),
 (NULL, '3', '2', current_timestamp());


INSERT INTO `methods` (`method_id`, `method`, `created_at`)
VALUES
(NULL, 'GET', current_timestamp()),
(NULL, 'POST', current_timestamp()),
(NULL, 'PUT', current_timestamp()),
(NULL, 'DELETE', current_timestamp());

INSERT INTO `permissions` (`permission_id`, `parent`, `resource`, `created_at`, `status`)
VALUES
(NULL, 'users', '/', current_timestamp(), 1),
(NULL, 'users', 'employees', current_timestamp(), 1),
(NULL, 'users', 'customers', current_timestamp(), 1),
(NULL, 'laptops', '/', current_timestamp(), 1);

-- each user is given one key by default
INSERT INTO `user_keys` (`key_id`, `user_id`, `key`, `expired`, `created_at`, `status`)
VALUES
(NULL, 1, 'awt_[9H<TzE5pIhW08tS(yF=Qo?{_0227029b5e7013d468d8155a47f1ec2b38f9f129aaadb9a668dd956dae443540', 0, current_timestamp(), 1),
(NULL, 2, 'awt_5Lial}zgAAKu.U!SM4GwzECr_f9b5381cfc6e7ac6a4e1ae1ecc97a29a212a9b0a23247fac6a74ed3a982e9353', 0, current_timestamp(), 1),
(NULL, 3, 'awt_]vzq0@MBoNqY19[z.!YB)KxQ_7f1b07ed9e5279d33a28072a2065f43cf3260dd4d771aabb6c564c2b576a3ebd', 0, current_timestamp(), 1);

INSERT INTO `key_permissions` (`id`, `key_id`, `permission_id`, `method_id`, `created_at`, `status`)
VALUES
-- user with key 1(user 1) can perform GET requests for all collections
(NULL, 1, 1, 1, current_timestamp(), 1),
(NULL, 1, 2, 1, current_timestamp(), 1),
(NULL, 1, 3, 1, current_timestamp(), 1),
(NULL, 1, 4, 1, current_timestamp(), 1),
-- user with key 1(user1) can perform POST, PUT, and DELETE requests for users
(NULL, 1, 1, 2, current_timestamp(), 1),
(NULL, 1, 1, 3, current_timestamp(), 1),
(NULL, 1, 1, 4, current_timestamp(), 1),
-- user with key 1(user 1) can perform POST, PUT and DELETE requests for laptops
(NULL, 1, 4, 2, current_timestamp(), 1),
(NULL, 1, 4, 3, current_timestamp(), 1),
(NULL, 1, 4, 4, current_timestamp(), 1),
-- users with keys 2 and 3 (the customers) can only perform GET requests for laptops
(NULL, 2, 4, 1, current_timestamp(), 1),
(NULL, 3, 4, 1, current_timestamp(), 1);

-- Note that all employees are given the same permissions as user 1 that was inserted. 
-- Note that all customers are given the same permission as user 2 and 3 that was inserted.


