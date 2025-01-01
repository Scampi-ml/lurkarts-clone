-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2024 at 01:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `own_lurkarts`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_raffle`
--

CREATE TABLE `active_raffle` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `raffle_id` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `active_raffle`
--

INSERT INTO `active_raffle` (`id`, `channel_id`, `channel_name`, `raffle_id`, `created_at`) VALUES
(1, NULL, 'lurkcards', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `droprate` varchar(255) DEFAULT NULL,
  `burn_points` int(11) DEFAULT NULL,
  `rarity` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `external_filename` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `channel_id`, `channel_name`, `name`, `description`, `droprate`, `burn_points`, `rarity`, `filename`, `external_filename`, `created_at`) VALUES
(1, 121935684, 'abulic', '3 Jaar Twitch Partner', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdzhvZmRrMXVjYWZ6Ynd4YXk4bGpjY2NubDR3ODN3dzNmbzB6dGl2ZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ckUsHYyD7Xpu7hg1wx/giphy.gif', '2024-03-31 01:28:55'),
(2, 80066569, 'mr_dezz', 'Super Coole Dezz', NULL, NULL, NULL, 'normal', NULL, 'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExdXN4bnhrMWdzMWlkNDBnc3pqNmk0Z3VuNmJ5dThnZGxlb245bWJuayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3rmx3mfPWFC8TP5OGI/giphy.gif', '2024-03-31 01:28:55'),
(3, 121935684, 'abulic', 'Snoebulic', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExd2xtdHh5emlndm9wMXN0MWRsbWMzcDBrd252dGM1NmxhcDd0eHBqbCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BPhBW2DpRgjJks3iLN/giphy.gif', '2024-03-31 01:28:55'),
(4, 57117687, 'espe_be', 'Mister Espe', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdWQybzQzcmE1bjJvamhobDQ0a3RzcDJ0ZHJ5Z2x5MmlsMmtxMmlwdiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/z4dKHQIrxfvoUew2Pz/giphy.gif', '2024-03-31 01:28:55'),
(5, 57117687, 'espe_be', 'Crazy Eyed Espe', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdnF0NHhxOGJxaWJka2pyaGg1OXAzYjRhYTY4ajl2bmg4dTEzeGd5OSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/d9Ws0qcwD7soCB6x0Z/giphy.gif', '2024-03-31 01:28:55'),
(6, 57117687, 'espe_be', 'Kung Fu Espe', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdjVhNWFsZDd0dDV2MHJ5dGF0cmMweDl5MTU5bzUxbjl2dmFkOGpreSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/T9O1DVHdl1jcm17rpp/giphy.gif', '2024-03-31 01:28:55'),
(7, 57117687, 'espe_be', 'Don Ju Espe', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcHVtYzV2YTVleWo2d3g3OXljanljdGZoM3B0ZGhtdndxMm55bnpuMyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/NA29efSnGXci1PeK1O/giphy.gif', '2024-03-31 01:28:55'),
(8, 57117687, 'espe_be', 'Happy Espe', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZ3Bna2lsNDJjeGViaTl3M2RwaHdieTBoZGJ5MjdvdXBjaDdxcHl0ZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ZEyNdsgUvSdtegMlI4/giphy.gif', '2024-03-31 01:28:55'),
(9, 57117687, 'espe_be', 'Lucht Gitaar Espe', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZ3FiMGxiN25jY2t1YWZscWhsZGxrb3Z0MzhzenRvbjlkb2RrcmV1OCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/9pH4v264sCv0to8xaz/giphy.gif', '2024-03-31 01:28:55'),
(10, 80066569, 'mr_dezz', 'Dezzkamer', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/hWIv74RXQr7WzVtdvL/giphy.gif', '2024-03-31 01:28:55'),
(11, 96671713, 'frapsel', 'Frappaksel', NULL, NULL, NULL, 'holiday', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExeXY0M28waGtmeWlnMTF5OXJxY2FmaWE2NHU1bG1rbDFscXZ4c201ZiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/mJDL1OC1fzAGFTpV1t/giphy.gif', '2024-03-31 01:28:55'),
(12, 96671713, 'frapsel', 'FrapVis', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdXRqcm56MXZmMm9udmtrNm45c2lxZHBodGc0dXRzMW5yZHV0OW8zaCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Me74gcsttO4ETZrKkx/giphy.gif', '2024-03-31 01:28:55'),
(13, 96671713, 'frapsel', 'FrapJoy', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/mnFbQSV2A2UU8GENxB/giphy.gif', '2024-03-31 01:28:55'),
(14, 121935684, 'abulic', 'AbuEro', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMnBvcjhwZDA1ZHE3ejBnd2QwajV5bm5hYWh5NWVjdGZ6a2k4enRldSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/vbwjmHcuubNSejAkO4/giphy.gif', '2024-03-31 01:28:55'),
(15, 927629631, 'ietiegirl2', 'IetieSanta', NULL, NULL, NULL, 'holiday', NULL, 'https://media.giphy.com/media/oUTWRFrWQ0Hf6V0I9g/giphy.gif', '2024-03-31 01:28:55'),
(16, 927629631, 'ietiegirl2', 'IetieIetie', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/7tkRaUeFGlnHLCD2pV/giphy.gif', '2024-03-31 01:28:55'),
(17, 927629631, 'ietiegirl2', 'IetieMaid', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/RXdb5lFoYGNurJdpD1/giphy.gif', '2024-03-31 01:28:55'),
(18, 927629631, 'ietiegirl2', 'IetieEmo', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/xQgNo4JmjuhXpX10KC/giphy.gif', '2024-03-31 01:28:55'),
(19, 48668213, 'laagvliet', 'Laagvliet Updraft', NULL, NULL, NULL, 'normal', NULL, 'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExdWYwZWo5bWV1NzVqZzd0cXJ2M3o4Z3piMjllcTA0d3hwYml6eXYyYyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Nhq3lliLVHEgUKCaKg/giphy.gif', '2024-03-31 01:28:55'),
(20, 48668213, 'laagvliet', 'Laagvliet Ideale Schoonzoon', NULL, NULL, NULL, 'normal', NULL, 'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExcGkzeTF5cTZmaGk2aXVqYmF6Ymdxa2tmYnp4ZTdxZHpuNzltb202ayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/bQy8YsDVF5R4RFZutz/giphy.gif', '2024-03-31 01:28:55'),
(21, 48668213, 'laagvliet', 'Laagvliet Super Zen', NULL, NULL, NULL, 'normal', NULL, 'https://media4.giphy.com/media/zJcd4eilFEKQJ01R8v/giphy.gif', '2024-03-31 01:28:55'),
(22, 531541730, 'twoosie', 'Twoosie Vis', NULL, NULL, NULL, 'normal', NULL, 'https://media3.giphy.com/media/Rr52w5578gEugpKZGc/giphy.gif', '2024-03-31 01:28:55'),
(23, 531541730, 'twoosie', 'Twoosie Sad', NULL, NULL, NULL, 'normal', NULL, 'https://media1.giphy.com/media/DfZxdGIGDMPh7NKNLj/giphy.gif', '2024-03-31 01:28:55'),
(24, 531541730, 'twoosie', 'Twoosie Fever', NULL, NULL, NULL, 'radiant', NULL, 'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExbnpsaWJkMmpxcGN3dHI1aXdqa255dXI2OHMzOWhrY2Izdnd1eThxeSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/NlwGmf0P6uFLxGyVlJ/giphy.gif', '2024-03-31 01:28:55'),
(25, 531541730, 'twoosie', 'Twoosie Po', NULL, NULL, NULL, 'normal', NULL, 'https://media4.giphy.com/media/qyuWTZfHYA2ciIVWPD/giphy.gif', '2024-03-31 01:28:55'),
(26, 80066569, 'mr_dezz', 'Dezz De Balansman', NULL, NULL, NULL, 'normal', NULL, 'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXI0eGRsajJtaDg5bjhqdDV3c2ZpcTlwYjhpMzdxbHprajJ0NTZhOCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/WqcA7EnVdUuzBuOC9W/giphy.gif', '2024-03-31 01:28:55'),
(27, 61014909, 'annelytics', 'Annelytics Creep', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/1rjt56brqVkFCuuExZ/giphy.gif', '2024-03-31 01:28:55'),
(28, 61014909, 'annelytics', 'Annelytics Power', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/xuf5L1Qi5E7mIJiYcw/giphy.gif', '2024-03-31 01:28:55'),
(29, 61014909, 'annelytics', 'Annelytics Smirky', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/BIvs67S3YVEwq0vJnU/giphy.gif', '2024-03-31 01:28:55'),
(30, 168313211, 'elephantje', 'Elephantje De Hakker', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/SBrdjajwWXMjglBvJA/giphy.gif', '2024-03-31 01:28:55'),
(31, 168313211, 'elephantje', 'Elephantje In Galop', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/t0y2206d2T17AsRiMz/giphy.gif', '2024-03-31 01:28:55'),
(32, 168313211, 'elephantje', 'Elephantje Blowing', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/4CQfQX1Dw2bcqQY5aT/giphy.gif', '2024-03-31 01:28:55'),
(33, 168313211, 'elephantje', 'Elephantje Verleidelijke Blik', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/r6YIDXmlpi5Yq7m7yl/giphy.gif', '2024-03-31 01:28:55'),
(34, 68546404, 'jnoxx', 'jNoxx Silence', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdW9sbjFvazdlYWpibXl4aDN3dWV1MjA4OWxuemtqZmIycTRuczcwNCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/qzb1eZAy7Xp6wEp0Uv/giphy.gif', '2024-03-31 01:28:55'),
(35, 68546404, 'jnoxx', 'jNoxx Finger Guns', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExamJwbnJsbGswaWszbTFkbDh3OHM2dGxzMXB4aG5jdHE3dzVnaGl6MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/377MgTXCT44MRHewM5/giphy.gif', '2024-03-31 01:28:55'),
(36, 68546404, 'jnoxx', 'jNoxx Unit', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdjM3aXM4MnQyODZncmV1dWhud2xlODl6NXdjdDVyZ2Q3ZGN0MzN0byZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/y07gJrbITLOU40837u/giphy.gif', '2024-03-31 01:28:55'),
(37, 68546404, 'jnoxx', 'jNoxx Pretty', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZjN4dGJyd2xtMmJxdmZsemJxZmQ0eDhjaWF5MHA1cjNkcWo2dnhvbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YeiKc7g6DWZTNZZNg0/giphy.gif', '2024-03-31 01:28:55'),
(38, 96671713, 'frapsel', 'Frapsel Default', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbzhkMzVhenFldzR0Y2o1aXk2ZnFqNW14bzQ0aDAxYmM3OWQ5MGxlcSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/9vxkgOx1yleQNutXJK/giphy.gif', '2024-03-31 01:28:55'),
(39, 96671713, 'frapsel', 'Frapsel Bunny', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZjBocDcweTVsaWhvN2dnbnA1ajdxZnN4dHYwdHhsb3NyMGZremwxeiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ttzPgsNddDlPlX3k3I/giphy.gif', '2024-03-31 01:28:55'),
(40, 96671713, 'frapsel', 'Frapchu', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZG50cTJoOGxobXcwOXFwbW5zM3Q4aWEwOHg5eGhvb2kzNnY0bWZhbiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3wO1j4F0KMja6FYnSb/giphy.gif', '2024-03-31 01:28:55'),
(41, 96671713, 'frapsel', 'Frapsel Banhammer', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcDA0NG5pbWZ2YXp4YnU3bGUydG92bXEwZnU3dzd5MjU1NDhwOTQ1ayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YKcIWrdHFoUuhX2l3m/giphy.gif', '2024-03-31 01:28:55'),
(42, 927629631, 'ietiegirl2', 'IetieWild', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExaXM0MDlyd2JtaDVoOHR6cDdva2c4OXdyZWl4N2U2cnpwbGNmZDBvaSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/T6KogZIs4biD5lDCel/giphy.gif', '2024-03-31 01:28:55'),
(43, 927629631, 'ietiegirl2', 'IetieRoar', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYzI1em42Z2xhemh5ZGdnenFlaXZtcDlzbGxiZ2cyNnVraW13cTIzeiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/t43cW2wkzfFHiX2dfg/giphy.gif', '2024-03-31 01:28:55'),
(44, 927629631, 'ietiegirl2', 'IetieCop', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExN3VqYTVsYzltOG9sbHB5bnh6c2VoaDJucTBxa2FudnVtbnBrY3c3bCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/kNwBJJaeKd8OJq75qs/giphy.gif', '2024-03-31 01:28:55'),
(45, 927629631, 'ietiegirl2', 'IetieGrill', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExM3Axdng5bHBnd2phNmtieTMycGYycjFmejhxc2gzNHBlYnlsNXpmeCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/vqg49rvumuFcAXEKUI/giphy.gif', '2024-03-31 01:28:55'),
(46, 927629631, 'ietiegirl2', 'IetiePower', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExc2JjdHgycTR1dmlzam9zMmVtZ2hmOXQ5MDg2Y215MnhxYmUwdGE2MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/0khhlXfCyVn9KsbMmv/giphy.gif', '2024-03-31 01:28:55'),
(47, 927629631, 'ietiegirl2', 'IetieCool', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExdWNrZWw5eXJzOHU0bHI4eDcxeGw1Y21xMGpkczZqcnRvbTBkbTJnZiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/sqA1VO449KcN90IyIs/giphy.gif', '2024-03-31 01:28:55'),
(48, 927629631, 'ietiegirl2', 'Dochter van Hilde', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExeGVvN2FhMnNocjJnbjA1bmM4bTU4anFhdzI1N2Z0cjg3MWpkcjlmdiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/vLEcnYninzIx6lN48r/giphy.gif', '2024-03-31 01:28:55'),
(49, 927629631, 'ietiegirl2', 'IetiePeace', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNmt1N2U0NWwyZXVhejE2azByNDhyczcycHk0eXhsb3ExdWZpN20xcCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/JXk4wgEIzQPbl3fkiz/giphy.gif', '2024-03-31 01:28:55'),
(50, 597601917, 'dikkesvekke', 'DikkeUwu', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcW8yNmtjanQ5ZTRkbWFiM2RuOWViMWE1YjRscXU0NW5tdzZ5cWhmMCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ySFSyRsMCa9Uh9xgn0/giphy.gif', '2024-03-31 01:28:55'),
(51, 597601917, 'dikkesvekke', 'DikkeDuivel', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYjdkYmxqOGJ1eWY0bXhwNmUyMWUyYmJvZWhzeDVudzk5YzZzY3FyayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/4NS1fJBBVjzeubRY1D/giphy.gif', '2024-03-31 01:28:55'),
(52, 597601917, 'dikkesvekke', 'NoenkelJean', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNjdtaHhybDN0NW9kaXhtaXdnYms1cmhvMjl6MnE5aXl0OTlvOGd4YiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3SAYlZp4ODmlvScV7j/giphy.gif', '2024-03-31 01:28:55'),
(53, 597601917, 'dikkesvekke', 'DikkeVic', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcWswNjA2MHJyc3piYWhkM3lubm1weG04cGhtcG41Z21yaHZkMzU0OSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/eyulhbRFdwcep32HM2/giphy.gif', '2024-03-31 01:28:55'),
(54, 597601917, 'dikkesvekke', 'DikkeBanaan', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExaTEwcmkxdW1uYnl1N21jMDgwdXZhM3B3ZGp1OHVjeGRsMzNmNXFyYyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/fKw5nSxmfbZs9BjPEP/giphy.gif', '2024-03-31 01:28:55'),
(55, 597601917, 'dikkesvekke', 'DikkeWurging', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExbzRxMmQ3cXozdTdwMzd2cWRwa3JjcWNmMTU5dmxtcm4yZ3h6NjRqZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/8ktIrILrrfhfiuR6Aa/giphy.gif', '2024-03-31 01:28:55'),
(56, 597601917, 'dikkesvekke', 'DikkeUwuTwee', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExeWY4ZmpqaXJkdjJxam4xdDcxd2dyejhzYmJweDY5ZmFpcHhseXlodiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/5N8WAJuqcEs8rN2uDe/giphy.gif', '2024-03-31 01:28:55'),
(57, 66133267, 'michielvandeweert', 'Michiel and Amber', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZjN4NTRsczFmNTd3bjk4NWowamVtejl1bWs3ZG42czFqaWsxaXoyMyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/1MbJ1j67uH31dAkjHl/giphy.gif', '2024-03-31 01:28:55'),
(58, 66133267, 'michielvandeweert', 'Michiel Doggo', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExeGlub2lrMDdtZG9nenozMG9kOXg4a3pmYWR6ZHBmMnJrc2Z1MnRjdyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/5hK3H1lqamrbljoCZx/giphy.gif', '2024-03-31 01:28:55'),
(59, 66133267, 'michielvandeweert', 'Michiel Motorcycle', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExeTRncDcwMzBpaGp3bDNnZHFlM3Q0YnJ6emR2NmcwZWJoZzVzbzE5byZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/afTWfxQT5LeHF7ocgZ/giphy.gif', '2024-03-31 01:28:55'),
(60, 66133267, 'michielvandeweert', 'Michiel Best streamer', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMDEzaWw3dXgwN2xhZnB5a2x6YWQxc2FxZzE0bGFoc2x0NTR4M2N2ZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/DFos7fbtKawuvx9X8B/giphy.gif', '2024-03-31 01:28:55'),
(61, 66133267, 'michielvandeweert', 'Michiel Kungfu', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExaXM5eWpyOTJudDFoY2J3anh3Y3FseWtuaWJvaHFtcHZxcDFvNzd5bCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/qtUYJ1aweyH1JEKe0I/giphy.gif', '2024-03-31 01:28:55'),
(62, 66133267, 'michielvandeweert', 'Michiel Shht', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMHY0cWIzbjhlaW43bWN0Nncwa2hvYXlkNmIzdjE3cG1nNDYzaWdiaiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/dUJDnF3v0q9JuZ59W4/giphy.gif', '2024-03-31 01:28:55'),
(63, 66133267, 'michielvandeweert', 'Michiel Default', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNGhnbGJpem04dWNqcDlyNnJ3ZnZhMTFzdmJueG03ZnhjOGl3b3FrcCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3wV2uSPRGjEAn63Ead/giphy.gif', '2024-03-31 01:28:55'),
(64, 66133267, 'michielvandeweert', 'Michiel Pointing', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcmF3ZmZmcWN5aGNkM3JuM2hjYW1ycGRubm14d2Y1azJzaWVoYzB1aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Qz4WOTlzcDLv2lqRAR/giphy.gif', '2024-03-31 01:28:55'),
(65, 159890911, 'foxieke', 'Default Foxieke', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/auYSNwERZWLioJYI9R/giphy.gif', '2024-05-22 16:20:39'),
(66, 159890911, 'foxieke', 'Toxic Foxieke', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/36kXblGAjQB0e4aZpR/giphy.gif', '2024-05-22 16:20:39'),
(67, 159890911, 'foxieke', 'Tele Foxieke', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/XqmJEPUJl0zWARXmI6/giphy.gif', '2024-05-22 16:20:39'),
(68, 159890911, 'foxieke', 'Get Carried Foxieke', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/tK0drdkwXFF6dp86rX/giphy.gif', '2024-05-22 16:20:39'),
(69, 159890911, 'foxieke', 'Tijger Foxieke', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/e5K0roOVqvxH7ks9Cp/giphy.gif', '2024-05-22 16:20:39'),
(70, 233498562, 'xlobster_', 'Lobster Dab', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/ngS31dtPLZUywClouI/giphy.gif', '2024-05-22 16:22:54'),
(71, 233498562, 'xlobster_', 'Lobster Mua', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/orGSvzPYPPQud7KjHm/giphy.gif', '2024-05-22 16:22:54'),
(72, 233498562, 'xlobster_', 'Lobster Swag', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/dyORARfHam28zgOVth/giphy.gif', '2024-05-22 16:22:54'),
(73, 233498562, 'xlobster_', 'Flobster', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/OGJoFZhwV0LShd5rbC/giphy.gif', '2024-05-22 16:22:54'),
(74, 233498562, 'xlobster_', 'Lobster Touching Grass', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/qj23OhA2OHswMSNV83/giphy.gif', '2024-05-22 16:22:54'),
(75, 233498562, 'xlobster_', 'Lobster Lobster', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/LuRJKuDe7vmXAYaGrI/giphy.gif', '2024-05-22 16:22:54'),
(76, 233498562, 'xlobster_', 'Lobster Eva', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/CZXv1a8dILZ2oqdUaF/giphy.gif', '2024-05-22 16:22:54'),
(77, 639760939, 'rigor_tv', 'Tovenaar Rigor', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/MpPwDKuUGVaCG2REc7/giphy.gif', '2024-05-22 16:23:48'),
(78, 639760939, 'rigor_tv', 'Bouwvakker Rigor', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/tRmtQcKtbXIlw8wwK8/giphy.gif', '2024-05-22 16:23:48'),
(79, 639760939, 'rigor_tv', 'NPC Rigor', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/Lk72vP7SkPKmnmTTCU/giphy.gif', '2024-05-22 16:23:48'),
(80, 639760939, 'rigor_tv', 'Bunny Rigor', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/3PKIgKdEDfanrUkATQ/giphy.gif', '2024-05-22 16:23:48'),
(81, 639760939, 'rigor_tv', 'Default Rigor', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/abmDIgv2rn5jeX1bQs/giphy.gif', '2024-05-22 16:23:48'),
(82, 639760939, 'rigor_tv', 'Epic Tovenaar Rigor', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/FquL2SjwAJZqDa3VJ2/giphy.gif', '2024-05-22 16:23:48'),
(83, 61014909, 'annelytics', 'Annekillics', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/C899noGQWUHzdZ16uo/giphy.gif', '2024-05-22 16:26:57'),
(84, 61014909, 'annelytics', 'Anne-elfics', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/9L8JiF3MbVdiA8yo1x/giphy.gif', '2024-05-22 16:26:57'),
(85, 61014909, 'annelytics', 'Anneinbrekerics', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/w8ADA7cWLKRmEgxUKj/giphy.gif', '2024-05-22 16:26:57'),
(86, 639760939, 'rigor_tv', 'Trucker Rigor', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/OvPScCnORgr9U7CMFw/giphy.gif', '2024-06-08 11:58:17'),
(87, 18164475, 'naruske', 'Naruske Default', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/Tydj6MgXfOXtURlKqE/giphy.gif', '2024-06-19 13:36:06'),
(88, 18164475, 'naruske', 'Naruske Tractor', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/aUiVOkE0DEAdqeNAcJ/giphy.gif', '2024-06-19 13:36:06'),
(89, 18164475, 'naruske', 'Naruske Swiffer', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/Yy7IAeNjUmYRLvpAgt/giphy.gif', '2024-06-19 13:36:06'),
(90, 18164475, 'naruske', 'Naruske Plechtige Communie', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/O9p3V0yEQGUjeDpiBd/giphy.gif', '2024-06-19 13:36:06'),
(91, 18164475, 'naruske', 'Naruske Rage', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/Fll0W4T83BaJX3VS3f/giphy.gif', '2024-06-19 13:36:06'),
(92, 18164475, 'naruske', 'Naruske Touching Grass', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/UsVEUPs0uUTML774X0/giphy.gif', '2024-06-19 13:36:06'),
(93, 18164475, 'naruske', 'Naruske L', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/ZpDd5L8eHk8cVoj4Zs/giphy.gif', '2024-06-19 13:36:06'),
(94, 31390077, 'megasticky', 'MEGAsticky West-Vlaams', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/Xow8kP6vJa5No66BV6/giphy.gif', '2024-06-19 13:32:16'),
(95, 31390077, 'megasticky', 'MEGAsticky Gym', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/0k4s1SUZ8crIUlouCE/giphy.gif', '2024-06-19 13:32:16'),
(96, 31390077, 'megasticky', 'MEGAsticky BBQ', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/U5mO3qpRX112XgJ9za/giphy.gif', '2024-06-19 13:32:16'),
(97, 31390077, 'megasticky', 'MEGAsticky Tripaloski', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/ZULbEoDka6g0ea84oP/giphy.gif', '2024-06-19 13:32:16'),
(98, 31390077, 'megasticky', 'MEGAsticky BAAAH', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/qeXOFLyl04xhiY87xy/giphy.gif', '2024-06-19 13:32:16'),
(99, 31390077, 'megasticky', 'MEGAsticky 180', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/OGy7T1yQku00jmRrkm/giphy.gif', '2024-06-19 13:32:16'),
(100, 31390077, 'megasticky', 'MEGAsticky Jumpking', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/lkJJh5gXJ0NMWd2rER/giphy.gif', '2024-06-19 13:32:16'),
(101, 31390077, 'megasticky', 'MEGAsticky Victory', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/q8Us6PJBsiRDIPHCZY/giphy.gif', '2024-06-19 13:32:16'),
(102, 31390077, 'megasticky', 'MEGAsticky Soldier76', NULL, NULL, NULL, 'radiant', NULL, 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcnJwMmhxdjM2aXMza3UzYnUycWQ1bjhtN2JsYXNxdGE4ZWRneTE5MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/jvhVWg7TdLbkTUHtWd/giphy.gif', '2024-06-19 13:32:16'),
(103, 121935684, 'abulic', 'AbuFlex', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/yd8vsej4Y0nR1yLqPb/giphy.gif', '2024-06-19 15:52:56'),
(104, 121935684, 'abulic', 'AbuDefault', NULL, NULL, NULL, 'normal', NULL, 'https://media.giphy.com/media/OuiCljYHF2ROU0zorM/giphy.gif', '2024-06-19 15:52:56'),
(105, 28878385, 'scampi_ml', 'TestCard1', NULL, NULL, NULL, 'normal', 'normal.webp', NULL, NULL),
(106, 28878385, 'scampi_ml', 'TestCard2', NULL, NULL, NULL, 'normal', 'normal2.webp', NULL, NULL),
(107, 28878385, 'scampi_ml', 'TestCard3', NULL, NULL, NULL, 'normal', 'normal3.webp', NULL, NULL),
(108, 28878385, 'scampi_ml', 'TestCard4', NULL, NULL, NULL, 'normal', 'normal4.webp', NULL, NULL),
(109, 28878385, 'scampi_ml', 'TestCard5', NULL, NULL, NULL, 'normal', 'normal5.webp', NULL, NULL),
(110, 28878385, 'scampi_ml', 'TestCard6', NULL, NULL, NULL, 'normal', 'normal6.webp', NULL, NULL),
(111, 28878385, 'scampi_ml', 'TestCard7', NULL, NULL, NULL, 'radiant', 'normal7.webp', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `twitch_channel_id` int(11) DEFAULT NULL,
  `discord_server_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`id`, `name`, `twitch_channel_id`, `discord_server_id`) VALUES
