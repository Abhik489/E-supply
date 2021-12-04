-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2020 at 07:23 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poonamwatersuppliers`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_tbl`
--

CREATE TABLE `brand_tbl` (
  `brand_id` int(3) NOT NULL,
  `brand_name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand_tbl`
--

INSERT INTO `brand_tbl` (`brand_id`, `brand_name`) VALUES
(1, 'Bisleri'),
(2, 'Kinley'),
(3, 'AqauFine'),
(4, 'Himalayan'),
(5, 'PWS');

-- --------------------------------------------------------

--
-- Table structure for table `category_tbl`
--

CREATE TABLE `category_tbl` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_tbl`
--

INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES
(1, 'Tanker'),
(2, 'Water Bottles'),
(3, 'WaterCans');

-- --------------------------------------------------------

--
-- Table structure for table `driver_tbl`
--

CREATE TABLE `driver_tbl` (
  `driver_id` int(11) NOT NULL,
  `licenseno` varchar(20) NOT NULL,
  `name` varchar(15) NOT NULL,
  `mobile_no` bigint(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `driver_status` text NOT NULL DEFAULT 'available'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_tbl`
--

INSERT INTO `driver_tbl` (`driver_id`, `licenseno`, `name`, `mobile_no`, `address`, `password`, `driver_status`) VALUES
(1, 'MH142017777', 'Ramesh Solanki', 8888888888, 'Paldi', 'password123', 'available'),
(2, 'GJ32423443333', 'Mahesh Patel', 1234567890, 'Gotri', 'password123', 'available'),
(3, 'UP1298986007', 'Virat Sharma', 7777777777, 'Andheri West', 'password123', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE `order_tbl` (
  `order_id` int(11) NOT NULL,
  `order_amount` double NOT NULL,
  `order_items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`order_items`)),
  `order_delivery_date` datetime NOT NULL,
  `order_shipping_address` longtext NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `order_payment_mode` text NOT NULL,
  `fk_email_id` varchar(30) NOT NULL,
  `order_mobile_no` int(11) NOT NULL,
  `order_status` text NOT NULL DEFAULT 'Pending',
  `fk_driver_assigned` int(11) DEFAULT NULL,
  `order_repeat` int(11) DEFAULT -1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`order_id`, `order_amount`, `order_items`, `order_delivery_date`, `order_shipping_address`, `order_date`, `order_payment_mode`, `fk_email_id`, `order_mobile_no`, `order_status`, `fk_driver_assigned`, `order_repeat`) VALUES
(12, 30, '{\"items\":{\"8\":{\"item\":{\"product_id\":8,\"product_name\":\"20 Liter Non-Branded Drinking Water\",\"product_image\":\"non-branded-water-can.jpg\",\"product_description\":\"Regular RO/UV filtered water (Non Branded)\",\"product_price\":30,\"product_qty\":300,\"product_capacity\":20,\"fk_brand_id\":2,\"fk_category_id\":2},\"qty\":1,\"price\":30}},\"totalQty\":1,\"totalPrice\":30}', '2020-05-04 00:00:00', 'some address', '2020-05-04 13:19:48', 'cash', 'someuser@hotmail.com', 0, 'Delivered', 0, -1),
(26, 3000, '{\"items\":{\"12\":{\"item\":{\"product_id\":12,\"product_name\":\"Fighter Tanker\",\"product_image\":\"tanker.jpg\",\"product_description\":\"6000 ltr capacity\",\"product_price\":3000,\"product_qty\":20,\"product_capacity\":6000,\"fk_brand_id\":5,\"fk_category_id\":1},\"qty\":1,\"price\":3000}},\"totalQty\":1,\"totalPrice\":3000}', '2020-06-08 19:00:00', 'A-32, Rutansh Duplex, Opp. Vraj Venu complex, Nr. ', '2020-06-08 00:02:28', 'cash', 'abhinavcdpy@gmail.com', 2147483647, 'Pending', NULL, -1),
(22, 80, '{\"items\":{\"3\":{\"item\":{\"product_id\":3,\"product_name\":\"Bisleri 20 Litre Water Can\",\"product_image\":\"bisleri_water_can.png\",\"product_description\":\"Each drop of Bisleri undergoes a stringent 6-step purification process. We ensure you get to enjoy water that not just quenches your thirst, but keeps you healthy as well.\",\"product_price\":80,\"product_qty\":500,\"product_capacity\":20,\"fk_brand_id\":1,\"fk_category_id\":3},\"qty\":1,\"price\":80}},\"totalQty\":1,\"totalPrice\":80}', '2020-06-07 00:00:00', 'A-32, Rutansh Duplex, Opp. Vraj Venu complex, Nr. ', '2020-06-07 17:48:49', 'cash', 'abhinavcdpy@gmail.com', 2147483647, 'Delivered', 0, 7),
(24, 80, '{\"items\":{\"3\":{\"item\":{\"product_id\":3,\"product_name\":\"Bisleri 20 Litre Water Can\",\"product_image\":\"bisleri_water_can.png\",\"product_description\":\"Each drop of Bisleri undergoes a stringent 6-step purification process. We ensure you get to enjoy water that not just quenches your thirst, but keeps you healthy as well.\",\"product_price\":80,\"product_qty\":500,\"product_capacity\":20,\"fk_brand_id\":1,\"fk_category_id\":3},\"qty\":1,\"price\":80}},\"totalQty\":1,\"totalPrice\":80}', '2020-06-07 19:36:00', 'some address', '2020-06-07 18:33:13', 'cash', 'someuser@hotmail.com', 2147483647, 'Cancelled', 0, -1);

-- --------------------------------------------------------

--
-- Table structure for table `persontype_tbl`
--

CREATE TABLE `persontype_tbl` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persontype_tbl`
--

INSERT INTO `persontype_tbl` (`type_id`, `type_name`) VALUES
(1, 'admin'),
(3, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `product_tbl`
--

CREATE TABLE `product_tbl` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_image` varchar(200) NOT NULL,
  `product_description` varchar(400) NOT NULL,
  `product_price` double NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_capacity` double NOT NULL,
  `fk_brand_id` int(11) NOT NULL,
  `fk_category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`product_id`, `product_name`, `product_image`, `product_description`, `product_price`, `product_qty`, `product_capacity`, `fk_brand_id`, `fk_category_id`) VALUES
(1, '500ML Bisleri (Carton of 24)', 'product_image-1550832264847.png', '500ml Bisleri Water Bottle – Carton of 24 bottles.', 240, 500, 0.5, 1, 2),
(2, '250ML Bisleri (Carton of 48 Bottles)', 'b3.png', '250ml Bisleri Mineral Water Bottle – It comes in pack of 48 bottles per Carton.', 280, 300, 0.25, 1, 2),
(3, 'Bisleri 20 Litre Water Can', 'bisleri_water_can.png', 'Each drop of Bisleri undergoes a stringent 6-step purification process. We ensure you get to enjoy water that not just quenches your thirst, but keeps you healthy as well.', 80, 500, 20, 1, 3),
(4, '300ML Bisleri (Carton of 24)', 'bisleri-box.jpg', 'Bisleri Rockstar , Pure Celebrations is an easy to carry & serve pack of 6 bottles of 300ml each. ', 180, 500, 0.3, 1, 2),
(6, 'Aquafina Bottled Water (24/Carton)', 'aquafina-1-litre-bottle.jpg', 'Pure water; perfect taste. Seven-step HydRO-7 purification process removes chlorides, salts and other substances that alter the taste of water.', 240, 300, 1, 3, 2),
(12, 'Fighter Tanker', 'tanker.jpg', '6000 ltr capacity', 3000, 20, 6000, 5, 1),
(8, '20 Liter Non-Branded Drinking Water', 'non-branded-water-can.jpg', 'Regular RO/UV filtered water (Non Branded)', 30, 300, 20, 2, 2),
(9, 'Water Can 20 Litres RO & UV Filtered', 'uv-non-branded-water-can.jpg', 'Regular RO/UV filtered water (Non Branded)', 30, 300, 20, 2, 2),
(10, 'Himalayan 1 Litre (Carton of 12)', 'product_image-1550840703734.jpg', 'Himalayan 1 Litre Natural Mineral Water Bottle comes in a carton box of 12 Bottles.  Himalayan natural mineral water – Untouched by human, hand crafted by nature.', 720, 450, 1, 4, 2),
(11, 'Normal Tanker', 'tanker.jpg', '6000 ltr capacity', 2500, 20, 6000, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `email_id` varchar(50) NOT NULL,
  `password` longtext NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `mobile_no` bigint(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `type_id` int(1) NOT NULL COMMENT 'FK'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`email_id`, `password`, `user_name`, `mobile_no`, `address`, `type_id`) VALUES
('abc@daa.com', '$2a$05$0YYPhPXZMGJIlIBc7i7yheHuAWD.bbbDNTT5/qHGQ3Dhm7IBc9f7.', 'temp', 2727272223, 'abc', 3),
('someuser@hotmail.com', '$2a$05$cQw8E/SU.lgNd6d3n.P7cOn.xVzYlQ8aV5cH2CQ.ZRJbtofcT8pA6', 'someuser2', 8377564281, 'some address', 3),
('abhinavcdpy@gmail.com', '$2a$05$g4rc70SAyYVEolx7n3qEq.XJ8MGWGWIvpNGGBHo0UjTYtiohHZXi6', 'Abhinav', 8333928122, 'A-32, Rutansh Duplex, Opp. Vraj Venu complex, Nr. ', 3),
('admin@gmail.com', '$2a$05$TW68tAIqvN07yVs4RzromuYJ06wQQKZc5eTnRcTcBCc1aT8lDsY16', 'Admin Account', 8511948007, 'Gotri, Vadodara', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_tbl`
--
ALTER TABLE `brand_tbl`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `category_tbl`
--
ALTER TABLE `category_tbl`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `driver_tbl`
--
ALTER TABLE `driver_tbl`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`);

--
-- Indexes for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_fk_driver_assigned` (`fk_driver_assigned`);

--
-- Indexes for table `persontype_tbl`
--
ALTER TABLE `persontype_tbl`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`email_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_tbl`
--
ALTER TABLE `brand_tbl`
  MODIFY `brand_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category_tbl`
--
ALTER TABLE `category_tbl`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver_tbl`
--
ALTER TABLE `driver_tbl`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `persontype_tbl`
--
ALTER TABLE `persontype_tbl`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
