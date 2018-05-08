-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-05-08 21:24:34
-- 服务器版本： 10.0.32-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taobao_shop`
--
CREATE DATABASE IF NOT EXISTS `taobao_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `taobao_shop`;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_address`
--

DROP TABLE IF EXISTS `tbl_address`;
CREATE TABLE IF NOT EXISTS `tbl_address` (
  `addressid` int(11) NOT NULL,
  `userid` int(11) unsigned NOT NULL COMMENT '用户id',
  `province` varchar(30) NOT NULL COMMENT '省',
  `city` varchar(30) NOT NULL COMMENT '市',
  `district` varchar(30) NOT NULL COMMENT '区',
  `address` varchar(1000) NOT NULL COMMENT '地址',
  `zip_code` varchar(50) NOT NULL COMMENT '邮编'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_attribute`
--

DROP TABLE IF EXISTS `tbl_attribute`;
CREATE TABLE IF NOT EXISTS `tbl_attribute` (
  `attrid` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

--
-- 转存表中的数据 `tbl_attribute`
--

INSERT INTO `tbl_attribute` (`attrid`, `name`) VALUES
(1, '品牌'),
(2, '适用对象'),
(3, '键数'),
(4, '音色数'),
(5, '最大复音数'),
(6, '示范曲数'),
(7, '型号');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_auth_assignment`
--

DROP TABLE IF EXISTS `tbl_auth_assignment`;
CREATE TABLE IF NOT EXISTS `tbl_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `tbl_auth_assignment`
--

INSERT INTO `tbl_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1523003635);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_auth_item`
--

DROP TABLE IF EXISTS `tbl_auth_item`;
CREATE TABLE IF NOT EXISTS `tbl_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `tbl_auth_item`
--

INSERT INTO `tbl_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/address/*', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/address/create', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/address/delete', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/address/index', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/address/update', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/address/view', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/admin/*', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/assignment/*', 2, NULL, NULL, NULL, 1523002438, 1523002438),
('/admin/assignment/assign', 2, NULL, NULL, NULL, 1523002438, 1523002438),
('/admin/assignment/index', 2, NULL, NULL, NULL, 1523002438, 1523002438),
('/admin/assignment/revoke', 2, NULL, NULL, NULL, 1523002438, 1523002438),
('/admin/assignment/view', 2, NULL, NULL, NULL, 1523002438, 1523002438),
('/admin/default/*', 2, NULL, NULL, NULL, 1523002438, 1523002438),
('/admin/default/index', 2, NULL, NULL, NULL, 1523002438, 1523002438),
('/admin/menu/*', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/menu/create', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/menu/delete', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/menu/index', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/menu/update', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/menu/view', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/permission/*', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/permission/assign', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/permission/create', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/permission/delete', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/permission/index', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/permission/remove', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/permission/update', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/permission/view', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/role/*', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/role/assign', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/role/create', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/role/delete', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/role/index', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/role/remove', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/role/update', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/role/view', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/route/*', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/route/assign', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/route/create', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/route/index', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/route/refresh', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/route/remove', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/rule/*', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/rule/create', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/rule/delete', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/rule/index', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/rule/update', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/rule/view', 2, NULL, NULL, NULL, 1523002439, 1523002439),
('/admin/user/*', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/activate', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/change-password', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/delete', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/index', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/login', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/logout', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/request-password-reset', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/reset-password', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/signup', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/admin/user/view', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/attribute/*', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/attribute/create', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/attribute/delete', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/attribute/index', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/attribute/update', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/attribute/view', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/cart/*', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/cart/create', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/cart/delete', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/cart/index', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/cart/update', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/cart/view', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/category-attribute/*', 2, NULL, NULL, NULL, 1523105830, 1523105830),
('/category-attribute/create', 2, NULL, NULL, NULL, 1523105830, 1523105830),
('/category-attribute/delete', 2, NULL, NULL, NULL, 1523105830, 1523105830),
('/category-attribute/index', 2, NULL, NULL, NULL, 1523105830, 1523105830),
('/category-attribute/update', 2, NULL, NULL, NULL, 1523105830, 1523105830),
('/category-attribute/view', 2, NULL, NULL, NULL, 1523105830, 1523105830),
('/category/*', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/category/create', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/category/delete', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/category/index', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/category/update', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/category/view', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/debug/*', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/debug/default/*', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/debug/default/db-explain', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/debug/default/download-mail', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/debug/default/index', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/debug/default/toolbar', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/debug/default/view', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/debug/user/*', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/debug/user/reset-identity', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/debug/user/set-identity', 2, NULL, NULL, NULL, 1523002440, 1523002440),
('/gii/*', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/gii/default/*', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/gii/default/action', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/gii/default/diff', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/gii/default/index', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/gii/default/preview', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/gii/default/view', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/item-attribute/*', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-attribute/create', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/item-attribute/delete', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-attribute/index', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/item-attribute/update', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-attribute/view', 2, NULL, NULL, NULL, 1523002441, 1523002441),
('/item-color/*', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-color/create', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-color/delete', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-color/index', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-color/update', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-color/view', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-package/*', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/item-package/create', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/item-package/delete', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/item-package/index', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/item-package/update', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/item-package/view', 2, NULL, NULL, NULL, 1523091484, 1523091484),
('/item-pc-img/*', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-pc-img/create', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-pc-img/delete', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-pc-img/index', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-pc-img/update', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-pc-img/view', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-sku/*', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/item-sku/create', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/item-sku/delete', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/item-sku/index', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item-sku/update', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/item-sku/view', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item/*', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item/create', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item/delete', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item/index', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item/update', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/item/view', 2, NULL, NULL, NULL, 1523002442, 1523002442),
('/order/*', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/order/create', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/order/delete', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/order/index', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/order/update', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/order/view', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/site/*', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/site/error', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/site/index', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/site/login', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/site/logout', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/sku-attribute-name/*', 2, NULL, NULL, NULL, 1525588871, 1525588871),
('/sku-attribute-name/create', 2, NULL, NULL, NULL, 1525588871, 1525588871),
('/sku-attribute-name/delete', 2, NULL, NULL, NULL, 1525588871, 1525588871),
('/sku-attribute-name/index', 2, NULL, NULL, NULL, 1525588871, 1525588871),
('/sku-attribute-name/update', 2, NULL, NULL, NULL, 1525588871, 1525588871),
('/sku-attribute-name/view', 2, NULL, NULL, NULL, 1525588871, 1525588871),
('/sku-attribute-value/*', 2, NULL, NULL, NULL, 1525588872, 1525588872),
('/sku-attribute-value/create', 2, NULL, NULL, NULL, 1525588872, 1525588872),
('/sku-attribute-value/delete', 2, NULL, NULL, NULL, 1525588872, 1525588872),
('/sku-attribute-value/index', 2, NULL, NULL, NULL, 1525588872, 1525588872),
('/sku-attribute-value/update', 2, NULL, NULL, NULL, 1525588872, 1525588872),
('/sku-attribute-value/view', 2, NULL, NULL, NULL, 1525588872, 1525588872),
('/user/*', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/user/create', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/user/delete', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/user/index', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/user/update', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('/user/view', 2, NULL, NULL, NULL, 1523002443, 1523002443),
('admin', 1, NULL, NULL, NULL, 1523003583, 1523003583),
('guest', 1, NULL, NULL, NULL, 1523003684, 1523003684);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_auth_item_child`
--

DROP TABLE IF EXISTS `tbl_auth_item_child`;
CREATE TABLE IF NOT EXISTS `tbl_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `tbl_auth_item_child`
--

INSERT INTO `tbl_auth_item_child` (`parent`, `child`) VALUES
('admin', '/*'),
('admin', '/address/*'),
('admin', '/address/create'),
('admin', '/address/delete'),
('admin', '/address/index'),
('admin', '/address/update'),
('admin', '/address/view'),
('admin', '/admin/*'),
('admin', '/admin/assignment/*'),
('admin', '/admin/assignment/assign'),
('admin', '/admin/assignment/index'),
('admin', '/admin/assignment/revoke'),
('admin', '/admin/assignment/view'),
('admin', '/admin/default/*'),
('admin', '/admin/default/index'),
('admin', '/admin/menu/*'),
('admin', '/admin/menu/create'),
('admin', '/admin/menu/delete'),
('admin', '/admin/menu/index'),
('admin', '/admin/menu/update'),
('admin', '/admin/menu/view'),
('admin', '/admin/permission/*'),
('admin', '/admin/permission/assign'),
('admin', '/admin/permission/create'),
('admin', '/admin/permission/delete'),
('admin', '/admin/permission/index'),
('admin', '/admin/permission/remove'),
('admin', '/admin/permission/update'),
('admin', '/admin/permission/view'),
('admin', '/admin/role/*'),
('admin', '/admin/role/assign'),
('admin', '/admin/role/create'),
('admin', '/admin/role/delete'),
('admin', '/admin/role/index'),
('admin', '/admin/role/remove'),
('admin', '/admin/role/update'),
('admin', '/admin/role/view'),
('admin', '/admin/route/*'),
('admin', '/admin/route/assign'),
('admin', '/admin/route/create'),
('admin', '/admin/route/index'),
('admin', '/admin/route/refresh'),
('admin', '/admin/route/remove'),
('admin', '/admin/rule/*'),
('admin', '/admin/rule/create'),
('admin', '/admin/rule/delete'),
('admin', '/admin/rule/index'),
('admin', '/admin/rule/update'),
('admin', '/admin/rule/view'),
('admin', '/admin/user/*'),
('admin', '/admin/user/activate'),
('admin', '/admin/user/change-password'),
('admin', '/admin/user/delete'),
('admin', '/admin/user/index'),
('admin', '/admin/user/login'),
('admin', '/admin/user/logout'),
('admin', '/admin/user/request-password-reset'),
('admin', '/admin/user/reset-password'),
('admin', '/admin/user/signup'),
('admin', '/admin/user/view'),
('admin', '/attribute/*'),
('admin', '/attribute/create'),
('admin', '/attribute/delete'),
('admin', '/attribute/index'),
('admin', '/attribute/update'),
('admin', '/attribute/view'),
('admin', '/cart/*'),
('admin', '/cart/create'),
('admin', '/cart/delete'),
('admin', '/cart/index'),
('admin', '/cart/update'),
('admin', '/cart/view'),
('admin', '/category-attribute/*'),
('admin', '/category-attribute/create'),
('admin', '/category-attribute/delete'),
('admin', '/category-attribute/index'),
('admin', '/category-attribute/update'),
('admin', '/category-attribute/view'),
('admin', '/category/*'),
('admin', '/category/create'),
('admin', '/category/delete'),
('admin', '/category/index'),
('admin', '/category/update'),
('admin', '/category/view'),
('admin', '/debug/*'),
('admin', '/debug/default/*'),
('admin', '/debug/default/db-explain'),
('admin', '/debug/default/download-mail'),
('admin', '/debug/default/index'),
('admin', '/debug/default/toolbar'),
('admin', '/debug/default/view'),
('admin', '/debug/user/*'),
('admin', '/debug/user/reset-identity'),
('admin', '/debug/user/set-identity'),
('admin', '/gii/*'),
('admin', '/gii/default/*'),
('admin', '/gii/default/action'),
('admin', '/gii/default/diff'),
('admin', '/gii/default/index'),
('admin', '/gii/default/preview'),
('admin', '/gii/default/view'),
('admin', '/item-attribute/*'),
('admin', '/item-attribute/create'),
('admin', '/item-attribute/delete'),
('admin', '/item-attribute/index'),
('admin', '/item-attribute/update'),
('admin', '/item-attribute/view'),
('admin', '/item-color/*'),
('admin', '/item-color/create'),
('admin', '/item-color/delete'),
('admin', '/item-color/index'),
('admin', '/item-color/update'),
('admin', '/item-color/view'),
('admin', '/item-package/*'),
('admin', '/item-package/create'),
('admin', '/item-package/delete'),
('admin', '/item-package/index'),
('admin', '/item-package/update'),
('admin', '/item-package/view'),
('admin', '/item-pc-img/*'),
('admin', '/item-pc-img/create'),
('admin', '/item-pc-img/delete'),
('admin', '/item-pc-img/index'),
('admin', '/item-pc-img/update'),
('admin', '/item-pc-img/view'),
('admin', '/item-sku/*'),
('admin', '/item-sku/create'),
('admin', '/item-sku/delete'),
('admin', '/item-sku/index'),
('admin', '/item-sku/update'),
('admin', '/item-sku/view'),
('admin', '/item/*'),
('admin', '/item/create'),
('admin', '/item/delete'),
('admin', '/item/index'),
('admin', '/item/update'),
('admin', '/item/view'),
('admin', '/order/*'),
('admin', '/order/create'),
('admin', '/order/delete'),
('admin', '/order/index'),
('admin', '/order/update'),
('admin', '/order/view'),
('admin', '/site/*'),
('admin', '/site/error'),
('admin', '/site/index'),
('admin', '/site/login'),
('admin', '/site/logout'),
('admin', '/sku-attribute-name/*'),
('admin', '/sku-attribute-name/create'),
('admin', '/sku-attribute-name/delete'),
('admin', '/sku-attribute-name/index'),
('admin', '/sku-attribute-name/update'),
('admin', '/sku-attribute-name/view'),
('admin', '/sku-attribute-value/*'),
('admin', '/sku-attribute-value/create'),
('admin', '/sku-attribute-value/delete'),
('admin', '/sku-attribute-value/index'),
('admin', '/sku-attribute-value/update'),
('admin', '/sku-attribute-value/view'),
('admin', '/user/*'),
('admin', '/user/create'),
('admin', '/user/delete'),
('admin', '/user/index'),
('admin', '/user/update'),
('admin', '/user/view');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_auth_rule`
--

DROP TABLE IF EXISTS `tbl_auth_rule`;
CREATE TABLE IF NOT EXISTS `tbl_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_cart`
--

DROP TABLE IF EXISTS `tbl_cart`;
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cartid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL COMMENT '用户id',
  `itemid` int(11) unsigned NOT NULL COMMENT '宝贝id',
  `skuid` int(11) unsigned NOT NULL COMMENT 'sku',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `catid` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '类目名字',
  `parentid` int(11) unsigned DEFAULT NULL COMMENT '父类'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='类目表';

--
-- 转存表中的数据 `tbl_category`
--

INSERT INTO `tbl_category` (`catid`, `name`, `parentid`) VALUES
(1, '文化玩乐', NULL),
(2, '乐器/吉他/钢琴/配件', 1),
(3, '西洋乐器', 2),
(4, '西洋键盘乐器', 3),
(5, '手卷钢琴', 4);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_category_attribute`
--

DROP TABLE IF EXISTS `tbl_category_attribute`;
CREATE TABLE IF NOT EXISTS `tbl_category_attribute` (
  `id` int(11) NOT NULL,
  `catid` int(11) unsigned NOT NULL COMMENT '分类id',
  `attrid` int(11) unsigned NOT NULL COMMENT '属性id',
  `position` tinyint(2) NOT NULL COMMENT '排序'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='类目属性表';

--
-- 转存表中的数据 `tbl_category_attribute`
--

INSERT INTO `tbl_category_attribute` (`id`, `catid`, `attrid`, `position`) VALUES
(1, 5, 1, 1),
(2, 5, 7, 2),
(3, 5, 2, 3),
(4, 5, 3, 4),
(5, 5, 4, 5),
(6, 5, 5, 6),
(7, 5, 6, 7);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_item`
--

DROP TABLE IF EXISTS `tbl_item`;
CREATE TABLE IF NOT EXISTS `tbl_item` (
  `itemid` int(11) unsigned NOT NULL,
  `catid` int(11) NOT NULL COMMENT '类目',
  `type` tinyint(4) NOT NULL COMMENT '宝贝类型',
  `title` varchar(120) NOT NULL COMMENT '宝贝标题',
  `img_video` text COMMENT '主图视频',
  `price` decimal(10,2) NOT NULL COMMENT '价格（元）',
  `discount_price` decimal(10,2) DEFAULT NULL COMMENT '促销价',
  `num` int(11) NOT NULL COMMENT '数量（件）',
  `business_code` varchar(100) DEFAULT NULL COMMENT '商家编码',
  `product_barcode` varchar(100) DEFAULT NULL COMMENT '商品条形码',
  `purchase_place` varchar(30) NOT NULL COMMENT '采购地',
  `item_video` text COMMENT '宝贝视频',
  `pc_des` text NOT NULL COMMENT '电脑端描述',
  `mob_des` text COMMENT '手机端描述',
  `transid` int(11) unsigned DEFAULT NULL COMMENT '物流服务',
  `warranty` text COMMENT '售后服务',
  `online_time` varchar(20) NOT NULL COMMENT '上架时间',
  `window_reco` tinyint(1) NOT NULL COMMENT '橱窗推荐',
  `userid` int(11) unsigned NOT NULL COMMENT '卖家编号'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='宝贝表';

--
-- 转存表中的数据 `tbl_item`
--

INSERT INTO `tbl_item` (`itemid`, `catid`, `type`, `title`, `img_video`, `price`, `discount_price`, `num`, `business_code`, `product_barcode`, `purchase_place`, `item_video`, `pc_des`, `mob_des`, `transid`, `warranty`, `online_time`, `window_reco`, `userid`) VALUES
(1, 5, 0, '音格格手卷电子钢琴便携式88键初学者成人家用键盘专业加厚版入门', '', '716.00', '358.00', 9000, '1', '', '国内', '', '1', '', NULL, '', '2018-4-1', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_item_attribute`
--

DROP TABLE IF EXISTS `tbl_item_attribute`;
CREATE TABLE IF NOT EXISTS `tbl_item_attribute` (
  `id` int(11) unsigned NOT NULL,
  `itemid` int(11) unsigned NOT NULL COMMENT '商品',
  `attrid` int(11) unsigned NOT NULL COMMENT '宝贝属性',
  `value` varchar(200) NOT NULL COMMENT '宝贝属性值'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='宝贝属性表';

--
-- 转存表中的数据 `tbl_item_attribute`
--

INSERT INTO `tbl_item_attribute` (`id`, `itemid`, `attrid`, `value`) VALUES
(1, 1, 1, '音格格'),
(2, 1, 7, 'Q8'),
(3, 1, 3, '88键'),
(4, 1, 4, '101种(含)-200种(含)'),
(5, 1, 5, '128个'),
(6, 1, 6, '101首及以上');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_item_package`
--

DROP TABLE IF EXISTS `tbl_item_package`;
CREATE TABLE IF NOT EXISTS `tbl_item_package` (
  `packageid` int(11) unsigned NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '套餐类型'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_item_package`
--

INSERT INTO `tbl_item_package` (`packageid`, `name`) VALUES
(1, '官方标配'),
(2, '套餐一'),
(3, '套餐二'),
(4, '套餐三'),
(5, '套餐四'),
(6, '套餐五'),
(7, '套餐六'),
(8, '套餐七'),
(9, '套餐八');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_item_pc_img`
--

DROP TABLE IF EXISTS `tbl_item_pc_img`;
CREATE TABLE IF NOT EXISTS `tbl_item_pc_img` (
  `id` int(11) unsigned NOT NULL,
  `itemid` int(11) unsigned NOT NULL COMMENT '宝贝id',
  `name` varchar(100) NOT NULL COMMENT '图片名字',
  `path` varchar(200) NOT NULL COMMENT '图片路径',
  `position` tinyint(1) NOT NULL COMMENT '排序'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='宝贝电脑端图片表';

--
-- 转存表中的数据 `tbl_item_pc_img`
--

INSERT INTO `tbl_item_pc_img` (`id`, `itemid`, `name`, `path`, `position`) VALUES
(1, 1, 'TB2gwvUpeOSBuNjy0FdXXbDnVXa_!!3021610629-0-item_pic.jpg', 'https://img.alicdn.com/imgextra/i1/3021610629/TB2gwvUpeOSBuNjy0FdXXbDnVXa_!!3021610629-0-item_pic.jpg', 1),
(2, 1, 'TB23U78phWYBuNjy1zkXXXGGpXa_!!3021610629.jpg', 'https://img.alicdn.com/imgextra/i4/3021610629/TB23U78phWYBuNjy1zkXXXGGpXa_!!3021610629.jpg', 2),
(3, 1, 'TB29s9un1OSBuNjy0FdXXbDnVXa_!!3021610629.jpg', 'https://img.alicdn.com/imgextra/i1/3021610629/TB29s9un1OSBuNjy0FdXXbDnVXa_!!3021610629.jpg', 3),
(4, 1, 'TB2i5PVn25TBuNjSspcXXbnGFXa_!!3021610629.jpg', 'https://img.alicdn.com/imgextra/i2/3021610629/TB2i5PVn25TBuNjSspcXXbnGFXa_!!3021610629.jpg', 4),
(5, 1, 'TB25HsGckfb_uJkHFqDXXXVIVXa_!!3021610629.jpg', 'https://img.alicdn.com/imgextra/i2/3021610629/TB25HsGckfb_uJkHFqDXXXVIVXa_!!3021610629.jpg', 5);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_item_size`
--

DROP TABLE IF EXISTS `tbl_item_size`;
CREATE TABLE IF NOT EXISTS `tbl_item_size` (
  `item_size_id` int(11) unsigned NOT NULL,
  `type` enum('通用','中国码','英码','美码','均码','自定义尺码') NOT NULL COMMENT '类型',
  `size` varchar(50) NOT NULL COMMENT '尺码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品尺码表';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_item_sku`
--

DROP TABLE IF EXISTS `tbl_item_sku`;
CREATE TABLE IF NOT EXISTS `tbl_item_sku` (
  `skuId` int(11) unsigned NOT NULL COMMENT 'SKU编号',
  `itemid` int(11) unsigned NOT NULL COMMENT '宝贝id',
  `sku_attr` varchar(200) DEFAULT NULL COMMENT 'SKU属性',
  `price` decimal(10,2) NOT NULL COMMENT '价格（元）',
  `promotion_price` decimal(10,2) NOT NULL COMMENT '促销价',
  `num` int(11) NOT NULL COMMENT '数量（件）',
  `business_code` varchar(100) DEFAULT NULL COMMENT '商家编码',
  `product_barcode` varchar(100) DEFAULT NULL COMMENT '商品条形码'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品sku表';

--
-- 转存表中的数据 `tbl_item_sku`
--

INSERT INTO `tbl_item_sku` (`skuId`, `itemid`, `sku_attr`, `price`, `promotion_price`, `num`, `business_code`, `product_barcode`) VALUES
(1, 1, '1:1', '716.00', '358.00', 10000, '1', ''),
(2, 1, '1:2', '796.00', '398.00', 10000, '1', ''),
(3, 1, '1:3', '796.00', '398.00', 10000, '1', ''),
(4, 1, '1:4', '796.00', '398.00', 10000, '1', '');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
CREATE TABLE IF NOT EXISTS `tbl_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `name`, `parent`, `route`, `order`, `data`) VALUES
(1, '系统设置', NULL, NULL, 1, NULL),
(2, '用户列表', 1, '/admin/user/index', 1, NULL),
(3, '分配', 1, '/admin/assignment/index', 2, NULL),
(4, '权限列表', 1, '/admin/permission/index', 4, NULL),
(5, '路由列表', 1, '/admin/route/index', 5, NULL),
(6, '规则列表', 1, '/admin/rule/index', 6, NULL),
(7, '菜单列表', 1, '/admin/menu/index', 7, NULL),
(8, '角色列表', 1, '/admin/role/index', 3, NULL),
(9, '类目管理', NULL, '/category/index', 2, NULL),
(10, '属性管理', NULL, '/attribute/index', 3, NULL),
(11, '类目属性管理', NULL, '/category-attribute/index', 4, NULL),
(12, '宝贝管理', NULL, '/item/index', 5, NULL),
(13, '宝贝属性管理', NULL, '/item-attribute/index', 5, NULL),
(14, '宝贝颜色管理', NULL, '/item-color/index', 6, NULL),
(15, '宝贝套餐管理', NULL, '/item-package/index', 6, NULL),
(16, '宝贝电脑端图片管理', NULL, '/item-pc-img/index', 7, NULL),
(17, '宝贝sku管理', NULL, '/item-sku/index', 7, NULL),
(18, '订单管理', NULL, '/order/index', 8, NULL),
(19, '收货地址管理', NULL, '/address/index', 11, NULL),
(20, 'sku属性名', NULL, '/sku-attribute-name/index', 9, NULL),
(21, 'sku属性值', NULL, '/sku-attribute-value/index', 10, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_migration`
--

DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m130524_201442_init', 1523002284),
('m140506_102106_rbac_init', 1523002345),
('m140602_111327_create_menu_table', 1523002293),
('m160312_050000_create_user', 1523002293),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1523002345);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `orderid` varchar(50) NOT NULL COMMENT '订单号',
  `userid` int(11) unsigned NOT NULL COMMENT '用户id',
  `itemid` int(11) unsigned NOT NULL COMMENT '宝贝id',
  `skuid` int(11) unsigned NOT NULL COMMENT 'skuid',
  `quantity` tinyint(3) NOT NULL COMMENT '数量',
  `couponid` int(11) unsigned DEFAULT NULL COMMENT '优惠券',
  `pay_amount` decimal(10,2) NOT NULL COMMENT '实付款',
  `shipping_address` varchar(600) NOT NULL COMMENT '收货地址',
  `note` text COMMENT '买家备注',
  `zip_code` varchar(20) NOT NULL COMMENT '邮编',
  `shipping_id` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `shipping_time` date DEFAULT NULL COMMENT '寄送时间',
  `pay_time` date DEFAULT NULL COMMENT '支付时间',
  `alipay_number` varchar(50) DEFAULT NULL COMMENT '支付宝交易号',
  `pay_status` tinyint(1) NOT NULL COMMENT '支付状态（0 未支付，1已支付）',
  `close_type` varchar(300) DEFAULT NULL COMMENT '关闭类型',
  `close_time` date DEFAULT NULL COMMENT '关闭时间',
  `cloase_reason` varchar(300) DEFAULT NULL COMMENT '关闭原因'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sku_attribute_name`
--

DROP TABLE IF EXISTS `tbl_sku_attribute_name`;
CREATE TABLE IF NOT EXISTS `tbl_sku_attribute_name` (
  `attr_name_id` int(11) unsigned NOT NULL COMMENT '属性名编号',
  `name` varchar(100) DEFAULT NULL COMMENT '属性名',
  `cartid` varchar(300) DEFAULT NULL COMMENT '商品分类编号'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='SKU属性名';

--
-- 转存表中的数据 `tbl_sku_attribute_name`
--

INSERT INTO `tbl_sku_attribute_name` (`attr_name_id`, `name`, `cartid`) VALUES
(1, '颜色分类', '5');

-- --------------------------------------------------------

--
-- 表的结构 `tbl_sku_attribute_value`
--

DROP TABLE IF EXISTS `tbl_sku_attribute_value`;
CREATE TABLE IF NOT EXISTS `tbl_sku_attribute_value` (
  `id` int(11) unsigned NOT NULL COMMENT '属性值编号',
  `title` varchar(300) NOT NULL COMMENT '属性值标题',
  `value` varchar(300) NOT NULL COMMENT '属性值',
  `attr_name_id` int(11) unsigned NOT NULL COMMENT '属性名编号'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tbl_sku_attribute_value`
--

INSERT INTO `tbl_sku_attribute_value` (`id`, `title`, `value`, `attr_name_id`) VALUES
(1, '旗舰版-61键【不支持充电】', '//img.alicdn.com/imgextra/i4/3021610629/TB2KQCdXhwlyKJjSZFNXXcOlpXa_!!3021610629.jpg_40x40q90.jpg', 1),
(2, '尊贵版88键黑【魔音喇叭＋精美包装】送踏板', '//img.alicdn.com/imgextra/i4/3021610629/TB2aT2Mf8DH8KJjSspnXXbNAVXa_!!3021610629.jpg_40x40q90.jpg', 1),
(3, '尊贵版88键粉【魔音喇叭＋精美包装】送踏板', '//img.alicdn.com/imgextra/i2/3021610629/TB2hzWdf6nD8KJjSspbXXbbEXXa_!!3021610629.jpg_40x40q90.jpg', 1),
(4, '尊贵版88键白【魔音喇叭＋精美包装】送踏板', '//img.alicdn.com/imgextra/i3/3021610629/TB2acqef2DH8KJjy1XcXXcpdXXa_!!3021610629.jpg_40x40q90.jpg', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'er9bLLNSwf4tR8r6tUKbAOaHh8HNtD2R', '$2y$13$zKAWCSDIWIdRB8as9lBHTuZeH8G56uILA9yMaaIOa6GGUgIWZ6h56', NULL, '1@admin.com', 10, 1523003495, 1523003495);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD PRIMARY KEY (`addressid`);

--
-- Indexes for table `tbl_attribute`
--
ALTER TABLE `tbl_attribute`
  ADD PRIMARY KEY (`attrid`);

--
-- Indexes for table `tbl_auth_assignment`
--
ALTER TABLE `tbl_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indexes for table `tbl_auth_item`
--
ALTER TABLE `tbl_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `tbl_auth_item_child`
--
ALTER TABLE `tbl_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `tbl_auth_rule`
--
ALTER TABLE `tbl_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartid`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `tbl_category_attribute`
--
ALTER TABLE `tbl_category_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `tbl_item_attribute`
--
ALTER TABLE `tbl_item_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_item_package`
--
ALTER TABLE `tbl_item_package`
  ADD PRIMARY KEY (`packageid`);

--
-- Indexes for table `tbl_item_pc_img`
--
ALTER TABLE `tbl_item_pc_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_item_size`
--
ALTER TABLE `tbl_item_size`
  ADD PRIMARY KEY (`item_size_id`);

--
-- Indexes for table `tbl_item_sku`
--
ALTER TABLE `tbl_item_sku`
  ADD PRIMARY KEY (`skuId`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `tbl_migration`
--
ALTER TABLE `tbl_migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `tbl_sku_attribute_name`
--
ALTER TABLE `tbl_sku_attribute_name`
  ADD PRIMARY KEY (`attr_name_id`);

--
-- Indexes for table `tbl_sku_attribute_value`
--
ALTER TABLE `tbl_sku_attribute_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_address`
--
ALTER TABLE `tbl_address`
  MODIFY `addressid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_attribute`
--
ALTER TABLE `tbl_attribute`
  MODIFY `attrid` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartid` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catid` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_category_attribute`
--
ALTER TABLE `tbl_category_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_item`
--
ALTER TABLE `tbl_item`
  MODIFY `itemid` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_item_attribute`
--
ALTER TABLE `tbl_item_attribute`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_item_package`
--
ALTER TABLE `tbl_item_package`
  MODIFY `packageid` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_item_pc_img`
--
ALTER TABLE `tbl_item_pc_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_item_size`
--
ALTER TABLE `tbl_item_size`
  MODIFY `item_size_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_item_sku`
--
ALTER TABLE `tbl_item_sku`
  MODIFY `skuId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'SKU编号',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_sku_attribute_name`
--
ALTER TABLE `tbl_sku_attribute_name`
  MODIFY `attr_name_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性名编号',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_sku_attribute_value`
--
ALTER TABLE `tbl_sku_attribute_value`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值编号',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- 限制导出的表
--

--
-- 限制表 `tbl_auth_assignment`
--
ALTER TABLE `tbl_auth_assignment`
  ADD CONSTRAINT `tbl_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `tbl_auth_item`
--
ALTER TABLE `tbl_auth_item`
  ADD CONSTRAINT `tbl_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tbl_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `tbl_auth_item_child`
--
ALTER TABLE `tbl_auth_item_child`
  ADD CONSTRAINT `tbl_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD CONSTRAINT `tbl_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
