-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 14, 2023 lúc 05:19 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `spring_ecommer`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `parent_id`, `name`, `title`, `desc`, `content`, `icon`, `create_at`, `update_at`, `status`) VALUES
(50, 0, 'NAM LYX XUÂN TẤN', 'TAnn', '', NULL, NULL, '2022-09-09 05:01:45', '2022-07-03 15:25:20', 1),
(51, 50, 'ĐỒNG HỒ', 'ĐỒNG HỒ NAM', 'Sự tự tin trên cổ tay của người đàn ông hiện đạ', NULL, NULL, '2022-10-11 17:00:00', '2022-07-10 03:40:50', 0),
(52, 0, 'NỮ GIỚI', 'WOME\'S TAN', 'Tom B. Erichsen', 'Cardinal', NULL, '2022-06-05 09:50:49', '2022-07-03 10:06:47', 0),
(53, 50, 'PHỤ KIỆN', NULL, '', NULL, NULL, '2022-06-06 07:58:53', '2022-07-02 16:32:47', 0),
(54, 52, 'ĐỒNG HỒ NỮ', 'a', 'a', 'a', 'a', '2022-07-01 17:51:10', '2022-07-03 02:53:40', 0),
(55, 52, 'PHỤ KIỆN NỮ', '4', '4', '4', '4', '2022-07-01 18:15:08', '2022-07-03 02:53:40', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_collection`
--

CREATE TABLE `category_collection` (
  `category_id` bigint(20) DEFAULT NULL,
  `collection_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_collection`
--

INSERT INTO `category_collection` (`category_id`, `collection_id`) VALUES
(51, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `collection_image`
--

CREATE TABLE `collection_image` (
  `id` bigint(20) NOT NULL,
  `name` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `file` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `confirmation_token`
--

CREATE TABLE `confirmation_token` (
  `id` bigint(20) NOT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `confirmation_token` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `confirmation_token`
--

INSERT INTO `confirmation_token` (`id`, `create_at`, `expiry_date`, `user_id`, `confirmation_token`) VALUES
(1, '2022-07-24 06:26:34', '2022-07-24 06:36:34', 5, 'a89330a6-c540-4b93-a90d-f85fe15bf4f5'),
(2, '2022-07-24 06:29:49', '2022-07-24 06:39:49', 5, 'f314e6db-9359-4067-a10e-99e7cef805e0'),
(3, '2022-07-24 06:38:00', '2022-07-24 06:48:00', 5, '445eb370-31d4-402b-a95b-e49640aa42d4'),
(4, '2022-07-24 07:05:03', '2022-07-24 07:15:03', 5, '7588a0c9-15dc-49f4-b6e8-31102d9bb1e3'),
(5, '2022-07-24 09:15:13', '2022-07-24 09:25:13', 6, 'b7b34fdc-fd9b-4659-93a6-da2f82a8c217'),
(6, '2022-07-24 09:17:49', '2022-07-24 09:27:49', 6, '13ab27de-52a8-4d7b-a812-851e186e39b3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_order`
--

CREATE TABLE `customer_order` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT 0,
  `shipping_cost` float DEFAULT 0,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT 0,
  `is_paid` tinyint(1) DEFAULT 1,
  `price_free_ship` float DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customer_order`
--

INSERT INTO `customer_order` (`id`, `customer_id`, `shipping_cost`, `create_time`, `update_time`, `status`, `is_paid`, `price_free_ship`, `total`) VALUES
(32, 6, 0, '2022-07-31 10:45:04', '2022-07-31 12:32:46', 0, 1, NULL, 0),
(33, 6, 0, '2022-07-31 10:47:27', '2022-07-31 12:32:46', 0, 1, NULL, 1205450),
(34, 6, 0, '2022-07-31 10:54:08', '2022-07-31 12:32:46', 0, 1, NULL, 1205530),
(35, 6, 0, '2022-07-31 12:34:43', '2022-07-31 12:34:57', 0, 1, NULL, 0),
(36, 6, 0, '2022-07-31 13:47:09', '2022-07-31 13:55:51', 0, 1, NULL, 1205450),
(37, 6, 0, '2022-07-31 13:56:00', '2022-07-31 13:56:06', 0, 1, NULL, 0),
(38, 6, 0, '2022-07-31 13:56:28', '2022-07-31 13:56:38', 0, 1, NULL, 18000000),
(39, 6, 0, '2022-07-31 13:57:03', '2022-07-31 13:57:10', 0, 1, NULL, 0),
(40, 6, 0, '2022-07-31 14:43:09', '2022-07-31 15:42:41', NULL, 0, NULL, 97641500),
(41, 14, 0, '2022-07-31 16:24:30', '2022-07-31 16:24:34', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer_order_detail`
--

CREATE TABLE `customer_order_detail` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `quantity` bigint(20) DEFAULT 0,
  `total` bigint(20) DEFAULT 0,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT 0,
  `price_initial` float DEFAULT 0,
  `product_id` bigint(20) DEFAULT NULL,
  `price_ref` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customer_order_detail`
--

INSERT INTO `customer_order_detail` (`id`, `order_id`, `price`, `quantity`, `total`, `create_time`, `update_time`, `status`, `price_initial`, `product_id`, `price_ref`) VALUES
(250, 32, 0, 1, 0, '2022-07-31 10:45:04', '2022-07-31 10:45:04', NULL, 0, 25, 1004540),
(251, 34, 0, 1, 0, '2022-07-31 10:47:27', '2022-07-31 10:54:43', NULL, 0, 25, 1004540),
(252, 34, 1205450, 1, 0, '2022-07-31 10:48:58', '2022-07-31 10:54:43', NULL, 0, 26, 1004540),
(253, 34, 0, 1, 0, '2022-07-31 10:54:08', '2022-07-31 10:54:08', NULL, 0, 25, 1004540),
(254, 33, 80, 1, 0, '2022-07-31 10:54:43', '2022-07-31 10:54:43', NULL, 0, 28, 100),
(255, 33, 80, 1, 0, '2022-07-31 10:55:24', '2022-07-31 10:55:24', NULL, 0, 28, 100),
(256, 34, 80, 1, 0, '2022-07-31 10:55:49', '2022-07-31 10:55:49', NULL, 0, 28, 100),
(257, 34, 1205450, 1, 0, '2022-07-31 10:55:57', '2022-07-31 10:55:57', NULL, 0, 24, 1004540),
(258, 35, 0, 1, 0, '2022-07-31 12:34:43', '2022-07-31 12:34:43', NULL, 0, 25, 1004540),
(259, 35, 1205450, 1, 0, '2022-07-31 12:34:52', '2022-07-31 12:34:52', NULL, 0, 26, 1004540),
(260, 36, 1205450, 1, 0, '2022-07-31 13:47:09', '2022-07-31 13:47:09', NULL, 0, 26, 1004540),
(261, 36, 1205450, 1, 0, '2022-07-31 13:47:10', '2022-07-31 13:47:10', NULL, 0, 27, 1004540),
(262, 37, 0, 1, 0, '2022-07-31 13:56:00', '2022-07-31 13:56:00', NULL, 0, 32, 0),
(263, 38, 3000000, 6, 0, '2022-07-31 13:56:28', '2022-07-31 13:56:31', NULL, 0, 13, 6000),
(264, 38, 1205450, 1, 0, '2022-07-31 13:56:34', '2022-07-31 13:56:34', NULL, 0, 24, 1004540),
(265, 39, 0, 2, 0, '2022-07-31 13:57:03', '2022-07-31 13:57:05', NULL, 0, 32, 0),
(266, 40, 0, 3, 0, '2022-07-31 14:43:09', '2022-07-31 14:56:35', NULL, 0, 25, 3013620),
(267, 40, 10849000, 9, 0, '2022-07-31 14:48:08', '2022-07-31 15:42:41', NULL, 0, 26, 9040860),
(268, 40, 80, 1, 0, '2022-07-31 14:48:59', '2022-07-31 14:48:59', NULL, 0, 28, 100),
(269, 40, 2410900, 2, 0, '2022-07-31 14:49:39', '2022-07-31 15:08:15', NULL, 0, 24, 2009080),
(270, 41, 0, 1, 0, '2022-07-31 16:24:30', '2022-07-31 16:24:30', NULL, 0, 25, 1004540),
(271, 41, 1205450, 1, 0, '2022-07-31 16:24:34', '2022-07-31 16:24:34', NULL, 0, 26, 1004540);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_collection`
--

CREATE TABLE `list_collection` (
  `id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `list_collection`
--

INSERT INTO `list_collection` (`id`, `create_time`, `update_time`, `name`, `category_id`) VALUES
(1, NULL, NULL, 'Dây da', 51);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_color`
--

CREATE TABLE `list_color` (
  `id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `list_color`
--

INSERT INTO `list_color` (`id`, `create_time`, `update_time`, `name`, `hex`) VALUES
(1, NULL, NULL, 'Xanh', 'green'),
(2, NULL, NULL, 'Vàng', 'yellow'),
(3, NULL, NULL, 'Đen', 'black'),
(4, NULL, NULL, 'Hồng', 'pink');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_material`
--

CREATE TABLE `list_material` (
  `id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `list_material`
--

INSERT INTO `list_material` (`id`, `create_time`, `update_time`, `name`) VALUES
(1, NULL, NULL, 'Day da');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_size`
--

CREATE TABLE `list_size` (
  `id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `list_size`
--

INSERT INTO `list_size` (`id`, `create_time`, `update_time`, `name`) VALUES
(1, NULL, NULL, '38mm'),
(2, NULL, NULL, '40mn'),
(3, NULL, NULL, '43mn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_history`
--

CREATE TABLE `order_history` (
  `customer_order_id` bigint(20) DEFAULT NULL,
  `date` bigint(20) DEFAULT 0,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp(),
  `id` bigint(20) NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `price` float DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `payment_type` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_history`
--

INSERT INTO `order_history` (`customer_order_id`, `date`, `create_at`, `update_at`, `id`, `status`, `price`, `user_id`, `payment_type`) VALUES
(38, 1659275798304, '2022-07-31 13:56:38', '2022-07-31 15:36:17', 22, 1, 4235450, NULL, ''),
(39, 1659275830074, '2022-07-31 13:57:10', '2022-07-31 15:36:20', 23, 1, 0, NULL, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `price_ref` float DEFAULT 0,
  `price_sale` float DEFAULT 0,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT 0,
  `per_discount` int(11) DEFAULT NULL,
  `color_id` bigint(20) DEFAULT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `collection_id` float DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL,
  `sale_number` bigint(20) DEFAULT 0,
  `total` bigint(20) DEFAULT 0,
  `root_parent_category` bigint(20) DEFAULT NULL,
  `glass_surface` varchar(500) DEFAULT NULL,
  `thinkness` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `name`, `title`, `desc`, `price_ref`, `price_sale`, `content`, `image`, `create_time`, `update_time`, `status`, `per_discount`, `color_id`, `material_id`, `collection_id`, `size_id`, `sale_number`, `total`, `root_parent_category`, `glass_surface`, `thinkness`) VALUES
(34, 53, 'Tấn Test Save update', NULL, 'abc', 445, 25614.2, 'aee', NULL, '2022-07-20 17:16:40', '2022-07-26 09:31:19', NULL, 5656, 2, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_category`
--

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `image_id` bigint(20) NOT NULL,
  `create_time` date DEFAULT NULL,
  `file` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_president` tinyint(4) DEFAULT 0,
  `is_slider` tinyint(4) DEFAULT 0,
  `product_id` bigint(20) DEFAULT NULL,
  `name` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `product_imagecol` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`image_id`, `create_time`, `file`, `is_president`, `is_slider`, `product_id`, `name`, `data`, `product_imagecol`) VALUES
(2, '2022-06-19', '/uploads/doc/2022/6/img_0002-4-30NnU8Z5iV.JPEG', 1, 0, 16, 'IMG_0002 (4).JPEG', NULL, NULL),
(3, NULL, NULL, 1, NULL, NULL, 'pdf', NULL, NULL),
(4, NULL, NULL, 1, NULL, 15, 'pdf', NULL, NULL),
(5, '2022-06-19', '/uploads/doc/2022/6/img_0002-4-Q0TtA0ZBVn.JPEG', 1, NULL, 15, 'IMG_0002 (4).JPEG', NULL, NULL),
(6, '2022-06-19', '/uploads/doc/2022/6/img_0002-4-1KzT5nNv4S.JPEG', 1, NULL, 15, 'IMG_0002 (4).JPEG', NULL, NULL),
(7, '2022-06-20', '/uploads/doc/2022/6/img_0002-RqEvOUrlXa.JPEG', 1, NULL, 15, 'IMG_0002.JPEG', NULL, NULL),
(8, '2022-07-03', '/uploads/doc/2022/7/data-export-2-LqU4cfG5b0.png', 1, NULL, 19, 'data-export (2).png', NULL, NULL),
(9, '2022-07-03', '/uploads/doc/2022/7/2-1IyiQDXHOr.jpg', 1, NULL, 19, '2.jpg', NULL, NULL),
(10, '2022-07-23', '/uploads/doc/2022/7/2-kQb8ketuiK.jpg', 1, NULL, 34, '2.jpg', NULL, NULL),
(11, '2022-07-23', '/uploads/doc/2022/7/4-vcWqBeRI9Q.jpg', 1, NULL, 34, '4.jpg', NULL, NULL),
(16, '2022-07-23', '/uploads/doc/2022/7/trangsucnam2-n0XydK1kYG.jpg', 1, NULL, 34, 'trangsucnam2.jpg', NULL, NULL),
(46, '2022-07-26', '/uploads/doc/2022/7/8-5IDeKGXajD.jpg', 1, NULL, 34, '8.jpg', NULL, NULL),
(47, '2022-07-26', '/uploads/doc/2022/7/7-s07o5GfGGe.jpg', 1, NULL, 34, '7.jpg', NULL, NULL),
(48, '2022-07-26', '/uploads/doc/2022/7/7-b7oolohoLt.jpg', 1, NULL, 34, '7.jpg', NULL, NULL),
(49, '2022-07-31', '/uploads/doc/2022/7/background-P6Ttz4z58L.jpg', 1, NULL, 11, 'background.jpg', NULL, NULL),
(31, '2022-07-23', '/uploads/doc/2022/7/8-k4NEXsdk5C.jpg', 1, NULL, 33, '8.jpg', NULL, NULL),
(32, '2022-07-23', '/uploads/doc/2022/7/daynam1-0BJZh32CM7.jpg', 1, NULL, 32, 'daynam1.jpg', NULL, NULL),
(33, '2022-07-23', '/uploads/doc/2022/7/trangsucnam1-AiP8Zg7lgP.jpg', 1, NULL, 31, 'trangsucnam1.jpg', NULL, NULL),
(34, '2022-07-23', '/uploads/doc/2022/7/7-RIhGNnuZQg.jpg', 1, NULL, 30, '7.jpg', NULL, NULL),
(35, '2022-07-23', '/uploads/doc/2022/7/3-tAh3bvQdxV.jpg', 1, NULL, 27, '3.jpg', NULL, NULL),
(36, '2022-07-23', '/uploads/doc/2022/7/daynam6-6grs22XCif.jpg', 1, NULL, 26, 'daynam6.jpg', NULL, NULL),
(37, '2022-07-23', '/uploads/doc/2022/7/trangsucnam4-QEduy7jQt4.jpg', 1, NULL, 25, 'trangsucnam4.jpg', NULL, NULL),
(38, '2022-07-23', '/uploads/doc/2022/7/trangsucnu5-35qgBz5PfJ.jpg', 1, NULL, 29, 'trangsucnu5.jpg', NULL, NULL),
(39, '2022-07-24', '/uploads/doc/2022/7/2-HA2jh3GlGP.jpg', 1, NULL, 33, '2.jpg', NULL, NULL),
(40, '2022-07-24', '/uploads/doc/2022/7/10-USXGXL7qaB.jpg', 1, NULL, 30, '10.jpg', NULL, NULL),
(41, '2022-07-24', '/uploads/doc/2022/7/8-jduPlsVZ8W.jpg', 1, NULL, 30, '8.jpg', NULL, NULL),
(42, '2022-07-24', '/uploads/doc/2022/7/1-PhPz6b2k0Q.jpg', 1, NULL, 30, '1.jpg', NULL, NULL),
(43, '2022-07-24', '/uploads/doc/2022/7/8-k3Gkckojan.jpg', 1, NULL, 33, '8.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `type`) VALUES
(1, 'ROLE_ADMIN'),
(3, 'ROLE_DBA'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `status` int(11) DEFAULT 0,
  `phone_number` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `email_verified` tinyint(4) DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `reset_password_token` varchar(1000) DEFAULT NULL,
  `one_time_password` text DEFAULT NULL,
  `otp_request_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `email`, `status`, `phone_number`, `address`, `create_at`, `update_at`, `email_verified`, `create_time`, `update_time`, `reset_password_token`, `one_time_password`, `otp_request_time`) VALUES
(18, 'admin', '$2a$10$xvdzRQfwa/zOsUKNla1Sf.DaWEGIDjB7Hyrz1rP.6v87IBgMmQF.m', 'ADMIN', 'lyxuantan1@gmail.com', 0, NULL, NULL, NULL, NULL, 0, '2023-05-28 12:09:22', '2023-05-28 12:28:28', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(18, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `collection_image`
--
ALTER TABLE `collection_image`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `confirmation_token`
--
ALTER TABLE `confirmation_token`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`id`,`update_time`),
  ADD KEY `FKbd8bicw1ldfg0702iyfphs9fg` (`customer_id`);

--
-- Chỉ mục cho bảng `customer_order_detail`
--
ALTER TABLE `customer_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2v1uragrp9nqnpduhvqqtakdq` (`order_id`),
  ADD KEY `FKejbnto28443m72cwaqg94e9p4` (`product_id`);

--
-- Chỉ mục cho bảng `list_collection`
--
ALTER TABLE `list_collection`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `list_color`
--
ALTER TABLE `list_color`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `list_material`
--
ALTER TABLE `list_material`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `list_size`
--
ALTER TABLE `list_size`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `product_category`
--
ALTER TABLE `product_category`
  ADD KEY `FK2k3smhbruedlcrvu6clued06x` (`product_id`),
  ADD KEY `FKkud35ls1d40wpjb5htpp14q4e` (`category_id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `FK6oo0cvcdtb6qmwsga468uuukk` (`product_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sso_id` (`username`);
ALTER TABLE `users` ADD FULLTEXT KEY `one_time_password` (`password`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `FKhfh9dx7w3ubf1co1vdev94g3f` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `confirmation_token`
--
ALTER TABLE `confirmation_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `customer_order_detail`
--
ALTER TABLE `customer_order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT cho bảng `list_collection`
--
ALTER TABLE `list_collection`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `list_color`
--
ALTER TABLE `list_color`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `list_material`
--
ALTER TABLE `list_material`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `list_size`
--
ALTER TABLE `list_size`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `order_history`
--
ALTER TABLE `order_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `image_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `FKbd8bicw1ldfg0702iyfphs9fg` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `customer_order_detail`
--
ALTER TABLE `customer_order_detail`
  ADD CONSTRAINT `FK2v1uragrp9nqnpduhvqqtakdq` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`id`),
  ADD CONSTRAINT `FKejbnto28443m72cwaqg94e9p4` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
