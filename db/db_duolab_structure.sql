-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2022 a las 00:25:47
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_duolab`
--
CREATE DATABASE IF NOT EXISTS `db_duolab` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_duolab`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_credit_note`
--
-- Creación: 06-05-2021 a las 13:20:09
--

CREATE TABLE `tbl_credit_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `series` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `number` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `referenced_doc_id` int(11) NOT NULL,
  `referenced_doc_type_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ruc` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `address` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `reference` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `payment_days` int(11) NOT NULL,
  `date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `currency` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `reason` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `discount_rate` float NOT NULL,
  `discount_value` float NOT NULL,
  `total_sub` float NOT NULL,
  `total_tax` float NOT NULL,
  `total_net` float NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_credit_note_detail`
--
-- Creación: 07-04-2021 a las 19:53:39
--

CREATE TABLE `tbl_credit_note_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_note_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_code` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `item_description` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_unit_price` float NOT NULL,
  `item_name` varchar(200) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_customer`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `tbl_customer` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `business_name` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `trade_name` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `phone` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `cellphone` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `address` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `department_id` varchar(2) COLLATE latin1_spanish_ci NOT NULL,
  `province_id` varchar(4) COLLATE latin1_spanish_ci NOT NULL,
  `district_id` varchar(6) COLLATE latin1_spanish_ci NOT NULL,
  `contact1_name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `contact1_phone` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `contact2_name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `contact2_phone` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `commission` float NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_employee`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `tbl_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `last_name_1` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `last_name_2` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `id_doc_type` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `id_doc_number` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `civil_status` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `phone` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `address` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `job` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `study_level` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `study_career` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `birth_date` date NOT NULL,
  `admission_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_invoice`
--
-- Creación: 07-04-2021 a las 12:50:39
--

CREATE TABLE `tbl_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `series` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `number` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ruc` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `address` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `reference` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `payment_days` int(11) NOT NULL,
  `date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `currency` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `discount_rate` float NOT NULL,
  `discount_value` float NOT NULL,
  `total_sub` float NOT NULL,
  `total_tax` float NOT NULL,
  `total_net` float NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_invoice_detail`
--
-- Creación: 16-03-2021 a las 19:57:10
--

CREATE TABLE `tbl_invoice_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_code` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `item_description` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_unit_price` float NOT NULL,
  `item_name` varchar(200) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_order`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `number` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `status` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `currency` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `issue_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `provider_id` int(11) NOT NULL,
  `payment_days` int(11) NOT NULL,
  `account_number` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `quotation` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `requester` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `approver` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `observation` varchar(3000) COLLATE latin1_spanish_ci NOT NULL,
  `total_purchase` float NOT NULL,
  `total_tax` float NOT NULL,
  `total_net` float NOT NULL,
  `exchange_rate_sale` float NOT NULL,
  `exchange_rate_purchase` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_order_detail`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `tbl_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_code` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `item_description` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `item_gloss` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `item_unit_value` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `item_unit_price` float NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_discount_rate` float NOT NULL,
  `item_discounted_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_product`
--
-- Creación: 28-02-2022 a las 09:13:00
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `brand` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `description` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `unit_price` float NOT NULL,
  `unit_value` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `active_status` tinyint(1) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_provider`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `tbl_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `business_name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `address` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `country` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `city` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `district` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `contact1_name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `contact1_phone` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `contact2_name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `contact2_phone` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `bank1_name` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `bank1_currency` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `bank1_account_number` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `bank1_account_holder` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `bank2_name` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `bank2_currency` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `bank2_account_number` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `bank2_account_holder` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_purchase`
--
-- Creación: 29-04-2021 a las 12:11:43
--

CREATE TABLE `tbl_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `number` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `status` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `currency` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `issue_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `provider_id` int(11) NOT NULL,
  `payment_days` int(11) NOT NULL,
  `account_number` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `quotation` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `requester` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `approver` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `observation` varchar(3000) COLLATE latin1_spanish_ci NOT NULL,
  `total_purchase` float NOT NULL,
  `total_tax` float NOT NULL,
  `total_net` float NOT NULL,
  `exchange_rate_sale` float NOT NULL,
  `exchange_rate_purchase` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_purchase_detail`
--
-- Creación: 29-04-2021 a las 12:09:59
--

