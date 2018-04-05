-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-04-05 18:17:17
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性表';

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
  `parentid` int(11) unsigned NOT NULL COMMENT '父类'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目表';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_category_attribute`
--

DROP TABLE IF EXISTS `tbl_category_attribute`;
CREATE TABLE IF NOT EXISTS `tbl_category_attribute` (
  `catattrid` int(11) unsigned NOT NULL,
  `attrid` int(11) unsigned NOT NULL COMMENT '属性id',
  `position` tinyint(2) NOT NULL COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目属性表';

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
  `window_reco` tinyint(1) NOT NULL COMMENT '橱窗推荐'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宝贝表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宝贝属性表';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_item_color`
--

DROP TABLE IF EXISTS `tbl_item_color`;
CREATE TABLE IF NOT EXISTS `tbl_item_color` (
  `colorid` int(11) unsigned NOT NULL,
  `color` varchar(100) DEFAULT NULL COMMENT '颜色',
  `des` varchar(100) DEFAULT NULL COMMENT '备注',
  `img_name` varchar(50) DEFAULT NULL COMMENT '图片名',
  `img_path` varchar(200) DEFAULT NULL COMMENT '图片路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宝贝颜色分类表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宝贝电脑端图片表';

-- --------------------------------------------------------

--
-- 表的结构 `tbl_item_sku`
--

DROP TABLE IF EXISTS `tbl_item_sku`;
CREATE TABLE IF NOT EXISTS `tbl_item_sku` (
  `skuId` int(11) unsigned NOT NULL,
  `itemid` int(11) unsigned NOT NULL COMMENT '宝贝id',
  `colorid` int(11) unsigned DEFAULT NULL COMMENT '颜色分类id',
  `packageid` int(11) unsigned DEFAULT NULL COMMENT '套餐id',
  `price` decimal(10,2) NOT NULL COMMENT '价格（元）',
  `num` int(11) NOT NULL COMMENT '数量（件）',
  `business_code` varchar(100) DEFAULT NULL COMMENT '商家编码',
  `product_barcode` varchar(100) DEFAULT NULL COMMENT '商品条形码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品sku表';

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
  ADD PRIMARY KEY (`catattrid`);

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
-- Indexes for table `tbl_item_color`
--
ALTER TABLE `tbl_item_color`
  ADD PRIMARY KEY (`colorid`);

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
-- Indexes for table `tbl_item_sku`
--
ALTER TABLE `tbl_item_sku`
  ADD PRIMARY KEY (`skuId`);

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
  MODIFY `attrid` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartid` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catid` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_category_attribute`
--
ALTER TABLE `tbl_category_attribute`
  MODIFY `catattrid` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_item_attribute`
--
ALTER TABLE `tbl_item_attribute`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_item_color`
--
ALTER TABLE `tbl_item_color`
  MODIFY `colorid` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_item_package`
--
ALTER TABLE `tbl_item_package`
  MODIFY `packageid` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_item_pc_img`
--
ALTER TABLE `tbl_item_pc_img`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_item_sku`
--
ALTER TABLE `tbl_item_sku`
  MODIFY `skuId` int(11) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
