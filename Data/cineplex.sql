-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 05 月 20 日 15:06
-- 服务器版本: 5.5.40
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `cineplex`
--

-- --------------------------------------------------------

--
-- 表的结构 `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `answer` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `answer`
--

INSERT INTO `answer` (`id`, `question_id`, `member_id`, `answer`) VALUES
(0, 0, 0, 'a1'),
(1, 1, 0, 'a1'),
(2, 0, 1, 'a1'),
(3, 2, 1, 'a2'),
(4, 0, 2, 'a2'),
(5, 2, 2, 'a3'),
(6, 2, 0, 'a1'),
(7, 0, 3, 'a1'),
(8, 0, 164, 'a1');

-- --------------------------------------------------------

--
-- 表的结构 `bankcard`
--

CREATE TABLE IF NOT EXISTS `bankcard` (
  `id` int(11) NOT NULL,
  `number` int(30) NOT NULL,
  `password` varchar(11) CHARACTER SET utf8 NOT NULL,
  `balance` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `bankcard`
--

INSERT INTO `bankcard` (`id`, `number`, `password`, `balance`) VALUES
(0, 21212121, 'seni', 18000),
(1, 12121212, 'seni', 11700);

-- --------------------------------------------------------

--
-- 表的结构 `consumption`
--

CREATE TABLE IF NOT EXISTS `consumption` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `seat` int(11) NOT NULL,
  `way` text CHARACTER SET utf8 NOT NULL,
  `movie_name` text CHARACTER SET utf8 NOT NULL,
  `movie_time` text CHARACTER SET utf8 NOT NULL,
  `movie_hall` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `consumption`
--

INSERT INTO `consumption` (`id`, `member_id`, `movie_id`, `seat`, `way`, `movie_name`, `movie_time`, `movie_hall`) VALUES
(0, 0, 0, 1, 'Card', 'Hobbit', '2015-04-05 14:00-16:00', 3),
(1, 0, 1, 1, 'Card', 'Interstellar ', '2015-04-11 08:00-10:00', 1),
(2, 3, 10, 1, 'Cash', 'Lucy', '2015-04-05 14:00-16:00', 3),
(3, 4, 11, 1, 'Card', 'Unbroken', '2015-04-05 14:00-16:00', 2),
(4, 5, 12, 1, 'Card', 'Interstellar ', '2015-04-07 14:00-16:00', 1),
(5, 6, 13, 1, 'Cash', 'Hobbit', '2015-04-08 14:00-16:00', 1),
(6, 7, 14, 1, 'Card', 'Interstellar ', '2015-04-09 14:00-16:00', 1),
(7, 8, 15, 1, 'Cash', 'Lucy', '2015-04-10 14:00-16:00', 2),
(8, 9, 16, 1, 'Card', 'Unbroken', '2015-04-12 14:00-16:00', 3),
(9, 10, 17, 1, 'Cash', 'Hobbit', '2015-04-12 14:00-16:00', 2),
(10, 11, 18, 1, 'Card', 'Interstellar ', '2015-04-13 14:00-16:00', 1),
(11, 12, 19, 1, 'Card', 'Unbroken', '2015-04-14 14:00-16:00', 2),
(12, 13, 20, 1, 'Cash', 'Hobbit', '2015-04-15 14:00-16:00', 3),
(13, 14, 21, 1, 'Card', 'Interstellar ', '2015-04-16 14:00-16:00', 1),
(14, 15, 22, 1, 'Cash', 'Lucy', '2015-04-17 14:00-16:00', 2),
(15, 16, 23, 1, 'Card', 'Interstellar ', '2015-04-18 14:00-16:00', 1),
(16, 17, 24, 1, 'Cash', 'Hobbit', '2015-04-19 14:00-16:00', 1),
(17, 18, 25, 1, 'Card', 'Lucy', '2015-04-20 14:00-16:00', 1),
(18, 19, 26, 1, 'Card', 'Interstellar ', '2015-04-21 14:00-16:00', 2),
(19, 20, 27, 1, 'Cash', 'Lucy', '2015-04-22 14:00-16:00', 1),
(20, 21, 28, 1, 'Card', 'Interstellar ', '2015-04-20 14:00-16:00', 2),
(21, 22, 29, 1, 'Card', 'Unbroken', '2015-04-24 14:00-16:00', 3),
(22, 23, 30, 1, 'Cash', 'Hobbit', '2015-04-25 14:00-16:00', 1),
(23, 24, 31, 1, 'Card', 'Unbroken', '2015-04-26 14:00-16:00', 2),
(24, 25, 32, 1, 'Card', 'Interstellar ', '2015-04-27 14:00-16:00', 1),
(25, 26, 33, 1, 'Cash', 'Unbroken', '2015-04-28 14:00-16:00', 2),
(26, 27, 34, 1, 'Card', 'Lucy', '2015-05-01 14:00-16:00', 1),
(27, 28, 35, 1, 'Card', 'Interstellar ', '2015-05-02 14:00-16:00', 3),
(28, 29, 36, 1, 'Cash', 'Hobbit', '2015-04-14 14:00-16:00', 1),
(29, 30, 37, 1, 'Card', 'Lucy', '2015-04-04 14:00-16:00', 2),
(30, 31, 38, 1, 'Card', 'Lucy', '2015-05-05 2:00pm-4:00pm', 1),
(31, 32, 39, 1, 'Cash', 'Interstellar ', '2015-05-06 2:00pm-4:00pm', 1),
(32, 33, 40, 1, 'Card', 'Hobbit', '2015-05-07 2:00pm-4:00pm', 3),
(33, 34, 41, 1, 'Card', 'Lucy', '2015-05-08 2:00pm-4:00pm', 2),
(34, 35, 42, 1, 'Cash', 'Interstellar ', '2015-05-09 2:00pm-4:00pm', 2),
(35, 36, 43, 1, 'Card', 'Unbroken', '2014-01-10 2:00pm-4:00pm', 1),
(36, 37, 44, 1, 'Card', 'Hobbit', '2015-04-11 2:00pm-4:00pm', 1),
(37, 38, 45, 1, 'Cash', 'Hobbit', '2015-05-12 2:00pm-4:00pm', 2),
(38, 39, 46, 1, 'Card', 'Interstellar ', '2015-05-13 2:00pm-4:00pm', 3),
(39, 40, 47, 1, 'Card', 'Lucy', '2015-05-14 2:00pm-4:00pm', 2),
(40, 41, 48, 1, 'Cash', 'Hobbit', '2015-05-15 2:00pm-4:00pm', 1),
(41, 42, 49, 1, 'Card', 'Unbroken', '2015-05-16 2:00pm-4:00pm', 1),
(42, 43, 50, 1, 'Card', 'Interstellar ', '2015-05-17 2:00pm-4:00pm', 2),
(43, 44, 51, 1, 'Cash', 'Unbroken', '2015-05-25 2:00pm-4:00pm', 1),
(44, 45, 52, 1, 'Card', 'Hobbit', '2015-05-19 2:00pm-4:00pm', 1),
(45, 46, 53, 1, 'Card', 'Interstellar ', '2015-05-20 2:00pm-4:00pm', 3),
(46, 47, 54, 1, 'Cash', 'Lucy', '2015-05-21 2:00pm-4:00pm', 1),
(47, 48, 55, 1, 'Card', 'Hobbit', '2015-05-22 2:00pm-4:00pm', 1),
(48, 49, 56, 1, 'Card', 'Interstellar ', '2015-04-07 2:00pm-4:00pm', 3),
(49, 50, 57, 1, 'Cash', 'Hobbit', '2015-05-24 2:00pm-4:00pm', 2),
(50, 51, 58, 1, 'Card', 'Hobbit', '2015-04-13 2:00pm-4:00pm', 1),
(51, 52, 59, 1, 'Card', 'Interstellar ', '2015-05-26 2:00pm-4:00pm', 3),
(52, 53, 60, 1, 'Cash', 'Lucy', '2015-05-27 2:00pm-4:00pm', 2),
(53, 54, 61, 1, 'Card', 'Interstellar ', '2015-05-28 2:00pm-4:00pm', 1),
(54, 55, 62, 1, 'Card', 'Unbroken', '2015-05-29 2:00pm-4:00pm', 1),
(55, 56, 63, 1, 'Cash', 'Hobbit', '2015-05-30 2:00pm-4:00pm', 2),
(56, 64, 0, 1, 'Card', 'Interstellar ', '2015-05-31 2:00pm-4:00pm', 2),
(57, 65, 0, 1, 'Card', 'Lucy', '2015-04-08 2:00pm-4:00pm', 1),
(58, 66, 0, 1, 'Cash', 'Interstellar ', '2015-04-02 2:00pm-4:00pm', 1),
(59, 67, 0, 1, 'Card', 'Hobbit', '2015-04-04 2:00pm-4:00pm', 2),
(60, 61, 68, 1, 'Card', 'Unbroken', '2015-04-10 2:00pm-4:00pm', 1),
(61, 62, 69, 1, 'Cash', 'Lucy', '2015-04-14 2:00pm-4:00pm', 2),
(62, 63, 70, 1, 'Card', 'Interstellar ', '2014-04-14 2:00pm-4:00pm', 3),
(63, 64, 71, 1, 'Card', 'Lucy', '2015-04-14 2:00pm-4:00pm', 1),
(64, 65, 72, 1, 'Cash', 'Hobbit', '2015-04-15 2:00pm-4:00pm', 2),
(65, 66, 73, 1, 'Card', 'Interstellar ', '2015-04-18 2:00pm-4:00pm', 1),
(66, 67, 74, 1, 'Card', 'Lucy', '2015-04-16 2:00pm-4:00pm', 3),
(67, 68, 75, 1, 'Cash', 'Unbroken', '2014-06-17 2:00pm-4:00pm', 3),
(68, 69, 76, 1, 'Card', 'Unbroken', '2015-04-15 2:00pm-4:00pm', 1),
(69, 70, 77, 1, 'Cash', 'Interstellar ', '2014-01-01 2:00pm-4:00pm', 3),
(70, 71, 78, 1, 'Cash', 'Hobbit', '2014-05-02 2:00pm-4:00pm', 2),
(71, 72, 79, 1, 'Card', 'Hobbit', '2014-05-03 2:00pm-4:00pm', 1),
(72, 73, 80, 1, 'Cash', 'Lucy', '2014-01-04 2:00pm-4:00pm', 2),
(73, 74, 81, 1, 'Cash', 'Interstellar ', '2014-08-02 2:00pm-4:00pm', 2),
(74, 75, 82, 1, 'Card', 'Hobbit', '2014-02-06 2:00pm-4:00pm', 1),
(75, 76, 83, 1, 'Card', 'Unbroken', '2014-05-14 2:00pm-4:00pm', 2),
(76, 77, 84, 1, 'Cash', 'Lucy', '2014-02-14 2:00pm-4:00pm', 1),
(77, 78, 85, 1, 'Card', 'Interstellar ', '2014-02-14 2:00pm-4:00pm', 1),
(78, 79, 86, 1, 'Cash', 'Hobbit', '2014-02-18 2:00pm-4:00pm', 2),
(79, 80, 87, 1, 'Card', 'Lucy', '2014-03-08 2:00pm-4:00pm', 1),
(80, 81, 88, 1, 'Card', 'Hobbit', '2014-03-07 2:00pm-4:00pm', 3),
(81, 82, 89, 1, 'Cash', 'Unbroken', '2014-04-04 2:00pm-4:00pm', 2),
(82, 83, 90, 1, 'Card', 'Unbroken', '2014-05-05 2:00pm-4:00pm', 3),
(83, 84, 91, 1, 'Cash', 'Interstellar ', '2014-04-17 2:00pm-4:00pm', 1),
(84, 85, 92, 1, 'Card', 'Unbroken', '2014-06-01 2:00pm-4:00pm', 1),
(85, 86, 93, 1, 'Card', 'Unbroken', '2014-06-01 2:00pm-4:00pm', 2),
(86, 87, 94, 1, 'Cash', 'Hobbit', '2014-07-01 2:00pm-4:00pm', 1),
(87, 88, 95, 1, 'Card', 'Interstellar ', '2014-07-03 2:00pm-4:00pm', 2),
(88, 89, 96, 1, 'Card', 'Lucy', '2014-07-05 2:00pm-4:00pm', 3),
(89, 90, 97, 1, 'Cash', 'Hobbit', '2014-05-01 2:00pm-4:00pm', 1),
(90, 91, 98, 1, 'Card', 'Unbroken', '2014-08-01 2:00pm-4:00pm', 1),
(91, 92, 99, 1, 'Card', 'Hobbit', '2014-08-05 2:00pm-4:00pm', 3),
(92, 93, 100, 1, 'Cash', 'Lucy', '2014-08-12 2:00pm-4:00pm', 2),
(93, 94, 101, 1, 'Card', 'Interstellar ', '2014-08-18 2:00pm-4:00pm', 1),
(94, 95, 102, 1, 'Card', 'Hobbit', '2014-09-02 2:00pm-4:00pm', 2),
(95, 96, 103, 1, 'Card', 'Unbroken', '2014-10-01 2:00pm-4:00pm', 2),
(96, 97, 104, 1, 'Cash', 'Interstellar ', '2014-10-05 2:00pm-4:00pm', 3),
(97, 98, 105, 1, 'Card', 'Lucy', '2014-10-03 2:00pm-4:00pm', 1),
(98, 99, 106, 1, 'Card', 'Hobbit', '2014-11-02 2:00pm-4:00pm', 2),
(99, 100, 107, 1, 'Cash', 'Interstellar ', '2014-11-05 2:00pm-4:00pm', 3),
(100, 101, 108, 1, 'Card', 'Unbroken', '2014-10-26 2:00pm-4:00pm', 3),
(101, 102, 109, 1, 'Card', 'Hobbit', '2014-11-25 2:00pm-4:00pm', 2),
(102, 103, 110, 1, 'Cash', 'Interstellar ', '2014-09-01 2:00pm-4:00pm', 1),
(103, 104, 111, 1, 'Card', 'Unbroken', '2014-12-25 2:00pm-4:00pm', 2),
(104, 105, 112, 1, 'Card', 'Hobbit', '2015-04-18 2:00pm-4:00pm', 1),
(105, 106, 113, 1, 'Cash', 'Lucy', '2015-04-19 2:00pm-4:00pm', 1),
(106, 107, 114, 1, 'Card', 'Interstellar ', '2015-04-11 2:00pm-4:00pm', 2),
(107, 108, 115, 1, 'Card', 'Unbroken', '2015-04-14 2:00pm-4:00pm', 1),
(108, 109, 116, 1, 'Cash', 'Lucy', '2015-04-14 2:00pm-4:00pm', 1),
(109, 110, 117, 1, 'Card', 'Hobbit', '2014-11-22 2:00pm-4:00pm', 1),
(110, 111, 118, 1, 'Card', 'Interstellar ', '2015-04-22 2:00pm-4:00pm', 1),
(111, 112, 119, 1, 'Cash', 'Lucy', '2014-12-16 2:00pm-4:00pm', 3),
(112, 113, 120, 1, 'Card', 'Unbroken', '2015-04-26 2:00pm-4:00pm', 2),
(113, 114, 121, 1, 'Card', 'Interstellar ', '2015-05-12 2:00pm-4:00pm', 1),
(114, 115, 122, 1, 'Cash', 'Lucy', '2015-05-11 2:00pm-4:00pm', 3),
(115, 116, 123, 1, 'Card', 'Hobbit', '2015-05-11 2:00pm-4:00pm', 2),
(116, 117, 124, 1, 'Cash', 'Unbroken', '2014-12-27 2:00pm-4:00pm', 1),
(117, 118, 125, 1, 'Card', 'Interstellar ', '2015-05-21 2:00pm-4:00pm', 3),
(118, 119, 126, 1, 'Cash', 'Hobbit', '2015-05-16 2:00pm-4:00pm', 2),
(119, 120, 127, 1, 'Card', 'Lucy', '2015-05-02 2:00pm-4:00pm', 1),
(120, 121, 128, 1, 'Card', 'Hobbit', '2015-04-13 2:00pm-4:00pm', 1),
(121, 122, 129, 1, 'Card', 'Lucy', '2015-04-05 2:00pm-4:00pm', 3),
(122, 123, 130, 1, 'Cash', 'Hobbit', '2015-04-11 2:00pm-4:00pm', 1),
(123, 124, 131, 1, 'Card', 'Interstellar ', '2015-04-08 2:00pm-4:00pm', 2),
(124, 125, 132, 1, 'Card', 'Unbroken', '2015-04-06 2:00pm-4:00pm', 1),
(125, 126, 133, 1, 'Cash', 'Lucy', '2015-04-28 2:00pm-4:00pm', 2),
(126, 127, 134, 1, 'Card', 'Hobbit', '2015-05-01 2:00pm-4:00pm', 1),
(127, 128, 135, 1, 'Card', 'Interstellar ', '2015-05-01 2:00pm-4:00pm', 3),
(128, 129, 136, 1, 'Card', 'Lucy', '2015-05-01 2:00pm-4:00pm', 2),
(129, 130, 137, 1, 'Cash', 'Hobbit', '2015-05-15 2:00pm-4:00pm', 2),
(130, 131, 138, 1, 'Card', 'Unbroken', '2015-04-19 2:00pm-4:00pm', 3),
(131, 132, 139, 1, 'Cash', 'Interstellar ', '2015-04-22 2:00pm-4:00pm', 1),
(132, 133, 140, 1, 'Card', 'Hobbit', '2015-04-28 2:00pm-4:00pm', 1),
(133, 134, 141, 1, 'Cash', 'Lucy', '2015-04-28 2:00pm-4:00pm', 2),
(134, 135, 142, 1, 'Card', 'Hobbit', '2014-04-16 2:00pm-4:00pm', 3),
(135, 136, 143, 1, 'Card', 'Interstellar ', '2014-08-05 2:00pm-4:00pm', 3),
(136, 137, 144, 1, 'Cash', 'Unbroken', '2015-04-05 2:00pm-4:00pm', 2),
(137, 138, 145, 1, 'Card', 'Hobbit', '2015-04-09 2:00pm-4:00pm', 1),
(138, 139, 146, 1, 'Cash', 'Hobbit', '2015-04-16 2:00pm-4:00pm', 1),
(139, 140, 147, 1, 'Card', 'Hobbit', '2015-04-21 2:00pm-4:00pm', 2),
(140, 141, 148, 1, 'Cash', 'Interstellar ', '2015-04-26 2:00pm-4:00pm', 3),
(141, 142, 149, 1, 'Card', 'Unbroken', '2015-04-28 2:00pm-4:00pm', 1),
(142, 143, 150, 1, 'Card', 'Lucy', '2015-04-15 2:00pm-4:00pm', 2),
(143, 144, 151, 1, 'Cash', 'Unbroken', '2015-04-12 2:00pm-4:00pm', 1),
(144, 145, 152, 1, 'Card', 'Interstellar ', '2015-04-08 2:00pm-4:00pm', 3),
(145, 146, 153, 1, 'Cash', 'Lucy', '2014-05-02 2:00pm-4:00pm', 2),
(146, 147, 154, 1, 'Card', 'Unbroken', '2014-10-05 2:00pm-4:00pm', 1),
(147, 148, 155, 1, 'Card', 'Interstellar ', '2015-04-28 2:00pm-4:00pm', 2),
(148, 149, 156, 1, 'Cash', 'Hobbit', '2015-04-27 2:00pm-4:00pm', 1),
(149, 150, 157, 1, 'Card', 'Lucy', '2015-04-11 2:00pm-4:00pm', 3),
(150, 151, 158, 1, 'Card', 'Lucy', '2014-07-05 2:00pm-4:00pm', 1),
(151, 152, 160, 1, 'Cash', 'Hobbit', '2014-08-03 2:00pm-4:00pm', 1),
(152, 153, 159, 1, 'Card', 'Interstellar ', '2014-01-06 2:00pm-4:00pm', 2),
(153, 154, 161, 1, 'Cash', 'Hobbit', '2014-09-25 2:00pm-4:00pm', 3),
(154, 155, 162, 1, 'Card', 'Unbroken', '2015-04-23 2:00pm-4:00pm', 1),
(155, 156, 163, 1, 'Cash', 'Lucy', '2015-05-06 2:00pm-4:00pm', 1),
(156, 157, 164, 1, 'Card', 'Interstellar ', '2015-04-08 2:00pm-4:00pm', 2),
(157, 158, 165, 1, 'Card', 'Unbroken', '2015-05-18 2:00pm-4:00pm', 3),
(158, 159, 166, 1, 'Cash', 'Hobbit', '2015-04-16 2:00pm-4:00pm', 1),
(159, 160, 167, 1, 'Card', 'Lucy', '2015-04-03 2:00pm-4:00pm', 1),
(166, 1, 6, 1, 'Card', 'Transformers', '2015-05-08 14:00-16:00', 3),
(165, 20, 0, 2, 'Cash', 'Hobbit', '2015-04-05 14:00-16:00', 3),
(160, 2, 0, 2, 'Cash', 'Hobbit', '2015-04-05 2:00pm-4:00pm', 3),
(161, 1, 0, 2, 'Card', 'Hobbit', '2015-04-05 2:00pm-4:00pm', 3),
(163, 0, 0, 9, 'Card', 'Hobbit', '2014-02-05 2:00pm-4:00pm', 3),
(162, 0, 0, 8, 'Card', 'Hobbit', '2015-04-05 2:00pm-4:00pm', 3),
(164, 161, 0, 10, 'Card', 'Hobbit', '2015-04-05 2:00pm-4:00pm', 3),
(169, -2, 0, 12, 'Cash', 'Hobbit', '2015-04-05 14:00-16:00', 3),
(168, 163, 6, 2, 'Card', 'Transformers', '2015-04-08 14:00-16:00', 3),
(167, 3, 5, 1, 'Card', 'Frozen', '2014-03-07 14:00-16:00', 2),
(170, 164, 0, 13, 'Card', 'Hobbit', '2015-04-05 14:00-16:00', 3),
(171, -2, 0, 14, 'Cash', 'Hobbit', '2015-04-05 14:00-16:00', 3),
(172, 0, 0, 15, 'Card', 'Hobbit', '2015-04-05 14:00-16:00', 3);

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(11) NOT NULL,
  `account` text CHARACTER SET utf8 NOT NULL,
  `password` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `manager`
--

INSERT INTO `manager` (`id`, `account`, `password`) VALUES
(-2, 'manager', 'seni');

-- --------------------------------------------------------

--
-- 表的结构 `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL,
  `account` text CHARACTER SET utf8 NOT NULL,
  `name` varchar(11) CHARACTER SET utf8 NOT NULL,
  `password` varchar(11) CHARACTER SET utf8 NOT NULL,
  `credit` int(11) NOT NULL,
  `address` varchar(11) CHARACTER SET utf8 NOT NULL,
  `gender` text CHARACTER SET utf8 NOT NULL,
  `birthday` text CHARACTER SET utf8 NOT NULL,
  `icon` text CHARACTER SET utf8 NOT NULL,
  `membercard_number` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `balance` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `register_time` text CHARACTER SET utf8 NOT NULL,
  `member_state` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `member`
