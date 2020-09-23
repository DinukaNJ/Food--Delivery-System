-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2020 at 08:26 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `tb_id` int(11) NOT NULL,
  `pname` text NOT NULL,
  `pid2` int(250) NOT NULL,
  `uid` int(250) NOT NULL,
  `odis` text NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`tb_id`, `pname`, `pid2`, `uid`, `odis`, `total`) VALUES
(1, 'Mongolian fried rice', 1, 1, 'chicken*3,\r\n', 500),
(3, '\r\nTaste of Home\r\nStrawberry Shortcake Puffs', 7, 1, '', 300),
(4, 'Mongolian fried rice', 1, 1, '', 350),
(5, 'Shrimp and bacon stir fry rice ', 3, 1, 'chicken*3,\r\nEgg*3,\r\n', 805),
(6, 'Mongolian fried rice', 1, 1, 'chicken*3,\r\nEgg*4,\r\n', 640),
(7, 'Nasi goreng', 2, 1, 'chicken*1,\r\n', 450),
(8, 'Shrimp and bacon stir fry rice ', 3, 1, 'chicken*3,\r\n', 700),
(9, 'Mongolian fried rice', 1, 1, 'Egg*4,\r\n', 490),
(10, 'Shrimp and bacon stir fry rice ', 3, 8, 'chicken*5,\r\nfish*5,\r\n', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `customize`
--

CREATE TABLE `customize` (
  `id` int(11) NOT NULL,
  `pname` varchar(250) NOT NULL COMMENT 'product name',
  `pid` int(250) NOT NULL COMMENT 'product id',
  `options` varchar(250) NOT NULL COMMENT 'options',
  `noptions` int(11) NOT NULL COMMENT 'number of options',
  `total` double NOT NULL COMMENT 'total',
  `uid` int(250) NOT NULL COMMENT 'user id ',
  `added` enum('true','false') NOT NULL COMMENT 'it puches yes or no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customize`
--

INSERT INTO `customize` (`id`, `pname`, `pid`, `options`, `noptions`, `total`, `uid`, `added`) VALUES
(1, 'Mongolian fried rice', 1, 'chicken', 3, 150, 1, 'true'),
(2, 'Nasi goreng', 2, 'chicken', 3, 150, 1, 'true'),
(3, 'Shrimp and bacon stir fry rice ', 3, 'chicken', 3, 150, 1, 'true'),
(4, 'Shrimp and bacon stir fry rice ', 3, 'Egg', 3, 105, 1, 'true'),
(5, 'Mongolian fried rice', 1, 'chicken', 3, 150, 1, 'true'),
(6, 'Mongolian fried rice', 1, 'Egg', 4, 140, 1, 'true'),
(7, 'Nasi goreng', 2, 'chicken', 1, 50, 1, 'true'),
(8, 'Shrimp and bacon stir fry rice ', 3, 'chicken', 3, 150, 1, 'true'),
(9, 'Mongolian fried rice', 1, 'Egg', 4, 140, 1, 'true'),
(10, 'Shrimp and bacon stir fry rice ', 3, 'chicken', 5, 250, 8, 'true'),
(11, 'Shrimp and bacon stir fry rice ', 3, 'fish', 5, 200, 8, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT ' food name',
  `des` text NOT NULL COMMENT 'food descrption',
  `price` varchar(200) NOT NULL COMMENT 'food price',
  `type` enum('Fried Rice','Rice and Curry','Kottu','Short Eats','Other','String hoppers','Grain','Noodles') NOT NULL COMMENT 'food type',
  `cat` enum('beverages','food','dessert','sweet') NOT NULL COMMENT 'food category',
  `period` enum('breakfast','lunch','dinner','any') NOT NULL,
  `pimg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `des`, `price`, `type`, `cat`, `period`, `pimg`) VALUES
(1, 'sdf', 'sdf', '2.35345345E8', 'String hoppers', 'beverages', 'dinner', '1.png');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `type` enum('Fried Rice','Rice and Curry','Kottu','Shorties','other','String hoppers','Grain','Noodles') DEFAULT NULL,
  `options` enum('chicken','Egg','vegetable','fish') DEFAULT NULL,
  `price` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `type`, `options`, `price`) VALUES
(1, 'other', 'vegetable', '356'),
(2, 'Kottu', 'chicken', '45'),
(5, 'Fried Rice', 'Egg', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `des` text NOT NULL COMMENT 'order discrption',
  `oduser` varchar(250) NOT NULL COMMENT 'order user name',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `des`, `oduser`, `time`) VALUES
(1, 'xfvf', 'dfgfg', '2020-09-21 14:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `uname` varchar(250) NOT NULL,
  `fname` varchar(250) NOT NULL,
  `lname` varchar(250) NOT NULL,
  `pass` text NOT NULL,
  `email` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `role` enum('admin','client') NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `uname`, `fname`, `lname`, `pass`, `email`, `address`, `role`, `status`) VALUES
(1, 'kaviya', 'dfsdf', 'sdf', '123', 'sdcs@gmail.com', 'cvcv', 'admin', 'active'),
(2, 'xcvbnm', 'xcghjk', 'xcvb', '2345tgb ', 'vgy78ujn', 'xcvh7ujn', 'client', 'inactive'),
(3, 'dinuwa', 'jaratharna', '', '1231', 'dinuwa@gmail.com', '123,algama', 'client', 'active'),
(4, 'gayan', 'asadasd', 'gdfg', '4545', 'gaiya@gmail.com', 'n0 06,north homagama', 'client', 'active'),
(5, 'ishu', 'ishuwara', 'saddfg', '235', '', '', 'client', 'active'),
(6, 'sheromi', 'shiromi ', '', '543', 'sheriomi@gmail.com', '', 'client', 'active'),
(7, 'sula', 'sulochana', '', '56456', 'sula@gmail.com', '', 'client', 'inactive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`tb_id`);

--
-- Indexes for table `customize`
--
ALTER TABLE `customize`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `tb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `customize`
--
ALTER TABLE `customize`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
