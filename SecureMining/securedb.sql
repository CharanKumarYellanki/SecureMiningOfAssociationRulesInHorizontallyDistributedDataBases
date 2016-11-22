-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 28, 2015 at 06:21 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `securedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyproducts`
--

CREATE TABLE IF NOT EXISTS `buyproducts` (
  `buyproduct_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyproduct_name` varchar(45) NOT NULL,
  `buyproduct_price` varchar(11) DEFAULT NULL,
  `buyproduct_no` varchar(11) DEFAULT NULL,
  `buyproduct_date` varchar(11) DEFAULT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_mobile` varchar(20) NOT NULL,
  `customer_address` varchar(200) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_type` varchar(45) NOT NULL,
  `order_report` varchar(400) DEFAULT NULL,
  `ddate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`buyproduct_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `buyproducts`
--

INSERT INTO `buyproducts` (`buyproduct_id`, `buyproduct_name`, `buyproduct_price`, `buyproduct_no`, `buyproduct_date`, `customer_name`, `customer_mobile`, `customer_address`, `product_id`, `customer_id`, `product_type`, `order_report`, `ddate`) VALUES
(7, 'nokia lumia 1020', '39,900', '3', '2014-02-23', 'cust', '9000827627', 'DD Colony, shivam road, Hyderabad.pin:500013', 22, 23, 'purchase', 'test', '11/09/1990'),
(8, 'samsung headphones', '1200', '1', '2014-02-23', 'cust', '9000827627', 'Hyde Street Studios\r\n245 Hyde Street\r\nSan Francisco, CA 94102\r\n415.441.8934\r\ninfo@hydestreet.com', 19, 23, 'purchase', 'test order report', '11/09/1990'),
(10, 'nokia headphones', '1000', '2', '2014-02-23', 'cust1', '9000827627', 'Hyde Street Studios\r\n245 Hyde Street\r\nSan Francisco, CA 94102\r\n415.441.8934\r\ninfo@hydestreet.com', 20, 24, 'order', NULL, NULL),
(11, 'samsung charger', '400', '3', '2014-02-23', 'cust2', '9951851143', 'Hyde Street Studios\r\n245 Hyde Street\r\nSan Francisco, CA 94102\r\n415.441.8934\r\ninfo@hydestreet.com', 23, 25, 'purchase', NULL, NULL),
(12, 'samsung galaxy s4', '34,1990', '3', '2014-02-23', 'cust2', '9000827627', 'Hyde Street Studios\r\n245 Hyde Street\r\nSan Francisco, CA 94102\r\n415.441.8934\r\ninfo@hydestreet.com', 21, 25, 'purchase', 'product order report message test purpose.', NULL),
(13, 'samsung headphones', '1200', '3', '11-11-1290', 'cust', '9951851143', 'Test Address...', 19, 23, 'purchase', NULL, NULL),
(14, 'nokia headphones', '1000', '2', '2014-02-23', 'cust', '9000827627', 'test messagfe', 20, 23, 'purchase', NULL, NULL),
(15, 'samsung headphones', '1200', '1', '11-09-2013', 'raju', '978878878', 'test message', 19, 23, 'purchase', NULL, NULL),
(16, 'nokia lumia 1020', '39,900', '1', '11-09-2013', 'raju', '978878878', 'test message.', 22, 23, 'purchase', NULL, NULL),
(17, 'nokia lumia 1020', '39,900', '1', '11-09-2013', 'raju', '33333333333', 'testmessage', 22, 23, 'purchase', NULL, NULL),
(18, 'nokia lumia 1020', '39,900', '1', '11-09-2013', 'raju', '33333333333', 'test message', 22, 23, 'purchase', NULL, NULL),
(19, 'samsung galaxy s4', '34,1990', '3', '11-09-2013', 'raju', '33333333333', 'dsdsds', 21, 23, 'purchase', NULL, NULL),
(20, 'nokia lumia 1020', '39,900', '1', '11-09-2013', 'raju', '33333333333', 'sadfsaf', 22, 23, 'purchase', NULL, NULL),
(21, 'samsung headphones', '1200', '2', '03-01-2016', 'akhila', '9876543210', 'Hyderabad', 19, 27, 'purchase', 'your product will be delivered in couple of days', '31-12-1015'),
(22, 'nokia headphones', '1000', '2', '05-01-2016', 'akhila', '9876543210', 'Kukatpally', 20, 27, 'order', '\r\nyour product will be delivered with in couple of days', '02-01-2016');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `product_image_url` varchar(100) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `product_mdate` varchar(50) NOT NULL,
  `product_edate` varchar(50) NOT NULL,
  `users_user_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_image_url`, `product_price`, `product_mdate`, `product_edate`, `users_user_id`) VALUES
(19, 'samsung headphones', 'headset2.jpg', '1200', '2014-01-01', '2019-01-02', 1),
(20, 'nokia headphones', 'headset3.jpg', '1000', '2014-01-01', '2019-05-02', 1),
(21, 'samsung galaxy s4', 'download.jpg', '34,1990', '2014-01-01', '2019-01-09', 1),
(22, 'nokia lumia 1020', 'mobile3.jpg', '39,900', '2014-01-01', '2019-01-09', 1),
(23, 'samsung charger', 'charger1.jpg', '400', '2014-01-01', '2019-01-09', 1),
(25, 'nokia charger', 'chareger2.jpg', '555', '2014-01-01', '2019-01-02', 1),
(26, 'asdf', 'Lighthouse.jpg', '100', '2015-05-01', '2018-05-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(45) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_pass` varchar(45) DEFAULT NULL,
  `user_age` varchar(100) DEFAULT NULL,
  `user_sex` enum('MALE','FEMALE') DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_mobile` varchar(33) NOT NULL,
  `user_created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `user_name`, `user_pass`, `user_age`, `user_sex`, `user_email`, `user_mobile`, `user_created_on`) VALUES
(21, 'ADMIN', 'admin', 'admin', '44', 'MALE', 'raju@raju.com', '9000827627', '2014-02-03 15:43:21'),
(22, 'ACCOUNTANT', 'ac', 'ac', '45', 'MALE', 'ac@ac.com', '9000827627', '2014-02-03 15:51:56'),
(23, 'CUSTOMER', 'cust', 'cust', '22', 'MALE', 'cust@cust.com', '9000827627', '2014-02-10 14:00:24'),
(24, 'CUSTOMER', 'cust1', 'cust1', '33', 'MALE', 'cust1@cust1.com', '9951851143', '2014-02-03 15:54:16'),
(25, 'CUSTOMER', 'cust2', 'cust2', '33', 'MALE', 'cust2@cust2.com', '9000827627', '2014-02-03 15:54:43'),
(26, 'ACCOUNTANT', 'swetha', 'swetha', '23', 'FEMALE', 'swetha@gmail.com', '8765432190', '2015-12-28 11:01:22'),
(27, 'CUSTOMER', 'akhila', 'akhila', '22', 'FEMALE', 'akhila@gmail.com', '9876543210', '2015-12-28 11:18:33');
