-- phpMyAdmin SQL Dump
-- version 4.2.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-09-02 13:15:11
-- 服务器版本： 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `crystal`
--

-- --------------------------------------------------------

--
-- 表的结构 `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `url` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `college` varchar(30) DEFAULT NULL,
  `speaker` varchar(50) DEFAULT NULL,
  `venue` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `notify_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `notifications`
--

INSERT INTO `notifications` (`url`, `title`, `college`, `speaker`, `venue`, `time`, `notify_time`) VALUES
('http://125.218.212.217/index.php?m=content&c=index&a=show&catid=35&id=1012', '题  目：Exploit Social Trust For Cooperative Networking: A Social Group Utility Maximization Framework', '暨南大学', '报告人：Dr. Xu Chen  Georg-August-University of Goetti', '地  点：科学馆513室', '2015-06-10 10:00:00', '2015-06-08'),
('http://125.218.212.217/index.php?m=content&c=index&a=show&catid=35&id=1016', '题  目：Automated Functionality-Aware Privacy Leakage Analysis for Android Applications', '暨南大学', '报告人：宾西法尼亚州立大学  朱森存  副教授', '地  点：科学馆513室', '2015-06-12 03:00:00', '2015-06-09'),
('http://125.218.212.217/index.php?m=content&c=index&a=show&catid=35&id=1022', '', '暨南大学', '报告人：新加坡信息通信研究所网络安全实验室  Jianying Zhou  主任', '地  点：科学馆513室', '2015-06-18 03:00:00', '2015-06-16'),
('http://125.218.212.217/index.php?m=content&c=index&a=show&catid=35&id=1024', '题  目：密码与生活', '暨南大学', '报告人：Prof. Lein Harn University of Missouri-Kansas ', '地  点：科学馆513室', '2015-06-19 10:00:00', '2015-06-17'),
('http://125.218.212.217/index.php?m=content&c=index&a=show&catid=35&id=1039', '题  目：Cloud Networking for Big Data: Case Studies', '暨南大学', '报告人：Prof.  Song Guo  The University of Aizu, ?xml:', '地  点：南海楼338室', '2015-07-10 10:00:00', '2015-07-06'),
('http://125.218.212.217/index.php?m=content&c=index&a=show&catid=35&id=698', '题  目：Secret Sharing and Its Applications', '暨南大学', '报告人：美国密苏里大学-堪萨斯分校（University of Missouri-Kansas Ci', '地  点：南海楼338室', '2014-06-23 03:00:00', '2014-06-20'),
('http://125.218.212.217/index.php?m=content&c=index&a=show&catid=35&id=703', '题  目：Optimized Implementation of a General Secret Sharing and Research Methodology', '暨南大学', '报告人：美国密苏里大学-堪萨斯分校（University of Missouri-Kansas Ci', '地  点：南海楼338室', '2014-06-25 03:00:00', '2014-06-23'),
('http://125.218.212.217/index.php?m=content&c=index&a=show&catid=35&id=769', '题  目：Limits and Algorithms for Multiple Target Counting and Tracking by Binary Proximity Sensors', '暨南大学', '报告人：清华大学交叉信息研究院  王永才  助理研究员', '地  点：南海楼407室', '2014-10-10 11:00:00', '2014-09-30'),
('http://125.218.212.217/index.php?m=content&c=index&a=show&catid=35&id=863', '题  目：计算难解问题的算法新进展：二元决策图与可满足性问题', '暨南大学', '报告人：澳大利亚格里菲斯大学(Griffith University)  苏开乐  教授', '地  点：教学大楼A215室', '2014-12-31 10:00:00', '2014-12-26'),
('http://www2.scut.edu.cn/s/87/t/431/3f/bd/info81853.htm', '报告题目：Choosing products in social networks\r\n', '华南理工大学', '', '报告地点：大学城校区B7-303会议室', '2013-07-30 14:00:00', '2013-07-29'),
('http://www2.scut.edu.cn/s/87/t/431/51/b4/info86452.htm', '报告题目：感知社会化数据的可视分析\r\n报 告 人：巫英才博士\r\n报告时间：2013年11月11日（星期一）下午15:30-17:00 \r\n报告地点：华南理工大学南校区（大学城）A4-204', '华南理工大学', '报告题目：感知社会化数据的可视分析\r\n报 告 人：巫英才博士\r\n报告时间：2013年11月11日（星', '报告题目：感知社会化数据的可视分析\r\n报 告 人：巫英才博士\r\n报告时间：2013年11月11日（星期一）下午15:30-17:00 \r\n报告地点：华南理工大学南校区（大学城）A4-204', '2013-11-11 15:00:00', '2013-11-11'),
('http://www2.scut.edu.cn/s/87/t/431/54/68/info87144.htm', '报告题目： Introduction to Game Theory', '华南理工大学', '', '报告地点：B8-副楼报告厅', '2013-11-27 10:00:00', '2013-11-27'),
('http://www2.scut.edu.cn/s/87/t/431/55/8a/info87434.htm', '', '华南理工大学', '', '报告地点：B7-303', '2013-12-04 14:00:00', '2013-12-04'),
('http://www2.scut.edu.cn/s/87/t/431/9c/2e/info105518.htm', '报告题目：Visual Computing - a personal perspective', '华南理工大学', '报 告 人：Prof. Oliver Deussen', '报告地点：华南理工大学南校区（大学城）B8副楼报告厅', '2014-10-29 14:00:00', '2014-10-26'),
('http://www2.scut.edu.cn/s/87/t/431/9d/6a/info105834.htm', '报告题目：Big Data Analytics for Detecting Deceptive Product Comments in Online Social Media', '华南理工大学', '报 告 人:Prof. LAU Yiu Keung Raymond, 劉耀強教授', '报告地点：华南理工大学南校区（大学城）B8副楼报告厅', '2014-11-06 15:00:00', '2014-11-03'),
('http://www2.scut.edu.cn/s/87/t/431/a2/84/info107140.htm', '报告题目：Decision entrustment and social optimality in repeated bilateral agent interactions', '华南理工大学', '报 告 人: Professor Ho-fung Leung, 梁浩锋教授', '报告地点：华南理工大学南校区（大学城）B8副楼报告厅', '2014-12-04 14:00:00', '2014-11-27'),
('http://www2.scut.edu.cn/s/87/t/431/a2/c6/info107206.htm', '报告题目：Addressing Usability Issues of FPGA-based Reconfigurable Clusters forLarge-Scale Data Analytic ', '华南理工大学', '报 告 人：苏国希助理教授（香港大学）', '报告地点：大学城校区B8副楼报告厅', '2014-12-01 14:00:00', '2014-11-28'),
('http://www2.scut.edu.cn/s/87/t/431/a3/d3/info107475.htm', '报告题目：Data-driven Meta-heuristic Search', '华南理工大学', '', '报告地点：大学城校区B8副楼报告厅', '2014-12-08 10:00:00', '2014-12-03'),
('http://www2.scut.edu.cn/s/87/t/431/a5/7b/info107899.htm', '报告题目：Big Data Analytics in Business Environments', '华南理工大学', '报 告 人：熊辉博士（海外杰青，美国罗格斯-新泽西州立大学教授）', '报告地点：B8-副楼报告厅', '2014-12-16 14:00:00', '2014-12-12'),
('http://www2.scut.edu.cn/s/87/t/431/b4/0f/info111631.htm', '报告题目：面向教学与学习的量化软件工具——用并发线性规划为教师们所需的测试', '华南理工大学', '报 告 人: 新西兰奥克兰大学Gavin Brown教授', '报告地点：华南理工大学南校区（大学城）B8副楼报告厅', '2015-04-20 15:00:00', '2015-04-10'),
('http://www2.scut.edu.cn/s/87/t/431/b6/4b/info112203.htm', '报告题目：群体智能', '华南理工大学', '报 告 人: 墨尔本皇家理工大学的李晓东副教授', '报告地点：华南理工大学南校区（大学城）B8副楼报告厅', '2015-04-21 09:00:00', '2015-04-20'),
('http://www2.scut.edu.cn/s/87/t/431/bb/af/info113583.htm', '报告题目：天河二号的六大应用平台建设', '华南理工大学', '报 告 人: 广州超算中心总工程师杜云飞 博士、副研究员', '报告地点：华南理工大学南校区（大学城）B2-335报告厅', '2015-05-28 14:00:00', '2015-05-18'),
('http://www2.scut.edu.cn/s/87/t/431/be/c6/info114374.htm', '报告题目：OpenStack简介及天河二号的实践和体会', '华南理工大学', '报 告 人: 广州超算中心谭霜 博士、助理研究员', '报告地点：华南理工大学南校区（大学城）B8副楼报告厅', '2015-06-04 14:00:00', '2015-06-01'),
('http://www2.scut.edu.cn/s/87/t/431/c0/e1/info114913.htm', '报告题目：Intelligent Wireless Sensor Network and Applications', '华南理工大学', '报 告 人: 哈尔滨工业大学潘正祥教授', '报告地点：华南理工大学南校区（大学城）B8副楼报告厅', '2015-06-15 14:00:00', '2015-06-10'),
('http://www2.scut.edu.cn/s/87/t/431/c6/28/info116264.htm', '报告题目：密码学与生活', '华南理工大学', '报 告 人: 韩亮(Lein Harn), 美国 University of Missouri-Ka', '报告地点：华南理工大学南校区（大学城）B8副楼报告厅', '2015-06-19 15:00:00', '2015-06-19'),
('http://www2.scut.edu.cn/s/87/t/431/cb/49/info117577.htm', '报告题目：Quantification in Visual Computing', '华南理工大学', '报 告 人: Prof. Oliver Deussen', '报告地点：华南理工大学南校区（大学城）B7-303会议室', '2015-07-01 15:00:00', '2015-06-29'),
('http://www2.scut.edu.cn/s/87/t/431/cb/4d/info117581.htm', '报告题目：机电系统的嵌入式智能（Embedding Intelligence in Mechatronic Systems）', '华南理工大学', '报 告 人: 国家千人学者范衠教授（汕头大学）', '报告地点：华南理工大学南校区（大学城）B7-303会议室', '2015-07-16 09:00:00', '2015-07-15'),
('http://xxxy.jnu.edu.cn/index.php?m=content&c=index&a=show&catid=35&id=333', '题  目：量子整数分解新方向', '暨南大学', '报告人：颜松远  教授', '地  点：教学大楼A506室', '2013-04-03 10:00:00', '2013-04-01'),
('http://xxxy.jnu.edu.cn/index.php?m=content&c=index&a=show&catid=35&id=407', '题  目：超小波及基于压缩感知和超小波的稀疏重建', '暨南大学', '报告人：汕头大学  闫敬文  教授（博士生导师）', '地  点：教学大楼A216室', '2013-05-31 03:00:00', '2013-05-30');