--

INSERT INTO `member` (`id`, `account`, `name`, `password`, `credit`, `address`, `gender`, `birthday`, `icon`, `membercard_number`, `state`, `balance`, `level`, `register_time`, `member_state`) VALUES
(0, '2580238659@qq.com', 'Seni', 'seni', 91, 'Jiangsu', 'female', '1994-11-25', '../db/images/seni.png', 1000000, 1, 496, 1, '2014-12-28 13:37:06', 'recover'),
(1, 'cyt12@software.nju.edu.cn', 'Yuting', 'seni', 20, 'Shanghai', 'male', '1994-10-23', '../db/images/default.png', 1000001, 1, 511, 1, '2012-06-28 13:37:06', 'recover'),
(2, '18061681376@163.com', 'cyt', 'seni', 7, 'Beijing', 'male', '1991-04-12', '../db/images/default.png', 1000002, 0, 150, 0, '2004-12-28 13:37:06', 'stop'),
(3, '1@qq.com', 'i', 'i', 7, 'Jiangsu', 'female', '1992-12-20', '../db/images/default.png', 1000003, 1, 272, 0, '2012-12-28 13:37:06', 'recover'),
(4, '2@qq.com', 'i', 'i', 1, 'Jiangsu', 'male', '1994-12-20', '../db/images/default.png', 1000004, 0, 0, 0, '1999-12-28 13:37:06', 'stop'),
(5, '3@qq.com', 'i', 'i', 2, 'Jiangsu', 'female', '1997-12-20', '../db/images/default.png', 1000005, 0, -1, 0, '2014-02-28 13:37:06', 'stop'),
(6, '4@qq.com', 'i', 'i', 3, 'Chongqing', 'male', '1993-12-20', '../db/images/default.png', 1000006, 0, 0, 0, '2003-12-28 13:37:06', 'stop'),
(7, '5@qq.com', 'i', 'i', 4, 'Jiangsu', 'female', '1975-12-20', '../db/images/default.png', 1000007, 0, 0, 0, '2001-12-28 13:37:06', 'stop'),
(8, '6@qq.com', 'i', 'i', 15, 'Jiangsu', 'male', '1949-12-20', '../db/images/default.png', 1000008, 0, 0, 0, '2000-12-28 13:37:06', 'stop'),
(9, '7@qq.com', 'i', 'i', 6, 'Chongqing', 'female', '1953-12-20', '../db/images/default.png', 1000009, 0, 0, 0, '2008-12-28 13:37:06', 'stop'),
(10, '8@qq.com', 'i', 'i', 7, 'Jiangsu', 'male', '1966-12-20', '../db/images/default.png', 1000010, 0, 0, 0, '2012-12-28 13:37:06', 'stop'),
(11, '9@qq.com', 'i', 'i', 28, 'Shanghai', 'female', '1968-12-20', '../db/images/default.png', 1000011, 0, 0, 0, '2011-12-28 13:37:06', 'recover'),
(12, '10@qq.com', 'i', 'i', 9, 'Beijing', 'male', '1986-12-20', '../db/images/default.png', 1000012, 0, 0, 0, '2007-12-28 13:37:06', 'stop'),
(13, '11@qq.com', 'i', 'i', 10, 'Shanghai', 'female', '1974-12-20', '../db/images/default.png', 1000013, 0, 0, 0, '2006-12-28 13:37:06', 'recover'),
(14, '12@qq.com', 'i', 'i', 11, 'Chongqing', 'male', '1988-12-20', '../db/images/default.png', 1000014, 0, 0, 0, '2005-12-28 13:37:06', 'stop'),
(15, '13@qq.com', 'i', 'i', 12, 'Jiangsu', 'female', '1992-12-20', '../db/images/default.png', 1000015, 0, 0, 0, '2002-12-28 13:37:06', 'recover'),
(16, '14@qq.com', 'i', 'i', 33, 'Beijing', 'male', '1998-12-20', '../db/images/default.png', 1000016, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(17, '15@qq.com', 'i', 'i', 22, 'Other', 'female', '2001-12-20', '../db/images/default.png', 1000017, 0, 0, 0, '2013-12-28 13:37:06', 'recover'),
(18, '16@qq.com', 'i', 'i', 15, 'Chongqing', 'male', '2005-12-20', '../db/images/default.png', 1000018, 0, 0, 0, '1999-12-28 13:37:06', 'stop'),
(19, '17@qq.com', 'i', 'i', 16, 'Jiangsu', 'female', '2006-12-20', '../db/images/default.png', 1000019, 0, 0, 0, '2000-12-28 13:37:06', 'recover'),
(20, '18@qq.com', 'i', 'i', 17, 'Shanghai', 'male', '1993-12-20', '../db/images/default.png', 1000020, 0, 0, 0, '2001-12-28 13:37:06', 'recover'),
(21, '19@qq.com', 'i', 'i', 18, 'Jiangsu', 'male', '1997-12-20', '../db/images/default.png', 1000021, 0, 0, 0, '2002-12-28 13:37:06', 'recover'),
(22, '20@qq.com', 'i', 'i', 19, 'Chongqing', 'female', '1976-12-20', '../db/images/default.png', 1000022, 0, 0, 0, '2003-12-28 13:37:06', 'recover'),
(23, '21@qq.com', 'i', 'i', 20, 'Jiangsu', 'female', '1998-12-20', '../db/images/default.png', 1000023, 0, 0, 0, '2004-12-28 13:37:06', 'recover'),
(24, '22@qq.com', 'i', 'i', 21, 'Jiangsu', 'male', '1984-12-20', '../db/images/default.png', 1000024, 0, 0, 0, '2005-12-28 13:37:06', 'stop'),
(25, '23@qq.com', 'i', 'i', 22, 'Shanghai', 'female', '1983-12-20', '../db/images/default.png', 1000025, 0, 0, 0, '2006-12-28 13:37:06', 'recover'),
(26, '24@qq.com', 'i', 'i', 23, 'Shanghai', 'female', '1984-12-20', '../db/images/default.png', 1000026, 0, 0, 0, '2007-12-28 13:37:06', 'recover'),
(27, '25@qq.com', 'i', 'i', 24, 'Other', 'male', '1973-12-20', '../db/images/default.png', 1000027, 0, 0, 0, '2008-12-28 13:37:06', 'recover'),
(28, '26@qq.com', 'i', 'i', 25, 'Beijing', 'female', '1963-12-20', '../db/images/default.png', 1000028, 0, 0, 0, '2009-12-28 13:37:06', 'stop'),
(29, '27@qq.com', 'i', 'i', 26, 'Jiangsu', 'female', '1994-12-20', '../db/images/default.png', 1000029, 0, 0, 0, '2010-12-28 13:37:06', 'recover'),
(30, '28@qq.com', 'i', 'i', 27, 'Beijing', 'female', '1991-12-20', '../db/images/default.png', 1000030, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(31, '29@qq.com', 'i', 'i', 28, 'Jiangsu', 'male', '1991-12-20', '../db/images/default.png', 1000031, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(32, '30@qq.com', 'i', 'i', 29, 'Jiangsu', 'female', '1989-12-20', '../db/images/default.png', 1000032, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(33, '31@qq.com', 'i', 'i', 30, 'Shanghai', 'female', '2012-12-20', '../db/images/default.png', 1000033, 0, 0, 0, '2011-12-28 13:37:06', 'recover'),
(34, '32@qq.com', 'i', 'i', 31, 'Jiangsu', 'female', '1981-12-20', '../db/images/default.png', 1000034, 0, 0, 0, '2012-12-28 13:37:06', 'stop'),
(35, '33@qq.com', 'i', 'i', 32, 'Shanghai', 'female', '1971-12-20', '../db/images/default.png', 1000035, 0, 0, 0, '2013-12-28 13:37:06', 'stop'),
(36, '34@qq.com', 'i', 'i', 33, 'Shanghai', 'female', '1989-12-20', '../db/images/default.png', 1000036, 0, 0, 0, '2014-12-28 13:37:06', 'pause'),
(37, '35@qq.com', 'i', 'i', 34, 'Beijing', 'female', '2001-12-20', '../db/images/default.png', 1000037, 0, 0, 0, '2001-12-28 13:37:06', 'stop'),
(38, '36@qq.com', 'i', 'i', 35, 'Chongqing', 'female', '2014-12-20', '../db/images/default.png', 1000038, 0, 0, 0, '2002-12-28 13:37:06', 'recover'),
(39, '37@qq.com', 'i', 'i', 36, 'Jiangsu', 'male', '1996-12-20', '../db/images/default.png', 1000039, 0, 0, 0, '2003-12-28 13:37:06', 'recover'),
(40, '38@qq.com', 'i', 'i', 37, 'Other', 'female', '1973-12-20', '../db/images/default.png', 1000040, 0, 0, 0, '2004-12-28 13:37:06', 'stop'),
(41, '39@qq.com', 'i', 'i', 38, 'Jiangsu', 'female', '1962-12-20', '../db/images/default.png', 1000041, 0, 0, 0, '2005-12-28 13:37:06', 'recover'),
(42, '40@qq.com', 'i', 'i', 39, 'Shanghai', 'male', '1994-12-20', '../db/images/default.png', 1000042, 0, 0, 0, '2006-12-28 13:37:06', 'recover'),
(43, '41@qq.com', 'i', 'i', 40, 'Jiangsu', 'female', '1996-12-20', '../db/images/default.png', 1000043, 0, 0, 0, '2007-12-28 13:37:06', 'recover'),
(44, '42@qq.com', 'i', 'i', 41, 'Other', 'female', '1998-12-20', '../db/images/default.png', 1000044, 0, 0, 0, '2008-12-28 13:37:06', 'recover'),
(45, '43@qq.com', 'i', 'i', 42, 'Shanghai', 'male', '1983-12-20', '../db/images/default.png', 1000045, 0, 0, 0, '2009-12-28 13:37:06', 'stop'),
(46, '44@qq.com', 'i', 'i', 43, 'Chongqing', 'female', '1993-12-20', '../db/images/default.png', 1000046, 0, 0, 0, '2010-12-28 13:37:06', 'stop'),
(47, '45@qq.com', 'i', 'i', 44, 'Jiangsu', 'female', '1987-12-20', '../db/images/default.png', 1000047, 0, 0, 0, '2011-12-28 13:37:06', 'recover'),
(48, '46@qq.com', 'i', 'i', 45, 'Beijing', 'female', '1986-12-20', '../db/images/default.png', 1000048, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(49, '47@qq.com', 'i', 'i', 26, 'Shanghai', 'female', '1988-12-20', '../db/images/default.png', 1000049, 0, 0, 0, '2013-12-28 13:37:06', 'recover'),
(50, '48@qq.com', 'i', 'i', 47, 'Chongqing', 'male', '1991-12-20', '../db/images/default.png', 1000050, 0, 0, 0, '2014-12-28 13:37:06', 'recover'),
(51, '49@qq.com', 'i', 'i', 48, 'Jiangsu', 'female', '1999-12-20', '../db/images/default.png', 1000051, 0, 0, 0, '2015-12-28 13:37:06', 'recover'),
(52, '50@qq.com', 'i', 'i', 49, 'Shanghai', 'female', '1990-12-20', '../db/images/default.png', 1000052, 0, 0, 0, '2005-12-28 13:37:06', 'stop'),
(53, '51@qq.com', 'i', 'i', 50, 'Jiangsu', 'female', '1994-12-20', '../db/images/default.png', 1000053, 0, 0, 0, '2006-12-28 13:37:06', 'recover'),
(54, '52@qq.com', 'i', 'i', 51, 'Jiangsu', 'female', '1988-12-20', '../db/images/default.png', 1000054, 0, 0, 0, '2007-12-28 13:37:06', 'recover'),
(55, '53@qq.com', 'i', 'i', 52, 'Chongqing', 'female', '1991-12-20', '../db/images/default.png', 1000055, 0, 0, 0, '2008-12-28 13:37:06', 'recover'),
(56, '54@qq.com', 'i', 'i', 23, 'Other', 'male', '1994-12-20', '../db/images/default.png', 1000056, 0, 0, 0, '2009-12-28 13:37:06', 'recover'),
(57, '55@qq.com', 'i', 'i', 54, 'Shanghai', 'female', '1997-12-20', '../db/images/default.png', 1000057, 0, 0, 0, '2010-12-28 13:37:06', 'recover'),
(58, '56@qq.com', 'i', 'i', 55, 'Jiangsu', 'female', '1997-12-20', '../db/images/default.png', 1000058, 0, 0, 0, '2011-12-28 13:37:06', 'recover'),
(59, '57@qq.com', 'i', 'i', 16, 'Beijing', 'male', '1994-12-20', '../db/images/default.png', 1000059, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(60, '58@qq.com', 'i', 'i', 57, 'Jiangsu', 'female', '1998-12-20', '../db/images/default.png', 1000060, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(61, '59@qq.com', 'i', 'i', 58, 'Beijing', 'female', '2003-12-20', '../db/images/default.png', 1000061, 0, 0, 0, '2013-12-28 13:37:06', 'recover'),
(62, '60@qq.com', 'i', 'i', 59, 'Jiangsu', 'female', '2006-12-20', '../db/images/default.png', 1000062, 0, 0, 0, '2014-12-28 13:37:06', 'recover'),
(63, '61@qq.com', 'i', 'i', 60, 'Shanghai', 'female', '2013-12-20', '../db/images/default.png', 1000063, 0, 0, 0, '2015-12-28 13:37:06', 'recover'),
(64, '62@qq.com', 'i', 'i', 61, 'Jiangsu', 'female', '2008-12-20', '../db/images/default.png', 1000064, 0, 0, 0, '2007-12-28 13:37:06', 'cancel'),
(65, '63@qq.com', 'i', 'i', 62, 'Shanghai', 'female', '1972-12-20', '../db/images/default.png', 1000065, 0, 0, 0, '2008-12-28 13:37:06', 'recover'),
(66, '64@qq.com', 'i', 'i', 63, 'Tianjin', 'female', '1970-12-20', '../db/images/default.png', 1000066, 0, 0, 0, '2009-12-28 13:37:06', 'recover'),
(67, '65@qq.com', 'i', 'i', 64, 'Beijing', 'female', '1969-12-20', '../db/images/default.png', 1000067, 0, 0, 0, '2010-12-28 13:37:06', 'recover'),
(68, '66@qq.com', 'i', 'i', 65, 'Chongqing', 'female', '1978-12-20', '../db/images/default.png', 1000068, 0, 0, 0, '2011-12-28 13:37:06', 'recover'),
(69, '67@qq.com', 'i', 'i', 66, 'Other', 'female', '1956-12-20', '../db/images/default.png', 1000069, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(70, '68@qq.com', 'i', 'i', 67, 'Beijing', 'female', '1989-12-20', '../db/images/default.png', 1000070, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(71, '69@qq.com', 'i', 'i', 18, 'Shanghai', 'female', '1981-12-20', '../db/images/default.png', 1000071, 0, 0, 0, '2013-12-28 13:37:06', 'recover'),
(72, '70@qq.com', 'i', 'i', 69, 'Jiangsu', 'male', '1993-12-20', '../db/images/default.png', 1000072, 0, 0, 0, '2014-12-28 13:37:06', 'recover'),
(73, '71@qq.com', 'i', 'i', 70, 'Chongqing', 'female', '1976-12-20', '../db/images/default.png', 1000073, 0, 0, 0, '2009-12-28 13:37:06', 'cancel'),
(74, '72@qq.com', 'i', 'i', 71, 'Jiangsu', 'female', '1999-12-20', '../db/images/default.png', 1000074, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(75, '73@qq.com', 'i', 'i', 72, 'Shanghai', 'female', '2000-12-20', '../db/images/default.png', 1000075, 0, 0, 0, '2010-12-28 13:37:06', 'recover'),
(76, '74@qq.com', 'i', 'i', 73, 'Tianjin', 'female', '2002-12-20', '../db/images/default.png', 1000076, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(77, '75@qq.com', 'i', 'i', 74, 'Other', 'female', '1983-12-20', '../db/images/default.png', 1000077, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(78, '76@qq.com', 'i', 'i', 75, 'Chongqing', 'male', '1980-12-20', '../db/images/default.png', 1000078, 0, 0, 0, '2002-12-28 13:37:06', 'stop'),
(79, '77@qq.com', 'i', 'i', 76, 'Beijing', 'female', '1970-12-20', '../db/images/default.png', 1000079, 0, 0, 0, '2003-12-28 13:37:06', 'stop'),
(80, '78@qq.com', 'i', 'i', 77, 'Shanghai', 'male', '1977-12-20', '../db/images/default.png', 1000080, 0, 0, 0, '2004-12-28 13:37:06', 'recover'),
(81, '79@qq.com', 'i', 'i', 78, 'Jiangsu', 'female', '1978-12-20', '../db/images/default.png', 1000081, 0, 0, 0, '2005-12-28 13:37:06', 'cancel'),
(82, '80@qq.com', 'i', 'i', 79, 'Tianjin', 'male', '1969-12-20', '../db/images/default.png', 1000082, 0, 0, 0, '2006-12-28 13:37:06', 'cancel'),
(83, '81@qq.com', 'i', 'i', 80, 'Other', 'female', '1992-12-20', '../db/images/default.png', 1000083, 0, 0, 0, '2007-12-28 13:37:06', 'cancel'),
(84, '82@qq.com', 'i', 'i', 21, 'Jiangsu', 'female', '1999-12-20', '../db/images/default.png', 1000084, 0, 0, 0, '2008-12-28 13:37:06', 'recover'),
(85, '83@qq.com', 'i', 'i', 82, 'Chongqing', 'female', '2004-12-20', '../db/images/default.png', 1000085, 0, 0, 0, '2009-12-28 13:37:06', 'recover'),
(86, '84@qq.com', 'i', 'i', 83, 'Shanghai', 'female', '1998-12-20', '../db/images/default.png', 1000086, 0, 0, 0, '2010-12-28 13:37:06', 'recover'),
(87, '85@qq.com', 'i', 'i', 84, 'Beijing', 'male', '1984-12-20', '../db/images/default.png', 1000087, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(88, '86@qq.com', 'i', 'i', 25, 'Chongqing', 'female', '1987-12-20', '../db/images/default.png', 1000088, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(89, '87@qq.com', 'i', 'i', 36, 'Tianjin', 'male', '1982-12-20', '../db/images/default.png', 1000089, 0, 0, 0, '2013-12-28 13:37:06', 'cancel'),
(90, '88@qq.com', 'i', 'i', 87, 'Jiangsu', 'male', '1997-12-20', '../db/images/default.png', 1000090, 0, 0, 0, '2014-12-28 13:37:06', 'recover'),
(91, '89@qq.com', 'i', 'i', 88, 'Tianjin', 'female', '1996-12-20', '../db/images/default.png', 1000091, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(92, '90@qq.com', 'i', 'i', 89, 'Beijing', 'female', '1974-12-20', '../db/images/default.png', 1000092, 0, 0, 0, '2014-12-28 13:37:06', 'recover'),
(93, '91@qq.com', 'i', 'i', 90, 'Jiangsu', 'female', '1971-12-20', '../db/images/default.png', 1000093, 0, 0, 0, '1999-12-28 13:37:06', 'cancel'),
(94, '92@qq.com', 'i', 'i', 91, 'Tianjin', 'female', '1983-12-20', '../db/images/default.png', 1000094, 0, 0, 0, '2000-12-28 13:37:06', 'cancel'),
(95, '93@qq.com', 'i', 'i', 92, 'Shanghai', 'female', '1979-12-20', '../db/images/default.png', 1000095, 0, 0, 0, '2005-12-28 13:37:06', 'cancel'),
(96, '94@qq.com', 'i', 'i', 93, 'Beijing', 'female', '1999-12-20', '../db/images/default.png', 1000096, 0, 0, 0, '2009-12-28 13:37:06', 'recover'),
(97, '95@qq.com', 'i', 'i', 94, 'Chongqing', 'male', '2006-12-20', '../db/images/default.png', 1000097, 0, 0, 0, '2011-12-28 13:37:06', 'recover'),
(98, '96@qq.com', 'i', 'i', 95, 'Tianjin', 'female', '1998-12-20', '../db/images/default.png', 1000098, 0, 0, 0, '2001-12-28 13:37:06', 'cancel'),
(99, '97@qq.com', 'i', 'i', 96, 'Beijing', 'female', '1961-12-20', '../db/images/default.png', 1000099, 0, 0, 0, '2002-12-28 13:37:06', 'recover'),
(100, '98@qq.com', 'i', 'i', 97, 'Jiangsu', 'female', '1956-12-20', '../db/images/default.png', 1000100, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(101, '99@qq.com', 'i', 'i', 98, 'Tianjin', 'female', '1958-12-20', '../db/images/default.png', 1000101, 0, 0, 0, '2005-12-28 13:37:06', 'recover'),
(102, '100@qq.com', 'i', 'i', 99, 'Jiangsu', 'male', '1980-12-20', '../db/images/default.png', 1000102, 0, 0, 0, '2014-12-28 13:37:06', 'recover'),
(103, '101@qq.com', 'i', 'i', 100, 'Tianjin', 'female', '1992-12-20', '../db/images/default.png', 1000103, 0, 0, 0, '2007-12-28 13:37:06', 'cancel'),
(104, '102@qq.com', 'i', 'i', 101, 'Beijing', 'female', '1991-12-20', '../db/images/default.png', 1000104, 0, 0, 0, '2014-12-28 13:37:06', 'recover'),
(105, '103@qq.com', 'i', 'i', 102, 'Chongqing', 'male', '1993-12-20', '../db/images/default.png', 1000105, 0, 0, 0, '2014-12-28 13:37:06', 'cancel'),
(106, '104@qq.com', 'i', 'i', 33, 'Shanghai', 'female', '1980-12-20', '../db/images/default.png', 1000106, 0, 0, 0, '2014-12-28 13:37:06', 'recover'),
(107, '105@qq.com', 'i', 'i', 104, 'Jiangsu', 'female', '2009-12-20', '../db/images/default.png', 1000107, 0, 0, 0, '2003-12-28 13:37:06', 'recover'),
(108, '106@qq.com', 'i', 'i', 105, 'Jiangsu', 'female', '1992-12-20', '../db/images/default.png', 1000108, 0, 0, 0, '2003-12-28 13:37:06', 'recover'),
(109, '107@qq.com', 'i', 'i', 106, 'Chongqing', 'female', '1971-12-20', '../db/images/default.png', 1000109, 0, 0, 0, '2008-12-28 13:37:06', 'recover'),
(110, '108@qq.com', 'i', 'i', 107, 'Beijing', 'male', '1996-12-20', '../db/images/default.png', 1000110, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(111, '109@qq.com', 'i', 'i', 108, 'Tianjin', 'female', '1985-12-20', '../db/images/default.png', 1000111, 0, 0, 0, '2002-12-28 13:37:06', 'cancel'),
(112, '110@qq.com', 'i', 'i', 109, 'Chongqing', 'female', '1988-12-20', '../db/images/default.png', 1000112, 0, 0, 0, '2003-12-28 13:37:06', 'recover'),
(113, '111@qq.com', 'i', 'i', 40, 'Jiangsu', 'female', '1987-12-20', '../db/images/default.png', 1000113, 0, 0, 0, '2005-12-28 13:37:06', 'recover'),
(114, '112@qq.com', 'i', 'i', 111, 'Jiangsu', 'male', '1974-12-20', '../db/images/default.png', 1000114, 0, 0, 0, '2007-12-28 13:37:06', 'recover'),
(115, '113@qq.com', 'i', 'i', 112, 'Tianjin', 'female', '1982-12-20', '../db/images/default.png', 1000115, 0, 0, 0, '2009-12-28 13:37:06', 'recover'),
(116, '114@qq.com', 'i', 'i', 113, 'Jiangsu', 'male', '2001-12-20', '../db/images/default.png', 1000116, 0, 0, 0, '2013-12-28 13:37:06', 'cancel'),
(117, '115@qq.com', 'i', 'i', 74, 'Tianjin', 'male', '1986-12-20', '../db/images/default.png', 1000117, 0, 0, 0, '2014-12-28 13:37:06', 'cancel'),
(118, '116@qq.com', 'i', 'i', 115, 'Jiangsu', 'female', '2012-12-20', '../db/images/default.png', 1000118, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(119, '117@qq.com', 'i', 'i', 36, 'Jiangsu', 'male', '2011-12-20', '../db/images/default.png', 1000119, 0, 0, 0, '2014-12-28 13:37:06', 'recover'),
(120, '118@qq.com', 'i', 'i', 37, 'Tianjin', 'female', '1983-12-20', '../db/images/default.png', 1000120, 0, 0, 0, '2001-12-28 13:37:06', 'recover'),
(121, '119@qq.com', 'i', 'i', 38, 'Tianjin', 'female', '1977-12-20', '../db/images/default.png', 1000121, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(122, '120@qq.com', 'i', 'i', 29, 'Shanghai', 'female', '1965-12-20', '../db/images/default.png', 1000122, 0, 0, 0, '2002-12-28 13:37:06', 'recover'),
(123, '121@qq.com', 'i', 'i', 60, 'Shanghai', 'female', '1971-12-20', '../db/images/default.png', 1000123, 0, 0, 0, '2003-12-28 13:37:06', 'recover'),
(124, '122@qq.com', 'i', 'i', 1, 'Tianjin', 'male', '1990-12-20', '../db/images/default.png', 1000124, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(125, '123@qq.com', 'i', 'i', 22, 'Tianjin', 'female', '1993-12-20', '../db/images/default.png', 1000125, 0, 0, 0, '2005-12-28 13:37:06', 'cancel'),
(126, '124@qq.com', 'i', 'i', 123, 'Shanghai', 'male', '1997-12-20', '../db/images/default.png', 1000126, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(127, '125@qq.com', 'i', 'i', 124, 'Other', 'female', '1999-12-20', '../db/images/default.png', 1000127, 0, 0, 0, '2007-12-28 13:37:06', 'cancel'),
(128, '126@qq.com', 'i', 'i', 75, 'Beijing', 'male', '2007-12-20', '../db/images/default.png', 1000128, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(129, '127@qq.com', 'i', 'i', 26, 'Tianjin', 'female', '1990-12-20', '../db/images/default.png', 1000129, 0, 0, 0, '2009-12-28 13:37:06', 'recover'),
(130, '128@qq.com', 'i', 'i', 57, 'Chongqing', 'male', '1964-12-20', '../db/images/default.png', 1000130, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(131, '129@qq.com', 'i', 'i', 28, 'Shanghai', 'female', '1981-12-20', '../db/images/default.png', 1000131, 0, 0, 0, '2001-12-28 13:37:06', 'cancel'),
(132, '130@qq.com', 'i', 'i', 29, 'Shanghai', 'female', '1995-12-20', '../db/images/default.png', 1000132, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(133, '131@qq.com', 'i', 'i', 40, 'Tianjin', 'male', '1991-12-20', '../db/images/default.png', 1000133, 0, 0, 0, '2003-12-28 13:37:06', 'recover'),
(134, '132@qq.com', 'i', 'i', 31, 'Beijing', 'male', '1993-12-20', '../db/images/default.png', 1000134, 0, 0, 0, '2006-12-28 13:37:06', 'cancel'),
(135, '133@qq.com', 'i', 'i', 72, 'Chongqing', 'male', '1985-12-20', '../db/images/default.png', 1000135, 0, 0, 0, '2007-12-28 13:37:06', 'recover'),
(136, '134@qq.com', 'i', 'i', 63, 'Tianjin', 'female', '1994-12-20', '../db/images/default.png', 1000136, 0, 0, 0, '2008-12-28 13:37:06', 'recover'),
(137, '135@qq.com', 'i', 'i', 44, 'Shanghai', 'male', '1986-12-20', '../db/images/default.png', 1000137, 0, 0, 0, '2009-12-28 13:37:06', 'recover'),
(138, '136@qq.com', 'i', 'i', 35, 'Shanghai', 'female', '1988-12-20', '../db/images/default.png', 1000138, 0, 0, 0, '2010-12-28 13:37:06', 'recover'),
(139, '137@qq.com', 'i', 'i', 136, 'Other', 'male', '1979-12-20', '../db/images/default.png', 1000139, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(140, '138@qq.com', 'i', 'i', 137, 'Beijing', 'female', '1981-12-20', '../db/images/default.png', 1000140, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(141, '139@qq.com', 'i', 'i', 38, 'Jiangsu', 'female', '1977-12-20', '../db/images/default.png', 1000141, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(142, '140@qq.com', 'i', 'i', 19, 'Jiangsu', 'male', '1973-12-20', '../db/images/default.png', 1000142, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(143, '141@qq.com', 'i', 'i', 10, 'Shanghai', 'female', '1969-12-20', '../db/images/default.png', 1000143, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(144, '142@qq.com', 'i', 'i', 141, 'Tianjin', 'female', '1979-12-20', '../db/images/default.png', 1000144, 0, 0, 0, '2002-12-28 13:37:06', 'recover'),
(145, '143@qq.com', 'i', 'i', 82, 'Beijing', 'male', '1976-12-20', '../db/images/default.png', 1000145, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(146, '144@qq.com', 'i', 'i', 23, 'Jiangsu', 'female', '1982-12-20', '../db/images/default.png', 1000146, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(147, '145@qq.com', 'i', 'i', 34, 'Beijing', 'male', '1983-12-20', '../db/images/default.png', 1000147, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(148, '146@qq.com', 'i', 'i', 45, 'Jiangsu', 'female', '1950-12-20', '../db/images/default.png', 1000148, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(149, '147@qq.com', 'i', 'i', 6, 'Beijing', 'male', '1992-12-20', '../db/images/default.png', 1000149, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(150, '148@qq.com', 'i', 'i', 77, 'Shanghai', 'female', '1982-12-20', '../db/images/default.png', 1000150, 0, 0, 0, '2012-12-28 13:37:06', 'stop'),
(151, '149@qq.com', 'i', 'i', 78, 'Shanghai', 'male', '1977-12-20', '../db/images/default.png', 1000151, 0, 0, 0, '2015-01-28 13:37:06', 'cancel'),
(152, '150@qq.com', 'i', 'i', 69, 'Beijing', 'female', '1962-12-20', '../db/images/default.png', 1000152, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(153, '151@qq.com', 'i', 'i', 150, 'Jiangsu', 'male', '1978-12-20', '../db/images/default.png', 1000153, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(154, '152@qq.com', 'i', 'i', 71, 'Shanghai', 'female', '1981-12-20', '../db/images/default.png', 1000154, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(155, '153@qq.com', 'i', 'i', 22, 'Tianjin', 'female', '1979-12-20', '../db/images/default.png', 1000155, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(156, '154@qq.com', 'i', 'i', 83, 'Beijing', 'male', '1976-12-20', '../db/images/default.png', 1000156, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(157, '155@qq.com', 'i', 'i', 64, 'Chongqing', 'male', '1971-12-20', '../db/images/default.png', 1000157, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(158, '156@qq.com', 'i', 'i', 25, 'Other', 'female', '1977-12-20', '../db/images/default.png', 1000158, 0, 0, 0, '2015-01-28 13:37:06', 'recover'),
(159, '157@qq.com', 'i', 'i', 66, 'Tianjin', 'male', '1980-12-20', '../db/images/default.png', 1000159, 0, 0, 0, '2012-12-28 13:37:06', 'cancel'),
(160, '158@qq.com', 'i', 'i', 37, 'Shanghai', 'female', '1994-12-20', '../db/images/default.png', 1000160, 0, 0, 0, '2012-12-28 13:37:06', 'recover'),
(161, '159@qq.com', 'CC', 'cc', 4, 'Jiangsu', 'female', '2007-09-05', '../db/images/default.png', 1000161, 1, 171, 0, '2015-03-16 15:23:38', 'recover'),
(164, 'm@qq.com', 'cao', 'cao', 4, 'Jiangsu', 'female', '2015-03-18', '../db/images/movie_default1.png', 1000164, 1, 471, 1, '2015-03-27 19:12:35', 'cancel'),
(162, '160@qq.com', 'D', 'dd', 0, 'Jiangsu', 'female', '2012-03-12', '../db/images/default.png', 1000162, 1, 200, 0, '2015-03-16 11:58:55', 'recover'),
(163, 'aa@qq.com', 'cao', 'cao', 1, 'Jiangsu', 'female', '2010-03-16', '../db/images/movie_default1.png', 1000163, 1, 270, 0, '2015-03-26 19:45:34', 'recover');

-- --------------------------------------------------------

--
-- 表的结构 `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 NOT NULL,
  `star` text CHARACTER SET utf8 NOT NULL,
  `starpic` text CHARACTER SET utf8 NOT NULL,
  `actorplot` text CHARACTER SET utf8 NOT NULL,
  `pic` text CHARACTER SET utf8 NOT NULL,
  `director` text CHARACTER SET utf8 NOT NULL,
  `introduction` text CHARACTER SET utf8 NOT NULL,
  `hall` int(11) NOT NULL DEFAULT '0',
  `seat` int(11) NOT NULL DEFAULT '0',
  `period` text CHARACTER SET utf8 NOT NULL,
  `price` int(11) NOT NULL DEFAULT '30',
  `language` varchar(20) CHARACTER SET utf8 NOT NULL,
  `writer` text CHARACTER SET utf8 NOT NULL,
  `isOn` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `movie`
--

INSERT INTO `movie` (`id`, `name`, `star`, `starpic`, `actorplot`, `pic`, `director`, `introduction`, `hall`, `seat`, `period`, `price`, `language`, `writer`, `isOn`) VALUES
(0, 'Hobbit', 'Ian McKellen and Martin', '../db/images/movie-img1.png&&../db/images/movie-img2.png', 'The films take place in the fictional world of Middle-earth sixty years before the beginning of The Lord of the Rings, and follow hobbit Bilbo Baggins (Martin Freeman), who is convinced by the wizard Gandalf the Grey (Ian McKellen) to accompany thirteen dwarves, led by Thorin Oakenshield (Richard Armitage), on a quest to reclaim the Lonely Mountain from the dragon Smaug (Benedict Cumberbatch).', '../db/images/ticket-img1.png', 'Peter Jackson', 'The Hobbit is a film series consisting of three epic fantasy adventure films directed by Peter Jackson. They are based on the 1937 novel The Hobbit by J. R. R. Tolkien. Portions of the trilogy are also adapted from the appendices to The Return of the King, which expand on the story told in The Hobbit.', 3, 60, '2015-04-05 14:00-16:00', 30, 'English', 'J. R. R. Tolkien', 1),
(1, 'Interstellar', 'Matthew McConaughey and Anne Hathaway', '../db/images/movie-img3.png&&../db/images/movie-img4.png', 'Interstellar is a 2014 science fiction film directed by Christopher Nolan, starring Matthew McConaughey, Anne Hathaway, Jessica Chastain and Michael Caine. The film features a crew of astronauts who travel through a wormhole in search of a new home for humanity. Brothers Christopher and Jonathan Nolan wrote the screenplay, merging a script Jonathan developed in 2007 with Christopher''s ideas.', '../db/images/ticket-img2.png', 'Christopher', 'In the future, crop blight has caused civilization to regress into a failing agrarian society. Former NASA pilot Cooper (Matthew McConaughey) runs a farm with his family. Murphy (Mackenzie Foy), Cooper''s 10-year-old daughter, believes her room is haunted by a ghost trying to communicate with her.', 1, 60, '2015-04-05 08:00-10:00', 30, 'English', 'Jonathan Nolan', 1),
(2, 'Lucy', 'Scarlett Johansson and Morgan Freeman', '../db/images/movie-img5.png&&../db/images/movie-img6.png', 'Lucy is a 2014 English-language French science fiction action film written and directed by Luc Besson and produced by his wife Virginie Silla for his company Europacorp. The film was shot in Taipei, Paris and New York City. It stars Scarlett Johansson, Morgan Freeman, Amr Waked and Choi Min-sik. Johansson portrays the title character, a woman who gains psychokinetic abilities from a nootropic drug being absorbed into her bloodstream.', '../db/images/ticket-img3.png', 'Luc Besson', 'Lucy is a 25-year-old American woman living and studying in Taipei, Taiwan. She is tricked into working as a drug mule by her new boyfriend, whose employer, Mr. Jang, is a Korean mob boss and drug lord. Lucy delivers a briefcase to Mr. Jang containing a highly valuable synthetic drug called CPH4.', 2, 60, '2015-04-06 08:00-10:00', 30, 'English', 'Luc Besson', 0),
(3, 'Unbroken', 'Jack O''Connell and Domhnall Gleeson', '../db/images/movie-img7.png&&../db/images/movie-img8.png', 'Unbroken is a 2014 American biographical war drama film, produced and directed by Angelina Jolie, and based on the 2010 non-fiction book by Laura Hillenbrand, Unbroken: A World War II Story of Survival, Resilience, and Redemption. The film revolves around the life of USA Olympian and athlete Louis "Louie" Zamperini, portrayed by Jack O''Connell.', '../db/images/ticket-img4.png', 'Angelina Jolie', 'The film opens showing Louis "Louie" Zamperini flying as a bombardier of a United States Army Air Forces B-24 Liberator bomber, during an April 1943 bombing mission against the Japanese-held island of Nauru.', 3, 60, '2015-04-07 08:00-10:00', 30, 'English', 'Laura Hillenbrand', 1),
(4, 'The Maze Runner', 'Dylan O''Brien and Kaya Scodelario', '../db/images/movie-img9.png&&../db/images/movie-img10.png', 'The Maze Runner is a 2014 American science fiction dystopian action thriller film directed by Wes Ball, based on James Dashner''s 2009 novel of the same name. The film is the first installment in The Maze Runner film series and was produced by Ellen Goldsmith-Vein, Wyck Godfrey, Marty Bowen, and Lee Stollman with a screenplay by Noah Oppenheim, Grant Pierce Myers, and T.S. Nowlin.', '../db/images/ticket-img5.png', 'Wes Ball', 'A young man wakes up inside an underground service elevator with no memory of his identity. A group of male youths greet him in a large grassy area called the Glade that is enclosed by tall, stone walls.', 1, 60, '2015-04-06 14:00-16:00', 30, 'English', 'James Dashner', 1),
(5, 'Frozen', 'Idina Menzel and Kristen Bell', '../db/images/movie-img11.png&&../db/images/movie-img12.png', 'Frozen is a 2013 American 3D computer-animated musical fantasy-comedy film produced by Walt Disney Animation Studios and released by Walt Disney Pictures.[4] It is the 53rd animated feature produced by Walt Disney Animation Studios. Inspired by Hans Christian Andersen''s fairy tale The Snow Queen, the film tells the story of a fearless princess who sets off on an epic journey alongside a rugged iceman.', '../db/images/ticket-img6.png', 'Chris Buck', 'Elsa, Princess of Arendelle, possesses cryokinetic powers, with which she is able to produce ice, frost and snow at will. One night while playing, she accidentally injures her younger sister, Princess Anna. Their shocked parents, the king and queen, seek help from the troll king, who heals Anna and removes her memories of Elsa''s magic.', 2, 60, '2015-04-07 14:00-16:00', 30, 'English', 'Hans Christian Andersen', 1),
(6, 'Transformers', 'Shia LaBeouf and Tyrese Gibson', '../db/images/movie-img13.png&&../db/images/movie-img14.png', 'Transformers is a 2007 American science fiction action film based on the Transformers toy line. The film, which combines computer animation with live-action, is directed by Michael Bay, with Steven Spielberg serving as executive producer. It is the first installment of the live-action Transformers film series. It stars Shia LaBeouf as Sam Witwicky.', '../db/images/ticket-img7.png', 'Michael Bay', 'Optimus Prime, leader of the Autobots, narrates the collapse of the Transformers'' home world, Cybertron. It was rendered uninhabitable by war between the Autobots and the Decepticons. Led by Megatron, the Decepticons are searching for the AllSpark so they could use it to take over the universe.', 3, 60, '2015-04-08 14:00-16:00', 30, 'English', 'Hasbro', 1),
(7, 'The Avengers', 'Robert Downey, Jr. and Chris Evans', '../db/images/movie-img15.png&&../db/images/movie-img16.png', 'Marvel''s The Avengers (classified under the name Marvel Avengers Assemble in the United Kingdom and Ireland),[1][5] or simply The Avengers, is a 2012 American superhero film based on the Marvel Comics superhero team of the same name, produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures.1 It is the sixth installment in the Marvel Cinematic Universe.', '../db/images/ticket-img8.png', 'Joss Whedon', 'The Asgardian Loki encounters the Other, the leader of an extraterrestrial race known as the Chitauri. In exchange for retrieving the Tesseract,2 a powerful energy source of unknown potential, the Other promises Loki an army with which he can subjugate Earth.', 1, 60, '2015-04-08 08:00-10:00', 30, 'English', 'Stan Lee', 1),
(8, 'AA', 'Shia LaBeouf and Tyrese Gibson', '../db/images/movie_default1.png&&../db/images/movie_default2.png', 'Transformers is a 2007 American science fiction action film based on the Transformers toy line. The film, which combines computer animation with live-action, is directed by Michael Bay, with Steven Spielberg serving as executive producer. It is the first installment of the live-action Transformers film series. It stars Shia LaBeouf as Sam Witwicky.', '../db/images/movie_default3.png', 'Michael Bay', 'Optimus Prime, leader of the Autobots, narrates the collapse of the Transformers'' home world, Cybertron. It was rendered uninhabitable by war between the Autobots and the Decepticons. Led by Megatron, the Decepticons are searching for the AllSpark so they could use it to take over the universe.', 1, 30, '2015-03-12 16:53-17:53', 30, 'English', 'Q', 1);

-- --------------------------------------------------------

--
-- 表的结构 `movieplan`
--

CREATE TABLE IF NOT EXISTS `movieplan` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 NOT NULL,
  `star` text CHARACTER SET utf8 NOT NULL,
  `starpic` text CHARACTER SET utf8 NOT NULL,
  `actorplot` text CHARACTER SET utf8 NOT NULL,
  `pic` text CHARACTER SET utf8 NOT NULL,
  `director` text CHARACTER SET utf8 NOT NULL,
  `introduction` text CHARACTER SET utf8 NOT NULL,
  `hall` int(11) NOT NULL,
  `seat` int(11) NOT NULL,
  `period` text CHARACTER SET utf8 NOT NULL,
  `price` int(11) NOT NULL,
  `language` varchar(20) CHARACTER SET utf8 NOT NULL,
  `writer` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `movieplan`
--

INSERT INTO `movieplan` (`id`, `name`, `star`, `starpic`, `actorplot`, `pic`, `director`, `introduction`, `hall`, `seat`, `period`, `price`, `language`, `writer`) VALUES
(1, 'DDD', 'SSS', '../db/images/movie_modify1.png&&../db/images/movie_modify2.png', 'AAAAAA', '../db/images/movie_modify_poster.png', 'EEE', 'DDDDD', 1, 30, '2015-03-19 19:16-21:16', 30, 'Chinese', 'SSS');

-- --------------------------------------------------------

--
-- 表的结构 `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `bankcard_id` int(11) NOT NULL,
  `time` varchar(30) CHARACTER SET utf8 NOT NULL,
  `fee` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `payment`
--

INSERT INTO `payment` (`id`, `member_id`, `bankcard_id`, `time`, `fee`) VALUES
(0, 0, 0, '2014-12-28 13:37:06', 280),
(1, 1, 0, '2015-01-12 15:26:12', 120),
(2, 2, 1, '2015-01-17 08:36:51', 150),
(3, 0, 1, '2015-01-20 10:26:35', 100),
(4, 0, 1, '2015-01-25 11:47:08', 50),
(5, 0, 0, '2015-02-08 20:27:50', 100),
(6, 0, 1, '2015-02-08 20:43:16', 10),
(7, 1, 1, '2015-02-09 08:35:54', 130),
(8, 161, 1, '2015-03-16 15:26:15', 200),
(9, 162, 1, '2015-03-16 12:01:26', 200),
(10, 162, 1, '2015-03-16 12:03:21', 200),
(11, 163, 1, '2015-03-26 19:40:53', 300),
(12, 164, 1, '2015-03-27 19:13:11', 500),
(13, 0, 1, '2015-04-24 12:53:25', 100);

-- --------------------------------------------------------

--
-- 表的结构 `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `question` text CHARACTER SET utf8 NOT NULL,
  `quesoption` text CHARACTER SET utf8 NOT NULL,
  `credit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `question`
--

INSERT INTO `question` (`id`, `movie_id`, `question`, `quesoption`, `credit`) VALUES
(0, 0, 'How do you think about the Movie Hobbit? ', 'Good&&Middle&&Bad', 3),
(1, 1, 'How do you think about the Movie Interstellar?', 'Good&&Middle&&Bad', 3),
(2, 0, 'How do you think the stars in Hobbit?', 'Good&&Middle&&Bad', 2),
(3, 2, 'assssf', 'AA&&BB&&CC', 1),
(4, 4, 'assssf', 'AA&&BB&&CC', 1);

-- --------------------------------------------------------

--
-- 表的结构 `waiter`
--

CREATE TABLE IF NOT EXISTS `waiter` (
  `id` int(11) NOT NULL,
  `account` text CHARACTER SET utf8 NOT NULL,
  `password` varchar(11) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `waiter`
--

INSERT INTO `waiter` (`id`, `account`, `password`) VALUES
(-1, 'waiter', 'seni');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
