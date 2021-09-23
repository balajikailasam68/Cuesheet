-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 15, 2021 at 07:16 AM
-- Server version: 8.0.19
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dmam`
--

-- --------------------------------------------------------

--
-- Table structure for table `cuesheet`
--

CREATE TABLE `cuesheet` (
  `pgmID` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Date_Time_Progname(first 4 chars)\r\n',
  `CueID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Programname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `myDate` date NOT NULL,
  `INpoint` time(3) NOT NULL,
  `OUTpoint` time(3) NOT NULL,
  `Duration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromreading` time(3) DEFAULT NULL,
  `toreading` time(3) DEFAULT NULL,
  `filename` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrgMediaPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `slot` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuesheet`
--

INSERT INTO `cuesheet` (`pgmID`, `CueID`, `UserID`, `Programname`, `myDate`, `INpoint`, `OUTpoint`, `Duration`, `fromreading`, `toreading`, `filename`, `OrgMediaPath`, `Remarks`, `position`, `slot`) VALUES
('1629270486-News@7am', '0600to1400', 'News', 'News@7am', '2021-08-18', '07:00:00.000', '07:15:00.000', '00:15:00', NULL, NULL, '', NULL, '', NULL, 'fixed'),
('1629270651-How to get through in NEET tell me   \n  <i><b><u> Reading </u></b></i> \n from:07:15:00\n to:07:15:00', '0600to1400', ' Balaji  ', ' How to get through in NEET tell me   \n  <i><b><u> Reading </u></b></i> \n from:07:15:00\n to:07:15:00', '2021-08-18', '07:15:00.000', '07:25:06.000', ' 00:10:06  ', NULL, NULL, '   ', NULL, '', NULL, NULL),
('1629271379-News@12', '0600to1400', 'News', 'News@12', '2021-08-18', '12:00:00.000', '12:05:00.000', '00:05:00', NULL, NULL, 'CD.mp4', NULL, '', NULL, 'fixed'),
('1629271383-News@10am', '0600to1400', 'News', 'News@10am', '2021-08-18', '10:00:00.000', '10:15:00.000', '00:15:00', NULL, NULL, 'delta.mp4', NULL, '', NULL, 'fixed'),
('1629282952-montage@6am', '0600to1400', 'News', 'montage@6am', '2021-08-18', '06:00:00.000', '06:00:10.000', '00:00:10', NULL, NULL, 'montage.mp4', NULL, '', NULL, NULL),
('1629282959-montage@14', '0600to1400', 'News', 'montage@14', '2021-08-18', '12:05:00.000', '12:05:10.000', '00:00:10', NULL, NULL, 'wedding.mp4', NULL, '', NULL, NULL),
('1629282965-Enna Paattu paada   \n  <i><b><u> Reading </u></b></i> \n from:14:00:10\n to:14:00:10', '0600to1400', ' Balaji  ', ' Enna Paattu paada   \n  <i><b><u> Reading </u></b></i> \n from:14:00:10\n to:14:00:10', '2021-08-18', '12:05:10.000', '12:33:40.000', ' 00:28:30  ', NULL, NULL, '   ', NULL, '', NULL, NULL),
('1629283050-dummy', '0600to1400', '???', 'dummy', '2021-08-18', '06:00:10.000', '07:00:00.000', '00:59:50', NULL, NULL, 'dummy', NULL, '', NULL, NULL),
('1629283054-dummy', '0600to1400', '???', 'dummy', '2021-08-18', '07:25:06.000', '10:00:00.000', '02:34:54', NULL, NULL, 'dummy', NULL, '', NULL, NULL),
('1629283056-dummy', '0600to1400', '???', 'dummy', '2021-08-18', '10:15:00.000', '12:00:00.000', '01:45:00', NULL, NULL, 'dummy', NULL, '', NULL, NULL),
('1630475615-Viswa film    test upd   \n  <i><b><u> Reading </u></b></i> \n from:06:10:00\n to:06:10:00', '1400to2200', '   fgfgf      ', '   Viswa film    test upd   \n  <i><b><u> Reading </u></b></i> \n from:06:10:00\n to:06:10:00', '2021-09-01', '06:10:00.000', '08:36:51.000', '   02:26:51      ', NULL, NULL, '   ', NULL, '   Red fort      ', NULL, NULL),
('1630475627-Delta Virus   \n  <i><b><u> Reading </u></b></i> \n from:06:10:00\n to:06:10:00', '1400to2200', ' TND01097 myvehicle  ', ' Delta Virus   \n  <i><b><u> Reading </u></b></i> \n from:06:10:00\n to:06:10:00', '2021-09-01', '06:10:00.000', '06:19:50.000', ' 00:09:50  ', NULL, NULL, ' delta.mp4  ', NULL, ' Will ID Come right now with ui min now again and again  ', NULL, NULL),
('1630475635-Vayalum Vaazhvum   \n  <i><b><u> Reading </u></b></i> \n from:06:10:00\n to:06:10:00', '1400to2200', '  Balaji    ', ' Vayalum Vaazhvum   \n  <i><b><u> Reading </u></b></i> \n from:06:10:00\n to:06:10:00', '2021-09-01', '06:10:00.000', '06:20:00.000', '  00:10:00  ', NULL, NULL, '   ', NULL, '  New Remarks on NEET    ', NULL, NULL),
('1630475678-22 to 6 program vip 22   \n  <i><b><u> Reading </u></b></i> \n from:06:20:00\n to:06:20:00', '2200to0600', ' Balaji 22 to 6  ', ' 22 to 6 program vip 22   \n  <i><b><u> Reading </u></b></i> \n from:06:20:00\n to:06:20:00', '2021-09-01', '06:20:00.000', '07:00:00.000', ' 00:40:00  ', NULL, NULL, '   ', NULL, ' Will ID Come right now with ui min now Z Index no 10 25  ', NULL, NULL),
('1630475689-Enna Paattu paada   \n  <i><b><u> Reading </u></b></i> \n from:06:20:00\n to:06:20:00', '2200to0600', ' Balaji  ', ' Enna Paattu paada   \n  <i><b><u> Reading </u></b></i> \n from:06:20:00\n to:06:20:00', '2021-09-01', '06:20:00.000', '06:48:30.000', ' 00:28:30  ', NULL, NULL, '   ', NULL, ' Will ID Come right updated  ', NULL, NULL),
('1630475711-Vayalum Vaazhvum   \n  <i><b><u> Reading </u></b></i> \n from:06:20:00\n to:06:20:00', '2200to0600', '  Balaji    ', ' Vayalum Vaazhvum   \n  <i><b><u> Reading </u></b></i> \n from:06:20:00\n to:06:20:00', '2021-09-01', '06:20:00.000', '06:30:00.000', '  00:10:00  ', NULL, NULL, '   ', NULL, '  New Remarks on NEET    ', NULL, NULL),
('1630476114-Enna Paattu paada   \n  <i><b><u> Reading </u></b></i> \n from:06:58:30\n to:06:58:30', '1400to2200', ' Balaji  ', ' Enna Paattu paada   \n  <i><b><u> Reading </u></b></i> \n from:06:58:30\n to:06:58:30', '2021-09-01', '06:58:30.000', '07:27:00.000', ' 00:28:30  ', NULL, NULL, '   ', NULL, ' Will ID Come right updated  ', NULL, NULL),
('1630476128-Enna Paattu paada   \n  <i><b><u> Reading </u></b></i> \n from:07:00:00\n to:07:00:00', '2200to0600', ' Balaji  ', ' Enna Paattu paada   \n  <i><b><u> Reading </u></b></i> \n from:07:00:00\n to:07:00:00', '2021-09-01', '07:00:00.000', '07:28:30.000', ' 00:28:30  ', NULL, NULL, '   ', NULL, ' Will ID Come right updated  ', NULL, NULL),
('1630477325-montage@6am', '0600to1400', 'News', 'montage@6am', '2021-09-01', '06:00:00.000', '06:00:10.000', '00:00:10', NULL, NULL, 'montage.mp4', NULL, '', NULL, NULL),
('1630489681-montage@6am', '0600to1400', 'News', 'montage@6am', '2021-09-01', '06:00:00.000', '06:00:10.000', '00:00:10', NULL, NULL, 'montage.mp4', NULL, 'rem news 14', NULL, NULL),
('1630490604-Delta Virus', '0600to1400', ' TND01097 myvehicle  ', ' Delta Virus  ', '2021-09-01', '06:00:10.000', '06:00:12.000', ' 00:00:2.6540000000000004  ', '00:00:02.000', '00:00:04.000', ' delta.mp4  ', NULL, ' Will ID Come right now with ui min now again and again  ', NULL, NULL),
('1630490607-who knows what', '0600to1400', '  TND01097    ', '  who knows what    ', '2021-09-01', '06:00:12.000', '06:25:12.000', ' 00:25:00  ', '11:40:00.000', '22:00:00.000', ' 06.VP VENKAIAH NAIDU.mp4  ', NULL, '  Will ID Come right now with ui min now again and again    ', NULL, NULL),
('1630559982-Vayalum Vaazhvum', '0600to1400', '  Balaji    ', ' Vayalum Vaazhvum  ', '2021-09-01', '06:25:12.000', '06:25:41.000', ' 00:00:29.786  ', '00:00:22.000', '00:00:52.000', ' smalldelta.mp4  ', NULL, '  New Remarks on NEET    ', NULL, NULL),
('1630561717-montage@6am', '0600to1400', 'News', 'montage@6am', '2021-09-01', '06:00:00.000', '06:00:10.000', '00:00:10', NULL, NULL, 'montage.mp4', NULL, 'rem news 14', NULL, NULL),
('1630561771-News@7am', '0600to1400', 'News', 'News@7am', '2021-09-01', '07:00:00.000', '07:15:00.000', '00:15:00', NULL, NULL, '', NULL, 'rem news 14', NULL, 'fixed'),
('1630576809-montage@6am', '1400to2200', 'News', 'montage@6am', '2021-09-02', '06:00:00.000', '06:00:10.000', '00:00:10', NULL, NULL, 'montage.mp4', NULL, 'rem news 14', NULL, NULL),
('1630576816-Delta Virus', '1400to2200', ' TND01097 myvehicle  ', ' Delta Virus  ', '2021-09-02', '00:00:01.799', '00:00:04.453', ' 00:00:2.6540000000000004  ', '06:00:10.000', '06:00:12.000', ' delta.mp4  ', NULL, ' Will ID Come right now with ui min now again and again  ', NULL, NULL),
('1630578968-Vayalum Vaazhvum', '0600to1400', '  Balaji    ', ' Vayalum Vaazhvum  ', '2021-09-02', '00:00:22.104', '00:00:51.890', ' 00:00:29.786  ', '06:00:10.000', '06:00:39.000', ' smalldelta.mp4  ', NULL, '', NULL, NULL),
('1630578972-News@7am', '0600to1400', 'News', 'News@7am', '2021-09-02', '07:00:00.000', '07:15:00.000', '00:15:00', '07:00:00.000', '07:15:00.000', '', NULL, '', NULL, 'fixed'),
('1630580197-dummy', '0600to1400', '???', 'dummy', '2021-09-02', '07:15:00.000', '14:00:00.000', '06:45:00', '07:15:00.000', '14:00:00.000', 'dummy', NULL, '', NULL, NULL),
('1630580279-News@22', '0600to1400', 'News', 'News@22', '2021-09-02', '22:00:00.000', '22:30:00.000', '00:30:00', '22:00:00.000', '22:30:00.000', '', NULL, '', NULL, 'fixed'),
('1630581069-dummy', '0600to1400', '???', 'dummy', '2021-09-02', '06:00:39.000', '07:00:00.000', '00:49:21', '06:00:39.000', '06:50:00.000', 'dummy', NULL, '', NULL, NULL),
('1630581070-dummy', '0600to1400', '???', 'dummy', '2021-09-02', '14:00:00.000', '22:00:00.000', '08:00:00', '14:00:00.000', '22:00:00.000', 'dummy', NULL, '', NULL, NULL),
('1630581199-dummy', '0600to1400', '???', 'mummy', '2021-09-02', '06:50:00.000', '07:00:00.000', '00:10:00', '06:50:00.000', '07:00:00.000', 'mummy', NULL, '', NULL, NULL),
('1630654543-Enna Paattu paada', '0600to1400', ' Balaji  ', ' Enna Paattu paada  ', '2021-09-03', '07:20:00.000', '21:00:00.000', ' 00:28:30  ', '09:44:16.000', '10:12:46.000', ' 16.US PREZ.mp4  ', NULL, '', NULL, NULL),
('1630654638-Delta Virus', '0600to1400', ' TND01097 myvehicle  ', ' Delta Virus  ', '2021-09-03', '00:00:01.799', '00:00:04.453', ' 00:00:2.6540000000000004  ', '09:22:14.000', '09:22:16.000', ' delta.mp4  ', NULL, '', NULL, NULL),
('1630658041-', '0600to1400', '', '', '2021-09-03', '01:00:00.000', '21:00:00.000', '00:20:00', '08:39:50.000', '08:59:50.000', '', NULL, '', NULL, NULL),
('1630658122-dummy', '0600to1400', '???', 'dummy', '2021-09-03', '07:48:32.000', '08:10:56.000', '00:22:24', '08:59:50.000', '09:22:14.000', 'dummy', NULL, '', NULL, NULL),
('1630658177-test add row', '0600to1400', '', 'test add row', '2021-09-03', '01:00:00.000', '21:00:00.000', '00:22:00', '09:22:16.000', '09:44:16.000', 'addrow.mp4', NULL, '', NULL, NULL),
('1630658241-montage@6am', '0600to1400', 'News', 'montage@6am', '2021-09-03', '06:00:00.000', '06:00:10.000', '00:00:10', '06:00:00.000', '06:00:10.000', 'montage.mp4', NULL, '', NULL, NULL),
('1630658247-dummy', '0600to1400', '???', 'dummy', '2021-09-03', '06:00:10.000', '07:20:00.000', '01:19:50', '06:00:10.000', '07:20:00.000', 'dummy', NULL, '', NULL, NULL),
('1630658266-dummy', '0600to1400', '???', 'dummy', '2021-09-03', '06:28:40.000', '07:48:30.000', '01:19:50', '07:20:00.000', '08:39:50.000', 'dummy', NULL, '', NULL, NULL),
('1630658955-', '0600to1400', '', '', '2021-09-03', '01:00:00.000', '21:00:00.000', '00:20:00', '10:12:46.000', '10:32:46.000', '', NULL, '', NULL, NULL),
('1630658973-', '1400to2200', '', 'Ennatha', '2021-09-03', '01:00:00.000', '21:00:00.000', '00:20:00', '01:00:00.000', '21:00:00.000', 'paatupada', NULL, '', NULL, NULL),
('1630658990-', '1400to2200', 'hidden', 'gem', '2021-09-03', '01:00:00.000', '21:00:00.000', '00:20:00', '01:00:00.000', '21:00:00.000', 'hiddengem', NULL, 'gem remains hidden', NULL, NULL),
('1630659093-', '1400to2200', '', '', '2021-09-03', '01:00:00.000', '21:00:00.000', '00:20:00', '06:40:00.000', '07:00:00.000', '', NULL, '', NULL, NULL),
('1630659405-ajax pgm', '2200to0600', ' Chk ajax update  ', ' ajax pgm  ', '2021-09-03', '21:00:00.000', '21:00:00.000', ' 00:22:00  ', '06:00:00.000', '06:22:00.000', ' 17.SENIOR TALIBAN.mp4  ', NULL, ' chk update of ajax  ', NULL, NULL),
('1630906632-ajax pgm', '0600to1400', ' Chk ajax update  ', ' ajax pgm  ', '2021-09-06', '21:00:00.000', '21:00:00.000', ' 00:22:00  ', '06:00:00.000', '06:22:00.000', ' 17.SENIOR TALIBAN.mp4  ', NULL, '', NULL, NULL),
('1630906816-dummy', '0600to1400', 'dummy', 'dummy', '2021-09-06', '00:00:00.000', '00:30:00.000', '00:30:00', '06:22:00.000', '06:52:00.000', 'dummy', NULL, '', NULL, NULL),
('1630906840-News@7am', '0600to1400', 'News', 'News@7am', '2021-09-06', '07:00:00.000', '07:15:00.000', '00:15:00', '07:00:00.000', '07:15:00.000', '', NULL, '', NULL, 'fixed'),
('1630906847-dummy', '0600to1400', '???', 'dummy', '2021-09-06', '06:52:00.000', '07:00:00.000', '00:08:00', '06:52:00.000', '07:00:00.000', 'dummy', NULL, 'To be filled', NULL, NULL),
('1630907642-dummy', '0600to1400', 'dummy', 'dummy', '2021-09-06', '00:00:00.000', '00:30:00.000', '00:30:00', '07:15:00.000', '07:45:00.000', 'dummy', NULL, ' Fill with actual Pgm', NULL, NULL),
('1630910053-ajax pgm', '0600to1400', ' Chk ajax update  ', ' ajax pgm  ', '2021-09-06', '21:00:00.000', '21:00:00.000', ' 00:22:00  ', '07:45:00.000', '08:07:00.000', ' 17.SENIOR TALIBAN.mp4  ', NULL, ' chk update of ajax  ', NULL, NULL),
('1630910361-ajax pgm', '1400to2200', ' Chk ajax update  ', ' ajax pgm  ', '2021-09-06', '21:00:00.000', '21:00:00.000', ' 00:22:00  ', '06:00:00.000', '06:22:00.000', ' 17.SENIOR TALIBAN.mp4  ', NULL, ' chk update of ajax  ', NULL, NULL),
('1630911985-Delta Virus', '0600to1400', ' TND01097 myvehicle  ', ' Delta Virus  ', '2021-09-06', '00:00:01.799', '00:00:04.453', ' 00:00:2.6540000000000004  ', '08:07:00.000', '08:07:02.000', ' delta.mp4  ', NULL, ' Will ID Come right now with ui min now again and again  ', NULL, NULL),
('1630912431-Delta Virus', '0600to1400', ' TND01097 myvehicle  ', ' Delta Virus  ', '2021-09-06', '00:00:31.440', '00:00:33.712', ' 00:00:2.272000000000002  ', '08:07:02.000', '08:07:04.000', ' delta.mp4  ', NULL, ' Will ID Come right now with ui min now again and again  ', NULL, NULL),
('1630912993-Viswa film    test upd', '1400to2200', '   fgfgf      ', '   Viswa film    test upd  ', '2021-09-06', '05:13:22.577', '01:01:25.000', ' 00:00:24  ', '06:22:00.000', '06:22:24.000', ' 07.MIN NIRMLA MEETS IT.mp4  ', NULL, '   Red fort      ', NULL, NULL),
('1630916239-1400 tried', '2200to0600', ' Arul mani guru  ', ' 1400 tried  ', '2021-09-06', '08:00:00.000', '21:00:00.000', ' 00:55:00  ', '06:00:00.000', '06:55:00.000', ' 10.TN ASSEBLY PRO.mp4  ', NULL, '', NULL, NULL),
('1630916249-News@7am', '2200to0600', 'News', 'News@7am', '2021-09-06', '07:00:00.000', '07:15:00.000', '00:15:00', '07:00:00.000', '07:15:00.000', '', NULL, '', NULL, 'fixed'),
('1630916255-dummy', '2200to0600', '???', 'dummy', '2021-09-06', '06:55:00.000', '07:00:00.000', '00:05:00', '06:55:00.000', '07:00:00.000', 'dummy', NULL, 'To be filled', NULL, NULL),
('1630916267-dummy', '2200to0600', 'dummy', 'dummy', '2021-09-06', '00:00:00.000', '00:30:00.000', '00:30:00', '07:15:00.000', '07:45:00.000', 'dummy', NULL, ' Fill with actual Pgm', NULL, NULL),
('1630919503-Vayalum Vaazhvum', '2200to0600', '  Balaji    ', ' Vayalum Vaazhvum  ', '2021-09-06', '00:00:22.104', '00:00:51.890', ' 00:00:29.786  ', '07:45:00.000', '07:45:29.000', ' smalldelta.mp4  ', NULL, '  New Remarks on NEET    ', NULL, NULL),
('1630919589-22 to 6 program vip 22', '0600to1400', ' Balaji 22 to 6  ', ' 22 to 6 program vip 22  ', '2021-09-06', '00:00:20.413', '00:01:22.231', ' 00:01:1.818  ', '08:07:04.000', '08:08:05.000', ' CD.mp4  ', NULL, ' Will ID Come right now with ui min now Z Index no 10 25  ', NULL, NULL),
('1631596130-Delta Virus', '0600to1400', ' TND01097 myvehicle  ', ' Delta Virus  ', '2021-09-14', '00:00:42.930', '00:02:02.709', ' 00:01:19.779  ', '06:00:00.000', '06:01:19.000', ' delta.mp4  ', NULL, '', NULL, NULL),
('1631609487-News@19', '0600to1400', 'News', 'News@19', '2021-09-14', '19:00:00.000', '19:30:00.000', '00:30:00', '19:00:00.000', '19:30:00.000', '', NULL, '', NULL, 'fixed'),
('1631609499-News@14', '0600to1400', 'News', 'News@14', '2021-09-14', '14:00:00.000', '14:30:00.000', '00:30:00', '14:00:00.000', '14:30:00.000', '', NULL, '', NULL, 'fixed'),
('1631609515-dummy', '0600to1400', '???', 'dummy', '2021-09-14', '06:01:19.000', '14:00:00.000', '07:58:41', '06:01:19.000', '14:00:00.000', 'dummy', NULL, '', NULL, NULL),
('1631611729-Delta Virus', '2200to0600', ' TND01097 myvehicle  ', ' Delta Virus  ', '2021-09-16', '00:00:42.930', '00:02:02.709', ' 00:01:19.779  ', '06:22:00.000', '06:23:19.000', ' delta.mp4  ', NULL, ' Will ID Come right now with ui min now again and again  ', NULL, NULL),
('1631611768-News@12', '2200to0600', 'News', 'News@12', '2021-09-16', '12:00:00.000', '12:05:00.000', '00:05:00', '12:00:00.000', '12:05:00.000', '', NULL, 'rem news 14', NULL, 'fixed'),
('1631612014-Vayalum Vaazhvum', '2200to0600', '  Balaji    ', ' Vayalum Vaazhvum  ', '2021-09-16', '00:00:22.104', '00:00:51.890', ' 00:00:29.786  ', '12:05:00.000', '12:05:29.000', ' 12.FORMER PM .mp4  ', NULL, '  New Remarks on NEET    ', NULL, NULL),
('1631612023-dummy', '2200to0600', 'dummy', 'dummy', '2021-09-16', '00:00:00.000', '00:30:00.000', '00:30:00', '12:05:29.000', '12:35:29.000', 'dummy', NULL, ' Fill with actual Pgm', NULL, NULL),
('1631612236-dummy', '2200to0600', 'dummy', 'dummy', '2021-09-16', '00:00:00.000', '00:30:00.000', '00:40:00', '00:00:00.000', '00:40:00.000', 'dummy', NULL, ' Fill with actual Pgm', NULL, NULL),
('1631612492-dummy', '0600to1400', 'dummy', 'dummy', '2021-09-14', '00:00:00.000', '00:40:00.000', '00:50:00', '19:30:00.000', '20:20:00.000', 'dummy', NULL, '', NULL, NULL),
('1631613275-dummy', '0600to1400', '???', 'dummy', '2021-09-14', '14:30:00.000', '19:00:00.000', '04:30:00', '14:30:00.000', '19:00:00.000', 'dummy', NULL, 'To be filled', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cuesheet2`
--

