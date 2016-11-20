-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 �?11 �?10 �?17:46
-- 服务器版本: 5.5.47
-- PHP 版本: 5.5.30

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `realchao`
--

-- --------------------------------------------------------

--
-- 表的结构 `mcc_address`
--

CREATE TABLE IF NOT EXISTS `mcc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `fullname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `shipping_telephone` varchar(32) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_affiliate`
--

CREATE TABLE IF NOT EXISTS `mcc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `alipay_account_name` varchar(64) NOT NULL,
  `alipay` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `mcc_affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `mcc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `mcc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_api`
--

CREATE TABLE IF NOT EXISTS `mcc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mcc_api`
--

INSERT INTO `mcc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'X1gfk0cn2t6QApsdEpk6o1oZk1aCXKUbgkYguYJ5lEySgAEtBl58L4e7oySaUVg7t7Rti35aT4i8sCKvnla66Y6n3nQHLNXBvXkdX3Dear5V1xtFT9Pb0hCFlH5NuH26bvl4NUJ86U7BuT4g3dAccFAqljrujnIxXRpr72HFSFkVXpbrhHoQzJEpLMiWQeKc1ZvZVpfIhHCjaNPYV75gd54t6MufQcL8hmM6z0TPPI37CyJB92rSa9KvL7buo5jF', 1, '2016-09-26 19:46:31', '2016-09-26 19:46:31');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_api_ip`
--

CREATE TABLE IF NOT EXISTS `mcc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_api_session`
--

CREATE TABLE IF NOT EXISTS `mcc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_attribute`
--

CREATE TABLE IF NOT EXISTS `mcc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `mcc_attribute`
--

INSERT INTO `mcc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `mcc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_attribute_description`
--

INSERT INTO `mcc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, '描述'),
(2, 1, '核数'),
(4, 1, '测试 1'),
(5, 1, '测试 2'),
(6, 1, '测试 3'),
(7, 1, '测试 4'),
(8, 1, '测试 5'),
(9, 1, '测试 6'),
(10, 1, '测试 7'),
(11, 1, '测试 8'),
(3, 1, '时钟');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `mcc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `mcc_attribute_group`
--

INSERT INTO `mcc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `mcc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_attribute_group_description`
--

INSERT INTO `mcc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, '内存'),
(4, 1, '技术参数'),
(6, 1, '处理器'),
(5, 1, '主板');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_banner`
--

CREATE TABLE IF NOT EXISTS `mcc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `mcc_banner`
--

INSERT INTO `mcc_banner` (`banner_id`, `name`, `status`) VALUES
(6, '侧边广告图片', 0),
(7, '首页幻灯片', 1),
(8, '品牌展示', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_banner_image`
--

CREATE TABLE IF NOT EXISTS `mcc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=272 ;

--
-- 转存表中的数据 `mcc_banner_image`
--

INSERT INTO `mcc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(271, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/brand_1.png', 0),
(260, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/banners/banner_left.jpg', 0),
(270, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/brand_2.png', 0),
(255, 7, 1, '客厅 2', 'index.php?route=product/product&amp;path=34_43&amp;product_id=34', 'catalog/demo/slider/slide2.jpg', 2),
(269, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/brand_4.png', 0),
(268, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/brand_1.png', 0),
(267, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/brand_2.png', 0),
(266, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/brand_3.png', 0),
(254, 7, 1, '客厅 1', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/slider/slide1.jpg', 1),
(265, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/brand_1.png', 0),
(264, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/brand_4.png', 0),
(263, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/brand_4.png', 0),
(262, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/brand_2.png', 0),
(261, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/brand_1.png', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog`
--

CREATE TABLE IF NOT EXISTS `mcc_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_category_id` int(11) NOT NULL,
  `created` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `video_code` text NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `mcc_blog`
--

INSERT INTO `mcc_blog` (`blog_id`, `blog_category_id`, `created`, `status`, `user_id`, `hits`, `image`, `video_code`, `featured`, `keyword`, `sort_order`, `date_added`, `date_modified`) VALUES
(1, 0, '2016-01-15', 1, 2, 32, 'catalog/demo/blog/blog-1.jpg', '0', 0, '', 1, '2016-01-13 21:25:09', '2016-03-13 14:59:00'),
(2, 0, '2016-01-13', 1, 2, 68, 'catalog/demo/blog/blog-2.jpg', '', 0, '', 2, '2016-01-14 09:36:37', '2016-08-22 12:07:16'),
(3, 0, '2016-01-17', 1, 2, 16, 'catalog/demo/blog/blog-3.jpg', '', 0, '', 1, '2016-01-19 14:00:48', '2016-03-13 16:29:40'),
(4, 0, '2016-01-18', 1, 2, 14, 'catalog/demo/blog/blog-4.jpg', '', 0, '', 1, '2016-01-19 14:01:28', '2016-08-10 15:43:19'),
(5, 0, '2016-01-14', 1, 2, 5, 'catalog/demo/blog/blog-5.jpg', '', 0, '', 1, '2016-01-19 14:02:13', '2016-03-13 16:29:59'),
(6, 0, '2016-03-13', 1, 2, 4, 'catalog/demo/blog/blog-6.jpg', '', 0, '', 1, '2016-03-13 15:31:33', '2016-03-13 16:29:10'),
(7, 0, '2016-03-13', 1, 2, 3, 'catalog/demo/blog/blog-7.jpg', '', 0, '', 1, '2016-03-13 15:34:49', '2016-03-13 16:28:08'),
(8, 0, '2016-03-13', 1, 2, 4, 'catalog/demo/blog/blog-8.jpg', '', 0, '', 1, '2016-03-13 15:42:11', '2016-03-13 16:28:23'),
(9, 0, '2016-03-13', 1, 2, 4, 'catalog/demo/blog/blog-9.jpg', '', 0, '', 1, '2016-03-13 15:45:35', '2016-03-13 16:30:13'),
(10, 0, '2016-03-13', 1, 2, 10, 'catalog/demo/blog/blog-10.jpg', '', 0, '', 1, '2016-03-13 15:47:42', '2016-03-13 16:27:53'),
(11, 0, '2016-03-13', 1, 2, 4, 'catalog/demo/blog/blog-11.jpg', '', 0, '', 1, '2016-03-13 15:50:51', '2016-03-13 16:28:55'),
(12, 0, '2016-03-13', 1, 2, 8, 'catalog/demo/blog/blog-12.jpg', '', 0, '', 1, '2016-03-13 15:56:30', '2016-03-13 16:27:38'),
(13, 0, '2016-03-13', 1, 2, 7, 'catalog/demo/blog/blog-13.jpg', '', 0, '', 1, '2016-03-13 16:02:28', '2016-03-13 16:29:23'),
(14, 0, '2016-03-13', 1, 2, 9, 'catalog/demo/blog/blog-14.jpg', '', 0, '', 1, '2016-03-13 16:06:05', '2016-03-13 16:28:42'),
(15, 0, '2016-03-13', 1, 2, 15, 'catalog/demo/blog/blog-15.jpg', '', 0, '', 1, '2016-03-13 16:08:21', '2016-08-22 12:17:15');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_category`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_category` (
  `blog_category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_group` smallint(6) NOT NULL DEFAULT '2',
  `width` varchar(255) DEFAULT NULL,
  `submenu_width` varchar(255) DEFAULT NULL,
  `colum_width` varchar(255) DEFAULT NULL,
  `submenu_colum_width` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `colums` varchar(255) DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `is_content` smallint(6) NOT NULL DEFAULT '2',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `level_depth` smallint(6) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '1',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `show_sub` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `privacy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_type` varchar(25) DEFAULT 'top',
  `menu_class` varchar(25) DEFAULT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`blog_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `mcc_blog_category`
--

INSERT INTO `mcc_blog_category` (`blog_category_id`, `image`, `parent_id`, `is_group`, `width`, `submenu_width`, `colum_width`, `submenu_colum_width`, `item`, `colums`, `type`, `is_content`, `show_title`, `level_depth`, `published`, `store_id`, `position`, `show_sub`, `url`, `target`, `privacy`, `position_type`, `menu_class`, `left`, `right`, `keyword`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 0, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, 0, 0, '', 0, 1, '2016-01-13 21:18:53', '2016-01-13 21:18:53'),
(2, '', 0, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, 0, 0, '', 2, 1, '2016-01-21 11:30:13', '2016-03-11 11:13:20'),
(3, '', 2, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, 0, 0, '', 0, 1, '2016-01-21 11:30:53', '2016-01-21 11:30:53'),
(4, '', 3, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, 0, 0, '', 0, 1, '2016-01-21 11:31:35', '2016-01-21 11:31:35'),
(5, '', 1, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, 0, 0, '', 0, 1, '2016-01-21 11:32:22', '2016-01-21 11:32:22'),
(6, '', 0, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, 0, 0, '', 0, 1, '2016-01-21 11:33:00', '2016-01-21 11:33:00');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_category_description`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_category_description` (
  `blog_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  PRIMARY KEY (`blog_category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_category_description`
--

INSERT INTO `mcc_blog_category_description` (`blog_category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(1, 1, '博客分类一', '&lt;p&gt;博客分类一&lt;br&gt;&lt;/p&gt;', '博客分类一', '博客分类一', '博客分类一'),
(2, 1, '博客分类二', '&lt;p&gt;博客分类二&lt;br&gt;&lt;/p&gt;', '博客分类二', '博客分类二', '博客分类二'),
(3, 1, '水果', '&lt;p&gt;水果&lt;br&gt;&lt;/p&gt;', '水果', '水果', '水果'),
(4, 1, '苹果', '&lt;p&gt;苹果&lt;br&gt;&lt;/p&gt;', '苹果', '苹果', '苹果'),
(5, 1, '鲜花', '&lt;p&gt;鲜花&lt;br&gt;&lt;/p&gt;', '鲜花', '鲜花', '鲜花'),
(6, 1, '博客分类三', '&lt;p&gt;博客分类三&lt;br&gt;&lt;/p&gt;', '博客分类三', '博客分类三', '博客分类三');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_category_path`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_category_path` (
  `blog_category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`blog_category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_category_path`
--

INSERT INTO `mcc_blog_category_path` (`blog_category_id`, `path_id`, `level`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 2, 0),
(3, 3, 1),
(4, 2, 0),
(4, 3, 1),
(4, 4, 2),
(5, 1, 0),
(5, 5, 1),
(6, 6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_category_to_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_category_to_layout`
--

INSERT INTO `mcc_blog_category_to_layout` (`blog_category_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_category_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_category_to_store` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_category_to_store`
--

INSERT INTO `mcc_blog_category_to_store` (`blog_category_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_comment`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_comment` (
  `blog_comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`blog_comment_id`),
  KEY `FK_blog_comment` (`blog_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `mcc_blog_comment`
--

INSERT INTO `mcc_blog_comment` (`blog_comment_id`, `blog_id`, `customer_id`, `author`, `text`, `status`, `email`, `date_added`, `date_modified`) VALUES
(4, 2, 0, 'yyy', 'hhhh', 1, '', '2016-01-27 09:02:37', '0000-00-00 00:00:00'),
(3, 2, 0, 'eeee', 'dddd', 1, '', '2016-01-27 09:00:23', '0000-00-00 00:00:00'),
(5, 2, 0, 'fff', 'ggg', 1, '', '2016-01-27 19:06:02', '0000-00-00 00:00:00'),
(6, 2, 0, 'aaa', 'bbb', 1, '', '2016-01-27 19:10:22', '0000-00-00 00:00:00'),
(7, 2, 0, 'sss', 'ddd', 1, '', '2016-01-27 19:10:37', '0000-00-00 00:00:00'),
(8, 2, 0, 'eee', 'rrr', 1, '', '2016-01-27 19:11:05', '0000-00-00 00:00:00'),
(9, 2, 0, 'iii', 'kkk', 1, '', '2016-01-27 19:11:22', '0000-00-00 00:00:00'),
(10, 2, 0, 'vvv', 'bbb', 1, '', '2016-01-27 19:11:37', '0000-00-00 00:00:00'),
(11, 2, 0, 'ggg', 'hhh', 1, '', '2016-01-27 19:11:50', '0000-00-00 00:00:00'),
(12, 2, 0, 'uuu', 'kkk', 1, '', '2016-01-27 19:11:57', '0000-00-00 00:00:00'),
(13, 2, 0, 'ooo', 'ppp', 1, '', '2016-01-27 19:12:10', '0000-00-00 00:00:00'),
(14, 2, 0, 'dfg', 'jhff', 1, '', '2016-01-27 19:12:17', '0000-00-00 00:00:00'),
(15, 2, 0, 'tytyt', 'fsdfsdfs', 1, '', '2016-01-27 19:12:22', '0000-00-00 00:00:00'),
(16, 2, 0, 'frfr', 'ffff', 1, '', '2016-01-27 19:15:46', '0000-00-00 00:00:00'),
(17, 1, 0, '測試ing', '測試評論內容', 1, '', '2016-02-09 20:17:23', '0000-00-00 00:00:00'),
(18, 1, 0, 'testone', 'tesing now', 1, '', '2016-02-09 20:17:53', '0000-00-00 00:00:00'),
(19, 2, 0, 'tesdfdfd', 'dsfsdfsfsd', 1, '', '2016-02-13 14:17:50', '0000-00-00 00:00:00'),
(20, 1, 0, 'testtwo', 'testing ok ', 1, '', '2016-02-13 14:51:27', '0000-00-00 00:00:00'),
(21, 1, 0, 'testing yang', 'testing now', 1, '', '2016-03-13 16:32:38', '0000-00-00 00:00:00'),
(22, 1, 2, '测试一', 'Testing by Yang', 0, '', '2016-08-10 19:19:30', '0000-00-00 00:00:00'),
(23, 1, 2, '测试一', 'Testing by Yang', 0, '', '2016-08-10 19:19:46', '0000-00-00 00:00:00'),
(24, 1, 2, '测试一', 'Testing by Yang 2016', 0, '', '2016-08-10 19:25:17', '0000-00-00 00:00:00'),
(25, 1, 2, '测试一', 'Testing by Yang 2016', 0, '', '2016-08-10 19:27:11', '0000-00-00 00:00:00'),
(26, 1, 2, '测试一', 'Testing by Yang 2016', 0, '', '2016-08-10 19:35:37', '0000-00-00 00:00:00'),
(27, 1, 2, '测试一', 'Testing by Yang 2016', 1, '', '2016-08-10 19:37:15', '2016-08-10 19:38:47'),
(28, 1, 2, '测试一', 'ceshiing', 1, '', '2016-08-10 19:39:38', '0000-00-00 00:00:00'),
(29, 4, 2, '测试一', '测试登陆才可以评论', 1, '', '2016-08-10 19:40:43', '0000-00-00 00:00:00'),
(30, 15, 1, '杨兆锋', '测试中评论', 1, '', '2016-08-22 14:45:07', '0000-00-00 00:00:00'),
(31, 15, 1, 'testone', '再次测试', 1, '', '2016-08-22 14:46:49', '2016-08-22 14:47:03'),
(32, 10, 6, '11111', 'mmmmm', 1, '', '2016-08-26 23:21:50', '0000-00-00 00:00:00'),
(33, 15, 1, '杨兆锋', '测试邮件发送内容', 1, '', '2016-09-02 14:58:31', '0000-00-00 00:00:00'),
(34, 15, 1, '杨兆锋', '再次测试邮件发送标题', 1, '', '2016-09-02 15:02:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_description`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `tag` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_description`
--

INSERT INTO `mcc_blog_description` (`blog_id`, `language_id`, `title`, `brief`, `description`, `meta_title`, `meta_keyword`, `meta_description`, `tag`) VALUES
(1, 1, '神在每一时刻、与每一个人说话', '我跟每个人说话，一向就是如此。问题不是在我跟谁说，而是谁在听？就拿基督为例，为什么有一些人，仿佛比别的人更能听到神的讯息？那因为有些人愿意真正倾听。他们愿意听，纵使当讯息看起来似乎是可怕，或疯狂，或根本就错误时，他们仍愿对这样的通讯保持开放的心态。 除非你不再告诉我你的真理，否则我无法告诉你我的真理。所有的人都是特别的，而所有的片刻也都珍贵如黄金。并没有哪一个人或哪一个时刻比其他的更特别。', '&lt;p&gt;我跟每个人说话，一向就是如此。问题不是在我跟谁说，而是谁在听？就拿基督为例，为什么有一些人，仿佛比别的人更能听到神的讯息？那因为有些人愿意真正倾听。他们愿意听，纵使当讯息看起来似乎是可怕，或疯狂，或根本就错误时，他们仍愿对这样的通讯保持开放的心态。 除非你不再告诉我你的真理，否则我无法告诉你我的真理。所有的人都是特别的，而所有的片刻也都珍贵如黄金。并没有哪一个人或哪一个时刻比其他的更特别。&lt;br&gt;&lt;br&gt;让我们以沟通这个字来取代说话这个字。沟通是个好得多、充实得多、正确得多的字眼。我邀请你来参加与神的一种新型的沟通。一个双向沟通。事实上，是你邀请了我。我最常用的沟通方式是透过感受（又译为“感觉”）。感受是灵魂的语言。我也以思维来沟通。我最强而有力的讯息是体验，但这个你们也忽略了。你们尤其是忽略了这个。而最后，如果感受、思维及体验全都失效时，我才用语言。它们最容易招致错误的诠释，最容易被误解。然而，最大的讽刺是，你们全都将神的话语视为如此重要，反而轻视体验。倾听你的感受。倾听你最高的思维。倾听你的体验。一旦有任何与你的老师们告诉你的，或与你在书里读到的话不同时，就忘掉那些话。话语是最不可靠的真理供应商。&lt;/p&gt;', 'MyCnCart - 神在每一时刻、与每一个人说话', 'MyCnCart - 神在每一时刻、与每一个人说话', 'MyCnCart - 神在每一时刻、与每一个人说话', '1,2,3'),
(2, 1, '你对自己的意愿也即是神对你的意愿，每件事都是神圣的存在', '在神的眼里，每件事都“可以接受”。它们是生命，而生命就是礼物；无法形容的宝藏；神圣中的神圣。每件事背后都有一个神圣的目的――因而在每个东西里都有一个神圣的存在。我即生命，因为我是生命所是。其每个面向都有一个神圣的目的。', '&lt;p&gt;神以神的肖像创造了你们。透过神给你们的力量，你们又创造了其余的。神创造了如你们所知的生命过程和生命本身。但是神也给了你们自由选择权，你们可\r\n以随心所欲的去过生活。以这种说法来看，你对自己的意愿也即是神对你的意愿。你就以你自己的方式过你的人生，我在这件事上并没有什么偏好。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;神\r\n的计划，是让你们去创造任何东西――每样东西――不论你们想要的是什么东西。在这种自由里，存在着神之为神的体验――而就是为了这个体验，我才创造你们，\r\n以及生命本身。（神赋予了人选择的自由、创造的自由，人的自由选择、创造，就是一种上帝的状态。）我什么都不轻视。神在悲伤和欢笑里，在苦与甜里。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;在神的眼里，每件事都“可以接受”。它们是生命，而生命就是礼物；无法形容的宝藏；神圣中的神圣。每件事背后都有一个神圣的目的――因而在每个东西里都有一个神圣的存在。我即生命，因为我是生命所是。其每个面向都有一个神圣的目的。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'MyCnCart - 你对自己的意愿也即是神对你的意愿，每件事都是神圣的存在', 'MyCnCart - 你对自己的意愿也即是神对你的意愿，每件事都是神圣的存在', 'MyCnCart - 你对自己的意愿也即是神对你的意愿，每件事都是神圣的存在', '2,3,4'),
(3, 1, '生命并非一个发现的过程，而是一个创造的过程', '你们会在这儿，为的是忆起，并且重新创造你是谁。', '&lt;p&gt;生命只有一个目的，那就是让你和所有活着的东西体验最完满的荣耀。这个目的的神奇是在于它是永无结束的。一个结束是一个局限，而神的目的没有这样的\r\n界限。一个最深的秘密就是：生命并非一个发现的过程，而是一个创造的过程。你并不是在发现你自己，而是在重新创造你自己。所以，不（仅）要去弄清你是谁，\r\n而（更）要去确定你想成为谁。&lt;/p&gt;&lt;p&gt;你们会在这儿，为的是忆起，并且重新创造你是谁。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'MyCnCart - 生命并非一个发现的过程，而是一个创造的过程', 'MyCnCart - 生命并非一个发现的过程，而是一个创造的过程', 'MyCnCart - 生命并非一个发现的过程，而是一个创造的过程', '3,4,5'),
(4, 1, '神创造了相对性，你藉由你不是的东西来界定你自己是什么', '就最终的逻辑而言，就是除非你面对了你不是的东西，否则你无法经验自己以为你是的东西。这乃是相对论及所有具体生命的目的。你得藉由你不是的东西来界定你自己是什么。', '&lt;p&gt;我是一切东西（All Things）――可见与不可见的。一切万有（All That Is）无法认识他自己――因为一切万有是所有的一切，而没有任何其他的东西。因此，一切万有……是不在的。（于是，为了认识自己，）神创造了相对性――是神给他自己的最大礼物。因此，关系就是神给你们的最大礼物，这主题后面会再详加讨论。我创造你们――我的心灵儿女――的目的，是为了要体认我自己为神。除了经由你们，我没有其他办法做到这一点。所以可以说（并且也已说过许多次）我要你们做到的是：你们该体认到自己为我。这看似如此令人惊异的简单，然而却变得非常复杂――因为你们只有一个方法得以体认你们自己为我――那就是，首先，你们要先体认自己不是我。就最终的逻辑而言，就是除非你面对了你不是的东西，否则你无法经验自己以为你是的东西。这乃是相对论及所有具体生命的目的。你得藉由你不是的东西来界定你自己是什么。&lt;/p&gt;', 'MyCnCart  - 神创造了相对性，你藉由你不是的东西来界定你自己是什么', 'MyCnCart  - 神创造了相对性，你藉由你不是的东西来界定你自己是什么', 'MyCnCart  - 神创造了相对性，你藉由你不是的东西来界定你自己是什么', '4,5,6'),
(5, 1, '痛苦是错误思想的结果，是你自己创造了这经验', '地狱是你的选择、决定和创造所可能产生的最糟结果的经验。', '&lt;p&gt;你无法改变外在事件（因为那是你们许多人创造的，而你的意识还没成长到你能个别地改变集体创造出来的东西），所以你必须改变内在的经验。这是在生活中到达主控权之路。没有一件事其本身是痛苦的。痛苦是错误思想的结果。它是思维里的一个谬误。痛苦来自你对一件事的批判。去掉批判，痛苦便消失了。在神的世界里，没有什么“该”或“不该”。做你想做的事。但不要去批判，也不要去指责，因为你并不知道事情为何发生，也不知是为了什么目的。要祝福一切――因为一切都是神透过活生生的生命所创造的，而那就是最高的创造。&lt;/p&gt;&lt;p&gt;地狱是你的选择、决定和创造所可能产生的最糟结果的经验。它是否定我或对与我有关联的你之为谁说“不”的任何思维之自然后果。它是你因为错误的思想而遭受的痛苦。然而，即使“错误思想”这个词也是个误称，因为根本没有错的事。地狱是喜悦的反面。它是不圆满。它是知道你是谁和是什么，却无法去经验。它是逊于你的本质。那就是地狱，对你的灵魂而言，不可能有的更大痛苦。我告诉你，在死后，根本没有你们在以恐惧为基础的理论里所建构的那种经验。然而，灵魂有一种经验，会是很不快乐、很不完全、很不完整，而且让你远离神的最大喜悦，以致对你的灵魂而言会是地狱一般的。但我告诉你，不是我要送你去那儿，也不是我导致你有这经验。而是每当你以任何方式，将你自己与对你自己之最高想法分开时；每当你排斥你真的是谁或是什么时，是你，你自己，创造了这经验。&lt;/p&gt;&lt;p&gt;你们是你们自己的规则判定者，而你是唯一可评估你做的多好的人。你可以照你希望的去做而不必害怕报应。不过，事先觉知其后果对你却是有用的。后果只是后果。这些和报应或惩罚完全不同。那些在你看来象是惩罚的事――或你称之为邪恶或恶运的事――只不过是自然律在维护它自己而已。&lt;/p&gt;', 'MyCnCart  - 痛苦是错误思想的结果，是你自己创造了这经验', 'MyCnCart  - 痛苦是错误思想的结果，是你自己创造了这经验', 'MyCnCart  - 痛苦是错误思想的结果，是你自己创造了这经验', ''),
(6, 1, '每件事和每件冒险，都是你的灵魂召来你自己身边的', '每件事和每件冒险，都是你的灵魂召来你自己身边的，以使你能创造并经验你真的是谁。世界会是这样的现状，是由于你及你做过――或没有做――的选择。（不做决定也是决定。）', '&lt;p&gt;没有什么是你不能成为的，没有什么是你不能做的。没有什么是你不能拥有的。你可以是、可以做、并可以拥有任何你能想象的东西。相信神就是相信神最伟大的礼物――无条件的爱，及神最大的允诺――无限的潜能。你并不事先选择你将经验的人生。不过，你可以选择用以创造你的经验的任务、地点和事件――条件和情境、挑战和障碍、机会和选择。在你所有选择去做的事里，你的潜能是无限的。所以不要先肯定说，一个投生在你所谓受限的肉体里的灵魂，是无法达到它完全的潜能的，因为你并不知道那个灵魂想做些什么。你并不了解他的生命议程（agenda）。你对他的意图并不清楚。因此，祝福并感谢每个人和每个情况吧！如此，你就是肯定了神的创造之完美――并且表示出你对他的信心。因为在神的世界里是没有意外的，没有一件事是巧合，也没有什么事是“因意外”而发生的。每件事和每件冒险，都是你的灵魂召来你自己身边的，以使你能创造并经验你真的是谁。世界会是这样的现状，是由于你及你做过――或没有做――的选择。（不做决定也是决定。）&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 每件事和每件冒险，都是你的灵魂召来你自己身边的', 'MyCnCart  - 每件事和每件冒险，都是你的灵魂召来你自己身边的', 'MyCnCart  - 每件事和每件冒险，都是你的灵魂召来你自己身边的', ''),
(7, 1, '在宇宙里没有巧合，神在所有的路途上', '你认为是什么将你带到这资料里来的？你怎么会将它拿在你手上的？你认为我不知道我在做什么吗？在宇宙里没有巧合。', '&lt;p&gt;你认为是什么将你带到这资料里来的？你怎么会将它拿在你手上的？你认为我不知道我在做什么吗？在宇宙里没有巧合。我听到了你心的哭喊。我看到了你灵魂的追求。我明白你对真理的渴望有多深。你在痛苦中，也在喜悦中召唤它。你不停不休的恳求我显示我自己，解释我自己，透露我自己。我现在就在这样做，以如此浅白的文字，使你不会误解。以如此简单的语言，让你不会搞混。以如此平凡的语汇，让你不致迷失在冗词中。所以就来吧，问我任何事。任何事！我会设法给你答案。我会用整个宇宙去做这件事。所以注意了！这本书并非我唯一的工具。差得远呢！你可以在问个问题后，就放下这本书。但注意看！注意听！你听到的下一首歌的歌词、你读到的下一篇文章里的资讯、你看的下一部电影的故事情节、你遇见的下一个人无意中说的话，或下一条河、下一片海洋的私语，轻抚你耳朵的下一抹微风――所有这些的设计都是来自我的；所有这些途径都对我开放。如果你肯听我向你说话。如果你邀请我，我会来。那时我会显示给你看，我一直都在那儿。在所有路途上。&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 在宇宙里没有巧合，神在所有的路途上', 'MyCnCart  - 在宇宙里没有巧合，神在所有的路途上', 'MyCnCart  - 在宇宙里没有巧合，神在所有的路途上', ''),
(8, 1, '天堂就是此时此地', '根本没有所谓“上天堂”这一回事。只有你已经在那儿的一种明白。那是一种接受，一种了解，而不是努力追求或奋斗。', '&lt;p&gt;根本没有所谓“上天堂”这一回事。只有你已经在那儿的一种明白。那是一种接受，一种了解，而不是努力追求或奋斗。你无法去你已经在的地方。悟道就是：了解无处可去，无事可做，并且，除了你现在是的那个人之外，你也不必做任何其他人。所以你们所谓的天堂是个乌有之乡（nowhere）。让我们在W与H这两个字之间留一点空间，你就会明白天堂就是此时…此地（now…here）。要知道：没有不正确的途径这种东西――因为在这旅途上，你无法“不到”你去的地方。只不过是速度的问题――只不过是你何时抵达的问题――然而，即使这样也是个幻象，因为并没有“何时”，也没有“之前”或“之后”，只有现在；一个永远的永恒片刻，你在其中经验你自己。人生的重点并非到达任何地方――人生是注意到你已经在那儿，并且一向都在那儿。人生的重点是创造――创造你是谁和是什么，然后去经验它。&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 天堂就是此时此地', 'MyCnCart  - 天堂就是此时此地', 'MyCnCart  - 天堂就是此时此地', ''),
(9, 1, '真正的爱是让人独立', '一旦你上升到神的意识层面，你将了解自己不必为任何别的人负责，而且，虽然希望每个灵魂都过着安适的生活是值得赞扬的，但每个灵魂在每一瞬间都必须选择――都在选择――其本身的命运。', '&lt;p&gt;一旦你上升到神的意识层面，你将了解自己不必为任何别的人负责，而且，虽然希望每个灵魂都过着安适的生活是值得赞扬的，但每个灵魂在每一瞬间都必须选择――都在选择――其本身的命运。让你的爱推你所爱的人进入世界――并且进入完全体验他们是谁的经验里。这样做，你才算是真正爱过人。你的责任是令他们独立。只有当他们醒悟到你是不必要的时候，你才真的是他们的一项赐福。同样的，当你醒悟到你不需要神时，也才是神最快乐的时刻。一位真正的大师并非拥有最多学生的人，而是创造出最多大师的人。而一位真正的神，并非拥有最多佣仆的那一位，却是为最多人服务的，因而使得所有其他人都成为神的那一位。我的喜悦是在你的自由，而非在你的服从。这是神的目标，也是神的荣耀：即，他不再有臣民，并且所有的人都认识到，神并非那不可及的，却是那不可避免的。你快乐的命运是不可避免的。你无法不“得救”。除了不明白此点之外，并没有别的地狱。&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 真正的爱是让人独立', 'MyCnCart  - 真正的爱是让人独立', 'MyCnCart  - 真正的爱是让人独立', ''),
(10, 1, '关系是神圣的，祝福每个关系', '关系是经常具挑战性的；经常召唤你去创造、表现，并且经验你自己之更高又更高的面向，你自己之更宏伟又更宏伟的视野，你自己之越来越崇高的版本。', '&lt;p&gt;关系是经常具挑战性的；经常召唤你去创造、表现，并且经验你自己之更高又更高的面向，你自己之更宏伟又更宏伟的视野，你自己之越来越崇高的版本。唯有透过你与其他人、地及事件的关系，你才能存在于宇宙里！所以，祝福每个关系，将每个都视为特殊，并且都形成了你是谁――并且现在选择做谁。关系的目的是，决定你喜欢看到你自己的哪个部分“显出来”，而非你可以捕获且保留别人的哪个部分。就关系――并且就整个人生――而言，只能有一个目的：去做，并且去决定你真正是谁。由于关系提供了人生最大的机会――的确，其唯一的机会――去创造及制作你对自己之最高观念的经验，所以关系是神圣的。&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 关系是神圣的，祝福每个关系', 'MyCnCart  - 关系是神圣的，祝福每个关系', 'MyCnCart  - 关系是神圣的，祝福每个关系', ''),
(11, 1, '最有爱心的人就是“自我中心”的人', '当你将关系看作是去创造和制作你对他人之最高观念的经验时，关系便会失败。', '&lt;p&gt;当你将关系看作是去创造和制作你对他人之最高观念的经验时，关系便会失败。让在关系里的每个人都只担心他自己――自己在作谁、做什么和有什么；自己在要什么、要求什么、给与什么；自己在寻求、创造和经验什么，那么，所有的关系都会绰绰有余地满足其目的――及它们的参与者！让在关系里的人别去担心别人，却只、只、只担心自己。最有爱心的人就是“自我中心”的人。如果你无法爱你的自己，你便无法爱别人。在关系中失去自我，是在这种结合中造成大多数痛苦的原因。当你再也看不到彼此为神圣旅程上的神圣灵魂时，你就无法看见在所有关系背后之理由和目的。为了进化的目的，灵魂才进入身体。你是谁就是在与所有其他一切的关系中，你创造自己成为什么。在这过程中，最重要的因素就是你的个人关系。你的第一个关系必然是与你自己的关系。你必须先学会尊重、珍惜，并且爱你自己。在你能视别人为有价值的人之前，你首先必须视你自己为有价值的。在你能视别人为有福的之前，你首先必须视你自己为有福的。在你能承认别人的神圣性之前，你首先必须认识你自己为神圣的。老师们全都带来同样的讯息：并非“我比你神圣”，却是“你与我一样神圣”。因此我告诉你：现在并且永远以你自己为中心。你的救赎并不能在别人的行为（action）中找到，只能在你的反应（re-action）中找到。在与别人的互动过程里，第一个问题是：现在我是谁，还有，与那个相关的，我想要作谁？&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 最有爱心的人就是“自我中心”的人', 'MyCnCart  - 最有爱心的人就是“自我中心”的人', 'MyCnCart  - 最有爱心的人就是“自我中心”的人', ''),
(12, 1, '做神的信使，唤醒每一个人', '灵魂的工作是唤醒你自己。神的工作是唤醒每一个人。', '&lt;p&gt;灵魂的工作是唤醒你自己。神的工作是唤醒每一个人。你能以两种方式做到此点――藉由提醒他们他们是谁（但这非常困难，因为他们不会相信你），或藉由记得你是谁（这容易得多，因为你并不需要他们的相信，只需要你自己的）。经常展现此点终究会提醒别人他们是谁，因为他们会在你身上看到他们自己。许多大师曾被派到地球来展示永恒的真理。你便是这样的一个信使。――你们全都是特殊的……宣告自己为一个属神的人需要很大的勇气。你愿意吗？你的心是否渴望说出关于我的真理？你是否愿意忍受你的人类同胞的耻笑？你是否准备好放弃世上的荣耀，为了使灵魂的更大荣耀得以完全的实现？去与他人分享永恒的真理……并非出于获得光荣的需要，却是出于你内心最深的愿望，去终止别人的痛苦和受罪；去带来喜悦和快乐，以及助力和治愈；去重新让别人与你一向体验到的与神的合伙之感连结。我选择了你做我的信使。你和许多其他人。因为现在，在即刻的眼前，世界将需要许多号角来吹出清亮的召唤。世界将需要许多声音，来说出百千万人渴望的真理和治愈的话语。世界将需要许多心结合在一起，来做灵魂的工作，并且准备去做神的工作。&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 做神的信使，唤醒每一个人', 'MyCnCart  - 做神的信使，唤醒每一个人', 'MyCnCart  - 做神的信使，唤醒每一个人', ''),
(13, 1, '灵魂只关注你存在的状态', '人生的讽刺是，一旦世俗的物品和世俗的成功不再为你所关心，它们流向你的路便打开了。记住，你无法拥有你想要的东西，但你可以经验你所拥有的不论什么东西。', '&lt;p&gt;做事是身体的一个机能。存在是灵魂的一个机能。你的灵魂不在乎你做什么维生――而当你的人生过完了时，你也不会在意。你的灵魂只在乎，当你在做不论你做的什么时，你是什么。灵魂追求的是一种存在的状态，而非一种做事的状态。“是”吸引“是”，而产生经验。灵魂寻求神，但它寻求的这个我是非常复杂，非常多重次元、多种感觉、多重面向的。在寻求是我的当儿，灵魂在它前面有个宏大的工作；一个可自其中挑选的庞大的“是”之菜单。然后产生正确而完美的条件，在其中创造对那存在状态的经验。所以，真实的事是，没有一件发生在你身上或经由你发生的事，不是为了你自己的最高善的。现在，在这一刻，你的灵魂又创造了机会让你去是、做，并且拥有认识你真的是谁所需的东西。你的灵魂带你到你现在正在读的字句――正如它以前曾带你到智慧和真理的字句。你现在要做什么？你选择要是什么？你的灵魂怀着兴趣等着、看着，正如它以前做过许多次的。我并不关心你世俗的成功，只有你关心。真正的大师们是那些选择去创造一个人生，而非维持一个生活的人。从某种存在状态会跃出一个如此丰富、如此圆满、如此宏伟，而且如此有益的人生，以致世俗的物品和世俗的成功将不再为你所关心了。人生的讽刺是，一旦世俗的物品和世俗的成功不再为你所关心，它们流向你的路便打开了。记住，你无法拥有你想要的东西，但你可以经验你所拥有的不论什么东西。&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 灵魂只关注你存在的状态', 'MyCnCart  - 灵魂只关注你存在的状态', 'MyCnCart  - 灵魂只关注你存在的状态', ''),
(14, 1, '平衡身、心、灵----三位一体，即神成肉身', '当身、心和灵在和谐与统一中一同创造时，神成肉身。于是，灵魂真的在其自己的经验中认识它自己。于是，天堂真的欢欣鼓舞。', '&lt;p&gt;不要轻视你身体正在做的事。它是重要的。但却非以你所想的方式。身体的行动本意是反映一种存在状态，而非想达到一种存在状态的企图。“你的人生并不是关于你的身体在做什么”这个声明的意思。然而，真实的，你的身体在做什么，却是你的人生是关乎什么的一个反映。你在这星球上并不是要以你的身体生产任何东西。你在这个星球上是要以你的灵魂生产一些东西。你的身体只不过单纯的是你灵魂的工具，你的头脑是令身体做事的力量。所以，你在此所有的是个有力的工具，用来创造灵魂之所欲。&lt;br&gt;&lt;br&gt;发现生命和身体毫无关系，可能创造出另一方面的一个不平衡。虽然一开始实体的行为是――仿佛身体是所有的一切，现在它的行为却象是身体根本不重要。当然，这并不是真的――如果实体很快的忆起来的话。&lt;br&gt;&lt;br&gt;你是个三部分的存在，由身、心和灵构成。你将永远是个三部分的存在，不只当你活在地球上时。在死亡时，身和心并没被丢掉，是身体改变了形式，心智（不可与大脑混淆）也仍与你同行，加入灵和身，成为一个三次元或三面的能量团。事实上，你们全是一个能量，却有三个分别的特征。身与心一起并不需要做任何事去控制灵魂――因为灵魂是全然没有“需要”的（不象身和心都为“需要”所羁绊），因而容许身和心意志照自己的意思而行。服从并非创造，因此永远不能产生救赎。灵魂永远不会凌越身体或心智。我造你们为一个三合一的生灵。你是三个存在合而为一的。按照我的形象造成的。自己的三个面向彼此并非不平等的。每个都有个机能，但没有一个机能比其他的机能更伟大，并且也没有任何一个机能能实际上在另一个之前。灵魂孕育，心智创造，身体体验。所有的都以完全平等的方式彼此相连。灵魂的机能是指明其欲望，并非强加其欲望。头脑的机能是由其选择的余地中选择。身体的机能是表现出那选择。当身、心和灵在和谐与统一中一同创造时，神成肉身。于是，灵魂真的在其自己的经验中认识它自己。于是，天堂真的欢欣鼓舞。&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 平衡身、心、灵----三位一体，即神成肉身', 'MyCnCart  - 平衡身、心、灵----三位一体，即神成肉身', 'MyCnCart  - 平衡身、心、灵----三位一体，即神成肉身', ''),
(15, 1, '你是神的身体', '现在我要解释给你听那终极的神秘：你们和我的精确而真实的关系。你们是我的身体。正如你的身体相对于你的心智和灵魂的关系，你们相对于我的心智和灵魂的关系也是一样的。所以：我所经验的每样事，是我透过你们来经验的。正如你的身心和灵是一体的，我的也是一样。', '&lt;p&gt;现在我要解释给你听那终极的神秘：你们和我的精确而真实的关系。你们是我的身体。正如你的身体相对于你的心智和灵魂的关系，你们相对于我的心智和灵魂的关系也是一样的。所以：我所经验的每样事，是我透过你们来经验的。正如你的身心和灵是一体的，我的也是一样。&lt;br&gt;&lt;/p&gt;', 'MyCnCart  - 你是神的身体', 'MyCnCart  - 你是神的身体', 'MyCnCart  - 你是神的身体', '');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_product`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_product` (
  `blog_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  UNIQUE KEY `blog_id` (`blog_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_product`
--

INSERT INTO `mcc_blog_product` (`blog_id`, `related_id`) VALUES
(1, 28),
(1, 41),
(2, 48),
(3, 41),
(3, 47),
(15, 29),
(15, 30),
(15, 31);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_related`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_related` (
  `blog_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_related`
--

INSERT INTO `mcc_blog_related` (`blog_id`, `related_id`) VALUES
(1, 2),
(1, 3),
(1, 5),
(3, 1),
(3, 3),
(3, 5);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_to_blog_category`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_to_blog_category` (
  `blog_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_id`,`blog_category_id`),
  KEY `blog_category_id` (`blog_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_to_blog_category`
--

INSERT INTO `mcc_blog_to_blog_category` (`blog_id`, `blog_category_id`) VALUES
(1, 1),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 6),
(4, 1),
(4, 4),
(5, 1),
(5, 5),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_to_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_to_layout` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_to_layout`
--

INSERT INTO `mcc_blog_to_layout` (`blog_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0),
(15, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_blog_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_blog_to_store` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blog_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_blog_to_store`
--

INSERT INTO `mcc_blog_to_store` (`blog_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_cart`
--

CREATE TABLE IF NOT EXISTS `mcc_cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `mcc_cart`
--

INSERT INTO `mcc_cart` (`cart_id`, `api_id`, `customer_id`, `session_id`, `product_id`, `recurring_id`, `option`, `quantity`, `date_added`) VALUES
(7, 0, 1, 'vb0hoil8joh5o6kl4och0996g3', 46, 0, '[]', 1, '2016-11-08 22:28:02');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_category`
--

CREATE TABLE IF NOT EXISTS `mcc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90 ;

--
-- 转存表中的数据 `mcc_category`
--

INSERT INTO `mcc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 2, 1, '2009-01-31 01:04:25', '2016-10-02 16:36:09'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2016-10-02 14:33:00'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 4, 1, 1, '2009-01-05 21:49:43', '2016-10-02 15:53:53'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2016-10-02 16:37:10'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2016-10-02 14:32:26'),
(29, '', 32, 0, 0, 1, 1, '2009-02-02 13:11:37', '2016-08-04 12:47:16'),
(30, '', 32, 0, 0, 1, 1, '2009-02-02 13:11:59', '2016-08-04 12:44:42'),
(31, '', 32, 0, 0, 1, 1, '2009-02-03 14:17:24', '2016-08-04 12:43:10'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2016-08-04 12:36:03'),
(35, '', 28, 0, 0, 2, 1, '2010-09-17 10:06:48', '2016-10-02 16:38:30'),
(36, '', 28, 0, 0, 3, 1, '2010-09-17 10:07:13', '2016-10-02 16:39:04'),
(57, '', 28, 0, 0, 1, 1, '2011-04-26 08:53:16', '2016-10-02 16:37:53'),
(61, '', 20, 0, 1, 3, 1, '2016-10-02 14:33:26', '2016-10-02 14:33:26'),
(62, '', 20, 0, 1, 4, 1, '2016-10-02 14:34:10', '2016-10-02 14:34:10'),
(63, '', 20, 0, 1, 5, 1, '2016-10-02 14:34:34', '2016-10-02 14:34:34'),
(64, '', 20, 0, 1, 6, 1, '2016-10-02 14:34:56', '2016-10-02 14:34:56'),
(65, '', 20, 0, 1, 7, 1, '2016-10-02 14:35:21', '2016-10-02 14:35:21'),
(66, '', 20, 0, 1, 8, 1, '2016-10-02 14:35:48', '2016-10-02 14:35:48'),
(67, '', 20, 0, 1, 9, 1, '2016-10-02 14:37:36', '2016-10-02 14:37:36'),
(68, '', 20, 0, 1, 10, 1, '2016-10-02 14:38:02', '2016-10-02 14:38:02'),
(69, '', 20, 0, 1, 11, 1, '2016-10-02 14:38:26', '2016-10-02 14:38:26'),
(70, '', 20, 0, 1, 12, 1, '2016-10-02 14:39:08', '2016-10-02 14:39:08'),
(71, '', 20, 0, 1, 13, 1, '2016-10-02 14:39:35', '2016-10-02 14:39:35'),
(72, '', 20, 0, 1, 14, 1, '2016-10-02 14:39:55', '2016-10-02 14:39:55'),
(73, '', 20, 0, 1, 15, 1, '2016-10-02 14:43:19', '2016-10-02 14:43:19'),
(74, '', 20, 0, 1, 16, 1, '2016-10-02 14:43:52', '2016-10-02 14:43:52'),
(75, '', 20, 0, 1, 17, 1, '2016-10-02 14:44:34', '2016-10-02 14:44:34'),
(76, '', 20, 0, 1, 18, 1, '2016-10-02 14:45:00', '2016-10-02 14:45:00'),
(77, '', 20, 0, 1, 19, 1, '2016-10-02 14:45:39', '2016-10-02 14:45:39'),
(78, '', 20, 0, 1, 20, 1, '2016-10-02 14:46:14', '2016-10-02 14:46:14'),
(79, '', 20, 0, 1, 21, 1, '2016-10-02 14:47:05', '2016-10-02 14:47:05'),
(80, '', 20, 0, 1, 22, 1, '2016-10-02 14:47:39', '2016-10-02 14:47:39'),
(81, '', 20, 0, 1, 23, 1, '2016-10-02 14:48:01', '2016-10-02 14:48:01'),
(82, '', 20, 0, 1, 24, 1, '2016-10-02 15:47:15', '2016-10-02 15:47:15'),
(83, '', 28, 0, 1, 4, 1, '2016-10-02 16:39:37', '2016-10-02 16:39:37'),
(84, '', 28, 0, 1, 5, 1, '2016-10-02 16:40:15', '2016-10-02 16:40:15'),
(85, '', 28, 0, 1, 6, 1, '2016-10-02 16:41:05', '2016-10-02 16:41:05'),
(86, '', 0, 0, 1, 0, 1, '2016-10-26 23:41:10', '2016-10-26 23:41:10'),
(87, '', 0, 0, 1, 0, 1, '2016-10-26 23:41:18', '2016-10-26 23:41:18'),
(88, '', 0, 0, 1, 0, 1, '2016-10-26 23:41:28', '2016-10-26 23:41:28'),
(89, '', 0, 0, 1, 0, 1, '2016-10-26 23:41:52', '2016-10-26 23:41:52');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_category_description`
--

CREATE TABLE IF NOT EXISTS `mcc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_category_description`
--

INSERT INTO `mcc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(20, 1, 'Air Jordan', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'Air Jordan', '', ''),
(61, 1, 'Air Jordan 3', '', 'Air Jordan 3', '', ''),
(28, 1, '篮球', '', '篮球', '', ''),
(32, 1, '臥室', '', '臥室', '', ''),
(31, 1, '书桌', '', '书桌', '', ''),
(30, 1, '梳妆台', '', '梳妆台', '', ''),
(29, 1, '床', '', '床', '', ''),
(26, 1, 'Air Jordan 1', '', 'Air Jordan 1', '', ''),
(25, 1, '耐克', '', '耐克', '', ''),
(35, 1, '詹姆斯', '', '詹姆斯', '', ''),
(36, 1, '杜兰特', '', '杜兰特', '', ''),
(73, 1, 'Air Jordan 15', '', 'Air Jordan 15', '', ''),
(74, 1, 'Air Jordan 16', '', 'Air Jordan 16', '', ''),
(75, 1, 'Air Jordan 17', '', 'Air Jordan 17', '', ''),
(76, 1, 'Air Jordan 18', '', 'Air Jordan 18', '', ''),
(77, 1, 'Air Jordan 19', '', 'Air Jordan 19', '', ''),
(78, 1, 'Air Jordan 20', '', 'Air Jordan 20', '', ''),
(79, 1, 'Air Jordan 21', '', 'Air Jordan 21', '', ''),
(80, 1, 'Air Jordan 22', '', 'Air Jordan 22', '', ''),
(81, 1, 'Air Jordan 23', '', 'Air Jordan 23', '', ''),
(82, 1, '其他', '', '其他', '', ''),
(83, 1, '欧文', '', '欧文', '', ''),
(84, 1, '喷泡', '', '喷泡', '', ''),
(85, 1, '其他', '', '其他', '', ''),
(86, 1, '球鞋', '', '球鞋', '', ''),
(87, 1, '服饰', '', '服饰', '', ''),
(88, 1, '配件', '', '配件', '', ''),
(89, 1, '电子产品', '', '电子产品', '', ''),
(72, 1, 'Air Jordan 14', '', 'Air Jordan 14', '', ''),
(71, 1, 'Air Jordan 13', '', 'Air Jordan 13', '', ''),
(70, 1, 'Air Jordan 12', '', 'Air Jordan 12', '', ''),
(69, 1, 'Air Jordan 11', '', 'Air Jordan 11', '', ''),
(68, 1, 'Air Jordan 10', '', 'Air Jordan 10', '', ''),
(67, 1, 'Air Jordan 9', '', 'Air Jordan 9', '', ''),
(57, 1, '科比', '', '科比', '', ''),
(27, 1, 'Air Jordan 2', '&lt;p&gt;分类描述信息&lt;br&gt;&lt;/p&gt;', 'Air Jordan 2', '', ''),
(66, 1, 'Air Jordan 8', '', 'Air Jordan 8', '', ''),
(65, 1, 'Air Jordan 7', '', 'Air Jordan 7', '', ''),
(64, 1, 'Air Jordan 6', '', 'Air Jordan 6', '', ''),
(63, 1, 'Air Jordan 5', '', 'Air Jordan 5', '', ''),
(62, 1, 'Air Jordan 4', '', 'Air Jordan 4', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_category_filter`
--

CREATE TABLE IF NOT EXISTS `mcc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_category_path`
--

CREATE TABLE IF NOT EXISTS `mcc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_category_path`
--

INSERT INTO `mcc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 28, 1),
(28, 25, 0),
(35, 25, 0),
(35, 35, 2),
(35, 28, 1),
(36, 25, 0),
(36, 36, 2),
(36, 28, 1),
(29, 29, 2),
(29, 32, 1),
(30, 30, 2),
(30, 32, 1),
(31, 31, 2),
(31, 32, 1),
(32, 32, 1),
(32, 25, 0),
(20, 20, 0),
(27, 27, 1),
(27, 20, 0),
(26, 26, 1),
(26, 20, 0),
(57, 25, 0),
(31, 25, 0),
(30, 25, 0),
(29, 25, 0),
(57, 57, 2),
(57, 28, 1),
(61, 61, 1),
(61, 20, 0),
(62, 62, 1),
(62, 20, 0),
(63, 63, 1),
(63, 20, 0),
(64, 64, 1),
(64, 20, 0),
(65, 65, 1),
(65, 20, 0),
(66, 66, 1),
(66, 20, 0),
(67, 67, 1),
(67, 20, 0),
(68, 68, 1),
(68, 20, 0),
(69, 69, 1),
(69, 20, 0),
(70, 70, 1),
(70, 20, 0),
(71, 71, 1),
(71, 20, 0),
(72, 72, 1),
(72, 20, 0),
(73, 73, 1),
(73, 20, 0),
(74, 74, 1),
(74, 20, 0),
(75, 20, 0),
(75, 75, 1),
(76, 20, 0),
(76, 76, 1),
(77, 20, 0),
(77, 77, 1),
(78, 20, 0),
(78, 78, 1),
(79, 20, 0),
(79, 79, 1),
(80, 20, 0),
(80, 80, 1),
(81, 20, 0),
(81, 81, 1),
(82, 20, 0),
(82, 82, 1),
(83, 25, 0),
(83, 28, 1),
(83, 83, 2),
(84, 25, 0),
(84, 28, 1),
(84, 84, 2),
(85, 25, 0),
(85, 28, 1),
(85, 85, 2),
(86, 86, 0),
(87, 87, 0),
(88, 88, 0),
(89, 89, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_category_to_layout`
--

INSERT INTO `mcc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(20, 0, 0),
(27, 0, 0),
(26, 0, 0),
(25, 0, 0),
(28, 0, 0),
(32, 0, 0),
(31, 0, 0),
(30, 0, 0),
(29, 0, 0),
(35, 0, 0),
(36, 0, 0),
(57, 0, 0),
(61, 0, 0),
(62, 0, 0),
(63, 0, 0),
(64, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0),
(87, 0, 0),
(88, 0, 0),
(89, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_category_to_store`
--

INSERT INTO `mcc_category_to_store` (`category_id`, `store_id`) VALUES
(20, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(35, 0),
(36, 0),
(57, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_city`
--

CREATE TABLE IF NOT EXISTS `mcc_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mcc_city`
--

INSERT INTO `mcc_city` (`city_id`, `country_id`, `zone_id`, `name`, `status`) VALUES
(1, 44, 707, '济南市', 1),
(2, 44, 707, '淄博市', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_country`
--

CREATE TABLE IF NOT EXISTS `mcc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- 转存表中的数据 `mcc_country`
--

INSERT INTO `mcc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, '中国', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_coupon`
--

CREATE TABLE IF NOT EXISTS `mcc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `mcc_coupon`
--

INSERT INTO `mcc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '10% 折扣', '2222', 'P', '10.0000', 0, 0, '0.0000', '2015-04-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, '免费配送', '3333', 'P', '0.0000', 0, 1, '100.0000', '2015-01-01', '2015-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '10元折扣券', '1111', 'F', '10.0000', 0, 0, '10.0000', '2015-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `mcc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `mcc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `mcc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_currency`
--

CREATE TABLE IF NOT EXISTS `mcc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `mcc_currency`
--

INSERT INTO `mcc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, '人民币', 'CNY', '￥', '', '2', 1.00000000, 1, '2016-09-01 03:23:33');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer`
--

CREATE TABLE IF NOT EXISTS `mcc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `fullname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `weixin_login_openid` varchar(64) NOT NULL,
  `weixin_login_unionid` varchar(64) NOT NULL,
  `weibo_login_access_token` varchar(128) NOT NULL,
  `weibo_login_uid` varchar(50) NOT NULL,
  `qq_openid` varchar(64) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `mcc_customer`
--

INSERT INTO `mcc_customer` (`customer_id`, `customer_group_id`, `store_id`, `language_id`, `fullname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `code`, `date_added`, `weixin_login_openid`, `weixin_login_unionid`, `weibo_login_access_token`, `weibo_login_uid`, `qq_openid`) VALUES
(1, 1, 0, 1, '357726361@qq.com', '357726361@qq.com', '15675118532', '', '6ab1cffa59565ceb9aaeba0a7f8b23804a963c55', 'ygJRpx6uf', NULL, NULL, 0, 0, '', '127.0.0.1', 1, 1, 1, '', '', '2016-11-08 21:23:44', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_group`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mcc_customer_group`
--

INSERT INTO `mcc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1),
(2, 0, 3),
(3, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_customer_group_description`
--

INSERT INTO `mcc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, '普通', '测试'),
(2, 1, 'VIP', ''),
(3, 1, '批发商', '');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_history`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- 转存表中的数据 `mcc_customer_ip`
--

INSERT INTO `mcc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(4, 2, '119.182.217.116', '2016-08-10 17:42:28'),
(17, 4, '119.182.219.245', '2016-08-25 17:29:54'),
(46, 1, '127.0.0.1', '2016-11-08 21:24:29');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_login`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `mcc_customer_login`
--

INSERT INTO `mcc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'opencart@qq.com', '119.182.219.125', 1, '2016-08-08 13:43:18', '2016-08-08 13:43:18'),
(2, 'opencart@qq.com', '119.182.216.239', 1, '2016-08-22 04:44:35', '2016-08-22 04:44:35'),
(3, '296432269@qq.com', '116.22.232.86', 5, '2016-08-25 17:55:31', '2016-08-25 18:41:38'),
(4, '', '116.22.232.86', 2, '2016-08-25 18:39:00', '2016-08-25 18:42:52'),
(6, '', '222.180.73.28', 1, '2016-08-26 14:41:05', '2016-08-26 14:41:05'),
(7, '', '218.66.96.80', 1, '2016-08-26 16:52:18', '2016-08-26 16:52:18'),
(8, '', '220.171.45.246', 1, '2016-08-27 11:14:18', '2016-08-27 11:14:18'),
(9, 'ma.', '220.171.45.246', 1, '2016-08-27 11:14:23', '2016-08-27 11:14:23'),
(10, '1747503337@qq.com', '220.171.45.246', 1, '2016-08-27 11:14:34', '2016-08-27 11:14:34'),
(12, '', '223.104.1.233', 1, '2016-08-31 14:44:52', '2016-08-31 14:44:52'),
(13, 'demo', '125.34.208.244', 1, '2016-08-31 17:14:59', '2016-08-31 17:14:59'),
(14, '', '111.121.47.136', 1, '2016-08-31 17:50:32', '2016-08-31 17:50:32'),
(16, 'demo', '123.123.239.173', 1, '2016-09-01 10:07:49', '2016-09-01 10:07:49'),
(17, 'yangtest', '119.182.217.156', 1, '2016-09-01 15:39:26', '2016-09-01 15:39:26'),
(19, '843579596@qq.com', '14.213.159.139', 1, '2016-09-02 14:01:08', '2016-09-02 14:01:08');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_online`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_search`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_customer_wishlist`
--

CREATE TABLE IF NOT EXISTS `mcc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_customer_wishlist`
--

INSERT INTO `mcc_customer_wishlist` (`customer_id`, `product_id`, `date_added`) VALUES
(6, 47, '2016-08-26 23:15:11');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_custom_field`
--

CREATE TABLE IF NOT EXISTS `mcc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `mcc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `mcc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `mcc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `mcc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_district`
--

CREATE TABLE IF NOT EXISTS `mcc_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`district_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mcc_district`
--

INSERT INTO `mcc_district` (`district_id`, `country_id`, `zone_id`, `city_id`, `name`, `status`) VALUES
(1, 44, 707, 2, '临淄区', 1),
(2, 44, 707, 2, '高新区', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_download`
--

CREATE TABLE IF NOT EXISTS `mcc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_download_description`
--

CREATE TABLE IF NOT EXISTS `mcc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_event`
--

CREATE TABLE IF NOT EXISTS `mcc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `mcc_event`
--

INSERT INTO `mcc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES
(1, 'voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 0, '0000-00-00 00:00:00'),
(6, 'weixin_login', 'catalog/controller/account/logout/after', 'extension/module/weixin_login/logout', 1, '2016-11-08 20:19:40'),
(7, 'qq_login', 'catalog/controller/account/logout/after', 'extension/module/qq_login/logout', 1, '2016-11-08 20:20:04');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_extension`
--

CREATE TABLE IF NOT EXISTS `mcc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- 转存表中的数据 `mcc_extension`
--

INSERT INTO `mcc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'theme_default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'captcha', 'basic_captcha'),
(35, 'module', 'blog_category'),
(36, 'module', 'blog_search'),
(37, 'module', 'blog_latest'),
(38, 'module', 'blog_comment'),
(39, 'module', 'press_latest'),
(40, 'module', 'press_category'),
(41, 'module', 'faq_category'),
(43, 'shipping', 'free'),
(56, 'module', 'revslideropencart'),
(57, 'module', 'rgen'),
(58, 'module', 'bestseller'),
(59, 'module', 'latest'),
(60, 'module', 'weixin_login'),
(61, 'module', 'information'),
(62, 'module', 'qq_login'),
(63, 'module', 'filter');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq`
--

CREATE TABLE IF NOT EXISTS `mcc_faq` (
  `faq_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`faq_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `mcc_faq`
--

INSERT INTO `mcc_faq` (`faq_id`, `image`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, NULL, 1, 1, '2016-02-19 14:09:56', '2016-03-13 16:40:19'),
(26, NULL, 1, 1, '2016-02-19 14:10:24', '2016-02-19 14:40:46'),
(27, NULL, 1, 1, '2016-02-19 14:10:56', '2016-02-19 14:40:58'),
(28, NULL, 1, 1, '2016-02-25 10:23:07', '0000-00-00 00:00:00'),
(29, NULL, 1, 1, '2016-02-25 10:23:28', '0000-00-00 00:00:00'),
(30, NULL, 1, 1, '2016-02-25 10:23:49', '0000-00-00 00:00:00'),
(31, NULL, 1, 1, '2016-02-25 10:24:07', '0000-00-00 00:00:00'),
(32, NULL, 1, 1, '2016-02-25 10:24:25', '0000-00-00 00:00:00'),
(33, NULL, 1, 1, '2016-02-25 10:24:41', '0000-00-00 00:00:00'),
(34, NULL, 1, 1, '2016-02-25 10:24:57', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_category`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_category` (
  `faq_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`faq_category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `mcc_faq_category`
--

INSERT INTO `mcc_faq_category` (`faq_category_id`, `parent_id`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(13, 0, 1, 1, '2016-02-19 14:01:16', '2016-02-19 14:01:16'),
(14, 0, 2, 1, '2016-02-19 14:01:59', '2016-02-19 14:01:59'),
(15, 13, 1, 1, '2016-02-19 14:02:44', '2016-02-19 14:02:44'),
(16, 13, 2, 1, '2016-02-19 14:03:23', '2016-08-22 15:03:20');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_category_description`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_category_description` (
  `faq_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`faq_category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_faq_category_description`
--

INSERT INTO `mcc_faq_category_description` (`faq_category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(13, 1, '常见问题分类一', '&lt;p&gt;常见问题分类一&lt;br&gt;&lt;/p&gt;', '常见问题分类一', '常见问题分类一', '常见问题分类一'),
(14, 1, '常见问题分类二', '&lt;p&gt;常见问题分类二&lt;br&gt;&lt;/p&gt;', '常见问题分类二', '常见问题分类二', '常见问题分类二'),
(15, 1, '苹果问题', '&lt;p&gt;苹果问题&lt;br&gt;&lt;/p&gt;', '苹果问题', '苹果问题', '苹果问题'),
(16, 1, '桔子问题', '&lt;p&gt;桔子问题&lt;br&gt;&lt;/p&gt;', '桔子问题', '桔子问题', '桔子问题');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_category_path`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_category_path` (
  `faq_category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`faq_category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_faq_category_path`
--

INSERT INTO `mcc_faq_category_path` (`faq_category_id`, `path_id`, `level`) VALUES
(13, 13, 0),
(14, 14, 0),
(15, 13, 0),
(15, 15, 1),
(16, 13, 0),
(16, 16, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_category_to_layout` (
  `faq_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`faq_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_faq_category_to_layout`
--

INSERT INTO `mcc_faq_category_to_layout` (`faq_category_id`, `store_id`, `layout_id`) VALUES
(13, 0, 0),
(14, 0, 0),
(15, 0, 0),
(16, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_category_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_category_to_store` (
  `faq_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`faq_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_faq_category_to_store`
--

INSERT INTO `mcc_faq_category_to_store` (`faq_category_id`, `store_id`) VALUES
(13, 0),
(14, 0),
(15, 0),
(16, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_description`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_description` (
  `faq_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`faq_id`,`language_id`),
  KEY `name` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_faq_description`
--

INSERT INTO `mcc_faq_description` (`faq_id`, `language_id`, `title`, `answer`) VALUES
(26, 1, '问题2', '&lt;p&gt;问题2&lt;br&gt;&lt;/p&gt;'),
(27, 1, '问题3', '&lt;p&gt;问题3&lt;br&gt;&lt;/p&gt;'),
(25, 1, 'MyCnCart系统可以商用吗？', '&lt;p&gt;是的，完全可以！!！&lt;br&gt;&lt;br&gt;mycncart系统遵循GPL3协议，您可以用它来用作商业网站，并且免费使用。&lt;br&gt;&lt;br&gt;你所需要遵循的就是：如果您做了二次开发并且将其销售，则您必须保持所做的二次开发也是开源的，不能做任何加密。&lt;br&gt;&lt;br&gt;mycncart系统本身可以被免费使用，但不能包装起来后被销售。&lt;br&gt;&lt;br&gt;您可以将【技术支持 MyCnCart】移除， 但希望您能够做一捐款， 如此MyCnCart的开发者才能够投入更多的时间精力为大家提供更好的版本服务。&lt;br&gt;&lt;br&gt;请使用支付宝捐款至支付宝账户：tonyspace2010@gmail.com&amp;nbsp; 姓名： 杨兆锋&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(28, 1, '问题4', '&lt;p&gt;问题4&lt;br&gt;&lt;/p&gt;'),
(29, 1, '问题5', '&lt;p&gt;问题5&lt;br&gt;&lt;/p&gt;'),
(30, 1, '问题6', '&lt;p&gt;问题6&lt;br&gt;&lt;/p&gt;'),
(31, 1, '问题7', '&lt;p&gt;问题7&lt;br&gt;&lt;/p&gt;'),
(32, 1, '问题8', '&lt;p&gt;问题8&lt;br&gt;&lt;/p&gt;'),
(33, 1, '问题9', '&lt;p&gt;问题9&lt;br&gt;&lt;/p&gt;'),
(34, 1, '问题10', '&lt;p&gt;问题10&lt;br&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_product`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_product` (
  `faq_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  UNIQUE KEY `faq_id` (`faq_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_faq_product`
--

INSERT INTO `mcc_faq_product` (`faq_id`, `related_id`) VALUES
(25, 28),
(25, 41),
(25, 42),
(25, 47),
(26, 41),
(26, 48),
(27, 28),
(27, 48);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_to_faq_category`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_to_faq_category` (
  `faq_id` int(11) NOT NULL,
  `faq_category_id` int(11) NOT NULL,
  PRIMARY KEY (`faq_id`,`faq_category_id`),
  KEY `faq_category_id` (`faq_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_faq_to_faq_category`
--

INSERT INTO `mcc_faq_to_faq_category` (`faq_id`, `faq_category_id`) VALUES
(25, 13),
(25, 15),
(26, 13),
(26, 16),
(27, 14),
(28, 16),
(29, 16),
(30, 16),
(31, 16),
(32, 16),
(33, 16),
(34, 16);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_to_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_to_layout` (
  `faq_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`faq_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_faq_to_layout`
--

INSERT INTO `mcc_faq_to_layout` (`faq_id`, `store_id`, `layout_id`) VALUES
(25, 0, 0),
(26, 0, 0),
(27, 0, 0),
(28, 0, 0),
(29, 0, 0),
(30, 0, 0),
(31, 0, 0),
(32, 0, 0),
(33, 0, 0),
(34, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_faq_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_faq_to_store` (
  `faq_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`faq_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_faq_to_store`
--

INSERT INTO `mcc_faq_to_store` (`faq_id`, `store_id`) VALUES
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_filter`
--

CREATE TABLE IF NOT EXISTS `mcc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_filter_description`
--

CREATE TABLE IF NOT EXISTS `mcc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_filter_group`
--

CREATE TABLE IF NOT EXISTS `mcc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `mcc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `mcc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `mcc_geo_zone`
--

INSERT INTO `mcc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, '中国普通地区', '中国普通地区', '2015-04-01 22:23:18', '2009-01-06 23:26:25'),
(4, '中国偏远地区配送', '中国偏远地区配送', '2015-04-01 22:11:53', '2009-06-23 01:14:53'),
(5, '中国特别地区', '中国特别地区', '0000-00-00 00:00:00', '2015-04-01 22:24:09');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_information`
--

CREATE TABLE IF NOT EXISTS `mcc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `mcc_information`
--

INSERT INTO `mcc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_information_description`
--

CREATE TABLE IF NOT EXISTS `mcc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_information_description`
--

INSERT INTO `mcc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, '关于我们', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', '关于我们', '', ''),
(3, 1, '隐私政策', '&lt;p&gt;\r\n	隐私政策&lt;/p&gt;\r\n', '隐私政策', '', ''),
(6, 1, '物流配送', '&lt;p&gt;\r\n	物流配送&lt;/p&gt;\r\n', '物流配送', '', ''),
(5, 1, '使用条款', '&lt;p&gt;使用条款&lt;br&gt;&lt;/p&gt;', '使用条款', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_information_to_store`
--

INSERT INTO `mcc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_language`
--

CREATE TABLE IF NOT EXISTS `mcc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mcc_language`
--

INSERT INTO `mcc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, '简体中文', 'zh-cn', 'zh-CN,zh-CN.UTF-8,zh-cn', '', '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `mcc_layout`
--

INSERT INTO `mcc_layout` (`layout_id`, `name`) VALUES
(1, '首页'),
(2, '商品详情'),
(3, '分类布局'),
(4, '默认布局'),
(5, '品牌 / 制造商'),
(6, '会员账户'),
(7, '结帐'),
(8, '联系我们'),
(9, '网站地图'),
(10, '加盟推广'),
(11, '信息文章'),
(12, '商品比较'),
(13, '检索布局'),
(14, '博客列表'),
(15, '博客詳情'),
(16, '新闻列表'),
(17, '新闻详情'),
(18, '常见问题与解答(FAQs)布局');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_layout_module`
--

CREATE TABLE IF NOT EXISTS `mcc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1574 ;

--
-- 转存表中的数据 `mcc_layout_module`
--

INSERT INTO `mcc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(83, 5, 'account', 'column_left', 2),
(75, 10, 'account', 'column_right', 1),
(119, 6, 'account', 'column_right', 3),
(1563, 3, 'category', 'column_left', 1),
(84, 14, 'blog_search', 'column_left', 0),
(85, 14, 'blog_category', 'column_left', 1),
(86, 15, 'blog_search', 'column_left', 0),
(87, 15, 'blog_category', 'column_left', 1),
(88, 16, 'press_category', 'column_left', 0),
(89, 16, 'press_latest', 'column_left', 1),
(90, 17, 'press_category', 'column_left', 0),
(91, 17, 'press_latest', 'column_left', 1),
(93, 18, 'faq_category', 'column_left', 0),
(1573, 1, 'rgen_revslider.set_rgixj.rgrVA', 'pos_ss', 0),
(1570, 2, 'press_category', 'content_bottom', 0),
(1571, 9999, 'rgen_menu.set_rgRiF.rgvP4', 'main_menu', 0),
(1537, 1, 'rgen_customhtml.set_rgai9.rgu2K', 'rg_t_up', 2),
(1562, 2, 'rgen_contentblocks.set_rg7DO.rgtZs', 'column_right', 1),
(1548, 2, 'rgen_prdpgtabs.set_rgNzB.rgMSC', 'pdpg_tabs', 0),
(1546, 2, 'rgen_prdpghtml.set_rgDGm.rgFot', 'pdpg_bimg', 0),
(1547, 2, 'rgen_prdpghtml.set_rgvYr.rgraI', 'pdpg_toption', 0),
(1530, 1, 'rgen_basicslideshow.set_rgYlC.rgfTN', 'pos_ss', 0),
(1538, 1, 'rgen_customhtml.set_rgGx4.rgu9C', 'rg_t_up', 5),
(1545, 9999, 'rgen_gridmanager.set_rgqxX.rgf9A', 'rg_b_up', 0),
(1543, 1, 'rgen_gridmanager.set_rgEsM.rg8pH', 'rg_t_up', 3),
(1544, 1, 'rgen_gridmanager.set_rgmbI.rgpFy', 'rg_t_up', 4),
(1533, 1, 'rgen_productgroups.set_rgUkB.rgj9L', 'rg_t_up', 3),
(1532, 1, 'rgen_productgroups.set_rglnV.rgJkT', 'rg_t_up', 6);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_layout_route`
--

CREATE TABLE IF NOT EXISTS `mcc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- 转存表中的数据 `mcc_layout_route`
--

INSERT INTO `mcc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(86, 6, 0, 'account/%'),
(55, 10, 0, 'affiliate/%'),
(88, 3, 0, 'product/category'),
(87, 1, 0, 'common/home'),
(94, 2, 0, 'product/product'),
(62, 11, 0, 'information/information'),
(57, 7, 0, 'checkout/%'),
(59, 8, 0, 'information/contact'),
(66, 9, 0, 'information/sitemap'),
(67, 4, 0, ''),
(63, 5, 0, 'product/manufacturer'),
(58, 12, 0, 'product/compare'),
(65, 13, 0, 'product/search'),
(68, 14, 0, 'blog/all'),
(69, 14, 0, 'blog/category'),
(70, 15, 0, 'blog/blog'),
(74, 16, 0, 'press/category'),
(73, 16, 0, 'press/all'),
(75, 17, 0, 'press/press'),
(77, 18, 0, 'faq/%');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_length_class`
--

CREATE TABLE IF NOT EXISTS `mcc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mcc_length_class`
--

INSERT INTO `mcc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `mcc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_length_class_description`
--

INSERT INTO `mcc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, '厘米', 'cm'),
(2, 1, '毫米', 'mm'),
(3, 1, '英寸', 'in');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_location`
--

CREATE TABLE IF NOT EXISTS `mcc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `mcc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=214 ;

--
-- 转存表中的数据 `mcc_manufacturer`
--

INSERT INTO `mcc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0),
(11, 'A Bathing Ape', '', 0),
(12, 'A.P.C.', '', 0),
(13, 'Acne Studios', '', 0),
(14, 'Acronym', '', 0),
(15, 'Adidas', '', 0),
(16, 'Aesop', '', 0),
(17, 'Alexander McQueen', '', 0),
(18, 'Alexander Wang', '', 0),
(19, 'Alife', '', 0),
(20, 'Ally Capellino', '', 0),
(21, 'Alpha Industries', '', 0),
(22, 'AMI', '', 0),
(23, 'Ark Air', '', 0),
(24, 'Armor-Lux', '', 0),
(25, 'Asics', '', 0),
(26, 'Aspesi', '', 0),
(173, 'OAMC', '', 0),
(28, 'Bamford Grooming Department', '', 0),
(29, 'Baracuta', '', 0),
(30, 'Barbour', '', 0),
(31, 'Barena', '', 0),
(32, 'Battenwear', '', 0),
(33, 'Baxter of California', '', 0),
(34, 'Beams Plus', '', 0),
(35, 'Bedwin &amp; The Heartbreakers', '', 0),
(36, 'Belstaff', '', 0),
(37, 'Billionaire Boys Club', '', 0),
(38, 'Birkenstock', '', 0),
(39, 'Bleu de Paname', '', 0),
(40, 'Blue Blue Japan', '', 0),
(41, 'Bounty Hunter', '', 0),
(42, 'Braun', '', 0),
(43, 'Briston', '', 0),
(44, 'Buttero', '', 0),
(45, 'C.P. Company', '', 0),
(46, 'C6', '', 0),
(47, 'Calvin Klein', '', 0),
(48, 'Cambridge Satchel Company', '', 0),
(49, 'Canada Goose', '', 0),
(50, 'Carhartt', '', 0),
(51, 'Cav Empt', '', 0),
(52, 'Champion', '', 0),
(53, 'Chamula', '', 0),
(54, 'Anonymous Ism', '', 0),
(55, 'CHUP by Glen Clyde Company', '', 0),
(56, 'Church''s', '', 0),
(57, 'Clarks Originals', '', 0),
(58, 'Clear Weather', '', 0),
(59, 'Coach', '', 0),
(60, 'Comme des Garçons', '', 0),
(61, 'Common Projects', '', 0),
(62, 'Converse', '', 0),
(63, 'Cote&amp;Ciel', '', 0),
(64, 'Crep Protect', '', 0),
(65, 'Cutler and Gross', '', 0),
(66, 'Clot', '', 0),
(67, 'D.R. Harris &amp; Co.', '', 0),
(68, 'Daniel Wellington', '', 0),
(69, 'Denim by Vanquish &amp; Fragment', '', 0),
(70, 'Diadora', '', 0),
(71, 'Dick Moby', '', 0),
(72, 'Diemme', '', 0),
(73, 'Dr. Jackson''s Natural Products', '', 0),
(74, 'Dr. Martens', '', 0),
(75, 'Dries Van Noten', '', 0),
(76, 'Dita', '', 0),
(171, 'Lacasote', '', 0),
(78, 'Edwin', '', 0),
(79, 'Elka', '', 0),
(80, 'Engineered Garments', '', 0),
(81, 'Epperson Mountaineering', '', 0),
(82, 'Escentric Molecules', '', 0),
(83, 'ETQ. Amsterdam', '', 0),
(84, 'Eytys', '', 0),
(85, 'FDMTL', '', 0),
(86, 'Filling Pieces', '', 0),
(174, 'Officine Generale', '', 0),
(88, 'Fjällräven', '', 0),
(89, 'FPAR', '', 0),
(90, 'Fracap', '', 0),
(91, 'Flagstuff', '', 0),
(92, 'Fred Perry', '', 0),
(93, 'Freemans Sporting Club', '', 0),
(94, 'Casio', '', 0),
(95, 'Ganryu', '', 0),
(96, 'Ganryu', '', 0),
(97, 'Garrett Leight', '', 0),
(98, 'Gant', '', 0),
(99, 'Gitman Vintage', '', 0),
(100, 'Giuseppe Zanotti', '', 0),
(101, 'Gloverall', '', 0),
(102, 'Golden Bear', '', 0),
(103, 'Golden Goose Deluxe Brand', '', 0),
(104, 'Gosha Rubchinskiy', '', 0),
(105, 'Vetements', '', 0),
(106, 'Grenson', '', 0),
(107, 'Haerfest', '', 0),
(108, 'Harris Wharf London', '', 0),
(109, 'Head Porter', '', 0),
(110, 'Head Porter Plus', '', 0),
(111, 'Helmut Lang', '', 0),
(112, 'Hender Scheme', '', 0),
(113, 'Herschel Supply Co.', '', 0),
(114, 'Hood By Air', '', 0),
(115, 'Human Made', '', 0),
(116, 'Il Bussetto', '', 0),
(117, 'Imperial', '', 0),
(118, 'Incotex', '', 0),
(119, 'Individualized Shirts', '', 0),
(120, 'INSTRMNT', '', 0),
(121, 'Inverallan', '', 0),
(122, 'Jason Markk', '', 0),
(123, 'Jimmy Choo', '', 0),
(124, 'Journal Standard', '', 0),
(125, 'Junya Watanabe MAN', '', 0),
(126, 'Kaptain Sunshine', '', 0),
(127, 'Kenzo', '', 0),
(170, 'Balmain', '', 0),
(130, 'Lanvin', '', 0),
(131, 'Larsson &amp; Jennings', '', 0),
(132, 'LES (ART)ISTS', '', 0),
(133, 'Levi’s', '', 0),
(134, 'Liquiproof', '', 0),
(135, 'London Undercover', '', 0),
(136, 'Mackintosh', '', 0),
(137, 'Maharishi', '', 0),
(138, 'Maison Kitsuné', '', 0),
(139, 'Maison Martin Margiela', '', 0),
(140, 'Malin + Goetz', '', 0),
(141, 'Marcelo Burlon', '', 0),
(142, 'Marni', '', 0),
(143, 'Marvis', '', 0),
(144, 'Master-Piece', '', 0),
(145, 'Mastermind JAPAN', '', 0),
(146, 'Off White', '', 0),
(147, 'Medicom', '', 0),
(148, 'MHL. by Margaret Howell', '', 0),
(149, 'Miansai', '', 0),
(150, 'Mismo', '', 0),
(151, 'Missoni', '', 0),
(152, 'Moncler', '', 0),
(153, 'Moschino', '', 0),
(154, 'Mondaine', '', 0),
(155, 'Monitaly', '', 0),
(156, 'Moscot', '', 0),
(157, 'Mr. Bathing Ape', '', 0),
(158, 'Mr. Black Garment Essentials', '', 0),
(159, 'Mt. Rainier Design', '', 0),
(172, 'ALBAM', '', 0),
(162, 'Murdock London', '', 0),
(175, 'Olaf Hussein', '', 0),
(176, 'Oliver Spencer', '', 0),
(177, 'Onitsuka Tiger', '', 0),
(178, 'Palace', '', 0),
(179, 'Patta', '', 0),
(180, 'Paul Smith', '', 0),
(181, 'Penfield', '', 0),
(182, 'Polo Ralph Lauren', '', 0),
(183, 'Puma', '', 0),
(184, 'Raf Simons', '', 0),
(185, 'Ray Ban', '', 0),
(186, 'Red Wing', '', 0),
(187, 'Reebok', '', 0),
(188, 'retaW', '', 0),
(189, 'Rick Owens', '', 0),
(190, 'RRL by Ralph Lauren', '', 0),
(191, 'Saint Laurent', '', 0),
(192, 'Saucony', '', 0),
(193, 'SOPHNET.', '', 0),
(194, 'Stussy', '', 0),
(195, 'Suicoke', '', 0),
(196, 'Teva', '', 0),
(197, 'The North Face', '', 0),
(198, 'Thom Browne', '', 0),
(199, 'Timberland', '', 0),
(200, 'Timex', '', 0),
(201, 'Tommy Hilfiger', '', 0),
(202, 'Undefeated', '', 0),
(203, 'Undercover', '', 0),
(204, 'Uniform Experiment', '', 0),
(205, 'Valentino', '', 0),
(206, 'Vanquish', '', 0),
(207, 'Vans', '', 0),
(208, 'VISVIM', '', 0),
(209, 'White Mountaineering', '', 0),
(210, 'Wacko Maria', '', 0),
(211, 'WTAPS', '', 0),
(212, 'Y-3', '', 0),
(213, 'Yeezy Season', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_manufacturer_to_store`
--

INSERT INTO `mcc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0),
(136, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(141, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(150, 0),
(151, 0),
(152, 0),
(153, 0),
(154, 0),
(155, 0),
(156, 0),
(157, 0),
(158, 0),
(159, 0),
(162, 0),
(170, 0),
(171, 0),
(172, 0),
(173, 0),
(174, 0),
(175, 0),
(176, 0),
(177, 0),
(178, 0),
(179, 0),
(180, 0),
(181, 0),
(182, 0),
(183, 0),
(184, 0),
(185, 0),
(186, 0),
(187, 0),
(188, 0),
(189, 0),
(190, 0),
(191, 0),
(192, 0),
(193, 0),
(194, 0),
(195, 0),
(196, 0),
(197, 0),
(198, 0),
(199, 0),
(200, 0),
(201, 0),
(202, 0),
(203, 0),
(204, 0),
(205, 0),
(206, 0),
(207, 0),
(208, 0),
(209, 0),
(210, 0),
(211, 0),
(212, 0),
(213, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_marketing`
--

CREATE TABLE IF NOT EXISTS `mcc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_menu`
--

CREATE TABLE IF NOT EXISTS `mcc_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_menu_description`
--

CREATE TABLE IF NOT EXISTS `mcc_menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`menu_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_menu_module`
--

CREATE TABLE IF NOT EXISTS `mcc_menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`menu_module_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_modification`
--

CREATE TABLE IF NOT EXISTS `mcc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_module`
--

CREATE TABLE IF NOT EXISTS `mcc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `mcc_module`
--

INSERT INTO `mcc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{"name":"Category","banner_id":"6","width":"182","height":"182","status":"1"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["43","40","42","30"],"limit":"4","width":"200","height":"200","status":"1"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"580","status":"1"}'),
(31, 'Banner 1', 'banner', '{"name":"Banner 1","banner_id":"6","width":"182","height":"182","status":"1"}'),
(32, '博客列表', 'blog_latest', '{"name":"\\u535a\\u5ba2\\u5217\\u8868","limit":"5","width":"200","height":"200","status":"1"}'),
(33, '博客列表', 'blog_comment', '{"name":"\\u535a\\u5ba2\\u5217\\u8868","limit":"5","width":"200","height":"200","status":"1"}'),
(34, 'Home Page', 'latest', '{"name":"Home Page","limit":"5","width":"200","height":"200","status":"1"}'),
(35, '特色', 'featured', '{"name":"\\u7279\\u8272","product_name":"","product":["33","42"],"limit":"5","width":"200","height":"200","status":"0"}');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_option`
--

CREATE TABLE IF NOT EXISTS `mcc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `mcc_option`
--

INSERT INTO `mcc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'radio', 10),
(12, 'date', 11),
(13, 'radio', 2),
(14, 'radio', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_option_description`
--

CREATE TABLE IF NOT EXISTS `mcc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_option_description`
--

INSERT INTO `mcc_option_description` (`option_id`, `language_id`, `name`) VALUES
(6, 1, '文本区块'),
(7, 1, '文件'),
(8, 1, '日期'),
(9, 1, '时间'),
(10, 1, '日期 &amp; 时间'),
(11, 1, '尺寸'),
(12, 1, '配送日期'),
(4, 1, '文本'),
(2, 1, '复选框'),
(14, 1, '新旧程度'),
(1, 1, '单选按钮组'),
(13, 1, '尺码'),
(5, 1, '下拉列表');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_option_value`
--

CREATE TABLE IF NOT EXISTS `mcc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `mcc_option_value`
--

INSERT INTO `mcc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(40, 5, '', 2),
(39, 5, '', 1),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(48, 11, '', 3),
(47, 11, '', 2),
(46, 11, '', 1),
(49, 13, '', 0),
(50, 13, '', 0),
(51, 13, '', 0),
(52, 14, '', 0),
(53, 14, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `mcc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_option_value_description`
--

INSERT INTO `mcc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(44, 1, 2, '复选框3'),
(45, 1, 2, '复选框4'),
(42, 1, 5, '黄色'),
(41, 1, 5, '绿色'),
(40, 1, 5, '蓝色'),
(39, 1, 5, '红色'),
(48, 1, 11, '大号'),
(47, 1, 11, '中号'),
(24, 1, 2, '复选框2'),
(23, 1, 2, '复选框1'),
(53, 1, 14, '二手'),
(43, 1, 1, '大'),
(52, 1, 14, '全新'),
(32, 1, 1, '小'),
(49, 1, 13, '42'),
(31, 1, 1, '中'),
(50, 1, 13, '43'),
(46, 1, 11, '小号'),
(51, 1, 13, '44');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order`
--

CREATE TABLE IF NOT EXISTS `mcc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `fullname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_fullname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_fullname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `shipping_telephone` varchar(32) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `mcc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order_history`
--

CREATE TABLE IF NOT EXISTS `mcc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order_option`
--

CREATE TABLE IF NOT EXISTS `mcc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order_product`
--

CREATE TABLE IF NOT EXISTS `mcc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `mcc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `mcc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order_status`
--

CREATE TABLE IF NOT EXISTS `mcc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `mcc_order_status`
--

INSERT INTO `mcc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, '处理中'),
(3, 1, '已配送'),
(7, 1, '已取消'),
(5, 1, '完成'),
(8, 1, '已拒绝'),
(9, 1, '撤销取消'),
(10, 1, '失败'),
(11, 1, '已退款'),
(13, 1, '拒付'),
(1, 1, '等待处理'),
(16, 1, '无效'),
(15, 1, '已处理'),
(14, 1, '失效');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order_total`
--

CREATE TABLE IF NOT EXISTS `mcc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `mcc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press`
--

CREATE TABLE IF NOT EXISTS `mcc_press` (
  `press_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`press_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `mcc_press`
--

INSERT INTO `mcc_press` (`press_id`, `image`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 1, 1, '2015-12-29 19:27:12', '2016-02-25 13:55:10'),
(2, '', 2, 1, '2016-02-18 14:02:30', '2016-02-18 14:02:51'),
(3, '', 1, 1, '2016-02-18 14:35:34', '0000-00-00 00:00:00'),
(4, '', 1, 1, '2016-02-25 10:35:26', '2016-08-22 12:06:16'),
(5, '', 1, 1, '2016-02-25 10:40:23', '2016-08-22 12:06:23'),
(6, '', 1, 1, '2016-02-25 10:40:51', '0000-00-00 00:00:00'),
(7, '', 1, 1, '2016-02-25 10:41:20', '0000-00-00 00:00:00'),
(8, '', 1, 1, '2016-02-25 10:41:47', '0000-00-00 00:00:00'),
(9, '', 1, 1, '2016-02-25 10:42:17', '0000-00-00 00:00:00'),
(10, '', 1, 1, '2016-02-25 10:42:48', '2016-11-08 20:12:02');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_category`
--

CREATE TABLE IF NOT EXISTS `mcc_press_category` (
  `press_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`press_category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `mcc_press_category`
--

INSERT INTO `mcc_press_category` (`press_category_id`, `image`, `parent_id`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 0, 0, 1, '2015-12-29 19:20:03', '2016-11-08 20:10:31'),
(2, 'catalog/demo/28_2.jpg', 0, 0, 1, '2015-12-29 19:25:58', '2016-11-08 20:11:26');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_category_description`
--

CREATE TABLE IF NOT EXISTS `mcc_press_category_description` (
  `press_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`press_category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_press_category_description`
--

INSERT INTO `mcc_press_category_description` (`press_category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1, 1, 'Real测评', '&lt;p&gt;Real测评&lt;br&gt;&lt;/p&gt;', 'Real测评', 'Real测评', '新闻分类一'),
(2, 1, 'Real快报', '&lt;p&gt;Real快报&lt;br&gt;&lt;/p&gt;', 'Real快报', 'Real快报', '新闻分类二');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_category_path`
--

CREATE TABLE IF NOT EXISTS `mcc_press_category_path` (
  `press_category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`press_category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_press_category_path`
--

INSERT INTO `mcc_press_category_path` (`press_category_id`, `path_id`, `level`) VALUES
(1, 1, 0),
(2, 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_press_category_to_layout` (
  `press_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`press_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_press_category_to_layout`
--

INSERT INTO `mcc_press_category_to_layout` (`press_category_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_category_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_press_category_to_store` (
  `press_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`press_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_press_category_to_store`
--

INSERT INTO `mcc_press_category_to_store` (`press_category_id`, `store_id`) VALUES
(1, 0),
(2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_description`
--

CREATE TABLE IF NOT EXISTS `mcc_press_description` (
  `press_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`press_id`,`language_id`),
  KEY `name` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_press_description`
--

INSERT INTO `mcc_press_description` (`press_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1, 1, '新闻一', '&lt;p&gt;新闻一&lt;br&gt;&lt;/p&gt;', '新闻一', '新闻一', '新闻一'),
(2, 1, '新闻二', '&lt;p&gt;新闻二&lt;br&gt;&lt;/p&gt;', '新闻二', '新闻二', '新闻二'),
(3, 1, '新闻三', '&lt;p&gt;新闻三&lt;br&gt;&lt;/p&gt;', '新闻三', '新闻三', '新闻三'),
(4, 1, '新闻4', '&lt;p&gt;新闻4&lt;br&gt;&lt;/p&gt;', '新闻4', '新闻4', '新闻4'),
(5, 1, '新闻5', '&lt;p&gt;新闻5&lt;br&gt;&lt;/p&gt;', '新闻5', '新闻5', '新闻5'),
(6, 1, '新闻6', '&lt;p&gt;新闻6&lt;br&gt;&lt;/p&gt;', '新闻6', '新闻6', '新闻6'),
(7, 1, '新闻7', '&lt;p&gt;新闻7&lt;br&gt;&lt;/p&gt;', '新闻7', '新闻7', '新闻7'),
(8, 1, '新闻8', '&lt;p&gt;新闻8&lt;br&gt;&lt;/p&gt;', '新闻8', '新闻8', '新闻8'),
(9, 1, '新闻9', '&lt;p&gt;新闻9&lt;br&gt;&lt;/p&gt;', '新闻9', '新闻9', '新闻9'),
(10, 1, '新闻10', '&lt;p&gt;新闻10&lt;br&gt;&lt;/p&gt;', '新闻10', '新闻10', '新闻10');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_product`
--

CREATE TABLE IF NOT EXISTS `mcc_press_product` (
  `press_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  UNIQUE KEY `press_id` (`press_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_press_product`
--

INSERT INTO `mcc_press_product` (`press_id`, `related_id`) VALUES
(1, 28),
(1, 41),
(1, 42),
(1, 47),
(1, 48),
(2, 41),
(2, 47),
(10, 42);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_to_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_press_to_layout` (
  `press_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`press_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_press_to_layout`
--

INSERT INTO `mcc_press_to_layout` (`press_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_to_press_category`
--

CREATE TABLE IF NOT EXISTS `mcc_press_to_press_category` (
  `press_id` int(11) NOT NULL,
  `press_category_id` int(11) NOT NULL,
  PRIMARY KEY (`press_id`,`press_category_id`),
  KEY `press_category_id` (`press_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_press_to_press_category`
--

INSERT INTO `mcc_press_to_press_category` (`press_id`, `press_category_id`) VALUES
(1, 2),
(2, 2),
(3, 1),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_press_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_press_to_store` (
  `press_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`press_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_press_to_store`
--

INSERT INTO `mcc_press_to_store` (`press_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product`
--

CREATE TABLE IF NOT EXISTS `mcc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `mcc_product`
--

INSERT INTO `mcc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Product 17', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/product/product_3/product3_1.jpg', 5, 1, '0.9900', 200, 0, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 20, '2009-02-03 16:06:50', '2016-08-23 08:57:18'),
(29, 'Product 14', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/product/product_13/product13_1.jpg', 6, 1, '1.9900', 0, 0, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2016-08-23 08:56:28'),
(30, 'Product 13', '', '', '', '', '', '', '', 6, 6, 'catalog/demo/product/product21/product21_1.jpg', 9, 1, '100.0000', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 3, '2009-02-03 16:59:00', '2016-10-05 17:56:45'),
(31, 'Product 12', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/product/product_12/product12_1.jpg', 0, 1, '1.0000', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2016-08-23 08:56:07'),
(32, 'Product 11', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/product/product_8/product8_1.jpg', 8, 1, '1.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2016-08-23 08:55:50'),
(33, 'Product 2', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/product/product17/product17_1.jpg', 0, 1, '1.0000', 0, 0, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2016-08-23 09:56:25'),
(34, 'Product 15', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/product/product_7/product7_1.jpg', 8, 1, '1.0000', 0, 0, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 1, '2009-02-03 18:07:54', '2016-08-23 08:56:50'),
(35, 'Product 10', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/product/product_14/product14_1.jpg', 0, 0, '1.0000', 0, 0, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2016-08-23 08:55:32'),
(36, 'Product 6', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/product/product_6/product6_1.jpg', 8, 0, '1.0000', 100, 0, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 1, '2009-02-03 18:09:19', '2016-08-23 08:54:16'),
(40, 'Product 19', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/product/product19/product19_1.jpg', 8, 1, '6.9900', 0, 0, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:12', '2016-08-23 08:58:04'),
(41, 'Product 4', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/product/product_4/product4_1.jpg', 8, 1, '1.0000', 0, 0, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:26', '2016-08-23 08:53:47'),
(42, 'Product 1', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/product/product_1/product1_1.jpg', 8, 1, '100.0000', 400, 0, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 7, '2009-02-03 21:07:37', '2016-10-05 17:56:34'),
(43, 'Product 8', '', '', '', '', '', '', '', 885, 5, 'catalog/demo/product/product_9/product9_1.jpg', 8, 0, '0.0100', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:07:49', '2016-08-23 18:59:05'),
(44, 'Product 9', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/product/product_10/product10_1.jpg', 8, 1, '2.0000', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 2, '2009-02-03 21:08:00', '2016-08-23 08:55:07'),
(45, 'Product 5', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/product/product_11/product11_1.jpg', 8, 1, '2.0000', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 39, '2009-02-03 21:08:17', '2016-08-23 08:54:02'),
(46, 'Product 3', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/product/product16/product16_1.jpg', 10, 1, '1.0000', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 84, '2009-02-03 21:08:29', '2016-08-23 09:56:36'),
(47, 'Product 7', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/product/product_2/product2_1.jpg', 7, 1, '1.0000', 400, 0, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 275, '2009-02-03 21:08:40', '2016-10-31 18:30:44'),
(48, 'Product 18', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/product/product_5/product5_1.jpg', 8, 1, '2.9900', 0, 0, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 56, '2009-02-08 17:21:51', '2016-08-23 08:57:42'),
(49, 'Product 16', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/product/product15/product15_1.jpg', 0, 1, '199.9900', 0, 0, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2011-04-26 08:57:34', '2016-10-05 18:09:53');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `mcc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_product_attribute`
--

INSERT INTO `mcc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(42, 3, 1, '100mhz'),
(43, 4, 1, '8gb'),
(47, 2, 1, '4'),
(47, 4, 1, '16GB'),
(43, 2, 1, '1');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_description`
--

CREATE TABLE IF NOT EXISTS `mcc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_product_description`
--

INSERT INTO `mcc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(40, 1, '躺式沙发', '2015年3月6日，苹果iPhone6 Plus（行货）在&quot;拍易得&quot;现货促销，现在在其网上购买苹果iPhone6 Plus仅需95元即可秒杀。这款手机的配件包括：充电器、耳机和数据线等。苹果iPhone6 Plus是一款配置有光学防抖技术的智能手机。', '', '躺式沙发', '躺式沙发', '躺式沙发'),
(44, 1, '田方格书架', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '田方格书架', '田方格书架', '田方格书架'),
(45, 1, '时尚储物柜', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '时尚储物柜', '时尚储物柜', '时尚储物柜'),
(47, 1, '木艺设计', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you''re at the office&lt;/p&gt;\r\n', '', ' 木艺设计', '木艺设计', '木艺设计'),
(49, 1, '缘木立柜', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n', '', '缘木立柜', '缘木立柜', '缘木立柜'),
(48, 1, '莲式木几', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '莲式木几', '莲式木几', '莲式木几'),
(29, 1, '纯香家具', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '纯香家具', '纯香家具', '纯香家具'),
(32, 1, '立式书架', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '立式书架', '立式书架', '立式书架'),
(31, 1, '简约小桌', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '简约小桌', '简约小桌', '简约小桌'),
(30, 1, '简约座椅', '&lt;p&gt;佳能EOS-5D终于揭开了其神秘的面纱，相信大家都对佳能EOS-5D的性能感到满意，但是佳能EOS-5D拍出来的片子如何呢？为此，我们特地从佳能网站上找到几张原尺寸的佳能EOS-5D实拍样张。&lt;/p&gt;', '', '简约座椅', '简约座椅', '简约座椅'),
(41, 1, '布艺沙发', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '布艺沙发', '布艺沙发', '布艺沙发'),
(34, 1, '线条式展架', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '线条式展架', '线条式展架', '线条式展架'),
(36, 1, '时尚简约办公小桌', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '时尚简约办公小桌', '时尚简约办公小桌', '时尚简约办公小桌'),
(42, 1, '包式座椅', '&lt;p&gt;AMD 785G，一个定位于AMD 780G和AMD \r\n790GX之间的产品，近期成为所有主板厂商推广的重点，同时也是所有DIY用户关注的焦点。抛开其整合DirectX 10.1规格的Radeon \r\nHD 4200图形显示核心不提，全新升级的UVD2.0高清解码引擎，让AMD \r\n785G更适合高清应用。诚然，目前在卖场里攒HTPC专用电脑的人并不多，但随着广大民众生活水平的不断提高，这种个性化应用必将是未来大势所趋，故在\r\nAMD 785G上设计更多的HTPC应用功能，也成为有实力的主板品牌必须做的一件事。&lt;/p&gt;&lt;p&gt;一向以代工著称的富士康在个性化产品上的设计近年来有了很大的改观，除了推出面向超频玩家的&quot;Quantum Force（量子力量）&quot;系列外，还针对高品质家庭用户推出了Digital Life（数字家庭）系列，其在DIY产品线上的用心程度不言而喻。&lt;br&gt;&lt;/p&gt;', '', '包式座椅', '包式座椅', '包式座椅'),
(28, 1, '艺术坐椅', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm® MSM 7201A™ 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile® 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO™ 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth® 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi®: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB™ (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD™ memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '艺术坐椅', '艺术坐椅', '艺术坐椅'),
(35, 1, '真皮座椅', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', '真皮座椅', '真皮座椅', '真皮座椅'),
(46, 1, '复古镂空展厨', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '复古镂空展厨', '复古镂空展厨', '复古镂空展厨'),
(33, 1, '古色展厨', '是一款19英寸，拥有16:10黄金屏幕比例的产品。这款产品在外观上采用了黑色烤漆工艺，底边框位置我们看到了其印有品牌LOGO，非常精致。而我们在其它边框位置看到了产品信息，方便了用户购买时挑选。\r\n', '', '古色展厨', '古色展厨', '古色展厨'),
(43, 1, '玻璃茶几', '&lt;p&gt;在本次3月份苹果春季新品发布会上，除了最为耀眼的新款MacBook外，苹果还对MacBook Air与13英寸的Retina MacBook Pro进行了常规硬件升级。其中13英寸的Retina MacBook Pro更新最受关注，因为其在性能上做出了许多重大升级，包括第五代Intel Broadwell处理器、Iris 6100核心显卡、读写速度翻倍的PCIe SSD固态硬盘、更高频率的内存，同时电池续航还增加了一个小时。除此之外，它还首先搭载了与新款MacBook一样的全新Force Touch触控板。&lt;/p&gt;&lt;p&gt;由于国行版的13英寸的Retina MacBook Pro现在已经全面铺货，笔者也得以体验到这款搭载全新压感触控设计的触控板。苹果电脑的触控板体验一直很优秀，配合OS X系统中的多指手势操作，可以轻松完成拖拽文件、切换应用程序、切换不同桌面等操作。如今压力感应操作的加入可以说在原本多指手势的基础上加入了一个全新的维度，使得在触控板上可以进行更多的操作命令。&lt;/p&gt;&lt;p&gt;苹果如此重视笔记本电脑上触控板的用户体验，使得MacBook用户几乎可以不用鼠标，也提升了用户的便利性。由于其长续航的特性，外出也基本不需要携带电源，只需要带一台笔记本就足够。笔者在体验了一天2015款苹果MacBook Pro后，写下这篇评测文章，希望能给关注这款产品的网友一些参考&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', '玻璃茶几', '玻璃茶几', '玻璃茶几');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_discount`
--

CREATE TABLE IF NOT EXISTS `mcc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=483 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_filter`
--

CREATE TABLE IF NOT EXISTS `mcc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_image`
--

CREATE TABLE IF NOT EXISTS `mcc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2728 ;

--
-- 转存表中的数据 `mcc_product_image`
--

INSERT INTO `mcc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2676, 44, 'catalog/demo/product/product_10/product10_3.jpg', 0),
(2663, 45, 'catalog/demo/product/product_11/product11_4.jpg', 0),
(2691, 28, 'catalog/demo/product/product_3/product3_5.jpg', 0),
(2694, 48, 'catalog/demo/product/product_5/product5_5.jpg', 0),
(2727, 47, 'catalog/demo/product/product_2/product2_4.jpg', 0),
(2726, 47, 'catalog/demo/product/product_2/product2_3.jpg', 0),
(2688, 34, 'catalog/demo/product/product_7/product7_2.jpg', 0),
(2681, 32, 'catalog/demo/product/product_8/product8_4.jpg', 0),
(2683, 31, 'catalog/demo/product/product_12/product12_5.jpg', 0),
(2685, 29, 'catalog/demo/product/product_13/product13_2.jpg', 0),
(2684, 29, 'catalog/demo/product/product_13/product13_2.jpg', 0),
(2715, 42, 'catalog/demo/product/product_1/product1_3.jpg', 0),
(2714, 42, 'catalog/demo/product/product_1/product1_2.jpg', 0),
(2661, 41, 'catalog/demo/product/product_4/product4_7.jpg', 0),
(2693, 48, 'catalog/demo/product/product_5/product5_7.jpg', 0),
(2667, 36, 'catalog/demo/product/product_6/product6_6.jpg', 0),
(2666, 36, 'catalog/demo/product/product_6/product6_4.jpg', 0),
(2725, 47, 'catalog/demo/product/product_2/product2_6.jpg', 0),
(2724, 47, 'catalog/demo/product/product_2/product2_5.jpg', 0),
(2690, 28, 'catalog/demo/product/product_3/product3_4.jpg', 0),
(2689, 28, 'catalog/demo/product/product_3/product3_2.jpg', 0),
(2660, 41, 'catalog/demo/product/product_4/product4_3.jpg', 0),
(2659, 41, 'catalog/demo/product/product_4/product4_2.jpg', 0),
(2692, 48, 'catalog/demo/product/product_5/product5_4.jpg', 0),
(2665, 36, 'catalog/demo/product/product_6/product6_3.jpg', 0),
(2664, 36, 'catalog/demo/product/product_6/product6_5.jpg', 0),
(2687, 34, 'catalog/demo/product/product_7/product7_5.jpg', 0),
(2686, 34, 'catalog/demo/product/product_7/product7_4.jpg', 0),
(2680, 32, 'catalog/demo/product/product_8/product8_2.jpg', 0),
(2711, 43, 'catalog/demo/product/product_9/product9_4.jpg', 0),
(2710, 43, 'catalog/demo/product/product_9/product9_5.jpg', 0),
(2709, 43, 'catalog/demo/product/product_9/product9_2.jpg', 0),
(2675, 44, 'catalog/demo/product/product_10/product10_2.jpg', 0),
(2662, 45, 'catalog/demo/product/product_11/product11_2.jpg', 0),
(2682, 31, 'catalog/demo/product/product_12/product12_3.jpg', 0),
(2679, 35, 'catalog/demo/product/product_14/product14_7.jpg', 0),
(2678, 35, 'catalog/demo/product/product_14/product14_6.jpg', 0),
(2677, 35, 'catalog/demo/product/product_14/product14_4.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_option`
--

CREATE TABLE IF NOT EXISTS `mcc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=229 ;

--
-- 转存表中的数据 `mcc_product_option`
--

INSERT INTO `mcc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(228, 47, 14, '', 1),
(208, 42, 4, 'test', 1),
(226, 30, 5, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1),
(209, 42, 6, '', 1),
(223, 42, 2, '', 1),
(217, 42, 5, '', 1),
(218, 42, 1, '', 1),
(222, 42, 7, '', 1),
(219, 42, 8, '2011-02-20', 1),
(227, 47, 13, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `mcc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `mcc_product_option_value`
--

INSERT INTO `mcc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(9, 223, 42, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(10, 223, 42, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(8, 223, 42, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(2, 217, 42, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(16, 226, 30, 5, 40, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(15, 226, 30, 5, 39, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(1, 217, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(3, 217, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(4, 217, 42, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(7, 218, 42, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(6, 218, 42, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(5, 218, 42, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(11, 223, 42, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(20, 228, 47, 14, 52, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(17, 227, 47, 13, 49, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(18, 227, 47, 13, 49, 2, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(19, 227, 47, 13, 49, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(21, 228, 47, 14, 53, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `mcc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_related`
--

CREATE TABLE IF NOT EXISTS `mcc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_product_related`
--

INSERT INTO `mcc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_reward`
--

CREATE TABLE IF NOT EXISTS `mcc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=632 ;

--
-- 转存表中的数据 `mcc_product_reward`
--

INSERT INTO `mcc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(626, 42, 1, 100),
(631, 47, 1, 300),
(618, 28, 1, 400),
(624, 43, 1, 600),
(627, 30, 1, 200),
(617, 44, 1, 700),
(614, 45, 1, 800),
(628, 49, 1, 1000);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_special`
--

CREATE TABLE IF NOT EXISTS `mcc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=473 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `mcc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_product_to_category`
--

INSERT INTO `mcc_product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 26),
(29, 25),
(29, 28),
(29, 36),
(30, 25),
(30, 28),
(30, 57),
(31, 25),
(31, 28),
(31, 36),
(33, 25),
(33, 28),
(33, 35),
(35, 20),
(35, 27),
(40, 20),
(40, 27),
(41, 25),
(41, 29),
(41, 32),
(42, 28),
(42, 36),
(43, 25),
(43, 28),
(43, 36),
(44, 25),
(44, 30),
(44, 32),
(46, 20),
(46, 27),
(47, 20),
(47, 26),
(49, 25),
(49, 28),
(49, 57);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `mcc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `mcc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_product_to_layout`
--

INSERT INTO `mcc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(42, 0, 0),
(30, 0, 0),
(47, 0, 0),
(28, 0, 0),
(41, 0, 0),
(40, 0, 0),
(48, 0, 0),
(36, 0, 0),
(34, 0, 0),
(32, 0, 0),
(43, 0, 0),
(44, 0, 0),
(45, 0, 0),
(31, 0, 0),
(29, 0, 0),
(35, 0, 0),
(49, 0, 0),
(33, 0, 0),
(46, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `mcc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_product_to_store`
--

INSERT INTO `mcc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_pushurl`
--

CREATE TABLE IF NOT EXISTS `mcc_pushurl` (
  `pushurl_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `pushed` tinyint(1) NOT NULL,
  `push_date` datetime NOT NULL,
  PRIMARY KEY (`pushurl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=175 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_recurring`
--

CREATE TABLE IF NOT EXISTS `mcc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `mcc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_return`
--

CREATE TABLE IF NOT EXISTS `mcc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `fullname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_return_action`
--

CREATE TABLE IF NOT EXISTS `mcc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mcc_return_action`
--

INSERT INTO `mcc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, '已退款'),
(2, 1, '退款至账户余额'),
(3, 1, '已换货配送');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_return_history`
--

CREATE TABLE IF NOT EXISTS `mcc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_return_reason`
--

CREATE TABLE IF NOT EXISTS `mcc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `mcc_return_reason`
--

INSERT INTO `mcc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, '收到货物时已使用不上'),
(2, 1, '收到错误物品'),
(3, 1, '订单错误'),
(4, 1, '有瑕疵，请提供详细信息'),
(5, 1, '其他，请提供详细信息');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_return_status`
--

CREATE TABLE IF NOT EXISTS `mcc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `mcc_return_status`
--

INSERT INTO `mcc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, '等待处理'),
(3, 1, '完成'),
(2, 1, '等待商品退回');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_review`
--

CREATE TABLE IF NOT EXISTS `mcc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_revslider_attachment_images`
--

CREATE TABLE IF NOT EXISTS `mcc_revslider_attachment_images` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `mcc_revslider_attachment_images`
--

INSERT INTO `mcc_revslider_attachment_images` (`ID`, `file_name`) VALUES
(1, '8251037_slide1.jpg'),
(2, '3133544_slide1-tag1.png'),
(3, '7620239_slide1-tag2.png'),
(4, '7026672_slide1-tag3.png'),
(5, '4401550_slide1-text.png'),
(6, '7911071_slide2.jpg'),
(7, '8228454_slide2-text.png'),
(8, '6492309_slide3.jpg'),
(9, '3793945_slide3-text1.png'),
(10, '1386413_slide3-text2.png'),
(11, '7786560_slide3-large-tag.png'),
(12, '3041687_slide3-small-tag.png'),
(13, '3386535_demo02-slide1.jpg'),
(14, '2653808_demo02-slide1-tag1.png'),
(15, '9274597_demo02-slide1-tag2.png'),
(16, '1431274_demo02-slide1-tag3.png'),
(17, '8039855_demo02-slide1-text.png'),
(18, '6572570_demo02-slide2.jpg'),
(19, '8120727_demo02-slide2-text.png'),
(20, '371093_demo02-slide3.jpg'),
(21, '2931823_demo02-slide3-large-tag.png'),
(22, '2328186_demo02-slide3-small-tag.png'),
(23, '2860717_demo02-slide3-text1.png'),
(24, '228271_demo02-slide3-text2.png'),
(25, '3930969_demo04-slide01.jpg'),
(26, '1383666_demo04-slide01-line.png'),
(27, '5510253_demo04-slide01-text1.png'),
(28, '4902343_demo04-slide01-text2.png'),
(29, '2732543_demo04-slide01-bnr1.jpg'),
(30, '2253112_demo04-slide01-bnr2.jpg'),
(31, '6566772_demo04-slide01-bnr3.jpg'),
(32, '4272766_demo04-slide01-bnr4.jpg'),
(33, '6398315_demo04-slide02.jpg'),
(34, '7743530_demo04-slide02-hd.png'),
(35, '5184631_demo04-slide02-text1.png'),
(36, '9500122_demo04-slide02-text2.png'),
(37, '8429870_demo04-slide02-text3.png'),
(38, '5634765_demo04-slide02-text4.png'),
(39, '8164672_demo04-slide02-text5.png'),
(40, '4757080_demo04-slide02-text6.png'),
(41, '7585144_demo04-slide02-text7.png'),
(42, '831604_demo04-slide03.jpg'),
(43, '2264099_demo04-slide03-img.jpg'),
(44, '364379_demo04-slide03-text1.png'),
(45, '6130065_demo04-slide03-text2.png'),
(46, '3704223_demo06-slide1.jpg'),
(47, '3346557_demo06-slide1-text1.png'),
(48, '1559448_demo06-slide2.jpg'),
(49, '8583374_demo06-slide2-circle.png'),
(50, '8281555_demo06-slide3.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_revslider_css`
--

CREATE TABLE IF NOT EXISTS `mcc_revslider_css` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `handle` text NOT NULL,
  `settings` text,
  `hover` text,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `mcc_revslider_css`
--

INSERT INTO `mcc_revslider_css` (`id`, `handle`, `settings`, `hover`, `params`) VALUES
(1, '.tp-caption.lightgrey_divider', NULL, NULL, '{"text-decoration":"none","background-color":"rgba(235, 235, 235, 1)","width":"370px","height":"3px","background-position":"initial initial","background-repeat":"initial initial","border-width":"0px","border-color":"rgb(34, 34, 34)","border-style":"none"}'),
(2, '.tp-caption.large_bold_grey', NULL, NULL, '{"font-size":"60px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(102, 102, 102)","text-decoration":"none","background-color":"transparent","text-shadow":"none","margin":"0px","padding":"1px 4px 0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(3, '.tp-caption.medium_thin_grey', NULL, NULL, '{"font-size":"34px","line-height":"30px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(102, 102, 102)","text-decoration":"none","background-color":"transparent","padding":"1px 4px 0px","text-shadow":"none","margin":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(4, '.tp-caption.small_thin_grey', NULL, NULL, '{"font-size":"18px","line-height":"26px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(117, 117, 117)","text-decoration":"none","background-color":"transparent","padding":"1px 4px 0px","text-shadow":"none","margin":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(5, '.tp-caption.large_bold_darkblue', NULL, NULL, '{"font-size":"58px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(52, 73, 94)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(6, '.tp-caption.medium_bg_darkblue', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(52, 73, 94)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(7, '.tp-caption.medium_bold_red', NULL, NULL, '{"font-size":"24px","line-height":"30px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(227, 58, 12)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(8, '.tp-caption.medium_light_red', NULL, NULL, '{"font-size":"21px","line-height":"26px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(227, 58, 12)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(9, '.tp-caption.medium_bg_red', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(227, 58, 12)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(10, '.tp-caption.medium_bold_orange', NULL, NULL, '{"font-size":"24px","line-height":"30px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(243, 156, 18)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(11, '.tp-caption.medium_bg_orange', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(243, 156, 18)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(12, '.tp-caption.medium_bg_asbestos', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(127, 140, 141)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(13, '.tp-caption.large_bold_white', NULL, NULL, '{"font-size":"58px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(14, '.tp-caption.medium_light_white', NULL, NULL, '{"font-size":"30px","line-height":"36px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(15, '.tp-caption.grassfloor', NULL, NULL, '{"text-decoration":"none","background-color":"rgba(160, 179, 151, 1)","width":"4000px","height":"150px","border-width":"0px","border-color":"rgb(34, 34, 34)","border-style":"none"}'),
(16, '.tp-caption.mediumlarge_light_white', NULL, NULL, '{"font-size":"34px","line-height":"40px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(17, '.tp-caption.mediumlarge_light_white_center', NULL, NULL, '{"font-size":"34px","line-height":"40px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"#ffffff","text-decoration":"none","background-color":"transparent","padding":"0px 0px 0px 0px","text-align":"center","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(18, '.tp-caption.black_heavy_60', NULL, NULL, '{"font-size":"60px","line-height":"60px","font-weight":"900","font-family":"Raleway","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(19, '.tp-caption.black_bold_bg_20', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(0, 0, 0)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(20, '.tp-caption.green_bold_bg_20', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(134, 181, 103)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(21, '.tp-caption.greenishbg_heavy_70', NULL, NULL, '{"font-size":"70px","line-height":"70px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","padding":"50px","text-shadow":"none","background-color":"rgba(40, 67, 62, 0.8)","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(22, '.tp-caption.borderbox_725x130', NULL, NULL, '{"min-width":"725px","min-height":"130px","background-color":"transparent","text-decoration":"none","border-width":"2px","border-color":"rgb(255, 255, 255)","border-style":"solid"}'),
(23, '.tp-caption.black_heavy_70', NULL, NULL, '{"font-size":"70px","line-height":"70px","font-weight":"900","font-family":"Raleway","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(24, '.tp-caption.light_heavy_70', NULL, NULL, '{"font-size":"70px","line-height":"70px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(25, '.tp-caption.black_bold_40', NULL, NULL, '{"font-size":"40px","line-height":"40px","font-weight":"800","font-family":"Raleway","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(26, '.tp-caption.white_bold_bg_20', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"rgb(255, 255, 255)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(27, '.tp-caption.red_bold_bg_20', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(224, 51, 0)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(28, '.tp-caption.blue_bold_bg_20', NULL, NULL, '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(53, 152, 220)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(29, '.tp-caption.light_heavy_40', NULL, NULL, '{"font-size":"40px","line-height":"40px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(30, '.tp-caption.white_thin_34', NULL, NULL, '{"font-size":"35px","line-height":"35px","font-weight":"200","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(31, '.tp-caption.light_heavy_70_shadowed', NULL, NULL, '{"font-size":"70px","line-height":"70px","font-weight":"900","font-family":"Raleway","color":"#ffffff","text-decoration":"none","background-color":"transparent","text-shadow":"0px 0px 7px rgba(0, 0, 0, 0.25)","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(32, '.tp-caption.light_medium_30_shadowed', NULL, NULL, '{"font-size":"30px","line-height":"40px","font-weight":"700","font-family":"Raleway","color":"#ffffff","text-decoration":"none","background-color":"transparent","text-shadow":"0px 0px 7px rgba(0, 0, 0, 0.25)","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(33, '.tp-caption.bignumbers_white', NULL, NULL, '{"color":"#ffffff","background-color":"rgba(0, 0, 0, 0)","font-size":"84px","line-height":"84px","font-weight":"800","font-family":"Raleway","text-decoration":"none","padding":"0px 0px 0px 0px","text-shadow":"rgba(0, 0, 0, 0.247059) 0px 0px 7px","border-width":"0px","border-color":"rgb(255, 255, 255)","border-style":"none solid none none"}'),
(34, '.tp-caption.bignumbers_whitefdf', NULL, NULL, '{"font-size":"92px","line-height":"61px","font-weight":"500","font-family":"Raleway","color":"rgb(43, 38, 38)","text-decoration":"none","padding":"0px","text-shadow":"rgba(0, 0, 0, 0.247059) 0px 0px 7px","background-color":"rgba(0, 0, 0, 0.00784314)","border-width":"0px","border-color":"rgb(255, 255, 255)","border-style":"none"}'),
(35, '.tp-caption.simplegreat_text', NULL, NULL, '{"font-size":"30px","line-height":"40px","font-weight":"normal","font-family":"\\"Open Sans\\"","color":"#ffffff","text-decoration":"none","background-color":"transparent","padding":"0px 0px 0px 0px","text-align":"center","text-transform":"uppercase","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(36, '.tp-caption.black', NULL, NULL, '{"color":"#000","text-shadow":"none"}'),
(37, '.tp-caption.rgen-cp1', NULL, NULL, '{"font-size":"70px","line-height":"1","font-weight":"400","font-family":"Oswald","color":"rgb(255, 255, 255)","text-decoration":"none","border-width":"0px","border-color":"rgb(255, 255, 255)","border-style":"none"}'),
(38, '.tp-caption.rgen-cp2', NULL, NULL, '{"font-size":"25px","line-height":"1","font-weight":"300","font-family":"Roboto","color":"#ffffff","text-decoration":"none","background-color":"transparent","text-align":"center","border-width":"0px","border-color":"rgb(255, 255, 255)","border-style":"none"}'),
(39, '.tp-caption.rgen-cp-btn', NULL, NULL, '{"font-size":"16px","line-height":"1","font-weight":"400","font-family":"\\"Oswald\\"","color":"#ffffff","text-decoration":"none","text-align":"center","background-color":"transparent","text-transform":"uppercase","padding":"8px 30px","border-width":"1px","border-color":"rgb(255, 255, 255)","border-style":"solid"}'),
(40, '.tp-caption.rgen-cp3', NULL, NULL, '{"font-family":"\\"Rancho\\"","color":"#ffffff","font-size":"40px","line-height":"1","border-width":"0px","border-color":"rgb(255, 255, 255)","border-style":"none"}'),
(41, '.tp-caption.rgen-cp1-large', NULL, NULL, '{"font-size":"140px","line-height":"1","font-weight":"400","font-family":"Oswald","color":"#ffffff","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 255, 255)","border-style":"none"}');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_revslider_layer_animations`
--

CREATE TABLE IF NOT EXISTS `mcc_revslider_layer_animations` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `handle` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_revslider_settings`
--

CREATE TABLE IF NOT EXISTS `mcc_revslider_settings` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `general` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_revslider_sliders`
--

CREATE TABLE IF NOT EXISTS `mcc_revslider_sliders` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `alias` tinytext,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `mcc_revslider_sliders`
--

INSERT INTO `mcc_revslider_sliders` (`id`, `title`, `alias`, `params`) VALUES
(1, 'demo-01-home-slideshow-pagefull', 'demo-01-home-slideshow-pagefull', '{"title":"demo-01-home-slideshow-pagefull","alias":"demo-01-home-slideshow-pagefull","source_type":"gallery","post_types":"product","post_category":"category_87","post_sortby":"ID","prd_img_width":"880","prd_img_height":"345","posts_sort_direction":"DESC","max_slider_posts":"30","excerpt_limit":"55","slider_template_id":"","posts_list":"","slider_type":"fullwidth","fullscreen_offset_container":"","fullscreen_offset_size":"","fullscreen_min_height":"","full_screen_align_force":"off","auto_height":"off","force_full_width":"off","min_height":"0","width":"1320","height":"500","responsitive_w1":"940","responsitive_sw1":"770","responsitive_w2":"780","responsitive_sw2":"500","responsitive_w3":"510","responsitive_sw3":"310","responsitive_w4":"0","responsitive_sw4":"0","responsitive_w5":"0","responsitive_sw5":"0","responsitive_w6":"0","responsitive_sw6":"0","delay":"9000","shuffle":"off","lazy_load":"off","use_wpml":"off","enable_static_layers":"off","next_slide_on_window_focus":"off","simplify_ie8_ios4":"off","stop_slider":"off","stop_after_loops":0,"stop_at_slide":2,"show_timerbar":"top","loop_slide":"loop","position":"center","margin_top":0,"margin_bottom":0,"margin_left":0,"margin_right":0,"shadow_type":"0","padding":0,"background_color":"#E9E9E9","background_dotted_overlay":"none","show_background_image":"false","background_image":"http:\\/\\/127.0.0.1:90\\/","bg_fit":"cover","bg_repeat":"no-repeat","bg_position":"center top","stop_on_hover":"on","keyboard_navigation":"off","navigation_style":"preview4","navigaion_type":"bullet","navigation_arrows":"solo","navigaion_always_on":"false","hide_thumbs":200,"navigaion_align_hor":"center","navigaion_align_vert":"bottom","navigaion_offset_hor":"0","navigaion_offset_vert":20,"leftarrow_align_hor":"left","leftarrow_align_vert":"center","leftarrow_offset_hor":20,"leftarrow_offset_vert":0,"rightarrow_align_hor":"right","rightarrow_align_vert":"center","rightarrow_offset_hor":20,"rightarrow_offset_vert":0,"thumb_width":100,"thumb_height":50,"thumb_amount":5,"use_spinner":"0","spinner_color":"#FFFFFF","use_parallax":"off","disable_parallax_mobile":"off","parallax_type":"mouse","parallax_bg_freeze":"off","parallax_level_1":"5","parallax_level_2":"10","parallax_level_3":"15","parallax_level_4":"20","parallax_level_5":"25","parallax_level_6":"30","parallax_level_7":"35","parallax_level_8":"40","parallax_level_9":"45","parallax_level_10":"50","touchenabled":"on","swipe_velocity":75,"swipe_min_touches":1,"drag_block_vertical":"false","disable_on_mobile":"off","disable_kenburns_on_mobile":"off","hide_slider_under":0,"hide_defined_layers_under":0,"hide_all_layers_under":0,"hide_arrows_on_mobile":"off","hide_bullets_on_mobile":"off","hide_thumbs_on_mobile":"off","hide_thumbs_under_resolution":0,"hide_thumbs_delay_mobile":1500,"start_with_slide":"1","first_transition_active":"false","first_transition_type":"fade","first_transition_duration":300,"first_transition_slot_amount":7,"reset_transitions":"","reset_transition_duration":0,"0":"Execute settings on all slides","jquery_noconflict":"off","js_to_body":"false","output_type":"none","custom_css":"","custom_javascript":"","template":"false"}'),
(2, 'demo-02-home-slideshow-pagefull', 'demo-02-home-slideshow-pagefull', '{"title":"demo-02-home-slideshow-pagefull","alias":"demo-02-home-slideshow-pagefull","source_type":"gallery","post_types":"product","post_category":"category_20","post_sortby":"ID","prd_img_width":"880","prd_img_height":"345","posts_sort_direction":"DESC","max_slider_posts":"30","excerpt_limit":"55","slider_template_id":"","posts_list":"","slider_type":"fullwidth","fullscreen_offset_container":"","fullscreen_offset_size":"","fullscreen_min_height":"","full_screen_align_force":"off","auto_height":"off","force_full_width":"off","min_height":"0","width":"1320","height":"650","responsitive_w1":"940","responsitive_sw1":"770","responsitive_w2":"780","responsitive_sw2":"500","responsitive_w3":"510","responsitive_sw3":"310","responsitive_w4":"0","responsitive_sw4":"0","responsitive_w5":"0","responsitive_sw5":"0","responsitive_w6":"0","responsitive_sw6":"0","delay":"9000","shuffle":"off","lazy_load":"off","use_wpml":"off","enable_static_layers":"off","next_slide_on_window_focus":"off","simplify_ie8_ios4":"off","stop_slider":"off","stop_after_loops":0,"stop_at_slide":2,"show_timerbar":"top","loop_slide":"loop","position":"center","margin_top":0,"margin_bottom":0,"margin_left":0,"margin_right":0,"shadow_type":"0","padding":0,"background_color":"#E9E9E9","background_dotted_overlay":"none","show_background_image":"false","background_image":"http:\\/\\/127.0.0.1:90\\/","bg_fit":"cover","bg_repeat":"no-repeat","bg_position":"center top","stop_on_hover":"on","keyboard_navigation":"off","navigation_style":"preview4","navigaion_type":"bullet","navigation_arrows":"solo","navigaion_always_on":"false","hide_thumbs":200,"navigaion_align_hor":"center","navigaion_align_vert":"bottom","navigaion_offset_hor":"0","navigaion_offset_vert":20,"leftarrow_align_hor":"left","leftarrow_align_vert":"center","leftarrow_offset_hor":20,"leftarrow_offset_vert":0,"rightarrow_align_hor":"right","rightarrow_align_vert":"center","rightarrow_offset_hor":20,"rightarrow_offset_vert":0,"thumb_width":100,"thumb_height":50,"thumb_amount":5,"use_spinner":"0","spinner_color":"#FFFFFF","use_parallax":"off","disable_parallax_mobile":"off","parallax_type":"mouse","parallax_bg_freeze":"off","parallax_level_1":"5","parallax_level_2":"10","parallax_level_3":"15","parallax_level_4":"20","parallax_level_5":"25","parallax_level_6":"30","parallax_level_7":"35","parallax_level_8":"40","parallax_level_9":"45","parallax_level_10":"50","touchenabled":"on","swipe_velocity":75,"swipe_min_touches":1,"drag_block_vertical":"false","disable_on_mobile":"off","disable_kenburns_on_mobile":"off","hide_slider_under":0,"hide_defined_layers_under":0,"hide_all_layers_under":0,"hide_arrows_on_mobile":"off","hide_bullets_on_mobile":"off","hide_thumbs_on_mobile":"off","hide_thumbs_under_resolution":0,"hide_thumbs_delay_mobile":1500,"start_with_slide":"1","first_transition_active":"false","first_transition_type":"fade","first_transition_duration":300,"first_transition_slot_amount":7,"reset_transitions":"","reset_transition_duration":0,"0":"Execute settings on all slides","jquery_noconflict":"off","js_to_body":"false","output_type":"none","custom_css":"","custom_javascript":"","template":"false"}'),
(5, 'Slider4', 'slider4', '{"title":"Slider4","alias":"slider4","source_type":"gallery","post_types":"product","post_category":"category_20","post_sortby":"ID","prd_img_width":"880","prd_img_height":"345","posts_sort_direction":"DESC","max_slider_posts":"30","excerpt_limit":"55","slider_template_id":"","posts_list":"","slider_type":"fullwidth","fullscreen_offset_container":"","fullscreen_offset_size":"","fullscreen_min_height":"","full_screen_align_force":"off","auto_height":"off","force_full_width":"off","min_height":"0","width":"1320","height":"650","responsitive_w1":"940","responsitive_sw1":"770","responsitive_w2":"780","responsitive_sw2":"500","responsitive_w3":"510","responsitive_sw3":"310","responsitive_w4":"0","responsitive_sw4":"0","responsitive_w5":"0","responsitive_sw5":"0","responsitive_w6":"0","responsitive_sw6":"0","delay":"9000","shuffle":"off","lazy_load":"off","use_wpml":"off","enable_static_layers":"off","next_slide_on_window_focus":"off","simplify_ie8_ios4":"off","stop_slider":"off","stop_after_loops":0,"stop_at_slide":2,"show_timerbar":"top","loop_slide":"loop","position":"center","margin_top":0,"margin_bottom":0,"margin_left":0,"margin_right":0,"shadow_type":"0","padding":0,"background_color":"#E9E9E9","background_dotted_overlay":"none","show_background_image":"false","background_image":"http:\\/\\/127.0.0.1:90\\/","bg_fit":"cover","bg_repeat":"no-repeat","bg_position":"center top","stop_on_hover":"on","keyboard_navigation":"off","navigation_style":"preview4","navigaion_type":"bullet","navigation_arrows":"solo","navigaion_always_on":"false","hide_thumbs":200,"navigaion_align_hor":"center","navigaion_align_vert":"bottom","navigaion_offset_hor":"0","navigaion_offset_vert":20,"leftarrow_align_hor":"left","leftarrow_align_vert":"center","leftarrow_offset_hor":20,"leftarrow_offset_vert":0,"rightarrow_align_hor":"right","rightarrow_align_vert":"center","rightarrow_offset_hor":20,"rightarrow_offset_vert":0,"thumb_width":100,"thumb_height":50,"thumb_amount":5,"use_spinner":"0","spinner_color":"#FFFFFF","use_parallax":"off","disable_parallax_mobile":"off","parallax_type":"mouse","parallax_bg_freeze":"off","parallax_level_1":"5","parallax_level_2":"10","parallax_level_3":"15","parallax_level_4":"20","parallax_level_5":"25","parallax_level_6":"30","parallax_level_7":"35","parallax_level_8":"40","parallax_level_9":"45","parallax_level_10":"50","touchenabled":"on","swipe_velocity":75,"swipe_min_touches":1,"drag_block_vertical":"false","disable_on_mobile":"off","disable_kenburns_on_mobile":"off","hide_slider_under":0,"hide_defined_layers_under":0,"hide_all_layers_under":0,"hide_arrows_on_mobile":"off","hide_bullets_on_mobile":"off","hide_thumbs_on_mobile":"off","hide_thumbs_under_resolution":0,"hide_thumbs_delay_mobile":1500,"start_with_slide":"1","first_transition_active":"false","first_transition_type":"fade","first_transition_duration":300,"first_transition_slot_amount":7,"reset_transitions":"","reset_transition_duration":0,"0":"Execute settings on all slides","jquery_noconflict":"off","js_to_body":"false","output_type":"none","custom_css":"","custom_javascript":"","template":"false"}'),
(4, 'demo-06-home-slideshow-fullwidth', 'demo-06-home-slideshow-fullwidth', '{"title":"demo-06-home-slideshow-fullwidth","alias":"demo-06-home-slideshow-fullwidth","source_type":"gallery","post_types":"product","post_category":"category_20","post_sortby":"ID","prd_img_width":"880","prd_img_height":"345","posts_sort_direction":"DESC","max_slider_posts":"30","excerpt_limit":"55","slider_template_id":"","posts_list":"","slider_type":"fullwidth","fullscreen_offset_container":"","fullscreen_offset_size":"","fullscreen_min_height":"","full_screen_align_force":"off","auto_height":"off","force_full_width":"off","min_height":"160","width":"1170","height":"600","responsitive_w1":"940","responsitive_sw1":"770","responsitive_w2":"780","responsitive_sw2":"500","responsitive_w3":"510","responsitive_sw3":"310","responsitive_w4":"0","responsitive_sw4":"0","responsitive_w5":"0","responsitive_sw5":"0","responsitive_w6":"0","responsitive_sw6":"0","delay":"6000","shuffle":"off","lazy_load":"off","use_wpml":"off","enable_static_layers":"off","next_slide_on_window_focus":"off","simplify_ie8_ios4":"off","stop_slider":"off","stop_after_loops":0,"stop_at_slide":2,"show_timerbar":"top","loop_slide":"loop","position":"center","margin_top":0,"margin_bottom":0,"margin_left":0,"margin_right":0,"shadow_type":"0","padding":0,"background_color":"#000000","background_dotted_overlay":"none","show_background_image":"false","background_image":"http:\\/\\/127.0.0.1:90\\/","bg_fit":"cover","bg_repeat":"no-repeat","bg_position":"center top","stop_on_hover":"on","keyboard_navigation":"off","navigation_style":"preview4","navigaion_type":"bullet","navigation_arrows":"solo","navigaion_always_on":"false","hide_thumbs":200,"navigaion_align_hor":"center","navigaion_align_vert":"bottom","navigaion_offset_hor":"0","navigaion_offset_vert":20,"leftarrow_align_hor":"left","leftarrow_align_vert":"center","leftarrow_offset_hor":20,"leftarrow_offset_vert":0,"rightarrow_align_hor":"right","rightarrow_align_vert":"center","rightarrow_offset_hor":20,"rightarrow_offset_vert":0,"thumb_width":100,"thumb_height":50,"thumb_amount":5,"use_spinner":"0","spinner_color":"#FFFFFF","use_parallax":"off","disable_parallax_mobile":"off","parallax_type":"mouse","parallax_bg_freeze":"off","parallax_level_1":"5","parallax_level_2":"10","parallax_level_3":"15","parallax_level_4":"20","parallax_level_5":"25","parallax_level_6":"30","parallax_level_7":"35","parallax_level_8":"40","parallax_level_9":"45","parallax_level_10":"50","touchenabled":"on","swipe_velocity":75,"swipe_min_touches":1,"drag_block_vertical":"false","disable_on_mobile":"off","disable_kenburns_on_mobile":"off","hide_slider_under":0,"hide_defined_layers_under":0,"hide_all_layers_under":0,"hide_arrows_on_mobile":"off","hide_bullets_on_mobile":"off","hide_thumbs_on_mobile":"off","hide_thumbs_under_resolution":0,"hide_thumbs_delay_mobile":1500,"start_with_slide":"1","first_transition_active":"false","first_transition_type":"fade","first_transition_duration":300,"first_transition_slot_amount":7,"reset_transitions":"","reset_transition_duration":0,"0":"Execute settings on all slides","jquery_noconflict":"off","js_to_body":"false","output_type":"none","custom_css":"","custom_javascript":"","template":"false"}');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_revslider_slides`
--

CREATE TABLE IF NOT EXISTS `mcc_revslider_slides` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `slider_id` int(9) NOT NULL,
  `slide_order` int(11) NOT NULL,
  `params` text NOT NULL,
  `layers` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `mcc_revslider_slides`
--

INSERT INTO `mcc_revslider_slides` (`id`, `slider_id`, `slide_order`, `params`, `layers`) VALUES
(1, 1, 1, '{"background_type":"image","title":"Slide 1","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":200,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"0","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone","image":"http:\\/\\/127.0.0.1\\/realchao\\/image\\/catalog\\/revslider_media_folder\\/2016-09-22-12-09-24684062621.jpg","0":"Remove"}', '[{"style":"","text":"Image 4","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/4401550_slide1-text.png","left":75,"top":17,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1500,"align_hor":"right","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":700,"endtime":"7500","endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":20,"height":20,"serial":"3","endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_start":"1","static_end":"2"}]'),
(2, 1, 2, '{"background_type":"image","title":"Slide 2","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":200,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"0","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone","image":"http:\\/\\/127.0.0.1\\/realchao\\/image\\/catalog\\/revslider_media_folder\\/2016-09-22-12-09-24684062621.jpg"}', '[{"style":"","text":"Image 4","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/8228454_slide2-text.png","left":75,"top":-8,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1500,"align_hor":"right","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":700,"endtime":"7500","endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":469,"height":160,"serial":"3","endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_start":"1","static_end":"2"}]'),
(3, 1, 3, '{"background_type":"image","title":"Slide 3","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":200,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"0","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone","image":"http:\\/\\/127.0.0.1\\/realchao\\/image\\/catalog\\/revslider_media_folder\\/2016-09-22-12-09-24684062621.jpg"}', '[{"style":"","text":"Image 4","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/3793945_slide3-text1.png","left":83,"top":-134,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1500,"align_hor":"right","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":700,"endtime":"7500","endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":311,"height":108,"serial":"0","endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_start":"1","static_end":"2"},{"style":"","text":"Image 2","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/1386413_slide3-text2.png","left":925,"top":475,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1500,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":1000,"endtime":7500,"endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":311,"height":108,"serial":"1","endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 3","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/7786560_slide3-large-tag.png","left":50,"top":250,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"randomrotate","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":800,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":700,"endtime":8200,"endspeed":800,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":346,"height":346,"serial":"2","endTimeFinal":8200,"endSpeedFinal":800,"realEndTime":9000,"timeLast":8200,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 5","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/3041687_slide3-small-tag.png","left":317,"top":270,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"randomrotate","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":800,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":1000,"endtime":"8200","endspeed":800,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":111,"height":111,"serial":"3","endTimeFinal":8200,"endSpeedFinal":800,"realEndTime":9000,"timeLast":8200,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(4, 2, 1, '{"background_type":"image","image":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/3386535_demo02-slide1.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"style":"","text":"Image 2","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/2653808_demo02-slide1-tag1.png","left":50,"top":250,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lft","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1200,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":500,"endtime":"7500","endspeed":1200,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":107,"height":53,"serial":1,"endTimeFinal":7800,"endSpeedFinal":1200,"realEndTime":9000,"timeLast":7800,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 3","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/9274597_demo02-slide1-tag2.png","left":400,"top":350,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1200,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":700,"endtime":7800,"endspeed":1200,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":105,"height":52,"serial":2,"endTimeFinal":7800,"endSpeedFinal":1200,"realEndTime":9000,"timeLast":7800,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 4","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/1431274_demo02-slide1-tag3.png","left":625,"top":275,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1200,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":900,"endtime":7800,"endspeed":1200,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":105,"height":52,"serial":3,"endTimeFinal":7800,"endSpeedFinal":1200,"realEndTime":9000,"timeLast":7800,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 5","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/8039855_demo02-slide1-text.png","left":775,"top":300,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1500,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":1100,"endtime":7500,"endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":469,"height":160,"serial":4,"endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(5, 2, 2, '{"background_type":"image","image":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/6572570_demo02-slide2.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"style":"","text":"Image 2","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/8120727_demo02-slide2-text.png","left":750,"top":325,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1500,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":500,"endtime":"7500","endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":469,"height":160,"serial":1,"endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(6, 2, 3, '{"background_type":"image","image":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/371093_demo02-slide3.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"style":"","text":"Image 1","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/2931823_demo02-slide3-large-tag.png","left":76,"top":226,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"randomrotate","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1000,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":500,"endtime":"8000","endspeed":1000,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":346,"height":346,"serial":"0","endTimeFinal":8000,"endSpeedFinal":1000,"realEndTime":9000,"timeLast":8000,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 3","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/2328186_demo02-slide3-small-tag.png","left":343,"top":247,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"randomrotate","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1000,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":700,"endtime":"8000","endspeed":1000,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":111,"height":111,"serial":"1","endTimeFinal":8000,"endSpeedFinal":1000,"realEndTime":9000,"timeLast":8000,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 4","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/2860717_demo02-slide3-text1.png","left":926,"top":276,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1500,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":900,"endtime":7500,"endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":311,"height":108,"serial":"2","endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 5","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/228271_demo02-slide3-text2.png","left":926,"top":426,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1500,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":1100,"endtime":"7500","endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":311,"height":108,"serial":"3","endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(14, 5, 2, '{"background_type":"image","image":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/6572570_demo02-slide2.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"style":"","text":"Image 2","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/8120727_demo02-slide2-text.png","left":750,"top":325,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1500,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":500,"endtime":"7500","endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":469,"height":160,"serial":1,"endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(15, 5, 3, '{"background_type":"image","image":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/371093_demo02-slide3.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"style":"","text":"Image 1","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/2931823_demo02-slide3-large-tag.png","left":76,"top":226,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"randomrotate","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1000,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":500,"endtime":"8000","endspeed":1000,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":346,"height":346,"serial":"0","endTimeFinal":8000,"endSpeedFinal":1000,"realEndTime":9000,"timeLast":8000,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 3","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/2328186_demo02-slide3-small-tag.png","left":343,"top":247,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"randomrotate","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1000,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":700,"endtime":"8000","endspeed":1000,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":111,"height":111,"serial":"1","endTimeFinal":8000,"endSpeedFinal":1000,"realEndTime":9000,"timeLast":8000,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 4","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/2860717_demo02-slide3-text1.png","left":926,"top":276,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1500,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":900,"endtime":7500,"endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":311,"height":108,"serial":"2","endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 5","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/228271_demo02-slide3-text2.png","left":926,"top":426,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":1500,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":1100,"endtime":"7500","endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":311,"height":108,"serial":"3","endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(13, 5, 1, '{"background_type":"image","image":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/3386535_demo02-slide1.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"style":"","text":"Image 2","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/2653808_demo02-slide1-tag1.png","left":50,"top":250,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lft","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1200,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":500,"endtime":"7500","endspeed":1200,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":107,"height":53,"serial":1,"endTimeFinal":7800,"endSpeedFinal":1200,"realEndTime":9000,"timeLast":7800,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 3","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/9274597_demo02-slide1-tag2.png","left":400,"top":350,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1200,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":700,"endtime":7800,"endspeed":1200,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":105,"height":52,"serial":2,"endTimeFinal":7800,"endSpeedFinal":1200,"realEndTime":9000,"timeLast":7800,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 4","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/1431274_demo02-slide1-tag3.png","left":625,"top":275,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1200,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":900,"endtime":7800,"endspeed":1200,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":105,"height":52,"serial":3,"endTimeFinal":7800,"endSpeedFinal":1200,"realEndTime":9000,"timeLast":7800,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"style":"","text":"Image 5","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/8039855_demo02-slide1-text.png","left":775,"top":300,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":1500,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":1100,"endtime":7500,"endspeed":1500,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":469,"height":160,"serial":4,"endTimeFinal":7500,"endSpeedFinal":1500,"realEndTime":9000,"timeLast":7500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(10, 4, 1, '{"background_type":"image","image":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/3704223_demo06-slide1.jpg","title":"Slide 1","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"true","link_type":"regular","link":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","link_open_in":"new","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"style":"","text":"Image 1","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/3346557_demo06-slide1-text1.png","left":88,"top":164,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sft","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":700,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":400,"endtime":"8300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":310,"height":33,"serial":"0","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_end":"1","static_start":"1"},{"text":"SIMPLICITY","type":"text","left":83,"top":212,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfl","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":700,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp1","time":700,"endtime":"8300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":67,"height":13,"serial":"1","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_end":"1","static_start":"1"},{"text":"Lorem ipsum dolor sit amet, consetetur<br>nsadipscing elitrsed diam nonumy","type":"text","left":29,"top":310,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfl","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":700,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp2","time":1200,"endtime":"8300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":376,"height":70,"serial":"2","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_end":"1","static_start":"1"},{"text":"Shop new arrivals","type":"text","left":150,"top":400,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfb","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","speed":700,"align_hor":"left","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp-btn","time":1700,"endtime":"5300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":649,"height":84,"serial":"3","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":"","static_start":"1","static_end":"2"}]');
INSERT INTO `mcc_revslider_slides` (`id`, `slider_id`, `slide_order`, `params`, `layers`) VALUES
(11, 4, 2, '{"background_type":"image","image":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/1559448_demo06-slide2.jpg","title":"Slide 2","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"true","link_type":"regular","link":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","link_open_in":"new","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"style":"","text":"Image 6","type":"image","image_url":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/8583374_demo06-slide2-circle.png","left":15,"top":0,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"randomrotate","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":700,"align_hor":"right","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","time":400,"endtime":"5300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":490,"height":490,"serial":"0","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"Great Offers","type":"text","left":183,"top":174,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sft","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":700,"align_hor":"right","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp3","time":700,"endtime":"8300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":156,"height":40,"serial":"1","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"HUGH SALE","type":"text","left":105,"top":219,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfb","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":700,"align_hor":"right","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp1","time":1200,"endtime":"8300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":312,"height":70,"serial":"2","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"<strong style=\\\\\\"font-weight: 800;\\\\\\">SAVE UP TO 75%<\\/strong> <br>ON SELECTED RANGE","type":"text","left":135,"top":318,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfb","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":700,"align_hor":"right","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp2","time":1700,"endtime":"5300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":245,"height":50,"serial":"3","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"Shop Now","type":"text","left":190,"top":411,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sft","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":700,"align_hor":"right","align_vert":"top","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp-btn","time":2200,"endtime":"5300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":131,"height":34,"serial":"4","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(12, 4, 3, '{"background_type":"image","image":"http:\\/\\/127.0.0.1:90\\/image\\/catalog\\/revslider_media_folder\\/8281555_demo06-slide3.jpg","title":"Slide 3","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"true","link_type":"regular","link":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","link_open_in":"new","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"text":"Limited time only","type":"text","left":0,"top":-100,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sft","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":700,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp3","time":500,"endtime":"5300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":156,"height":40,"serial":"0","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"CLEARANCE","type":"text","left":0,"top":0,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfb","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":700,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp1-large","time":700,"endtime":"5300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":312,"height":70,"serial":"1","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"<strong style=\\\\\\"font-weight: 800;\\\\\\">SAVE UP TO 75% ON SELECTED RANGE<\\/strong>","type":"text","left":0,"top":100,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sfb","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":700,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp2","time":1200,"endtime":"5300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":245,"height":50,"serial":"2","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"Shop Now","type":"text","left":0,"top":150,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"sft","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":700,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"rgen-cp-btn","time":1700,"endtime":"5300","endspeed":700,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":131,"height":34,"serial":"3","endTimeFinal":8300,"endSpeedFinal":700,"realEndTime":6000,"timeLast":8300,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_revslider_static_slides`
--

CREATE TABLE IF NOT EXISTS `mcc_revslider_static_slides` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `slider_id` int(9) NOT NULL,
  `params` text NOT NULL,
  `layers` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_rgen_modules`
--

CREATE TABLE IF NOT EXISTS `mcc_rgen_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `group` varchar(64) NOT NULL,
  `section` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3494 ;

--
-- 转存表中的数据 `mcc_rgen_modules`
--

INSERT INTO `mcc_rgen_modules` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(3485, 0, 'rgen_module', 'rgen_contentblocks', 'rgtZs', '{"common":{"title_status":false,"title":{"1":""},"gt":"gt40","top":{"status":false,"html":{"1":""}},"bottom":{"status":true,"html":{"1":"zh-cn - No data"}},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt0","margin_b":"mb0"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl12","desktop":" d-xl12","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"view":"grid","grids":{"lg_desktop":"eq1","desktop":"d-eq1","tablet":"t-eq1","mob_xl":"mxl-eq1","mob_sm":"msm-eq1","mob_xs":"mxs-eq1","gutter":"gt0","margin_b":"mb4","classGroup":" eq1 d-eq1 t-eq1 mxl-eq1 msm-eq1 mxs-eq1 gt0 mb4"},"carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false},"title":{"status":false,"text":{"1":""},"block":[]},"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"Click and collect","item_data":{"node_type":"block","content":{"title":{"1":"Click & Collect"},"img_alt":{"1":"en - No data"},"description":{"1":"Lorem ipsum dolor sit amet"},"btn_text":{"1":"en - No data"}},"setting":{"style":"1","title_pos":"below","img_pos":"l","img_block_w":85,"img_block_gt":15,"img_block_t":0,"title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"glyphicon glyphicon-briefcase","size":"60px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 60px;"},"icon_block":{"status":true,"fonts":[],"background":"rgb(0, 0, 0)","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(0, 0, 0); color: rgb(255, 255, 255); font-size: 13px; text-align: left; "},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"","win":false,"img_link":false,"title_link":false,"full_link":false,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Click and collect","item_data":{"node_type":"block","content":{"title":{"1":"Click & Collect"},"img_alt":{"1":"en - No data"},"description":{"1":"Lorem ipsum dolor sit amet"},"btn_text":{"1":"en - No data"}},"setting":{"style":"1","title_pos":"below","img_pos":"l","img_block_w":85,"img_block_gt":15,"img_block_t":0,"title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"glyphicon glyphicon-briefcase","size":"60px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 60px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"","win":false,"img_link":false,"title_link":false,"full_link":false,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Secure payment","item_data":{"node_type":"block","content":{"title":{"1":"Secure payment"},"img_alt":{"1":"en - No data"},"description":{"1":"Lorem ipsum dolor sit amet"},"btn_text":{"1":"en - No data"}},"setting":{"style":"1","title_pos":"below","img_pos":"l","img_block_w":85,"img_block_gt":15,"img_block_t":0,"title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-lock","size":"70px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 70px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"","win":false,"img_link":false,"title_link":false,"full_link":false,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Secure payment","item_data":{"node_type":"block","content":{"title":{"1":"Secure payment"},"img_alt":{"1":"en - No data"},"description":{"1":"Lorem ipsum dolor sit amet"},"btn_text":{"1":"en - No data"}},"setting":{"style":"1","title_pos":"below","img_pos":"l","img_block_w":85,"img_block_gt":15,"img_block_t":0,"title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-lock","size":"70px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 70px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"","win":false,"img_link":false,"title_link":false,"full_link":false,"cssclass":""}},"items":[]}]}]}],"name":"\\u4f7f\\u7528\\u8bf4\\u660e"}'),
(3336, 0, 'rgen_module', 'rgen_imagegallery', 'rgO2R', '{"common":{"title_status":true,"title":{"1":"\\u652f\\u4ed8\\u65b9\\u5f0f"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl12","desktop":" d-xl12","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"zoon_icon":{"status":false,"type":"ico","icon":"fa fa-signal","size":"14px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"inherit","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"240","block_h":"150","css":""},"url_icon":{"icon":"fa fa-link","status":false,"type":"ico","size":"14px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":""},"view":"grid","grids":{"lg_desktop":"eq3","desktop":"d-eq3","tablet":"t-eq3","mob_xl":"mxl-eq3","mob_sm":"msm-eq3","mob_xs":"mxs-eq3","gutter":"gt10","margin_b":"mb10","classGroup":" eq3 d-eq3 t-eq3 mxl-eq3 msm-eq3 mxs-eq3 gt10 mb10"},"gt":10,"base_size":97,"image_w":"240","image_h":"150","resize_type":"fill","carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false}}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"yinlian","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":false,"popup_status":false,"description_status":false,"image":{"img":"..\\/image\\/catalog\\/yinlian.png","alt":{"1":""},"url":"","win":false},"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":false,"popup_status":false,"description_status":false,"image":{"img":"..\\/image\\/catalog\\/zhifubao.png","alt":{"1":""},"url":"","win":false},"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":false,"popup_status":false,"description_status":false,"image":{"img":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/gallery\\/04.jpg","alt":{"1":""},"url":"","win":false},"cssclass":""}},"items":[]}]}]}],"name":"Footer - image gallery"}'),
(3450, 0, 'rgen_module', 'rgen_basicslideshow', 'rgfTN', '{"common":{"auto":true,"continuous":true,"stoponhover":true,"pager":true,"arrows":true,"effect":"slide","speed":1500,"pause":2000},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/APC_Lower-Block_2016.jpg","url":"","win":false}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/slideshow\\/home-slideshow\\/slide02.jpg","url":"","win":false}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"en - No data"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/slideshow\\/home-slideshow\\/slide03.jpg","url":"","win":false}}],"name":"Basic slideshow 01"}'),
(3333, 0, 'rgen_module', 'rgen_basicslideshow', 'rgN0C', '{"common":{"effect":"random","speed":"1000","auto":true,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/banners\\/other-banners\\/376x510_1.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}},{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"slide":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/banners\\/other-banners\\/376x510_2.jpg","url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true}}],"name":"Home - Featured banners"}'),
(3363, 0, 'rgen_module', 'rgen_gridmanager_set', 'set_rgmbI', '{"data":[{"module_id":"rgpFy","layout_id":"1","position":"rg_t_up","status":true,"sort_order":"4","container":"bx"}],"name":"Home - Deals for every one"}'),
(3364, 0, 'rgen_module', 'rgen_gridmanager', 'rg8pH', '{"common":{"title_status":false,"title":[],"gt":"gt40","top":{"status":false,"html":[]},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt0","margin_b":"mb0"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl12","desktop":" d-xl12","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"customize":{"block":[],"bg_img":[],"cssclass":""}},"items":[]},{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl12","desktop":" d-xl12","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"customize":{"block":[],"bg_img":[],"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"Home - Custom HTML 1","item_data":{"node_type":"block","setting":{"block_type":"mod","html":[],"mod_data":{"id":"101","store_id":"0","group":"rgen_module","section":"rgen_customhtml","key":"rgJ2g","value":{"common":{"hoverstyle":"1","title_status":true,"title":[null,"Easy to customize"],"gt":"gt40","top":{"status":true,"html":{"1":"Easy to customize"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":3,"html":[]},"middle":{"status":false,"size":6,"html":[]},"right":{"status":false,"size":3,"html":[]}},"data":["No node"],"name":"Home - Custom HTML 1"}},"cssclass":"","mod_setting":[]}},"items":[]}]},{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl12","desktop":" d-xl12","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"customize":{"block":[],"bg_img":[],"cssclass":""}},"items":[]}]}],"name":"Home - Custom section"}'),
(3365, 0, 'rgen_module', 'rgen_gridmanager_set', 'set_rgqxX', '{"data":[{"module_id":"rgf9A","layout_id":"9999","position":"rg_b_up","status":true,"sort_order":0,"container":"bx"}],"name":"Footer - custom"}'),
(3366, 0, 'rgen_module', 'rgen_gridmanager_set', 'set_rgEsM', '{"data":[{"module_id":"rg8pH","layout_id":"1","position":"rg_t_up","status":false,"sort_order":"3","container":"bx"}],"name":"Home - Custom section"}'),
(3461, 0, 'rgen_module', 'rgen_contentblocks_set', 'set_rg7DO', '{"data":[{"module_id":"rgtZs","layout_id":"2","position":"column_right","status":true,"sort_order":"1","container":"bx"}],"name":"Column - offer blocks"}'),
(3491, 0, 'rgen_module', 'rgen_menu_set', 'set_rgRiF', '{"data":[{"module_id":"rgvP4","layout_id":"9999","position":"main_menu","status":true,"sort_order":0,"type":"h","align":"center","menuwidth":"fw"}],"name":"Main menu"}'),
(3487, 0, 'rgen_module', 'rgen_menu', 'rgvP4', '{"data":[{"id":1,"depth":1,"status":true,"node_type":"main","node_title":"\\u9996\\u9875","submenu_type":"mega","item_data":{"node":"main","title":{"1":"\\u9996\\u9875"},"url":"","icon":{"status":false,"type":"ico","icon":"fa fa-chevron-up","size":"14px","color":"#ffffff","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","css":""},"icon_position":"l","icon_block":[],"css_class":"","label":{"status":false,"type":"txt","text":[],"image":"..\\/image\\/no_image.png","img_w":40,"background":"#000","text_color":"#fff","text_size":"12px","css_class":"","block":[],"top":-15,"left":0},"submenu_type":"mega","submenu_size":"sub-size4"},"items":[{"id":"1-1","depth":2,"status":true,"node_type":"row","node_title":"Row item","submenu_type":"mega","item_data":{"node":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}]},{"id":1,"depth":1,"status":true,"node_type":"main","node_title":"\\u54c1\\u724c","submenu_type":"mega","item_data":{"node":"main","title":{"1":"\\u54c1\\u724c"},"url":"","icon":{"status":false,"type":"ico","icon":"fa fa-chevron-up","size":"14px","color":"#ffffff","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","css":""},"icon_position":"l","icon_block":[],"css_class":"","label":{"status":false,"type":"txt","text":{"1":"zh-cn - No data"},"image":"..\\/image\\/no_image.png","img_w":40,"background":"#000","text_color":"#fff","text_size":"12px","css_class":"","block":[],"top":-15,"left":0},"submenu_type":"mega","submenu_size":"sub-size4"},"items":[{"id":"1-1","depth":2,"status":true,"node_type":"row","node_title":"Row item","submenu_type":"mega","item_data":{"node":"row","gutter":"gt20","margin_b":"mb20"},"items":[{"id":"1-1-1","depth":3,"status":true,"node_type":"col","node_title":"Column item","submenu_type":"mega","item_data":{"node":"col","col_size":"cl4","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl6","mob_xl":" m-xl6","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl6 m-xl6 m-sm12 m-xs12","border":[]},"items":[{"id":"1-1-1-1","depth":4,"status":true,"node_type":"item","node_title":"Menu item","submenu_type":"mega","item_data":{"node":"item","item_type":"normal","tab":{"status":false,"tab_style":"side"},"sub_item":{"title":[],"url":"normal url","win":"n","style":"normal"}},"items":[]},{"id":"1-1-1-2","depth":4,"status":true,"node_type":"item","node_title":"Menu item","submenu_type":"mega","item_data":{"node":"item","item_type":"normal","tab":{"status":false,"tab_style":"side"},"sub_item":{"title":[],"url":"normal url","win":"n","style":"normal"}},"items":[]}]},{"id":"1-1-1","depth":3,"status":true,"node_type":"col","node_title":"Column item","submenu_type":"mega","item_data":{"node":"col","col_size":"cl4","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl6","mob_xl":" m-xl6","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl6 m-xl6 m-sm12 m-xs12","border":[]},"items":[{"id":"1-1-1-1","depth":4,"status":true,"node_type":"item","node_title":"Menu item","submenu_type":"mega","item_data":{"node":"item","item_type":"normal","tab":{"status":false,"tab_style":"side"},"sub_item":{"title":[],"url":"normal url","win":"n","style":"normal"}},"items":[]}]}]}]},{"id":2,"depth":1,"status":true,"node_type":"main","node_title":"\\u7403\\u978b","submenu_type":"mega","item_data":{"node":"main","title":{"1":"\\u7403\\u978b"},"url":"","icon":{"status":false,"type":"ico","icon":"fa fa-chevron-up","size":"14px","color":"#ffffff","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","css":""},"icon_position":"l","icon_block":[],"css_class":"","label":{"status":false,"type":"txt","text":[],"image":"..\\/image\\/no_image.png","img_w":40,"background":"#000","text_color":"#fff","text_size":"12px","css_class":"","block":[],"top":-15,"left":0},"submenu_type":"mega","submenu_size":"sub-size4"},"items":[{"id":"2-1","depth":2,"status":true,"node_type":"row","node_title":"Row item","submenu_type":"mega","item_data":{"node":"row","gutter":"gt20","margin_b":"mb20"},"items":[{"id":"2-1-1","depth":3,"status":true,"node_type":"col","node_title":"Column item","submenu_type":"mega","item_data":{"node":"col","col_size":"cl4","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl6","mob_xl":" m-xl6","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl6 m-xl6 m-sm12 m-xs12","border":[]},"items":[{"id":"2-1-1-1","depth":4,"status":true,"node_type":"item","node_title":"Air Jordan","item_data":{"node":"item","item_type":"normal","tab":{"status":false,"tab_style":"side"},"sub_item":{"title":{"1":"Air Jordan"},"url":"normal url","win":"n","style":"normal","css":[]}},"items":[]}]}]}]},{"id":3,"depth":1,"status":true,"node_type":"main","node_title":"\\u670d\\u9970","submenu_type":"n","item_data":{"node":"main","title":{"1":"\\u670d\\u9970"},"url":"","icon":{"status":false,"type":"ico","icon":"fa fa-chevron-up","size":"14px","color":"#ffffff","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","css":""},"icon_position":"l","icon_block":[],"css_class":"","label":{"status":false,"type":"txt","text":[],"image":"..\\/image\\/no_image.png","img_w":40,"background":"#000","text_color":"#fff","text_size":"12px","css_class":"","block":[],"top":-15,"left":0},"submenu_type":"n","submenu_size":"sub-size4"},"items":[]},{"id":4,"depth":1,"status":true,"node_type":"main","node_title":"\\u914d\\u4ef6","submenu_type":"n","item_data":{"node":"main","title":{"1":"\\u914d\\u4ef6"},"url":"","icon":{"status":false,"type":"ico","icon":"fa fa-chevron-up","size":"14px","color":"#ffffff","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","css":""},"icon_position":"l","icon_block":[],"css_class":"","label":{"status":false,"type":"txt","text":[],"image":"..\\/image\\/no_image.png","img_w":40,"background":"#000","text_color":"#fff","text_size":"12px","css_class":"","block":[],"top":-15,"left":0},"submenu_type":"n","submenu_size":"sub-size4"},"items":[]},{"id":5,"depth":1,"status":true,"node_type":"main","node_title":"\\u7535\\u5b50\\u4ea7\\u54c1","submenu_type":"n","item_data":{"node":"main","title":{"1":"\\u7535\\u5b50\\u4ea7\\u54c1"},"url":"","icon":{"status":false,"type":"ico","icon":"fa fa-chevron-up","size":"14px","color":"#ffffff","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","css":""},"icon_position":"l","icon_block":[],"css_class":"","label":{"status":false,"type":"txt","text":[],"image":"..\\/image\\/no_image.png","img_w":40,"background":"#000","text_color":"#fff","text_size":"12px","css_class":"","block":[],"top":-15,"left":0},"submenu_type":"n","submenu_size":"sub-size4"},"items":[]},{"id":6,"depth":1,"status":true,"node_type":"main","node_title":"Real \\u5b9e\\u6d4b","submenu_type":"n","item_data":{"node":"main","title":{"1":"Real \\u5b9e\\u6d4b"},"url":"","icon":{"status":false,"type":"ico","icon":"fa fa-chevron-up","size":"14px","color":"#ffffff","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","css":""},"icon_position":"l","icon_block":[],"css_class":"","label":{"status":false,"type":"txt","text":[],"image":"..\\/image\\/no_image.png","img_w":40,"background":"#000","text_color":"#fff","text_size":"12px","css_class":"","block":[],"top":-15,"left":0},"submenu_type":"n","submenu_size":"sub-size4"},"items":[]},{"id":7,"depth":1,"status":true,"node_type":"main","node_title":"Real \\u5feb\\u62a5","submenu_type":"n","item_data":{"node":"main","title":{"1":"Real \\u5feb\\u62a5"},"url":"","icon":{"status":false,"type":"ico","icon":"fa fa-chevron-up","size":"14px","color":"#ffffff","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","css":""},"icon_position":"l","icon_block":[],"css_class":"","label":{"status":false,"type":"txt","text":[],"image":"..\\/image\\/no_image.png","img_w":40,"background":"#000","text_color":"#fff","text_size":"12px","css_class":"","block":[],"top":-15,"left":0},"submenu_type":"n","submenu_size":"sub-size4"},"items":[]},{"id":8,"depth":1,"status":true,"node_type":"main","node_title":"Real Buyer","submenu_type":"n","item_data":{"node":"main","title":{"1":"Real Buyer"},"url":"","icon":{"status":false,"type":"ico","icon":"fa fa-chevron-up","size":"14px","color":"#ffffff","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","css":""},"icon_position":"l","icon_block":[],"css_class":"","label":{"status":false,"type":"txt","text":[],"image":"..\\/image\\/no_image.png","img_w":40,"background":"#000","text_color":"#fff","text_size":"12px","css_class":"","block":[],"top":-15,"left":0},"submenu_type":"n","submenu_size":"sub-size4"},"items":[]}],"name":"Main menu"}'),
(3362, 0, 'rgen_module', 'rgen_gridmanager', 'rgf9A', '{"common":{"title_status":false,"title":[],"gt":"gt40","top":{"status":false,"html":[]},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb0"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl9","desktop":" d-xl9","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl9 d-xl9 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"customize":{"block":[],"bg_img":[],"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"Footer - custom","item_data":{"node_type":"block","setting":{"block_type":"mod","html":[],"mod_data":{"id":"152","store_id":"0","group":"rgen_module","section":"rgen_contentblocks","key":"rg5H1","value":{"common":{"title_status":false,"title":[],"gt":"gt40","top":{"status":false,"html":[]},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt40","margin_b":"mb20"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl4","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl4 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"view":"grid","grids":{"lg_desktop":"eq1","desktop":"d-eq1","tablet":"t-eq1","mob_xl":"mxl-eq1","mob_sm":"msm-eq1","mob_xs":"mxs-eq1","gutter":"gt0","margin_b":"mb20","classGroup":" eq1 d-eq1 t-eq1 mxl-eq1 msm-eq1 mxs-eq1 gt0 mb20"},"carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false},"title":{"status":true,"text":{"1":"Contact Information"},"block":[]},"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"Address","item_data":{"node_type":"block","content":{"title":{"1":"Address:"},"img_alt":{"1":"en - No data"},"description":{"1":"123 Street Name, City, London."},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"40","img_block_gt":10,"img_block_t":0,"title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"glyphicon glyphicon-map-marker","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Phone","item_data":{"node_type":"block","content":{"title":{"1":"Phone:"},"img_alt":{"1":"en - No data"},"description":{"1":"(123) 456-7890"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"40","img_block_gt":10,"img_block_t":0,"title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-phone","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Email","item_data":{"node_type":"block","content":{"title":{"1":"Email:"},"img_alt":{"1":"en - No data"},"description":{"1":"<a href=\\"mailto: mail@example.com\\">mail@example.com<\\/a>"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"40","img_block_gt":10,"img_block_t":0,"title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-envelope","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Working Days\\/Hours","item_data":{"node_type":"block","content":{"title":{"1":"Working Days \\/ Hours:"},"img_alt":{"1":"en - No data"},"description":{"1":"Mon - Sun \\/ 9:00AM - 8:00PM"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"40","img_block_gt":10,"img_block_t":0,"title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-clock-o","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]}]},{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl4","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl4 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"view":"grid","grids":{"lg_desktop":"eq1","desktop":"d-eq1","tablet":"t-eq1","mob_xl":"mxl-eq1","mob_sm":"msm-eq1","mob_xs":"mxs-eq1","gutter":"gt0","margin_b":"mb4","classGroup":" eq1 d-eq1 t-eq1 mxl-eq1 msm-eq1 mxs-eq1 gt0 mb4"},"carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false},"title":{"status":true,"text":{"1":"Theme features"},"block":[]},"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"Advanced Grid manager","item_data":{"node_type":"block","content":{"title":{"1":"Advanced Grid manager"},"img_alt":{"1":"en - No data"},"description":{"1":""},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"20px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); font-size: 20px; text-align: center; width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"SEO Image gallery","item_data":{"node_type":"block","content":{"title":{"1":"SEO Image gallery"},"img_alt":{"1":"en - No data"},"description":{"1":""},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"20px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); font-size: 20px; text-align: center; width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Advanced styling options","item_data":{"node_type":"block","content":{"title":{"1":"Advanced styling options"},"img_alt":{"1":"en - No data"},"description":{"1":""},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"20px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); font-size: 20px; text-align: center; width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Mega menu module","item_data":{"node_type":"block","content":{"title":{"1":"Mega menu module"},"img_alt":{"1":"en - No data"},"description":{"1":"en - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"20px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); font-size: 20px; text-align: center; width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Custom positions","item_data":{"node_type":"block","content":{"title":{"1":"Custom positions"},"img_alt":{"1":"en - No data"},"description":{"1":"en - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"20px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); font-size: 20px; text-align: center; width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Product groups","item_data":{"node_type":"block","content":{"title":{"1":"Product groups"},"img_alt":{"1":"en - No data"},"description":{"1":"en - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"20px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); font-size: 20px; text-align: center; width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":true,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Revolution Slider OpenCart","item_data":{"node_type":"block","content":{"title":{"1":"Revolution Slider OpenCart"},"img_alt":{"1":"en - No data"},"description":{"1":"en - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"20px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); font-size: 20px; text-align: center; width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Try out demo admin","item_data":{"node_type":"block","content":{"title":{"1":"Try out demo admin"},"img_alt":{"1":"en - No data"},"description":{"1":"en - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-arrow-circle-right","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"20px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); font-size: 20px; text-align: center; width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":true,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]}]},{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl4","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl4 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"view":"grid","grids":{"lg_desktop":"eq1","desktop":"d-eq1","tablet":"t-eq1","mob_xl":"mxl-eq1","mob_sm":"msm-eq1","mob_xs":"mxs-eq1","gutter":"gt0","margin_b":"mb0","classGroup":" eq1 d-eq1 t-eq1 mxl-eq1 msm-eq1 mxs-eq1 gt0 mb0"},"carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false},"title":{"status":true,"text":{"1":"About us"},"block":[]},"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"About us","item_data":{"node_type":"block","content":{"title":{"1":"en - No data"},"img_alt":{"1":"en - No data"},"description":{"1":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent condimentum ligula in felis blandit eleifend. Aliquam erat volutpat. Aenean tempor lectus ut augue bibendum consequat. Morbi vitae ex malesuada, laoreet sem eu, ullamcorper arcu. Fusce nunc erat, gravida et massa a, interdum congue eros. Sed in ornare nisl. Donec nec purus non elit maximus convallis. Vestibulum a gravida eros. Nulla ac lacus nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus"},"btn_text":{"1":"en - No data"}},"setting":{"style":"1","title_pos":"above","img_pos":"l","img_block_w":85,"img_block_gt":15,"img_block_t":0,"title_status":false,"description_status":true,"btn_status":false,"image_status":false,"btn_style":"lnk","img_type":"img","icon":[],"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"","win":false,"img_link":false,"title_link":false,"full_link":false,"cssclass":""}},"items":[]}]}]}],"name":"Footer - custom"}},"cssclass":"","mod_setting":[]}},"items":[]}]},{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl3","desktop":" d-xl3","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl3 d-xl3 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"customize":{"block":[],"bg_img":[],"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"Footer - image gallery","item_data":{"node_type":"block","setting":{"block_type":"mod","html":[],"mod_data":{"id":"2914","store_id":"0","group":"rgen_module","section":"rgen_imagegallery","key":"rgO2R","value":{"common":{"title_status":true,"title":{"1":"Image gallery"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl12","desktop":" d-xl12","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl12 d-xl12 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"zoon_icon":{"icon":"fa fa-plus"},"url_icon":{"icon":"fa fa-link"},"view":"grid","grids":{"lg_desktop":"eq3","desktop":"d-eq3","tablet":"t-eq3","mob_xl":"mxl-eq3","mob_sm":"msm-eq3","mob_xs":"mxs-eq3","gutter":"gt10","margin_b":"mb10","classGroup":" eq3 d-eq3 t-eq3 mxl-eq3 msm-eq3 mxs-eq3 gt10 mb10"},"gt":10,"base_size":97,"image_w":"150","image_h":"150","resize_type":"fill","carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false}}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":false,"popup_status":true,"description_status":false,"image":{"img":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/gallery\\/01.jpg","alt":{"1":"R.Gen - OpenCart Modern Store Design"},"url":"","win":false},"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":true,"popup_status":true,"description_status":true,"image":{"img":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/gallery\\/02.jpg","alt":{"1":"R.Gen - OpenCart Modern Store Design"},"url":"","win":false},"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":true,"popup_status":true,"description_status":true,"image":{"img":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/gallery\\/04.jpg","alt":{"1":"R.Gen - OpenCart Modern Store Design"},"url":"","win":false},"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":true,"popup_status":true,"description_status":true,"image":{"img":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/gallery\\/06.jpg","alt":{"1":"R.Gen - OpenCart Modern Store Design"},"url":"","win":false},"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":true,"popup_status":true,"description_status":true,"image":{"img":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/gallery\\/07.jpg","alt":{"1":"R.Gen - OpenCart Modern Store Design"},"url":"","win":false},"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Block","item_data":{"node_type":"block","content":{"title":{"1":"R.Gen - OpenCart Modern Store Design"},"description":{"1":"R.Gen - OpenCart Modern Store Design"},"img_alt":[],"btn_text":[]},"setting":{"w":3,"h":3,"title_status":true,"popup_status":true,"description_status":true,"image":{"img":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/gallery\\/09.jpg","alt":{"1":"R.Gen - OpenCart Modern Store Design"},"url":"","win":false},"cssclass":""}},"items":[]}]}]}],"name":"Footer - image gallery"}},"cssclass":"","mod_setting":[]}},"items":[]}]}]}],"name":"Footer - custom"}');
INSERT INTO `mcc_rgen_modules` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(3361, 0, 'rgen_module', 'rgen_gridmanager', 'rgpFy', '{"common":{"title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":false,"html":{"1":"<a href=\\"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS\\" target=\\"_blank\\" style=\\"    display: inline-block;\\"><img src=\\"image\\/catalog\\/rgen\\/demo06_images\\/other\\/great-deals.png\\" class=\\"img-responsive\\"><\\/a>"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt10","margin_b":"mb10"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"customize":{"block":[],"bg_img":[],"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"\\u9996\\u98751","item_data":{"node_type":"block","setting":{"block_type":"mod","html":[],"mod_data":{"id":"1977","store_id":"0","group":"rgen_module","section":"rgen_basicslideshow","key":"rgyqo","value":{"common":{"effect":"random","speed":"1000","auto":false,"pause":2000,"continuous":false,"stoponhover":false,"pager":false,"arrows":false},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"zh-cn - No data"},"slide":"..\\/image\\/catalog\\/SOPHNET_SW16_DT.jpg","url":"","win":false}}],"name":"\\u9996\\u98751"}},"cssclass":"","mod_setting":{"w":"376","h":"510","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}}},"items":[]}]},{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"customize":{"block":[],"bg_img":[],"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"\\u9996\\u98752","item_data":{"node_type":"block","setting":{"block_type":"mod","html":[],"mod_data":{"id":"1963","store_id":"0","group":"rgen_module","section":"rgen_basicslideshow","key":"rgtvc","value":{"common":{"effect":"random","speed":"1000","auto":true,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":[],"slide":"..\\/image\\/no_image.jpg","url":"","win":false}}],"name":"\\u9996\\u98752"}},"cssclass":"","mod_setting":{"w":"376","h":"510","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}}},"items":[]}]},{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl12","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl12 m-xl12 m-sm12 m-xs12","border":[]},"customize":{"block":[],"bg_img":[],"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"\\u9996\\u98753","item_data":{"node_type":"block","setting":{"block_type":"mod","html":[],"mod_data":{"id":"1964","store_id":"0","group":"rgen_module","section":"rgen_basicslideshow","key":"rg0oJ","value":{"common":{"effect":"random","speed":"1000","auto":true,"pause":2000,"continuous":true,"stoponhover":true,"pager":true,"arrows":true},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":[],"slide":"..\\/image\\/no_image.jpg","url":"","win":false}}],"name":"\\u9996\\u98753"}},"cssclass":"","mod_setting":{"w":"376","h":"510","sizetype":"normal","beside":false,"beside_size":4,"beside_gt":"gt10"}}},"items":[]}]}]}],"name":"Home - Deals for every one"}'),
(3376, 0, 'rgen_module', 'rgen_catshowcase', 'rgdbY', '{"common":{"title_status":true,"title":{"1":"Shop by category"},"gt":"gt40","top":{"status":true,"html":{"1":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr<br>\\nsed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat."}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}],"name":"Category showcase 01"}'),
(3490, 0, 'rgen_module', 'rgen_productgroups', 'rgJkT', '{"common":{"hoverstyle":"1","title_status":false,"title":[],"gt":"gt40","top":{"status":false,"html":[]},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"custom","node_title":"Item","item_data":{"node_type":"custom","content":{"title_status":false,"title":{"1":"zh-cn - No data"}},"setting":{"products":[{"id":"42","name":"\\u5305\\u5f0f\\u5ea7\\u6905"},{"id":"47","name":"\\u6728\\u827a\\u8bbe\\u8ba1"},{"id":"46","name":"\\u590d\\u53e4\\u9542\\u7a7a\\u5c55\\u53a8"},{"id":"48","name":"\\u83b2\\u5f0f\\u6728\\u51e0"},{"id":"49","name":"\\u7f18\\u6728\\u7acb\\u67dc"},{"id":"45","name":"\\u65f6\\u5c1a\\u50a8\\u7269\\u67dc"},{"id":"36","name":"\\u65f6\\u5c1a\\u7b80\\u7ea6\\u529e\\u516c\\u5c0f\\u684c"}],"prd_style":"prd1","prd_view":"grid","prd_limit":15,"image_w":250,"image_h":250,"grids":{"lg_desktop":"eq5","desktop":"d-eq5","tablet":"t-eq8","mob_xl":"mxl-eq4","mob_sm":"msm-eq4","mob_xs":"mxs-eq1","gutter":"gt20","margin_b":"mb20","classGroup":" eq5 d-eq5 t-eq8 mxl-eq4 msm-eq4 mxs-eq1 gt20 mb20"},"counter":false,"h_counter":false,"carousel":{"margin":20,"display":4,"display_items":[],"arrows":false,"dots":false},"cssclass":""}}}],"name":"\\u4eba\\u6c14\\u7cbe\\u9009"}'),
(3342, 0, 'rgen_module', 'rgen_productgroups_set', 'set_rglnV', '{"data":[{"module_id":"rgJkT","layout_id":"1","position":"rg_t_up","status":true,"sort_order":"6","viewtype":"normal","container":"bx"}],"name":"\\u4eba\\u6c14\\u7cbe\\u9009"}'),
(3343, 0, 'rgen_module', 'rgen_productgroups_set', 'set_rgUkB', '{"data":[{"module_id":"rgj9L","layout_id":"1","position":"rg_t_up","status":true,"sort_order":"3","viewtype":"normal","container":"fw"}],"name":"\\u6700\\u65b0\\u4e0a\\u67b6"}'),
(3359, 0, 'rgen_module', 'rgen_revslider', 'rgrVA', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":["No node"],"name":"Home - Main slider"}'),
(3493, 0, 'rgen_module', 'rgen_revslider_set', 'set_rgixj', '{"data":[{"module_id":"rgrVA","layout_id":"1","position":"pos_ss","status":true,"sort_order":0,"container":"fw","slider_size":"normal","slider_id":"1","slider_data":{"title":"demo-01-home-slideshow-pagefull","alias":"demo-01-home-slideshow-pagefull","id":"1","params":{"0":"Execute settings on all slides","title":"demo-01-home-slideshow-pagefull","alias":"demo-01-home-slideshow-pagefull","source_type":"gallery","post_types":"product","post_category":"category_20","post_sortby":"ID","prd_img_width":"880","prd_img_height":"345","posts_sort_direction":"DESC","max_slider_posts":"30","excerpt_limit":"55","slider_template_id":"","posts_list":"","slider_type":"fullwidth","fullscreen_offset_container":"","fullscreen_offset_size":"","fullscreen_min_height":"","full_screen_align_force":"off","auto_height":"off","force_full_width":"off","min_height":"0","width":"1320","height":"380","responsitive_w1":"940","responsitive_sw1":"770","responsitive_w2":"780","responsitive_sw2":"500","responsitive_w3":"510","responsitive_sw3":"310","responsitive_w4":"0","responsitive_sw4":"0","responsitive_w5":"0","responsitive_sw5":"0","responsitive_w6":"0","responsitive_sw6":"0","delay":"9000","shuffle":"off","lazy_load":"off","use_wpml":"off","enable_static_layers":"off","next_slide_on_window_focus":"off","simplify_ie8_ios4":"off","stop_slider":"off","stop_after_loops":0,"stop_at_slide":2,"show_timerbar":"top","loop_slide":"loop","position":"center","margin_top":0,"margin_bottom":0,"margin_left":0,"margin_right":0,"shadow_type":"0","padding":0,"background_color":"#E9E9E9","background_dotted_overlay":"none","show_background_image":"false","background_image":"http:\\/\\/127.0.0.1:90\\/","bg_fit":"cover","bg_repeat":"no-repeat","bg_position":"center top","stop_on_hover":"on","keyboard_navigation":"off","navigation_style":"preview4","navigaion_type":"bullet","navigation_arrows":"solo","navigaion_always_on":"false","hide_thumbs":200,"navigaion_align_hor":"center","navigaion_align_vert":"bottom","navigaion_offset_hor":"0","navigaion_offset_vert":20,"leftarrow_align_hor":"left","leftarrow_align_vert":"center","leftarrow_offset_hor":20,"leftarrow_offset_vert":0,"rightarrow_align_hor":"right","rightarrow_align_vert":"center","rightarrow_offset_hor":20,"rightarrow_offset_vert":0,"thumb_width":100,"thumb_height":50,"thumb_amount":5,"use_spinner":"0","spinner_color":"#FFFFFF","use_parallax":"off","disable_parallax_mobile":"off","parallax_type":"mouse","parallax_bg_freeze":"off","parallax_level_1":"5","parallax_level_2":"10","parallax_level_3":"15","parallax_level_4":"20","parallax_level_5":"25","parallax_level_6":"30","parallax_level_7":"35","parallax_level_8":"40","parallax_level_9":"45","parallax_level_10":"50","touchenabled":"on","swipe_velocity":75,"swipe_min_touches":1,"drag_block_vertical":"false","disable_on_mobile":"off","disable_kenburns_on_mobile":"off","hide_slider_under":0,"hide_defined_layers_under":0,"hide_all_layers_under":0,"hide_arrows_on_mobile":"off","hide_bullets_on_mobile":"off","hide_thumbs_on_mobile":"off","hide_thumbs_under_resolution":0,"hide_thumbs_delay_mobile":1500,"start_with_slide":"1","first_transition_active":"false","first_transition_type":"fade","first_transition_duration":300,"first_transition_slot_amount":7,"reset_transitions":"","reset_transition_duration":0,"jquery_noconflict":"off","js_to_body":"false","output_type":"none","custom_css":"","custom_javascript":"","template":"false"}}}],"name":"Home - Main slider"}'),
(3347, 0, 'rgen_module', 'rgen_customhtml', 'rgu9C', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":true,"size":9,"html":{"1":"<h2 class=\\"h2\\" style=\\"font-size: 35px; font-weight:300;\\"><\\/h2>\\n\\n<p style=\\"font-family: Roboto; font-weight: 300; color: rgba(255, 255, 255, 0.5); font-size:20px;\\"><\\/p>"}},"middle":{"status":false,"size":6,"html":[]},"right":{"status":true,"size":6,"html":{"1":"<a href=\\"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS\\"  style=\\"display:block;margin: 35px 0 0 0; font-size: 18px; font-weight: 300; padding: 15px;\\"><\\/a>"}}},"data":["No node"],"name":"renqijingxuan"}'),
(3348, 0, 'rgen_module', 'rgen_customhtml_set', 'set_rgGx4', '{"data":[{"module_id":"rgu9C","layout_id":"1","position":"rg_t_up","status":true,"sort_order":"5","container":"fw"}],"name":"\\u4eba\\u6c14\\u7cbe\\u9009"}'),
(3349, 0, 'rgen_module', 'rgen_customhtml', 'rgu2K', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":true,"size":9,"html":{"1":"<h2 class=\\"h2\\" style=\\"font-size: 35px; font-weight:300;\\"><\\/h2>\\n\\n<p style=\\"font-family: Roboto; font-weight: 300; color: rgba(255, 255, 255, 0.5); font-size:20px;\\"><\\/p>"}},"middle":{"status":false,"size":6,"html":[]},"right":{"status":true,"size":6,"html":{"1":"<a href=\\"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS\\"  style=\\"display:block;margin: 35px 0 0 0; font-size: 18px; font-weight: 300; padding: 15px;\\"><\\/a>"}}},"data":["No node"],"name":"zuixinshangjia"}'),
(3350, 0, 'rgen_module', 'rgen_customhtml_set', 'set_rgai9', '{"data":[{"module_id":"rgu2K","layout_id":"1","position":"rg_t_up","status":true,"sort_order":"2","container":"fw"}],"name":"\\u6700\\u65b0\\u4e0a\\u67b6"}'),
(3377, 0, 'rgen_module', 'rgen_deals', 'rgzUQ', '{"common":{"title_status":false,"title":{"1":"en - No data"},"gt":"gt0","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":{"1":"en - No data"}},"left":{"status":false,"size":4,"html":{"1":"en - No data"}},"right":{"status":false,"size":4,"html":{"1":"en - No data"}}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}],"name":"Deals showcase 01"}'),
(3378, 0, 'rgen_module', 'rgen_contentslider', 'rg1MQ', '{"common":{"title_status":false,"title":{"1":"Theme features"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}],"name":"Content slider 01"}'),
(3413, 0, 'rgen_module', 'rgen_contentblocks', 'rg5H1', '{"common":{"title_status":false,"top":{"status":false,"html":[]},"title":[],"gt":"gt40","bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt30","margin_b":"mb0"},"items":[{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl4","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl4 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"view":"grid","grids":{"lg_desktop":"eq1","desktop":"d-eq1","tablet":"t-eq1","mob_xl":"mxl-eq1","mob_sm":"msm-eq1","mob_xs":"mxs-eq1","gutter":"gt0","margin_b":"mb20","classGroup":" eq1 d-eq1 t-eq1 mxl-eq1 msm-eq1 mxs-eq1 gt0 mb20"},"carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false},"title":{"status":true,"text":{"1":"Contact Information"},"block":[]},"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"Address","item_data":{"node_type":"block","content":{"title":{"1":"Address:"},"img_alt":{"1":"en - No data"},"description":{"1":"123 Street Name, City, London."},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"40","img_block_gt":10,"img_block_t":"-2","title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"glyphicon glyphicon-map-marker","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Phone","item_data":{"node_type":"block","content":{"title":{"1":"Phone:"},"img_alt":{"1":"en - No data"},"description":{"1":"(123) 456-7890"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"40","img_block_gt":10,"img_block_t":"-2","title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-phone","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Email","item_data":{"node_type":"block","content":{"title":{"1":"Email:"},"img_alt":{"1":"en - No data"},"description":{"1":"<a href=\\"mailto: mail@example.com\\">mail@example.com<\\/a>"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"40","img_block_gt":10,"img_block_t":"-2","title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-envelope","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"Working Days\\/Hours","item_data":{"node_type":"block","content":{"title":{"1":"Working Days \\/ Hours:"},"img_alt":{"1":"en - No data"},"description":{"1":"Mon - Sun \\/ 9:00AM - 8:00PM"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"40","img_block_gt":10,"img_block_t":"-2","title_status":true,"description_status":true,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-clock-o","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]}]},{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl4","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl4 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"view":"grid","grids":{"lg_desktop":"eq1","desktop":"d-eq1","tablet":"t-eq1","mob_xl":"mxl-eq1","mob_sm":"msm-eq1","mob_xs":"mxs-eq1","gutter":"gt0","margin_b":"mb0","classGroup":" eq1 d-eq1 t-eq1 mxl-eq1 msm-eq1 mxs-eq1 gt0 mb0"},"carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false},"title":{"status":true,"text":{"1":"\\u5173\\u4e8e\\u6211\\u4eec"},"block":[]},"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"\\u5e2e\\u52a9","item_data":{"node_type":"block","content":{"title":{"1":"\\u5e2e\\u52a9"},"img_alt":{"1":"zh-cn - No data"},"description":{"1":"zh-cn - No data"},"btn_text":{"1":"zh-cn - No data"}},"setting":{"style":"1","title_pos":"above","img_pos":"r","img_block_w":"40","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":false,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-ban","size":"14px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 14px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":true,"url":"","win":true,"img_link":false,"title_link":true,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"\\u62db\\u8058\\u5408\\u4f5c","item_data":{"node_type":"block","content":{"title":{"1":"\\u62db\\u8058\\u5408\\u4f5c"},"img_alt":{"1":"zh-cn - No data"},"description":{"1":"zh-cn - No data"},"btn_text":{"1":"zh-cn - No data"}},"setting":{"style":"1","title_pos":"above","img_pos":"r","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":false,"btn_style":"lnk","img_type":"ico","icon":[],"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":true,"url":"","win":true,"img_link":false,"title_link":true,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"\\u653f\\u7b56\\u9690\\u79c1","item_data":{"node_type":"block","content":{"title":{"1":"\\u653f\\u7b56\\u9690\\u79c1"},"img_alt":{"1":"zh-cn - No data"},"description":{"1":"zh-cn - No data"},"btn_text":{"1":"zh-cn - No data"}},"setting":{"style":"1","title_pos":"above","img_pos":"r","img_block_w":"40","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":false,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-bank","size":"14px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 14px;"},"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":true,"url":"","win":true,"img_link":false,"title_link":true,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"\\u4f7f\\u7528\\u8bf4\\u660e","item_data":{"node_type":"block","content":{"title":{"1":"\\u4f7f\\u7528\\u8bf4\\u660e"},"img_alt":{"1":"zh-cn - No data"},"description":{"1":"zh-cn - No data"},"btn_text":{"1":"zh-cn - No data"}},"setting":{"style":"1","title_pos":"above","img_pos":"r","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":false,"btn_style":"lnk","img_type":"ico","icon":[],"icon_block":[],"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":true,"url":"http:\\/\\/127.0.0.1\\/realchao\\/index.php?route=information\\/information&information_id=5","win":true,"img_link":false,"title_link":true,"full_link":true,"cssclass":""}},"items":[]}]},{"depth":2,"status":true,"node_type":"col","node_title":"Column","item_data":{"node_type":"col","column":{"col_size":"cl12","lg_desktop":"cl4","desktop":" d-xl4","tablet":" t-xl4","mob_xl":" m-xl12","mob_sm":" m-sm12","mob_xs":" m-xs12","classGroup":"cl4 d-xl4 t-xl4 m-xl12 m-sm12 m-xs12","border":[]},"content_view":{"view":"grid","grids":{"lg_desktop":"eq1","desktop":"d-eq1","tablet":"t-eq1","mob_xl":"mxl-eq1","mob_sm":"msm-eq1","mob_xs":"mxs-eq1","gutter":"gt0","margin_b":"mb4","classGroup":" eq1 d-eq1 t-eq1 mxl-eq1 msm-eq1 mxs-eq1 gt0 mb4"},"carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false},"title":{"status":true,"text":{"1":"Realchao"},"block":[]},"cssclass":""}},"items":[{"depth":3,"status":true,"node_type":"block","node_title":"\\u62d2\\u7edd\\u5047\\u5192","item_data":{"node_type":"block","content":{"title":{"1":"\\u62d2\\u7edd\\u5047\\u5192"},"img_alt":{"1":"en - No data"},"description":{"1":"zh-cn - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"glyphicon glyphicon-remove","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"rgb(239, 49, 49)","f_size":"20px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); color: rgb(239, 49, 49); font-size: 20px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"\\u4e13\\u4e1a\\u5168\\u9762","item_data":{"node_type":"block","content":{"title":{"1":"\\u4e13\\u4e1a\\u5168\\u9762"},"img_alt":{"1":"en - No data"},"description":{"1":"zh-cn - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"rgb(23, 212, 0)","f_size":"20px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); color: rgb(23, 212, 0); font-size: 20px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"\\u9876\\u5c16\\u6f6e\\u8d27","item_data":{"node_type":"block","content":{"title":{"1":"\\u9876\\u5c16\\u6f6e\\u8d27"},"img_alt":{"1":"en - No data"},"description":{"1":"zh-cn - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"rgb(23, 212, 0)","f_size":"20px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); color: rgb(23, 212, 0); font-size: 20px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"\\u5feb\\u901f\\u53d1\\u8d27","item_data":{"node_type":"block","content":{"title":{"1":"\\u5feb\\u901f\\u53d1\\u8d27"},"img_alt":{"1":"en - No data"},"description":{"1":"en - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"rgb(23, 212, 0)","f_size":"20px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); color: rgb(23, 212, 0); font-size: 20px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]},{"depth":3,"status":true,"node_type":"block","node_title":"\\u63d0\\u4f9b\\u9274\\u5b9a","item_data":{"node_type":"block","content":{"title":{"1":"\\u63d0\\u4f9b\\u9274\\u5b9a"},"img_alt":{"1":"en - No data"},"description":{"1":"en - No data"},"btn_text":{"1":"en - No data"}},"setting":{"style":"_small2","title_pos":"above","img_pos":"l","img_block_w":"25","img_block_gt":10,"img_block_t":"-6","title_status":true,"description_status":false,"btn_status":false,"image_status":true,"btn_style":"lnk","img_type":"ico","icon":{"status":true,"type":"ico","icon":"fa fa-check","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"icon_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"rgb(23, 212, 0)","f_size":"20px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"25","h":"25","css":"background-color: rgba(255, 255, 255, 0); color: rgb(23, 212, 0); font-size: 20px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;width:25px;height:25px;"},"image":"..\\/image\\/no_image.jpg","image_w":250,"image_h":250,"resize_type":"fill","url_status":false,"url":"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS","win":true,"img_link":false,"title_link":false,"full_link":true,"cssclass":""}},"items":[]}]}]}],"name":"Footer - custom"}'),
(3370, 0, 'rgen_module', 'rgen_prdpghtml', 'rgFot', '{"common":{"title_status":false,"top":{"status":true,"html":{"1":"<h2 class=\\"h2\\">Custom HTML below main image<\\/h2>\\n\\n<a href=\\"http:\\/\\/themeforest.net\\/item\\/rgen-opencart-modern-store-design\\/2699592?ref=R_GENESIS\\" target=\\"_blank\\"><img src=\\"image\\/catalog\\/rgen\\/demo06_images\\/other\\/445x200.jpg\\" class=\\"img-responsive\\"><\\/a>\\n<br>\\n<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.<\\/p>"}},"hoverstyle":"1","title":[],"gt":"gt40","bottom":{"status":false,"html":[]},"left":{"status":false,"size":3,"html":[]},"middle":{"status":false,"size":6,"html":[]},"right":{"status":false,"size":3,"html":[]}},"data":["No node"],"name":"Below main image"}'),
(3367, 0, 'rgen_module', 'rgen_prdpghtml_set', 'set_rgDGm', '{"data":[{"module_id":"rgFot","layout_id":"2","position":"pdpg_bimg","status":true,"sort_order":0,"container":"bx","prd_page":"selected","products":[{"id":"42","name":"Apple Cinema 30\\""}]}],"name":"Below main image"}'),
(3368, 0, 'rgen_module', 'rgen_prdpghtml', 'rgraI', '{"common":{"top":{"status":true,"html":{"1":"FREE Home delivery on orders above *$150.<br>\\n<span style=\\"font-size: 12px;\\">* Conditions apply<\\/span>\\n\\n<!--<img src=\\"image\\/catalog\\/rgen\\/demo06_images\\/product\\/free-delivery.png\\" class=\\"img-responsive\\" alt=\\"free-delivery\\">-->"}},"hoverstyle":"1","title_status":true,"title":{"1":"Custom HTML content"},"gt":"gt40","bottom":{"status":false,"html":[]},"left":{"status":false,"size":3,"html":[]},"middle":{"status":false,"size":6,"html":[]},"right":{"status":false,"size":3,"html":[]}},"data":["No node"],"name":"Custom HTML content"}'),
(3369, 0, 'rgen_module', 'rgen_prdpghtml_set', 'set_rgvYr', '{"data":[{"module_id":"rgraI","layout_id":"2","position":"pdpg_toption","status":true,"sort_order":0,"container":"bx","prd_page":"all","products":[]}],"name":"Custom HTML content"}'),
(3331, 0, 'rgen_module', 'rgen_basicslideshow_set', 'set_rgYlC', '{"data":[{"module_id":"rgfTN","layout_id":"1","position":"pos_ss","status":false,"sort_order":0,"w":"1800","h":"600","sizetype":"pfw","beside":false,"beside_size":4,"beside_gt":"gt10"}],"name":"Basic slideshow 01"}'),
(3326, 0, 'rgen_module', 'rgen_basicslideshow', 'rgyqo', '{"common":{"effect":"random","speed":"1000","auto":false,"pause":2000,"continuous":false,"stoponhover":false,"pager":false,"arrows":false},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"zh-cn - No data"},"slide":"..\\/image\\/catalog\\/SOPHNET_SW16_DT.jpg","url":"","win":false}}],"name":"\\u9996\\u98751"}'),
(3327, 0, 'rgen_module', 'rgen_basicslideshow', 'rgtvc', '{"common":{"auto":false,"continuous":false,"stoponhover":false,"pager":false,"arrows":false,"effect":"random","speed":"1000","pause":2000},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"zh-cn - No data"},"slide":"..\\/image\\/catalog\\/COMMONPROJECTS_RESTOCK_DT.jpg","url":"","win":false}}],"name":"\\u9996\\u98752"}'),
(3328, 0, 'rgen_module', 'rgen_basicslideshow', 'rg0oJ', '{"common":{"auto":false,"continuous":false,"stoponhover":false,"pager":false,"arrows":false,"effect":"random","speed":"1000","pause":2000},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"title":{"1":"zh-cn - No data"},"slide":"..\\/image\\/catalog\\/APC_Lower-Block_2016.jpg","url":"","win":false}}],"name":"\\u9996\\u98753"}'),
(3431, 0, 'rgen_module', 'rgen_prdpgtabs', 'rgMSC', '{"data":[{"depth":1,"status":true,"node_type":"block","node_title":"Custom Tab 1","item_data":{"node_type":"block","content":{"title":{"1":"Custom Tab 1"},"description":{"1":"<h3 class=\\"h3\\">This is product specific custom tab which display only on selected product<\\/h3>\\n\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec sem lobortis, porta orci eget, tempus elit. In hac habitasse platea dictumst. Aenean hendrerit neque euismod leo commodo tempor. Integer laoreet leo diam, et congue dui aliquet ac. Phasellus id aliquet velit, et vehicula magna. Maecenas elementum metus velit, vel congue tortor tristique et. Phasellus in turpis rutrum, pretium augue nec, venenatis nibh. Praesent congue, arcu vitae euismod ornare, felis nulla malesuada magna, non tristique libero mi in lectus. Praesent maximus lorem et elit bibendum, sed convallis lorem ultrices. In at nunc vitae diam varius interdum ut nec lorem. Nullam tempus diam et nibh condimentum, eu varius nunc finibus. Donec blandit ornare enim sed egestas. Donec lacus nisl, pretium at arcu ut, commodo ultrices ipsum. Ut sit amet mattis arcu.<\\/p>\\n\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec sem lobortis, porta orci eget, tempus elit. In hac habitasse platea dictumst. Aenean hendrerit neque euismod leo commodo tempor. Integer laoreet leo diam, et congue dui aliquet ac. Phasellus id aliquet velit, et vehicula magna. Maecenas elementum metus velit, vel congue tortor tristique et. Phasellus in turpis rutrum, pretium augue nec, venenatis nibh. Praesent congue, arcu vitae euismod ornare, felis nulla malesuada magna, non tristique libero mi in lectus. Praesent maximus lorem et elit bibendum, sed convallis lorem ultrices. In at nunc vitae diam varius interdum ut nec lorem. Nullam tempus diam et nibh condimentum, eu varius nunc finibus. Donec blandit ornare enim sed egestas. Donec lacus nisl, pretium at arcu ut, commodo ultrices ipsum. Ut sit amet mattis arcu.<\\/p>"}}},"items":[]}],"name":"Custom Tab 1"}'),
(3371, 0, 'rgen_module', 'rgen_prdpgtabs_set', 'set_rgNzB', '{"data":[{"module_id":"rgMSC","layout_id":"2","position":"pdpg_tabs","status":true,"sort_order":0,"prd_page":"selected","products":[{"id":"42","name":"Apple Cinema 30\\""},{"id":"30","name":"Canon EOS 5D"},{"id":"40","name":"iPhone"}]}],"name":"Custom Tab 1"}'),
(3346, 0, 'rgen_module', 'rgen_productgroups', 'rgBhu', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":"en - No data"},"gt":"gt40","top":{"status":false,"html":{"1":"en - No data"}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"custom","node_title":"Item","item_data":{"node_type":"custom","content":{"title_status":false,"title":{"1":"en - No data"}},"setting":{"products":[{"id":"42","name":"Apple Cinema 30\\""},{"id":"30","name":"Canon EOS 5D"},{"id":"41","name":"iMac"},{"id":"48","name":"iPod Classic"},{"id":"36","name":"iPod Nano"},{"id":"34","name":"iPod Shuffle"}],"prd_style":"prd1","prd_view":"grid","prd_limit":6,"image_w":"300","image_h":"300","grids":{"lg_desktop":"eq3","desktop":"d-eq3","tablet":"t-eq3","mob_xl":"mxl-eq2","mob_sm":"msm-eq2","mob_xs":"mxs-eq1","gutter":"gt10","margin_b":"mb10","classGroup":" eq3 d-eq3 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt10 mb10"},"carousel":{"margin":20,"display":4,"display_items":[],"arrows":true,"dots":false},"cssclass":""}}}],"name":"Home - Featured"}'),
(3334, 0, 'rgen_module', 'rgen_basicbanners', 'rg2Jt', '{"common":{"hoverstyle":"n","title":{"1":"en - No data"},"html":{"1":"en - No data"},"title_status":false,"html_status":false},"data":[{"depth":1,"status":true,"node_type":"main","node_title":"Item","item_data":{"banner":{"title":[],"img":"..\\/image\\/no_image.jpg","url":"","win":false},"hover":{"icon":[],"title":[],"html":[]}}}],"name":"Basic banners 01"}'),
(3335, 0, 'rgen_module', 'rgen_bannergrids', 'rgVV7', '{"common":{"title_status":false,"title":[],"gt":"gt40","top":{"status":false,"html":[]},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"row","node_title":"Row","item_data":{"node_type":"row","gutter":"gt20","margin_b":"mb20"},"items":[]}],"name":"Banner grids 01"}'),
(3344, 0, 'rgen_module', 'rgen_productgroups', 'rgj9L', '{"common":{"hoverstyle":"1","title_status":false,"title":{"1":""},"gt":"gt40","top":{"status":false,"html":{"1":""}},"bottom":{"status":false,"html":[]},"left":{"status":false,"size":4,"html":[]},"right":{"status":false,"size":4,"html":[]}},"data":[{"depth":1,"status":true,"node_type":"latest","node_title":"Item","item_data":{"node_type":"latest","content":{"title_status":false,"title":{"1":"zh-cn - No data"}},"setting":{"prd_style":"prd1","prd_view":"carousel","prd_limit":10,"image_w":"300","image_h":"300","grids":[],"counter":false,"h_counter":false,"carousel":{"margin":0,"display":4,"display_items":{"w200":1,"w300":1,"w400":1,"w500":2,"w600":3,"w700":3,"w800":4,"w900":4,"w1000":9,"w1100":9},"arrows":true,"dots":false},"cssclass":""}}}],"name":"\\u6700\\u65b0\\u4e0a\\u67b6"}'),
(3375, 0, 'rgen_module', 'rgen_stickyhtml', 'rgajo', '{"common":{"title_status":false,"title":[],"html_status":true,"html":{"1":"<iframe src=\\"https:\\/\\/www.flickr.com\\/photos\\/we-are-envato\\/13090422515\\/player\\/\\" width=\\"100%\\" height=\\"420\\" frameborder=\\"0\\" allowfullscreen=\\"\\" webkitallowfullscreen=\\"\\" mozallowfullscreen=\\"\\" oallowfullscreen=\\"\\" msallowfullscreen=\\"\\"><\\/iframe>"},"icon":{"status":true,"type":"ico","icon":"fa fa-flickr","size":"20px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 20px;"},"position":"r","top":"252","w":"600","cssclass":""},"data":["No node"],"name":"Sticky HTML 01"}');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_rgen_modules_customize`
--

CREATE TABLE IF NOT EXISTS `mcc_rgen_modules_customize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `group` varchar(64) NOT NULL,
  `section` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39955 ;

--
-- 转存表中的数据 `mcc_rgen_modules_customize`
--

INSERT INTO `mcc_rgen_modules_customize` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(37650, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.l_html', '{"family":"","subset":""}'),
(37651, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.l_html', '{"family":"","subset":""}'),
(37652, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.b_html', '{"family":"","subset":""}'),
(37653, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.b_html', '{"family":"","subset":""}'),
(37654, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.t_html', '{"family":"","subset":""}'),
(37655, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.t_html', '{"family":"","subset":""}'),
(37656, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.mod_hd', '{"family":"","subset":""}'),
(37657, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.mod_hd', '{"family":"","subset":""}'),
(38372, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.b_html', '{"family":"","subset":""}'),
(38373, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.b_html', '{"family":"","subset":""}'),
(38374, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.b_html', '{"family":"","subset":""}'),
(38375, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.l_html', '{"family":"","subset":""}'),
(38376, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.l_html', '{"family":"","subset":""}'),
(38377, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.l_html', '{"family":"","subset":""}'),
(38378, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.m_html', '{"family":"","subset":""}'),
(38379, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.m_html', '{"family":"","subset":""}'),
(38382, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.r_html', '{"family":"","subset":""}'),
(38381, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.r_html', '{"family":"","subset":""}'),
(38369, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.t_html', '{"family":"Roboto:300","subset":"latin"}'),
(37642, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.m_html', '{"family":"","subset":""}'),
(37641, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.mod_hd', '{"family":"Oswald:regular","subset":"latin"}'),
(37640, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.t_html', '{"family":"Roboto:300","subset":"latin"}'),
(38368, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.mod_hd', '{"family":"","subset":""}'),
(38367, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.mod_hd', '{"family":"","subset":""}'),
(38366, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.d.mod_hd', '{"family":"","subset":""}'),
(37636, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.r_html', '{"family":"","subset":""}'),
(39857, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgpFy.d.b_html', '{"family":"","subset":""}'),
(39858, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgpFy.d.l_html', '{"family":"","subset":""}'),
(39859, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgpFy.d.r_html', '{"family":"","subset":""}'),
(37629, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rg8pH.d.mod_hd', '{"family":"","subset":""}'),
(37630, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rg8pH.d.t_html', '{"family":"","subset":""}'),
(39681, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.t.r_html', '{"family":"","subset":""}'),
(39680, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.d.r_html', '{"family":"","subset":""}'),
(39679, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.m.l_html', '{"family":"","subset":""}'),
(37273, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.m.t_html', '{"family":"","subset":""}'),
(37274, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.d.t_html', '{"family":"","subset":""}'),
(37275, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.t.t_html', '{"family":"","subset":""}'),
(39663, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.t.mod_hd', '{"family":"","subset":""}'),
(39664, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.m.mod_hd', '{"family":"Oswald:300","subset":"latin"}'),
(39662, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.d.mod_hd', '{"family":"Oswald:300","subset":"latin"}'),
(37279, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.m.r_html', '{"family":"","subset":""}'),
(37280, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.t.r_html', '{"family":"","subset":""}'),
(37281, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.d.r_html', '{"family":"","subset":""}'),
(37282, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.m.l_html', '{"family":"","subset":""}'),
(37283, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.t.l_html', '{"family":"","subset":""}'),
(37284, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.d.l_html', '{"family":"","subset":""}'),
(37285, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.m.b_html', '{"family":"","subset":""}'),
(37286, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.t.b_html', '{"family":"","subset":""}'),
(37287, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.d.b_html', '{"family":"","subset":""}'),
(37288, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.m.t_html', '{"family":"","subset":""}'),
(37289, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.t.t_html', '{"family":"","subset":""}'),
(37290, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.d.t_html', '{"family":"","subset":""}'),
(37291, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.m.tab1.tab_item', '{"family":"","subset":""}'),
(37292, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.t.tab1.tab_item', '{"family":"","subset":""}'),
(37293, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.d.tab1.tab_item', '{"family":"","subset":""}'),
(37294, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.m.mod_sub_hd', '{"family":"","subset":""}'),
(37295, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.t.mod_sub_hd', '{"family":"","subset":""}'),
(37296, 0, 'rgen_modtheme', 'rgen_productgroups', 'rgen_productgroups.rgBhu', '{"status":true,"counter":[],"dots":{"wrp":[],"normal":[],"active":[]},"arrows":{"wrp":[],"arrow_line":[],"arrow":[]},"d":{"status":true,"main":[],"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"tab1":{"tab_container":[],"tab_panel":[],"tab_item":[],"tab_item_active":[],"tab_item_a":[],"tab_item_active_a":[],"tab_pane_wrp":[],"tab_pane_active":[]},"prd_block1":{"status":true,"type":"normal","prd":{"block":{"normal":[],"hover":[]},"image":{"normal":[],"hover":[]},"info_block":{"status":false,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""},"info_wrpper":[],"info_name":[],"info_name_hover":[],"info_description":[],"price_wrp":[],"price_block":[],"price_spl":[],"price_new":[],"price_old":[],"price_tax":[],"btn_wrp":[],"cart_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(237, 95, 121)","hover":""},"background":{"normal":"","hover":""},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(237, 95, 121); ","css_hover":""},"quickview_btn":[],"links":{"wrp":[],"normal":[],"hover":[]}},"css_data":{"block_normal":"","block_hover":"","image_normal":"","image_hover":"","info_block":"","info_wrpper":"","info_name":"","info_name_hover":"","info_description":"","price_wrp":"","price_block":"","price_spl":"","price_new":"","price_old":"","price_tax":"","btn_wrp":"","cart_btn_normal":"color: rgb(237, 95, 121); ","cart_btn_hover":"","quickview_btn_normal":"","quickview_btn_hover":"","links_wrp":"","links_normal":"","links_hover":""}},"prd_block2":[],"prd_block3":[],"prd_small1":{"status":true,"type":"grid","prd":{"block":{"normal":[],"hover":[]},"image":[],"prdname":{"status":true,"fonts":[],"background":"","color":"rgb(239, 49, 49)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(239, 49, 49); font-size: 13px; text-align: left; "},"prdname_hover":"","price_block":[],"price_spl":"","price_new":"","price_old":"","btn":"","btn_hover":""},"css_data":{"block_normal":"","block_hover":"","image":"","prdname":"color: rgb(239, 49, 49); font-size: 13px; text-align: left; ","prdname_hover":"","price_block":"","price_spl":"","price_new":"","price_old":"","btn":"","btn_hover":""}},"prd_small2":{"status":true,"type":"grid","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"hover":[]},"image":[],"prdname":[],"prdname_hover":"","price_block":[],"price_spl":"","price_new":"","price_old":"","btn":[]},"css_data":{"block_normal":"background-color: rgb(255, 255, 255); ","block_hover":"","image":"","prdname":"","prdname_hover":"","price_block":"","price_spl":"","price_new":"","price_old":"","btn_normal":"","btn_hover":""}}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"tab1":{"tab_container":[],"tab_panel":[],"tab_item":[],"tab_item_active":[],"tab_item_a":[],"tab_item_active_a":[],"tab_pane_wrp":[],"tab_pane_active":[]},"prd_block1":[],"prd_block2":[],"prd_block3":[],"prd_small1":[],"prd_small2":[]},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"tab1":{"tab_container":[],"tab_panel":[],"tab_item":[],"tab_item_active":[],"tab_item_a":[],"tab_item_active_a":[],"tab_pane_wrp":[],"tab_pane_active":[]},"prd_block1":[],"prd_block2":[],"prd_block3":[],"prd_small1":[],"prd_small2":[]}}'),
(39665, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.d.mod_sub_hd', '{"family":"","subset":""}'),
(39666, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.t.mod_sub_hd', '{"family":"","subset":""}'),
(39667, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.m.mod_sub_hd', '{"family":"","subset":""}'),
(39669, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.t.tab1.tab_item', '{"family":"","subset":""}'),
(39668, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.d.tab1.tab_item', '{"family":"Oswald:regular","subset":"latin"}'),
(39672, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.t.t_html', '{"family":"","subset":""}'),
(39670, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.m.tab1.tab_item', '{"family":"Oswald:regular","subset":"latin"}'),
(37238, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.m.l_html', '{"family":"","subset":""}'),
(37239, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.t.l_html', '{"family":"","subset":""}'),
(37240, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.d.l_html', '{"family":"","subset":""}'),
(37241, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.m.b_html', '{"family":"","subset":""}'),
(37242, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.t.b_html', '{"family":"","subset":""}'),
(37243, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.d.b_html', '{"family":"","subset":""}'),
(37244, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.d.mod_hd', '{"family":"","subset":""}'),
(37245, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.t.mod_hd', '{"family":"","subset":""}'),
(37246, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.m.mod_hd', '{"family":"","subset":""}'),
(37247, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.d.mod_sub_hd', '{"family":"","subset":""}'),
(37248, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.t.mod_sub_hd', '{"family":"","subset":""}'),
(37249, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.m.mod_sub_hd', '{"family":"","subset":""}'),
(37250, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.d.tab1.tab_item', '{"family":"","subset":""}'),
(37251, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.t.tab1.tab_item', '{"family":"","subset":""}'),
(37252, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.m.tab1.tab_item', '{"family":"","subset":""}'),
(37260, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.d.mod_hd', '{"family":"","subset":""}'),
(37261, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.t.mod_hd', '{"family":"","subset":""}'),
(37262, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.m.mod_hd', '{"family":"","subset":""}'),
(39578, 0, 'rgen_modtheme', 'rgen_menu', 'rgen_menu.rgvP4', '{"status":true,"container":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"3","pad_type":"inherit","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: inherit;"},"margin":{"status":true,"type":"all","mrg":"0","mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 0px;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); padding: inherit;margin: 0px;"},"menubar":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"-1","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: -1px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); margin-top: auto; margin-right: auto; margin-bottom: -1px; margin-left: auto; "},"menuitem":{"wrapper":{"status":true,"fonts":[],"background":"rgb(0, 0, 0)","color":"","f_size":"13px","text_align":"left","border":{"status":false,"size":"all","size_all":"0","size_t":0,"size_r":"0","size_b":0,"size_l":"1","style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0.08)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(0, 0, 0, 0.08);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(0, 0, 0); "},"link":{"status":true,"fonts":{"status":true,"type":"default","family":"Trebuchet MS, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"18px","line_height":"1.2","style":"normal","weight":"bold","transform":"capitalize","letter_spacing":"1px","color":"#666666","css":"font-family: Trebuchet MS, Helvetica, sans-serif; font-size: 18px; line-height: 1.2; font-style: normal; font-weight: bold; color: #666666; text-transform: capitalize; letter-spacing: 1px;"},"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":false,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":"1","style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(195, 160, 125, 0.12)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(195, 160, 125, 0.12);border-radius: 0px;"},"hover":[]},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"int","pad_t":"15","pad_t_type":"int","pad_r":"20","pad_r_type":"int","pad_b":"15","pad_b_type":"int","pad_l":"20","pad_l_type":"int","css":"padding-top: 15px; padding-right: 20px; padding-bottom: 15px; padding-left: 20px; "},"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"18px","text_align":"center","css_normal":"font-family: Trebuchet MS, Helvetica, sans-serif; font-size: 18px; line-height: 1.2; font-style: normal; font-weight: bold; color: #666666; text-transform: capitalize; letter-spacing: 1px;color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); padding-top: 15px; padding-right: 20px; padding-bottom: 15px; padding-left: 20px; font-size: 18px; text-align: center; ","css_hover":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); "},"first_link":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"hover":[]},"padding":{"status":true,"type":"all","pad":"15","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 15px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":{"normal":[],"hover":[]},"f_size":"16px","text_align":"center","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 15px;margin: auto;","css_hover":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); "},"last_link":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":false,"size":"all","size_all":0,"size_t":0,"size_r":"1","size_b":0,"size_l":"1","style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(195, 160, 125, 0.12)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(195, 160, 125, 0.12);border-radius: 0px;"},"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"16px","text_align":"center","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); ","css_hover":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); "}},"flyoutmenu":{"wrapper":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"link":{"status":true,"fonts":[],"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"border":{"normal":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.25)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.25);border-radius: 0px;"},"hover":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"16px","text_align":"left","css_normal":"color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.25);border-radius: 0px;font-size: 16px; text-align: left; ","css_hover":"color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"}},"megamenu":{"wrapper":{"status":true,"fonts":[],"background":"rgb(0, 0, 0)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"10","pad_type":"inherit","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: inherit;"},"margin":{"status":true,"type":"all","mrg":"10","mrg_type":"inherit","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: inherit;"},"shadow":{"status":true,"inset":"n","hor_l":0,"ver_l":0,"blur":0,"spread":0,"color":"rgba(0,0,0,0.05)","css":"box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"w":"","h":"","css":"background-color: rgb(0, 0, 0); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: inherit;margin: inherit;box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"normalmenu":{"block":{"status":true,"fonts":[],"background":"rgb(0, 0, 0)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(0, 0, 0); "},"heading":{"status":true,"fonts":{"status":true,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"14px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"border":{"normal":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"}},"padding":{"status":true,"type":"dif","pad":"6","pad_type":"int","pad_t":"8","pad_t_type":"int","pad_r":"15","pad_r_type":"int","pad_b":"6","pad_b_type":"int","pad_l":"15","pad_l_type":"int","css":"padding-top: 8px; padding-right: 15px; padding-bottom: 6px; padding-left: 15px; "},"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"16px","text_align":"center","css_normal":"font-family: Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding-top: 8px; padding-right: 15px; padding-bottom: 6px; padding-left: 15px; font-size: 16px; text-align: center; ","css_hover":"color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"links":{"status":true,"fonts":{"status":true,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"16px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"16px","text_align":"center","css_normal":"font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); font-size: 16px; text-align: center; ","css_hover":"color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); "}},"catblock1":{"block":[],"heading":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"","hover":""},"border":{"normal":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0.05)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(0, 0, 0, 0.05);border-radius: 0px;"},"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"14px","text_align":"left","css_normal":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(0, 0, 0, 0.05);border-radius: 0px;font-size: 14px; text-align: left; ","css_hover":"color: rgb(255, 255, 255); "},"links":{"status":true,"fonts":[],"font_color":{"normal":"rgba(255, 255, 255, 0.7)","hover":"rgb(255, 255, 255)"},"background":{"normal":"","hover":""},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"12px","text_align":"left","css_normal":"color: rgba(255, 255, 255, 0.7); font-size: 12px; text-align: left; ","css_hover":"color: rgb(255, 255, 255); "}},"catblock2":{"block":[],"image":[],"heading":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"","hover":""},"border":{"normal":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0.08)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(0, 0, 0, 0.08);border-radius: 0px;"},"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(0, 0, 0, 0.08);border-radius: 0px;font-size: 13px; text-align: left; ","css_hover":"color: rgb(255, 255, 255); "},"links":{"status":true,"fonts":[],"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"","hover":""},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"12px","text_align":"left","css_normal":"color: rgb(255, 255, 255); font-size: 12px; text-align: left; ","css_hover":"color: rgb(255, 255, 255); "}},"prdblock1":{"block":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0.08)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 0px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0.08); border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;padding-top: 0px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px; "},"linktext":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"price":"rgb(255, 255, 255)","button":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"11px","line_height":"1.0","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 11px; line-height: 1.0; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(167, 144, 116)"},"background":{"normal":"rgb(0, 0, 0)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"}},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"5","pad_t_type":"int","pad_r":"8","pad_r_type":"int","pad_b":"5","pad_b_type":"int","pad_l":"8","pad_l_type":"int","css":"padding-top: 5px; padding-right: 8px; padding-bottom: 5px; padding-left: 8px; "},"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Oswald; font-size: 11px; line-height: 1.0; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); background-color: rgb(0, 0, 0); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding-top: 5px; padding-right: 8px; padding-bottom: 5px; padding-left: 8px; ","css_hover":"color: rgb(167, 144, 116); background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"}},"prdblock2":{"block":[],"linktext":{"normal":"","hover":""},"price":"","button":[]},"brandblock1":{"block":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"10","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 10px;"},"margin":{"status":true,"type":"all","mrg":"10","mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 10px;"},"shadow":[],"w":"","h":"","css":"padding: 10px;margin: 10px;"},"hover":[]},"linktext":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"10","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 10px;"},"margin":{"status":true,"type":"all","mrg":"10","mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 10px;"},"shadow":[],"w":"","h":"","css":"padding: 10px;margin: 10px;"},"hover":[]}},"brandblock2":{"block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0.2)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"0","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(255, 255, 255, 0.2); border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;padding: 0px;"},"hover":{"background":"rgb(37, 31, 31)","textcolor":"rgb(167, 144, 116)"}},"imageblock1":{"block":{"normal":[],"hover":[]},"linktext":{"normal":[],"hover":[]}},"imageblock2":{"block":[],"hover":{"background":"","textcolor":""}},"imageblock3":{"block":{"normal":[],"hover":[]},"linktext":{"normal":[],"hover":[]}},"imageblock4":{"block":[]},"infoblock1":{"block":[],"image":[],"heading":[],"content":[],"button_wrp":[],"button":[]},"infoblock2":{"block":[],"image":[],"heading":[],"content":[],"button_wrp":[],"button":[]},"infoblock3":{"block":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0.08)","color":"","f_size":"13px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":0,"pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding: 0px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0.08); text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;"},"image":[],"heading":{"status":true,"fonts":{"status":false,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"center","border":{"status":false,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0.08)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(0, 0, 0, 0.08);border-radius: 0px;"},"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":"20","mrg_r_type":"int","mrg_b":0,"mrg_b_type":"auto","mrg_l":"20","mrg_l_type":"int","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); font-size: 14px; text-align: center; margin: auto;"},"content":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"12px","text_align":"center","border":[],"padding":{"status":true,"type":"dif","pad":"15","pad_type":"int","pad_t":"10","pad_t_type":"int","pad_r":"20","pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":"20","pad_l_type":"int","css":"padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px; "},"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); font-size: 12px; text-align: center; padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px; "},"button_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0.08)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(0, 0, 0, 0.08);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"10","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 10px;"},"margin":[],"shadow":[],"w":"","h":"","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(0, 0, 0, 0.08);border-radius: 0px;padding: 10px;"},"button":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"12px","line_height":"1.0","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 12px; line-height: 1.0; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(167, 144, 116)"},"background":{"normal":"rgb(0, 0, 0)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"}},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"5","pad_t_type":"int","pad_r":"10","pad_r_type":"int","pad_b":"5","pad_b_type":"int","pad_l":"10","pad_l_type":"int","css":"padding-top: 5px; padding-right: 10px; padding-bottom: 5px; padding-left: 10px; "},"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Oswald; font-size: 12px; line-height: 1.0; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); background-color: rgb(0, 0, 0); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding-top: 5px; padding-right: 10px; padding-bottom: 5px; padding-left: 10px; ","css_hover":"color: rgb(167, 144, 116); background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"}},"infoblock4":{"block":[],"image":[],"heading":[],"content":[],"button":[]},"customhtml":{"block":{"status":true,"fonts":[],"background":"rgb(225, 240, 255)","color":"","f_size":"18px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(225, 240, 255); font-size: 18px; text-align: center; "}}},"m_handle":{"status":true,"fonts":[],"background":"rgb(167, 144, 116)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(167, 144, 116); font-size: 13px; "},"m_subhandle":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0.03)","color":"rgba(255, 255, 255, 0.75)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0.03); color: rgba(255, 255, 255, 0.75); font-size: 13px; "},"m_nav":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":"4","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 4px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border-width: 4px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"m_subwrp":[],"m_sub":[],"m_mainitem":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"10","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 10px;"},"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;padding: 10px;"},"m_subitem":[]}');
INSERT INTO `mcc_rgen_modules_customize` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(38142, 0, 'rgen_modtheme', 'rgen_contentblocks', 'rgen_contentblocks.rg5H1', '{"status":true,"dots":{"wrp":[],"normal":[],"active":[]},"arrows":{"wrp":[],"arrow_line":[],"arrow":[]},"ctn_block":"1","d":{"status":true,"main":[],"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; "},"mod_sub_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"capitalize","letter_spacing":"1px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: capitalize; letter-spacing: 1px;"},"background":"","color":"rgb(246, 246, 246)","f_size":"14px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: capitalize; letter-spacing: 1px;color: rgb(246, 246, 246); font-size: 14px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"content_rw":{"rw":[],"cl":[],"first_cl":[],"last_cl":[]},"ctn_block1":{"setting":{"main":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"20","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"text-align: left; border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); text-align: left; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin: auto;"},"hover":[]},"name":{"normal":{"status":true,"fonts":[],"background":"","color":"rgb(216, 216, 216)","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"0","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":"0","mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 0px;"},"shadow":[],"w":"","h":"","css":"color: rgb(216, 216, 216); font-size: 13px; text-align: left; padding: 0px;margin: 0px;"},"hover":[]},"text":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin: auto;"},"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(255, 255, 255)","hover":""},"background":{"normal":"","hover":""},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(255, 255, 255); ","css_hover":""},"link":[]}},"ctn_block2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block3":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]},"name_line":{"normal":[],"hover":[]}},"ctn_block4":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"rgb(167, 144, 116)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"40","h":"40","css":"background-color: rgba(0, 0, 0, 0); color: rgb(167, 144, 116); font-size: 13px; text-align: left; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;margin: auto;width:40px;height:40px;"},"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"6","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 6px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 13px; text-align: left; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin-top: auto; margin-right: auto; margin-bottom: 6px; margin-left: auto; "},"hover":[]},"text":{"normal":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 12px; text-align: left; "},"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"content_rw":{"rw":[],"cl":[],"first_cl":[],"last_cl":[]},"ctn_block1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block3":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]},"name_line":{"normal":[],"hover":[]}},"ctn_block4":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}}},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"content_rw":{"rw":[],"cl":[],"first_cl":[],"last_cl":[]},"ctn_block1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block3":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]},"name_line":{"normal":[],"hover":[]}},"ctn_block4":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}}}}'),
(37171, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.mod_hd', '{"family":"Oswald:regular","subset":"latin"}'),
(37185, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.t_html', '{"family":"","subset":""}'),
(37186, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.mod_hd', '{"family":"Oswald:regular","subset":"latin"}'),
(37173, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.t_html', '{"family":"","subset":""}'),
(37174, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.r_html', '{"family":"","subset":""}'),
(37175, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.r_html', '{"family":"","subset":""}'),
(37176, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.r_html', '{"family":"","subset":""}'),
(37177, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.l_html', '{"family":"","subset":""}'),
(37178, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.l_html', '{"family":"","subset":""}'),
(37179, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.l_html', '{"family":"","subset":""}'),
(37180, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.b_html', '{"family":"","subset":""}'),
(37181, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.b_html', '{"family":"","subset":""}'),
(37182, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.d.b_html', '{"family":"","subset":""}'),
(37183, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.m.t_html', '{"family":"","subset":""}'),
(37184, 0, 'rgen_modtheme', 'rgen_imagegallery', 'rgen_imagegallery.rgO2R', '{"status":true,"dots":{"wrp":[],"normal":[],"active":[]},"arrows":{"wrp":[],"arrow_line":[],"arrow":[]},"d":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"1px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;color: rgb(255, 255, 255); font-size: 14px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"image_block":{"block":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""},"overlay":"rgb(255, 255, 255)","icon":[]}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"image_block":{"block":[],"overlay":"rgba(0,0,0,0.5)","icon":[]}},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"1px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;color: rgb(255, 255, 255); font-size: 14px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"image_block":{"block":[],"overlay":"rgba(0,0,0,0.5)","icon":[]}}}'),
(38931, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.t.r_html', '{"family":"","subset":""}'),
(38930, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.r_html', '{"family":"","subset":""}'),
(38929, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.m.l_html', '{"family":"","subset":""}'),
(38928, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.t.l_html', '{"family":"","subset":""}'),
(38927, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.l_html', '{"family":"","subset":""}'),
(38926, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.m.b_html', '{"family":"","subset":""}'),
(38925, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.t.b_html', '{"family":"","subset":""}'),
(38924, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.b_html', '{"family":"","subset":""}'),
(38923, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.m.t_html', '{"family":"","subset":""}'),
(38922, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.t.t_html', '{"family":"","subset":""}'),
(38148, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.m.mod_sub_hd', '{"family":"","subset":""}'),
(38147, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.t.mod_sub_hd', '{"family":"","subset":""}'),
(38184, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block_small2.link', '{"family":"","subset":""}'),
(38183, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block_small2.btn', '{"family":"","subset":""}'),
(38182, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block_small2.name', '{"family":"","subset":""}'),
(38181, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block_small2.text', '{"family":"","subset":""}'),
(38180, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block_small1.link', '{"family":"","subset":""}'),
(38179, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block_small1.btn', '{"family":"","subset":""}'),
(38146, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.mod_sub_hd', '{"family":"Oswald:regular","subset":"latin"}'),
(37520, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.mod_hd', '{"family":"","subset":""}'),
(37521, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.t.mod_hd', '{"family":"","subset":""}'),
(37522, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.m.mod_hd', '{"family":"","subset":""}'),
(38921, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.t_html', '{"family":"","subset":""}'),
(38917, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.m.mod_hd', '{"family":"","subset":""}'),
(38916, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.t.mod_hd', '{"family":"","subset":""}'),
(38915, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.mod_hd', '{"family":"","subset":""}'),
(38946, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block4.name', '{"family":"","subset":""}'),
(38947, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block4.btn', '{"family":"","subset":""}'),
(38948, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block4.link', '{"family":"","subset":""}'),
(38949, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block_small1.text', '{"family":"","subset":""}'),
(38950, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block_small1.name', '{"family":"","subset":""}'),
(38951, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block_small1.btn', '{"family":"","subset":""}'),
(38952, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block_small1.link', '{"family":"","subset":""}'),
(38953, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block_small2.text', '{"family":"","subset":""}'),
(38954, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block_small2.name', '{"family":"","subset":""}'),
(38955, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block_small2.btn', '{"family":"","subset":""}'),
(38956, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block_small2.link', '{"family":"","subset":""}'),
(38934, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block1.name', '{"family":"Oswald:300","subset":"latin"}'),
(38143, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.mod_hd', '{"family":"","subset":""}'),
(38144, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.t.mod_hd', '{"family":"","subset":""}'),
(38145, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.m.mod_hd', '{"family":"","subset":""}'),
(38918, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.mod_sub_hd', '{"family":"","subset":""}'),
(38919, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.t.mod_sub_hd', '{"family":"","subset":""}'),
(38920, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.m.mod_sub_hd', '{"family":"","subset":""}'),
(39938, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.t.mod_hd', '{"family":"","subset":""}'),
(39937, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.d.mod_hd', '{"family":"","subset":""}'),
(39936, 0, 'rgen_modtheme', 'rgen_customhtml', 'rgen_customhtml.rgu9C', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":"40","pad_type":"int","pad_t":"0","pad_t_type":"int","pad_r":"40","pad_r_type":"int","pad_b":"60","pad_b_type":"int","pad_l":"40","pad_l_type":"int","css":"padding-top: 0px; padding-right: 40px; padding-bottom: 60px; padding-left: 40px; "},"margin":{"status":true,"type":"dif","mrg":"0","mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"5","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 5px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); padding-top: 0px; padding-right: 40px; padding-bottom: 60px; padding-left: 40px; margin-top: auto; margin-right: auto; margin-bottom: 5px; margin-left: auto; "},"main_bg":{"status":true,"image":"..\\/image\\/catalog\\/renqijingxuan.jpg","position":"center center","position_x":"0","position_y":"0","repeat":"no-repeat","attachment":"inherit","bgsize":"inherit","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: url(image\\/catalog\\/renqijingxuan.jpg);background-position: center center;background-repeat: no-repeat;background-size: inherit;background-attachment: inherit;"},"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]}}'),
(39848, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.d.m_html', '{"family":"","subset":""}'),
(39847, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.m.l_html', '{"family":"","subset":""}'),
(39600, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.customhtml', '{"family":"","subset":""}'),
(39951, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.m.m_html', '{"family":"","subset":""}'),
(39950, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.t.m_html', '{"family":"","subset":""}'),
(39949, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.d.m_html', '{"family":"","subset":""}'),
(39948, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.m.l_html', '{"family":"","subset":""}'),
(39947, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.t.l_html', '{"family":"","subset":""}'),
(39843, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.t.b_html', '{"family":"","subset":""}'),
(39846, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.t.l_html', '{"family":"","subset":""}'),
(39845, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.d.l_html', '{"family":"","subset":""}'),
(39844, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.m.b_html', '{"family":"","subset":""}'),
(39946, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.d.l_html', '{"family":"","subset":""}'),
(39945, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.m.b_html', '{"family":"","subset":""}'),
(39939, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.m.mod_hd', '{"family":"","subset":""}'),
(39854, 0, 'rgen_modtheme', 'rgen_gridmanager', 'rgen_gridmanager.rgpFy', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"inherit","pad_t":"20","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"80","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding: inherit;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); padding: inherit;"},"main_bg":{"status":true,"image":"..\\/image\\/no_image.png","position":"center center","position_x":"0","position_y":"0","repeat":"no-repeat","attachment":"inherit","bgsize":"cover","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: none;background-position: center center;background-repeat: no-repeat;background-size: cover;background-attachment: inherit;"},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"0","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 0px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; margin-top: auto; margin-right: auto; margin-bottom: 0px; margin-left: auto; "},"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":[],"shadow":[],"w":"","h":"","css":"padding: 0px;"},"first_rw":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":[],"shadow":[],"w":"","h":"","css":"padding: 0px;"},"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]}},"t":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"60","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"80","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 60px; padding-right: 0px; padding-bottom: 80px; padding-left: 0px; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); padding-top: 60px; padding-right: 0px; padding-bottom: 80px; padding-left: 0px; "},"main_bg":{"status":true,"image":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/other\\/product-bg.jpg","position":"center center","position_x":"0","position_y":"0","repeat":"no-repeat","attachment":"inherit","bgsize":"cover","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: url(image\\/catalog\\/rgen\\/demo06_images\\/other\\/product-bg.jpg);background-position: center center;background-repeat: no-repeat;background-size: cover;background-attachment: inherit;"},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"30","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 30px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; margin-top: auto; margin-right: auto; margin-bottom: 30px; margin-left: auto; "},"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]}},"m":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"30","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"30","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 30px; padding-right: 0px; padding-bottom: 30px; padding-left: 0px; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); padding-top: 30px; padding-right: 0px; padding-bottom: 30px; padding-left: 0px; "},"main_bg":{"status":true,"image":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/other\\/product-bg.jpg","position":"center center","position_x":"0","position_y":"0","repeat":"no-repeat","attachment":"inherit","bgsize":"cover","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: url(image\\/catalog\\/rgen\\/demo06_images\\/other\\/product-bg.jpg);background-position: center center;background-repeat: no-repeat;background-size: cover;background-attachment: inherit;"},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"30","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 30px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; margin-top: auto; margin-right: auto; margin-bottom: 30px; margin-left: auto; "},"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]}}}'),
(37618, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rg8pH.d.l_html', '{"family":"","subset":""}'),
(37619, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgf9A.d.mod_hd', '{"family":"","subset":""}'),
(37620, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgf9A.d.t_html', '{"family":"","subset":""}'),
(37621, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgf9A.d.b_html', '{"family":"","subset":""}'),
(37622, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgf9A.d.l_html', '{"family":"","subset":""}'),
(37623, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgf9A.d.r_html', '{"family":"","subset":""}'),
(37624, 0, 'rgen_modtheme', 'rgen_gridmanager', 'rgen_gridmanager.rgf9A', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); "},"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"70","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":0,"pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 70px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; "},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding-top: 70px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin: auto;"},"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]}},"m":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); margin: auto;"},"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"30","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":0,"pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 30px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; "},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding-top: 30px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin: auto;"},"mod_content":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""},"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]}}}'),
(37625, 0, 'rgen_modtheme', 'rgen_gridmanager', 'rgen_gridmanager.rg8pH', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); "},"main_bg":{"status":true,"image":"..\\/image\\/catalog\\/rgen\\/demo06_images\\/other\\/section-bg.jpg","position":"center center","position_x":"0","position_y":"0","repeat":"no-repeat","attachment":"inherit","bgsize":"cover","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: url(image\\/catalog\\/rgen\\/demo06_images\\/other\\/section-bg.jpg);background-position: center center;background-repeat: no-repeat;background-size: cover;background-attachment: inherit;"},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":{"status":false,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; "},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]}},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]}}}'),
(37610, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.b_html', '{"family":"","subset":""}'),
(37611, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.b_html', '{"family":"","subset":""}'),
(37612, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.m_html', 'null'),
(37615, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rg8pH.d.b_html', '{"family":"","subset":""}'),
(37616, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rg8pH.d.r_html', '{"family":"","subset":""}'),
(37643, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.m_html', '{"family":"","subset":""}'),
(37644, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.r_html', '{"family":"","subset":""}'),
(37645, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.t.r_html', '{"family":"","subset":""}'),
(38380, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.m_html', '{"family":"","subset":""}'),
(38383, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.r_html', '{"family":"","subset":""}'),
(37648, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.m_html', '{"family":"","subset":""}'),
(37649, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.m.l_html', '{"family":"","subset":""}'),
(37632, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgraI.d.b_html', '{"family":"","subset":""}'),
(38370, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.t.t_html', '{"family":"","subset":""}'),
(37635, 0, 'rgen_modtheme', 'rgen_prdpghtml', 'rgen_prdpghtml.rgraI', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"15","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 15px;"},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"20","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;padding: 15px;margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":0,"pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 0px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px; "},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"10","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 10px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgba(255, 255, 255, 0.5); font-size: 13px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding-top: 0px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px; margin-top: auto; margin-right: auto; margin-bottom: 10px; margin-left: auto; "},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"20px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 20px; text-align: left; "},"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"t":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"m":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]}}');
INSERT INTO `mcc_rgen_modules_customize` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(38932, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.m.r_html', '{"family":"","subset":""}'),
(38933, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block1.text', '{"family":"","subset":""}'),
(38936, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block1.link', '{"family":"","subset":""}'),
(38935, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block1.btn', '{"family":"","subset":""}'),
(38937, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block2.text', '{"family":"","subset":""}'),
(38938, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block2.name', '{"family":"","subset":""}'),
(38939, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block2.btn', '{"family":"","subset":""}'),
(38940, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block2.link', '{"family":"","subset":""}'),
(38941, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block3.text', '{"family":"","subset":""}'),
(38942, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block3.name', '{"family":"","subset":""}'),
(38943, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block3.btn', '{"family":"","subset":""}'),
(38944, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block3.link', '{"family":"","subset":""}'),
(38945, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgtZs.d.ctn_block4.text', '{"family":"","subset":""}'),
(38149, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.t_html', '{"family":"","subset":""}'),
(38150, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.t.t_html', '{"family":"","subset":""}'),
(38151, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.m.t_html', '{"family":"","subset":""}'),
(38152, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.b_html', '{"family":"","subset":""}'),
(38153, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.t.b_html', '{"family":"","subset":""}'),
(38154, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.m.b_html', '{"family":"","subset":""}'),
(38155, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.l_html', '{"family":"","subset":""}'),
(38156, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.t.l_html', '{"family":"","subset":""}'),
(38157, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.m.l_html', '{"family":"","subset":""}'),
(38158, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.r_html', '{"family":"","subset":""}'),
(38159, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.t.r_html', '{"family":"","subset":""}'),
(38160, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.m.r_html', '{"family":"","subset":""}'),
(39953, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.t.r_html', '{"family":"","subset":""}'),
(39954, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.m.r_html', '{"family":"","subset":""}'),
(39944, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.t.b_html', '{"family":"","subset":""}'),
(39943, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.d.b_html', '{"family":"","subset":""}'),
(39942, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.m.t_html', '{"family":"","subset":""}'),
(39941, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.t.t_html', '{"family":"","subset":""}'),
(39940, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.d.t_html', '{"family":"","subset":""}'),
(39952, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu9C.d.r_html', '{"family":"","subset":""}'),
(37172, 0, 'rgen_modtheme', 'fonts', 'rgen_imagegallery.rgO2R.t.mod_hd', '{"family":"","subset":""}'),
(37169, 0, 'rgen_modtheme', 'rgen_basicslideshow', 'rgen_basicslideshow.rgfTN', '{"status":true,"main_wrp":[],"container":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"}}'),
(37170, 0, 'rgen_modtheme', 'rgen_basicslideshow', 'rgen_basicslideshow.rgN0C', '{"status":true,"main_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"container":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"slideshow":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"}}'),
(37354, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block1.btn', '{"family":"","subset":""}'),
(37355, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block1.link', '{"family":"","subset":""}'),
(37356, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block2.text', '{"family":"","subset":""}'),
(37357, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block2.name', '{"family":"Roboto:500","subset":"latin"}'),
(37358, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block2.btn', '{"family":"Roboto:700","subset":"latin"}'),
(37359, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block2.link', '{"family":"","subset":""}'),
(37360, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block3.text', '{"family":"","subset":""}'),
(37361, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block3.name', '{"family":"","subset":""}'),
(37362, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block3.btn', '{"family":"","subset":""}'),
(37363, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block3.link', '{"family":"","subset":""}'),
(37364, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block4.text', '{"family":"","subset":""}'),
(37365, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block4.name', '{"family":"","subset":""}'),
(37366, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block4.btn', '{"family":"","subset":""}'),
(37367, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block4.link', '{"family":"","subset":""}'),
(37391, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block_small2.link', '{"family":"","subset":""}'),
(37392, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block_small2.btn', '{"family":"","subset":""}'),
(37393, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block_small2.name', '{"family":"","subset":""}'),
(37394, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block_small2.text', '{"family":"","subset":""}'),
(37395, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block_small1.link', '{"family":"","subset":""}'),
(37396, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block_small1.btn', '{"family":"","subset":""}'),
(37397, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block_small1.name', '{"family":"","subset":""}'),
(37398, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block_small1.text', '{"family":"","subset":""}'),
(38161, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block1.text', '{"family":"","subset":""}'),
(38162, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block1.name', '{"family":"","subset":""}'),
(38163, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block1.btn', '{"family":"","subset":""}'),
(38164, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block1.link', '{"family":"","subset":""}'),
(38165, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block2.text', '{"family":"","subset":""}'),
(38166, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block2.name', '{"family":"","subset":""}'),
(38167, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block2.btn', '{"family":"","subset":""}'),
(38168, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block2.link', '{"family":"","subset":""}'),
(38169, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block3.text', '{"family":"","subset":""}'),
(38170, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block3.name', '{"family":"","subset":""}'),
(38171, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block3.btn', '{"family":"","subset":""}'),
(38172, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block3.link', '{"family":"","subset":""}'),
(38173, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block4.text', '{"family":"","subset":""}'),
(38174, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block4.name', '{"family":"","subset":""}'),
(38175, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block4.btn', '{"family":"","subset":""}'),
(38176, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block4.link', '{"family":"","subset":""}'),
(38177, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block_small1.text', '{"family":"","subset":""}'),
(38178, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rg5H1.d.ctn_block_small1.name', '{"family":"","subset":""}'),
(37609, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.b_html', '{"family":"","subset":""}'),
(37608, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.l_html', '{"family":"","subset":""}'),
(37607, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.l_html', '{"family":"","subset":""}'),
(37606, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.r_html', '{"family":"","subset":""}'),
(37599, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.l_html', '{"family":"","subset":""}'),
(37600, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.t_html', '{"family":"","subset":""}'),
(37601, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.mod_hd', '{"family":"","subset":""}'),
(37602, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.mod_hd', '{"family":"","subset":""}'),
(37603, 0, 'rgen_modtheme', 'rgen_revslider', 'rgen_revslider.rgrVA', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); padding: 0px;margin: auto;"},"mod_content":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"mod_hd":[],"mod_sub_hd":[],"rw":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"padding: 0px;margin: auto;"},"l_cl":[],"m_cl":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"padding: 0px;margin: auto;"},"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[]},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[]},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[]}}'),
(37605, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.t_html', '{"family":"","subset":""}'),
(37604, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.r_html', '{"family":"","subset":""}'),
(39855, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgpFy.d.mod_hd', '{"family":"","subset":""}'),
(39856, 0, 'rgen_modtheme', 'fonts', 'rgen_gridmanager.rgpFy.d.t_html', '{"family":"","subset":""}'),
(37598, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.t_html', '{"family":"","subset":""}'),
(37596, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.m.m_html', 'null'),
(37597, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.r_html', '{"family":"","subset":""}'),
(37594, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.t.m_html', 'null'),
(37595, 0, 'rgen_modtheme', 'fonts', 'rgen_revslider.rgrVA.d.mod_hd', '{"family":"","subset":""}'),
(38371, 0, 'rgen_modtheme', 'fonts', 'rgen_prdpghtml.rgFot.m.t_html', '{"family":"","subset":""}'),
(38914, 0, 'rgen_modtheme', 'rgen_contentblocks', 'rgen_contentblocks.rgtZs', '{"status":true,"dots":{"wrp":[],"normal":[],"active":[]},"arrows":{"wrp":[],"arrow_line":[],"arrow":[]},"ctn_block":"1","d":{"status":true,"main":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":"5","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"10","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"0","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 10px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; "},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"40","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 40px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;padding-top: 10px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: auto; margin-right: auto; margin-bottom: 40px; margin-left: auto; "},"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":"5","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":0,"pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"0","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; "},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin: auto;"},"mod_content":[],"mod_hd":{"status":true,"fonts":[],"background":"rgb(23, 212, 0)","color":"rgb(0, 0, 0)","f_size":"16px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(23, 212, 0); color: rgb(0, 0, 0); font-size: 16px; text-align: center; "},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"content_rw":{"rw":[],"cl":[],"first_cl":[],"last_cl":[]},"ctn_block1":{"setting":{"main":{"normal":{"status":true,"fonts":[],"background":"rgb(0, 0, 0)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":"15","pad_type":"int","pad_t":"10","pad_t_type":"int","pad_r":"15","pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":"15","pad_l_type":"int","css":"padding-top: 10px; padding-right: 15px; padding-bottom: 10px; padding-left: 15px; "},"margin":{"status":true,"type":"all","mrg":"2","mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 2px;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(0, 0, 0); text-align: left; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;padding-top: 10px; padding-right: 15px; padding-bottom: 10px; padding-left: 15px; margin: 2px;"},"hover":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"inner_wrp":{"normal":{"status":true,"fonts":[],"background":"rgb(0, 0, 0)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":"2","mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 2px;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(0, 0, 0); text-align: left; margin: 2px;"},"hover":[]},"figure":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; "},"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"300","subsets":"latin","size":"13px","line_height":"1.4","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.4; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"18px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.4; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 18px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin: auto;"},"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block3":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]},"name_line":{"normal":[],"hover":[]}},"ctn_block4":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"content_rw":{"rw":[],"cl":[],"first_cl":[],"last_cl":[]},"ctn_block1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block3":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]},"name_line":{"normal":[],"hover":[]}},"ctn_block4":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}}},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"content_rw":{"rw":[],"cl":[],"first_cl":[],"last_cl":[]},"ctn_block1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block3":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]},"name_line":{"normal":[],"hover":[]}},"ctn_block4":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}}}}');
INSERT INTO `mcc_rgen_modules_customize` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(39661, 0, 'rgen_modtheme', 'rgen_productgroups', 'rgen_productgroups.rgj9L', '{"status":true,"counter":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"int","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding-top: 0px; padding-right: inherit; padding-bottom: inherit; padding-left: inherit; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); padding-top: 0px; padding-right: inherit; padding-bottom: inherit; padding-left: inherit; "},"dots":{"wrp":[],"normal":[],"active":[]},"arrows":{"wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"arrow_line":[],"arrow":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(238, 238, 238)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":"1","radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 1px;"},"hover":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); border: 1px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 1px;","css_hover":"color: rgb(238, 238, 238); background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"}},"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"15","pad_type":"inherit","pad_t":"80","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"70","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding: inherit;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); padding: inherit;"},"main_bg":{"status":true,"image":"..\\/image\\/no_image.png","position":"center center","position_x":"0","position_y":"0","repeat":"repeat","attachment":"inherit","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: none;background-position: center center;background-repeat: repeat;background-size: auto;background-attachment: inherit;"},"mod_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); margin: auto;"},"mod_content":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"30px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"20","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 30px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"18px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;color: rgba(255, 255, 255, 0.5); font-size: 18px; text-align: center; "},"b_html":[],"l_html":[],"r_html":[],"tab1":{"tab_container":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""},"tab_panel":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"20","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"tab_item":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"rgba(0, 0, 0, 0)","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"center","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":{"status":false,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"10","pad_t_type":"int","pad_r":"20","pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":"20","pad_l_type":"int","css":"padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px; "},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":"10","mrg_r_type":"int","mrg_b":0,"mrg_b_type":"auto","mrg_l":"10","mrg_l_type":"int","css":"margin-top: auto; margin-right: 10px; margin-bottom: auto; margin-left: 10px; "},"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 14px; text-align: center; border: 0px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;margin-top: auto; margin-right: 10px; margin-bottom: auto; margin-left: 10px; "},"tab_item_active":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); "},"tab_item_a":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"rgb(232, 232, 232)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(232, 232, 232)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(232, 232, 232);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"10","pad_t_type":"int","pad_r":"20","pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":"20","pad_l_type":"int","css":"padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); color: rgb(232, 232, 232); border: 0px; border-style: solid;border-color: rgb(232, 232, 232);border-radius: 0px;padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px; "},"tab_item_active_a":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 0px;"},"tab_pane_wrp":[],"tab_pane_active":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""}},"prd_block1":{"status":true,"type":"normal","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"hover":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 0px;"}},"image":{"normal":[],"hover":[]},"info_block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"info_wrpper":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"info_name":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 13px; text-align: center; "},"info_name_hover":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); "},"info_description":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"price_wrp":{"status":true,"fonts":[],"background":"rgb(0, 0, 0)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(0, 0, 0); text-align: left; border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"price_block":{"status":true,"fonts":[],"background":"rgb(234, 232, 232)","color":"","f_size":"13px","text_align":"left","border":{"status":false,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":"0","radius_t":"90","radius_r":"90","radius_b":"90","radius_l":"90","color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"5","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 5px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(234, 232, 232); text-align: left; padding: 5px;"},"price_spl":[],"price_new":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 13px; "},"price_old":[],"price_tax":[],"btn_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"cart_btn":{"status":true,"fonts":{"status":false,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;"},"font_color":{"normal":"rgb(0, 0, 0)","hover":""},"background":{"normal":"rgb(255, 255, 255)","hover":""},"border":{"normal":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(64, 64, 72)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(64, 64, 72);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","css_hover":"border: 0px; border-style: solid;border-color: rgb(64, 64, 72);border-radius: 0px;"},"quickview_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":""},"background":{"normal":"rgb(255, 255, 255)","hover":""},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); ","css_hover":""},"links":{"wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"normal":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"hover":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); "}}},"css_data":{"block_normal":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","block_hover":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 0px;","image_normal":"","image_hover":"","info_block":"background-color: rgb(255, 255, 255); ","info_wrpper":"background-color: rgb(255, 255, 255); ","info_name":"color: rgb(0, 0, 0); font-size: 13px; text-align: center; ","info_name_hover":"color: rgb(0, 0, 0); ","info_description":"color: rgb(0, 0, 0); font-size: 13px; text-align: left; ","price_wrp":"background-color: rgb(0, 0, 0); text-align: left; border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","price_block":"background-color: rgb(234, 232, 232); text-align: left; padding: 5px;","price_spl":"","price_new":"color: rgb(0, 0, 0); font-size: 13px; ","price_old":"","price_tax":"","btn_wrp":"background-color: rgb(255, 255, 255); ","cart_btn_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","cart_btn_hover":"border: 0px; border-style: solid;border-color: rgb(64, 64, 72);border-radius: 0px;","quickview_btn_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); ","quickview_btn_hover":"","links_wrp":"background-color: rgb(255, 255, 255); ","links_normal":"color: rgb(0, 0, 0); font-size: 13px; text-align: left; ","links_hover":"color: rgb(0, 0, 0); "}},"prd_block2":[],"prd_block3":[],"prd_small1":{"status":true,"type":"grid","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"hover":[]},"image":[],"prdname":[],"prdname_hover":"","price_block":[],"price_spl":"","price_new":"","price_old":"","btn":"","btn_hover":""},"css_data":{"block_normal":"background-color: rgb(255, 255, 255); ","block_hover":"","image":"","prdname":"","prdname_hover":"","price_block":"","price_spl":"","price_new":"","price_old":"","btn":"","btn_hover":""}},"prd_small2":{"status":true,"type":"grid","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"hover":[]},"image":[],"prdname":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"prdname_hover":"","price_block":[],"price_spl":"","price_new":"rgb(0, 0, 0)","price_old":"","btn":{"status":true,"fonts":[],"font_color":{"normal":"","hover":""},"background":{"normal":"","hover":""},"border":{"normal":[],"hover":[]},"padding":{"status":true,"type":"all","pad":"5","pad_type":"inherit","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: inherit;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"padding: inherit;margin: auto;","css_hover":""}},"css_data":{"block_normal":"background-color: rgb(255, 255, 255); ","block_hover":"","image":"","prdname":"color: rgb(0, 0, 0); font-size: 13px; text-align: left; ","prdname_hover":"","price_block":"","price_spl":"","price_new":"color: rgb(0, 0, 0); ","price_old":"","btn_normal":"padding: inherit;margin: auto;","btn_hover":""}}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"tab1":{"tab_container":[],"tab_panel":[],"tab_item":[],"tab_item_active":[],"tab_item_a":[],"tab_item_active_a":[],"tab_pane_wrp":[],"tab_pane_active":[]},"prd_block1":[],"prd_block2":[],"prd_block3":[],"prd_small1":[],"prd_small2":[]},"m":{"status":true,"main":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"30","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"30","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 30px; padding-right: 0px; padding-bottom: 30px; padding-left: 0px; "},"margin":[],"shadow":[],"w":"","h":"","css":"padding-top: 30px; padding-right: 0px; padding-bottom: 30px; padding-left: 0px; "},"main_bg":[],"mod_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"mod_content":[],"mod_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"20px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"20","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 20px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"14px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;color: rgba(255, 255, 255, 0.5); font-size: 14px; text-align: center; "},"b_html":[],"l_html":[],"r_html":[],"tab1":{"tab_container":[],"tab_panel":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"20","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"tab_item":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"rgba(0, 0, 0, 0)","color":"rgb(167, 144, 116)","f_size":"14px","text_align":"center","border":{"status":false,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":{"status":false,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"10","pad_t_type":"int","pad_r":"20","pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":"20","pad_l_type":"int","css":"padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px; "},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":"10","mrg_r_type":"int","mrg_b":0,"mrg_b_type":"auto","mrg_l":"10","mrg_l_type":"int","css":"margin-top: auto; margin-right: 10px; margin-bottom: auto; margin-left: 10px; "},"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); font-size: 14px; text-align: center; margin-top: auto; margin-right: 10px; margin-bottom: auto; margin-left: 10px; "},"tab_item_active":[],"tab_item_a":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"rgb(167, 144, 116)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"10","pad_t_type":"int","pad_r":"20","pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":"20","pad_l_type":"int","css":"padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); color: rgb(167, 144, 116); border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px; "},"tab_item_active_a":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); border: 1px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"tab_pane_wrp":[],"tab_pane_active":[]},"prd_block1":[],"prd_block2":[],"prd_block3":[],"prd_small1":[],"prd_small2":[]}}'),
(39674, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.d.b_html', '{"family":"","subset":""}'),
(39673, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.m.t_html', '{"family":"Roboto:300","subset":"latin"}'),
(39675, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.t.b_html', '{"family":"","subset":""}'),
(39676, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.m.b_html', '{"family":"","subset":""}'),
(39677, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.d.l_html', '{"family":"","subset":""}'),
(39678, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.t.l_html', '{"family":"","subset":""}'),
(39671, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.d.t_html', '{"family":"Roboto:300","subset":"latin"}'),
(38365, 0, 'rgen_modtheme', 'rgen_prdpghtml', 'rgen_prdpghtml.rgFot', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""},"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"rgb(28, 28, 28)","color":"rgba(255, 255, 255, 0.5)","f_size":"16px","text_align":"center","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"30","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 30px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: #666666; text-transform: none; letter-spacing: 0px;color: rgba(255, 255, 255, 0.5); font-size: 16px; text-align: center; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding: 30px;"},"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"t":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"m":{"status":true,"main":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]}}'),
(37337, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.mod_sub_hd', '{"family":"","subset":""}'),
(37338, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.t.mod_sub_hd', '{"family":"","subset":""}'),
(37339, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.m.mod_sub_hd', '{"family":"","subset":""}'),
(37340, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.t_html', '{"family":"","subset":""}'),
(37341, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.t.t_html', '{"family":"","subset":""}'),
(37342, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.m.t_html', '{"family":"","subset":""}'),
(37343, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.b_html', '{"family":"","subset":""}'),
(37344, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.t.b_html', '{"family":"","subset":""}'),
(37345, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.m.b_html', '{"family":"","subset":""}'),
(37346, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.l_html', '{"family":"","subset":""}'),
(37347, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.t.l_html', '{"family":"","subset":""}'),
(37348, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.m.l_html', '{"family":"","subset":""}'),
(37349, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.r_html', '{"family":"","subset":""}'),
(37350, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.t.r_html', '{"family":"","subset":""}'),
(37351, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.m.r_html', '{"family":"","subset":""}'),
(37352, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block1.text', '{"family":"","subset":""}'),
(37353, 0, 'rgen_modtheme', 'fonts', 'rgen_contentblocks.rgGTy.d.ctn_block1.name', '{"family":"Roboto:500","subset":"latin"}'),
(37336, 0, 'rgen_modtheme', 'rgen_contentblocks', 'rgen_contentblocks.rgGTy', '{"status":true,"dots":{"wrp":[],"normal":[],"active":[]},"arrows":{"wrp":[],"arrow_line":[],"arrow":[]},"ctn_block":"2","d":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"content_rw":{"rw":[],"cl":[],"first_cl":[],"last_cl":[]},"ctn_block1":{"setting":{"main":{"normal":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0.2)","color":"","f_size":"13px","text_align":"center","border":[],"padding":{"status":true,"type":"all","pad":"15","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 15px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(255, 255, 255, 0.2); text-align: center; padding: 15px;"},"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"500","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 500; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(152, 139, 146)","f_size":"16px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 500; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(152, 139, 146); font-size: 16px; text-align: center; "},"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block2":{"setting":{"main":{"normal":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0.05)","color":"","f_size":"13px","text_align":"center","border":[],"padding":{"status":true,"type":"all","pad":"15","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 15px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0.05); text-align: center; padding: 15px;"},"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); text-align: center; "},"hover":[]},"name":{"normal":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"500","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 500; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"16px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 500; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 16px; text-align: center; "},"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"hover":[]},"btn":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"700","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(77, 69, 80)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(77, 69, 80)"},"border":{"normal":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"}},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"6","pad_t_type":"int","pad_r":"15","pad_r_type":"int","pad_b":"7","pad_b_type":"int","pad_l":"15","pad_l_type":"int","css":"padding-top: 6px; padding-right: 15px; padding-bottom: 7px; padding-left: 15px; "},"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(77, 69, 80); background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding-top: 6px; padding-right: 15px; padding-bottom: 7px; padding-left: 15px; ","css_hover":"color: rgb(255, 255, 255); background-color: rgb(77, 69, 80); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"link":[]}},"ctn_block3":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]},"name_line":{"normal":[],"hover":[]}},"ctn_block4":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"content_rw":{"rw":[],"cl":[],"first_cl":[],"last_cl":[]},"ctn_block1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block3":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]},"name_line":{"normal":[],"hover":[]}},"ctn_block4":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}}},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"outer_rw":{"rw":[],"first_rw":[],"last_rw":[],"cl":[],"first_cl":[],"last_cl":[]},"content_rw":{"rw":[],"cl":[],"first_cl":[],"last_cl":[]},"ctn_block1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block3":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]},"name_line":{"normal":[],"hover":[]}},"ctn_block4":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small1":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}},"ctn_block_small2":{"setting":{"main":{"normal":[],"hover":[]},"inner_wrp":{"normal":[],"hover":[]},"figure":{"normal":[],"hover":[]},"text_wrp":{"normal":[],"hover":[]},"name":{"normal":[],"hover":[]},"text":{"normal":[],"hover":[]},"btn_wrp":{"normal":[],"hover":[]},"btn":[],"link":[]}}}}'),
(39852, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.t.r_html', '{"family":"","subset":""}'),
(39853, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.m.r_html', '{"family":"","subset":""}'),
(39851, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.d.r_html', '{"family":"","subset":""}'),
(39837, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.t.mod_hd', '{"family":"","subset":""}');
INSERT INTO `mcc_rgen_modules_customize` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(39838, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.m.mod_hd', '{"family":"","subset":""}'),
(39839, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.d.t_html', '{"family":"","subset":""}'),
(39840, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.t.t_html', '{"family":"","subset":""}'),
(39841, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.m.t_html', '{"family":"","subset":""}'),
(39842, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.d.b_html', '{"family":"","subset":""}'),
(39849, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.t.m_html', '{"family":"","subset":""}'),
(39850, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.m.m_html', '{"family":"","subset":""}'),
(39836, 0, 'rgen_modtheme', 'fonts', 'rgen_customhtml.rgu2K.d.mod_hd', '{"family":"","subset":""}'),
(39595, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.infobox2bt', '{"family":"","subset":""}'),
(39594, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.infobox2hd', '{"family":"","subset":""}'),
(39593, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.infobox1bt', '{"family":"","subset":""}'),
(39592, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.infobox1hd', '{"family":"","subset":""}'),
(39591, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.img3', '{"family":"","subset":""}'),
(39590, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.img1', '{"family":"","subset":""}'),
(39589, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.brd1', '{"family":"","subset":""}'),
(39586, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.cat2links', '{"family":"","subset":""}'),
(39584, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.cat1links', '{"family":"","subset":""}'),
(39582, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.normallink', '{"family":"","subset":""}'),
(39580, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.flyout', '{"family":"","subset":""}'),
(39588, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.prd2btn', '{"family":"","subset":""}'),
(39585, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.cat2hd', '{"family":"Oswald:regular","subset":"latin"}'),
(39583, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.cat1hd', '{"family":"Oswald:regular","subset":"latin"}'),
(39598, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.infobox4hd', '{"family":"","subset":""}'),
(39599, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.infobox4bt', '{"family":"","subset":""}'),
(39587, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.prd1btn', '{"family":"Oswald:regular","subset":"latin"}'),
(39581, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.normalhd', '{"family":"","subset":""}'),
(39579, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.menuitem', '{"family":"","subset":""}'),
(39596, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.infobox3hd', '{"family":"","subset":""}'),
(39597, 0, 'rgen_modtheme', 'fonts', 'rgen_menu.rgvP4.infobox3bt', '{"family":"Oswald:regular","subset":"latin"}'),
(39835, 0, 'rgen_modtheme', 'rgen_customhtml', 'rgen_customhtml.rgu2K', '{"status":true,"d":{"status":true,"main":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":"10","pad_type":"int","pad_t":"100","pad_t_type":"int","pad_r":0,"pad_r_type":"inherit","pad_b":"-20","pad_b_type":"int","pad_l":0,"pad_l_type":"inherit","css":"padding-top: 100px; padding-right: inherit; padding-bottom: -20px; padding-left: inherit; "},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"int","mrg_t":"30","mrg_t_type":"int","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: 30px; margin-right: auto; margin-bottom: 0px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); padding-top: 100px; padding-right: inherit; padding-bottom: -20px; padding-left: inherit; margin-top: 30px; margin-right: auto; margin-bottom: 0px; margin-left: auto; "},"main_bg":{"status":true,"image":"..\\/image\\/catalog\\/zuixinshangjia.jpg","position":"center center","position_x":"0","position_y":"0","repeat":"no-repeat","attachment":"inherit","bgsize":"inherit","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: url(image\\/catalog\\/zuixinshangjia.jpg);background-position: center center;background-repeat: no-repeat;background-size: inherit;background-attachment: inherit;"},"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":{"status":false,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""},"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":{"status":false,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; "}},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"m_html":[],"r_html":[]}}'),
(39682, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgj9L.m.r_html', '{"family":"","subset":""}'),
(37265, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgBhu.d.mod_sub_hd', '{"family":"","subset":""}'),
(37266, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.m.r_html', '{"family":"","subset":""}'),
(37267, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.t.r_html', '{"family":"","subset":""}'),
(37268, 0, 'rgen_modtheme', 'fonts', 'rgen_productgroups.rgJkT.d.r_html', '{"family":"","subset":""}'),
(37269, 0, 'rgen_modtheme', 'rgen_productgroups', 'rgen_productgroups.rgJkT', '{"status":true,"counter":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"dots":{"wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"active":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "}},"arrows":{"wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"arrow_line":[],"arrow":[]},"d":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"tab1":{"tab_container":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"tab_panel":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); text-align: left; "},"tab_item":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-size: 13px; text-align: left; "},"tab_item_active":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"tab_item_a":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"tab_item_active_a":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"tab_pane_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"tab_pane_active":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "}},"prd_block1":{"status":true,"type":"normal","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"hover":[]},"image":{"normal":[],"hover":[]},"info_block":[],"info_wrpper":[],"info_name":[],"info_name_hover":[],"info_description":[],"price_wrp":[],"price_block":[],"price_spl":[],"price_new":[],"price_old":[],"price_tax":[],"btn_wrp":[],"cart_btn":[],"quickview_btn":[],"links":{"wrp":[],"normal":[],"hover":[]}},"css_data":{"block_normal":"background-color: rgb(255, 255, 255); ","block_hover":"","image_normal":"","image_hover":"","info_block":"","info_wrpper":"","info_name":"","info_name_hover":"","info_description":"","price_wrp":"","price_block":"","price_spl":"","price_new":"","price_old":"","price_tax":"","btn_wrp":"","cart_btn_normal":"","cart_btn_hover":"","quickview_btn_normal":"","quickview_btn_hover":"","links_wrp":"","links_normal":"","links_hover":""}},"prd_block2":[],"prd_block3":[],"prd_small1":[],"prd_small2":[]},"t":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"tab1":{"tab_container":[],"tab_panel":[],"tab_item":[],"tab_item_active":[],"tab_item_a":[],"tab_item_active_a":[],"tab_pane_wrp":[],"tab_pane_active":[]},"prd_block1":[],"prd_block2":[],"prd_block3":[],"prd_small1":[],"prd_small2":[]},"m":{"status":true,"main":[],"main_bg":[],"mod_wrp":[],"mod_content":[],"mod_hd":[],"mod_sub_hd":[],"rw":[],"l_cl":[],"m_cl":[],"r_cl":[],"t_html":[],"b_html":[],"l_html":[],"r_html":[],"tab1":{"tab_container":[],"tab_panel":[],"tab_item":[],"tab_item_active":[],"tab_item_a":[],"tab_item_active_a":[],"tab_pane_wrp":[],"tab_pane_active":[]},"prd_block1":[],"prd_block2":[],"prd_block3":[],"prd_small1":[],"prd_small2":[]}}');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_rgen_settings`
--

CREATE TABLE IF NOT EXISTS `mcc_rgen_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `group` varchar(64) NOT NULL,
  `section` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1353 ;

--
-- 转存表中的数据 `mcc_rgen_settings`
--

INSERT INTO `mcc_rgen_settings` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(80, 0, 'rgen_settings', 'rgen_footer', 'default_ft_social', '[]'),
(1057, 0, 'rgen_settings', 'rgen_general', 'responsive_status', 'true'),
(1058, 0, 'rgen_settings', 'rgen_general', 'wide_status', 'true'),
(1059, 0, 'rgen_settings', 'rgen_general', 'layout_width', '"fw"'),
(5, 0, 'rgen_settings', 'rgen_topbar', 'style', '2'),
(6, 0, 'rgen_settings', 'rgen_topbar', 'layout', '"fw"'),
(7, 0, 'rgen_settings', 'rgen_topbar', 'autosearch', 'true'),
(1348, 0, 'rgen_settings', 'rgen_topbar', 'topbar_popup_cart_btn_icon', 'true'),
(1349, 0, 'rgen_settings', 'rgen_topbar', 'topbar_popup_checkout_btn_icon', 'true'),
(1308, 0, 'rgen_settings', 'rgen_commoncomponents', 'scroll_top_icon', '"fa fa-chevron-up"'),
(1300, 0, 'rgen_settings', 'rgen_commoncomponents', 'page_hd_style', '2'),
(1301, 0, 'rgen_settings', 'rgen_commoncomponents', 'page_hd_pos', '"out"'),
(1302, 0, 'rgen_settings', 'rgen_commoncomponents', 'breadcrumb_home', '"lnk"'),
(129, 0, 'rgen_settings', 'rgen_footer', 'default_ft_tw', '"fw"'),
(130, 0, 'rgen_settings', 'rgen_footer', 'default_ft_bw', '"fw"'),
(16, 0, 'rgen_settings', 'rgen_footer', 'default_ft_ph', '{"status":false,"ph1":"(123) 456-7890","ph2":"(123) 456-7890","icon_type":"ico","icon":"fa fa-phone"}'),
(17, 0, 'rgen_settings', 'rgen_footer', 'default_ft_fax', '{"status":false,"fax1":"(123) 456-7890","fax2":"(123) 456-7890","icon_type":"ico","icon":"fa fa-fax"}'),
(18, 0, 'rgen_settings', 'rgen_footer', 'default_ft_mail', '{"status":false,"text":{"1":"Click here to <br>Email us"},"email":"mail@example.com","icon_type":"ico","icon":"fa fa-envelope"}'),
(131, 0, 'rgen_settings', 'rgen_footer', 'default_ft_cards', '{"1":"Powered By <a href=\\"http:\\/\\/www.opencart.com\\">OpenCart<\\/a> <span style=\\"margin: 0 5px;text-align:center;\\"> | <\\/span> R.Gen - OpenCart Modern Store Design &copy; 2015"}'),
(21, 0, 'rgen_settings', 'rgen_customcode', 'css_status', 'true'),
(22, 0, 'rgen_settings', 'rgen_customcode', 'js_status', 'false'),
(23, 0, 'rgen_settings', 'rgen_customcode', 'cssfile_status', 'false'),
(24, 0, 'rgen_settings', 'rgen_customcode', 'jsfile_status', 'false'),
(25, 0, 'rgen_settings', 'rgen_customcode', 'jscode', '""'),
(26, 0, 'rgen_settings', 'rgen_customcode', 'cssfiles', '[{"file":""}]'),
(27, 0, 'rgen_settings', 'rgen_customcode', 'jsfiles', '[{"file":""}]'),
(1253, 0, 'rgen_settings', 'rgen_prdblocks', 'gb_prd2', '{"grid":{"cart":false,"wishlist":false,"compare":false,"more":false,"description":false,"rating":false,"price":true,"quickview":false,"tax":false},"list":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"quickview":true,"tax":true},"normal":{"cart":false,"wishlist":false,"compare":false,"more":false,"description":true,"rating":true,"price":true,"quickview":true,"tax":true},"common":{"cart_ico_status":true,"cart_ico_type":"ico","cart_ico":"glyphicon glyphicon-shopping-cart","wish_ico_status":true,"wish_ico_type":"ico","wish_ico":"fa fa-heart","compare_ico_status":true,"compare_ico_type":"ico","compare_ico":"fa fa-retweet","more_ico_status":true,"more_ico_type":"ico","more_ico":"fa fa-arrow-circle-o-right","quickview_ico":"fa fa-eye","offer_tag":"dis","offer_text":{"1":""},"stock_status":false}}'),
(1254, 0, 'rgen_settings', 'rgen_prdblocks', 'gb_prd3', '{"grid":{"cart":true,"wishlist":false,"compare":false,"more":true,"description":false,"rating":true,"price":true,"quickview":true,"tax":true},"list":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"quickview":true,"tax":true},"normal":{"cart":true,"wishlist":false,"compare":false,"more":false,"description":false,"rating":false,"price":true,"quickview":true,"tax":false},"common":{"cart_ico_status":true,"cart_ico_type":"ico","cart_ico":"glyphicon glyphicon-shopping-cart","wish_ico_status":true,"wish_ico_type":"ico","wish_ico":"fa fa-heart","compare_ico_status":true,"compare_ico_type":"ico","compare_ico":"fa fa-retweet","more_ico_status":true,"more_ico_type":"ico","more_ico":"fa fa-arrow-circle-o-right","quickview_ico":"fa fa-eye","offer_tag":"dis","offer_text":[],"stock_status":false}}'),
(1054, 0, 'rgen_settings', 'rgen_page', 'cat_info', 'false'),
(1055, 0, 'rgen_settings', 'rgen_page', 'refine_search', '2'),
(1257, 0, 'rgen_settings', 'rgen_prdblocks', 'special', '{"prd_style":3,"gridview":"eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20","listview":"eq1 gt0 mb20"}'),
(1258, 0, 'rgen_settings', 'rgen_prdblocks', 'brand_info', '{"prd_style":2,"gridview":"eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20","listview":"eq1 gt0 mb20"}'),
(1259, 0, 'rgen_settings', 'rgen_prdblocks', 'search', '{"prd_style":2,"gridview":"eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20","listview":"eq1 gt0 mb20"}'),
(897, 0, 'rgen_settings', 'rgen_page', 'prdpg_layout', '3'),
(898, 0, 'rgen_settings', 'rgen_page', 'prdpg_rel_prdstyle', '1'),
(40, 0, 'rgen_settings', 'rgen_page', 'prdpgly2_l_size', '6'),
(41, 0, 'rgen_settings', 'rgen_page', 'prdpgly2_gt', '"gt40"'),
(959, 0, 'rgen_settings', 'rgen_page', 'prdpg_cartbtn_txt', 'true'),
(960, 0, 'rgen_settings', 'rgen_page', 'prdpg_cartbtn_ico_type', '"ico"'),
(961, 0, 'rgen_settings', 'rgen_page', 'prdpg_cartbtn_ico', '"glyphicon glyphicon-shopping-cart"'),
(962, 0, 'rgen_settings', 'rgen_page', 'prdpg_wishbtn_ico_type', '"ico"'),
(963, 0, 'rgen_settings', 'rgen_page', 'prdpg_wishbtn_ico', '"fa fa-heart"'),
(964, 0, 'rgen_settings', 'rgen_page', 'prdpg_comparebtn_ico_type', '"ico"'),
(965, 0, 'rgen_settings', 'rgen_page', 'prdpg_comparebtn_ico', '"fa fa-retweet"'),
(899, 0, 'rgen_settings', 'rgen_page', 'prdpg_cart_status', 'true'),
(900, 0, 'rgen_settings', 'rgen_page', 'prdpg_wishlist_status', 'true'),
(901, 0, 'rgen_settings', 'rgen_page', 'prdpg_compare_status', 'true'),
(902, 0, 'rgen_settings', 'rgen_page', 'prdpg_rating_status', 'true'),
(903, 0, 'rgen_settings', 'rgen_page', 'prdpg_price_status', 'true'),
(904, 0, 'rgen_settings', 'rgen_page', 'prdpg_tax_status', 'true'),
(905, 0, 'rgen_settings', 'rgen_page', 'prdpg_options_status', 'true'),
(906, 0, 'rgen_settings', 'rgen_page', 'prdpg_description_status', 'true'),
(907, 0, 'rgen_settings', 'rgen_page', 'prdpg_specification_status', 'true'),
(908, 0, 'rgen_settings', 'rgen_page', 'prdpg_social_sharing', '""'),
(1056, 0, 'rgen_settings', 'rgen_page', 'refine_view', '"grid"'),
(1352, 0, 'rgen_settings', 'rgen_optimization', 'system_optimization', '{"cssminify":true,"jsminify":true,"menu":true,"basicslideshow":false,"basicbanners":true,"bannergrids":true,"imagegallery":true,"productgroups":false,"customhtml":false,"contentblocks":true,"revslider":true,"gridmanager":true,"stickyhtml":true,"catshowcase":true,"deals":true,"contentslider":true}'),
(791, 0, 'rgen_settings', 'rgen_page', 'prdpg_cloudzoom', 'true'),
(792, 0, 'rgen_settings', 'rgen_page', 'prdpg_popup', 'true'),
(61, 0, 'rgen_settings', 'rgen_customcode', 'csscode', '".cards { text-align: right; }\\n\\n.prd-block1 .price { left: auto; right: 10px; }\\n\\n.prd-block3 a.btn-cart { display: block; }\\n.product-list .prd-block3 a.btn-cart { display: inline-block; }\\n\\n.reset-h,\\n.reset-h > .rw > .cl { min-height: inherit !important; }\\n\\n.cart-total .table>tbody>tr>td { font-weight: normal; }\\n.checkout-pg .panel-heading a, \\n.checkout-pg .panel-heading {\\n    color: inherit;\\n}\\n\\n.tf-item { display: inline-block; margin: 0 3px 5px 0; }\\n.tf-item img { width: auto; }\\n\\n@media only screen and (min-width: 200px) and (max-width: 979px){\\n.custom-infoboxes .ctn-block-small2 .img-wrp { float: none !important; max-width: 100% !important; }\\n.custom-infoboxes .ctn-block-small2 .text-wrp { margin-left: 0px !important; margin-right: 0px !important; }\\n}\\n\\n@media only screen and (max-width: 767px) and (min-width: 200px){\\n.fw.main-wrapper {overflow: hidden;}\\n.page-head h1 strong { font-size: 25px; }\\n.page-head{ padding-top: 10px; padding-bottom:10px; }\\n.cards,\\n.ft-hd { text-align: center; }\\n.nav-sub-handle { height: 35px; }\\n\\n.product-list .prd-block1 .info-wrp { padding: 10px !important; }\\n.product-list .prd-block1 .price-wrp { width: 100%; position: static; padding: 10px; margin-bottom: 10px; }\\n.product-list .prd-block1 .price {\\n    width: auto;\\n    height: auto;\\n    position: static;\\n}\\n.product-list .prd-block1 .price .vm-item { position: static; }\\n.product-list .prd-block1 .name,\\n.product-list .prd-block1 .description { text-align: center; }\\n}"'),
(1256, 0, 'rgen_settings', 'rgen_prdblocks', 'category', '{"prd_style":2,"gridview":" eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt10 mb10","listview":" eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20"}'),
(63, 0, 'rgen_settings', 'rgen_ocmodule', 'ocmd_latest', '{"prd_view":"carousel","prd_style":1,"col_prd_style":1,"grids":"eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20","carousel":{"item_margin":20,"item_display":1}}'),
(132, 0, 'rgen_settings', 'rgen_footer', 'default_ft_cphtml', '{"1":"Powered By <a href=\\"http:\\/\\/www.opencart.com\\">OpenCart<\\/a> <span style=\\"margin: 0 5px;text-align:center;\\"> | <\\/span> R.Gen - OpenCart Modern Store Design &copy; 2015"}'),
(909, 0, 'rgen_settings', 'rgen_page', 'prdpg_stock_status', 'false'),
(462, 0, 'rgen_settings', 'rgen_page', 'prdpgly3_l_size', '5'),
(463, 0, 'rgen_settings', 'rgen_page', 'prdpgly3_gt', '"gt30"'),
(1252, 0, 'rgen_settings', 'rgen_prdblocks', 'gb_prd1', '{"grid":{"cart":false,"wishlist":false,"compare":false,"more":true,"description":false,"rating":false,"price":true,"quickview":false,"tax":false},"list":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"quickview":true,"tax":true},"normal":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"quickview":true,"tax":true},"common":{"cart_ico_status":false,"cart_ico_type":"ico","cart_ico":"glyphicon glyphicon-shopping-cart","wish_ico_status":false,"wish_ico_type":"ico","wish_ico":"fa fa-heart","compare_ico_status":false,"compare_ico_type":"ico","compare_ico":"fa fa-retweet","more_ico_status":true,"more_ico_type":"ico","more_ico":"fa fa-arrow-circle-o-right","quickview_ico":"fa fa-eye","offer_tag":"dis","offer_text":{"1":"zh-cn - No data"},"stock_status":false}}'),
(1255, 0, 'rgen_settings', 'rgen_prdblocks', 'gb_prd4', '{"grid":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"quickview":true,"tax":true},"list":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"quickview":true,"tax":true},"normal":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"quickview":true,"tax":true},"common":{"cart_ico_status":true,"cart_ico_type":"ico","cart_ico":"glyphicon glyphicon-shopping-cart","wish_ico_status":true,"wish_ico_type":"ico","wish_ico":"fa fa-heart","compare_ico_status":true,"compare_ico_type":"ico","compare_ico":"fa fa-retweet","more_ico_status":true,"more_ico_type":"ico","more_ico":"fa fa-arrow-circle-o-right","quickview_ico":"fa fa-eye","offer_tag":"dis","offer_text":[],"stock_status":false}}'),
(1263, 0, 'rgen_settings', 'rgen_topbar', 'topbar2_general', '{"logo_in_menu":"n","logo_w":190,"logo_position":"c","cart_link":false,"checkout_link":false,"wishlist":true,"myaccount":false,"myaccount_icon":"fa fa-user","cart":true,"cart_icon":{"icon":"glyphicon glyphicon-shopping-cart"},"search":true,"currency":false,"language":false,"customlinks":true,"customlink_data":[]}');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_rgen_theme`
--

CREATE TABLE IF NOT EXISTS `mcc_rgen_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `group` varchar(64) NOT NULL,
  `section` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3075 ;

--
-- 转存表中的数据 `mcc_rgen_theme`
--

INSERT INTO `mcc_rgen_theme` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(760, 0, 'rgen_theme', 'fonts', 'body', '{"family":"","subset":""}'),
(2, 0, 'rgen_theme', 'rgen_topbar', 'topbar_common', '{"style":2,"layout":"fw","autosearch":true}'),
(3072, 0, 'rgen_theme', 'fonts', 'topbar2_cart_cartbtn', '{"family":"","subset":""}'),
(3073, 0, 'rgen_theme', 'fonts', 'topbar2_cart_checkoutbtn', '{"family":"","subset":""}'),
(3074, 0, 'rgen_theme', 'fonts', 'topbar2_search_input', '{"family":"","subset":""}'),
(759, 0, 'rgen_theme', 'rgen_general', 'theme_general', '{"status":true,"layout_settings":{"responsive_status":true,"wide_status":true,"layout_width":"fw"},"body":{"block":{"status":true,"fonts":{"status":true,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"12px","line_height":"1.4","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"rgb(0, 0, 0)","css":"font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 1.4; font-style: normal; font-weight: normal; color: rgb(0, 0, 0); text-transform: none; letter-spacing: 0px;"},"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 1.4; font-style: normal; font-weight: normal; color: rgb(0, 0, 0); text-transform: none; letter-spacing: 0px;"},"image":{"status":true,"image":"..\\/image\\/no_image.png","position":"center center","position_x":"0","position_y":"0","repeat":"no-repeat","attachment":"fixed","bgsize":"cover","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: none;background-position: center center;background-repeat: no-repeat;background-size: cover;background-attachment: fixed;"}},"page_container":{"block":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":{"status":true,"inset":"n","hor_l":0,"ver_l":0,"blur":"5","spread":"0","color":"rgba(0,0,0,0.05)","css":"box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.05);"},"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.05);"},"image":[],"margin_t":"0","margin_b":"0"},"contentarea":{"block":[],"image":[]},"contentbox":{"block":[],"image":[]}}'),
(2980, 0, 'rgen_theme', 'fonts', 'pg_heading_h1', '{"family":"Oswald:300","subset":"latin"}'),
(2981, 0, 'rgen_theme', 'fonts', 'breadcrumb', '{"family":"","subset":""}'),
(831, 0, 'rgen_theme', 'rgen_ocmodule', 'ocmod_cataccount', '{"status":true,"hd":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"list_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"list_item":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"0","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"0","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); border-width: 0px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","css_hover":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); border-width: 0px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"sublink_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":"0","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 0px 0px;border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border-width: 0px 0px 0px 0px;border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"sublink_item":"rgb(0, 0, 0)","sublink_item_hover":"rgb(0, 0, 0)","sublink_bullet":"rgb(0, 0, 0)"}'),
(3055, 0, 'rgen_theme', 'fonts', 'module_hd', '{"family":"","subset":""}'),
(3058, 0, 'rgen_theme', 'fonts', 'other_hd', '{"family":"Oswald:regular","subset":"latin"}'),
(13, 0, 'rgen_theme', 'fonts', 'default_ft_contact_font', '{"family":"","subset":""}'),
(14, 0, 'rgen_theme', 'rgen_footer', 'default_ft_contactinfo', '{"status":true,"ph_status":false,"phone1":"(123) 456-7890","phone2":"(123) 456-7890","phone_icon":[],"fax_status":false,"fax1":"(123) 456-7890","fax2":"(123) 456-7890","fax_icon":[],"mail_status":false,"mailtext":{"1":"Click here to <br>Email us"},"maillink":"mail@example.com","mail_icon":[],"block":[],"text_color":"rgb(255, 255, 255)","a":"rgb(255, 255, 255)","a_hover":"rgb(67, 68, 68)","icon_blocks":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0.2)","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":{"status":true,"inset":"n","hor_l":0,"ver_l":0,"blur":0,"spread":0,"color":"rgba(0,0,0,0.05)","css":"box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"w":"","h":"","css":"background-color: rgba(255, 255, 255, 0.2); color: rgb(255, 255, 255); box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"}}'),
(168, 0, 'rgen_theme', 'rgen_footer', 'default_ft_social', '{"status":false,"icon_blocks":{"status":true,"fonts":[],"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgba(255, 255, 255, 0)","hover":"rgb(167, 144, 116)"},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); ","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); "},"network":[]}'),
(2805, 0, 'rgen_theme', 'fonts', 'prd1_offer_dis', '{"family":"","subset":""}'),
(2806, 0, 'rgen_theme', 'fonts', 'prd1_offer_txt', '{"family":"","subset":""}'),
(2807, 0, 'rgen_theme', 'fonts', 'prd1_normal_name', 'null'),
(2808, 0, 'rgen_theme', 'fonts', 'prd1_normal_description', 'null'),
(2809, 0, 'rgen_theme', 'fonts', 'prd1_normal_price_spl', 'null'),
(2811, 0, 'rgen_theme', 'fonts', 'prd1_normal_cartbtn', 'null'),
(2812, 0, 'rgen_theme', 'fonts', 'prd1_grid_name', 'null'),
(2813, 0, 'rgen_theme', 'fonts', 'prd1_grid_description', 'null'),
(2814, 0, 'rgen_theme', 'fonts', 'prd1_grid_price_spl', 'null'),
(2815, 0, 'rgen_theme', 'fonts', 'prd1_grid_price_new', 'null'),
(2816, 0, 'rgen_theme', 'fonts', 'prd1_grid_cartbtn', 'null'),
(2818, 0, 'rgen_theme', 'fonts', 'prd1_list_description', '{"family":"","subset":""}'),
(2820, 0, 'rgen_theme', 'fonts', 'prd1_list_price_new', '{"family":"Roboto:700","subset":"latin"}'),
(2821, 0, 'rgen_theme', 'fonts', 'prd1_list_cartbtn', 'null'),
(2822, 0, 'rgen_theme', 'fonts', 'prd2_offer_dis', '{"family":"","subset":""}'),
(2823, 0, 'rgen_theme', 'fonts', 'prd2_offer_txt', '{"family":"","subset":""}'),
(2828, 0, 'rgen_theme', 'fonts', 'prd2_normal_cartbtn', 'null'),
(2829, 0, 'rgen_theme', 'fonts', 'prd2_grid_name', '{"family":"","subset":""}'),
(2831, 0, 'rgen_theme', 'fonts', 'prd2_grid_price_spl', '{"family":"","subset":""}'),
(2833, 0, 'rgen_theme', 'fonts', 'prd2_grid_cartbtn', 'null'),
(2834, 0, 'rgen_theme', 'fonts', 'prd2_list_name', '{"family":"","subset":""}'),
(2835, 0, 'rgen_theme', 'fonts', 'prd2_list_description', '{"family":"","subset":""}'),
(2836, 0, 'rgen_theme', 'fonts', 'prd2_list_price_spl', '{"family":"","subset":""}'),
(2837, 0, 'rgen_theme', 'fonts', 'prd2_list_price_new', '{"family":"","subset":""}'),
(2838, 0, 'rgen_theme', 'fonts', 'prd2_list_cartbtn', 'null'),
(2839, 0, 'rgen_theme', 'fonts', 'prd3_offer_dis', '{"family":"","subset":""}'),
(2840, 0, 'rgen_theme', 'fonts', 'prd3_offer_txt', '{"family":"","subset":""}'),
(2842, 0, 'rgen_theme', 'fonts', 'prd3_normal_description', '{"family":"","subset":""}'),
(2845, 0, 'rgen_theme', 'fonts', 'prd3_normal_cartbtn', 'null'),
(2846, 0, 'rgen_theme', 'fonts', 'prd3_grid_name', 'null'),
(2847, 0, 'rgen_theme', 'fonts', 'prd3_grid_description', 'null'),
(2848, 0, 'rgen_theme', 'fonts', 'prd3_grid_price_spl', 'null'),
(2849, 0, 'rgen_theme', 'fonts', 'prd3_grid_price_new', 'null'),
(2850, 0, 'rgen_theme', 'fonts', 'prd3_grid_cartbtn', 'null'),
(2855, 0, 'rgen_theme', 'fonts', 'prd3_list_cartbtn', 'null'),
(2843, 0, 'rgen_theme', 'fonts', 'prd3_normal_price_spl', '{"family":"Roboto:regular","subset":"latin"}'),
(2844, 0, 'rgen_theme', 'fonts', 'prd3_normal_price_new', '{"family":"Roboto:regular","subset":"latin"}'),
(832, 0, 'rgen_theme', 'fonts', 'ocmd_cataccount_hd', '{"family":"","subset":""}'),
(833, 0, 'rgen_theme', 'fonts', 'ocmd_cataccount_item', '{"family":"","subset":""}'),
(732, 0, 'rgen_theme', 'fonts', 'refine_search1_title', '{"family":"","subset":""}'),
(2987, 0, 'rgen_theme', 'rgen_commoncomponents', 'global', '{"status":true,"links":{"normal":"rgb(221, 92, 92)","hover":"rgb(221, 92, 92)"},"border_color":"rgba(167, 144, 116, 0.1)","scrolltop":{"background":"rgb(167, 144, 116)","icon":[],"border":[]},"pagination":{"wrapper":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":"0","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 0px 0px;border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; border-width: 0px 0px 0px 0px;border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"block":[],"active":{"status":true,"fonts":[],"background":"rgb(167, 144, 116)","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(167, 144, 116); color: rgb(255, 255, 255); font-size: 13px; border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"normal":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"rgba(255, 255, 255, 0.5)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); color: rgba(255, 255, 255, 0.5); font-size: 13px; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"}},"arrow_wrp":[],"arrow_line":"rgba(167, 144, 116, 0.08)","arrows":{"status":true,"fonts":[],"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(167, 144, 116)"},"background":{"normal":"rgb(167, 144, 116)","hover":"rgb(0, 0, 0)"},"border":{"normal":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":"1","mrg_r_type":"int","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: 1px; margin-bottom: auto; margin-left: auto; "},"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;margin-top: auto; margin-right: 1px; margin-bottom: auto; margin-left: auto; ","css_hover":"color: rgb(167, 144, 116); background-color: rgb(0, 0, 0); border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"hr":{"block":{"status":true,"fonts":[],"background":"rgba(167, 144, 116, 0.1)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"1","css":"background-color: rgba(167, 144, 116, 0.1); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;height:1px;"},"bg":{"status":true,"image":"..\\/image\\/no_image.png","position":"center center","position_x":"0","position_y":"0","repeat":"repeat","attachment":"inherit","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: none;background-position: center center;background-repeat: repeat;background-size: auto;background-attachment: inherit;"}},"dots":{"dot_line":"#434444","dot_normal":{"background":"#ffffff","w":25,"h":25,"border":{"size_all":5,"radius_all":20,"color":"#434444"}},"dot_active":{"background":"#6ddee2","border":{"size_all":5,"radius_all":20,"color":"#ffffff"},"shadow":{"ver_l":1,"blur":5,"color":"rgba(0, 0, 0, 0.3)"}}}}'),
(825, 0, 'rgen_theme', 'fonts', 'small_btn', '{"family":"Roboto:500","subset":"latin"}'),
(2819, 0, 'rgen_theme', 'fonts', 'prd1_list_price_spl', '{"family":"Roboto:700","subset":"latin"}'),
(600, 0, 'rgen_theme', 'fonts', 'prdpg_tags', '{"family":"","subset":""}'),
(601, 0, 'rgen_theme', 'fonts', 'prdpg_title', '{"family":"","subset":""}'),
(67, 0, 'rgen_theme', 'fonts', 'prdpg_ly2_price_new', '{"family":"Roboto:700","subset":"latin"}'),
(68, 0, 'rgen_theme', 'fonts', 'prdpg_ly2_price_old', '{"family":"","subset":""}'),
(69, 0, 'rgen_theme', 'fonts', 'prdpg_ly2_price_tax', '{"family":"","subset":""}'),
(70, 0, 'rgen_theme', 'fonts', 'prdpg_ly2_infolinks', '{"family":"","subset":""}'),
(71, 0, 'rgen_theme', 'fonts', 'prdpg_ly2_price_spl', '{"family":"Roboto:700","subset":"latin"}'),
(72, 0, 'rgen_theme', 'rgen_page', 'prdpg_ly2', '{"status":true,"l_size":6,"gt":"gt40","price":{"wrapper":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":{"status":false,"type":"all","pad":"15","pad_type":"inherit","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: inherit;"},"margin":[],"shadow":[],"w":"","h":"","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"block":[],"price_spl":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"700","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"25px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 25px; text-align: left; "},"price_new":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"700","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"25px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 25px; text-align: left; "},"price_old":{"status":true,"fonts":{"status":true,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;color: rgba(255, 255, 255, 0.5); font-size: 13px; text-align: left; "},"price_tax":{"status":true,"fonts":{"status":true,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;color: rgba(255, 255, 255, 0.5); font-size: 13px; text-align: left; "},"reward":"rgba(255, 255, 255, 0.5)","discount":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"discount_items":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"}},"info_links":{"block":[],"links":[]}}'),
(632, 0, 'rgen_theme', 'fonts', 'prdpg_qty_input', '{"family":"Oswald:regular","subset":"latin"}'),
(384, 0, 'rgen_theme', 'fonts', 'prdpg_options_hd', '{"family":"","subset":""}'),
(385, 0, 'rgen_theme', 'fonts', 'prdpg_options_btn', '{"family":"","subset":""}'),
(505, 0, 'rgen_theme', 'fonts', 'prdpg_tabs_item', '{"family":"Oswald:regular","subset":"latin"}'),
(506, 0, 'rgen_theme', 'fonts', 'prdpg_tabs_table_th', '{"family":"","subset":""}'),
(507, 0, 'rgen_theme', 'fonts', 'prdpg_reviewfrm_hd', '{"family":"","subset":""}'),
(508, 0, 'rgen_theme', 'fonts', 'prdpg_reviewfrm_fields', '{"family":"","subset":""}'),
(509, 0, 'rgen_theme', 'fonts', 'prdpg_reviewfrm_btn', '{"family":"","subset":""}'),
(83, 0, 'rgen_theme', 'rgen_commoncomponents', 'table_style', '{"status":true,"table":{"border":[],"background":"rgba(255, 255, 255, 0)"},"th":{"block":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"rgb(255, 255, 255)","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: rgb(255, 255, 255); text-transform: uppercase; letter-spacing: 0px;"},"background":"rgba(167, 144, 116, 0.1)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(167, 144, 116, 0.1); font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: rgb(255, 255, 255); text-transform: uppercase; letter-spacing: 0px;"},"first":[],"last":[]},"td":{"block":{"status":true,"fonts":{"status":false,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: ; text-transform: none; letter-spacing: 0px;"},"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""},"first":[],"last":[]}}'),
(84, 0, 'rgen_theme', 'fonts', 'table_th', '{"family":"Oswald:regular","subset":"latin"}'),
(85, 0, 'rgen_theme', 'fonts', 'table_td', '{"family":"","subset":""}'),
(631, 0, 'rgen_theme', 'fonts', 'prdpg_qty_lbl', '{"family":"","subset":""}'),
(633, 0, 'rgen_theme', 'fonts', 'prdpg_qty_cartbt', '{"family":"Roboto:700","subset":"latin"}'),
(89, 0, 'rgen_theme', 'fonts', 'shoppingcart_cart_title', '{"family":"","subset":""}'),
(90, 0, 'rgen_theme', 'fonts', 'shoppingcart_other_title', '{"family":"","subset":""}'),
(91, 0, 'rgen_theme', 'fonts', 'shoppingcart_qty', '{"family":"","subset":""}'),
(92, 0, 'rgen_theme', 'fonts', 'shoppingcart_total_block', '{"family":"Oswald:regular","subset":"latin"}'),
(93, 0, 'rgen_theme', 'rgen_page', 'shoppingcart', '{"status":true,"cart_title":[],"other_title":[],"qty":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"center","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); color: rgb(255, 255, 255); font-size: 13px; text-align: center; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"total_block":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"14px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 14px; "},"total_summary":[],"total":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"22px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 22px; "}}'),
(94, 0, 'rgen_theme', 'fonts', 'shoppingcart_total', '{"family":"Oswald:regular","subset":"latin"}'),
(2878, 0, 'rgen_theme', 'fonts', 'form_title', '{"family":"Oswald:regular","subset":"latin"}'),
(2879, 0, 'rgen_theme', 'fonts', 'form_label', '{"family":"","subset":""}'),
(2880, 0, 'rgen_theme', 'fonts', 'form_ctrl', '{"family":"","subset":""}'),
(2896, 0, 'rgen_theme', 'fonts', 'checkout_panel_title', '{"family":"Oswald:regular","subset":"latin"}'),
(2897, 0, 'rgen_theme', 'fonts', 'checkout_form_title', '{"family":"","subset":""}'),
(2898, 0, 'rgen_theme', 'fonts', 'checkout_form_label', '{"family":"","subset":""}'),
(2899, 0, 'rgen_theme', 'fonts', 'checkout_form_ctrl', '{"family":"","subset":""}'),
(2900, 0, 'rgen_theme', 'fonts', 'checkout_table_th', '{"family":"","subset":""}'),
(2901, 0, 'rgen_theme', 'fonts', 'checkout_table_td', '{"family":"","subset":""}'),
(2902, 0, 'rgen_theme', 'fonts', 'checkout_default_btn', '{"family":"","subset":""}'),
(826, 0, 'rgen_theme', 'fonts', 'mini_btn', '{"family":"Roboto:500","subset":"latin"}'),
(827, 0, 'rgen_theme', 'fonts', 'xs_btn', '{"family":"Oswald:regular","subset":"latin"}'),
(107, 0, 'rgen_theme', 'fonts', 'brands_index_hd', '{"family":"","subset":""}'),
(108, 0, 'rgen_theme', 'fonts', 'brands_list_hd', '{"family":"Oswald:regular","subset":"latin"}'),
(109, 0, 'rgen_theme', 'rgen_page', 'brands', '{"status":true,"index":{"block":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); color: rgb(255, 255, 255); font-size: 13px; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"hd":[],"atoz":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"14px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgba(0, 0, 0, 0)","hover":"rgb(167, 144, 116)"},"border":{"normal":[],"hover":[]},"padding":{"status":true,"type":"dif","pad":"5","pad_type":"int","pad_t":"6","pad_t_type":"int","pad_r":"10","pad_r_type":"int","pad_b":"5","pad_b_type":"int","pad_l":"10","pad_l_type":"int","css":"padding-top: 6px; padding-right: 10px; padding-bottom: 5px; padding-left: 10px; "},"margin":[],"shadow":{"normal":{"status":true,"inset":"n","hor_l":0,"ver_l":0,"blur":0,"spread":0,"color":"rgba(0,0,0,0.05)","css":"box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"hover":{"status":true,"inset":"n","hor_l":0,"ver_l":0,"blur":0,"spread":0,"color":"rgba(0,0,0,0.05)","css":"box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"}},"f_size":"13px","text_align":"left","css_normal":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); background-color: rgba(0, 0, 0, 0); padding-top: 6px; padding-right: 10px; padding-bottom: 5px; padding-left: 10px; box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"}},"list":{"block":[],"hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"14px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"rgb(28, 28, 28)","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":{"status":true,"inset":"n","hor_l":0,"ver_l":0,"blur":0,"spread":0,"color":"rgba(0,0,0,0.05)","css":"box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"w":"","h":"","css":"background-color: rgb(28, 28, 28); font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 14px; text-align: left; box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"body":[],"item":[],"a":"rgb(167, 144, 116)","a_hover":"rgb(255, 255, 255)"}}'),
(110, 0, 'rgen_theme', 'rgen_page', 'sitemap', '{"status":true,"main":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"rgb(167, 144, 116)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); color: rgb(167, 144, 116); font-size: 13px; border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"left":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"right":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"main_links":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"14px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(167, 144, 116)","f_size":"14px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); font-size: 14px; text-align: left; border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"sub_links":[],"a":"rgb(167, 144, 116)","a_hover":"rgb(255, 255, 255)"}'),
(111, 0, 'rgen_theme', 'fonts', 'popup_body', '{"family":"","subset":""}'),
(112, 0, 'rgen_theme', 'rgen_commoncomponents', 'popup', '{"status":true,"modal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"modal_header":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0.05)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0.05); text-align: left; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"modal_header_fonts":{"status":true,"type":"google","family":"Roboto","variants":"500","subsets":"latin","size":"14px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"rgb(77, 69, 80)","css":"font-family: Roboto; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: 500; color: rgb(77, 69, 80); text-transform: uppercase; letter-spacing: 0px;"},"modal_close":"rgb(152, 139, 146)","modal_body":{"status":true,"fonts":[],"background":"","color":"rgb(150, 137, 140)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(150, 137, 140); text-align: left; "}}'),
(113, 0, 'rgen_theme', 'fonts', 'popup_header_fonts', '{"family":"Roboto:500","subset":"latin"}'),
(2851, 0, 'rgen_theme', 'fonts', 'prd3_list_name', '{"family":"","subset":""}'),
(2852, 0, 'rgen_theme', 'fonts', 'prd3_list_description', '{"family":"","subset":""}'),
(2853, 0, 'rgen_theme', 'fonts', 'prd3_list_price_spl', '{"family":"","subset":""}'),
(2854, 0, 'rgen_theme', 'fonts', 'prd3_list_price_new', '{"family":"","subset":""}'),
(2825, 0, 'rgen_theme', 'fonts', 'prd2_normal_description', '{"family":"","subset":""}'),
(2826, 0, 'rgen_theme', 'fonts', 'prd2_normal_price_spl', '{"family":"Roboto:700","subset":"latin"}'),
(2827, 0, 'rgen_theme', 'fonts', 'prd2_normal_price_new', '{"family":"Roboto:700","subset":"latin"}'),
(2824, 0, 'rgen_theme', 'fonts', 'prd2_normal_name', '{"family":"Oswald:regular","subset":"latin"}'),
(2979, 0, 'rgen_theme', 'rgen_commoncomponents', 'pg_heading', '{"status":true,"style":2,"position":"out","block":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"int","pad_t":"15","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"15","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 15px; padding-right: 0px; padding-bottom: 15px; padding-left: 0px; "},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"text-align: center; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;padding-top: 15px; padding-right: 0px; padding-bottom: 15px; padding-left: 0px; margin: auto;"},"block_img":{"status":true,"image":"..\\/image\\/no_image.png","position":"center center","position_x":"0","position_y":"0","repeat":"repeat","attachment":"inherit","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: none;background-position: center center;background-repeat: repeat;background-size: auto;background-attachment: inherit;"},"h1_block":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"300","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"capitalize","letter_spacing":"1px","color":"rgb(0, 0, 0)","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: rgb(0, 0, 0); text-transform: capitalize; letter-spacing: 1px;"},"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 300; color: rgb(0, 0, 0); text-transform: capitalize; letter-spacing: 1px;color: rgb(0, 0, 0); font-size: 13px; text-align: center; "},"h1_text":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"35px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 35px; text-align: center; "},"breadcrumb":{"home":"lnk","block":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 12px; text-align: left; "},"link_normal":"rgb(0, 0, 0)","link_hover":"rgb(0, 0, 0)","sep":"rgb(0, 0, 0)"}}'),
(823, 0, 'rgen_theme', 'fonts', 'default_btn', '{"family":"Oswald:regular","subset":"latin"}'),
(824, 0, 'rgen_theme', 'fonts', 'primary_btn', '{"family":"Oswald:regular","subset":"latin"}'),
(3056, 0, 'rgen_theme', 'fonts', 'column_module_hd', '{"family":"Oswald:regular","subset":"latin"}'),
(3057, 0, 'rgen_theme', 'fonts', 'footer_hd', '{"family":"Oswald:regular","subset":"latin"}'),
(2841, 0, 'rgen_theme', 'fonts', 'prd3_normal_name', '{"family":"Oswald:regular","subset":"latin"}'),
(2817, 0, 'rgen_theme', 'fonts', 'prd1_list_name', '{"family":"Oswald:regular","subset":"latin"}');
INSERT INTO `mcc_rgen_theme` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(2804, 0, 'rgen_theme', 'rgen_prdblocks', 'global_prdblocks', '{"prd1":{"status":true,"normal":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"tax":true,"quickview":true,"style":[]},"grid":{"cart":false,"wishlist":false,"compare":false,"more":true,"description":false,"rating":false,"price":true,"tax":false,"quickview":false,"style":[]},"list":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"tax":true,"quickview":true,"style":{"status":true,"type":"list","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"hover":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":""}},"image":{"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"hover":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "}},"info_block":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"20","pad_t_type":"int","pad_r":"234","pad_r_type":"int","pad_b":"20","pad_b_type":"int","pad_l":"10","pad_l_type":"int","css":"padding-top: 20px; padding-right: 234px; padding-bottom: 20px; padding-left: 10px; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(255, 255, 255, 0); padding-top: 20px; padding-right: 234px; padding-bottom: 20px; padding-left: 10px; "},"info_wrpper":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); "},"info_name":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(167, 144, 116)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); font-size: 14px; text-align: left; "},"info_name_hover":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); "},"info_description":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 13px; text-align: left; "},"price_wrp":{"status":true,"fonts":[],"background":"rgb(18, 18, 18)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(18, 18, 18); text-align: left; "},"price_block":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"","f_size":"13px","text_align":"center","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":{"status":true,"inset":"n","hor_l":0,"ver_l":0,"blur":0,"spread":0,"color":"rgba(0,0,0,0.05)","css":"box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); text-align: center; border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"price_spl":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"700","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"18px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 18px; "},"price_new":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"700","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"18px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 18px; "},"price_old":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 12px; "},"price_tax":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 12px; "},"btn_wrp":{"status":true,"fonts":[],"background":"rgb(18, 18, 18)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(18, 18, 18); "},"cart_btn":[],"quickview_btn":[],"links":{"wrp":[],"normal":{"status":true,"fonts":[],"background":"","color":"rgb(167, 144, 116)","f_size":"11px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(167, 144, 116); font-size: 11px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); "}}},"css_data":{"block_normal":"background-color: rgb(255, 255, 255); ","block_hover":"","image_normal":"background-color: rgb(255, 255, 255); ","image_hover":"background-color: rgb(255, 255, 255); ","info_block":"background-color: rgba(255, 255, 255, 0); padding-top: 20px; padding-right: 234px; padding-bottom: 20px; padding-left: 10px; ","info_wrpper":"background-color: rgba(0, 0, 0, 0); ","info_name":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); font-size: 14px; text-align: left; ","info_name_hover":"color: rgb(255, 255, 255); ","info_description":"color: rgba(255, 255, 255, 0.5); font-size: 13px; text-align: left; ","price_wrp":"background-color: rgb(18, 18, 18); text-align: left; ","price_block":"background-color: rgba(0, 0, 0, 0); text-align: center; border: 0px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);","price_spl":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 18px; ","price_new":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 18px; ","price_old":"color: rgba(255, 255, 255, 0.5); font-size: 12px; ","price_tax":"color: rgba(255, 255, 255, 0.5); font-size: 12px; ","btn_wrp":"background-color: rgb(18, 18, 18); ","cart_btn_normal":"","cart_btn_hover":"","quickview_btn_normal":"","quickview_btn_hover":"","links_wrp":"","links_normal":"color: rgb(167, 144, 116); font-size: 11px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","links_hover":"color: rgb(255, 255, 255); "}}},"cart_ico":{"status":false,"type":"ico","icon":"","size":"14px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 14px;"},"wish_ico":{"status":false,"type":"ico","icon":"","size":"14px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 14px;"},"compare_ico":{"status":false,"type":"ico","icon":"","size":"14px","color":"rgba(0,0,0,0.05)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 14px;"},"more_ico":[],"quickview_ico":[],"offer_tag":"dis","offer_img":{"img":[],"tag_w":40,"tag_h":40},"offer_discount":[],"offer_text":{"box":[],"text":{"1":"zh-cn - No data"}},"stock":false},"prd2":{"status":true,"normal":{"cart":false,"wishlist":false,"compare":false,"more":false,"description":true,"rating":true,"price":true,"tax":true,"quickview":true,"style":{"status":true,"type":"normal","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(0, 0, 0, 0);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); border: 1px; border-style: solid;border-color: rgba(0, 0, 0, 0);border-radius: 0px;padding: 0px;"},"hover":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"image":{"normal":[],"hover":[]},"info_block":{"normal":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"rgb(167, 144, 116)","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); color: rgb(167, 144, 116); font-size: 13px; text-align: center; "},"hover":{"status":true,"fonts":[],"background":"rgb(167, 144, 116)","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(167, 144, 116); color: rgb(255, 255, 255); "}},"info_name":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(167, 144, 116)","f_size":"14px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); font-size: 14px; text-align: center; "},"info_name_hover":"","info_description":[],"price_block":[],"price_spl":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"700","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"16px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 16px; "},"price_new":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"700","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"16px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 16px; "},"price_old":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 12px; "},"price_tax":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 12px; "},"btn_wrp":[],"cart_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgba(255, 255, 255, 0)","hover":"rgb(167, 144, 116)"},"border":{"normal":{"status":true,"size":"dif","size_all":"0","size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"wish_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgba(255, 255, 255, 0)","hover":"rgb(167, 144, 116)"},"border":{"normal":{"status":true,"size":"dif","size_all":"1","size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":{"status":true,"size":"dif","size_all":"1","size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"compare_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgba(255, 255, 255, 0)","hover":"rgb(167, 144, 116)"},"border":{"normal":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"more_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgba(255, 255, 255, 0)","hover":"rgb(167, 144, 116)"},"border":{"normal":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"css_data":{"block_normal":"background-color: rgb(28, 28, 28); border: 1px; border-style: solid;border-color: rgba(0, 0, 0, 0);border-radius: 0px;padding: 0px;","block_hover":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;","image_normal":"","image_hover":"","info_block":"background-color: rgb(28, 28, 28); color: rgb(167, 144, 116); font-size: 13px; text-align: center; ","info_block_hover":"background-color: rgb(167, 144, 116); color: rgb(255, 255, 255); ","info_name":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); font-size: 14px; text-align: center; ","info_name_hover":"","info_description":"","price_block":"","price_spl":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 16px; ","price_new":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 16px; ","price_old":"color: rgba(255, 255, 255, 0.5); font-size: 12px; ","price_tax":"color: rgba(255, 255, 255, 0.5); font-size: 12px; ","btn_wrp":"","cart_btn_normal":"color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","cart_btn_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;","wish_btn_normal":"color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","wish_btn_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;","compare_btn_normal":"color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","compare_btn_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;","more_btn_normal":"color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","more_btn_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}}},"grid":{"cart":false,"wishlist":false,"compare":false,"more":false,"description":false,"rating":false,"price":true,"tax":false,"quickview":false,"style":{"status":true,"type":"grid","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"hover":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"}},"image":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"hover":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"}},"info_block":{"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"16px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 16px; text-align: center; "},"hover":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "}},"info_name":{"status":true,"fonts":{"status":true,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"bold","transform":"none","letter_spacing":"0px","color":"rgb(0, 0, 0)","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: bold; color: rgb(0, 0, 0); text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(0, 0, 0)","f_size":"14px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: bold; color: rgb(0, 0, 0); text-transform: none; letter-spacing: 0px;color: rgb(0, 0, 0); font-size: 14px; text-align: center; "},"info_name_hover":"rgb(0, 0, 0)","info_description":[],"price_block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); text-align: center; "},"price_spl":[],"price_new":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"price_old":[],"price_tax":[],"btn_wrp":[],"cart_btn":[],"wish_btn":[],"compare_btn":[],"more_btn":[],"quickview_btn":{"status":true,"fonts":[],"font_color":{"normal":"","hover":""},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","css_hover":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"}},"css_data":{"block_normal":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","block_hover":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","image_normal":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","image_hover":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","info_block":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 16px; text-align: center; ","info_block_hover":"background-color: rgb(255, 255, 255); ","info_name":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: bold; color: rgb(0, 0, 0); text-transform: none; letter-spacing: 0px;color: rgb(0, 0, 0); font-size: 14px; text-align: center; ","info_name_hover":"color: rgb(0, 0, 0);","info_description":"","price_block":"background-color: rgb(255, 255, 255); text-align: center; ","price_spl":"","price_new":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; ","price_old":"","price_tax":"","btn_wrp":"","cart_btn_normal":"","cart_btn_hover":"","wish_btn_normal":"","wish_btn_hover":"","compare_btn_normal":"","compare_btn_hover":"","more_btn_normal":"","more_btn_hover":"","quickview_btn_normal":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","quickview_btn_hover":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"}}},"list":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"tax":true,"quickview":true,"style":{"status":true,"type":"list","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(0, 0, 0, 0);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 1px; border-style: solid;border-color: rgba(0, 0, 0, 0);border-radius: 0px;"},"hover":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"01","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 01px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 01px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"image":{"normal":[],"hover":[]},"info_block":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; "},"hover":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(255, 255, 255, 0); "}},"info_name":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"16px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); font-size: 16px; text-align: left; "},"info_name_hover":"","info_description":[],"price_block":[],"price_spl":[],"price_new":[],"price_old":[],"price_tax":[],"btn_wrp":[],"cart_btn":[],"wish_btn":[],"compare_btn":[],"more_btn":[]},"css_data":{"block_normal":"border: 1px; border-style: solid;border-color: rgba(0, 0, 0, 0);border-radius: 0px;","block_hover":"border: 01px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;","image_normal":"","image_hover":"","info_block":"font-size: 13px; text-align: left; ","info_block_hover":"background-color: rgba(255, 255, 255, 0); ","info_name":"color: rgb(255, 255, 255); font-size: 16px; text-align: left; ","info_name_hover":"","info_description":"","price_block":"","price_spl":"","price_new":"","price_old":"","price_tax":"","btn_wrp":"","cart_btn_normal":"","cart_btn_hover":"","wish_btn_normal":"","wish_btn_hover":"","compare_btn_normal":"","compare_btn_hover":"","more_btn_normal":"","more_btn_hover":""}}},"cart_ico":[],"wish_ico":[],"compare_ico":[],"more_ico":[],"quickview_ico":[],"offer_tag":"dis","offer_img":{"img":[],"tag_w":40,"tag_h":40},"offer_discount":[],"offer_text":{"box":[],"text":{"1":""}},"stock":false},"prd3":{"status":true,"normal":{"cart":true,"wishlist":false,"compare":false,"more":false,"description":false,"rating":false,"price":true,"tax":false,"quickview":true,"style":{"status":true,"type":"normal","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0);border-radius: 0px;padding: 0px;"},"hover":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"image":{"normal":[],"hover":[]},"info_block":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":{"status":true,"type":"dif","pad":"15","pad_type":"int","pad_t":0,"pad_t_type":"int","pad_r":"15","pad_r_type":"int","pad_b":0,"pad_b_type":"int","pad_l":"15","pad_l_type":"int","css":"padding-top: 0px; padding-right: 15px; padding-bottom: 0px; padding-left: 15px; "},"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; padding-top: 0px; padding-right: 15px; padding-bottom: 0px; padding-left: 15px; "},"hover":[]},"info_name":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"12px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 12px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(167, 144, 116)","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 12px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); font-size: 13px; text-align: center; "},"info_name_hover":"rgb(255, 255, 255)","info_description":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"11px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 11px; text-align: center; "},"price_block":[],"price_spl":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"18px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 18px; "},"price_new":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"18px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 18px; "},"price_old":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.4)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.4); font-size: 12px; "},"price_tax":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"11px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 11px; "},"btn_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"15","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 15px;"},"margin":[],"shadow":[],"w":"","h":"","css":"text-align: center; border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding: 15px;"},"cart_btn":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"11px","line_height":"1.0","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 11px; line-height: 1.0; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgba(255, 255, 255, 0)","hover":"rgb(167, 144, 116)"},"border":{"normal":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"8","pad_t_type":"int","pad_r":"10","pad_r_type":"int","pad_b":"8","pad_b_type":"int","pad_l":"10","pad_l_type":"int","css":"padding-top: 8px; padding-right: 10px; padding-bottom: 8px; padding-left: 10px; "},"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Oswald; font-size: 11px; line-height: 1.0; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding-top: 8px; padding-right: 10px; padding-bottom: 8px; padding-left: 10px; ","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"wish_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgba(255, 255, 255, 0)","hover":"rgb(77, 69, 80)"},"border":{"normal":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0.05)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(0, 0, 0, 0.05);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0.05)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgba(0, 0, 0, 0.05);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(255, 255, 255); background-color: rgba(255, 255, 255, 0); border: 0px; border-style: solid;border-color: rgba(0, 0, 0, 0.05);border-radius: 0px;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(77, 69, 80); border: 0px; border-style: solid;border-color: rgba(0, 0, 0, 0.05);border-radius: 0px;"},"compare_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgba(255, 255, 255, 0)","hover":"rgb(77, 69, 80)"},"border":{"normal":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(255, 255, 255); background-color: rgba(255, 255, 255, 0); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(77, 69, 80); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"more_btn":[]},"css_data":{"block_normal":"background-color: rgb(28, 28, 28); border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0);border-radius: 0px;padding: 0px;","block_hover":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;","image_normal":"","image_hover":"","info_block":"font-size: 13px; text-align: center; padding-top: 0px; padding-right: 15px; padding-bottom: 0px; padding-left: 15px; ","info_block_hover":"","info_name":"font-family: Oswald; font-size: 12px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); font-size: 13px; text-align: center; ","info_name_hover":"color: rgb(255, 255, 255);","info_description":"color: rgba(255, 255, 255, 0.5); font-size: 11px; text-align: center; ","price_block":"","price_spl":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 18px; ","price_new":"font-family: Roboto; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 18px; ","price_old":"color: rgba(255, 255, 255, 0.4); font-size: 12px; ","price_tax":"color: rgba(255, 255, 255, 0.5); font-size: 11px; ","btn_wrp":"text-align: center; border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding: 15px;","cart_btn_normal":"font-family: Oswald; font-size: 11px; line-height: 1.0; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(167, 144, 116); background-color: rgba(255, 255, 255, 0); border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;padding-top: 8px; padding-right: 10px; padding-bottom: 8px; padding-left: 10px; ","cart_btn_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;","wish_btn_normal":"color: rgb(255, 255, 255); background-color: rgba(255, 255, 255, 0); border: 0px; border-style: solid;border-color: rgba(0, 0, 0, 0.05);border-radius: 0px;","wish_btn_hover":"color: rgb(255, 255, 255); background-color: rgb(77, 69, 80); border: 0px; border-style: solid;border-color: rgba(0, 0, 0, 0.05);border-radius: 0px;","compare_btn_normal":"color: rgb(255, 255, 255); background-color: rgba(255, 255, 255, 0); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;","compare_btn_hover":"color: rgb(255, 255, 255); background-color: rgb(77, 69, 80); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;","more_btn_normal":"","more_btn_hover":""}}},"grid":{"cart":true,"wishlist":false,"compare":false,"more":true,"description":false,"rating":true,"price":true,"tax":true,"quickview":true,"style":[]},"list":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"tax":true,"quickview":true,"style":{"status":true,"type":"list","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"20","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 20px;"},"margin":[],"shadow":[],"w":"","h":"","css":"padding: 20px;"},"hover":[]},"image":{"normal":[],"hover":[]},"info_block":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; padding: 0px;"},"hover":[]},"info_name":{"status":true,"fonts":[],"background":"","color":"rgb(167, 144, 116)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(167, 144, 116); font-size: 14px; text-align: left; "},"info_name_hover":"rgb(255, 255, 255)","info_description":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; "},"price_block":[],"price_spl":[],"price_new":[],"price_old":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 12px; "},"price_tax":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 12px; "},"btn_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"10","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":0,"pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 10px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; "},"margin":[],"shadow":[],"w":"","h":"","css":"text-align: left; padding-top: 10px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; "},"cart_btn":[],"wish_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(255, 255, 255)"},"background":{"normal":"","hover":"rgb(167, 144, 116)"},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(167, 144, 116); ","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); "},"compare_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(167, 144, 116)","hover":"rgb(255, 255, 255)"},"background":{"normal":"","hover":"rgb(167, 144, 116)"},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(167, 144, 116); ","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); "},"more_btn":[]},"css_data":{"block_normal":"padding: 20px;","block_hover":"","image_normal":"","image_hover":"","info_block":"font-size: 13px; text-align: left; padding: 0px;","info_block_hover":"","info_name":"color: rgb(167, 144, 116); font-size: 14px; text-align: left; ","info_name_hover":"color: rgb(255, 255, 255);","info_description":"font-size: 13px; text-align: left; ","price_block":"","price_spl":"","price_new":"","price_old":"color: rgba(255, 255, 255, 0.5); font-size: 12px; ","price_tax":"color: rgba(255, 255, 255, 0.5); font-size: 12px; ","btn_wrp":"text-align: left; padding-top: 10px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ","cart_btn_normal":"","cart_btn_hover":"","wish_btn_normal":"color: rgb(167, 144, 116); ","wish_btn_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); ","compare_btn_normal":"color: rgb(167, 144, 116); ","compare_btn_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); ","more_btn_normal":"","more_btn_hover":""}}},"cart_ico":[],"wish_ico":[],"compare_ico":[],"more_ico":[],"quickview_ico":[],"offer_tag":"dis","offer_img":{"img":[],"tag_w":40,"tag_h":40},"offer_discount":[],"offer_text":{"box":[],"text":[]},"stock":false},"prd4":{"status":true,"normal":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"tax":true,"quickview":true,"style":[]},"grid":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"tax":true,"quickview":true,"style":[]},"list":{"cart":true,"wishlist":true,"compare":true,"more":true,"description":true,"rating":true,"price":true,"tax":true,"quickview":true,"style":[]},"cart_ico":[],"wish_ico":[],"compare_ico":[],"more_ico":[],"quickview_ico":[],"offer_tag":"dis","offer_img":{"img":[],"tag_w":40,"tag_h":40},"offer_discount":[],"offer_text":{"box":[],"text":[]},"stock":false}}');
INSERT INTO `mcc_rgen_theme` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(134, 0, 'rgen_theme', 'rgen_prdblocks', 'global_smallprdblocks', '{"smallprd1":{"status":true,"type":"grid","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":[]},"image":[],"prdname":[],"prdname_hover":"","price_block":[],"price_spl":"","price_new":"","price_old":"","btn":"rgba(167, 144, 116, 0.2)","btn_hover":"rgb(255, 255, 255)"},"css_data":{"block_normal":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","block_hover":"","image":"","prdname":"","prdname_hover":"","price_block":"","price_spl":"","price_new":"","price_old":"","btn":"color: rgba(167, 144, 116, 0.2); ","btn_hover":"color: rgb(255, 255, 255); "}},"smallprd2":{"status":true,"type":"grid","prd":{"block":{"normal":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"image":[],"prdname":[],"prdname_hover":"","price_block":[],"price_spl":"","price_new":"","price_old":"","btn":{"status":true,"fonts":[],"font_color":{"normal":"rgba(255, 255, 255, 0.5)","hover":"rgb(255, 255, 255)"},"background":{"normal":"","hover":"rgb(167, 144, 116)"},"border":{"normal":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgba(255, 255, 255, 0.5); border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"css_data":{"block_normal":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","block_hover":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;","image":"","prdname":"","prdname_hover":"","price_block":"","price_spl":"","price_new":"","price_old":"","btn_normal":"color: rgba(255, 255, 255, 0.5); border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;","btn_hover":"color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}}}'),
(135, 0, 'rgen_theme', 'fonts', 'smallprd1_name', '{"family":"","subset":""}'),
(136, 0, 'rgen_theme', 'fonts', 'smallprd2_name', '{"family":"","subset":""}'),
(140, 0, 'rgen_theme', 'rgen_commoncomponents', 'panel', '{"status":true,"panel_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":false,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"10","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 10px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":""},"title_block":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); "},"title":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); font-size: 13px; text-align: left; "},"body_wrp":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":"1","size_t":"1","size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(0, 0, 0);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); border-width: 1px 0px 0px 0px;border-style: solid;border-color: rgb(0, 0, 0);border-radius: 0px;"},"body":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"","f_size":"13px","text_align":"left","border":{"status":false,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); font-size: 13px; text-align: left; "}}'),
(141, 0, 'rgen_theme', 'fonts', 'panel_title', '{"family":"Oswald:regular","subset":"latin"}'),
(2906, 0, 'rgen_theme', 'rgen_topbar', 'topbar2_general', '{"status":true,"logo":{"in_menu":"n","w":190,"position":"c"},"cart_link":false,"checkout_link":false,"wishlist":true,"myaccount":{"status":false,"icon":{"icon":"fa fa-user","status":true,"type":"ico","size":"14px","color":"rgb(0, 0, 0)","image":"..\\/image\\/no_image.png","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","position":"center center","block_w":"","block_h":"","css":"font-size: 14px;color: rgb(0, 0, 0);"}},"cart":{"status":true,"icon":{"icon":"glyphicon glyphicon-shopping-cart"}},"search":true,"currency":false,"language":false,"customlinks":true,"customlink_data":[]}'),
(143, 0, 'rgen_theme', 'fonts', 'sitemap_main_links', '{"family":"Oswald:regular","subset":"latin"}'),
(144, 0, 'rgen_theme', 'fonts', 'brands_atoz', '{"family":"Oswald:regular","subset":"latin"}'),
(145, 0, 'rgen_theme', 'rgen_customcode', 'customcode', '{"status":true,"css_status":true,"js_status":false,"cssfile_status":false,"jsfile_status":false,"css":".cards { text-align: right; }\\n\\n.prd-block1 .price { left: auto; right: 10px; }\\n\\n.prd-block3 a.btn-cart { display: block; }\\n.product-list .prd-block3 a.btn-cart { display: inline-block; }\\n\\n.reset-h,\\n.reset-h > .rw > .cl { min-height: inherit !important; }\\n\\n.cart-total .table>tbody>tr>td { font-weight: normal; }\\n.checkout-pg .panel-heading a, \\n.checkout-pg .panel-heading {\\n    color: inherit;\\n}\\n\\n.tf-item { display: inline-block; margin: 0 3px 5px 0; }\\n.tf-item img { width: auto; }\\n\\n@media only screen and (min-width: 200px) and (max-width: 979px){\\n.custom-infoboxes .ctn-block-small2 .img-wrp { float: none !important; max-width: 100% !important; }\\n.custom-infoboxes .ctn-block-small2 .text-wrp { margin-left: 0px !important; margin-right: 0px !important; }\\n}\\n\\n@media only screen and (max-width: 767px) and (min-width: 200px){\\n.fw.main-wrapper {overflow: hidden;}\\n.page-head h1 strong { font-size: 25px; }\\n.page-head{ padding-top: 10px; padding-bottom:10px; }\\n.cards,\\n.ft-hd { text-align: center; }\\n.nav-sub-handle { height: 35px; }\\n\\n.product-list .prd-block1 .info-wrp { padding: 10px !important; }\\n.product-list .prd-block1 .price-wrp { width: 100%; position: static; padding: 10px; margin-bottom: 10px; }\\n.product-list .prd-block1 .price {\\n    width: auto;\\n    height: auto;\\n    position: static;\\n}\\n.product-list .prd-block1 .price .vm-item { position: static; }\\n.product-list .prd-block1 .name,\\n.product-list .prd-block1 .description { text-align: center; }\\n}","js":"","cssfile":[{"file":""}],"jsfile":[{"file":""}]}'),
(146, 0, 'rgen_theme', 'rgen_ocmodule', 'ocmod_latest', '{"status":true,"prd_view":"carousel","grids":[],"carousel":{"item_margin":20,"item_display":1},"prd_style":1,"col_prd_style":1,"prd1_css":[],"prd2_css":[],"smallprd1_css":[],"smallprd2_css":[],"wrapper":[],"mod_hd":[],"prd_wrp":[]}'),
(147, 0, 'rgen_theme', 'fonts', 'ocmd_latest_title', '{"family":"","subset":""}'),
(148, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p1_name', 'null'),
(149, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p1_description', 'null'),
(150, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p1_price_spl', 'null'),
(151, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p1_price_new', 'null'),
(152, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p1_cartbtn', 'null'),
(153, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p2_name', 'null'),
(154, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p2_description', 'null'),
(155, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p2_price_spl', 'null'),
(156, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p2_price_new', 'null'),
(157, 0, 'rgen_theme', 'fonts', 'ocmd_latest_p2_cartbtn', 'null'),
(158, 0, 'rgen_theme', 'fonts', 'ocmd_latest_sp1_name', 'null'),
(159, 0, 'rgen_theme', 'fonts', 'ocmd_latest_sp2_name', 'null'),
(160, 0, 'rgen_theme', 'rgen_topbar', 'topbar1', '{"status":true,"topbar_inner_status":"y","header":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"innerblock":[],"image":[],"innerimage":[]},"logo":[],"toplink":{"block":[],"link_normal":[],"link_hover":[]},"tdd":{"dd":[],"dd_sub":[],"dd_item_normal":[],"dd_item_hover":[]},"mob":{"header":[],"logo":[],"cart_block":[],"search_block":[]},"cart":{"block":[],"block_h":[],"icon":[],"popup_block":[],"popup_block_text":"","popup_links":{"normal":"","hover":""},"popup_remove_color":"","popup_border_color":"","popup_total_block":[],"popup_total_text":"","popup_total_cartbtn":[],"popup_total_checkoutbtn":[],"popup_total_cartbtn_icon":true,"popup_total_checkoutbtn_icon":true},"search":{"block":[],"block_h":[],"input":[],"button":[],"icon":[],"autosearch":{"wrp":[],"prd":[],"links":"","links_h":"","spl_price":"","spl_price_h":"","normal_price":"","normal_price_h":"","old_price":"","old_price_h":""}},"breadcrumb":{"block_wrp":[],"block":[],"link_normal":"#ffffff","link_hover":"#6ddee2","sep":"rgba(255,255,255,0.5)"}}'),
(161, 0, 'rgen_theme', 'fonts', 'topbar1_cart_cartbtn', '{"family":"","subset":""}'),
(162, 0, 'rgen_theme', 'fonts', 'topbar1_cart_checkoutbtn', '{"family":"","subset":""}'),
(163, 0, 'rgen_theme', 'fonts', 'topbar1_search_input', '{"family":"","subset":""}'),
(181, 0, 'rgen_theme', 'rgen_footer', 'default_ft_general', '{"status":true,"top_width":"fw","bottom_width":"fw","main_wrp":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"main_wrp_bgimg":[],"top_wrp":{"status":true,"fonts":[],"background":"","color":"rgb(237, 95, 121)","f_size":"13px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(237, 95, 121); font-size: 13px; text-align: center; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"top_wrp_bgimg":[],"top_a":"rgb(0, 0, 0)","top_a_hover":"rgb(255, 255, 255)","bottom_wrp":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"center","border":{"status":true,"size":"dif","size_all":0,"size_t":"1","size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 1px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); font-size: 13px; text-align: center; border-width: 1px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"bottom_wrp_bgimg":[],"bottom_a":"rgb(255, 255, 255)","bottom_a_hover":"rgb(255, 255, 255)","cards":{"1":"Powered By <a href=\\"http:\\/\\/www.opencart.com\\">OpenCart<\\/a> <span style=\\"margin: 0 5px;text-align:center;\\"> | <\\/span> R.Gen - OpenCart Modern Store Design &copy; 2015"},"cp_block":{"html":{"1":"Powered By <a href=\\"http:\\/\\/www.opencart.com\\">OpenCart<\\/a> <span style=\\"margin: 0 5px;text-align:center;\\"> | <\\/span> R.Gen - OpenCart Modern Store Design &copy; 2015"},"wrp":{"status":true,"fonts":[],"background":"","color":"rgba(255, 255, 255, 0.5)","f_size":"12px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(255, 255, 255, 0.5); font-size: 12px; text-align: center; "},"container":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; "}}}'),
(574, 0, 'rgen_theme', 'rgen_page', 'prdpg_main_img', '{"status":true,"cloudzoom":true,"popup":true,"outer_block":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"1","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 1px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 0px;"},"shadow":[],"w":"","h":"","css":"padding: 1px;margin: 0px;"},"main_img_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"1","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 1px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 0px;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); padding: 1px;margin: 0px;"},"main_img":{"status":true,"fonts":[],"background":"rgba(255, 255, 255, 0)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"1","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 1px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 0px;"},"shadow":[],"w":"","h":"","css":"background-color: rgba(255, 255, 255, 0); padding: 1px;margin: 0px;"},"th_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"1","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 1px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 0px;"},"shadow":[],"w":"","h":"","css":"padding: 1px;margin: 0px;"},"th_img":{"status":true,"fonts":[],"background":"rgba(167, 144, 116, 0.2)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"3","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 3px;"},"margin":{"status":true,"type":"dif","mrg":"5","mrg_type":"int","mrg_t":0,"mrg_t_type":"int","mrg_r":0,"mrg_r_type":"int","mrg_b":"5","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"int","css":"margin-top: 0px; margin-right: 0px; margin-bottom: 5px; margin-left: 0px; "},"shadow":[],"w":"","h":"","css":"background-color: rgba(167, 144, 116, 0.2); padding: 3px;margin-top: 0px; margin-right: 0px; margin-bottom: 5px; margin-left: 0px; "},"th_active":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"3","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 3px;"},"margin":{"status":true,"type":"dif","mrg":"5","mrg_type":"inherit","mrg_t":0,"mrg_t_type":"int","mrg_r":0,"mrg_r_type":"int","mrg_b":"5","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"int","css":"margin-top: 0px; margin-right: 0px; margin-bottom: 5px; margin-left: 0px; "},"shadow":[],"w":"","h":"","css":"padding: 3px;margin-top: 0px; margin-right: 0px; margin-bottom: 5px; margin-left: 0px; "},"th_img_active":"rgb(184, 184, 184)","arrow_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"inherit","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: inherit;"},"shadow":[],"w":"","h":"","css":"padding: 0px;margin: inherit;"},"arrow_line":"rgb(255, 255, 255)","arrows":{"status":true,"fonts":[],"font_color":{"normal":"","hover":""},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"background-color: rgb(255, 255, 255); ","css_hover":"background-color: rgb(255, 255, 255); "}}'),
(383, 0, 'rgen_theme', 'rgen_page', 'prdpg_options', '{"status":true,"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"hd":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"frm_group":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"frm_lbl":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"frm_fields":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"frm_ctrls":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0.2);border-radius: 0px;"},"frm_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); ","css_hover":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); "}}'),
(428, 0, 'rgen_theme', 'rgen_page', 'prdpg_ly3', '{"status":true,"l_size":5,"gt":"gt30","price":{"wrapper":[],"block":[],"price_spl":[],"price_new":[],"price_old":[],"price_tax":[]},"rating":{"block":[],"stars_normal":[],"stars_active":[],"a":"","a_hover":""},"offer_info":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"reward":"","discount":""}'),
(429, 0, 'rgen_theme', 'fonts', 'prdpg_ly3_price_spl', '{"family":"","subset":""}'),
(430, 0, 'rgen_theme', 'fonts', 'prdpg_ly3_price_new', '{"family":"","subset":""}'),
(431, 0, 'rgen_theme', 'fonts', 'prdpg_ly3_price_old', '{"family":"","subset":""}'),
(432, 0, 'rgen_theme', 'fonts', 'prdpg_ly3_price_tax', '{"family":"","subset":""}'),
(630, 0, 'rgen_theme', 'rgen_page', 'prdpg_qty', '{"status":true,"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"all","pad":"15","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 15px;"},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; padding: 15px;"},"qty_lbl":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"14px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(0, 0, 0); font-size: 14px; text-align: left; "},"qty_block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"qty_input":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"16px","text_align":"center","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 16px; text-align: center; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"qty_btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); ","css_hover":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); "},"cart_txt":true,"cart_icon":[],"cart_btn":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"700","subsets":"latin","size":"16px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 16px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(0, 0, 0)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":"3","radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;"},"hover":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":"3","radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Roboto; font-size: 16px; line-height: 1.2; font-style: normal; font-weight: 700; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;","css_hover":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;"},"links":"rgb(0, 0, 0)","links_h":"rgb(0, 0, 0)"}'),
(504, 0, 'rgen_theme', 'rgen_page', 'prdpg_tabs', '{"status":true,"tabs":{"bar":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":"4","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); text-align: left; border: 0px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"item":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"14px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"1px","color":"#666666","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;"},"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"14px","text_align":"center","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(0, 0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(0, 0, 0, 0);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"12","pad_t_type":"int","pad_r":"20","pad_r_type":"int","pad_b":"11","pad_b_type":"int","pad_l":"20","pad_l_type":"int","css":"padding-top: 12px; padding-right: 20px; padding-bottom: 11px; padding-left: 20px; "},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;color: rgb(0, 0, 0); font-size: 14px; text-align: center; border: 1px; border-style: solid;border-color: rgba(0, 0, 0, 0);border-radius: 0px;padding-top: 12px; padding-right: 20px; padding-bottom: 11px; padding-left: 20px; margin: auto;"},"item_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":"1","mrg_r_type":"int","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: 1px; margin-bottom: auto; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 14px; text-align: left; margin-top: auto; margin-right: 1px; margin-bottom: auto; margin-left: auto; "},"active":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"14px","text_align":"center","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(28, 28, 28)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(28, 28, 28);border-radius: 0px;"},"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"1","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 14px; text-align: center; border: 1px; border-style: solid;border-color: rgb(28, 28, 28);border-radius: 0px;margin: auto;"},"active_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"container":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"pane":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "}},"table_style":{"table":{"border":[],"background":"rgb(255, 255, 255)"},"th":{"block":{"status":true,"fonts":{"status":true,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"16px","line_height":"1.2","style":"normal","weight":"bold","transform":"none","letter_spacing":"0px","color":"rgb(0, 0, 0)","css":"font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 1.2; font-style: normal; font-weight: bold; color: rgb(0, 0, 0); text-transform: none; letter-spacing: 0px;"},"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 1.2; font-style: normal; font-weight: bold; color: rgb(0, 0, 0); text-transform: none; letter-spacing: 0px;"},"first":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"last":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "}},"td":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"first":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"last":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "}}},"review_tab":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"comment":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"title":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"stars_normal":"rgb(0, 0, 0)","stars_active":"rgb(0, 0, 0)","comment":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "}},"pagination":{"wrapper":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"active":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "}},"frm":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"hd":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"label":"rgb(0, 0, 0)","fields":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"rating":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"rating_lbl":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"rating_count":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"btn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(255, 255, 255)","hover":""},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); ","css_hover":"color: rgb(0, 0, 0); "}}}}'),
(599, 0, 'rgen_theme', 'rgen_page', 'prdpg_general', '{"status":true,"layout_style":3,"cart_status":true,"wishlist_status":true,"compare_status":true,"rating_status":true,"price_status":true,"tax_status":true,"options_status":true,"description_status":true,"specification_status":true,"stock_status":false,"social_sharing":"","title":{"status":true,"fonts":{"status":true,"type":"default","family":"Comic Sans MS, cursive, sans-serif","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"bold","transform":"none","letter_spacing":"0px","color":"#666666","css":"font-family: Comic Sans MS, cursive, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: bold; color: #666666; text-transform: none; letter-spacing: 0px;"},"background":"","color":"rgb(0, 0, 0)","f_size":"20px","text_align":"center","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"20","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-family: Comic Sans MS, cursive, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: bold; color: #666666; text-transform: none; letter-spacing: 0px;color: rgb(0, 0, 0); font-size: 20px; text-align: center; margin-top: auto; margin-right: auto; margin-bottom: 20px; margin-left: auto; "},"hr":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":"20","mrg_t_type":"int","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: 20px; margin-right: auto; margin-bottom: auto; margin-left: auto; "},"shadow":[],"w":"","h":"1","css":"background-color: rgb(255, 255, 255); margin-top: 20px; margin-right: auto; margin-bottom: auto; margin-left: auto; height:1px;"},"hr_img":[],"item_info":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"item":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"item_lbl":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "}},"rating":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-size: 13px; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"stars_normal":{"status":true,"fonts":[],"background":"","color":"rgba(167, 144, 116, 0.25)","f_size":"26px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgba(167, 144, 116, 0.25); font-size: 26px; "},"stars_active":{"status":true,"fonts":[],"background":"","color":"rgb(167, 144, 116)","f_size":"26px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(167, 144, 116); font-size: 26px; "},"a":"rgb(28, 28, 28)","a_hover":"rgb(255, 255, 255)"},"tags":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":""},"background":{"normal":"rgb(255, 255, 255)","hover":""},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); ","css_hover":""},"rel_prdstyle":1,"structure":{"wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-size: 13px; "},"rw":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-size: 13px; "},"l_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-size: 13px; "},"r_wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-size: 13px; "},"l_in":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-size: 13px; "},"r_in":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-size: 13px; "}},"pg_heading":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":0,"pad_type":"int","pad_t":"10","pad_t_type":"int","pad_r":0,"pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":0,"pad_l_type":"int","css":"padding-top: 10px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px; "},"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); text-align: left; padding-top: 10px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px; "},"block_img":[],"breadcrumb":{"block":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; "},"link_normal":"rgb(0, 0, 0)","link_hover":"rgb(0, 0, 0)","sep":"rgb(0, 0, 0)"}}}');
INSERT INTO `mcc_rgen_theme` (`id`, `store_id`, `group`, `section`, `key`, `value`) VALUES
(2665, 0, 'rgen_theme', 'rgen_commoncomponents', 'prd_filters', '{"status":true,"block":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"12px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 12px; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"compare":{"status":true,"fonts":[],"font_color":{"normal":"","hover":""},"background":{"normal":"","hover":""},"border":{"normal":[],"hover":[]},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"","css_hover":"color: rgb(0, 0, 0); "},"filter_lbl":"","filter_ctrl":[],"display_btn":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"18px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"30","h":"30","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 18px; width:30px;height:30px;"},"display_btn_active":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); "},"display":"rgb(0, 0, 0)","display_active":"rgb(0, 0, 0)"}'),
(731, 0, 'rgen_theme', 'rgen_page', 'category', '{"status":true,"cat_info":{"status":false,"block":[]},"refine_search":{"style":2,"view":"grid","refine1":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"title":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 14px; text-align: left; "},"catlink_normal":{"status":true,"fonts":[],"background":"rgb(28, 28, 28)","color":"rgb(0, 0, 0)","f_size":"11px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(28, 28, 28); color: rgb(0, 0, 0); font-size: 11px; text-align: left; "},"catlink_hover":{"status":true,"fonts":[],"background":"rgb(167, 144, 116)","color":"rgb(0, 0, 0)","f_size":"11px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(167, 144, 116); color: rgb(0, 0, 0); font-size: 11px; text-align: center; "}},"refine2":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"0","pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":"0","mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 0px;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin: 0px;"},"title":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 14px; text-align: left; "},"catlink_normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"11px","text_align":"center","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":{"status":true,"inset":"n","hor_l":0,"ver_l":0,"blur":0,"spread":0,"color":"rgba(0,0,0,0.05)","css":"box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 11px; text-align: center; border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.05);"},"catlink_hover":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"11px","text_align":"center","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"dif","color":"#eeeeee","color_t":"rgb(255, 255, 255)","color_r":"rgb(255, 255, 255)","color_b":"rgb(255, 255, 255)","color_l":"rgb(255, 255, 255)","css":"border: 0px; border-style: solid;border-top-color: rgb(255, 255, 255);border-right-color: rgb(255, 255, 255);border-bottom-color: rgb(255, 255, 255);border-left-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 11px; text-align: center; border: 0px; border-style: solid;border-top-color: rgb(255, 255, 255);border-right-color: rgb(255, 255, 255);border-bottom-color: rgb(255, 255, 255);border-left-color: rgb(255, 255, 255);border-radius: 0px;"}}},"prd_grid":{"prd_style":1,"gridview":[],"listview":[]}}'),
(822, 0, 'rgen_theme', 'rgen_commoncomponents', 'buttons', '{"status":true,"default_btn":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.0","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.0; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"border":{"normal":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"}},"padding":{"status":true,"type":"dif","pad":"10","pad_type":"int","pad_t":"10","pad_t_type":"int","pad_r":"10","pad_r_type":"int","pad_b":"10","pad_b_type":"int","pad_l":"10","pad_l_type":"int","css":"padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; "},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"inherit","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: inherit;"},"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Oswald; font-size: 13px; line-height: 1.0; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; margin: inherit;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"primary_btn":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgb(167, 144, 116)","hover":"rgba(0, 0, 0, 0)"},"border":{"normal":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(167, 144, 116)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); background-color: rgb(167, 144, 116); border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;","css_hover":"color: rgb(255, 255, 255); background-color: rgba(0, 0, 0, 0); border: 1px; border-style: solid;border-color: rgb(167, 144, 116);border-radius: 0px;"},"small_btn":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"500","subsets":"latin","size":"12px","line_height":"1.0","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 12px; line-height: 1.0; font-style: normal; font-weight: 500; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"","hover":""},"border":{"normal":[],"hover":[]},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"int","pad_t":"8","pad_t_type":"int","pad_r":"12","pad_r_type":"int","pad_b":"8","pad_b_type":"int","pad_l":"12","pad_l_type":"int","css":"padding-top: 8px; padding-right: 12px; padding-bottom: 8px; padding-left: 12px; "},"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Roboto; font-size: 12px; line-height: 1.0; font-style: normal; font-weight: 500; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); padding-top: 8px; padding-right: 12px; padding-bottom: 8px; padding-left: 12px; ","css_hover":"color: rgb(255, 255, 255); "},"mini_btn":{"status":true,"fonts":{"status":true,"type":"google","family":"Roboto","variants":"500","subsets":"latin","size":"13px","line_height":"1.0","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Roboto; font-size: 13px; line-height: 1.0; font-style: normal; font-weight: 500; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"","hover":""},"border":{"normal":[],"hover":[]},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"6","pad_t_type":"int","pad_r":"10","pad_r_type":"int","pad_b":"6","pad_b_type":"int","pad_l":"10","pad_l_type":"int","css":"padding-top: 6px; padding-right: 10px; padding-bottom: 6px; padding-left: 10px; "},"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Roboto; font-size: 13px; line-height: 1.0; font-style: normal; font-weight: 500; color: #666666; text-transform: uppercase; letter-spacing: 0px;color: rgb(255, 255, 255); padding-top: 6px; padding-right: 10px; padding-bottom: 6px; padding-left: 10px; ","css_hover":"color: rgb(255, 255, 255); "},"xs_btn":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"11px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"","css":"font-family: Oswald; font-size: 11px; line-height: 1.2; font-style: normal; font-weight: normal; color: ; text-transform: uppercase; letter-spacing: 0px;"},"font_color":{"normal":"","hover":""},"background":{"normal":"","hover":""},"border":{"normal":[],"hover":[]},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"inherit","pad_t":"3","pad_t_type":"int","pad_r":"8","pad_r_type":"int","pad_b":"3","pad_b_type":"int","pad_l":"8","pad_l_type":"int","css":"padding-top: 3px; padding-right: 8px; padding-bottom: 3px; padding-left: 8px; "},"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"font-family: Oswald; font-size: 11px; line-height: 1.2; font-style: normal; font-weight: normal; color: ; text-transform: uppercase; letter-spacing: 0px;padding-top: 3px; padding-right: 8px; padding-bottom: 3px; padding-left: 8px; ","css_hover":""}}'),
(2877, 0, 'rgen_theme', 'rgen_commoncomponents', 'forms', '{"status":true,"block":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 12px; "},"title":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"1px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;"},"background":"","color":"rgb(0, 0, 0)","f_size":"14px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;color: rgb(0, 0, 0); font-size: 14px; text-align: left; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"label":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; "},"form_control":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 0px;"},"button_bar":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.2)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; text-align: left; border: 1px; border-style: solid;border-color: rgba(167, 144, 116, 0.2);border-radius: 0px;"}}'),
(2886, 0, 'rgen_theme', 'rgen_prdblocks', 'global_prdgirdpages', '{"category":{"prd_style":2,"gridview":{"lg_desktop":"eq4","desktop":"d-eq4","tablet":"t-eq3","mob_xl":"mxl-eq2","mob_sm":"msm-eq2","mob_xs":"mxs-eq1","gutter":"gt10","margin_b":"mb10","classGroup":" eq4 d-eq4 t-eq3 mxl-eq2 msm-eq2 mxs-eq1 gt10 mb10"},"listview":{"lg_desktop":"eq4","desktop":"d-eq4","tablet":"t-eq4","mob_xl":"mxl-eq2","mob_sm":"msm-eq2","mob_xs":"mxs-eq1","gutter":"gt20","margin_b":"mb20","classGroup":" eq4 d-eq4 t-eq4 mxl-eq2 msm-eq2 mxs-eq1 gt20 mb20"}},"special":{"prd_style":3,"gridview":[],"listview":[]},"brand_info":{"prd_style":2,"gridview":[],"listview":[]},"search":{"prd_style":2,"gridview":[],"listview":[]}}'),
(2895, 0, 'rgen_theme', 'rgen_page', 'checkout', '{"status":true,"panel":{"panel_wrp":[],"title_block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"1","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 1px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;margin-top: auto; margin-right: auto; margin-bottom: 1px; margin-left: auto; "},"title":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"16px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"rgb(255, 255, 255)","css":"font-family: Oswald; font-size: 16px; line-height: 1.2; font-style: normal; font-weight: normal; color: rgb(255, 255, 255); text-transform: uppercase; letter-spacing: 0px;"},"background":"","color":"rgb(0, 0, 0)","f_size":"16px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 16px; line-height: 1.2; font-style: normal; font-weight: normal; color: rgb(255, 255, 255); text-transform: uppercase; letter-spacing: 0px;color: rgb(0, 0, 0); font-size: 16px; text-align: left; "},"body_wrp":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"body":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":"30","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: auto; margin-right: auto; margin-bottom: 30px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: left; margin-top: auto; margin-right: auto; margin-bottom: 30px; margin-left: auto; "}},"forms":{"block":[],"title":[],"label":[],"form_control":[],"button_bar":{"status":true,"fonts":{"status":true,"type":"default","family":"Arial, Helvetica, sans-serif","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"none","letter_spacing":"0px","color":"rgb(255, 255, 255)","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: rgb(255, 255, 255); text-transform: none; letter-spacing: 0px;"},"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Arial, Helvetica, sans-serif; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: rgb(255, 255, 255); text-transform: none; letter-spacing: 0px;"}},"table_style":{"table":{"border":[],"background":""},"th":{"block":[],"first":[],"last":[]},"td":{"block":[],"first":[],"last":[]}},"default_btn":[]}'),
(2810, 0, 'rgen_theme', 'fonts', 'prd1_normal_price_new', 'null'),
(2830, 0, 'rgen_theme', 'fonts', 'prd2_grid_description', '{"family":"","subset":""}'),
(2832, 0, 'rgen_theme', 'fonts', 'prd2_grid_price_new', '{"family":"","subset":""}'),
(2856, 0, 'rgen_theme', 'fonts', 'prd4_offer_dis', '{"family":"","subset":""}'),
(2857, 0, 'rgen_theme', 'fonts', 'prd4_offer_txt', '{"family":"","subset":""}'),
(2858, 0, 'rgen_theme', 'fonts', 'prd4_normal_name', 'null'),
(2859, 0, 'rgen_theme', 'fonts', 'prd4_normal_description', 'null'),
(2860, 0, 'rgen_theme', 'fonts', 'prd4_normal_price_spl', 'null'),
(2861, 0, 'rgen_theme', 'fonts', 'prd4_normal_price_new', 'null'),
(2862, 0, 'rgen_theme', 'fonts', 'prd4_normal_cartbtn', 'null'),
(2863, 0, 'rgen_theme', 'fonts', 'prd4_grid_name', 'null'),
(2864, 0, 'rgen_theme', 'fonts', 'prd4_grid_description', 'null'),
(2865, 0, 'rgen_theme', 'fonts', 'prd4_grid_price_spl', 'null'),
(2866, 0, 'rgen_theme', 'fonts', 'prd4_grid_price_new', 'null'),
(2867, 0, 'rgen_theme', 'fonts', 'prd4_grid_cartbtn', 'null'),
(2868, 0, 'rgen_theme', 'fonts', 'prd4_list_name', 'null'),
(2869, 0, 'rgen_theme', 'fonts', 'prd4_list_description', 'null'),
(2870, 0, 'rgen_theme', 'fonts', 'prd4_list_price_spl', 'null'),
(2871, 0, 'rgen_theme', 'fonts', 'prd4_list_price_new', 'null'),
(2872, 0, 'rgen_theme', 'fonts', 'prd4_list_cartbtn', 'null'),
(3054, 0, 'rgen_theme', 'rgen_commoncomponents', 'headings', '{"status":true,"module_hd":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"center","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-size: 13px; text-align: center; "},"column_module_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"14px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"1px","color":"#666666","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"center","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 14px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;color: rgb(255, 255, 255); font-size: 14px; text-align: center; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"footer_hd":{"status":true,"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"1px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;"},"background":"","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"center","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(167, 144, 116, 0.1)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 1px;color: rgb(255, 255, 255); font-size: 14px; text-align: center; border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgba(167, 144, 116, 0.1);border-radius: 0px;"},"other_hd":{"fonts":{"status":true,"type":"google","family":"Oswald","variants":"regular","subsets":"latin","size":"13px","line_height":"1.2","style":"normal","weight":"normal","transform":"uppercase","letter_spacing":"0px","color":"#666666","css":"font-family: Oswald; font-size: 13px; line-height: 1.2; font-style: normal; font-weight: normal; color: #666666; text-transform: uppercase; letter-spacing: 0px;"},"h1":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"30px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); font-size: 30px; "},"h2":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"16px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 16px; "},"h3":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"16px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 16px; "},"h4":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); font-size: 14px; "},"h5":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); font-size: 13px; "},"h6":{"status":true,"fonts":[],"background":"","color":"rgb(255, 255, 255)","f_size":"12px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(255, 255, 255); font-size: 12px; "}}}'),
(3071, 0, 'rgen_theme', 'rgen_topbar', 'topbar2', '{"status":true,"topbar_inner_status":"y","header":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"rgb(239, 49, 49)","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"innerblock":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"image":{"status":true,"image":"..\\/image\\/no_image.png","position":"center center","position_x":"0","position_y":"0","repeat":"no-repeat","attachment":"inherit","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: none;background-position: center center;background-repeat: no-repeat;background-size: auto;background-attachment: inherit;"},"innerimage":{"status":true,"image":"..\\/image\\/no_image.png","position":"center center","position_x":"0","position_y":"0","repeat":"repeat","attachment":"inherit","bgsize":"auto","bgsize_w":"100%","bgsize_h":"100%","css":"background-image: none;background-position: center center;background-repeat: repeat;background-size: auto;background-attachment: inherit;"},"uppertop":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"dif","size_all":0,"size_t":0,"size_r":0,"size_b":"1","size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(241, 241, 241)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border-width: 0px 0px 1px 0px;border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;"},"bottomtop":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "}},"logo":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":{"status":true,"type":"dif","pad":0,"pad_type":"int","pad_t":"10","pad_t_type":"int","pad_r":0,"pad_r_type":"inherit","pad_b":"10","pad_b_type":"int","pad_l":0,"pad_l_type":"inherit","css":"padding-top: 10px; padding-right: inherit; padding-bottom: 10px; padding-left: inherit; "},"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":"15","mrg_t_type":"int","mrg_r":0,"mrg_r_type":"auto","mrg_b":"15","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: 15px; margin-right: auto; margin-bottom: 15px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"padding-top: 10px; padding-right: inherit; padding-bottom: 10px; padding-left: inherit; margin-top: 15px; margin-right: auto; margin-bottom: 15px; margin-left: auto; "},"toplink":{"block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"link_normal":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"14px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":"8","mrg_t_type":"int","mrg_r":0,"mrg_r_type":"auto","mrg_b":"8","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: 8px; margin-right: auto; margin-bottom: 8px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 14px; margin-top: 8px; margin-right: auto; margin-bottom: 8px; margin-left: auto; "},"link_hover":{"status":true,"fonts":[],"background":"","color":"rgb(28, 28, 28)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"dif","mrg":0,"mrg_type":"auto","mrg_t":"8","mrg_t_type":"int","mrg_r":0,"mrg_r_type":"auto","mrg_b":"8","mrg_b_type":"int","mrg_l":0,"mrg_l_type":"auto","css":"margin-top: 8px; margin-right: auto; margin-bottom: 8px; margin-left: auto; "},"shadow":[],"w":"","h":"","css":"color: rgb(28, 28, 28); margin-top: 8px; margin-right: auto; margin-bottom: 8px; margin-left: auto; "}},"tdd":{"dd":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgba(255, 255, 255, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0);border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"12px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0);border-radius: 0px;font-size: 12px; ","css_hover":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); border: 1px; border-style: solid;border-color: rgba(255, 255, 255, 0);border-radius: 0px;"},"dd_sub":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); "},"dd_item_normal":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"11px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 11px; "},"dd_item_hover":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); "}},"mob":{"header":[],"logo":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: auto;"},"shadow":[],"w":"","h":"","css":"margin: auto;"},"cart_block":{"status":true,"fonts":[],"background":"rgba(0, 0, 0, 0)","color":"rgb(167, 144, 116)","f_size":"12px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgba(0, 0, 0, 0); color: rgb(167, 144, 116); font-size: 12px; border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"search_block":[]},"cart":{"block":{"status":true,"fonts":[],"background":"","color":"rgb(184, 184, 184)","f_size":"12px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(241, 241, 241)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":"10","pad_type":"int","pad_t":"10","pad_t_type":"int","pad_r":0,"pad_r_type":"inherit","pad_b":"10","pad_b_type":"int","pad_l":0,"pad_l_type":"inherit","css":"padding: 10px;"},"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(184, 184, 184); font-size: 12px; border: 1px; border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;padding: 10px;"},"block_h":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(241, 241, 241)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 1px; border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;"},"icon":{"status":true,"fonts":[],"background":"","color":"rgb(167, 144, 116)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(167, 144, 116); font-size: 13px; "},"popup_block":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":[],"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-size: 13px; "},"popup_block_text":"rgb(0, 0, 0)","popup_links":{"normal":"rgb(18, 18, 18)","hover":"rgb(18, 18, 18)"},"popup_remove_color":"","popup_border_color":"rgba(0, 0, 0, 0.08)","popup_total_block":[],"popup_total_text":"rgb(0, 0, 0)","popup_total_cartbtn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgb(28, 28, 28)","hover":"rgb(18, 18, 18)"},"border":{"normal":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":"3","radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(28, 28, 28)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(28, 28, 28);border-radius: 3px;"},"hover":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":"3","radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(255, 255, 255); background-color: rgb(28, 28, 28); border: 1px; border-style: solid;border-color: rgb(28, 28, 28);border-radius: 3px;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(18, 18, 18); border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;"},"popup_total_checkoutbtn":{"status":true,"fonts":[],"font_color":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"background":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"border":{"normal":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":"3","radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;"},"hover":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":"3","radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(0, 0, 0)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;","css_hover":"color: rgb(255, 255, 255); background-color: rgb(0, 0, 0); border: 1px; border-style: solid;border-color: rgb(0, 0, 0);border-radius: 3px;"},"popup_total_cartbtn_icon":true,"popup_total_checkoutbtn_icon":true},"search":{"block":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(241, 241, 241)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;"},"padding":{"status":true,"type":"dif","pad":0,"pad_type":"int","pad_t":"10","pad_t_type":"int","pad_r":0,"pad_r_type":"inherit","pad_b":"10","pad_b_type":"int","pad_l":0,"pad_l_type":"inherit","css":"padding-top: 10px; padding-right: inherit; padding-bottom: 10px; padding-left: inherit; "},"margin":[],"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;padding-top: 10px; padding-right: inherit; padding-bottom: 10px; padding-left: inherit; "},"block_h":{"status":true,"fonts":[],"background":"","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(241, 241, 241)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"border: 0px; border-style: solid;border-color: rgb(241, 241, 241);border-radius: 0px;"},"input":{"status":true,"fonts":[],"background":"","color":"rgb(0, 0, 0)","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":"1","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 1px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":[],"margin":[],"shadow":[],"w":"","h":"","css":"color: rgb(0, 0, 0); font-size: 13px; text-align: left; border: 1px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"button":{"status":true,"fonts":[],"font_color":{"normal":"rgb(232, 232, 232)","hover":"rgb(216, 216, 216)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":{"status":true,"size":"all","size_all":"0","size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"rgb(255, 255, 255)","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;"},"hover":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"}},"padding":[],"margin":[],"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(232, 232, 232); background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: rgb(255, 255, 255);border-radius: 0px;","css_hover":"color: rgb(216, 216, 216); background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"icon":[],"autosearch":{"wrp":{"status":true,"fonts":[],"background":"rgb(255, 255, 255)","color":"","f_size":"13px","text_align":"left","border":{"status":true,"size":"all","size_all":0,"size_t":0,"size_r":0,"size_b":0,"size_l":0,"style":"solid","radius":"all","radius_all":0,"radius_t":0,"radius_r":0,"radius_b":0,"radius_l":0,"color_type":"all","color":"#eeeeee","color_t":"#eeeeee","color_r":"#eeeeee","color_b":"#eeeeee","color_l":"#eeeeee","css":"border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;"},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":0,"pad_l_type":"inherit","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":0,"mrg_type":"int","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":0,"mrg_l_type":"auto","css":"margin: 0px;"},"shadow":[],"w":"","h":"","css":"background-color: rgb(255, 255, 255); border: 0px; border-style: solid;border-color: #eeeeee;border-radius: 0px;padding: 0px;margin: 0px;"},"prd":{"status":true,"fonts":[],"font_color":{"normal":"rgb(0, 0, 0)","hover":"rgb(0, 0, 0)"},"background":{"normal":"rgb(255, 255, 255)","hover":"rgb(255, 255, 255)"},"border":{"normal":[],"hover":[]},"padding":{"status":true,"type":"all","pad":0,"pad_type":"int","pad_t":0,"pad_t_type":"inherit","pad_r":0,"pad_r_type":"inherit","pad_b":0,"pad_b_type":"inherit","pad_l":"4","pad_l_type":"int","css":"padding: 0px;"},"margin":{"status":true,"type":"all","mrg":"5","mrg_type":"auto","mrg_t":0,"mrg_t_type":"auto","mrg_r":0,"mrg_r_type":"auto","mrg_b":0,"mrg_b_type":"auto","mrg_l":"15","mrg_l_type":"int","css":"margin: auto;"},"shadow":{"normal":[],"hover":[]},"f_size":"13px","text_align":"left","css_normal":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); padding: 0px;margin: auto;","css_hover":"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255); "},"links":"rgb(0, 0, 0)","links_h":"rgb(0, 0, 0)","spl_price":"rgb(255, 255, 255)","spl_price_h":"rgb(255, 255, 255)","normal_price":"rgb(0, 0, 0)","normal_price_h":"rgb(28, 28, 28)","old_price":"rgb(255, 255, 255)","old_price_h":"rgb(255, 255, 255)"}},"breadcrumb":{"block_wrp":[],"block":[],"link_normal":"#ffffff","link_hover":"#6ddee2","sep":"rgba(255,255,255,0.5)"}}');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_setting`
--

CREATE TABLE IF NOT EXISTS `mcc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5036 ;

--
-- 转存表中的数据 `mcc_setting`
--

INSERT INTO `mcc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(3544, 0, 'config', 'config_mail_smtp_port', '25', 0),
(3545, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(3546, 0, 'config', 'config_mail_alert', '["account","affiliate","order","review"]', 1),
(3547, 0, 'config', 'config_mail_alert_email', '', 0),
(3548, 0, 'config', 'config_maintenance', '0', 0),
(3549, 0, 'config', 'config_seo_url', '0', 0),
(3550, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(670, 0, 'voucher', 'voucher_sort_order', '8', 0),
(669, 0, 'voucher', 'voucher_status', '1', 0),
(95, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(96, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'shipping', 'shipping_sort_order', '3', 0),
(98, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(99, 0, 'sub_total', 'sub_total_status', '1', 0),
(100, 0, 'tax', 'tax_status', '1', 0),
(101, 0, 'total', 'total_sort_order', '9', 0),
(102, 0, 'total', 'total_status', '1', 0),
(103, 0, 'tax', 'tax_sort_order', '5', 0),
(104, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(105, 0, 'cod', 'cod_sort_order', '5', 0),
(106, 0, 'cod', 'cod_total', '0.01', 0),
(107, 0, 'cod', 'cod_order_status_id', '1', 0),
(108, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(109, 0, 'cod', 'cod_status', '1', 0),
(110, 0, 'shipping', 'shipping_status', '1', 0),
(111, 0, 'shipping', 'shipping_estimator', '1', 0),
(112, 0, 'coupon', 'coupon_sort_order', '4', 0),
(113, 0, 'coupon', 'coupon_status', '1', 0),
(114, 0, 'flat', 'flat_sort_order', '1', 0),
(115, 0, 'flat', 'flat_status', '1', 0),
(116, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(117, 0, 'flat', 'flat_tax_class_id', '9', 0),
(118, 0, 'flat', 'flat_cost', '5.00', 0),
(119, 0, 'credit', 'credit_sort_order', '7', 0),
(120, 0, 'credit', 'credit_status', '1', 0),
(121, 0, 'reward', 'reward_sort_order', '2', 0),
(122, 0, 'reward', 'reward_status', '1', 0),
(123, 0, 'category', 'category_status', '1', 0),
(124, 0, 'account', 'account_status', '1', 0),
(125, 0, 'affiliate', 'affiliate_status', '1', 0),
(3586, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(3585, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(3584, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(3583, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(3582, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(3581, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(3580, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(3579, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(3578, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(3577, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(3576, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(3575, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(3574, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(3573, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(3572, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(3571, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(3570, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(3569, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(3568, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(636, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(635, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(153, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(155, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(157, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(158, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(159, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(160, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(161, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(162, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(164, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(165, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(166, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(167, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(168, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(169, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(171, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(634, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(173, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(633, 0, 'basic_captcha', 'basic_captcha_status', '1', 0),
(3567, 0, 'theme_default', 'theme_default_status', '1', 0),
(3566, 0, 'theme_default', 'theme_default_directory', 'rgen-opencart', 0),
(3542, 0, 'config', 'config_mail_smtp_username', '', 0),
(3562, 0, 'config', 'config_baidu_api', '', 0),
(3561, 0, 'config', 'config_error_filename', 'error.log', 0),
(3560, 0, 'config', 'config_error_log', '1', 0),
(3559, 0, 'config', 'config_error_display', '1', 0),
(3558, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(3557, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(3556, 0, 'config', 'config_file_max_size', '300000', 0),
(3551, 0, 'config', 'config_compression', '0', 0),
(3552, 0, 'config', 'config_secure', '0', 0),
(3553, 0, 'config', 'config_password', '1', 0),
(3554, 0, 'config', 'config_shared', '0', 0),
(3564, 0, 'config', 'config_encryption', 'SZipjkQMN8aPgEu1Yp09Co5yD6ltk3nL732X7aihKH9E2Ci8CNMXLXhubpdS46P3UxPxQapr4WHF3dojCyNTHeaj7hO1TMaKqANFSYml26zXTUTvB0W5tukCbsERhuOeFtqnyWUTU41CLnVhr4Iu8C7uQMu5jHrdK20E0NZjCbvUw3VsFi8l5YjM1VWNzcfhEf0JqXujjs8YYUnTUTmycTHlou8nMptiVwXwj1lkS0fkpdPXzuReqdfweYDw7NQfrWPx93oRSy5l3vVlKlvHv1GGkgttb9pP9SQK3HBA2zK39H3CkPeN3KP760Wnq4XS0VKfVOsX1Bt3KzgTJDQcybS448ohNjf0EY7svsBGvoJO6VlLN0Rc7Bi8KF0VHStEelSZYgsvnLtQXmeaTacV1OJPCMKlmOttLnTtochxk975QAFoK6MfXZubPh0UWiVSAPNy2RtSBUYLF5fsah0cKzqmfux2s4COAtoL9hYHOqV4YR7RX9D1oCfOmm2T4Vc32K52So581Ahb84VS9VKvARXeTfF5PaeqXFbmbbUv3mMM3Sj2xDWpodGuCcW1jnw0glwL5Z0OJ6drRS4tJPH2R9pLBrdVDCflwXFN9W1zstkZP5eXZur3BC3nuYPsn2h60NSVaqGzzBYQeUfrtfHcukHezBqNo1hs92tRstKql7SeHxtsb7luNJIJ3FH25STTKrmYrjmjQ3tUUWPqcnmXqFjCAncuuU2IWpRR0W0ktpo2WS8kvrtdO2P2jpNcu9T1IYtDextG8NeqfE1gQnTj1KOesTBtfANwepPZONqEdHfp6cvnR7IYLF47y7fTYYI6eutLvyMtED7qPNPdhqiZ7RgdBYYbho8aNR9oy7nEM1aIGn2rmoBGnbs15JMPvYmGz5cyQPGK1mSJnn7t02XjilA6YcP1EreQFYEbpDFew7xSWQROGJOkgWhy0Tdx2Og1BpyDnl6NOzNtwjKfjgcaOzEyr2R00e4M7uKhzpTkugVMPxfCX1LnvIn83quOAs6e', 0),
(3543, 0, 'config', 'config_mail_smtp_password', '', 0),
(3541, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(3540, 0, 'config', 'config_mail_parameter', '', 0),
(3539, 0, 'config', 'config_mail_protocol', 'mail', 0),
(3538, 0, 'config', 'config_ftp_status', '0', 0),
(3537, 0, 'config', 'config_ftp_root', '', 0),
(3534, 0, 'config', 'config_ftp_port', '21', 0),
(3535, 0, 'config', 'config_ftp_username', '', 0),
(3536, 0, 'config', 'config_ftp_password', '', 0),
(3533, 0, 'config', 'config_ftp_hostname', '', 0),
(3532, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(3531, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(3530, 0, 'config', 'config_limit_autocomplete', '50', 0),
(3529, 0, 'config', 'config_sms', '', 0),
(2107, 0, 'cms_press', 'cms_press_seo_keyword', 'press', 0),
(2108, 0, 'cms_press', 'cms_press_brief_length', '200', 0),
(2106, 0, 'cms_press', 'cms_press_description', '{"1":{"title":"MyCnCart \\u65b0\\u95fb","meta_title":"MyCnCart \\u65b0\\u95fb","meta_description":"MyCnCart \\u65b0\\u95fb","meta_keyword":"MyCnCart, \\u65b0\\u95fb"},"2":{"title":"MyCnCart News","meta_title":"MyCnCart News","meta_description":"MyCnCart News","meta_keyword":"MyCnCart, News"},"3":{"title":"MyCnCart \\u65b0\\u805e","meta_title":"MyCnCart \\u65b0\\u805e","meta_description":"MyCnCart \\u65b0\\u805e","meta_keyword":"MyCnCart, \\u65b0\\u805e"}}', 1),
(2351, 0, 'cms_blog', 'cms_blog_comment_length', '200', 0),
(2350, 0, 'cms_blog', 'cms_blog_brief_length', '200', 0),
(2349, 0, 'cms_blog', 'cms_blog_show_need_login_to_comment', '1', 0),
(2348, 0, 'cms_blog', 'cms_blog_show_recaptcha', '1', 0),
(2347, 0, 'cms_blog', 'cms_blog_comment_email', '1', 0),
(2346, 0, 'cms_blog', 'cms_blog_show_auto_publish_comment', '1', 0),
(2345, 0, 'cms_blog', 'cms_blog_show_comment_form', '1', 0),
(2344, 0, 'cms_blog', 'cms_blog_show_comment_counter', '1', 0),
(2343, 0, 'cms_blog', 'cms_blog_show_hits', '1', 0),
(2304, 0, 'cms_blog', 'cms_blog_description', '{"1":{"title":"MyCnCart \\u535a\\u5ba2","meta_title":"MyCnCart \\u535a\\u5ba2","meta_description":"MyCnCart \\u535a\\u5ba2","meta_keyword":"MyCnCart, \\u535a\\u5ba2"},"2":{"title":"MyCnCart Blog","meta_title":"MyCnCart Blog","meta_description":"MyCnCart Blog","meta_keyword":"MyCnCart, Blog"},"3":{"title":"MyCnCart \\u535a\\u5ba2","meta_title":"MyCnCart \\u535a\\u5ba2","meta_description":"MyCnCart \\u535a\\u5ba2","meta_keyword":"MyCnCart, \\u535a\\u5ba2"}}', 1),
(2342, 0, 'cms_blog', 'cms_blog_show_created_date', '1', 0),
(2341, 0, 'cms_blog', 'cms_blog_article_related_per_row', '6', 0),
(2340, 0, 'cms_blog', 'cms_blog_article_scroll_related', '0', 0),
(2339, 0, 'cms_blog', 'cms_blog_show_blog_related', '1', 0),
(2338, 0, 'cms_blog', 'cms_blog_product_related_per_row', '3', 0),
(2337, 0, 'cms_blog', 'cms_blog_product_scroll_related', '0', 0),
(2336, 0, 'cms_blog', 'cms_blog_show_product_related', '1', 0),
(2335, 0, 'cms_blog', 'cms_blog_show_category', '1', 0),
(2334, 0, 'cms_blog', 'cms_blog_show_author', '1', 0),
(2333, 0, 'cms_blog', 'cms_blog_show_image', '1', 0),
(2332, 0, 'cms_blog', 'cms_blog_show_title', '1', 0),
(2331, 0, 'cms_blog', 'cms_blog_image_type', 'l', 0),
(2328, 0, 'cms_blog', 'cms_blog_category_page_show_created_date', '1', 0),
(2330, 0, 'cms_blog', 'cms_blog_category_page_show_comment_counter', '1', 0),
(2329, 0, 'cms_blog', 'cms_blog_category_page_show_hits', '1', 0),
(2327, 0, 'cms_blog', 'cms_blog_category_page_show_category', '1', 0),
(2326, 0, 'cms_blog', 'cms_blog_category_page_show_author', '1', 0),
(2325, 0, 'cms_blog', 'cms_blog_category_page_show_image', '1', 0),
(2324, 0, 'cms_blog', 'cms_blog_category_page_show_readmore', '1', 0),
(2323, 0, 'cms_blog', 'cms_blog_category_page_show_brief', '1', 0),
(2321, 0, 'cms_blog', 'cms_blog_category_columns_secondary_blogs', '', 0),
(2322, 0, 'cms_blog', 'cms_blog_category_page_show_title', '1', 0),
(2320, 0, 'cms_blog', 'cms_blog_category_columns_leading_blog', '', 0),
(2319, 0, 'cms_blog', 'cms_blog_category_secondary_image_type', 's', 0),
(2318, 0, 'cms_blog', 'cms_blog_category_leading_image_type', 'l', 0),
(2317, 0, 'cms_blog', 'cms_blog_category_limit_secondary_blog', '', 0),
(2316, 0, 'cms_blog', 'cms_blog_category_limit_leading_blog', '', 0),
(2315, 0, 'cms_blog', 'cms_blog_general_cheight', '', 0),
(2314, 0, 'cms_blog', 'cms_blog_general_cwidth', '', 0),
(2313, 0, 'cms_blog', 'cms_blog_children_columns', '', 0),
(2312, 0, 'cms_blog', 'cms_blog_items_per_page', '10', 0),
(2311, 0, 'cms_blog', 'cms_blog_small_image_height', '300', 0),
(2353, 0, 'cms_faq', 'cms_faq_seo_keyword', 'faq', 0),
(2352, 0, 'cms_faq', 'cms_faq_description', '{"1":{"title":"\\u5e38\\u89c1\\u95ee\\u9898\\u4e0e\\u89e3\\u7b54(FAQs)","meta_title":"\\u5e38\\u89c1\\u95ee\\u9898\\u4e0e\\u89e3\\u7b54(FAQs)","meta_description":"\\u5e38\\u89c1\\u95ee\\u9898\\u4e0e\\u89e3\\u7b54(FAQs)","meta_keyword":"\\u5e38\\u89c1\\u95ee\\u9898\\u4e0e\\u89e3\\u7b54(FAQs)"},"2":{"title":"FAQs","meta_title":"FAQs","meta_description":"FAQs","meta_keyword":"FAQs"},"3":{"title":"\\u5e38\\u898b\\u554f\\u984c\\u8207\\u89e3\\u7b54(FAQs)","meta_title":"\\u5e38\\u898b\\u554f\\u984c\\u8207\\u89e3\\u7b54(FAQs)","meta_description":"\\u5e38\\u898b\\u554f\\u984c\\u8207\\u89e3\\u7b54(FAQs)","meta_keyword":"\\u5e38\\u898b\\u554f\\u984c\\u8207\\u89e3\\u7b54(FAQs)"}}', 1),
(1663, 0, 'blog_search', 'blog_search_status', '1', 0),
(1664, 0, 'blog_category', 'blog_category_status', '1', 0),
(2305, 0, 'cms_blog', 'cms_blog_seo_keyword', 'blog', 0),
(2306, 0, 'cms_blog', 'cms_blog_large_image_width', '845', 0),
(2307, 0, 'cms_blog', 'cms_blog_large_image_height', '300', 0),
(2308, 0, 'cms_blog', 'cms_blog_middle_image_width', '620', 0),
(2309, 0, 'cms_blog', 'cms_blog_middle_image_height', '300', 0),
(2310, 0, 'cms_blog', 'cms_blog_small_image_width', '620', 0),
(1761, 0, 'press_latest', 'press_latest_status', '1', 0),
(1762, 0, 'press_category', 'press_category_status', '1', 0),
(1763, 0, 'faq_category', 'faq_category_status', '1', 0),
(3512, 0, 'config', 'config_checkout_id', '5', 0),
(2109, 0, 'cms_press', 'cms_press_items_per_page', '10', 0),
(2354, 0, 'cms_faq', 'cms_faq_items_per_page', '10', 0),
(3528, 0, 'config', 'config_captcha_page', '["register","guest","review","return","contact","comment"]', 1),
(3527, 0, 'config', 'config_captcha', 'basic_captcha', 0),
(3525, 0, 'config', 'config_return_id', '0', 0),
(3526, 0, 'config', 'config_return_status_id', '2', 0),
(3513, 0, 'config', 'config_order_status_id', '1', 0),
(3514, 0, 'config', 'config_processing_status', '["2","5","3","1"]', 1),
(3515, 0, 'config', 'config_complete_status', '["5","3"]', 1),
(3516, 0, 'config', 'config_fraud_status_id', '7', 0),
(2571, 0, 'free', 'free_total', '0.01', 0),
(2572, 0, 'free', 'free_geo_zone_id', '0', 0),
(2573, 0, 'free', 'free_status', '1', 0),
(2574, 0, 'free', 'free_sort_order', '2', 0),
(3565, 0, 'config', 'config_api_id', '1', 0),
(3518, 0, 'config', 'config_stock_display', '1', 0),
(3519, 0, 'config', 'config_stock_warning', '0', 0),
(3520, 0, 'config', 'config_stock_checkout', '0', 0),
(3521, 0, 'config', 'config_affiliate_approval', '0', 0),
(3522, 0, 'config', 'config_affiliate_auto', '0', 0),
(3523, 0, 'config', 'config_affiliate_commission', '5', 0),
(3524, 0, 'config', 'config_affiliate_id', '4', 0),
(3472, 0, 'config', 'config_owner', '青岛万物一体网络科技有限公司', 0),
(3511, 0, 'config', 'config_checkout_guest', '1', 0),
(3510, 0, 'config', 'config_cart_weight', '1', 0),
(3509, 0, 'config', 'config_invoice_prefix', 'INV-2016-00', 0),
(3508, 0, 'config', 'config_account_id', '3', 0),
(3506, 0, 'config', 'config_customer_price', '0', 0),
(3507, 0, 'config', 'config_login_attempts', '5', 0),
(3505, 0, 'config', 'config_customer_group_display', '["1"]', 1),
(3504, 0, 'config', 'config_customer_group_id', '1', 0),
(3503, 0, 'config', 'config_customer_search', '0', 0),
(3502, 0, 'config', 'config_customer_activity', '0', 0),
(3501, 0, 'config', 'config_customer_online', '0', 0),
(3500, 0, 'config', 'config_tax_customer', '', 0),
(3499, 0, 'config', 'config_tax_default', '', 0),
(3498, 0, 'config', 'config_tax', '0', 0),
(3497, 0, 'config', 'config_voucher_max', '1000', 0),
(3495, 0, 'config', 'config_review_guest', '1', 0),
(3496, 0, 'config', 'config_voucher_min', '1', 0),
(3484, 0, 'config', 'config_country_id', '44', 0),
(3485, 0, 'config', 'config_zone_id', '707', 0),
(3486, 0, 'config', 'config_language', 'zh-cn', 0),
(3487, 0, 'config', 'config_admin_language', 'zh-cn', 0),
(3488, 0, 'config', 'config_currency', 'CNY', 0),
(3489, 0, 'config', 'config_currency_auto', '0', 0),
(3490, 0, 'config', 'config_length_class_id', '1', 0),
(3491, 0, 'config', 'config_weight_class_id', '1', 0),
(3492, 0, 'config', 'config_product_count', '1', 0),
(3493, 0, 'config', 'config_limit_admin', '20', 0),
(3494, 0, 'config', 'config_review_status', '1', 0),
(3483, 0, 'config', 'config_comment', '', 0),
(3482, 0, 'config', 'config_open', '', 0),
(3480, 0, 'config', 'config_fax', '', 0),
(3481, 0, 'config', 'config_image', '', 0),
(3479, 0, 'config', 'config_sms_telephone', '18561800618', 0),
(3478, 0, 'config', 'config_telephone', '18561800618', 0),
(3563, 0, 'config', 'config_email', '1104323694@qq.com', 0),
(3475, 0, 'config', 'config_map_select', 'baidu', 0),
(3476, 0, 'config', 'config_geocode', '120.191457,35.959145', 0),
(3473, 0, 'config', 'config_address', '中国山东省青岛市长江中路汇商国际大厦', 0),
(3474, 0, 'config', 'config_miit', '鲁ICP备16025901号', 0),
(3470, 0, 'config', 'config_layout_id', '4', 0),
(3471, 0, 'config', 'config_name', '我的B2C中国网店', 0),
(3469, 0, 'config', 'config_theme', 'theme_default', 0),
(3468, 0, 'config', 'config_meta_keyword', 'MyCnCart, 我的B2C中国网店', 0),
(3466, 0, 'config', 'config_meta_title', 'MyCnCart - 我的B2C中国网店', 0),
(3467, 0, 'config', 'config_meta_description', 'MyCnCart - 我的B2C中国网店', 0),
(3587, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(3588, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(3589, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(5019, 0, 'rgen_prdpgtabs', 'rgen_prdpgtabs_R.set_rgNzB.rgMSC', '1', 0),
(5015, 0, 'rgen_gridmanager', 'rgen_gridmanager_R.set_rgmbI.rgpFy', '1', 0),
(5035, 0, 'rgen_revslider', 'rgen_revslider_R.set_rgixj.rgrVA', '1', 0),
(5017, 0, 'rgen_prdpghtml', 'rgen_prdpghtml_R.set_rgvYr.rgraI', '1', 0),
(5016, 0, 'rgen_prdpghtml', 'rgen_prdpghtml_R.set_rgDGm.rgFot', '1', 0),
(5008, 0, 'rgen_customhtml', 'rgen_customhtml_R.set_rgGx4.rgu9C', '1', 0),
(5013, 0, 'rgen_gridmanager', 'rgen_gridmanager_R.set_rgqxX.rgf9A', '1', 0),
(5014, 0, 'rgen_gridmanager', 'rgen_gridmanager_R.set_rgEsM.rg8pH', '', 0),
(5033, 0, 'rgen_menu', 'rgen_menu_R.set_rgRiF.rgvP4', '1', 0),
(5000, 0, 'rgen_basicslideshow', 'rgen_basicslideshow_R.set_rgYlC.rgfTN', '', 0),
(5003, 0, 'rgen_productgroups', 'rgen_productgroups_R.set_rgUkB.rgj9L', '1', 0),
(5004, 0, 'rgen_productgroups', 'rgen_productgroups_R.set_rglnV.rgJkT', '1', 0),
(5032, 0, 'rgen_contentblocks', 'rgen_contentblocks_R.set_rg7DO.rgtZs', '1', 0),
(5007, 0, 'rgen_customhtml', 'rgen_customhtml_R.set_rgai9.rgu2K', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_sms_mobile`
--

CREATE TABLE IF NOT EXISTS `mcc_sms_mobile` (
  `sms_mobile_id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_mobile` varchar(15) CHARACTER SET utf8 NOT NULL,
  `verify_code` varchar(6) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`sms_mobile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `mcc_sms_mobile`
--

INSERT INTO `mcc_sms_mobile` (`sms_mobile_id`, `sms_mobile`, `verify_code`) VALUES
(11, '13888888888', '110406');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_stock_status`
--

CREATE TABLE IF NOT EXISTS `mcc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `mcc_stock_status`
--

INSERT INTO `mcc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, '有库存'),
(8, 1, '需要预订'),
(5, 1, '库存不足'),
(6, 1, '等待 2 -3 天');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_store`
--

CREATE TABLE IF NOT EXISTS `mcc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_tax_class`
--

CREATE TABLE IF NOT EXISTS `mcc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `mcc_tax_class`
--

INSERT INTO `mcc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, '应税商品', '应税商品', '2009-01-06 23:21:53', '2015-04-01 22:30:09'),
(10, '下载类商品', '下载类', '2011-09-21 22:19:39', '2015-04-01 22:29:46');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `mcc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- 转存表中的数据 `mcc_tax_rate`
--

INSERT INTO `mcc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, '增值税 (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2015-04-01 22:33:10'),
(87, 3, '生态税(-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2015-04-01 22:33:22');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `mcc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_tax_rate_to_customer_group`
--

INSERT INTO `mcc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `mcc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- 转存表中的数据 `mcc_tax_rule`
--

INSERT INTO `mcc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_theme`
--

CREATE TABLE IF NOT EXISTS `mcc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_translation`
--

CREATE TABLE IF NOT EXISTS `mcc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_upload`
--

CREATE TABLE IF NOT EXISTS `mcc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_url_alias`
--

CREATE TABLE IF NOT EXISTS `mcc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1310 ;

--
-- 转存表中的数据 `mcc_url_alias`
--

INSERT INTO `mcc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(1041, 'product_id=48', 'ipod-classic'),
(1053, 'category_id=26', 'AirJordan1'),
(1054, 'category_id=27', 'AirJordan2'),
(730, 'manufacturer_id=8', 'apple'),
(772, 'information_id=4', 'about_us'),
(1243, 'product_id=42', 'test'),
(1308, 'press_category_id=2', 'kuaibao'),
(1085, 'category_id=36', 'durant'),
(1080, 'category_id=25', 'nike'),
(893, 'category_id=29', 'beds'),
(1081, 'category_id=28', 'nikebasketball'),
(1084, 'category_id=35', 'james'),
(892, 'category_id=30', 'dressing-table'),
(891, 'category_id=31', 'reading-table'),
(890, 'category_id=32', 'bed-room'),
(1083, 'category_id=57', 'kobe'),
(1307, 'press_category_id=1', 'ceping'),
(1244, 'product_id=30', 'canon-eos-5d'),
(1306, 'product_id=47', 'hp-lp3065'),
(1040, 'product_id=28', 'htc-touch-hd'),
(1050, 'product_id=43', 'macbook'),
(1034, 'product_id=44', 'macbook-air'),
(1030, 'product_id=45', 'macbook-pro'),
(1037, 'product_id=31', 'nikon-d300'),
(1038, 'product_id=29', 'palm-treo-pro'),
(1035, 'product_id=35', 'product-8'),
(1245, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(1044, 'product_id=33', 'samsung-syncmaster-941bw'),
(1045, 'product_id=46', 'sony-vaio'),
(1029, 'product_id=41', 'imac'),
(1042, 'product_id=40', 'iphone'),
(1031, 'product_id=36', 'ipod-nano'),
(1039, 'product_id=34', 'ipod-shuffle'),
(1036, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms'),
(949, 'blog_id=4', 'blog-4.html'),
(1309, 'press_id=10', 'press-10.html'),
(1017, 'press_id=4', 'press-4.html'),
(1018, 'press_id=5', 'press-5.html'),
(1019, 'blog_id=2', 'blog-2.html'),
(1020, 'blog_id=15', 'blog-15.html'),
(1023, 'blog_id=10', 'blog-10.html'),
(1079, 'category_id=20', 'AirJordan'),
(1055, 'category_id=61', 'AirJordan3'),
(1056, 'category_id=62', 'AirJordan4'),
(1057, 'category_id=63', 'AirJordan5'),
(1058, 'category_id=64', 'AirJordan6'),
(1059, 'category_id=65', 'AirJordan7'),
(1060, 'category_id=66', 'AirJordan8'),
(1061, 'category_id=67', 'AirJordan9'),
(1062, 'category_id=68', 'AirJordan10'),
(1063, 'category_id=69', 'AirJordan11'),
(1064, 'category_id=70', 'AirJordan12'),
(1065, 'category_id=71', 'AirJordan13'),
(1066, 'category_id=72', 'AirJordan14'),
(1067, 'category_id=73', 'AirJordan15'),
(1068, 'category_id=74', 'AirJordan16'),
(1069, 'category_id=75', 'AirJordan17'),
(1070, 'category_id=76', 'AirJordan18'),
(1071, 'category_id=77', 'AirJordan19'),
(1072, 'category_id=78', 'AirJordan20'),
(1073, 'category_id=79', 'AirJordan21'),
(1074, 'category_id=80', 'AirJordan22'),
(1075, 'category_id=81', 'AirJordan23'),
(1077, 'category_id=82', 'otherjordan'),
(1086, 'category_id=83', 'irving'),
(1087, 'category_id=84', 'penpao'),
(1088, 'category_id=85', 'nikebasketballother'),
(1089, 'manufacturer_id=11', ''),
(1090, 'manufacturer_id=12', ''),
(1091, 'manufacturer_id=13', ''),
(1092, 'manufacturer_id=14', ''),
(1093, 'manufacturer_id=15', ''),
(1094, 'manufacturer_id=16', ''),
(1095, 'manufacturer_id=17', ''),
(1096, 'manufacturer_id=18', ''),
(1097, 'manufacturer_id=19', ''),
(1098, 'manufacturer_id=20', ''),
(1099, 'manufacturer_id=21', ''),
(1100, 'manufacturer_id=22', ''),
(1103, 'manufacturer_id=25', ''),
(1102, 'manufacturer_id=24', ''),
(1104, 'manufacturer_id=26', ''),
(1259, 'manufacturer_id=173', 'OAMC'),
(1106, 'manufacturer_id=28', ''),
(1107, 'manufacturer_id=29', ''),
(1108, 'manufacturer_id=30', ''),
(1109, 'manufacturer_id=31', ''),
(1110, 'manufacturer_id=32', ''),
(1111, 'manufacturer_id=33', ''),
(1112, 'manufacturer_id=34', ''),
(1113, 'manufacturer_id=35', ''),
(1114, 'manufacturer_id=36', ''),
(1115, 'manufacturer_id=37', ''),
(1116, 'manufacturer_id=38', ''),
(1117, 'manufacturer_id=39', ''),
(1118, 'manufacturer_id=40', ''),
(1119, 'manufacturer_id=41', ''),
(1120, 'manufacturer_id=42', ''),
(1121, 'manufacturer_id=43', ''),
(1122, 'manufacturer_id=44', ''),
(1123, 'manufacturer_id=45', ''),
(1124, 'manufacturer_id=46', ''),
(1125, 'manufacturer_id=47', ''),
(1126, 'manufacturer_id=48', ''),
(1127, 'manufacturer_id=49', ''),
(1128, 'manufacturer_id=50', ''),
(1129, 'manufacturer_id=51', ''),
(1130, 'manufacturer_id=52', ''),
(1131, 'manufacturer_id=53', ''),
(1132, 'manufacturer_id=54', ''),
(1133, 'manufacturer_id=55', ''),
(1134, 'manufacturer_id=56', ''),
(1135, 'manufacturer_id=57', ''),
(1136, 'manufacturer_id=58', ''),
(1137, 'manufacturer_id=59', ''),
(1138, 'manufacturer_id=60', ''),
(1139, 'manufacturer_id=61', ''),
(1140, 'manufacturer_id=62', ''),
(1141, 'manufacturer_id=63', ''),
(1142, 'manufacturer_id=64', ''),
(1143, 'manufacturer_id=65', ''),
(1144, 'manufacturer_id=66', ''),
(1145, 'manufacturer_id=67', ''),
(1146, 'manufacturer_id=68', ''),
(1147, 'manufacturer_id=69', ''),
(1148, 'manufacturer_id=70', ''),
(1149, 'manufacturer_id=71', ''),
(1150, 'manufacturer_id=72', ''),
(1151, 'manufacturer_id=73', ''),
(1152, 'manufacturer_id=74', ''),
(1153, 'manufacturer_id=75', ''),
(1154, 'manufacturer_id=76', ''),
(1156, 'manufacturer_id=78', ''),
(1157, 'manufacturer_id=79', ''),
(1158, 'manufacturer_id=80', ''),
(1159, 'manufacturer_id=81', ''),
(1160, 'manufacturer_id=82', ''),
(1161, 'manufacturer_id=83', ''),
(1162, 'manufacturer_id=84', ''),
(1163, 'manufacturer_id=85', ''),
(1164, 'manufacturer_id=86', ''),
(1256, 'manufacturer_id=170', 'Balmain'),
(1166, 'manufacturer_id=88', ''),
(1167, 'manufacturer_id=89', ''),
(1168, 'manufacturer_id=90', ''),
(1169, 'manufacturer_id=91', ''),
(1170, 'manufacturer_id=92', ''),
(1171, 'manufacturer_id=93', ''),
(1172, 'manufacturer_id=94', ''),
(1173, 'manufacturer_id=95', ''),
(1174, 'manufacturer_id=96', ''),
(1175, 'manufacturer_id=97', ''),
(1176, 'manufacturer_id=98', ''),
(1177, 'manufacturer_id=99', ''),
(1178, 'manufacturer_id=100', ''),
(1179, 'manufacturer_id=101', ''),
(1180, 'manufacturer_id=102', ''),
(1181, 'manufacturer_id=103', ''),
(1182, 'manufacturer_id=104', ''),
(1183, 'manufacturer_id=105', ''),
(1184, 'manufacturer_id=106', ''),
(1185, 'manufacturer_id=107', ''),
(1186, 'manufacturer_id=108', ''),
(1187, 'manufacturer_id=109', ''),
(1188, 'manufacturer_id=110', ''),
(1189, 'manufacturer_id=111', ''),
(1190, 'manufacturer_id=112', ''),
(1191, 'manufacturer_id=113', ''),
(1192, 'manufacturer_id=114', ''),
(1193, 'manufacturer_id=115', ''),
(1194, 'manufacturer_id=116', ''),
(1195, 'manufacturer_id=117', ''),
(1196, 'manufacturer_id=118', ''),
(1197, 'manufacturer_id=119', ''),
(1198, 'manufacturer_id=120', ''),
(1199, 'manufacturer_id=121', ''),
(1200, 'manufacturer_id=122', ''),
(1201, 'manufacturer_id=123', ''),
(1202, 'manufacturer_id=124', ''),
(1203, 'manufacturer_id=125', ''),
(1204, 'manufacturer_id=126', ''),
(1205, 'manufacturer_id=127', ''),
(1208, 'manufacturer_id=130', ''),
(1209, 'manufacturer_id=131', ''),
(1210, 'manufacturer_id=132', ''),
(1211, 'manufacturer_id=133', ''),
(1212, 'manufacturer_id=134', ''),
(1213, 'manufacturer_id=135', ''),
(1214, 'manufacturer_id=136', ''),
(1215, 'manufacturer_id=137', ''),
(1216, 'manufacturer_id=138', ''),
(1217, 'manufacturer_id=139', ''),
(1218, 'manufacturer_id=140', ''),
(1219, 'manufacturer_id=141', ''),
(1220, 'manufacturer_id=142', ''),
(1221, 'manufacturer_id=143', ''),
(1222, 'manufacturer_id=144', ''),
(1223, 'manufacturer_id=145', ''),
(1224, 'manufacturer_id=146', ''),
(1225, 'manufacturer_id=147', ''),
(1226, 'manufacturer_id=148', ''),
(1227, 'manufacturer_id=149', ''),
(1228, 'manufacturer_id=150', ''),
(1229, 'manufacturer_id=151', ''),
(1230, 'manufacturer_id=152', ''),
(1231, 'manufacturer_id=153', ''),
(1232, 'manufacturer_id=154', ''),
(1233, 'manufacturer_id=155', ''),
(1234, 'manufacturer_id=156', ''),
(1235, 'manufacturer_id=157', ''),
(1236, 'manufacturer_id=158', ''),
(1237, 'manufacturer_id=159', ''),
(1240, 'manufacturer_id=162', ''),
(1257, 'manufacturer_id=171', 'Lacasote'),
(1258, 'manufacturer_id=172', 'ALBAM'),
(1260, 'manufacturer_id=174', 'OfficineGenerale'),
(1261, 'manufacturer_id=175', 'OlafHussein'),
(1262, 'manufacturer_id=176', 'OliverSpencer'),
(1263, 'manufacturer_id=177', 'OnitsukaTiger'),
(1264, 'manufacturer_id=178', 'Palace'),
(1265, 'manufacturer_id=179', 'Patta'),
(1266, 'manufacturer_id=180', 'PaulSmith'),
(1267, 'manufacturer_id=181', 'Penfield'),
(1268, 'manufacturer_id=182', 'PoloRalphLauren'),
(1269, 'manufacturer_id=183', 'Puma'),
(1270, 'manufacturer_id=184', 'RafSimons'),
(1271, 'manufacturer_id=185', 'Ray Ban'),
(1272, 'manufacturer_id=186', 'RedWing'),
(1273, 'manufacturer_id=187', 'Reebok'),
(1274, 'manufacturer_id=188', 'retaW'),
(1275, 'manufacturer_id=189', 'Rick Owens'),
(1276, 'manufacturer_id=190', 'RRLbyRalphLauren'),
(1277, 'manufacturer_id=191', 'SaintLaurent'),
(1278, 'manufacturer_id=192', 'Saucony'),
(1279, 'manufacturer_id=193', 'SOPHNET.'),
(1280, 'manufacturer_id=194', 'Stussy'),
(1281, 'manufacturer_id=195', 'Suicoke'),
(1282, 'manufacturer_id=196', 'Teva'),
(1283, 'manufacturer_id=197', 'TheNorthFace'),
(1284, 'manufacturer_id=198', 'ThomBrowne'),
(1285, 'manufacturer_id=199', 'Timberland'),
(1286, 'manufacturer_id=200', 'Timex'),
(1287, 'manufacturer_id=201', 'TommyHilfiger'),
(1288, 'manufacturer_id=202', 'Undefeated'),
(1289, 'manufacturer_id=203', 'Undercover'),
(1290, 'manufacturer_id=204', 'UniformExperiment'),
(1291, 'manufacturer_id=205', 'Valentino'),
(1292, 'manufacturer_id=206', 'Vanquish'),
(1293, 'manufacturer_id=207', 'Vans'),
(1294, 'manufacturer_id=208', 'VISVIM'),
(1295, 'manufacturer_id=209', 'WhiteMountaineering'),
(1296, 'manufacturer_id=210', 'Wacko Maria'),
(1297, 'manufacturer_id=211', 'WTAPS'),
(1298, 'manufacturer_id=212', 'Y-3'),
(1299, 'manufacturer_id=213', 'YeezySeason'),
(1300, 'category_id=86', ''),
(1301, 'category_id=87', ''),
(1302, 'category_id=88', ''),
(1303, 'category_id=89', '');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_user`
--

CREATE TABLE IF NOT EXISTS `mcc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `fullname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `mcc_user`
--

INSERT INTO `mcc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `fullname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'dcd0e620a24851dfaf6b5b8b29f74be306466fad', 'euyo00Hft', 'SuperAdmin', '1104323694@qq.com', '', '', '127.0.0.1', 1, '2016-09-26 19:46:31');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_user_group`
--

CREATE TABLE IF NOT EXISTS `mcc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `mcc_user_group`
--

INSERT INTO `mcc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, '超级管理员群组', '{"access":["baidu\\/pushurl","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","catalog\\/url_alias","cms\\/blog","cms\\/blog_category","cms\\/blog_comment","cms\\/blog_config","cms\\/faq","cms\\/faq_category","cms\\/faq_config","cms\\/press","cms\\/press_category","cms\\/press_config","common\\/column_left","common\\/filemanager","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/language","design\\/layout","design\\/menu","design\\/theme","design\\/translation","event\\/compatibility","event\\/theme","extension\\/analytics\\/baidu_analytics","extension\\/analytics\\/google_analytics","extension\\/captcha\\/basic_captcha","extension\\/captcha\\/google_captcha","extension\\/dashboard\\/activity","extension\\/dashboard\\/chart","extension\\/dashboard\\/customer","extension\\/dashboard\\/map","extension\\/dashboard\\/online","extension\\/dashboard\\/order","extension\\/dashboard\\/recent","extension\\/dashboard\\/sale","extension\\/event","extension\\/extension","extension\\/extension\\/analytics","extension\\/extension\\/captcha","extension\\/extension\\/dashboard","extension\\/extension\\/feed","extension\\/extension\\/fraud","extension\\/extension\\/module","extension\\/extension\\/payment","extension\\/extension\\/shipping","extension\\/extension\\/sms","extension\\/extension\\/theme","extension\\/extension\\/total","extension\\/feed\\/google_base","extension\\/feed\\/google_sitemap","extension\\/feed\\/openbaypro","extension\\/fraud\\/fraudlabspro","extension\\/fraud\\/ip","extension\\/fraud\\/maxmind","extension\\/installer","extension\\/modification","extension\\/module\\/account","extension\\/module\\/affiliate","extension\\/module\\/amazon_login","extension\\/module\\/amazon_pay","extension\\/module\\/banner","extension\\/module\\/bestseller","extension\\/module\\/blog_category","extension\\/module\\/blog_comment","extension\\/module\\/blog_latest","extension\\/module\\/blog_popular","extension\\/module\\/blog_search","extension\\/module\\/carousel","extension\\/module\\/category","extension\\/module\\/divido_calculator","extension\\/module\\/ebay_listing","extension\\/module\\/faq_category","extension\\/module\\/featured","extension\\/module\\/filter","extension\\/module\\/google_hangouts","extension\\/module\\/html","extension\\/module\\/information","extension\\/module\\/klarna_checkout_module","extension\\/module\\/latest","extension\\/module\\/laybuy_layout","extension\\/module\\/pilibaba_button","extension\\/module\\/pp_button","extension\\/module\\/pp_login","extension\\/module\\/press_category","extension\\/module\\/press_latest","extension\\/module\\/sagepay_direct_cards","extension\\/module\\/sagepay_server_cards","extension\\/module\\/slideshow","extension\\/module\\/special","extension\\/module\\/store","extension\\/openbay","extension\\/openbay\\/amazon","extension\\/openbay\\/amazon_listing","extension\\/openbay\\/amazon_product","extension\\/openbay\\/amazonus","extension\\/openbay\\/amazonus_listing","extension\\/openbay\\/amazonus_product","extension\\/openbay\\/ebay","extension\\/openbay\\/ebay_profile","extension\\/openbay\\/ebay_template","extension\\/openbay\\/etsy","extension\\/openbay\\/etsy_product","extension\\/openbay\\/etsy_shipping","extension\\/openbay\\/etsy_shop","extension\\/openbay\\/fba","extension\\/payment\\/amazon_login_pay","extension\\/payment\\/authorizenet_aim","extension\\/payment\\/authorizenet_sim","extension\\/payment\\/bank_transfer","extension\\/payment\\/bluepay_hosted","extension\\/payment\\/bluepay_redirect","extension\\/payment\\/cardconnect","extension\\/payment\\/cardinity","extension\\/payment\\/cheque","extension\\/payment\\/cod","extension\\/payment\\/divido","extension\\/payment\\/eway","extension\\/payment\\/firstdata","extension\\/payment\\/firstdata_remote","extension\\/payment\\/free_checkout","extension\\/payment\\/g2apay","extension\\/payment\\/globalpay","extension\\/payment\\/globalpay_remote","extension\\/payment\\/klarna_account","extension\\/payment\\/klarna_checkout","extension\\/payment\\/klarna_invoice","extension\\/payment\\/laybuy","extension\\/payment\\/liqpay","extension\\/payment\\/nochex","extension\\/payment\\/paymate","extension\\/payment\\/paypoint","extension\\/payment\\/payza","extension\\/payment\\/perpetual_payments","extension\\/payment\\/pilibaba","extension\\/payment\\/pp_express","extension\\/payment\\/pp_payflow","extension\\/payment\\/pp_payflow_iframe","extension\\/payment\\/pp_pro","extension\\/payment\\/pp_pro_iframe","extension\\/payment\\/pp_standard","extension\\/payment\\/realex","extension\\/payment\\/realex_remote","extension\\/payment\\/sagepay_direct","extension\\/payment\\/sagepay_server","extension\\/payment\\/sagepay_us","extension\\/payment\\/securetrading_pp","extension\\/payment\\/securetrading_ws","extension\\/payment\\/skrill","extension\\/payment\\/twocheckout","extension\\/payment\\/web_payment_software","extension\\/payment\\/worldpay","extension\\/shipping\\/auspost","extension\\/shipping\\/citylink","extension\\/shipping\\/fedex","extension\\/shipping\\/flat","extension\\/shipping\\/free","extension\\/shipping\\/item","extension\\/shipping\\/parcelforce_48","extension\\/shipping\\/pickup","extension\\/shipping\\/royal_mail","extension\\/shipping\\/ups","extension\\/shipping\\/usps","extension\\/shipping\\/weight","extension\\/sms\\/chuanglan","extension\\/store","extension\\/theme\\/theme_default","extension\\/total\\/coupon","extension\\/total\\/credit","extension\\/total\\/handling","extension\\/total\\/klarna_fee","extension\\/total\\/low_order_fee","extension\\/total\\/reward","extension\\/total\\/shipping","extension\\/total\\/sub_total","extension\\/total\\/tax","extension\\/total\\/total","extension\\/total\\/voucher","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/customer_search","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","startup\\/compatibility","startup\\/error","startup\\/event","startup\\/login","startup\\/permission","startup\\/router","startup\\/sass","startup\\/startup","tool\\/backup","tool\\/excelexportimport","tool\\/log","tool\\/upload","user\\/api","user\\/user","user\\/user_permission","extension\\/payment\\/alipay_direct","extension\\/shipping\\/free","extension\\/payment\\/alipay_wap","extension\\/payment\\/wxpay","extension\\/module\\/weibo_login","extension\\/payment\\/qrcode_wxpay","extension\\/module\\/wx_login","extension\\/module\\/qq_login","extension\\/shipping\\/weight","extension\\/module\\/weixin_login","extension\\/payment\\/alipay_transfer","extension\\/payment\\/alipay_transfer","extension\\/payment\\/precharge","extension\\/sms\\/chuanglan","extension\\/module\\/revslideropencart","extension\\/module\\/rgen","extension\\/module\\/rgen","extension\\/module\\/rgen\\/render","extension\\/module\\/rgen\\/rest","extension\\/module\\/bestseller","extension\\/module\\/latest","extension\\/module\\/weixin_login","extension\\/module\\/information","extension\\/module\\/qq_login","extension\\/module\\/filter"],"modify":["baidu\\/pushurl","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","catalog\\/url_alias","cms\\/blog","cms\\/blog_category","cms\\/blog_comment","cms\\/blog_config","cms\\/faq","cms\\/faq_category","cms\\/faq_config","cms\\/press","cms\\/press_category","cms\\/press_config","common\\/column_left","common\\/filemanager","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/language","design\\/layout","design\\/menu","design\\/theme","design\\/translation","event\\/compatibility","event\\/theme","extension\\/analytics\\/baidu_analytics","extension\\/analytics\\/google_analytics","extension\\/captcha\\/basic_captcha","extension\\/captcha\\/google_captcha","extension\\/dashboard\\/activity","extension\\/dashboard\\/chart","extension\\/dashboard\\/customer","extension\\/dashboard\\/map","extension\\/dashboard\\/online","extension\\/dashboard\\/order","extension\\/dashboard\\/recent","extension\\/dashboard\\/sale","extension\\/event","extension\\/extension","extension\\/extension\\/analytics","extension\\/extension\\/captcha","extension\\/extension\\/dashboard","extension\\/extension\\/feed","extension\\/extension\\/fraud","extension\\/extension\\/module","extension\\/extension\\/payment","extension\\/extension\\/shipping","extension\\/extension\\/sms","extension\\/extension\\/theme","extension\\/extension\\/total","extension\\/feed\\/google_base","extension\\/feed\\/google_sitemap","extension\\/feed\\/openbaypro","extension\\/fraud\\/fraudlabspro","extension\\/fraud\\/ip","extension\\/fraud\\/maxmind","extension\\/installer","extension\\/modification","extension\\/module\\/account","extension\\/module\\/affiliate","extension\\/module\\/amazon_login","extension\\/module\\/amazon_pay","extension\\/module\\/banner","extension\\/module\\/bestseller","extension\\/module\\/blog_category","extension\\/module\\/blog_comment","extension\\/module\\/blog_latest","extension\\/module\\/blog_popular","extension\\/module\\/blog_search","extension\\/module\\/carousel","extension\\/module\\/category","extension\\/module\\/divido_calculator","extension\\/module\\/ebay_listing","extension\\/module\\/faq_category","extension\\/module\\/featured","extension\\/module\\/filter","extension\\/module\\/google_hangouts","extension\\/module\\/html","extension\\/module\\/information","extension\\/module\\/klarna_checkout_module","extension\\/module\\/latest","extension\\/module\\/laybuy_layout","extension\\/module\\/pilibaba_button","extension\\/module\\/pp_button","extension\\/module\\/pp_login","extension\\/module\\/press_category","extension\\/module\\/press_latest","extension\\/module\\/sagepay_direct_cards","extension\\/module\\/sagepay_server_cards","extension\\/module\\/slideshow","extension\\/module\\/special","extension\\/module\\/store","extension\\/openbay","extension\\/openbay\\/amazon","extension\\/openbay\\/amazon_listing","extension\\/openbay\\/amazon_product","extension\\/openbay\\/amazonus","extension\\/openbay\\/amazonus_listing","extension\\/openbay\\/amazonus_product","extension\\/openbay\\/ebay","extension\\/openbay\\/ebay_profile","extension\\/openbay\\/ebay_template","extension\\/openbay\\/etsy","extension\\/openbay\\/etsy_product","extension\\/openbay\\/etsy_shipping","extension\\/openbay\\/etsy_shop","extension\\/openbay\\/fba","extension\\/payment\\/amazon_login_pay","extension\\/payment\\/authorizenet_aim","extension\\/payment\\/authorizenet_sim","extension\\/payment\\/bank_transfer","extension\\/payment\\/bluepay_hosted","extension\\/payment\\/bluepay_redirect","extension\\/payment\\/cardconnect","extension\\/payment\\/cardinity","extension\\/payment\\/cheque","extension\\/payment\\/cod","extension\\/payment\\/divido","extension\\/payment\\/eway","extension\\/payment\\/firstdata","extension\\/payment\\/firstdata_remote","extension\\/payment\\/free_checkout","extension\\/payment\\/g2apay","extension\\/payment\\/globalpay","extension\\/payment\\/globalpay_remote","extension\\/payment\\/klarna_account","extension\\/payment\\/klarna_checkout","extension\\/payment\\/klarna_invoice","extension\\/payment\\/laybuy","extension\\/payment\\/liqpay","extension\\/payment\\/nochex","extension\\/payment\\/paymate","extension\\/payment\\/paypoint","extension\\/payment\\/payza","extension\\/payment\\/perpetual_payments","extension\\/payment\\/pilibaba","extension\\/payment\\/pp_express","extension\\/payment\\/pp_payflow","extension\\/payment\\/pp_payflow_iframe","extension\\/payment\\/pp_pro","extension\\/payment\\/pp_pro_iframe","extension\\/payment\\/pp_standard","extension\\/payment\\/realex","extension\\/payment\\/realex_remote","extension\\/payment\\/sagepay_direct","extension\\/payment\\/sagepay_server","extension\\/payment\\/sagepay_us","extension\\/payment\\/securetrading_pp","extension\\/payment\\/securetrading_ws","extension\\/payment\\/skrill","extension\\/payment\\/twocheckout","extension\\/payment\\/web_payment_software","extension\\/payment\\/worldpay","extension\\/shipping\\/auspost","extension\\/shipping\\/citylink","extension\\/shipping\\/fedex","extension\\/shipping\\/flat","extension\\/shipping\\/free","extension\\/shipping\\/item","extension\\/shipping\\/parcelforce_48","extension\\/shipping\\/pickup","extension\\/shipping\\/royal_mail","extension\\/shipping\\/ups","extension\\/shipping\\/usps","extension\\/shipping\\/weight","extension\\/sms\\/chuanglan","extension\\/store","extension\\/theme\\/theme_default","extension\\/total\\/coupon","extension\\/total\\/credit","extension\\/total\\/handling","extension\\/total\\/klarna_fee","extension\\/total\\/low_order_fee","extension\\/total\\/reward","extension\\/total\\/shipping","extension\\/total\\/sub_total","extension\\/total\\/tax","extension\\/total\\/total","extension\\/total\\/voucher","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/customer_search","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","startup\\/compatibility","startup\\/error","startup\\/event","startup\\/login","startup\\/permission","startup\\/router","startup\\/sass","startup\\/startup","tool\\/backup","tool\\/excelexportimport","tool\\/log","tool\\/upload","user\\/api","user\\/user","user\\/user_permission","extension\\/payment\\/alipay_direct","extension\\/shipping\\/free","extension\\/payment\\/alipay_wap","extension\\/payment\\/wxpay","extension\\/module\\/weibo_login","extension\\/payment\\/qrcode_wxpay","extension\\/module\\/wx_login","extension\\/module\\/qq_login","extension\\/shipping\\/weight","extension\\/module\\/weixin_login","extension\\/payment\\/alipay_transfer","extension\\/payment\\/alipay_transfer","extension\\/payment\\/precharge","extension\\/sms\\/chuanglan","extension\\/module\\/revslideropencart","extension\\/module\\/rgen","extension\\/module\\/rgen","extension\\/module\\/rgen\\/render","extension\\/module\\/rgen\\/rest","extension\\/module\\/bestseller","extension\\/module\\/latest","extension\\/module\\/weixin_login","extension\\/module\\/information","extension\\/module\\/qq_login","extension\\/module\\/filter"]}'),
(10, '演示群组', '{"access":["baidu\\/pushurl","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","catalog\\/url_alias","cms\\/blog","cms\\/blog_category","cms\\/blog_comment","cms\\/blog_config","cms\\/faq","cms\\/faq_category","cms\\/faq_config","cms\\/press","cms\\/press_category","cms\\/press_config","common\\/column_left","common\\/filemanager","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/language","design\\/layout","design\\/menu","design\\/theme","design\\/translation","event\\/compatibility","event\\/theme","extension\\/analytics\\/baidu_analytics","extension\\/analytics\\/google_analytics","extension\\/captcha\\/basic_captcha","extension\\/captcha\\/google_captcha","extension\\/dashboard\\/activity","extension\\/dashboard\\/chart","extension\\/dashboard\\/customer","extension\\/dashboard\\/map","extension\\/dashboard\\/online","extension\\/dashboard\\/order","extension\\/dashboard\\/recent","extension\\/dashboard\\/sale","extension\\/event","extension\\/extension","extension\\/extension\\/analytics","extension\\/extension\\/captcha","extension\\/extension\\/dashboard","extension\\/extension\\/feed","extension\\/extension\\/fraud","extension\\/extension\\/module","extension\\/extension\\/payment","extension\\/extension\\/shipping","extension\\/extension\\/theme","extension\\/extension\\/total","extension\\/feed\\/google_base","extension\\/feed\\/google_sitemap","extension\\/feed\\/openbaypro","extension\\/fraud\\/fraudlabspro","extension\\/fraud\\/ip","extension\\/fraud\\/maxmind","extension\\/installer","extension\\/modification","extension\\/module\\/account","extension\\/module\\/affiliate","extension\\/module\\/amazon_login","extension\\/module\\/amazon_pay","extension\\/module\\/banner","extension\\/module\\/bestseller","extension\\/module\\/blog_category","extension\\/module\\/blog_comment","extension\\/module\\/blog_latest","extension\\/module\\/blog_popular","extension\\/module\\/blog_search","extension\\/module\\/carousel","extension\\/module\\/category","extension\\/module\\/divido_calculator","extension\\/module\\/ebay_listing","extension\\/module\\/faq_category","extension\\/module\\/featured","extension\\/module\\/filter","extension\\/module\\/google_hangouts","extension\\/module\\/html","extension\\/module\\/information","extension\\/module\\/klarna_checkout_module","extension\\/module\\/latest","extension\\/module\\/laybuy_layout","extension\\/module\\/pilibaba_button","extension\\/module\\/pp_button","extension\\/module\\/pp_login","extension\\/module\\/press_category","extension\\/module\\/press_latest","extension\\/module\\/sagepay_direct_cards","extension\\/module\\/sagepay_server_cards","extension\\/module\\/slideshow","extension\\/module\\/special","extension\\/module\\/store","extension\\/openbay","extension\\/openbay\\/amazon","extension\\/openbay\\/amazon_listing","extension\\/openbay\\/amazon_product","extension\\/openbay\\/amazonus","extension\\/openbay\\/amazonus_listing","extension\\/openbay\\/amazonus_product","extension\\/openbay\\/ebay","extension\\/openbay\\/ebay_profile","extension\\/openbay\\/ebay_template","extension\\/openbay\\/etsy","extension\\/openbay\\/etsy_product","extension\\/openbay\\/etsy_shipping","extension\\/openbay\\/etsy_shop","extension\\/openbay\\/fba","extension\\/shipping\\/auspost","extension\\/shipping\\/citylink","extension\\/shipping\\/fedex","extension\\/shipping\\/flat","extension\\/shipping\\/free","extension\\/shipping\\/item","extension\\/shipping\\/parcelforce_48","extension\\/shipping\\/pickup","extension\\/shipping\\/royal_mail","extension\\/shipping\\/ups","extension\\/shipping\\/usps","extension\\/shipping\\/weight","extension\\/store","extension\\/theme\\/theme_default","extension\\/total\\/coupon","extension\\/total\\/credit","extension\\/total\\/handling","extension\\/total\\/klarna_fee","extension\\/total\\/low_order_fee","extension\\/total\\/reward","extension\\/total\\/shipping","extension\\/total\\/sub_total","extension\\/total\\/tax","extension\\/total\\/total","extension\\/total\\/voucher","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/customer_search","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","startup\\/compatibility","startup\\/error","startup\\/event","startup\\/login","startup\\/permission","startup\\/router","startup\\/sass","startup\\/startup","tool\\/backup","tool\\/excelexportimport","tool\\/log","tool\\/upload","user\\/api"]}');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_voucher`
--

CREATE TABLE IF NOT EXISTS `mcc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `mcc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `mcc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `mcc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `mcc_voucher_theme`
--

INSERT INTO `mcc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `mcc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_voucher_theme_description`
--

INSERT INTO `mcc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(7, 1, '生日'),
(8, 1, '通用'),
(6, 1, '春节');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_weight_class`
--

CREATE TABLE IF NOT EXISTS `mcc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `mcc_weight_class`
--

INSERT INTO `mcc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `mcc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mcc_weight_class_description`
--

INSERT INTO `mcc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, '公斤', 'kg'),
(2, 1, '克', 'g'),
(5, 1, '磅', 'lb'),
(6, 1, '盎司', 'oz');

-- --------------------------------------------------------

--
-- 表的结构 `mcc_zone`
--

CREATE TABLE IF NOT EXISTS `mcc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4227 ;

--
-- 转存表中的数据 `mcc_zone`
--

INSERT INTO `mcc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, '安徽省', 'AN', 1),
(685, 44, '北京市', 'BE', 1),
(686, 44, '重庆', 'CH', 1),
(687, 44, '福建省', 'FU', 1),
(688, 44, '甘肃省', 'GA', 1),
(689, 44, '广东省', 'GU', 1),
(690, 44, '广西壮族自治区', 'GX', 1),
(691, 44, '贵州省', 'GZ', 1),
(692, 44, '海南省', 'HA', 1),
(693, 44, '河北省', 'HB', 1),
(694, 44, '黑龙江省', 'HL', 1),
(695, 44, '河南省', 'HE', 1),
(696, 44, '香港特别行政区', 'HK', 1),
(697, 44, '湖北省', 'HU', 1),
(698, 44, '湖南省', 'HN', 1),
(699, 44, '内蒙古自治区', 'IM', 1),
(700, 44, '江苏省', 'JI', 1),
(701, 44, '江西省', 'JX', 1),
(702, 44, '吉林省', 'JL', 1),
(703, 44, '辽宁省', 'LI', 1),
(704, 44, '澳门特别行政区', 'MA', 1),
(705, 44, '宁夏回族自治区', 'NI', 1),
(706, 44, '陕西省', 'SH', 1),
(707, 44, '山东省', 'SA', 1),
(708, 44, '上海市', 'SG', 1),
(709, 44, '山西省', 'SX', 1),
(710, 44, '四川省', 'SI', 1),
(711, 44, '天津市', 'TI', 1),
(712, 44, '新疆维吾尔自治区', 'XI', 1),
(713, 44, '云南省', 'YU', 1),
(714, 44, '浙江省', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1);
INSERT INTO `mcc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1);
INSERT INTO `mcc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas''ka Oblast''', '71', 1),
(3481, 220, 'Chernihivs''ka Oblast''', '74', 1),
(3482, 220, 'Chernivets''ka Oblast''', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs''ka Oblast''', '12', 1),
(3485, 220, 'Donets''ka Oblast''', '14', 1),
(3486, 220, 'Ivano-Frankivs''ka Oblast''', '26', 1),
(3487, 220, 'Khersons''ka Oblast''', '65', 1),
(3488, 220, 'Khmel''nyts''ka Oblast''', '68', 1),
(3489, 220, 'Kirovohrads''ka Oblast''', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs''ka Oblast''', '32', 1),
(3492, 220, 'Luhans''ka Oblast''', '09', 1),
(3493, 220, 'L''vivs''ka Oblast''', '46', 1),
(3494, 220, 'Mykolayivs''ka Oblast''', '48', 1),
(3495, 220, 'Odes''ka Oblast''', '51', 1),
(3496, 220, 'Poltavs''ka Oblast''', '53', 1),
(3497, 220, 'Rivnens''ka Oblast''', '56', 1),
(3498, 220, 'Sevastopol''', '40', 1),
(3499, 220, 'Sums''ka Oblast''', '59', 1),
(3500, 220, 'Ternopil''s''ka Oblast''', '61', 1),
(3501, 220, 'Vinnyts''ka Oblast''', '05', 1),
(3502, 220, 'Volyns''ka Oblast''', '07', 1),
(3503, 220, 'Zakarpats''ka Oblast''', '21', 1),
(3504, 220, 'Zaporiz''ka Oblast''', '23', 1),
(3505, 220, 'Zhytomyrs''ka oblast''', '18', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs''ka Oblast''', '63', 1),
(4225, 44, '西藏自治区', 'TB', 1),
(4226, 44, '台湾省', 'TW', 1);

-- --------------------------------------------------------

--
-- 表的结构 `mcc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `mcc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=142 ;

--
-- 转存表中的数据 `mcc_zone_to_geo_zone`
--

INSERT INTO `mcc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(110, 44, 712, 4, '2015-04-01 22:11:53', '0000-00-00 00:00:00'),
(141, 44, 4226, 5, '2015-04-01 22:24:09', '0000-00-00 00:00:00'),
(140, 44, 696, 5, '2015-04-01 22:24:09', '0000-00-00 00:00:00'),
(139, 44, 704, 5, '2015-04-01 22:24:09', '0000-00-00 00:00:00'),
(138, 44, 694, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(137, 44, 706, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(136, 44, 686, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(135, 44, 703, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(134, 44, 691, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(133, 44, 687, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(132, 44, 688, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(131, 44, 698, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(130, 44, 697, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(129, 44, 692, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(128, 44, 714, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(127, 44, 695, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(126, 44, 693, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(125, 44, 701, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(124, 44, 700, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(123, 44, 690, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(122, 44, 689, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(121, 44, 709, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(120, 44, 707, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(119, 44, 684, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(118, 44, 711, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(117, 44, 710, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(116, 44, 702, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(115, 44, 685, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(114, 44, 713, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(113, 44, 708, 3, '2015-04-01 22:23:18', '0000-00-00 00:00:00'),
(111, 44, 4225, 4, '2015-04-01 22:11:53', '0000-00-00 00:00:00'),
(112, 44, 705, 4, '2015-04-01 22:11:53', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