-- --------------------------------------------------------

--
-- 表的结构 `seeds`
--

CREATE TABLE IF NOT EXISTS `seeds` (
  `start_url` varchar(100) NOT NULL,
  `college` varchar(30) NOT NULL,
  `url_xpath` varchar(50) NOT NULL,
  `word` varchar(50) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `speaker` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `venue` varchar(50) NOT NULL,
  `text_xpath` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `seeds`
--

INSERT INTO `seeds` (`start_url`, `college`, `url_xpath`, `word`, `title`, `speaker`, `time`, `venue`, `text_xpath`) VALUES
('http://www2.scut.edu.cn/s/87/t/431/p/28/c/3779/i/10/list.htm', '华南理工大学', '//a[@style]', '学术报告', '报告题目', '报 告 人', '报告时间', '报告地点', '//*[@id="infocontent"]/p'),
('http://xxxy.jnu.edu.cn/index.php?m=content&c=index&a=lists&catid=8', '暨南大学', '//a[@class=''right-2-li-a'']', '计算机科学系学术讲座', '题  目：', '报告人：', '时  间：', '地  点：', '//*[@id="content-main"]/div[2]/p');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
 ADD PRIMARY KEY (`url`), ADD KEY `title` (`title`,`college`,`time`,`notify_time`), ADD KEY `college` (`college`);

--
-- Indexes for table `seeds`
--
ALTER TABLE `seeds`
 ADD PRIMARY KEY (`start_url`), ADD KEY `college` (`college`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