CREATE TABLE `tbl_purchase_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `item_code` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `item_description` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `item_gloss` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `item_unit_value` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `item_unit_price` float NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_discount_rate` float NOT NULL,
  `item_discounted_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_quotation`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `tbl_quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ruc` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `address` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `reference` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `payment_days` int(11) NOT NULL,
  `date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `currency` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `discount_rate` float NOT NULL,
  `discount_value` float NOT NULL,
  `total_sub` float NOT NULL,
  `total_tax` float NOT NULL,
  `total_net` float NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_quotation_detail`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `tbl_quotation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `item_description` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `item_unit_price` float NOT NULL,
  `item_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_receipt`
--
-- Creación: 07-04-2021 a las 12:51:14
--

CREATE TABLE `tbl_receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `series` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `number` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ruc` varchar(11) COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `address` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `reference` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `payment_days` int(11) NOT NULL,
  `date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `currency` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `discount_rate` float NOT NULL,
  `discount_value` float NOT NULL,
  `total_sub` float NOT NULL,
  `total_tax` float NOT NULL,
  `total_net` float NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_update` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_receipt_detail`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `tbl_receipt_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_code` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `item_description` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_unit_price` float NOT NULL,
  `item_name` varchar(200) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_user`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `photo_url` varchar(1000) COLLATE latin1_spanish_ci NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_warehouse_movement`
--
-- Creación: 28-02-2022 a las 08:41:48
--

CREATE TABLE `tbl_warehouse_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `observation` varchar(100) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `doc_reference` varchar(50) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo_peru_departments`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `ubigeo_peru_departments` (
  `id` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo_peru_districts`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `ubigeo_peru_districts` (
  `id` varchar(6) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `province_id` varchar(4) DEFAULT NULL,
  `department_id` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo_peru_provinces`
--
-- Creación: 01-10-2020 a las 21:34:01
--

CREATE TABLE `ubigeo_peru_provinces` (
  `id` varchar(4) NOT NULL,
  `name` varchar(45) NOT NULL,
  `department_id` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_credit_note`
--
ALTER TABLE `tbl_credit_note`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_credit_note_detail`
--
ALTER TABLE `tbl_credit_note_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indices de la tabla `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_doc_number` (`id_doc_number`);

--
-- Indices de la tabla `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_invoice_detail`
--
ALTER TABLE `tbl_invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indices de la tabla `tbl_provider`
--
ALTER TABLE `tbl_provider`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_purchase_detail`
--
ALTER TABLE `tbl_purchase_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_quotation`
--
ALTER TABLE `tbl_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_quotation_detail`
--
ALTER TABLE `tbl_quotation_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_receipt`
--
ALTER TABLE `tbl_receipt`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_receipt_detail`
--
ALTER TABLE `tbl_receipt_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `tbl_warehouse_movement`
--
ALTER TABLE `tbl_warehouse_movement`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubigeo_peru_departments`
--
ALTER TABLE `ubigeo_peru_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubigeo_peru_districts`
--
ALTER TABLE `ubigeo_peru_districts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubigeo_peru_provinces`
--
ALTER TABLE `ubigeo_peru_provinces`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_credit_note`
--
ALTER TABLE `tbl_credit_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT de la tabla `tbl_credit_note_detail`
--
ALTER TABLE `tbl_credit_note_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=498;

--
-- AUTO_INCREMENT de la tabla `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2425;

--
-- AUTO_INCREMENT de la tabla `tbl_invoice_detail`
--
ALTER TABLE `tbl_invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5089;

--
-- AUTO_INCREMENT de la tabla `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `tbl_provider`
--
ALTER TABLE `tbl_provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT de la tabla `tbl_purchase_detail`
--
ALTER TABLE `tbl_purchase_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT de la tabla `tbl_quotation`
--
ALTER TABLE `tbl_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_quotation_detail`
--
ALTER TABLE `tbl_quotation_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_receipt`
--
ALTER TABLE `tbl_receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;

--
-- AUTO_INCREMENT de la tabla `tbl_receipt_detail`
--
ALTER TABLE `tbl_receipt_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1243;

--
-- AUTO_INCREMENT de la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `tbl_warehouse_movement`
--
ALTER TABLE `tbl_warehouse_movement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
