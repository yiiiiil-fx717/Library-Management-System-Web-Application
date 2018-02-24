-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 06 月 19 日 17:43
-- 服务器版本: 5.0.51
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `db_librarySys`
--

-- --------------------------------------------------------

--
-- 表的结构 `tb_bookcase`
--

CREATE TABLE IF NOT EXISTS `tb_bookcase` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `Column_3` char(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `tb_bookcase`
--

INSERT INTO `tb_bookcase` (`id`, `name`, `Column_3`) VALUES
(3, '书架1', NULL),
(4, '书架2', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tb_bookinfo`
--

CREATE TABLE IF NOT EXISTS `tb_bookinfo` (
  `barcode` varchar(30) default NULL,
  `bookname` varchar(70) default NULL,
  `typeid` int(10) unsigned default NULL,
  `author` varchar(30) default NULL,
  `translator` varchar(30) default NULL,
  `ISBN` varchar(20) default NULL,
  `price` float(8,2) default NULL,
  `page` int(10) unsigned default NULL,
  `bookcase` int(10) unsigned default NULL,
  `inTime` date default NULL,
  `operator` varchar(30) default NULL,
  `del` tinyint(1) default '0',
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- 导出表中的数据 `tb_bookinfo`
--

INSERT INTO `tb_bookinfo` (`barcode`, `bookname`, `typeid`, `author`, `translator`, `ISBN`, `price`, `page`, `bookcase`, `inTime`, `operator`, `del`, `id`) VALUES
('9787302047230', 'Java 2 实用教程', 1, 'shuanyulin', 'ceshi', '978-7', 39.00, 440, 4, '2007-11-22', 'tsoft', 0, 1),
('jk', 'kjkj', 1, '***', '', '7-302', 12.00, 0, 1, '2007-11-22', 'tsoft', 1, 2),
('9787115157690', 'JSP程序开发范例', 1, '***', '', '978-7', 89.00, 816, 3, '2007-11-23', 'tsoft', 0, 3),
('123', '事实', 1, '11', '11', '7-302', 11.00, 11, 1, '2007-12-18', 'tsoft', 1, 5),
('9787302047492', 'DHTML动态网页制作', 3, 'shuangyulin', 'ceshi', '7-302', 45.00, 221, 4, '2009-04-25', 'admin', 0, 7);

-- --------------------------------------------------------

--
-- 表的结构 `tb_booktype`
--

CREATE TABLE IF NOT EXISTS `tb_booktype` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `typename` varchar(30) default NULL,
  `days` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `tb_booktype`
--

INSERT INTO `tb_booktype` (`id`, `typename`, `days`) VALUES
(1, '网络编程', 30),
(3, '网页设置', 5);

-- --------------------------------------------------------

--
-- 表的结构 `tb_borrow`
--

CREATE TABLE IF NOT EXISTS `tb_borrow` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `readerid` int(10) unsigned default NULL,
  `bookid` int(10) default NULL,
  `borrowTime` date default NULL,
  `backTime` date default NULL,
  `operator` varchar(30) default NULL,
  `ifback` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- 导出表中的数据 `tb_borrow`
--

INSERT INTO `tb_borrow` (`id`, `readerid`, `bookid`, `borrowTime`, `backTime`, `operator`, `ifback`) VALUES
(1, 1, 1, '2007-11-22', '2007-12-22', 'tsoft', 1),
(2, 1, 3, '2007-11-26', '2007-12-26', 'tsoft', 0),
(3, 1, 1, '2007-11-26', '2007-12-26', 'tsoft', 0),
(4, 3, 6, '2007-12-29', '2007-01-08', 'Tsoft', 0),
(5, 3, 1, '2007-12-29', '2008-01-28', 'Tsoft', 0),
(6, 3, 3, '2007-12-29', '2008-01-28', 'Tsoft', 1),
(7, 4, 7, '2009-04-25', '2009-04-30', 'admin', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tb_giveback`
--

CREATE TABLE IF NOT EXISTS `tb_giveback` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `readerid` int(11) default NULL,
  `bookid` int(11) default NULL,
  `backTime` date default NULL,
  `operator` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `tb_giveback`
--

INSERT INTO `tb_giveback` (`id`, `readerid`, `bookid`, `backTime`, `operator`) VALUES
(1, 1, 1, '2007-11-22', 'tsoft'),
(2, 3, 3, '2007-01-03', 'Tsoft');

-- --------------------------------------------------------

--
-- 表的结构 `tb_library`
--

CREATE TABLE IF NOT EXISTS `tb_library` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `libraryname` varchar(50) default NULL,
  `curator` varchar(10) default NULL,
  `tel` varchar(20) default NULL,
  `address` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `url` varchar(100) default NULL,
  `createDate` date default NULL,
  `introduce` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `tb_library`
--

INSERT INTO `tb_library` (`id`, `libraryname`, `curator`, `tel`, `address`, `email`, `url`, `createDate`, `introduce`) VALUES
(1, '智慧图书馆', '汪建林', '13544455555', '四川成都', 'wangjianlin1985@126.com', 'http://shop00000000.taobao.com', '1999-05-06', '本市高级图书馆');

-- --------------------------------------------------------

--
-- 表的结构 `tb_manager`
--

CREATE TABLE IF NOT EXISTS `tb_manager` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `PWD` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `tb_manager`
--

INSERT INTO `tb_manager` (`id`, `name`, `PWD`) VALUES
(4, 'tsoft', '111'),
(3, 'admin', 'admin'),
(5, 'wangjianlin', '198517');

-- --------------------------------------------------------

--
-- 表的结构 `tb_parameter`
--

CREATE TABLE IF NOT EXISTS `tb_parameter` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cost` int(10) unsigned default NULL,
  `validity` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `tb_parameter`
--

INSERT INTO `tb_parameter` (`id`, `cost`, `validity`) VALUES
(1, 40, 3);

-- --------------------------------------------------------

--
-- 表的结构 `tb_publishing`
--

CREATE TABLE IF NOT EXISTS `tb_publishing` (
  `ISBN` varchar(20) default NULL,
  `pubname` varchar(30) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 导出表中的数据 `tb_publishing`
--

INSERT INTO `tb_publishing` (`ISBN`, `pubname`) VALUES
('7-302', '清华大学出版社'),
('978-7', '人民邮电出版社');

-- --------------------------------------------------------

--
-- 表的结构 `tb_purview`
--

CREATE TABLE IF NOT EXISTS `tb_purview` (
  `id` int(11) NOT NULL,
  `sysset` tinyint(1) default '0',
  `readerset` tinyint(1) default '0',
  `bookset` tinyint(1) default '0',
  `borrowback` tinyint(1) default '0',
  `sysquery` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 导出表中的数据 `tb_purview`
--

INSERT INTO `tb_purview` (`id`, `sysset`, `readerset`, `bookset`, `borrowback`, `sysquery`) VALUES
(4, 1, 1, 1, 1, 1),
(3, 1, 1, 1, 1, 1),
(5, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tb_reader`
--

CREATE TABLE IF NOT EXISTS `tb_reader` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `sex` varchar(4) default NULL,
  `barcode` varchar(30) default NULL,
  `vocation` varchar(50) default NULL,
  `birthday` date default NULL,
  `paperType` varchar(10) default NULL,
  `paperNO` varchar(20) default NULL,
  `tel` varchar(20) default NULL,
  `email` varchar(100) default NULL,
  `createDate` date default NULL,
  `operator` varchar(30) default NULL,
  `remark` text,
  `typeid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `tb_reader`
--

INSERT INTO `tb_reader` (`id`, `name`, `sex`, `barcode`, `vocation`, `birthday`, `paperType`, `paperNO`, `tel`, `email`, `createDate`, `operator`, `remark`, `typeid`) VALUES
(1, 'wgh', '女', '2008010100001', '学生', '1980-07-17', '身份证', '2201041980********', '13558690869', 'wgh717@****.com', '2007-11-22', 'tsoft', '无', 1),
(2, '辅导', '男', '123123123', '程序员', '1983-02-22', '身份证', '220', '', '', '2007-12-29', 'tsoft', '', 2),
(4, '汪建林', '男', '200305030317', '学生', '1985-01-07', '身份证', '513030198501077418', '13558690869', 'wangjianlin1985@126.com', '2009-04-25', 'admin', '备注测试', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tb_readertype`
--

CREATE TABLE IF NOT EXISTS `tb_readertype` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `number` int(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `tb_readertype`
--

INSERT INTO `tb_readertype` (`id`, `name`, `number`) VALUES
(1, '学生', 2),
(2, '程序员', 1),
(3, '教师', 3);
