-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2022 at 09:50 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `securevault`
--

-- --------------------------------------------------------

--
-- Table structure for table `activitylog`
--

CREATE TABLE `activitylog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `action` enum('CREATE','MODIFY','DELETE') COLLATE utf8mb4_polish_ci NOT NULL,
  `objectType` enum('FILE','FOLDER') COLLATE utf8mb4_polish_ci NOT NULL,
  `objectId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filepermissions`
--

CREATE TABLE `filepermissions` (
  `id` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `permission` enum('READ','WRITE','EXECUTE') COLLATE utf8mb4_polish_ci NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `fileId` int(10) UNSIGNED NOT NULL,
  `ownerId` int(10) UNSIGNED DEFAULT NULL,
  `file` mediumblob DEFAULT NULL,
  `fileName` varchar(60) COLLATE utf8_polish_ci DEFAULT NULL,
  `fileUrl` varchar(120) COLLATE utf8_polish_ci NOT NULL,
  `fileSize` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filetags`
--

CREATE TABLE `filetags` (
  `id` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `folderpermissions`
--

CREATE TABLE `folderpermissions` (
  `id` int(11) NOT NULL,
  `folderId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `permission` enum('READ','WRITE','EXECUTE') COLLATE utf8mb4_polish_ci NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foldertags`
--

CREATE TABLE `foldertags` (
  `id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `statusId` int(11) NOT NULL,
  `info` varchar(120) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(10) UNSIGNED NOT NULL,
  `email` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `pass` text COLLATE utf8_polish_ci DEFAULT NULL,
  `uat` text COLLATE utf8_polish_ci DEFAULT NULL,
  `fullName` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `hasAdminPrivileges` tinyint(4) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `dbSpaceTaken` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `email`, `pass`, `uat`, `fullName`, `hasAdminPrivileges`, `status`, `dbSpaceTaken`) VALUES
(1, 'root@root.net', 'ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f', '700ca93b-7eb9-4c9d-b1d7-012c3c03cd66', 'Root', 1, 'accepted', 0),
(6, 'karzel@cos.net', 'ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f', 'b72414fd-9310-4fe7-af49-31d3cfbd69b4', 'Karzel', 0, 'accepted', 0),
(8, 'k@cos.net', 'abc', 'f619c366-ee84-45d9-99e1-828bbd80b8b0', 'costam', 0, 'accepted', 0),
(11, 'kupa@cos.net', 'kupa', '119c7d4f-2136-4df9-a38b-212d9928f428', 'kupa', 1, 'accepted', 0),
(12, 'saszka@cos.net', 'kupa', '0cf388d1-5600-460c-bad8-f276c9ba19a5', 'kupa', 1, 'accepted', 0),
(13, 'miki@cos.net', 'abc', '443634de-15c6-40a0-b0fb-49ee1d7de1e9', 'miki cos', 1, 'accepted', 0),
(26, 'mishaks2007@gmail.com', NULL, '3d556698-c295-4a92-8f62-5ceb7203c1bf', NULL, 1, 'pending', NULL),
(28, 'juliano.frogo@gmail.com', NULL, '89e94a40-d33c-4738-8281-4c3a7c4c9b15', NULL, 1, 'pending', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activitylog`
--
ALTER TABLE `activitylog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filepermissions`
--
ALTER TABLE `filepermissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`fileId`),
  ADD KEY `user_id` (`ownerId`);

--
-- Indexes for table `filetags`
--
ALTER TABLE `filetags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `folderpermissions`
--
ALTER TABLE `folderpermissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `foldertags`
--
ALTER TABLE `foldertags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folder_id` (`folder_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `statusId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `folders`
--
ALTER TABLE `folders`
  ADD CONSTRAINT `folders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `folders` (`id`);

--
-- Constraints for table `foldertags`
--
ALTER TABLE `foldertags`
  ADD CONSTRAINT `foldertags_ibfk_1` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
