-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-07-01 13:24:31
-- 服务器版本： 10.0.32-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecshop`
--
CREATE DATABASE IF NOT EXISTS `ecshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ecshop`;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_account_log`
--

DROP TABLE IF EXISTS `ecs_account_log`;
CREATE TABLE IF NOT EXISTS `ecs_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_money` decimal(10,2) NOT NULL,
  `frozen_money` decimal(10,2) NOT NULL,
  `rank_points` mediumint(9) NOT NULL,
  `pay_points` mediumint(9) NOT NULL,
  `change_time` int(10) unsigned NOT NULL,
  `change_desc` varchar(255) NOT NULL,
  `change_type` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_ad`
--

DROP TABLE IF EXISTS `ecs_ad`;
CREATE TABLE IF NOT EXISTS `ecs_ad` (
  `ad_id` smallint(5) unsigned NOT NULL,
  `position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_code` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `link_email` varchar(60) NOT NULL DEFAULT '',
  `link_phone` varchar(60) NOT NULL DEFAULT '',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_admin_action`
--

DROP TABLE IF EXISTS `ecs_admin_action`;
CREATE TABLE IF NOT EXISTS `ecs_admin_action` (
  `action_id` tinyint(3) unsigned NOT NULL,
  `parent_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_code` varchar(20) NOT NULL DEFAULT '',
  `relevance` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_admin_log`
--

DROP TABLE IF EXISTS `ecs_admin_log`;
CREATE TABLE IF NOT EXISTS `ecs_admin_log` (
  `log_id` int(10) unsigned NOT NULL,
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `log_info` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_admin_message`
--

DROP TABLE IF EXISTS `ecs_admin_message`;
CREATE TABLE IF NOT EXISTS `ecs_admin_message` (
  `message_id` smallint(5) unsigned NOT NULL,
  `sender_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `receiver_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sent_time` int(11) unsigned NOT NULL DEFAULT '0',
  `read_time` int(11) unsigned NOT NULL DEFAULT '0',
  `readed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_admin_user`
--

DROP TABLE IF EXISTS `ecs_admin_user`;
CREATE TABLE IF NOT EXISTS `ecs_admin_user` (
  `user_id` smallint(5) unsigned NOT NULL,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `ec_salt` varchar(10) DEFAULT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `nav_list` text NOT NULL,
  `lang_type` varchar(50) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `suppliers_id` smallint(5) unsigned DEFAULT '0',
  `todolist` longtext,
  `role_id` smallint(5) DEFAULT NULL,
  `passport_uid` varchar(20) DEFAULT NULL,
  `yq_create_time` smallint(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_adsense`
--

DROP TABLE IF EXISTS `ecs_adsense`;
CREATE TABLE IF NOT EXISTS `ecs_adsense` (
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_ad_custom`
--

DROP TABLE IF EXISTS `ecs_ad_custom`;
CREATE TABLE IF NOT EXISTS `ecs_ad_custom` (
  `ad_id` mediumint(8) unsigned NOT NULL,
  `ad_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ad_name` varchar(60) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `url` varchar(255) DEFAULT NULL,
  `ad_status` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_ad_position`
--

DROP TABLE IF EXISTS `ecs_ad_position`;
CREATE TABLE IF NOT EXISTS `ecs_ad_position` (
  `position_id` tinyint(3) unsigned NOT NULL,
  `position_name` varchar(60) NOT NULL DEFAULT '',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_desc` varchar(255) NOT NULL DEFAULT '',
  `position_style` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_affiliate_log`
--

DROP TABLE IF EXISTS `ecs_affiliate_log`;
CREATE TABLE IF NOT EXISTS `ecs_affiliate_log` (
  `log_id` mediumint(8) NOT NULL,
  `order_id` mediumint(8) NOT NULL,
  `time` int(10) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point` int(10) NOT NULL DEFAULT '0',
  `separate_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_agency`
--

DROP TABLE IF EXISTS `ecs_agency`;
CREATE TABLE IF NOT EXISTS `ecs_agency` (
  `agency_id` smallint(5) unsigned NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `agency_desc` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_area_region`
--

DROP TABLE IF EXISTS `ecs_area_region`;
CREATE TABLE IF NOT EXISTS `ecs_area_region` (
  `shipping_area_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_id` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_article`
--

DROP TABLE IF EXISTS `ecs_article`;
CREATE TABLE IF NOT EXISTS `ecs_article` (
  `article_id` mediumint(8) unsigned NOT NULL,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '',
  `author_email` varchar(60) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_article_cat`
--

DROP TABLE IF EXISTS `ecs_article_cat`;
CREATE TABLE IF NOT EXISTS `ecs_article_cat` (
  `cat_id` smallint(5) NOT NULL,
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `cat_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `show_in_nav` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_attribute`
--

DROP TABLE IF EXISTS `ecs_attribute`;
CREATE TABLE IF NOT EXISTS `ecs_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_auction_log`
--

DROP TABLE IF EXISTS `ecs_auction_log`;
CREATE TABLE IF NOT EXISTS `ecs_auction_log` (
  `log_id` mediumint(8) unsigned NOT NULL,
  `act_id` mediumint(8) unsigned NOT NULL,
  `bid_user` mediumint(8) unsigned NOT NULL,
  `bid_price` decimal(10,2) unsigned NOT NULL,
  `bid_time` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_auto_manage`
--

DROP TABLE IF EXISTS `ecs_auto_manage`;
CREATE TABLE IF NOT EXISTS `ecs_auto_manage` (
  `item_id` mediumint(8) NOT NULL,
  `type` varchar(10) NOT NULL,
  `starttime` int(10) NOT NULL,
  `endtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_back_goods`
--

DROP TABLE IF EXISTS `ecs_back_goods`;
CREATE TABLE IF NOT EXISTS `ecs_back_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL,
  `back_id` mediumint(8) unsigned DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_sn` varchar(60) DEFAULT NULL,
  `goods_name` varchar(120) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `goods_sn` varchar(60) DEFAULT NULL,
  `is_real` tinyint(1) unsigned DEFAULT '0',
  `send_number` smallint(5) unsigned DEFAULT '0',
  `goods_attr` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_back_order`
--

DROP TABLE IF EXISTS `ecs_back_order`;
CREATE TABLE IF NOT EXISTS `ecs_back_order` (
  `back_id` mediumint(8) unsigned NOT NULL,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `return_time` int(10) unsigned DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_bonus_type`
--

DROP TABLE IF EXISTS `ecs_bonus_type`;
CREATE TABLE IF NOT EXISTS `ecs_bonus_type` (
  `type_id` smallint(5) unsigned NOT NULL,
  `type_name` varchar(60) NOT NULL DEFAULT '',
  `type_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `send_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `max_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `send_start_date` int(11) NOT NULL DEFAULT '0',
  `send_end_date` int(11) NOT NULL DEFAULT '0',
  `use_start_date` int(11) NOT NULL DEFAULT '0',
  `use_end_date` int(11) NOT NULL DEFAULT '0',
  `min_goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_booking_goods`
--

DROP TABLE IF EXISTS `ecs_booking_goods`;
CREATE TABLE IF NOT EXISTS `ecs_booking_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_desc` varchar(255) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `booking_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_dispose` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dispose_user` varchar(30) NOT NULL DEFAULT '',
  `dispose_time` int(10) unsigned NOT NULL DEFAULT '0',
  `dispose_note` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_brand`
--

DROP TABLE IF EXISTS `ecs_brand`;
CREATE TABLE IF NOT EXISTS `ecs_brand` (
  `brand_id` smallint(5) unsigned NOT NULL,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_logo` varchar(80) NOT NULL DEFAULT '',
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_card`
--

DROP TABLE IF EXISTS `ecs_card`;
CREATE TABLE IF NOT EXISTS `ecs_card` (
  `card_id` tinyint(3) unsigned NOT NULL,
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_img` varchar(255) NOT NULL DEFAULT '',
  `card_fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `free_money` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `card_desc` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_cart`
--

DROP TABLE IF EXISTS `ecs_cart`;
CREATE TABLE IF NOT EXISTS `ecs_cart` (
  `rec_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr` text NOT NULL,
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rec_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_handsel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_category`
--

DROP TABLE IF EXISTS `ecs_category`;
CREATE TABLE IF NOT EXISTS `ecs_category` (
  `cat_id` smallint(5) unsigned NOT NULL,
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `template_file` varchar(50) NOT NULL DEFAULT '',
  `measure_unit` varchar(15) NOT NULL DEFAULT '',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(150) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `filter_attr` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_cat_recommend`
--

DROP TABLE IF EXISTS `ecs_cat_recommend`;
CREATE TABLE IF NOT EXISTS `ecs_cat_recommend` (
  `cat_id` smallint(5) NOT NULL,
  `recommend_type` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_cert`
--

DROP TABLE IF EXISTS `ecs_cert`;
CREATE TABLE IF NOT EXISTS `ecs_cert` (
  `id` int(10) unsigned NOT NULL,
  `config_id` tinyint(4) NOT NULL COMMENT '配置id',
  `file` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_collect_goods`
--

DROP TABLE IF EXISTS `ecs_collect_goods`;
CREATE TABLE IF NOT EXISTS `ecs_collect_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_attention` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_comment`
--

DROP TABLE IF EXISTS `ecs_comment`;
CREATE TABLE IF NOT EXISTS `ecs_comment` (
  `comment_id` int(10) unsigned NOT NULL,
  `comment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_value` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `comment_rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_config`
--

DROP TABLE IF EXISTS `ecs_config`;
CREATE TABLE IF NOT EXISTS `ecs_config` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `config` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_crons`
--

DROP TABLE IF EXISTS `ecs_crons`;
CREATE TABLE IF NOT EXISTS `ecs_crons` (
  `cron_id` tinyint(3) unsigned NOT NULL,
  `cron_code` varchar(20) NOT NULL,
  `cron_name` varchar(120) NOT NULL,
  `cron_desc` text,
  `cron_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cron_config` text NOT NULL,
  `thistime` int(10) NOT NULL DEFAULT '0',
  `nextime` int(10) NOT NULL,
  `day` tinyint(2) NOT NULL,
  `week` varchar(1) NOT NULL,
  `hour` varchar(2) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `run_once` tinyint(1) NOT NULL DEFAULT '0',
  `allow_ip` varchar(100) NOT NULL DEFAULT '',
  `alow_files` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_delivery_goods`
--

DROP TABLE IF EXISTS `ecs_delivery_goods`;
CREATE TABLE IF NOT EXISTS `ecs_delivery_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL,
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned DEFAULT '0',
  `product_sn` varchar(60) DEFAULT NULL,
  `goods_name` varchar(120) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `goods_sn` varchar(60) DEFAULT NULL,
  `is_real` tinyint(1) unsigned DEFAULT '0',
  `extension_code` varchar(30) DEFAULT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT '0',
  `send_number` smallint(5) unsigned DEFAULT '0',
  `goods_attr` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_delivery_order`
--

DROP TABLE IF EXISTS `ecs_delivery_order`;
CREATE TABLE IF NOT EXISTS `ecs_delivery_order` (
  `delivery_id` mediumint(8) unsigned NOT NULL,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_device`
--

DROP TABLE IF EXISTS `ecs_device`;
CREATE TABLE IF NOT EXISTS `ecs_device` (
  `user_id` int(11) NOT NULL,
  `device_id` varchar(200) NOT NULL COMMENT '设备id',
  `device_type` varchar(200) NOT NULL COMMENT '设备类型',
  `platform_type` varchar(200) NOT NULL COMMENT '平台类型',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '推送开关 0:关闭 1:开启 默认开启',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_email_list`
--

DROP TABLE IF EXISTS `ecs_email_list`;
CREATE TABLE IF NOT EXISTS `ecs_email_list` (
  `id` mediumint(8) NOT NULL,
  `email` varchar(60) NOT NULL,
  `stat` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_email_sendlist`
--

DROP TABLE IF EXISTS `ecs_email_sendlist`;
CREATE TABLE IF NOT EXISTS `ecs_email_sendlist` (
  `id` mediumint(8) NOT NULL,
  `email` varchar(100) NOT NULL,
  `template_id` mediumint(8) NOT NULL,
  `email_content` text NOT NULL,
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `pri` tinyint(10) NOT NULL,
  `last_send` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_error_log`
--

DROP TABLE IF EXISTS `ecs_error_log`;
CREATE TABLE IF NOT EXISTS `ecs_error_log` (
  `id` int(10) NOT NULL,
  `info` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_exchange_goods`
--

DROP TABLE IF EXISTS `ecs_exchange_goods`;
CREATE TABLE IF NOT EXISTS `ecs_exchange_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `exchange_integral` int(10) unsigned NOT NULL DEFAULT '0',
  `is_exchange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_favourable_activity`
--

DROP TABLE IF EXISTS `ecs_favourable_activity`;
CREATE TABLE IF NOT EXISTS `ecs_favourable_activity` (
  `act_id` smallint(5) unsigned NOT NULL,
  `act_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `user_rank` varchar(255) NOT NULL,
  `act_range` tinyint(3) unsigned NOT NULL,
  `act_range_ext` varchar(255) NOT NULL,
  `min_amount` decimal(10,2) unsigned NOT NULL,
  `max_amount` decimal(10,2) unsigned NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `act_type_ext` decimal(10,2) unsigned NOT NULL,
  `gift` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_feedback`
--

DROP TABLE IF EXISTS `ecs_feedback`;
CREATE TABLE IF NOT EXISTS `ecs_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(60) NOT NULL DEFAULT '',
  `msg_title` varchar(200) NOT NULL DEFAULT '',
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_content` text NOT NULL,
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `message_img` varchar(255) NOT NULL DEFAULT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_area` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_friend_link`
--

DROP TABLE IF EXISTS `ecs_friend_link`;
CREATE TABLE IF NOT EXISTS `ecs_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL,
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_logo` varchar(255) NOT NULL DEFAULT '',
  `show_order` tinyint(3) unsigned NOT NULL DEFAULT '50'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods`
--

DROP TABLE IF EXISTS `ecs_goods`;
CREATE TABLE IF NOT EXISTS `ecs_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `virtual_sales` smallint(5) unsigned NOT NULL DEFAULT '0',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_activity`
--

DROP TABLE IF EXISTS `ecs_goods_activity`;
CREATE TABLE IF NOT EXISTS `ecs_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL,
  `act_name` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_article`
--

DROP TABLE IF EXISTS `ecs_goods_article`;
CREATE TABLE IF NOT EXISTS `ecs_goods_article` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `article_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_attr`
--

DROP TABLE IF EXISTS `ecs_goods_attr`;
CREATE TABLE IF NOT EXISTS `ecs_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_cat`
--

DROP TABLE IF EXISTS `ecs_goods_cat`;
CREATE TABLE IF NOT EXISTS `ecs_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_gallery`
--

DROP TABLE IF EXISTS `ecs_goods_gallery`;
CREATE TABLE IF NOT EXISTS `ecs_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `img_desc` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` varchar(255) NOT NULL DEFAULT '',
  `img_original` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_goods_type`
--

DROP TABLE IF EXISTS `ecs_goods_type`;
CREATE TABLE IF NOT EXISTS `ecs_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL,
  `cat_name` varchar(60) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_group` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_group_goods`
--

DROP TABLE IF EXISTS `ecs_group_goods`;
CREATE TABLE IF NOT EXISTS `ecs_group_goods` (
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_keywords`
--

DROP TABLE IF EXISTS `ecs_keywords`;
CREATE TABLE IF NOT EXISTS `ecs_keywords` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `searchengine` varchar(20) NOT NULL DEFAULT '',
  `keyword` varchar(90) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_link_goods`
--

DROP TABLE IF EXISTS `ecs_link_goods`;
CREATE TABLE IF NOT EXISTS `ecs_link_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `link_goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_double` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_mail_templates`
--

DROP TABLE IF EXISTS `ecs_mail_templates`;
CREATE TABLE IF NOT EXISTS `ecs_mail_templates` (
  `template_id` tinyint(1) unsigned NOT NULL,
  `template_code` varchar(30) NOT NULL DEFAULT '',
  `is_html` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_subject` varchar(200) NOT NULL DEFAULT '',
  `template_content` text NOT NULL,
  `last_modify` int(10) unsigned NOT NULL DEFAULT '0',
  `last_send` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_member_price`
--

DROP TABLE IF EXISTS `ecs_member_price`;
CREATE TABLE IF NOT EXISTS `ecs_member_price` (
  `price_id` mediumint(8) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` tinyint(3) NOT NULL DEFAULT '0',
  `user_price` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_nav`
--

DROP TABLE IF EXISTS `ecs_nav`;
CREATE TABLE IF NOT EXISTS `ecs_nav` (
  `id` mediumint(8) NOT NULL,
  `ctype` varchar(10) DEFAULT NULL,
  `cid` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `ifshow` tinyint(1) NOT NULL,
  `vieworder` tinyint(1) NOT NULL,
  `opennew` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_order_action`
--

DROP TABLE IF EXISTS `ecs_order_action`;
CREATE TABLE IF NOT EXISTS `ecs_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action_user` varchar(30) NOT NULL DEFAULT '',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_place` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_note` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_order_goods`
--

DROP TABLE IF EXISTS `ecs_order_goods`;
CREATE TABLE IF NOT EXISTS `ecs_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对接erp专用，商品优惠金额',
  `goods_attr` text NOT NULL,
  `send_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_order_info`
--

DROP TABLE IF EXISTS `ecs_order_info`;
CREATE TABLE IF NOT EXISTS `ecs_order_info` (
  `order_id` mediumint(8) unsigned NOT NULL,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `district` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `postscript` varchar(255) NOT NULL DEFAULT '',
  `shipping_id` tinyint(3) NOT NULL DEFAULT '0',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `pay_id` tinyint(3) NOT NULL DEFAULT '0',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `how_oos` varchar(120) NOT NULL DEFAULT '',
  `how_surplus` varchar(120) NOT NULL DEFAULT '',
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_message` varchar(255) NOT NULL DEFAULT '',
  `inv_payee` varchar(120) NOT NULL DEFAULT '',
  `inv_content` varchar(120) NOT NULL DEFAULT '',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `insure_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pack_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `card_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_discount_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对接erp专用，商品优惠总金额',
  `money_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `surplus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pack_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `card_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(255) NOT NULL DEFAULT '',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `extension_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_buyer` varchar(255) NOT NULL DEFAULT '',
  `pay_note` varchar(255) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `inv_type` varchar(60) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `is_separate` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `discount` decimal(10,2) NOT NULL,
  `callback_status` enum('true','false') DEFAULT 'true',
  `lastmodify` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_order_review`
--

DROP TABLE IF EXISTS `ecs_order_review`;
CREATE TABLE IF NOT EXISTS `ecs_order_review` (
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_pack`
--

DROP TABLE IF EXISTS `ecs_pack`;
CREATE TABLE IF NOT EXISTS `ecs_pack` (
  `pack_id` tinyint(3) unsigned NOT NULL,
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `pack_img` varchar(255) NOT NULL DEFAULT '',
  `pack_fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `free_money` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pack_desc` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_package_goods`
--

DROP TABLE IF EXISTS `ecs_package_goods`;
CREATE TABLE IF NOT EXISTS `ecs_package_goods` (
  `package_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_payment`
--

DROP TABLE IF EXISTS `ecs_payment`;
CREATE TABLE IF NOT EXISTS `ecs_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL,
  `pay_code` varchar(20) NOT NULL DEFAULT '',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `pay_fee` varchar(10) NOT NULL DEFAULT '0',
  `pay_desc` text NOT NULL,
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pay_config` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_pay_log`
--

DROP TABLE IF EXISTS `ecs_pay_log`;
CREATE TABLE IF NOT EXISTS `ecs_pay_log` (
  `log_id` int(10) unsigned NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_amount` decimal(10,2) unsigned NOT NULL,
  `order_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_plugins`
--

DROP TABLE IF EXISTS `ecs_plugins`;
CREATE TABLE IF NOT EXISTS `ecs_plugins` (
  `code` varchar(30) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '',
  `library` varchar(255) NOT NULL DEFAULT '',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `install_date` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_products`
--

DROP TABLE IF EXISTS `ecs_products`;
CREATE TABLE IF NOT EXISTS `ecs_products` (
  `product_id` mediumint(8) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_attr` varchar(50) DEFAULT NULL,
  `product_sn` varchar(60) DEFAULT NULL,
  `product_number` mediumint(8) unsigned DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_push`
--

DROP TABLE IF EXISTS `ecs_push`;
CREATE TABLE IF NOT EXISTS `ecs_push` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `photo` varchar(200) DEFAULT NULL COMMENT '图片',
  `objectId` varchar(200) DEFAULT NULL COMMENT 'leancloud返回的objectId',
  `link` varchar(200) DEFAULT NULL COMMENT '链接',
  `platform` tinyint(4) NOT NULL DEFAULT '3' COMMENT '平台类型',
  `push_type` tinyint(4) DEFAULT '0' COMMENT '任务类型 1 定时任务 0 即时推送',
  `message_type` tinyint(4) DEFAULT '1' COMMENT '消息类型 1　系统消息 ２ 物流消息',
  `isPush` tinyint(4) DEFAULT '0' COMMENT '定时任务是否已经推送',
  `push_at` timestamp NULL DEFAULT NULL COMMENT '定时推送时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0:关闭 1:开启 默认开启',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_region`
--

DROP TABLE IF EXISTS `ecs_region`;
CREATE TABLE IF NOT EXISTS `ecs_region` (
  `region_id` smallint(5) unsigned NOT NULL,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_reg_extend_info`
--

DROP TABLE IF EXISTS `ecs_reg_extend_info`;
CREATE TABLE IF NOT EXISTS `ecs_reg_extend_info` (
  `Id` int(10) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `reg_field_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_reg_fields`
--

DROP TABLE IF EXISTS `ecs_reg_fields`;
CREATE TABLE IF NOT EXISTS `ecs_reg_fields` (
  `id` tinyint(3) unsigned NOT NULL,
  `reg_field_name` varchar(60) NOT NULL,
  `dis_order` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_need` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_role`
--

DROP TABLE IF EXISTS `ecs_role`;
CREATE TABLE IF NOT EXISTS `ecs_role` (
  `role_id` smallint(5) unsigned NOT NULL,
  `role_name` varchar(60) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `role_describe` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_searchengine`
--

DROP TABLE IF EXISTS `ecs_searchengine`;
CREATE TABLE IF NOT EXISTS `ecs_searchengine` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `searchengine` varchar(20) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_search_history`
--

DROP TABLE IF EXISTS `ecs_search_history`;
CREATE TABLE IF NOT EXISTS `ecs_search_history` (
  `id` int(10) unsigned NOT NULL,
  `keyword` char(50) NOT NULL,
  `count` int(11) NOT NULL,
  `type` enum('goods','store') NOT NULL,
  `store_id` int(11) NOT NULL,
  `updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_sessions`
--

DROP TABLE IF EXISTS `ecs_sessions`;
CREATE TABLE IF NOT EXISTS `ecs_sessions` (
  `sesskey` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adminid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL,
  `user_rank` tinyint(3) NOT NULL,
  `discount` decimal(3,2) NOT NULL,
  `email` varchar(60) NOT NULL,
  `data` char(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_sessions_data`
--

DROP TABLE IF EXISTS `ecs_sessions_data`;
CREATE TABLE IF NOT EXISTS `ecs_sessions_data` (
  `sesskey` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_shipping`
--

DROP TABLE IF EXISTS `ecs_shipping`;
CREATE TABLE IF NOT EXISTS `ecs_shipping` (
  `shipping_id` tinyint(3) unsigned NOT NULL,
  `shipping_code` varchar(20) NOT NULL DEFAULT '',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `shipping_desc` varchar(255) NOT NULL DEFAULT '',
  `insure` varchar(10) NOT NULL DEFAULT '0',
  `support_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_print` text NOT NULL,
  `print_bg` varchar(255) DEFAULT NULL,
  `config_lable` text,
  `print_model` tinyint(1) DEFAULT '0',
  `shipping_order` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_shipping_area`
--

DROP TABLE IF EXISTS `ecs_shipping_area`;
CREATE TABLE IF NOT EXISTS `ecs_shipping_area` (
  `shipping_area_id` smallint(5) unsigned NOT NULL,
  `shipping_area_name` varchar(150) NOT NULL DEFAULT '',
  `shipping_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `configure` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_shop_config`
--

DROP TABLE IF EXISTS `ecs_shop_config`;
CREATE TABLE IF NOT EXISTS `ecs_shop_config` (
  `id` smallint(5) unsigned NOT NULL,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `code` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT '',
  `store_range` varchar(255) NOT NULL DEFAULT '',
  `store_dir` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_snatch_log`
--

DROP TABLE IF EXISTS `ecs_snatch_log`;
CREATE TABLE IF NOT EXISTS `ecs_snatch_log` (
  `log_id` mediumint(8) unsigned NOT NULL,
  `snatch_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bid_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bid_time` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_sns`
--

DROP TABLE IF EXISTS `ecs_sns`;
CREATE TABLE IF NOT EXISTS `ecs_sns` (
  `user_id` int(11) NOT NULL,
  `open_id` varchar(255) NOT NULL,
  `vendor` tinyint(4) NOT NULL COMMENT '第三方平台类型',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_stats`
--

DROP TABLE IF EXISTS `ecs_stats`;
CREATE TABLE IF NOT EXISTS `ecs_stats` (
  `access_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `visit_times` smallint(5) unsigned NOT NULL DEFAULT '1',
  `browser` varchar(60) NOT NULL DEFAULT '',
  `system` varchar(20) NOT NULL DEFAULT '',
  `language` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(30) NOT NULL DEFAULT '',
  `referer_domain` varchar(100) NOT NULL DEFAULT '',
  `referer_path` varchar(200) NOT NULL DEFAULT '',
  `access_url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_suppliers`
--

DROP TABLE IF EXISTS `ecs_suppliers`;
CREATE TABLE IF NOT EXISTS `ecs_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL,
  `suppliers_name` varchar(255) DEFAULT NULL,
  `suppliers_desc` mediumtext,
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_tag`
--

DROP TABLE IF EXISTS `ecs_tag`;
CREATE TABLE IF NOT EXISTS `ecs_tag` (
  `tag_id` mediumint(8) NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tag_words` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_template`
--

DROP TABLE IF EXISTS `ecs_template`;
CREATE TABLE IF NOT EXISTS `ecs_template` (
  `filename` varchar(30) NOT NULL DEFAULT '',
  `region` varchar(40) NOT NULL DEFAULT '',
  `library` varchar(40) NOT NULL DEFAULT '',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `number` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(60) NOT NULL DEFAULT '',
  `remarks` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_topic`
--

DROP TABLE IF EXISTS `ecs_topic`;
CREATE TABLE IF NOT EXISTS `ecs_topic` (
  `topic_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '''''',
  `intro` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '''''',
  `css` text NOT NULL,
  `topic_img` varchar(255) DEFAULT NULL,
  `title_pic` varchar(255) DEFAULT NULL,
  `base_style` char(6) DEFAULT NULL,
  `htmls` mediumtext,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_users`
--

DROP TABLE IF EXISTS `ecs_users`;
CREATE TABLE IF NOT EXISTS `ecs_users` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(255) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `frozen_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_points` int(10) unsigned NOT NULL DEFAULT '0',
  `address_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `last_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `visit_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_special` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ec_salt` varchar(10) DEFAULT NULL,
  `salt` varchar(10) NOT NULL DEFAULT '0',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(60) NOT NULL,
  `msn` varchar(60) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `office_phone` varchar(20) NOT NULL,
  `home_phone` varchar(20) NOT NULL,
  `mobile_phone` varchar(20) NOT NULL,
  `is_validated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `credit_line` decimal(10,2) unsigned NOT NULL,
  `passwd_question` varchar(50) DEFAULT NULL,
  `passwd_answer` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_user_account`
--

DROP TABLE IF EXISTS `ecs_user_account`;
CREATE TABLE IF NOT EXISTS `ecs_user_account` (
  `id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_user` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `paid_time` int(10) NOT NULL DEFAULT '0',
  `admin_note` varchar(255) NOT NULL,
  `user_note` varchar(255) NOT NULL,
  `process_type` tinyint(1) NOT NULL DEFAULT '0',
  `payment` varchar(90) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_user_address`
--

DROP TABLE IF EXISTS `ecs_user_address`;
CREATE TABLE IF NOT EXISTS `ecs_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL,
  `address_name` varchar(50) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) NOT NULL DEFAULT '0',
  `province` smallint(5) NOT NULL DEFAULT '0',
  `city` smallint(5) NOT NULL DEFAULT '0',
  `district` smallint(5) NOT NULL DEFAULT '0',
  `address` varchar(120) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_user_bonus`
--

DROP TABLE IF EXISTS `ecs_user_bonus`;
CREATE TABLE IF NOT EXISTS `ecs_user_bonus` (
  `bonus_id` mediumint(8) unsigned NOT NULL,
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_sn` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `used_time` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `emailed` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_user_feed`
--

DROP TABLE IF EXISTS `ecs_user_feed`;
CREATE TABLE IF NOT EXISTS `ecs_user_feed` (
  `feed_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `value_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `feed_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_feed` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_user_rank`
--

DROP TABLE IF EXISTS `ecs_user_rank`;
CREATE TABLE IF NOT EXISTS `ecs_user_rank` (
  `rank_id` tinyint(3) unsigned NOT NULL,
  `rank_name` varchar(30) NOT NULL DEFAULT '',
  `min_points` int(10) unsigned NOT NULL DEFAULT '0',
  `max_points` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `show_price` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `special_rank` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_user_reg_status`
--

DROP TABLE IF EXISTS `ecs_user_reg_status`;
CREATE TABLE IF NOT EXISTS `ecs_user_reg_status` (
  `user_id` int(11) NOT NULL,
  `is_completed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_version`
--

DROP TABLE IF EXISTS `ecs_version`;
CREATE TABLE IF NOT EXISTS `ecs_version` (
  `id` int(10) unsigned NOT NULL,
  `platform` tinyint(4) NOT NULL DEFAULT '3',
  `version` char(50) DEFAULT NULL,
  `url` char(200) DEFAULT NULL,
  `content` char(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_virtual_card`
--

DROP TABLE IF EXISTS `ecs_virtual_card`;
CREATE TABLE IF NOT EXISTS `ecs_virtual_card` (
  `card_id` mediumint(8) NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `card_sn` varchar(60) NOT NULL DEFAULT '',
  `card_password` varchar(60) NOT NULL DEFAULT '',
  `add_date` int(11) NOT NULL DEFAULT '0',
  `end_date` int(11) NOT NULL DEFAULT '0',
  `is_saled` tinyint(1) NOT NULL DEFAULT '0',
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `crc32` varchar(12) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_volume_price`
--

DROP TABLE IF EXISTS `ecs_volume_price`;
CREATE TABLE IF NOT EXISTS `ecs_volume_price` (
  `price_type` tinyint(1) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `volume_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `volume_price` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_vote`
--

DROP TABLE IF EXISTS `ecs_vote`;
CREATE TABLE IF NOT EXISTS `ecs_vote` (
  `vote_id` smallint(5) unsigned NOT NULL,
  `vote_name` varchar(250) NOT NULL DEFAULT '',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `can_multi` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_vote_log`
--

DROP TABLE IF EXISTS `ecs_vote_log`;
CREATE TABLE IF NOT EXISTS `ecs_vote_log` (
  `log_id` mediumint(8) unsigned NOT NULL,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `vote_time` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_vote_option`
--

DROP TABLE IF EXISTS `ecs_vote_option`;
CREATE TABLE IF NOT EXISTS `ecs_vote_option` (
  `option_id` smallint(5) unsigned NOT NULL,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `option_name` varchar(250) NOT NULL DEFAULT '',
  `option_count` int(8) unsigned NOT NULL DEFAULT '0',
  `option_order` tinyint(3) unsigned NOT NULL DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ecs_wholesale`
--

DROP TABLE IF EXISTS `ecs_wholesale`;
CREATE TABLE IF NOT EXISTS `ecs_wholesale` (
  `act_id` mediumint(8) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `rank_ids` varchar(255) NOT NULL,
  `prices` text NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ecs_account_log`
--
ALTER TABLE `ecs_account_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ecs_ad`
--
ALTER TABLE `ecs_ad`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `ecs_admin_action`
--
ALTER TABLE `ecs_admin_action`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ecs_admin_log`
--
ALTER TABLE `ecs_admin_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_time` (`log_time`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ecs_admin_message`
--
ALTER TABLE `ecs_admin_message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`,`receiver_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `ecs_admin_user`
--
ALTER TABLE `ecs_admin_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `ecs_adsense`
--
ALTER TABLE `ecs_adsense`
  ADD KEY `from_ad` (`from_ad`);

--
-- Indexes for table `ecs_ad_custom`
--
ALTER TABLE `ecs_ad_custom`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `ecs_ad_position`
--
ALTER TABLE `ecs_ad_position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `ecs_affiliate_log`
--
ALTER TABLE `ecs_affiliate_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `ecs_agency`
--
ALTER TABLE `ecs_agency`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `agency_name` (`agency_name`);

--
-- Indexes for table `ecs_area_region`
--
ALTER TABLE `ecs_area_region`
  ADD PRIMARY KEY (`shipping_area_id`,`region_id`);

--
-- Indexes for table `ecs_article`
--
ALTER TABLE `ecs_article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `ecs_article_cat`
--
ALTER TABLE `ecs_article_cat`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `cat_type` (`cat_type`),
  ADD KEY `sort_order` (`sort_order`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ecs_attribute`
--
ALTER TABLE `ecs_attribute`
  ADD PRIMARY KEY (`attr_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `ecs_auction_log`
--
ALTER TABLE `ecs_auction_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `act_id` (`act_id`);

--
-- Indexes for table `ecs_auto_manage`
--
ALTER TABLE `ecs_auto_manage`
  ADD PRIMARY KEY (`item_id`,`type`);

--
-- Indexes for table `ecs_back_goods`
--
ALTER TABLE `ecs_back_goods`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `back_id` (`back_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `ecs_back_order`
--
ALTER TABLE `ecs_back_order`
  ADD PRIMARY KEY (`back_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `ecs_bonus_type`
--
ALTER TABLE `ecs_bonus_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `ecs_booking_goods`
--
ALTER TABLE `ecs_booking_goods`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ecs_brand`
--
ALTER TABLE `ecs_brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `is_show` (`is_show`);

--
-- Indexes for table `ecs_card`
--
ALTER TABLE `ecs_card`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `ecs_cart`
--
ALTER TABLE `ecs_cart`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `ecs_category`
--
ALTER TABLE `ecs_category`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ecs_cat_recommend`
--
ALTER TABLE `ecs_cat_recommend`
  ADD PRIMARY KEY (`cat_id`,`recommend_type`);

--
-- Indexes for table `ecs_cert`
--
ALTER TABLE `ecs_cert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cert_config_id_index` (`config_id`);

--
-- Indexes for table `ecs_collect_goods`
--
ALTER TABLE `ecs_collect_goods`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `is_attention` (`is_attention`);

--
-- Indexes for table `ecs_comment`
--
ALTER TABLE `ecs_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `id_value` (`id_value`);

--
-- Indexes for table `ecs_config`
--
ALTER TABLE `ecs_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecs_crons`
--
ALTER TABLE `ecs_crons`
  ADD PRIMARY KEY (`cron_id`),
  ADD KEY `nextime` (`nextime`),
  ADD KEY `enable` (`enable`),
  ADD KEY `cron_code` (`cron_code`);

--
-- Indexes for table `ecs_delivery_goods`
--
ALTER TABLE `ecs_delivery_goods`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `delivery_id` (`delivery_id`,`goods_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `ecs_delivery_order`
--
ALTER TABLE `ecs_delivery_order`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `ecs_device`
--
ALTER TABLE `ecs_device`
  ADD UNIQUE KEY `device_user_id_unique` (`user_id`),
  ADD KEY `device_device_id_index` (`device_id`),
  ADD KEY `device_device_type_index` (`device_type`),
  ADD KEY `device_platform_type_index` (`platform_type`),
  ADD KEY `device_status_index` (`status`);

--
-- Indexes for table `ecs_email_list`
--
ALTER TABLE `ecs_email_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecs_email_sendlist`
--
ALTER TABLE `ecs_email_sendlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecs_error_log`
--
ALTER TABLE `ecs_error_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `ecs_exchange_goods`
--
ALTER TABLE `ecs_exchange_goods`
  ADD PRIMARY KEY (`goods_id`);

--
-- Indexes for table `ecs_favourable_activity`
--
ALTER TABLE `ecs_favourable_activity`
  ADD PRIMARY KEY (`act_id`),
  ADD KEY `act_name` (`act_name`);

--
-- Indexes for table `ecs_feedback`
--
ALTER TABLE `ecs_feedback`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ecs_friend_link`
--
ALTER TABLE `ecs_friend_link`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `show_order` (`show_order`);

--
-- Indexes for table `ecs_goods`
--
ALTER TABLE `ecs_goods`
  ADD PRIMARY KEY (`goods_id`),
  ADD KEY `goods_sn` (`goods_sn`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `last_update` (`last_update`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `goods_weight` (`goods_weight`),
  ADD KEY `promote_end_date` (`promote_end_date`),
  ADD KEY `promote_start_date` (`promote_start_date`),
  ADD KEY `goods_number` (`goods_number`),
  ADD KEY `sort_order` (`sort_order`);

--
-- Indexes for table `ecs_goods_activity`
--
ALTER TABLE `ecs_goods_activity`
  ADD PRIMARY KEY (`act_id`),
  ADD KEY `act_name` (`act_name`,`act_type`,`goods_id`);

--
-- Indexes for table `ecs_goods_article`
--
ALTER TABLE `ecs_goods_article`
  ADD PRIMARY KEY (`goods_id`,`article_id`,`admin_id`);

--
-- Indexes for table `ecs_goods_attr`
--
ALTER TABLE `ecs_goods_attr`
  ADD PRIMARY KEY (`goods_attr_id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `attr_id` (`attr_id`);

--
-- Indexes for table `ecs_goods_cat`
--
ALTER TABLE `ecs_goods_cat`
  ADD PRIMARY KEY (`goods_id`,`cat_id`);

--
-- Indexes for table `ecs_goods_gallery`
--
ALTER TABLE `ecs_goods_gallery`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `ecs_goods_type`
--
ALTER TABLE `ecs_goods_type`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `ecs_group_goods`
--
ALTER TABLE `ecs_group_goods`
  ADD PRIMARY KEY (`parent_id`,`goods_id`,`admin_id`);

--
-- Indexes for table `ecs_keywords`
--
ALTER TABLE `ecs_keywords`
  ADD PRIMARY KEY (`date`,`searchengine`,`keyword`);

--
-- Indexes for table `ecs_link_goods`
--
ALTER TABLE `ecs_link_goods`
  ADD PRIMARY KEY (`goods_id`,`link_goods_id`,`admin_id`);

--
-- Indexes for table `ecs_mail_templates`
--
ALTER TABLE `ecs_mail_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `template_code` (`template_code`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ecs_member_price`
--
ALTER TABLE `ecs_member_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `goods_id` (`goods_id`,`user_rank`);

--
-- Indexes for table `ecs_nav`
--
ALTER TABLE `ecs_nav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `ifshow` (`ifshow`);

--
-- Indexes for table `ecs_order_action`
--
ALTER TABLE `ecs_order_action`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `ecs_order_goods`
--
ALTER TABLE `ecs_order_goods`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `ecs_order_info`
--
ALTER TABLE `ecs_order_info`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_sn` (`order_sn`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_status` (`order_status`),
  ADD KEY `shipping_status` (`shipping_status`),
  ADD KEY `pay_status` (`pay_status`),
  ADD KEY `shipping_id` (`shipping_id`),
  ADD KEY `pay_id` (`pay_id`),
  ADD KEY `extension_code` (`extension_code`,`extension_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `ecs_order_review`
--
ALTER TABLE `ecs_order_review`
  ADD UNIQUE KEY `order_review_user_id_order_id_goods_id_unique` (`user_id`,`order_id`,`goods_id`);

--
-- Indexes for table `ecs_pack`
--
ALTER TABLE `ecs_pack`
  ADD PRIMARY KEY (`pack_id`);

--
-- Indexes for table `ecs_package_goods`
--
ALTER TABLE `ecs_package_goods`
  ADD PRIMARY KEY (`package_id`,`goods_id`,`admin_id`,`product_id`);

--
-- Indexes for table `ecs_payment`
--
ALTER TABLE `ecs_payment`
  ADD PRIMARY KEY (`pay_id`),
  ADD UNIQUE KEY `pay_code` (`pay_code`);

--
-- Indexes for table `ecs_pay_log`
--
ALTER TABLE `ecs_pay_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `ecs_plugins`
--
ALTER TABLE `ecs_plugins`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `ecs_products`
--
ALTER TABLE `ecs_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `ecs_push`
--
ALTER TABLE `ecs_push`
  ADD PRIMARY KEY (`id`),
  ADD KEY `push_user_id_index` (`user_id`),
  ADD KEY `push_title_index` (`title`),
  ADD KEY `push_content_index` (`content`),
  ADD KEY `push_photo_index` (`photo`),
  ADD KEY `push_objectid_index` (`objectId`),
  ADD KEY `push_link_index` (`link`),
  ADD KEY `push_status_index` (`status`);

--
-- Indexes for table `ecs_region`
--
ALTER TABLE `ecs_region`
  ADD PRIMARY KEY (`region_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `region_type` (`region_type`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `ecs_reg_extend_info`
--
ALTER TABLE `ecs_reg_extend_info`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `ecs_reg_fields`
--
ALTER TABLE `ecs_reg_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecs_role`
--
ALTER TABLE `ecs_role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `user_name` (`role_name`);

--
-- Indexes for table `ecs_searchengine`
--
ALTER TABLE `ecs_searchengine`
  ADD PRIMARY KEY (`date`,`searchengine`);

--
-- Indexes for table `ecs_search_history`
--
ALTER TABLE `ecs_search_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecs_sessions`
--
ALTER TABLE `ecs_sessions`
  ADD PRIMARY KEY (`sesskey`),
  ADD KEY `expiry` (`expiry`);

--
-- Indexes for table `ecs_sessions_data`
--
ALTER TABLE `ecs_sessions_data`
  ADD PRIMARY KEY (`sesskey`),
  ADD KEY `expiry` (`expiry`);

--
-- Indexes for table `ecs_shipping`
--
ALTER TABLE `ecs_shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `shipping_code` (`shipping_code`,`enabled`);

--
-- Indexes for table `ecs_shipping_area`
--
ALTER TABLE `ecs_shipping_area`
  ADD PRIMARY KEY (`shipping_area_id`),
  ADD KEY `shipping_id` (`shipping_id`);

--
-- Indexes for table `ecs_shop_config`
--
ALTER TABLE `ecs_shop_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ecs_snatch_log`
--
ALTER TABLE `ecs_snatch_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `snatch_id` (`snatch_id`);

--
-- Indexes for table `ecs_sns`
--
ALTER TABLE `ecs_sns`
  ADD UNIQUE KEY `sns_user_id_unique` (`user_id`),
  ADD KEY `sns_open_id_index` (`open_id`),
  ADD KEY `sns_vendor_index` (`vendor`);

--
-- Indexes for table `ecs_stats`
--
ALTER TABLE `ecs_stats`
  ADD KEY `access_time` (`access_time`);

--
-- Indexes for table `ecs_suppliers`
--
ALTER TABLE `ecs_suppliers`
  ADD PRIMARY KEY (`suppliers_id`);

--
-- Indexes for table `ecs_tag`
--
ALTER TABLE `ecs_tag`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Indexes for table `ecs_template`
--
ALTER TABLE `ecs_template`
  ADD KEY `filename` (`filename`,`region`),
  ADD KEY `theme` (`theme`),
  ADD KEY `remarks` (`remarks`);

--
-- Indexes for table `ecs_topic`
--
ALTER TABLE `ecs_topic`
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `ecs_users`
--
ALTER TABLE `ecs_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `email` (`email`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `ecs_user_account`
--
ALTER TABLE `ecs_user_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_paid` (`is_paid`);

--
-- Indexes for table `ecs_user_address`
--
ALTER TABLE `ecs_user_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ecs_user_bonus`
--
ALTER TABLE `ecs_user_bonus`
  ADD PRIMARY KEY (`bonus_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ecs_user_feed`
--
ALTER TABLE `ecs_user_feed`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `ecs_user_rank`
--
ALTER TABLE `ecs_user_rank`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `ecs_version`
--
ALTER TABLE `ecs_version`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecs_virtual_card`
--
ALTER TABLE `ecs_virtual_card`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `car_sn` (`card_sn`),
  ADD KEY `is_saled` (`is_saled`);

--
-- Indexes for table `ecs_volume_price`
--
ALTER TABLE `ecs_volume_price`
  ADD PRIMARY KEY (`price_type`,`goods_id`,`volume_number`);

--
-- Indexes for table `ecs_vote`
--
ALTER TABLE `ecs_vote`
  ADD PRIMARY KEY (`vote_id`);

--
-- Indexes for table `ecs_vote_log`
--
ALTER TABLE `ecs_vote_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `vote_id` (`vote_id`);

--
-- Indexes for table `ecs_vote_option`
--
ALTER TABLE `ecs_vote_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `vote_id` (`vote_id`);

--
-- Indexes for table `ecs_wholesale`
--
ALTER TABLE `ecs_wholesale`
  ADD PRIMARY KEY (`act_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ecs_account_log`
--
ALTER TABLE `ecs_account_log`
  MODIFY `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_ad`
--
ALTER TABLE `ecs_ad`
  MODIFY `ad_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_admin_action`
--
ALTER TABLE `ecs_admin_action`
  MODIFY `action_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_admin_log`
--
ALTER TABLE `ecs_admin_log`
  MODIFY `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_admin_message`
--
ALTER TABLE `ecs_admin_message`
  MODIFY `message_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_admin_user`
--
ALTER TABLE `ecs_admin_user`
  MODIFY `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_ad_custom`
--
ALTER TABLE `ecs_ad_custom`
  MODIFY `ad_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_ad_position`
--
ALTER TABLE `ecs_ad_position`
  MODIFY `position_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_affiliate_log`
--
ALTER TABLE `ecs_affiliate_log`
  MODIFY `log_id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_agency`
--
ALTER TABLE `ecs_agency`
  MODIFY `agency_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_article`
--
ALTER TABLE `ecs_article`
  MODIFY `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_article_cat`
--
ALTER TABLE `ecs_article_cat`
  MODIFY `cat_id` smallint(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_attribute`
--
ALTER TABLE `ecs_attribute`
  MODIFY `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_auction_log`
--
ALTER TABLE `ecs_auction_log`
  MODIFY `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_back_goods`
--
ALTER TABLE `ecs_back_goods`
  MODIFY `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_back_order`
--
ALTER TABLE `ecs_back_order`
  MODIFY `back_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_bonus_type`
--
ALTER TABLE `ecs_bonus_type`
  MODIFY `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_booking_goods`
--
ALTER TABLE `ecs_booking_goods`
  MODIFY `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_brand`
--
ALTER TABLE `ecs_brand`
  MODIFY `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_card`
--
ALTER TABLE `ecs_card`
  MODIFY `card_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_cart`
--
ALTER TABLE `ecs_cart`
  MODIFY `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_category`
--
ALTER TABLE `ecs_category`
  MODIFY `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_cert`
--
ALTER TABLE `ecs_cert`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_collect_goods`
--
ALTER TABLE `ecs_collect_goods`
  MODIFY `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_comment`
--
ALTER TABLE `ecs_comment`
  MODIFY `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_config`
--
ALTER TABLE `ecs_config`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_crons`
--
ALTER TABLE `ecs_crons`
  MODIFY `cron_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_delivery_goods`
--
ALTER TABLE `ecs_delivery_goods`
  MODIFY `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_delivery_order`
--
ALTER TABLE `ecs_delivery_order`
  MODIFY `delivery_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_email_list`
--
ALTER TABLE `ecs_email_list`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_email_sendlist`
--
ALTER TABLE `ecs_email_sendlist`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_error_log`
--
ALTER TABLE `ecs_error_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_favourable_activity`
--
ALTER TABLE `ecs_favourable_activity`
  MODIFY `act_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_feedback`
--
ALTER TABLE `ecs_feedback`
  MODIFY `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_friend_link`
--
ALTER TABLE `ecs_friend_link`
  MODIFY `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_goods`
--
ALTER TABLE `ecs_goods`
  MODIFY `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_goods_activity`
--
ALTER TABLE `ecs_goods_activity`
  MODIFY `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_goods_attr`
--
ALTER TABLE `ecs_goods_attr`
  MODIFY `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_goods_gallery`
--
ALTER TABLE `ecs_goods_gallery`
  MODIFY `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_goods_type`
--
ALTER TABLE `ecs_goods_type`
  MODIFY `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_mail_templates`
--
ALTER TABLE `ecs_mail_templates`
  MODIFY `template_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_member_price`
--
ALTER TABLE `ecs_member_price`
  MODIFY `price_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_nav`
--
ALTER TABLE `ecs_nav`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_order_action`
--
ALTER TABLE `ecs_order_action`
  MODIFY `action_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_order_goods`
--
ALTER TABLE `ecs_order_goods`
  MODIFY `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_order_info`
--
ALTER TABLE `ecs_order_info`
  MODIFY `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_pack`
--
ALTER TABLE `ecs_pack`
  MODIFY `pack_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_payment`
--
ALTER TABLE `ecs_payment`
  MODIFY `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_pay_log`
--
ALTER TABLE `ecs_pay_log`
  MODIFY `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_products`
--
ALTER TABLE `ecs_products`
  MODIFY `product_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_push`
--
ALTER TABLE `ecs_push`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_region`
--
ALTER TABLE `ecs_region`
  MODIFY `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_reg_extend_info`
--
ALTER TABLE `ecs_reg_extend_info`
  MODIFY `Id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_reg_fields`
--
ALTER TABLE `ecs_reg_fields`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `ecs_role`
--
ALTER TABLE `ecs_role`
  MODIFY `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_search_history`
--
ALTER TABLE `ecs_search_history`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_shipping`
--
ALTER TABLE `ecs_shipping`
  MODIFY `shipping_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_shipping_area`
--
ALTER TABLE `ecs_shipping_area`
  MODIFY `shipping_area_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_shop_config`
--
ALTER TABLE `ecs_shop_config`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_snatch_log`
--
ALTER TABLE `ecs_snatch_log`
  MODIFY `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_suppliers`
--
ALTER TABLE `ecs_suppliers`
  MODIFY `suppliers_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_tag`
--
ALTER TABLE `ecs_tag`
  MODIFY `tag_id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_topic`
--
ALTER TABLE `ecs_topic`
  MODIFY `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_users`
--
ALTER TABLE `ecs_users`
  MODIFY `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_user_account`
--
ALTER TABLE `ecs_user_account`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_user_address`
--
ALTER TABLE `ecs_user_address`
  MODIFY `address_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_user_bonus`
--
ALTER TABLE `ecs_user_bonus`
  MODIFY `bonus_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_user_feed`
--
ALTER TABLE `ecs_user_feed`
  MODIFY `feed_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_user_rank`
--
ALTER TABLE `ecs_user_rank`
  MODIFY `rank_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_version`
--
ALTER TABLE `ecs_version`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_virtual_card`
--
ALTER TABLE `ecs_virtual_card`
  MODIFY `card_id` mediumint(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_vote`
--
ALTER TABLE `ecs_vote`
  MODIFY `vote_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_vote_log`
--
ALTER TABLE `ecs_vote_log`
  MODIFY `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_vote_option`
--
ALTER TABLE `ecs_vote_option`
  MODIFY `option_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ecs_wholesale`
--
ALTER TABLE `ecs_wholesale`
  MODIFY `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