(1, 'lurkcards', 1092919398, 1031512335384334336);

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `channel_id`, `name`, `display_name`, `email`) VALUES
(1, 121935684, 'abulic', 'abulic', NULL),
(2, 61014909, 'annelytics', 'annelytics', NULL),
(3, 597601917, 'dikkesvekke', 'DikkeSvekke', NULL),
(4, 168313211, 'elephantje', 'Elephantje', NULL),
(5, 57117687, 'espe_be', 'Espe_be', NULL),
(6, 96671713, 'frapsel', 'Frapsel', NULL),
(7, 927629631, 'ietiegirl2', 'ietiegirl2', NULL),
(8, 68546404, 'jnoxx', 'jNoxx', NULL),
(9, 48668213, 'laagvliet', 'Laagvliet', NULL),
(10, 66133267, 'michielvandeweert', 'MichielVandeweert', NULL),
(11, 80066569, 'mr_dezz', 'mr_DEZZ', NULL),
(12, 531541730, 'twoosie', 'Twoosie', NULL),
(13, 159890911, 'foxieke', 'Foxieke', NULL),
(14, 233498562, 'xlobster_', 'xLobster_', NULL),
(15, 639760939, 'rigor_tv', 'Rigor_tv', NULL),
(16, 31390077, 'megasticky', 'MEGAsticky', NULL),
(17, 18164475, 'naruske', 'Naruske', NULL),
(18, 28878385, 'scampi_ml', 'Scampi_ml', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `raffle_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raffles`
--

CREATE TABLE `raffles` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `raffle_id` int(11) DEFAULT NULL,
  `raffle_start` varchar(255) DEFAULT NULL,
  `raffle_stop` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raffle_burn`
--

CREATE TABLE `raffle_burn` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `msg_id` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raffle_drop`
--

CREATE TABLE `raffle_drop` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `raffle_id` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `msg_id` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raffle_late`
--

CREATE TABLE `raffle_late` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raffle_wins`
--

CREATE TABLE `raffle_wins` (
  `id` int(11) NOT NULL,
  `streamer_id` int(11) DEFAULT NULL,
  `raffle_id` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trade`
--

CREATE TABLE `trade` (
  `id` int(11) NOT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mycard_id` int(11) DEFAULT NULL,
  `mycard_name` varchar(255) DEFAULT NULL,
  `othercard_id` int(11) DEFAULT NULL,
  `othercard_name` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT 'pending',
  `display_name_request` varchar(255) DEFAULT NULL,
  `login_name_request` varchar(255) DEFAULT NULL,
  `display_name_receive` varchar(255) DEFAULT NULL,
  `login_name_receive` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trade`
--

INSERT INTO `trade` (`id`, `channel_name`, `message_id`, `mycard_id`, `mycard_name`, `othercard_id`, `othercard_name`, `result`, `display_name_request`, `login_name_request`, `display_name_receive`, `login_name_receive`, `created_at`, `updated_at`) VALUES
(6, 'scampi_ml', NULL, 0, 'IetieIetie', 0, 'IetieEmo', 'accepted', 'Scampi_ml', 'scampi_ml', 'janvier1985', 'janvier1985', '2024-07-24 10:39:22', '2024-07-24 17:12:49.956657');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `twitch_id` int(11) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `twitch_id`, `login_name`, `display_name`, `points`, `email`, `access_token`, `created_at`) VALUES
(2, 28878385, 'scampi_ml', 'Scampi_ml', 9908, NULL, NULL, NULL),
(3, NULL, 'testuser1', 'Testuser1', 654, NULL, NULL, NULL),
(4, NULL, 'testuser2', 'Testuser2', 654, NULL, NULL, NULL),
(5, NULL, 'testuser3', 'Testuser3', 654, NULL, NULL, NULL),
(6, NULL, 'testuser4', 'Testuser4', 654, NULL, NULL, NULL),
(7, NULL, 'testuser5', 'Testuser5', 654, NULL, NULL, NULL),
(8, NULL, 'testuser6', 'Testuser6', 654, NULL, NULL, NULL),
(9, NULL, 'testuser7', 'Testuser7', 654, NULL, NULL, NULL),
(10, 248142026, 'patteeke', 'patteeke', 15, NULL, NULL, NULL),
(11, 1020483991, 'janvier1985', 'janvier1985', 56246, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_cards`
--

CREATE TABLE `user_cards` (
  `id` int(11) NOT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `raffle_id` varchar(255) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `acquired` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_cards`
--

INSERT INTO `user_cards` (`id`, `login_name`, `display_name`, `channel_name`, `raffle_id`, `card_id`, `card_name`, `acquired`, `created_at`) VALUES
(35, 'scampi_ml', 'Scampi_ml', 'scampi_ml', NULL, 107, 'IetieIetie', 'drop', '2024-07-24 06:23:03'),
(39, 'janvier1985', 'janvier1985', 'scampi_ml', NULL, 109, 'IetieEmo', 'drop', '2024-07-24 06:23:03'),
(40, 'janvier1985', 'janvier1985', 'scampi_ml', NULL, 0, 'IetieIetie', 'trading', '2024-07-24 15:12:49'),
(41, 'Scampi_ml', 'Scampi_ml', 'scampi_ml', NULL, 0, 'IetieEmo', 'trading', '2024-07-24 15:12:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_raffle`
--
ALTER TABLE `active_raffle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffles`
--
ALTER TABLE `raffles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffle_burn`
--
ALTER TABLE `raffle_burn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffle_drop`
--
ALTER TABLE `raffle_drop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffle_late`
--
ALTER TABLE `raffle_late`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raffle_wins`
--
ALTER TABLE `raffle_wins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade`
--
ALTER TABLE `trade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_cards`
--
ALTER TABLE `user_cards`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_raffle`
--
ALTER TABLE `active_raffle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raffles`
--
ALTER TABLE `raffles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raffle_burn`
--
ALTER TABLE `raffle_burn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raffle_drop`
--
ALTER TABLE `raffle_drop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raffle_late`
--
ALTER TABLE `raffle_late`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raffle_wins`
--
ALTER TABLE `raffle_wins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trade`
--
ALTER TABLE `trade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_cards`
--
ALTER TABLE `user_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