CREATE TABLE `cuesheet2` (
  `pgmID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Date_Time_Progname(first 4 chars)\r\n',
  `CueID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Programname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `myDate` date NOT NULL,
  `INpoint` time(3) NOT NULL,
  `OUTpoint` time(3) NOT NULL,
  `Duration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrgMediaPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuesheet2`
--

INSERT INTO `cuesheet2` (`pgmID`, `CueID`, `UserID`, `Programname`, `myDate`, `INpoint`, `OUTpoint`, `Duration`, `filename`, `OrgMediaPath`, `Remarks`) VALUES
('1627580022-who knows what', '0600to1400', 'TND01097 myvehicle', 'Delta Virus', '2021-08-01', '00:00:42.930', '00:02:02.709', '00:01:19.779', 'delta.mp4', NULL, 'Will ID Come right now with ui min now again and again'),
('1627624554-How to get through in NEET', '0600to1400', 'Balaji', 'How to get through in NEET tell me', '2021-07-30', '07:00:00.000', '21:00:00.000', '00:10:06', '03.PM MODI .mp4', NULL, 'New Remarks on NEET'),
('1627625765-Enna Paattu paada', '0600to1400', 'Balaji', 'Enna Paattu paada', '2021-07-30', '07:20:00.000', '21:00:00.000', '00:28:30', '20.TELEMEDICINE APP 0700.mp4', NULL, 'Will ID Come right updated'),
('1627626508-1400 tried', '1400to2200', 'Arul mani guru', '1400 tried', '2021-08-01', '08:00:00.000', '21:00:00.000', '00:55:00', '07.SELECTED TRAIN.mp4', NULL, '14 tried rem'),
('1627628439-22 to 6 program', '2200to0600', 'Balaji 22 to 6', '22 to 6 program vip 22', '2021-07-30', '00:00:42.709', '00:01:33.371', '00:00:50.662', 'CD.mp4', NULL, 'Will ID Come right now with ui min now Z Index no 10 25'),
('1627797377- How to get through in NEET tell me  from: 01:00:00  --to: 21:00:00  ', '1400to2200', ' Balaji  ', 'Vayalum Vaazhvum', '2021-08-01', '00:00:22.104', '00:00:51.890', '00:00:29.786', '12.FORMER PM .mp4', NULL, ' New Remarks on NEET  '),
('1627797502-Viswa film ', '1400to2200', ' fgfgf  ', ' Viswa film  ', '2021-07-27', '06:30:00.000', '08:26:51.000', ' 02:26:51  ', '25.WEATHER.mp4', NULL, ' Red fort  '),
('1627797786-ajax pgm', '1400to2200', 'Chk ajax update', 'ajax pgm', '2021-08-01', '21:00:00.000', '21:00:00.000', '00:22:00', '24.US WILL.mp4', NULL, 'chk update of ajax'),
('1627798270-Viswa film', '1400to2200', '  fgfgf    ', '  Viswa film    test upd', '2021-08-01', '05:13:22.577', '01:01:25.000', '00:00:24', '04.FIN MINISTRY .mp4', NULL, '  Red fort    '),
('1627799268-who knows what', '1400to2200', ' TND01097  ', ' who knows what  ', '2021-07-30', '11:40:00.000', '22:00:00.000', '00:25:00', '21.CORONA.mp4', NULL, ' Will ID Come right now with ui min now again and again  ');

-- --------------------------------------------------------

--
-- Table structure for table `cuesheetname`
--

CREATE TABLE `cuesheetname` (
  `CueID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CueName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cuesheetname`
--

INSERT INTO `cuesheetname` (`CueID`, `CueName`) VALUES
('0600to1400', '0600to1400'),
('1400to2200', '1400to2200'),
('2200to0600', '2200to0600');

-- --------------------------------------------------------

--
-- Table structure for table `cuesheettemplate`
--

CREATE TABLE `cuesheettemplate` (
  `TemplateName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TimeFrom` datetime NOT NULL,
  `TmeTo` datetime NOT NULL,
  `ProgramName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `districtid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`districtid`, `district`, `state`) VALUES
('Adilabad', 'Adilabad', 'TS'),
('Agar Malwa', 'Agar Malwa', 'MP'),
('Agra', 'Agra', 'UP'),
('Ahmedabad', 'Ahmedabad', 'GJ'),
('Ahmednagar', 'Ahmednagar', 'MH'),
('Aizawl', 'Aizawl', 'MZ'),
('Ajmer', 'Ajmer', 'RJ'),
('Akola', 'Akola', 'MH'),
('Alappuzha', 'Alappuzha', 'KL'),
('Aligarh', 'Aligarh', 'UP'),
('Alipurduar', 'Alipurduar', 'WB'),
('Alirajpur', 'Alirajpur', 'MP'),
('Allahabad', 'Allahabad', 'UP'),
('Almora', 'Almora', 'UK'),
('Alwar', 'Alwar', 'RJ'),
('Ambala', 'Ambala', 'HR'),
('Ambedkar Nagar', 'Ambedkar Nagar', 'UP'),
('Amethi (Chatrapati Sahuji Mahraj Nagar)', 'Amethi (Chatrapati Sahuji Mahraj Nagar)', 'UP'),
('Amravati', 'Amravati', 'MH'),
('Amreli', 'Amreli', 'GJ'),
('Amritsar', 'Amritsar', 'PB'),
('Amroha (J.P. Nagar)', 'Amroha (J.P. Nagar)', 'UP'),
('Anand', 'Anand', 'GJ'),
('Anantapur', 'Anantapur', 'AP'),
('Anantnag', 'Anantnag', 'JK'),
('Angul', 'Angul', 'OD'),
('Anjaw', 'Anjaw', 'AR'),
('Anuppur', 'Anuppur', 'MP'),
('Araria', 'Araria', 'BR'),
('Aravalli', 'Aravalli', 'GJ'),
('Ariyalur', 'Ariyalur', 'TN'),
('Arwal', 'Arwal', 'BR'),
('Ashoknagar', 'Ashoknagar', 'MP'),
('Auraiya', 'Auraiya', 'UP'),
('Aurangabad', 'Aurangabad', 'BR'),
('Aurangabad (MH)', 'Aurangabad (MH)', 'MH'),
('Azamgarh', 'Azamgarh', 'UP'),
('Bagalkot', 'Bagalkot', 'KA'),
('Bageshwar', 'Bageshwar', 'UK'),
('Baghpat', 'Baghpat', 'UP'),
('Bahraich', 'Bahraich', 'UP'),
('Bajali', 'Bajali', 'AS'),
('Baksa', 'Baksa', 'AS'),
('Balaghat', 'Balaghat', 'MP'),
('Balangir', 'Balangir', 'OD'),
('Balasore', 'Balasore', 'OD'),
('Ballia', 'Ballia', 'UP'),
('Balod', 'Balod', 'CG'),
('Baloda Bazar', 'Baloda Bazar', 'CG'),
('Balrampur', 'Balrampur', 'CG'),
('Balrampur (UP)', 'Balrampur (UP)', 'UP'),
('Banaskantha', 'Banaskantha', 'GJ'),
('Banda', 'Banda', 'UP'),
('Bandipore', 'Bandipore', 'JK'),
('Banka', 'Banka', 'BR'),
('Bankura', 'Bankura', 'WB'),
('Banswara', 'Banswara', 'RJ'),
('Barabanki', 'Barabanki', 'UP'),
('Baramulla', 'Baramulla', 'JK'),
('Baran', 'Baran', 'RJ'),
('Bareilly', 'Bareilly', 'UP'),
('Bargarh', 'Bargarh', 'OD'),
('Barmer', 'Barmer', 'RJ'),
('Barnala', 'Barnala', 'PB'),
('Barpeta', 'Barpeta', 'AS'),
('Barwani', 'Barwani', 'MP'),
('Bastar', 'Bastar', 'CG'),
('Basti', 'Basti', 'UP'),
('Bathinda', 'Bathinda', 'PB'),
('Beed', 'Beed', 'MH'),
('Begusarai', 'Begusarai', 'BR'),
('Belagavi', 'Belagavi', 'KA'),
('Bellary', 'Bellary', 'KA'),
('Bemetara', 'Bemetara', 'CG'),
('Bengaluru Rural', 'Bengaluru Rural', 'KA'),
('Bengaluru Urban', 'Bengaluru Urban', 'KA'),
('Betul', 'Betul', 'MP'),
('Bhadohi', 'Bhadohi', 'UP'),
('Bhadradri Kothagudem', 'Bhadradri Kothagudem', 'TS'),
('Bhadrak', 'Bhadrak', 'OD'),
('Bhagalpur', 'Bhagalpur', 'BR'),
('Bhandara', 'Bhandara', 'MH'),
('Bharatpur', 'Bharatpur', 'RJ'),
('Bharuch', 'Bharuch', 'GJ'),
('Bhavnagar', 'Bhavnagar', 'GJ'),
('Bhilwara', 'Bhilwara', 'RJ'),
('Bhind', 'Bhind', 'MP'),
('Bhiwani', 'Bhiwani', 'HR'),
('Bhojpur', 'Bhojpur', 'BR'),
('Bhopal', 'Bhopal', 'MP'),
('Bidar', 'Bidar', 'KA'),
('Bijapur', 'Bijapur', 'CG'),
('Bijnor', 'Bijnor', 'UP'),
('Bikaner', 'Bikaner', 'RJ'),
('Bilaspur', 'Bilaspur', 'CG'),
('Bilaspur (HP)', 'Bilaspur (HP)', 'HP'),
('Birbhum', 'Birbhum', 'WB'),
('Bishnupur', 'Bishnupur', 'MN'),
('Biswanath', 'Biswanath', 'AS'),
('Bokaro', 'Bokaro', 'JH'),
('Bongaigaon', 'Bongaigaon', 'AS'),
('Botad', 'Botad', 'GJ'),
('Boudh', 'Boudh', 'OD'),
('Budaun', 'Budaun', 'UP'),
('Budgam', 'Budgam', 'JK'),
('Bulandshahr', 'Bulandshahr', 'UP'),
('Buldhana', 'Buldhana', 'MH'),
('Bundi', 'Bundi', 'RJ'),
('Burdwan (Bardhaman)', 'Burdwan (Bardhaman)', 'WB'),
('Burhanpur', 'Burhanpur', 'MP'),
('Buxar', 'Buxar', 'BR'),
('Cachar', 'Cachar', 'AS'),
('Chamarajanagar', 'Chamarajanagar', 'KA'),
('Chamba', 'Chamba', 'HP'),
('Chamoli', 'Chamoli', 'UK'),
('Champawat', 'Champawat', 'UK'),
('Champhai', 'Champhai', 'MZ'),
('Chandauli', 'Chandauli', 'UP'),
('Chandel', 'Chandel', 'MN'),
('Chandrapur', 'Chandrapur', 'MH'),
('Changlang', 'Changlang', 'AR'),
('Charaideo', 'Charaideo', 'AS'),
('Charkhi Dadri', 'Charkhi Dadri', 'HR'),
('Chatra', 'Chatra', 'JH'),
('Chennai', 'Chennai', 'TN'),
('Chhatarpur', 'Chhatarpur', 'MP'),
('Chhindwara', 'Chhindwara', 'MP'),
('Chhota Udepur', 'Chhota Udepur', 'GJ'),
('Chikballapur', 'Chikballapur', 'KA'),
('Chikkamagaluru', 'Chikkamagaluru', 'KA'),
('Chirang', 'Chirang', 'AS'),
('Chitradurga', 'Chitradurga', 'KA'),
('Chitrakoot', 'Chitrakoot', 'UP'),
('Chittoor', 'Chittoor', 'AP'),
('Chittorgarh', 'Chittorgarh', 'RJ'),
('Churachandpur', 'Churachandpur', 'MN'),
('Churu', 'Churu', 'RJ'),
('Coimbatore', 'Coimbatore', 'TN'),
('Cooch Behar', 'Cooch Behar', 'WB'),
('Cuddalore', 'Cuddalore', 'TN'),
('Cuttack', 'Cuttack', 'OD'),
('Dahod', 'Dahod', 'GJ'),
('Dakshin Dinajpur (South Dinajpur)', 'Dakshin Dinajpur (South Dinajpur)', 'WB'),
('Dakshina Kannada', 'Dakshina Kannada', 'KA'),
('Damoh', 'Damoh', 'MP'),
('Dangs', 'Dangs', 'GJ'),
('Dantewada (South Bastar)', 'Dantewada (South Bastar)', 'CG'),
('Darbhanga', 'Darbhanga', 'BR'),
('Darjeeling', 'Darjeeling', 'WB'),
('Darrang', 'Darrang', 'AS'),
('Datia', 'Datia', 'MP'),
('Dausa', 'Dausa', 'RJ'),
('Davangere', 'Davangere', 'KA'),
('Dehradun', 'Dehradun', 'UK'),
('Deogarh', 'Deogarh', 'OD'),
('Deoghar', 'Deoghar', 'JH'),
('Deoria', 'Deoria', 'UP'),
('Devbhoomi Dwarka', 'Devbhoomi Dwarka', 'GJ'),
('Dewas', 'Dewas', 'MP'),
('Dhalai', 'Dhalai', 'TR'),
('Dhamtari', 'Dhamtari', 'CG'),
('Dhanbad', 'Dhanbad', 'JH'),
('Dhar', 'Dhar', 'MP'),
('Dharmapuri', 'Dharmapuri', 'TN'),
('Dharwad', 'Dharwad', 'KA'),
('Dhemaji', 'Dhemaji', 'AS'),
('Dhenkanal', 'Dhenkanal', 'OD'),
('Dholpur', 'Dholpur', 'RJ'),
('Dhubri', 'Dhubri', 'AS'),
('Dhule', 'Dhule', 'MH'),
('Dibang Valley', 'Dibang Valley', 'AR'),
('Dibrugarh', 'Dibrugarh', 'AS'),
('Dima Hasao', 'Dima Hasao', 'AS'),
('Dimapur', 'Dimapur', 'NL'),
('Dindigul', 'Dindigul', 'TN'),
('Dindori', 'Dindori', 'MP'),
('District1', 'District1', 'XX'),
('District2', 'District2', 'XX'),
('District3', 'District3', 'XX'),
('District4', 'District4', 'XX'),
('Doda', 'Doda', 'JK'),
('Dumka', 'Dumka', 'JH'),
('Dungarpur', 'Dungarpur', 'RJ'),
('Durg', 'Durg', 'CG'),
('East Champaran (Motihari)', 'East Champaran (Motihari)', 'BR'),
('East Garo Hills', 'East Garo Hills', 'ML'),
('East Godavari', 'East Godavari', 'AP'),
('East Jaintia Hills', 'East Jaintia Hills', 'ML'),
('East Kameng', 'East Kameng', 'AR'),
('East Khasi Hills', 'East Khasi Hills', 'ML'),
('East Siang', 'East Siang', 'AR'),
('East Sikkim', 'East Sikkim', 'SK'),
('East Singhbhum', 'East Singhbhum', 'JH'),
('Ernakulam', 'Ernakulam', 'KL'),
('Erode', 'Erode', 'TN'),
('Etah', 'Etah', 'UP'),
('Etawah', 'Etawah', 'UP'),
('Faizabad', 'Faizabad', 'UP'),
('Faridabad', 'Faridabad', 'HR'),
('Faridkot', 'Faridkot', 'PB'),
('Farrukhabad', 'Farrukhabad', 'UP'),
('Fatehabad', 'Fatehabad', 'HR'),
('Fatehgarh Sahib', 'Fatehgarh Sahib', 'PB'),
('Fatehpur', 'Fatehpur', 'UP'),
('Fazilka', 'Fazilka', 'PB'),
('Ferozepur', 'Ferozepur', 'PB'),
('Firozabad', 'Firozabad', 'UP'),
('Gadag', 'Gadag', 'KA'),
('Gadchiroli', 'Gadchiroli', 'MH'),
('Gajapati', 'Gajapati', 'OD'),
('Ganderbal', 'Ganderbal', 'JK'),
('Gandhinagar', 'Gandhinagar', 'GJ'),
('Ganjam', 'Ganjam', 'OD'),
('Garhwa', 'Garhwa', 'JH'),
('Gariyaband', 'Gariyaband', 'CG'),
('Gautam Buddha Nagar', 'Gautam Buddha Nagar', 'UP'),
('Gaya', 'Gaya', 'BR'),
('Ghaziabad', 'Ghaziabad', 'UP'),
('Ghazipur', 'Ghazipur', 'UP'),
('Gir Somnath', 'Gir Somnath', 'GJ'),
('Giridih', 'Giridih', 'JH'),
('Goalpara', 'Goalpara', 'AS'),
('Godda', 'Godda', 'JH'),
('Golaghat', 'Golaghat', 'AS'),
('Gomati', 'Gomati', 'TR'),
('Gonda', 'Gonda', 'UP'),
('Gondia', 'Gondia', 'MH'),
('Gopalganj', 'Gopalganj', 'BR'),
('Gorakhpur', 'Gorakhpur', 'UP'),
('Gumla', 'Gumla', 'JH'),
('Guna', 'Guna', 'MP'),
('Guntur', 'Guntur', 'AP'),
('Gurdaspur', 'Gurdaspur', 'PB'),
('Gurgaon', 'Gurgaon', 'HR'),
('Gwalior', 'Gwalior', 'MP'),
('Hailakandi', 'Hailakandi', 'AS'),
('Hamirpur', 'Hamirpur', 'HP'),
('Hamirpur (UP)', 'Hamirpur (UP)', 'UP'),
('Hanumangarh', 'Hanumangarh', 'RJ'),
('Hapur (Panchsheel Nagar)', 'Hapur (Panchsheel Nagar)', 'UP'),
('Harda', 'Harda', 'MP'),
('Hardoi', 'Hardoi', 'UP'),
('Haridwar', 'Haridwar', 'UK'),
('Hassan', 'Hassan', 'KA'),
('Hathras', 'Hathras', 'UP'),
('Haveri', 'Haveri', 'KA'),
('Hazaribag', 'Hazaribag', 'JH'),
('Hingoli', 'Hingoli', 'MH'),
('Hisar', 'Hisar', 'HR'),
('Hojai', 'Hojai', 'AS'),
('Hooghly', 'Hooghly', 'WB'),
('Hoshangabad', 'Hoshangabad', 'MP'),
('Hoshiarpur', 'Hoshiarpur', 'PB'),
('Howrah', 'Howrah', 'WB'),
('Hyderabad', 'Hyderabad', 'TS'),
('Idukki', 'Idukki', 'KL'),
('Imphal East', 'Imphal East', 'MN'),
('Imphal West', 'Imphal West', 'MN'),
('Indore', 'Indore', 'MP'),
('Jabalpur', 'Jabalpur', 'MP'),
('Jagatsinghapur', 'Jagatsinghapur', 'OD'),
('Jagtial', 'Jagtial', 'TS'),
('Jaipur', 'Jaipur', 'RJ'),
('Jaisalmer', 'Jaisalmer', 'RJ'),
('Jajpur', 'Jajpur', 'OD'),
('Jalandhar', 'Jalandhar', 'PB'),
('Jalaun', 'Jalaun', 'UP'),
('Jalgaon', 'Jalgaon', 'MH'),
('Jalna', 'Jalna', 'MH'),
('Jalore', 'Jalore', 'RJ'),
('Jalpaiguri', 'Jalpaiguri', 'WB'),
('Jammu', 'Jammu', 'JK'),
('Jamnagar', 'Jamnagar', 'GJ'),
('Jamtara', 'Jamtara', 'JH'),
('Jamui', 'Jamui', 'BR'),
('Jangaon', 'Jangaon', 'TS'),
('Janjgir-Champa', 'Janjgir-Champa', 'CG'),
('Jashpur', 'Jashpur', 'CG'),
('Jaunpur', 'Jaunpur', 'UP'),
('Jayashankar Bhoopalpally', 'Jayashankar Bhoopalpally', 'TS'),
('Jehanabad', 'Jehanabad', 'BR'),
('Jhabua', 'Jhabua', 'MP'),
('Jhajjar', 'Jhajjar', 'HR'),
('Jhalawar', 'Jhalawar', 'RJ'),
('Jhansi', 'Jhansi', 'UP'),
('Jharsuguda', 'Jharsuguda', 'OD'),
('Jhunjhunu', 'Jhunjhunu', 'RJ'),
('Jind', 'Jind', 'HR'),
('Jiribam', 'Jiribam', 'MN'),
('Jodhpur', 'Jodhpur', 'RJ'),
('Jogulamba Gadwal', 'Jogulamba Gadwal', 'TS'),
('Jorhat', 'Jorhat', 'AS'),
('Junagadh', 'Junagadh', 'GJ'),
('Kabirdham (Kawardha)', 'Kabirdham (Kawardha)', 'CG'),
('Kachchh', 'Kachchh', 'GJ'),
('Kaimur (Bhabua)', 'Kaimur (Bhabua)', 'BR'),
('Kaithal', 'Kaithal', 'HR'),
('Kakching', 'Kakching', 'MN'),
('Kalaburagi (Gulbarga)', 'Kalaburagi (Gulbarga)', 'KA'),
('Kalahandi', 'Kalahandi', 'OD'),
('Kalimpong', 'Kalimpong', 'WB'),
('Kamareddy', 'Kamareddy', 'TS'),
('Kamjong', 'Kamjong', 'MN'),
('Kamrup', 'Kamrup', 'AS'),
('Kamrup Metropolitan', 'Kamrup Metropolitan', 'AS'),
('Kanchipuram', 'Kanchipuram', 'TN'),
('Kandhamal', 'Kandhamal', 'OD'),
('Kangpokpi', 'Kangpokpi', 'MN'),
('Kangra', 'Kangra', 'HP'),
('Kanker (North Bastar)', 'Kanker (North Bastar)', 'CG'),
('Kannauj', 'Kannauj', 'UP'),
('Kannur', 'Kannur', 'KL'),
('Kanpur Dehat', 'Kanpur Dehat', 'UP'),
('Kanpur Nagar', 'Kanpur Nagar', 'UP'),
('Kanyakumari', 'Kanyakumari', 'TN'),
('Kapurthala', 'Kapurthala', 'PB'),
('Karaikal', 'Karaikal', 'PD'),
('Karauli', 'Karauli', 'RJ'),
('Karbi Anglong', 'Karbi Anglong', 'AS'),
('Kargil', 'Kargil', 'LK'),
('Karimganj', 'Karimganj', 'AS'),
('Karimnagar', 'Karimnagar', 'TS'),
('Karnal', 'Karnal', 'HR'),
('Karur', 'Karur', 'TN'),
('Kasaragod', 'Kasaragod', 'KL'),
('Kathua', 'Kathua', 'JK'),
('Katihar', 'Katihar', 'BR'),
('Katni', 'Katni', 'MP'),
('Kaushambi', 'Kaushambi', 'UP'),
('Kendrapara', 'Kendrapara', 'OD'),
('Kendujhar (Keonjhar)', 'Kendujhar (Keonjhar)', 'OD'),
('Khagaria', 'Khagaria', 'BR'),
('Khammam', 'Khammam', 'TS'),
('Khandwa', 'Khandwa', 'MP'),
('Khargone', 'Khargone', 'MP'),
('Kheda (Nadiad)', 'Kheda (Nadiad)', 'GJ'),
('Khordha', 'Khordha', 'OD'),
('Khowai', 'Khowai', 'TR'),
('Khunti', 'Khunti', 'JH'),
('Kinnaur', 'Kinnaur', 'HP'),
('Kiphire', 'Kiphire', 'NL'),
('Kishanganj', 'Kishanganj', 'BR'),
('Kishtwar', 'Kishtwar', 'JK'),
('Kodagu', 'Kodagu', 'KA'),
('Koderma', 'Koderma', 'JH'),
('Kohima', 'Kohima', 'NL'),
('Kokrajhar', 'Kokrajhar', 'AS'),
('Kolar', 'Kolar', 'KA'),
('Kolasib', 'Kolasib', 'MZ'),
('Kolhapur', 'Kolhapur', 'MH'),
('Kolkata', 'Kolkata', 'WB'),
('Kollam', 'Kollam', 'KL'),
('Komaram Bheem Asifabad', 'Komaram Bheem Asifabad', 'TS'),
('Kondagaon', 'Kondagaon', 'CG'),
('Koppal', 'Koppal', 'KA'),
('Koraput', 'Koraput', 'OD'),
('Korba', 'Korba', 'CG'),
('Korea (Koriya)', 'Korea (Koriya)', 'CG'),
('Kota', 'Kota', 'RJ'),
('Kottayam', 'Kottayam', 'KL'),
('Kozhikode', 'Kozhikode', 'KL'),
('Kra Daadi', 'Kra Daadi', 'AR'),
('Krishna', 'Krishna', 'AP'),
('Krishnagiri', 'Krishnagiri', 'TN'),
('Kulgam', 'Kulgam', 'JK'),
('Kullu', 'Kullu', 'HP'),
('Kupwara', 'Kupwara', 'JK'),
('Kurnool', 'Kurnool', 'AP'),
('Kurukshetra', 'Kurukshetra', 'HR'),
('Kurung Kumey', 'Kurung Kumey', 'AR'),
('Kushinagar (Padrauna)', 'Kushinagar (Padrauna)', 'UP'),
('Lahaul', 'Lahaul', 'HP'),
('Lakhimpur', 'Lakhimpur', 'AS'),
('Lakhimpur - Kheri', 'Lakhimpur - Kheri', 'UP'),
('Lakhisarai', 'Lakhisarai', 'BR'),
('Lalitpur', 'Lalitpur', 'UP'),
('Latehar', 'Latehar', 'JH'),
('Latur', 'Latur', 'MH'),
('Lawngtlai', 'Lawngtlai', 'MZ'),
('Leh', 'Leh', 'LK'),
('Lohardaga', 'Lohardaga', 'JH'),
('Lohit', 'Lohit', NULL),
('Longding', 'Longding', 'AR'),
('Longleng', 'Longleng', 'NL'),
('Lower Dibang Valley', 'Lower Dibang Valley', 'AR'),
('Lower Siang', 'Lower Siang', 'AR'),
('Lower Subansiri', 'Lower Subansiri', 'AR'),
('Lucknow', 'Lucknow', 'UP'),
('Ludhiana', 'Ludhiana', 'PB'),
('Lunglei', 'Lunglei', 'MZ'),
('Madhepura', 'Madhepura', 'BR'),
('Madhubani', 'Madhubani', 'BR'),
('Madurai', 'Madurai', 'TN'),
('Mahabubabad', 'Mahabubabad', 'TS'),
('Mahabubnagar', 'Mahabubnagar', 'TS'),
('Maharajganj', 'Maharajganj', 'UP'),
('Mahasamund', 'Mahasamund', 'CG'),
('Mahe', 'Mahe', 'PD'),
('Mahendragarh', 'Mahendragarh', 'HR'),
('Mahisagar', 'Mahisagar', 'GJ'),
('Mahoba', 'Mahoba', 'UP'),
('Mainpuri', 'Mainpuri', 'UP'),
('Majuli', 'Majuli', 'AS'),
('Malappuram', 'Malappuram', 'KL'),
('Malda', 'Malda', 'WB'),
('Malkangiri', 'Malkangiri', 'OD'),
('Mamit', 'Mamit', 'MZ'),
('Mancherial', 'Mancherial', 'TS'),
('Mandi', 'Mandi', 'HP'),
('Mandla', 'Mandla', 'MP'),
('Mandsaur', 'Mandsaur', 'MP'),
('Mandya', 'Mandya', 'KA'),
('Mansa', 'Mansa', 'PB'),
('Mathura', 'Mathura', 'UP'),
('Mau', 'Mau', 'UP'),
('Mayurbhanj', 'Mayurbhanj', 'OD'),
('Medak', 'Medak', 'TS'),
('Medchal', 'Medchal', 'TS'),
('Meerut', 'Meerut', 'UP'),
('Mehsana', 'Mehsana', 'GJ'),
('Mewat', 'Mewat', 'HR'),
('Mirzapur', 'Mirzapur', 'UP'),
('Moga', 'Moga', 'PB'),
('Mokokchung', 'Mokokchung', 'NL'),
('Mon', 'Mon', 'NL'),
('Moradabad', 'Moradabad', 'UP'),
('Morbi', 'Morbi', 'GJ'),
('Morena', 'Morena', 'MP'),
('Morigaon', 'Morigaon', 'AS'),
('Muktsar', 'Muktsar', 'PB'),
('Mumbai City', 'Mumbai City', 'MH'),
('Mumbai Suburban', 'Mumbai Suburban', 'MH'),
('Mungeli', 'Mungeli', 'CG'),
('Munger (Monghyr)', 'Munger (Monghyr)', 'BR'),
('Murshidabad', 'Murshidabad', 'WB'),
('Muzaffarnagar', 'Muzaffarnagar', 'UP'),
('Muzaffarpur', 'Muzaffarpur', 'BR'),
('Mysuru', 'Mysuru', 'KA'),
('Nabarangpur', 'Nabarangpur', 'OD'),
('Nadia', 'Nadia', 'WB'),
('Nagaon', 'Nagaon', 'AS'),
('Nagapattinam', 'Nagapattinam', 'TN'),
('Nagarkurnool', 'Nagarkurnool', 'TS'),
('Nagaur', 'Nagaur', 'RJ'),
('Nagpur', 'Nagpur', 'MH'),
('Nainital', 'Nainital', 'UK'),
('Nalanda', 'Nalanda', 'BR'),
('Nalbari', 'Nalbari', 'AS'),
('Nalgonda', 'Nalgonda', 'TS'),
('Namakkal', 'Namakkal', 'TN'),
('Namsai', 'Namsai', 'AR'),
('Nanded', 'Nanded', 'MH'),
('Nandurbar', 'Nandurbar', 'MH'),
('Narayanpur', 'Narayanpur', 'CG'),
('Narmada (Rajpipla', 'Narmada (Rajpipla', 'GJ'),
('Narsinghpur', 'Narsinghpur', 'MP'),
('Nashik', 'Nashik', 'MH'),
('Navsari', 'Navsari', 'GJ'),
('Nawada', 'Nawada', 'BR'),
('Nawanshahr (Shahid Bhagat Singh Nagar)', 'Nawanshahr (Shahid Bhagat Singh Nagar)', 'PB'),
('Nayagarh', 'Nayagarh', 'OD'),
('Neemuch', 'Neemuch', 'MP'),
('Nellore', 'Nellore', 'AP'),
('Nilgiris', 'Nilgiris', 'TN'),
('Nirmal', 'Nirmal', 'TS'),
('Nizamabad', 'Nizamabad', 'TS'),
('Noney', 'Noney', 'MN'),
('North 24 Parganas', 'North 24 Parganas', 'WB'),
('North Garo Hills', 'North Garo Hills', 'ML'),
('North Goa', 'North Goa', 'GA'),
('North Sikkim', 'North Sikkim', 'SK'),
('North Tripura', 'North Tripura', 'TR'),
('Nuapada', 'Nuapada', 'OD'),
('Osmanabad', 'Osmanabad', 'MH'),
('Pakur', 'Pakur', 'JH'),
('Palakkad', 'Palakkad', 'KL'),
('Palamu', 'Palamu', 'JH'),
('Palghar', 'Palghar', 'MH'),
('Pali', 'Pali', 'RJ'),
('Palwal', 'Palwal', 'HR'),
('Panchkula', 'Panchkula', 'HR'),
('Panchmahal (Godhra)', 'Panchmahal (Godhra)', 'GJ'),
('Panipat', 'Panipat', 'HR'),
('Panna', 'Panna', 'MP'),
('Papum Par', 'Papum Par', 'AR'),
('Parbhani', 'Parbhani', 'MH'),
('Paschim Medinipur', 'Paschim Medinipur', 'WB'),
('Patan', 'Patan', 'GJ'),
('Pathanamthitta', 'Pathanamthitta', 'KL'),
('Pathankot', 'Pathankot', 'PB'),
('Patiala', 'Patiala', 'PB'),
('Patna', 'Patna', 'BR'),
('Pauri Garhwal', 'Pauri Garhwal', NULL),
('Peddapalli', 'Peddapalli', 'TS'),
('Perambalur', 'Perambalur', 'TN'),
('Peren', 'Peren', 'NL'),
('Phek', 'Phek', 'NL'),
('Pherzawl', 'Pherzawl', 'MN'),
('Pilibhit', 'Pilibhit', 'UP'),
('Pithoragarh', 'Pithoragarh', 'UK'),
('Pondicherry', 'Pondicherry', 'PD'),
('Poonch', 'Poonch', 'JK'),
('Porbandar', 'Porbandar', 'GJ'),
('Prakasam', 'Prakasam', 'AP'),
('Pratapgarh', 'Pratapgarh', 'RJ'),
('Pratapgarh (UP)', 'Pratapgarh (UP)', 'UP'),
('Pudukkottai', 'Pudukkottai', 'TN'),
('Pulwama', 'Pulwama', 'JK'),
('Pune', 'Pune', 'MH'),
('Purba Medinipur', 'Purba Medinipur', 'WB'),
('Puri', 'Puri', 'OD'),
('Purnia', 'Purnia', 'BR'),
('Purulia', 'Purulia', 'WB'),
('RaeBareli', 'RaeBareli', 'UP'),
('Raichur', 'Raichur', 'KA'),
('Raigad', 'Raigad', 'MH'),
('Raigarh', 'Raigarh', 'CG'),
('Raipur', 'Raipur', 'CG'),
('Raisen', 'Raisen', 'MP'),
('Rajanna Sircilla', 'Rajanna Sircilla', 'TS'),
('Rajgarh', 'Rajgarh', 'MP'),
('Rajkot', 'Rajkot', 'GJ'),
('Rajnandgaon', 'Rajnandgaon', 'CG'),
('Rajouri', 'Rajouri', 'JK'),
('Rajsamand', 'Rajsamand', 'RJ'),
('Ramanagara', 'Ramanagara', 'KA'),
('Ramanathapuram', 'Ramanathapuram', 'TN'),
('Ramban', 'Ramban', 'JK'),
('Ramgarh', 'Ramgarh', 'JH'),
('Rampur', 'Rampur', 'UP'),
('Ranchi', 'Ranchi', 'JH'),
('Rangareddy', 'Rangareddy', 'TS'),
('Ratlam', 'Ratlam', 'MP'),
('Ratnagiri', 'Ratnagiri', 'MH'),
('Rayagada', 'Rayagada', 'OD'),
('Reasi', 'Reasi', 'JK'),
('Rewa', 'Rewa', 'MP'),
('Rewari', 'Rewari', 'HR'),
('Ri Bhoi', 'Ri Bhoi', 'ML'),
('Rohtak', 'Rohtak', 'HR'),
('Rohtas', 'Rohtas', 'BR'),
('Rudraprayag', 'Rudraprayag', 'UK'),
('Rupnagar', 'Rupnagar', 'PB'),
('Sabarkantha (Himmatnagar)', 'Sabarkantha (Himmatnagar)', 'GJ'),
('Sagar', 'Sagar', 'MP'),
('Saharanpur', 'Saharanpur', 'UP'),
('Saharsa', 'Saharsa', 'BR'),
('Sahibganj', 'Sahibganj', 'JH'),
('Sahibzada Ajit Singh Nagar (Mohali)', 'Sahibzada Ajit Singh Nagar (Mohali)', 'PB'),
('Saiha', 'Saiha', 'MZ'),
('Salem', 'Salem', 'TN'),
('Samastipur', 'Samastipur', 'BR'),
('Samba', 'Samba', 'JK'),
('Sambalpur', 'Sambalpur', 'OD'),
('Sambhal (Bhim Nagar)', 'Sambhal (Bhim Nagar)', 'UP'),
('Sangareddy', 'Sangareddy', 'TS'),
('Sangli', 'Sangli', 'MH'),
('Sangrur', 'Sangrur', 'PB'),
('Sant Kabir Nagar', 'Sant Kabir Nagar', 'UP'),
('Saran', 'Saran', 'BR'),
('Satara', 'Satara', 'MH'),
('Satna', 'Satna', 'MP'),
('Sawai Madhopur', 'Sawai Madhopur', 'RJ'),
('Sehore', 'Sehore', 'MP'),
('Senapati', 'Senapati', 'MN'),
('Seoni', 'Seoni', 'MP'),
('Sepahijala', 'Sepahijala', 'TR'),
('Seraikela-Kharsawan', 'Seraikela-Kharsawan', 'JH'),
('Serchhip', 'Serchhip', 'MZ'),
('Shahdol', 'Shahdol', 'MP'),
('Shahjahanpur', 'Shahjahanpur', 'UP'),
('Shajapur', 'Shajapur', 'MP'),
('Shamali (Prabuddh Nagar)', 'Shamali (Prabuddh Nagar)', 'UP'),
('Sheikhpura', 'Sheikhpura', 'BR'),
('Sheohar', 'Sheohar', 'BR'),
('Sheopur', 'Sheopur', 'MP'),
('Shimla', 'Shimla', 'HP'),
('Shivamogga', 'Shivamogga', 'KA'),
('Shivpuri', 'Shivpuri', 'MP'),
('Shopian', 'Shopian', 'JK'),
('Shravasti', 'Shravasti', 'UP'),
('Siang', 'Siang', 'AR'),
('Siddharth Nagar', 'Siddharth Nagar', 'UP'),
('Siddipet', 'Siddipet', 'TS'),
('Sidhi', 'Sidhi', 'MP'),
('Sikar', 'Sikar', 'RJ'),
('Simdega', 'Simdega', 'JH'),
('Sindhudurg', 'Sindhudurg', 'MH'),
('Singrauli', 'Singrauli', 'MP'),
('Sirmaur', 'Sirmaur', 'HP'),
('Sirohi', 'Sirohi', 'RJ'),
('Sirsa', 'Sirsa', 'HR'),
('Sitamarhi', 'Sitamarhi', 'BR'),
('Sitapur', 'Sitapur', 'UP'),
('Sivaganga', 'Sivaganga', 'TN'),
('Sivasagar', 'Sivasagar', 'AS'),
('Siwan', 'Siwan', 'BR'),
('Solan', 'Solan', 'HP'),
('Solapur', 'Solapur', 'MH'),
('Sonbhadra', 'Sonbhadra', 'UP'),
('Sonepur', 'Sonepur', 'OD'),
('Sonipat', 'Sonipat', 'HR'),
('Sonitpur', 'Sonitpur', 'AS'),
('South 24 Parganas', 'South 24 Parganas', 'WB'),
('South Garo Hills', 'South Garo Hills', 'ML'),
('South Goa', 'South Goa', 'GA'),
('South Salmara-Mankachar', 'South Salmara-Mankachar', 'AS'),
('South Sikkim', 'South Sikkim', 'SK'),
('South Tripura', 'South Tripura', 'TR'),
('South West Garo Hills', 'South West Garo Hills', 'ML'),
('South West Khasi Hills', 'South West Khasi Hills', 'ML'),
('Sri Ganganagar', 'Sri Ganganagar', 'RJ'),
('Srikakulam', 'Srikakulam', 'AP'),
('Srinagar', 'Srinagar', 'JK'),
('Sukma', 'Sukma', 'CG'),
('Sultanpur', 'Sultanpur', 'UP'),
('Sundargarh', 'Sundargarh', 'OD'),
('Supaul', 'Supaul', 'BR'),
('Surajpur', 'Surajpur', 'CG'),
('Surat', 'Surat', 'GJ'),
('Surendranagar', 'Surendranagar', 'GJ'),
('Surguja', 'Surguja', 'CG'),
('Suryapet', 'Suryapet', 'TS'),
('Tamenglong', 'Tamenglong', 'MN'),
('Tapi (Vyara)', 'Tapi (Vyara)', 'GJ'),
('Tarn Taran', 'Tarn Taran', 'PB'),
('Tawang', 'Tawang', 'AR'),
('Tehri Garhwal', 'Tehri Garhwal', 'UK'),
('Tengnoupal', 'Tengnoupal', 'MN'),
('Thane', 'Thane', 'MH'),
('Thanjavur', 'Thanjavur', 'TN'),
('Theni', 'Theni', 'TN'),
('Thiruvananthapuram', 'Thiruvananthapuram', 'KL'),
('Thoothukudi', 'Thoothukudi', 'TN'),
('Thoubal', 'Thoubal', 'MN'),
('Thrissur', 'Thrissur', 'KL'),
('Tikamgarh', 'Tikamgarh', 'MP'),
('Tinsukia', 'Tinsukia', 'AS'),
('Tirap', 'Tirap', 'AR'),
('Tiruchirappalli', 'Tiruchirappalli', 'TN'),
('Tirunelveli', 'Tirunelveli', 'TN'),
('Tiruppur', 'Tiruppur', 'TN'),
('Tiruvallur', 'Tiruvallur', 'TN'),
('Tiruvannamalai', 'Tiruvannamalai', 'TN'),
('Tiruvarur', 'Tiruvarur', 'TN'),
('Tonk', 'Tonk', 'RJ'),
('Tuensang', 'Tuensang', 'NL'),
('Tumakuru', 'Tumakuru', 'KA'),
('Udaipur', 'Udaipur', 'RJ'),
('Udalguri', 'Udalguri', 'AS'),
('Udham Singh Nagar', 'Udham Singh Nagar', 'UK'),
('Udhampur', 'Udhampur', 'JK'),
('Udupi', 'Udupi', 'KA'),
('Ujjain', 'Ujjain', 'MP'),
('Ukhrul', 'Ukhrul', 'MN'),
('Umaria', 'Umaria', 'MP'),
('Una', 'Una', 'HP'),
('Unakoti', 'Unakoti', 'TR'),
('Unnao', 'Unnao', 'UP'),
('Upper Siang', 'Upper Siang', 'AR'),
('Upper Subansiri', 'Upper Subansiri', 'AR'),
('Uttar Dinajpur', 'Uttar Dinajpur', 'WB'),
('Uttara Kannada (Karwar)', 'Uttara Kannada (Karwar)', 'KA'),
('Uttarkashi', 'Uttarkashi', 'UK'),
('Vadodara', 'Vadodara', 'GJ'),
('Vaishali', 'Vaishali', 'BR'),
('Valsad', 'Valsad', 'GJ'),
('Varanasi', 'Varanasi', 'UP'),
('Vellore', 'Vellore', 'TN'),
('Vidisha', 'Vidisha', 'MP'),
('Vijayapura (Bijapur)', 'Vijayapura (Bijapur)', 'KA'),
('Vikarabad', 'Vikarabad', 'TS'),
('Viluppuram', 'Viluppuram', 'TN'),
('Virudhunagar', 'Virudhunagar', 'TN'),
('Visakhapatnam', 'Visakhapatnam', 'AP'),
('Vizianagaram', 'Vizianagaram', 'AP'),
('Wanaparthy', 'Wanaparthy', 'TS'),
('Warangal (Rural)', 'Warangal (Rural)', 'TS'),
('Warangal (Urban)', 'Warangal (Urban)', 'TS'),
('Wardha', 'Wardha', 'MH'),
('Washim', 'Washim', 'MH'),
('Wayanad', 'Wayanad', 'KL'),
('West Champaran', 'West Champaran', 'BR'),
('West Garo Hills', 'West Garo Hills', 'ML'),
('West Godavari', 'West Godavari', 'AP'),
('West Jaintia Hills', 'West Jaintia Hills', 'ML'),
('West Kamen', 'West Kamen', 'AR'),
('West Karbi Anglong', 'West Karbi Anglong', 'AS'),
('West Khasi Hills', 'West Khasi Hills', 'ML'),
('West Siang', 'West Siang', 'AR'),
('West Sikkim', 'West Sikkim', 'SK'),
('West Singhbhum', 'West Singhbhum', 'JH'),
('West Tripura', 'West Tripura', 'TR'),
('Wokha', 'Wokha', 'NL'),
('Yadadri Bhuvanagiri', 'Yadadri Bhuvanagiri', 'TS'),
('Yadgir', 'Yadgir', 'KA'),
('Yamunanagar', 'Yamunanagar', 'HR'),
('Yanam', 'Yanam', 'PD'),
('Yavatmal', 'Yavatmal', 'MH'),
('YSR Kadapa', 'YSR Kadapa', 'AP'),
('Zunheboto', 'Zunheboto', 'NL');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `skills` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `age` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `skills`, `address`, `designation`, `age`) VALUES
(1, 'K Balaji', 'coding', '178A', 'AD(E) KB', 54),
(2, 'Aman', 'wert', 'rtyui', 'Infor', 23),
(3, 'Arul', 'coding vb.net', 'werty', 'AE', 56),
(4, 'K Balaji', 'hghg', '1234', 'asd', 33),
(5, 'K Balaji', 'rr', 'et', 'Infor', 23),
(6, 'K Balaji', 'coding', '365', 'AD(E)', 45);

-- --------------------------------------------------------

--
-- Table structure for table `finshedprogram`
--

CREATE TABLE `finshedprogram` (
  `FPID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FPName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FPPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOT` date NOT NULL COMMENT 'Date of Telecast',
  `TOT` time NOT NULL COMMENT 'Time of Telecast',
  `Producer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Edittor` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EDITNLE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INpoint` time DEFAULT NULL,
  `OUTpoint` time DEFAULT NULL,
  `Dur` time DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `DOE` date DEFAULT NULL COMMENT 'Date of editing',
  `Source` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Source..like Tape youtube etc',
  `pgmtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finshedprogram`
--

INSERT INTO `finshedprogram` (`FPID`, `FPName`, `FPPath`, `DOT`, `TOT`, `Producer`, `Edittor`, `EDITNLE`, `INpoint`, `OUTpoint`, `Dur`, `Remarks`, `DOE`, `Source`, `pgmtype`) VALUES
('1', 'vayalum Vaazhvum', 'c:/media/vv_ep21.mp4', '2021-05-04', '19:30:27', 'K Balaji', 'R Arul', 'Avid 102', '19:30:27', '20:00:27', '00:00:30', 'Special Episode', '2021-07-22', '', NULL),
('1621491889', 'Pudhu paatu', 'C:fakepathvjs.svg', '2021-05-21', '11:56:00', 'Thol', 'Kappiyan', 'Edius 52', '01:00:22', '31:01:22', '30:00:00', 'New Songs', '2021-07-22', '', NULL),
('1621492855', 'theme music', 'glyphicons-halflings-regular.woff2', '2021-05-21', '12:12:00', 'Thol', 'vadivan', 'Avid 112', '01:00:22', '31:01:22', '30:00:00', 'New Songs', '2021-07-22', '', NULL),
('1621492911', 'theme music', 'bootstrap.min.css', '2021-05-21', '12:12:00', 'Thol', 'vadivan', 'Avid 112', '01:00:22', '31:01:22', '30:00:00', 'New Songs', '2021-07-22', '', NULL),
('1626928181', 'Pudhu paatu p3', 'dmam (2).sql', '2021-07-22', '11:00:00', 'Thol', 'vadivan', 'Edius 52', '01:00:22', '31:01:22', '30:00:00', 'New Songs', '2021-07-22', '', NULL),
('1626932232', 'Pudhu paatu p33', 'cmp_stmt.pdf', '2021-07-25', '12:06:00', 'raj', 'Bhai', 'Avid 112', '01:00:22', '31:01:22', '30:00:00', 'Chk return false', '2021-07-24', 'svg 55', NULL),
('1626932876', 'theme music cut5', 'report_we230421.docx', '2021-07-29', '13:18:00', 'Thol', 'Kappiyan', 'Avid 112', '01:00:22', '31:01:22', '30:00:00', 'For Educational  need', '2021-07-31', 'LIVE', 'InHouse'),
('1627377631', 'Pudhu paatu', 'bg.gif', '2021-07-28', '16:52:00', 'Thol', 'Kappiyan', 'Edius 52', '01:00:22', '31:01:22', '30:00:00', 'For Urgent need', '2021-07-30', 'LIVE', 'PROMO');

-- --------------------------------------------------------

--
-- Table structure for table `fp`
--

CREATE TABLE `fp` (
  `pgmID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Date_Time_Progname(first 4 chars)\r\n',
  `CueID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Programname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `myDate` date NOT NULL,
  `INpoint` time NOT NULL,
  `OUTpoint` time NOT NULL,
  `Duration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProxyPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrgMediaPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fp`
--

INSERT INTO `fp` (`pgmID`, `CueID`, `UserID`, `Programname`, `myDate`, `INpoint`, `OUTpoint`, `Duration`, `ProxyPath`, `OrgMediaPath`, `Remarks`) VALUES
('1627023996-VV', '0600to1400', 'Thol', 'VV', '2021-07-23', '06:00:00', '09:00:00', '30:00', ' ', '', 'Red fort'),
('1627024037-VV', '0600to1400', 'Hussai  Bhain ', 'VV', '2021-07-23', '06:00:00', '09:00:00', '30:00', ' ', '', 'Who will watch'),
('1627404395-amitabh song', '0600to1400', 'RD Burman  ', 'amitabh song', '2021-07-27', '08:26:51', '08:31:18', '00:04:27', 'kabhi_kabhi.mp4 ', '', 'mm'),
('1627404395-Viswa film', '0600to1400', 'fgfgf', 'Viswa film', '2021-07-27', '06:00:00', '08:26:51', '02:26:51', 'viswa.avi', '', 'Red fort'),
('1627578387-devil in the house', '0600to1400', 'TND01097', 'devil in the house', '2021-07-30', '01:00:00', '21:00:00', '20:00', NULL, NULL, 'Will ID Come right'),
('1627580022-who knows what', '0600to1400', 'TND01097', 'who knows what', '2021-07-30', '01:00:00', '22:00:00', '20:00', NULL, NULL, 'Will ID Come right now with ui min now again and again'),
('1627624554-How to get through in NEET', '0600to1400', 'Balaji', 'How to get through in NEET', '2021-07-30', '01:00:00', '21:00:00', '20:00', NULL, NULL, 'New Remarks on NEET');

-- --------------------------------------------------------

--
-- Table structure for table `kendraunit`
--

CREATE TABLE `kendraunit` (
  `UnitID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'D01/R01',
  `StateID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NameofUnit` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'NAME OF THE UNIT',
  `City` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mobile1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mobile2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email of the RNU (Not the administrator)',
  `LandLine` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AdministratorUserID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'The concerned RNU Administrator to be updated through code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kendraunit`
--

INSERT INTO `kendraunit` (`UnitID`, `StateID`, `NameofUnit`, `City`, `Mobile1`, `Mobile2`, `Email`, `LandLine`, `AdministratorUserID`) VALUES
('ANA01', 'AN', 'AIR Port Blair', 'Port Blair', '9933223030', NULL, 'airpbrnu@gmail.com', NULL, NULL),
('APA01', 'AP', 'AIR Vijayawada', 'Vijayawada', '9440112865', NULL, 'gkrau@rediffmail.com', NULL, NULL),
('APA02', 'AP', 'AIR Visakhapatnam', 'Visakhapatnam', '9985997466', NULL, 'mahesh.srinivasa1@gmail.com', NULL, NULL),
('APD01', 'AP', 'DD Vijayawada', 'Vijayawada', '8826525345', NULL, 'rnu.vij@gmail.com	', '0866-2489748', NULL),
('ARA01', 'AR', 'AIR Itanagar', 'Itanagar', '9954545374', NULL, 'rnuitanagar@yahoo.com', NULL, NULL),
('ARD01', 'AR', 'DD Itanagar', 'Itanagar', '9436228327', NULL, 'rnuddkitanagar@gmail.com\r\n', NULL, NULL),
('ASA01', 'AS', 'AIR Dibrugarh', 'Dibrugarh', '9435032258', NULL, 'd_kotoky@hotmail.com', NULL, NULL),
('ASA02', 'AS', 'AIR Guwahati', 'Guwahati', '7978366760', NULL, 'akhilkmishra1@gmail.com', NULL, NULL),
('ASA03', 'AS', 'AIR Silchar', 'Silchar', '9435170932', NULL, 'sanjeev23june@gmail.com', NULL, NULL),
('ASD01', 'AS', 'DD Guwahati', 'Guwahati', '9435418784', NULL, 'rnuddghy@gmail.com', NULL, NULL),
('BRA01', 'BR', 'AIR Patna', 'Patna', '9431023458', NULL, 'rajendra.upadhyaya58@gmail.com', NULL, NULL),
('BRD01', 'BR', 'DD Patna', 'Patna', '9431015879', NULL, 'rnupatna@gmail.com\r\n', NULL, NULL),
('CGA01', 'CG', 'AIR Raipur', 'Raipur', '9424208182', NULL, 'vikalpranjan@gmail.com', NULL, NULL),
('CGD01', 'CG', 'DD Raipur', 'Raipur', '8826065988', NULL, 'rnuraipur@gmail.com', '0771-2284150', NULL),
('DLA01', 'DL', 'AIR Delhi', 'Delhi', NULL, NULL, NULL, NULL, NULL),
('DLD01', 'DL', 'DD News', 'Delhi', NULL, NULL, NULL, NULL, NULL),
('GAA01', 'GA', 'AIR Panaji', 'Panaji', '9873659707', NULL, 'airpanaji@gmail.com', NULL, NULL),
('GAD01', 'GA', 'DD Panaji', 'Panaji', '9422443066', NULL, 'rnuddkpanaji@gmail.com', '0832-2223301/2220159', NULL),
('GJA01', 'GJ', 'AIR Ahmedabad', 'Ahmedabad', '9428806059', NULL, 'devmanibharat@gmail.com\r\n', NULL, NULL),
('GJA02', 'GJ', 'AIR Bhuj\r\n', 'Bhuj', '9737307371', NULL, 'rnubhuj.air@gmail.com\r\n', NULL, NULL),
('GJD01', 'GJ', 'DD Ahmedabad', 'Ahmedabad', '9426513964', NULL, 'samacharahmedabad@gmail.com', '079-26850299', NULL),
('HPA01', 'HP', 'AIR Shimla', 'Shimla', '9418013038', NULL, 'shantal.shishu@yahoo.in', NULL, NULL),
('HPD01', 'HP', 'DD Shimla', 'Shimla', '9418000038', NULL, 'rnuddkshimla@yahoo.com\r\n', NULL, NULL),
('HRD01', 'HR', 'DD Hisar', 'Hisar', '9416040936', NULL, 'ddnewshisar@gmail.com\r\n', NULL, NULL),
('JHA01', 'JH', 'AIR Ranchi', 'Ranchi', '9431103244', NULL, 'p.neeraj1@gmail.com', NULL, NULL),
('JHD01', 'JH', 'DD Ranchi', 'Ranchi', '9431102799', NULL, 'rnuddkranchi@gmail.com diwakariis@gmail.com	\r\n', '0651- 2283139', NULL),
('JKA01', 'JK', 'AIR Jammu', 'Jammu', '9103463713', NULL, 'nehak243@gmail.com', NULL, NULL),
('JKA02', 'JK', 'AIR Srinagar', 'Srinagar', '9419012182', NULL, 'matantary@yahoo.co.in', NULL, NULL),
('JKD01', 'JK', 'DD Jammu', 'Jammu', '9419180842', NULL, 'dogrinews@gmail.com', NULL, NULL),
('JKD02', 'JK', 'DD Srinagar', 'Srinagar', '9419404338', NULL, 'rnusri@gmail.com\r\n', NULL, NULL),
('KAA01', 'KA', 'AIR Bangalore', 'Bangalore', '8317466729', NULL, 'rnubang08@yahoo.com\r\n', NULL, NULL),
('KAA02', 'KA', 'AIR Dharwad', 'Dharwad', '9481730413', NULL, NULL, NULL, NULL),
('KAD01', 'KA', 'DD Bengaluru', 'Bengaluru', '9448490242', NULL, 'chandananews@gmail.com', '080-23439377', NULL),
('KLA01', 'KL', 'AIR Kozhikode', 'Kozhikode\r\n', '9447019773', NULL, 'rnucalicut@gmail.com\r\naircalicut@rediffmail.com', NULL, NULL),
('KLA02', 'KL', 'AIR Thiruvananthapuram', 'Thiruvananthapuram', '9567604865', NULL, 'mayushaairtvm@gmail.com', NULL, NULL),
('KLD01', 'KL', 'DD Thiruvananthapuram', 'Thiruvananthapuram', '9447019773', NULL, 'rnuddktvpm@gmail.com	\r\n', '0471-2730317', NULL),
('LKA01', 'LK', 'AIR Kargil', 'Kargil', '9419012182', NULL, 'air.kargi@gmail.com', NULL, NULL),
('LKA02', 'LK', 'AIR Leh', 'Leh', NULL, NULL, 'rnuleh123@gmail.com\r\nleh@air.org.in\r\n', NULL, NULL),
('LKD01', 'LK', 'DD Leh', 'Leh', '9999901200', NULL, 'rnuleh@gmail.com\r\n', NULL, NULL),
('MHA01', 'MH', 'AIR Aurangabad', 'Aurangabad', '9420692020', NULL, 'rameshjaibhaye@gmail.com\r\n', NULL, NULL),
('MHA02', 'MH', 'AIR Mumbai', 'Mumbai', '9873636754', NULL, 'mzalam0311@gmail.com', NULL, NULL),
('MHA03', 'MH', 'AIR Nagpur', 'Nagpur', '9422146917', NULL, 'rnu2013nagpur@gmail.com', NULL, NULL),
('MHA04', 'MH', 'AIR Pune', 'Pune', '9422548717', NULL, 'nitinkelkar2007@gmail.com', NULL, NULL),
('MHD01', 'MH', 'DD Mumbai', 'Mumbai', '9869260989', NULL, 'rnumumbai2010@gmail.com\r\n', NULL, NULL),
('MLA01', 'ML', 'AIR Shillong', 'Shillong', '9863021553', NULL, 'airshillongnews@gmail.com', NULL, NULL),
('MLD01', 'ML', 'DD Shillong', 'Shillong', '9818835389', NULL, 'rnuddkshillong@gmail.com\r\n', NULL, NULL),
('MNA01', 'MN', 'AIR Imphal', 'Imphal', '9402678759', NULL, 'draishar@gmail.com', NULL, NULL),
('MND01', 'MN', 'DD Imphal', 'Imphal', NULL, NULL, 'ddnewsimphal@gmail.com', NULL, NULL),
('MPA01', 'MP', 'AIR Bhopal', 'Bhopal', '9425016061', NULL, 'samirverma2011@gmail.com\r\n', NULL, NULL),
('MPA02', 'MP', 'AIR Indore', 'Indore', NULL, NULL, NULL, NULL, NULL),
('MPD01', 'MP', 'DD Bhopal', 'Bhopal', '9589943350', '9425006662', '', NULL, NULL),
('MZA01', 'MZ', 'AIR Aizawl', 'Aizawl', '9436120682', NULL, 'ccsubha1947@gmail.com\r\n', NULL, NULL),
('MZD01', 'MZ', 'DD Aizwal', 'Aizwal', '9436140425', NULL, 'ddnewsaizawl@gmail.com', '0389-2361101/2361109', NULL),
('NLA01', 'NL', 'AIR Kohima', 'Kohima', '9436627944', NULL, 'airnewskohima@yahoo.com', NULL, NULL),
('NLD01', 'NL', 'DD Kohima', 'Kohima', '9436001671', NULL, 'ddnewskoh@gmail.com	\r\n', '0370-2227031', NULL),
('ODA01', 'OD', 'AIR Cuttack', 'Cuttack', '9438664193', NULL, 'rnuairctk@gmail.com\r\n', NULL, NULL),
('ODA02', 'OD', 'AIR Sambalpur', 'Sambalpur', '9437171941', NULL, 'snpattnaik@yahoo.com', NULL, NULL),
('ODD01', 'OD', 'DD Bhubaneshwar', 'Bhubaneshwar', '9437489714', NULL, 'rnuddkbbsr@gmail.com', '0674-2301058', NULL),
('PBA01', 'PB', 'AIR Chandigarh', 'Chandigarh', '9417281846', NULL, 'moudgilaks@gmail.com\r\n', NULL, NULL),
('PBD01', 'PB', 'DD Chandigarh', 'Chandigarh', '9888882888', '9463702863', 'rnuddkchd9@gmail.com', NULL, NULL),
('PBD02', 'PB', 'DD Jalandhar', 'Jalandhar', '9417222204', NULL, 'rnuddkjalandhar@yahoo.com\r\n', NULL, NULL),
('PBNS', 'DL', 'PBNS', 'Delhi', NULL, NULL, NULL, NULL, NULL),
('PDA01', 'PD', 'AIR Puducherry', 'Puducherry', '9444943237', NULL, 'acmohan1966@gmail.com', NULL, NULL),
('RJA01', 'RJ', 'AIR Jaipur', 'Jaipur', '9414052368', NULL, 'rnujpr@yahoo.co.in', NULL, NULL),
('RJD01', 'RJ', 'DD Jaipur', 'Jaipur', '9414051285', '9828670030', 'ddnewsjaipur@gmail.com', NULL, NULL),
('SKA01', 'SK', 'AIR Gangtok', 'Gangtok', '9434022602', NULL, 'ajit1966@yahoo.com', NULL, NULL),
('TNA01', 'TN', 'AIR Chennai', 'Chennai', '9444026464', NULL, 'vpalanichamy.air@gmail.com\r\n', NULL, NULL),
('TNA02', 'TN', 'AIR Tiruchirapalli', 'Tiruchirapalli', '9447485182', NULL, 'paramukedaram@gmail.com', NULL, NULL),
('TND01', 'TN', 'DD Chennai', 'Chennai', '9498063162', NULL, 'podhigainews2007@gmail.com', '044-25365992', NULL),
('TRA01', 'TR', 'AIR Agartala', 'Agartala', '9436544716', NULL, 'iisnishith@gmail.com\r\n', NULL, NULL),
('TRD01', 'TR', 'DD Agartala', 'Agartala', '9436168609', NULL, 'ddnewsagartala@gmail.com', '0381-2370076', NULL),
('TSA01', 'TS', 'AIR Hyderabad', 'Hyderabad', '9440404554', NULL, 'suprasanthi.air@gmail.com', NULL, NULL),
('TSD01', 'TS', 'DD Hyderabad', 'Hyderabad', '7382612993', NULL, 'ddnews.hyd@gmail.com', NULL, NULL),
('UKA01', 'UK', 'AIR Dehradun', 'Dehradun', '9424208181', NULL, 'rnudehradun@gmail.com', NULL, NULL),
('UKD01', 'UK', 'DD Dehradun', 'Dehradun', '8171205545', NULL, 'rnuddkdehradun@gmail.com', NULL, NULL),
('UPA01', 'UP', 'AIR Gorakhpur', 'Gorakhpur', '9415013306', NULL, 'airnewsgkp@gmail.com', NULL, NULL),
('UPA02', 'UP', 'AIR Lucknow', 'Lucknow', '9415013306', NULL, 'shuklsk@gmail.com', NULL, NULL),
('UPD01', 'UP', 'DD Lucknow', 'Lucknow', '9415501838', NULL, 'ddnewslko@gmail.com', '0522-2286508', NULL),
('WBA01', 'WB', 'AIR Kolkata', 'Kolkata', '8910297077', NULL, 'jurnosudip@gmail.com', NULL, NULL),
('WBA02', 'WB', 'AIR Kurseong', 'Kurseong', '9434022602', NULL, 'rnukurseong@gmail.com\r\nddo.airksg@gmail.com	\r\n', NULL, NULL),
('WBD01', 'WB', 'DD Kolkata', 'Kolkata', NULL, NULL, 'ddnewskol@gmail.com', NULL, NULL),
('XXA01', 'XX', 'AIR Test RNU', NULL, NULL, NULL, NULL, NULL, NULL),
('XXD01', 'XX', 'DD Test RNU', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `MediaID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'UNITID + PROGTYPE + YYYYMMDD_HHMMSS\r\n',
  `StateID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Index = States.StateID',
  `UserID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INDEX = users.UserID',
  `Kendra` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAMEASUPLOADED` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ORIGINAL FILENAME',
  `IngestType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CasparIngest, FileTransfer',
  `MediaType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'video/audio/pdf/txt/doc etc',
  `MediaExt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '.mp4,.mp3,.mov,.pdf',
  `VideoCodec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VideoBitrate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VideoFPS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VideoResolution` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VideoAspect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AudioCodec` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AudioBitrate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AudioChannels` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AudioSamplingRate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VidQuality` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'MQ',
  `UploadStatus` tinyint DEFAULT '0',
  `Translation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ORIGTAPENUM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGNAME` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROGDIRECTOR` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGPRODUCER` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGARTISTES` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGMUSIC` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGSET` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGEPISODENUM` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGDATEOFPRODUCTION` date DEFAULT NULL COMMENT 'Date of Production',
  `PROGKENDRA` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGEXTERNALAGENCY` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROGTYPE` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Commissioned, In house, Sponsored etc\r\n',
  `PROGGENRE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CULTURAL, SPORTS, DRAMA ETC',
  `PROGCATEGORY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Primary, Secondary',
  `PROGLANGUAGE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROGSYNOPSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PROGGRADATION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LTOTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'LTO-8, LTO9 ETC',
  `LTOID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LTODATE` date NOT NULL,
  `LTOBY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PATHHIGHRES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PATHLOWRES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGEID_HIGHRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGEID_LOWRES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MetaVerifier` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'The Metadata update and verifier',
  `MediaFileTime` datetime DEFAULT NULL COMMENT 'Proxy module will determine the file created time from the media file',
  `ProxyReady` tinyint NOT NULL DEFAULT '0',
  `FilenameProxy1` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FilenameProxy2` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ThumbnailBig` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Big size for desktop',
  `ThumbnailSmall` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Small Size for  mobiles',
  `HouseFormat` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FreeDownload` tinyint NOT NULL DEFAULT '0' COMMENT 'If set to ''1'' it is free for everyone (free downloader) download',
  `Archive` tinyint NOT NULL DEFAULT '0' COMMENT 'Whether the media should be archived or not. 1 or 0',
  `MediaUploadedTime` datetime NOT NULL COMMENT 'On upload success this field must be updated',
  `LastUpdateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VerifyStatus` tinyint NOT NULL DEFAULT '0',
  `VerifiedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'The user who archived and verified the media',
  `VerifiedTime` datetime DEFAULT NULL,
  `senttosocialmedia` tinyint DEFAULT NULL,
  `Remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Favourite` tinyint DEFAULT '0',
  `Deleted` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metatagging`
--

CREATE TABLE `metatagging` (
  `MetaTagID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MediaID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `TagIn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TagOut` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TagDuration` decimal(10,0) DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LastModifiedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `montages`
--

CREATE TABLE `montages` (
  `pgmID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Date_Time_Progname(first 4 chars)\r\n',
  `UserID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Programname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INpoint` time NOT NULL,
  `OUTpoint` time NOT NULL,
  `Duration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromreading` time(3) DEFAULT NULL,
  `toreading` time(3) DEFAULT NULL,
  `ProxyPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrgMediaPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `montages`
--

INSERT INTO `montages` (`pgmID`, `UserID`, `Programname`, `INpoint`, `OUTpoint`, `Duration`, `fromreading`, `toreading`, `ProxyPath`, `OrgMediaPath`, `Remarks`) VALUES
('montage@14', 'TND01097 myvehicle', 'Montage', '14:00:00', '14:00:10', '00:00:10', '14:00:00.000', '14:00:10.000', NULL, NULL, 'Will ID Come right now with ui min now again and again'),
('montage@6am', 'TND01097 myvehicle', 'NEWS', '06:00:00', '06:00:10', '00:00:10', '06:00:00.000', '06:00:10.000', NULL, NULL, 'Will ID Come right now with ui min now again and again');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `pgmID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Date_Time_Progname(first 4 chars)\r\n',
  `UserID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Programname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INpoint` time NOT NULL,
  `OUTpoint` time NOT NULL,
  `Duration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromreading` time(3) DEFAULT NULL,
  `toreading` time(3) DEFAULT NULL,
  `ProxyPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrgMediaPath` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slot` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`pgmID`, `UserID`, `Programname`, `INpoint`, `OUTpoint`, `Duration`, `fromreading`, `toreading`, `ProxyPath`, `OrgMediaPath`, `Remarks`, `slot`) VALUES
('News@10am', 'TND01097 myvehicle', 'NEWS', '10:00:00', '10:15:00', '00:15:00', '10:00:00.000', '10:15:00.000', NULL, NULL, 'Will ID Come right now with ui min now again and again', 'fixed'),
('News@12', 'TND01097 myvehicle', 'NEWS', '12:00:00', '12:05:00', '00:05:00', '12:00:00.000', '12:05:00.000', NULL, NULL, 'Will ID Come right now with ui min now again and again', 'fixed'),
('News@14', 'Balaji', 'NEWS', '14:00:00', '14:30:00', '00:30:00', '14:00:00.000', '14:30:00.000', NULL, NULL, 'New Remarks on NEET', 'fixed'),
('News@19', 'TND01097 myvehicle', 'NEWS', '19:00:00', '19:30:00', '00:30:00', '19:00:00.000', '19:30:00.000', NULL, NULL, 'Will ID Come right now with ui min now again and again', 'fixed'),
('News@22', 'TND01097 myvehicle', 'NEWS', '22:00:00', '22:30:00', '00:30:00', '22:00:00.000', '22:30:00.000', NULL, NULL, 'Will ID Come right now with ui min now again and again', 'fixed'),
('News@7am', 'TND01097 myvehicle', 'NEWS', '07:00:00', '07:15:00', '00:15:00', '07:00:00.000', '07:15:00.000', NULL, NULL, 'Will ID Come right now with ui min now again and again', 'fixed');

-- --------------------------------------------------------

--
-- Table structure for table `primarycat`
--

CREATE TABLE `primarycat` (
  `SNO` int NOT NULL,
  `PriCat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `primarycat`
--

INSERT INTO `primarycat` (`SNO`, `PriCat`) VALUES
(2, 'Animation'),
(3, 'Art-Culture'),
(4, 'Caricature Feature'),
(5, 'Cartoons'),
(6, 'Children'),
(7, 'Entertainment'),
(17, 'Food'),
(8, 'Health'),
(9, 'History'),
(10, 'Media Feature'),
(11, 'Miscellaneous'),
(12, 'News'),
(13, 'Personal Finance'),
(14, 'Religion'),
(15, 'Science & Education'),
(16, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0th bit is LSB. Bit order grows to MSB',
  `Role` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleShortname` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `RoleRemarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CanView` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Page title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleID`, `Role`, `RoleShortname`, `RoleRemarks`, `CanView`) VALUES
('-1', '0000 0000 0000 0000', 'UA', 'Role not yet assigned', 'For activation page'),
('0', '0000 0000 0000 0001', 'ST', 'Stringer', 'upload.php'),
('1', '0000 0000 0000 0010', 'MC', 'Meta Creator', 'metadata.php, metatag.php'),
('10', '0000 0100 0000 0000', 'UL', 'Upload (additional)', ''),
('11', '0000 1000 0000 0000', 'SP', 'NDMS Supporter Role', ''),
('12', '0001 0000 0000 0000', 'DV', 'Developer', ''),
('13', '0010 0000 0000 0000', 'NE', 'News Editor. Cant see Bills and Approval', 'All Of CA minus user and approval'),
('14', '0100 0000 0000 0000', 'BA', 'Billing Assistant', ''),
('2', '0000 0000 0000 0100', 'MD', 'Metatag creator', 'metatag.php'),
('3', '0000 0000 0000 1000', 'AR', 'Archiver', 'archive.php'),
('4', '0000 0000 0001 0000', 'DL', 'downloader', 'download.php'),
('5', '0000 0000 0010 0000', 'SA', 'State RNU Administrator', ''),
('6', '0000 0000 0100 0000', 'CA', 'Central Administrator', ''),
('7', '0000 0000 1000 0000', 'TA', 'Technical Administrator', ''),
('8', '0000 0001 0000 0000', 'FL', 'Free Downloader (freelancer)', 'download.php'),
('9', '0000 0010 0000 0000', 'SM', 'Social Media uploader', 'socialmedia.php');

-- --------------------------------------------------------

--
-- Table structure for table `secondarycat`
--

CREATE TABLE `secondarycat` (
  `SNO` int NOT NULL,
  `SecCat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PrimaryCat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PrimaryCat_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `secondarycat`
--

INSERT INTO `secondarycat` (`SNO`, `SecCat`, `PrimaryCat`, `PrimaryCat_id`) VALUES
(106, 'Animation', 'Animation', 2),
(71, 'Baby Care', 'Children', 6),
(11, 'Book Review', 'Art-Culture', 3),
(12, 'Business', 'News', 12),
(105, 'Caricature', 'Caricature Feature', 4),
(112, 'Cartoons', 'Cartoons', 5),
(21, 'Commercial Art', 'Art-Culture', 3),
(99, 'Corona', 'Health', 8),
(20, 'Crafts', 'Art-Culture', 3),
(22, 'Dance Feature', 'Art-Culture', 3),
(17, 'Discussions', 'News', 12),
(23, 'Docu-Drama', 'Art-Culture', 3),
(82, 'Education', 'Science & Education', 15),
(117, 'Farmers', 'News', 12),
(116, 'Festival', 'News', 12),
(24, 'Fine/Visual Arts', 'Art-Culture', 3),
(87, 'Historical Events', 'History', 9),
(86, 'Historical Places', 'History', 9),
(121, 'Homage', 'News', 12),
(32, 'Individual Poetry recitation', 'Art-Culture', 3),
(14, 'International', 'News', 12),
(16, 'Interviews', 'News', 12),
(61, 'Investments', 'Personal Finance', 13),
(72, 'Kids Care', 'Children', 6),
(15, 'Magazine', 'News', 12),
(111, 'Media Feature', 'Media Feature', 10),
(120, 'Minister', 'News', 12),
(102, 'Miscellaneous', 'Miscellaneous', 11),
(91, 'Movies', 'Entertainment', 7),
(25, 'Music', 'Art-Culture', 3),
(34, 'National', 'News', 12),
(26, 'Paintings', 'Art-Culture', 3),
(114, 'Parties', 'News', 12),
(19, 'Personalities', 'News', 12),
(27, 'Photography', 'Art-Culture', 3),
(28, 'Poetic Symposium', 'Art-Culture', 3),
(119, 'Police', 'News', 12),
(113, 'Politics', 'News', 12),
(52, 'Pregnancy Care', 'Health', 8),
(122, 'Protests', 'News', 12),
(29, 'Realistic Art', 'Art-Culture', 3),
(101, 'Religion', 'Religion', 14),
(18, 'Reportage', 'News', 12),
(97, 'Restaurant', 'Food', 17),
(81, 'Science', 'Science & Education', 15),
(30, 'Sculpture', 'Art-Culture', 3),
(118, 'Seasonal', 'News', 12),
(31, 'Short Enactments', 'Art-Culture', 3),
(52, 'Special', 'Special', 16),
(13, 'Sports', 'News', 12),
(33, 'States', 'News', 12),
(62, 'Stock Market', 'Personal Finance', 13),
(92, 'Television', 'Entertainment', 7),
(115, 'Temple', 'News', 12),
(96, 'Veg Recipes', 'Food', 17),
(51, 'Women\'s Health', 'Health', 8);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `StateID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StateName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`StateID`, `StateName`) VALUES
('AN', 'Andaman and Nicobar'),
('AP', 'Andhra Pradesh'),
('AR', 'Arunachal Pradesh'),
('AS', 'Assam'),
('BR', 'Bihar'),
('CG', 'Chhattisgarh'),
('DL', 'Delhi'),
('GA', 'Goa'),
('GJ', 'Gujarat'),
('HR', 'Haryana'),
('HP', 'Himachal Pradesh'),
('JK', 'Jammu and Kashmir'),
('JH', 'Jharkhand'),
('KA', 'Karnataka'),
('KL', 'Kerala'),
('LK', 'Ladakh'),
('MP', 'Madhya Pradesh'),
('MH', 'Maharashtra'),
('MN', 'Manipur'),
('ML', 'Meghalaya'),
('MZ', 'Mizoram'),
('NL', 'Nagaland'),
('OD', 'Odisha'),
('PD', 'Puducherry'),
('PB', 'Punjab'),
('RJ', 'Rajasthan'),
('SK', 'Sikkim'),
('TN', 'Tamil Nadu'),
('TS', 'Telangana'),
('XX', 'Test State'),
('TR', 'Tripura'),
('UP', 'Uttar Pradesh'),
('UK', 'Uttarakhand'),
('WB', 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `UserID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'UniID+UserIndexNum',
  `UserIndexNum` int DEFAULT NULL COMMENT 'The developer has to calculate this field. This column is redundant. This is being used as a placeholder as info. May be deleted later',
  `StateID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UnitID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RNU Unit ID',
  `RolesAssigned` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bits column.The developer has to set the appropriate bit (from Roles column) and fill this column. Multiple roles will set multiple bits. All tables will get user''s role from this column only',
  `Roles` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'This redundant column will get RoleShortname from ''roles'' table in string form.',
  `ApprovedBy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Approval given for this user by',
  `FullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'name of user',
  `Pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Biodata` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Brief self description about the user and about his equipment etc.',
  `Mobile1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mobile2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `District` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Activation` tinyint(1) NOT NULL DEFAULT '0',
  `UserRequestTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Request Submitted time must be entered',
  `REMARKS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'REMARKS about the User by the Administrator',
  `ActivatedTime` datetime DEFAULT NULL COMMENT 'Approved Time has to be filled after activation',
  `Token` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OTP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Verified` tinyint NOT NULL DEFAULT '0',
  `SECONDARYMAIL` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuesheet`
--
ALTER TABLE `cuesheet`
  ADD PRIMARY KEY (`pgmID`),
  ADD KEY `consCuesheet` (`CueID`);

--
-- Indexes for table `cuesheet2`
--
ALTER TABLE `cuesheet2`
  ADD PRIMARY KEY (`pgmID`),
  ADD KEY `consCuesheet` (`CueID`);

--
-- Indexes for table `cuesheetname`
--
ALTER TABLE `cuesheetname`
  ADD PRIMARY KEY (`CueID`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`districtid`),
  ADD KEY `consdistrictstateid` (`state`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finshedprogram`
--
ALTER TABLE `finshedprogram`
  ADD PRIMARY KEY (`FPID`);

--
-- Indexes for table `fp`
--
ALTER TABLE `fp`
  ADD PRIMARY KEY (`pgmID`),
  ADD KEY `consCuesheet` (`CueID`);

--
-- Indexes for table `kendraunit`
--
ALTER TABLE `kendraunit`
  ADD PRIMARY KEY (`UnitID`),
  ADD UNIQUE KEY `NameofUnit` (`NameofUnit`),
  ADD KEY `constStateIDNewsunit` (`StateID`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`MediaID`),
  ADD KEY `consStateIDMedia` (`StateID`),
  ADD KEY `consUseridmedia` (`UserID`);

--
-- Indexes for table `metatagging`
--
ALTER TABLE `metatagging`
  ADD PRIMARY KEY (`MetaTagID`),
  ADD KEY `consuserIDmetatag` (`UserID`),
  ADD KEY `consMediaIDMetatag` (`MediaID`);
ALTER TABLE `metatagging` ADD FULLTEXT KEY `Tag` (`Tag`);

--
-- Indexes for table `montages`
--
ALTER TABLE `montages`
  ADD PRIMARY KEY (`pgmID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`pgmID`);

--
-- Indexes for table `primarycat`
--
ALTER TABLE `primarycat`
  ADD PRIMARY KEY (`PriCat`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleID`),
  ADD UNIQUE KEY `RoleShortname` (`RoleShortname`);

--
-- Indexes for table `secondarycat`
--
ALTER TABLE `secondarycat`
  ADD PRIMARY KEY (`SecCat`),
  ADD KEY `conspricatseccat` (`PrimaryCat`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`StateID`),
  ADD UNIQUE KEY `StateName` (`StateName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserName`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD KEY `consStateIDStates` (`StateID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cuesheet`
--
ALTER TABLE `cuesheet`
  ADD CONSTRAINT `consCuesheet` FOREIGN KEY (`CueID`) REFERENCES `cuesheetname` (`CueID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
