-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2024 at 02:00 AM
-- Server version: 11.5.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u663034616_ilabrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_acc`
--

CREATE TABLE `admin_acc` (
  `admin_id` int(7) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_acc`
--

INSERT INTO `admin_acc` (`admin_id`, `fname`, `lname`, `email`, `password`, `deleted`) VALUES
(21, 'd', 'd', 'd@gmail.com', '$2y$10$wePQxE/.oDo.aUgY4lN6beDr/MSKBmuZPZwY/qg0A1AlAubwBm6RO', 0),
(1222222, 'testtt', 'Sahiol', 'zrephy08@gmail.com', '$2y$10$LxAgGgJf0L.kAopKl9lIj.cLiZWNFy9yTI5E6VxcFov5vXhEIOl/S', 1),
(1234567, 'testtest', 'test', 'zrephy08@gmail.com', '$2y$10$LwYBQz3R2V1fjwG3JMBUE.mj4n8UubHYhjE.94O.KNMSOGM1TK2Jq', 1),
(1500461, 'Jevie', 'Saturre', 'saturre.jevie@gmail.com', '123', 0),
(1901037, 'Aljubehr', 'Sahiol', 'zrephy08@gmail.com', '$2y$10$2nxHtVGylftqBioO.WDWgOWdqVURe4aODiM7p6rLoaPI9vc0ejKoa', 0);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `corporate_author` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `fname`, `lname`, `corporate_author`, `deleted`) VALUES
(11, 'Michael G.', 'Solomonsssz', 'asd', 0),
(12, 'Joyce', 'Farrell', '', 0),
(13, '', '', '3G E-learning', 0),
(14, 'Behrouz', 'Forouzan', '', 0),
(15, 'Doug', 'Lowe', '', 0),
(16, 'Jocelyn ', 'Padallan', '', 0),
(17, 'Rohan S.', 'Sharma', '', 0),
(18, 'Peter', 'Linz', '', 0),
(19, 'Stephane', 'Tuffery', '', 0),
(20, 'Nikhat Raza', 'Khan', '', 0),
(21, 'Shashi', 'Shekhar', '', 0),
(22, 'Frank', 'Tsui', '', 0),
(23, 'Alvin ', 'De Luna', '', 0),
(24, 'Elvis C.', 'Foster', '', 0),
(25, 'Bernie', 'Hogan', '', 0),
(26, 'Carlos', 'Coronel', '', 0),
(27, 'Jacob', 'Jisu Elsa', '', 0),
(28, 'Michael', 'Alexander', '', 0),
(29, 'Joanna Lyn', 'Grama', '', 0),
(30, 'Garrett', 'Eugene', '', 0),
(31, 'Ping', 'Zhang', '', 0),
(32, 'Michael E.', 'Whitman', '', 0),
(33, 'Robert S.', 'Wilson', '', 0),
(34, 'Upinder', 'Singh', '', 0),
(35, 'June J.', 'Parsons', '', 0),
(36, 'Ralph M.', 'Stair', '', 0),
(37, 'Winser', 'Alexander', '', 0),
(38, 'Sumeet', 'Sharma', '', 0),
(39, 'Scott', 'Tilley', '', 0),
(40, 'Sasha', 'Vodnik', '', 0),
(41, 'Sean', 'Oriyano', '', 0),
(42, 'Tim', 'Weilkiens', '', 0),
(43, 'James A.', 'Hall', '', 0),
(44, 'Nitin', 'Upadhyay', '', 0),
(45, 'John W.', 'Satzinger', '', 0),
(46, 'Jill and two others', 'West', '', 0),
(47, 'D.S.', 'Malik', '', 0),
(48, 'Diane ', 'Zak', '', 0),
(49, 'Ingle', 'Vinay K.', '', 0),
(50, 'Jones', 'Bryan A. and two others', '', 0),
(51, 'Robin', 'Turner', '', 0),
(52, 'Corinne', 'Hoisington', '', 0),
(53, 'W.H. and Daniel Linstedt', 'Inmon', '', 0),
(54, 'Charu C.', 'Aggarwal', '', 0),
(55, 'Paul', 'Zikopoulos', '', 0),
(56, 'Mark', 'Ciampa', '', 0),
(57, 'William', 'Hohl', '', 0),
(58, 'Fabio', 'Ganovelli', '', 0),
(59, 'Oliver', 'Villar', '', 0),
(60, 'Jennifer', 'Campbell', '', 0),
(61, 'Clint', 'Eccher', '', 0),
(62, 'Joel', 'Sklar', '', 0),
(63, 'Brad', 'Williams', '', 0),
(64, 'Adair', 'Dingle', '', 0),
(65, 'Ann', 'McHoes', '', 0),
(66, 'John Paul', 'Mueller', '', 0),
(67, 'Kathy', 'Schwalbe', '', 0),
(68, 'Ron', 'Husband', '', 0),
(69, 'Cecil Jose', 'Delfinado', '', 0),
(70, 'George', 'Peck', '', 0),
(71, 'Erik', 'Klimczak', '', 0),
(72, 'Rory', 'Burke', '', 0),
(73, 'Poppy', 'Evans', '', 0),
(74, 'Gary B.', 'Shelly', '', 0),
(75, 'Purna Chandra', 'Biswal', '', 0),
(76, 'M.', 'Govindarajan', '', 0),
(77, 'J.', 'Valvano', '', 0),
(78, 'Susanna S.', 'Epp', '', 0),
(79, 'Philip J.', 'Pratt', '', 0),
(80, 'Keith', 'Cooper', '', 0),
(81, 'Vinay', 'Ingle', '', 0),
(82, 'Ralph', 'Stair', '', 0),
(83, 'Robert', 'Schilling', '', 0),
(84, 'P.', 'Addison', '', 0),
(85, 'Fayez', 'Gebali', '', 0),
(86, '', 'Schneider', '', 0),
(87, 'D.', 'Serpanos', '', 0),
(88, 'K.', 'Irvine', '', 0),
(89, 'B.', 'Porebski', '', 0),
(90, 'Barbara', 'Doyle', '', 0),
(91, 'Sumatra', 'Guha', '', 0),
(92, 'M.P.', 'Hearn', '', 0),
(93, 'U.', 'Ramachandran', '', 0),
(94, 'Timothy', 'O’Leary', '', 0),
(95, 'Janet', 'Prichard', '', 0),
(96, 'S.', 'Umbaugh', '', 0),
(97, 'Sanjit', 'Mitra', '', 0),
(98, 'Alexander', 'Stanoyevitch', '', 0),
(99, 'Kenneth', 'Laudon', '', 0),
(100, 'Lee', 'Cottrell', '', 0),
(101, 'Caroline ', 'Hayes', '', 0),
(102, 'G.', 'Omura', '', 0),
(103, 'Jeffrey', 'Hoffer', '', 0),
(104, '', 'Shuman', '', 0),
(105, '', 'Schach', '', 0),
(106, 'Allen', 'Tucker', '', 0),
(107, 'Hwei', 'Hsu', '', 0),
(108, 'Tony', 'Gaddis', '', 0),
(109, 'Garry', 'Bruton', '', 0),
(110, 'K.', 'Kendall', '', 0),
(111, 'Tri', 'Ha', '', 0),
(112, 'Brian', 'Williams', '', 0),
(113, 'P.', 'Deitel', '', 0),
(114, 'Brian', 'Knittel', '', 0),
(115, 'Andrews', '', '', 0),
(116, '', 'Savitch', '', 0),
(117, 'Jim', 'Shuman', '', 0),
(118, 'C.', 'Botello', '', 0),
(119, 'Humir', 'Hamad', '', 0),
(120, 'H.M.', 'Deitel', '', 0),
(121, 'A.', 'Tanenbaum', '', 0),
(122, '', 'Schneiderman', '', 0),
(123, 'Paulo', 'Diniz', '', 0),
(124, 'L.', 'Garcia', '', 0),
(125, 'I.', 'Chaston', '', 0),
(126, 'B.', 'Blahut', '', 0),
(127, 'P.', 'Carey', '', 0),
(128, 'W.', 'Ulrich', '', 0),
(129, 'Linda', 'Volonino', '', 0),
(130, 'Efraim', 'Turban', '', 0),
(131, 'George', 'Reynolds', '', 0),
(132, 'Alan B.', 'Marcovitz', '', 0),
(133, 'Ric', 'Shreves', '', 0),
(134, 'Joan', 'Van Tassel', '', 0),
(135, 'F.', 'Crane', '', 0),
(136, 'Hoisington', 'Shelly', '', 0),
(137, 'John', 'Vacca', '', 0),
(138, 'R.', 'Dapt', '', 0),
(139, 'Abraham', 'Silberschatz', '', 0),
(140, 'Marmelo V.', 'Abante', '', 0),
(141, 'Andrews', 'J.', '', 0),
(142, 'Jeremy', 'Osborn', '', 0),
(143, 'Jonathan S. ', 'Harbour', '', 0),
(144, 'S.', 'Holzner', '', 0),
(145, 'William B.', 'Sanders', '', 0),
(146, 'Clive M.', 'Maxfield', '', 0),
(147, '', 'Borobczyk', '', 0),
(148, 'David A. ', 'Patterson', '', 0),
(149, 'Derek', 'Lea', '', 0),
(150, 'Stephen', 'Brown', '', 0),
(151, 'Susan R.', 'Bloom', '', 0),
(152, 'Kenton', 'Williston', '', 0),
(153, 'Steven G.', 'Krantz', '', 0),
(154, 'Kevin', 'Ferland', '', 0),
(155, 'Doug ', 'Abbott', '', 0),
(156, 'Katz', '', '', 0),
(157, 'Richards', '', '', 0),
(158, 'Jerome', 'Green', '', 0),
(159, 'D.', 'Deakins', '', 0),
(160, 'Robert', 'Mellor', '', 0),
(161, 'Marvelo V.', 'Abante', '', 0),
(162, 'Brown', 'S.', '', 0),
(163, 'Chris', 'Georgenes', '', 0),
(164, 'A.', 'Sears', '', 0),
(165, 'Alan', 'Charlesworth', '', 0),
(166, '', 'Derakshani', '', 0),
(167, 'Thomas', 'Cormen', '', 0),
(168, 'E.', 'Turban', '', 0),
(169, 'Harprit S', 'Sandhu', '', 0),
(170, 'Michael', 'Ingrasia', '', 0),
(171, 'William R.', 'Stanek', '', 0),
(172, 'Dale', 'Skrien', '', 0),
(173, 'Michael D.', 'Lairson', '', 0),
(174, 'Judi', 'Doolittle', '', 0),
(175, 'Steve', 'Suehring', '', 0),
(176, 'Andy', 'Harris', '', 0),
(177, 'Luke', 'Welling', '', 0),
(178, 'Vikram', 'Vaswani', '', 0),
(179, 'Michael L.', 'Scott', '', 0),
(180, 'Phil', 'Ballard', '', 0),
(181, 'Stamatios', 'Kartalopoulos', '', 0),
(182, 'Bob', 'Hughes', '', 0),
(183, 'R.', 'Galliers', '', 0),
(184, 'Ian', 'Chai', '', 0),
(185, 'J.', 'Satringer', '', 0),
(186, 'Michael', 'Donahoo', '', 0),
(187, 'Andy', 'Macmillan', '', 0),
(188, 'P.', 'Viola', '', 0),
(189, 'R.', 'Pressman', '', 0),
(190, 'William R.', 'Stanek', '', 0),
(191, 'Thomas A.', 'Powell', '', 0),
(192, 'Chuck', 'Sphar', '', 0),
(193, 'Wayne', 'Wolf', '', 0),
(194, 'D. ', 'Lauer', '', 0),
(195, 'Guy', 'Hart-Davis', '', 0),
(196, 'Alexander', 'Meduna', '', 0),
(197, 'Tetsuro', 'Hidaka', '', 0),
(198, 'Dr. Lambert', '', '', 0),
(199, 'Kenneth', '', '', 0),
(200, 'Jason', 'Darby', '', 0),
(201, 'Joel', 'Scambray', '', 0),
(202, 'Michael', 'Palmer', '', 0),
(203, 'Herb', 'Schildt', '', 0),
(204, 'Jese', 'Feiler', '', 0),
(205, '', '', '', 0),
(206, 'Blayne', 'Mayfield', '', 0),
(207, 'M.M.', 'Mano', '', 0),
(208, 'Peter V.', 'Farrell', '', 0),
(209, 'Tereza', 'Flaxman', '', 0),
(210, 'Joseph', 'Brady', '', 0),
(211, 'Myke', 'Predko', '', 0),
(212, 'Kieron N.', 'Dowling', '', 0),
(213, 'Jerald', 'Dela Rosa', '', 0),
(214, 'David', 'Kelton', '', 0),
(215, 'Joshua', 'Humphreys', '', 0),
(216, 'Luis', 'Lopez', '', 0),
(217, 'Julia C.', 'Bradley', '', 0),
(218, 'Richard', 'Johnson', '', 0),
(219, 'James', 'Leach', '', 0),
(220, 'Jon', '', '', 0),
(221, 'Jagger', '', '', 0),
(222, 'Alfred', '', '', 0),
(223, 'Aho', '', '', 0),
(224, 'Brown', '', '', 0),
(225, 'Mark', '', '', 0),
(226, 'Patadia', '', '', 0),
(227, 'Sam', '', '', 0),
(228, 'Dua', '', '', 0),
(229, 'Sanjiv', '', '', 0),
(230, 'Miles', 'Murdocca', '', 0),
(231, 'J. Jamrich', 'Parsons', '', 0),
(232, 'Dolores', 'Wells', '', 0),
(233, 'Curt M.', 'White', '', 0),
(234, 'Adam', 'Drozdek', '', 0),
(235, 'Michael V.', 'Mannino', '', 0),
(236, 'George', 'Reynolds', '', 0),
(237, 'Lambert & Osborne', '', '', 0),
(238, 'Vicki L.', 'Cox', '', 0),
(239, 'Sherry', 'Bishop', '', 0),
(240, 'Medhi', '', '', 0),
(241, 'Joan', 'Casteel', '', 0),
(242, 'Janet', 'Valade', '', 0),
(243, 'Michael', 'Ekedahl', '', 0),
(244, 'Lonnie', 'Bently', '', 0),
(245, 'L.H.', 'Chaney', '', 0),
(246, 'James L.', 'Anotnakos', '', 0),
(247, 'Kenneth', 'Rosen', '', 0),
(248, 'Sunggu', 'Lee', '', 0),
(249, 'D.', 'Miller', '', 0),
(250, 'Bruce F.', 'Katz', '', 0),
(251, 'Troy A.', 'Adair Jr.', '', 0),
(252, 'Serungul', 'Smith-Atakan', '', 0),
(253, 'Cummings, Maeve; Haag, Stephen', '', '', 0),
(254, 'Michael', 'Sipser', '', 0),
(255, 'Martin', 'Schray', '', 0),
(256, 'R.', 'Aviso', '', 0),
(257, 'Jason W.', 'Eckert', '', 0),
(258, 'Jim', 'Shuman', '', 0),
(259, 'Effy', 'Oz', '', 0),
(260, 'Aneesha', 'Bakharia', '', 0),
(261, 'Peter', 'Norton', '', 0),
(262, 'Stephen', 'Burd', '', 0),
(263, 'Ida M.', 'Flynn', '', 0),
(264, 'Larry', 'Nyhoff', '', 0),
(265, 'James', 'Morgan', '', 1),
(266, 'Terry', 'Wohlers', '', 0),
(267, 'Harry', 'Every', '', 0),
(268, 'Guy', 'Lecky-Thompson', '', 0),
(269, 'Schuler', '', '', 0),
(270, 'Bertoline ', '', '', 0),
(271, 'Ober', '', '', 0),
(272, 'Copernicus', 'Pepito', '', 0),
(273, 'Faustino D.', 'Reyes', '', 0),
(274, 'George', 'Maestri', '', 0),
(275, 'Mike', 'Tooley', '', 0),
(276, 'Roger', 'Pressman', '', 0),
(277, 'Sawyer', '', '', 0),
(278, 'Deborah', 'Hinkle', '', 0),
(279, 'James ', 'Leach', '', 0),
(280, 'Vincent', 'Heuring', '', 0),
(281, 'Stephen', 'Haag', '', 0),
(282, 'Robert', 'Sebesta', '', 0),
(283, 'Michael', 'Goodrich', '', 0),
(284, 'Rob', 'Peter', '', 0),
(285, 'Kenneth', 'Rosen', '', 0),
(286, 'Liberty', '', '', 0),
(287, 'David', 'Olson', '', 0),
(288, 'James', 'Cohoon', '', 0),
(289, 'Walter', 'Savitch', '', 0),
(290, 'Morris', 'Mano', '', 0),
(291, 'James', 'O\'Brien', '', 0),
(292, 'Mcleod', '', '', 0),
(293, 'T.', 'O’Leary', '', 0),
(294, 'Greg', 'Gagne', '', 0),
(295, 'Xendal', '', '', 0),
(296, 'James', 'Antonakos', '', 0),
(297, 'Robert Jr.', 'Buchanan', '', 0),
(298, 'Sara', 'Baase', NULL, 0),
(299, 'Stuart', 'Russell', '', 0),
(300, 'George', 'Luger', '', 0),
(301, 'William', 'Stalling', '', 0),
(302, 'Thomas', 'Conolly', '', 0),
(303, 'Bahzad', 'Razavi', '', 0),
(304, 'Scott', 'Guthery', '', 0),
(305, 'Zinaich', 'Rowan', '', 0),
(306, 'Paul', 'Bedell', '', 0),
(307, 'Stephen ', 'Ethier', '', 0),
(308, 'Christine', 'Ethier', '', 0),
(309, 'Gisela', 'Albano', '', 0),
(310, 'Mark', 'Minasi', '', 0),
(311, 'M.', 'Aconta', '', 0),
(312, 'Walter', 'Savitch', '', 0),
(313, 'Dave', 'Mercer', '', 0),
(314, 'Barry', 'Brey', '', 0),
(315, 'Don', 'Jones', '', 0),
(316, 'Brian', 'Lamacchia', '', 0),
(317, 'Robert', 'Sedgewick', '', 0),
(318, 'Jeff W.', 'Durham', '', 0),
(319, 'McClure', '', '', 0),
(320, 'Johnson', 'Ober', '', 0),
(321, 'Carl', 'Hamacher', '', 0),
(322, 'Larry', 'Long', '', 0),
(323, 'Cay', 'Horstmann', '', 0),
(324, 'William', 'Collins', '', 0),
(325, 'Sergio', 'Franco', '', 0),
(326, 'M. Morris', 'Mano', '', 0),
(327, 'Robert', 'Boylestad', '', 0),
(328, 'Peter', 'Abel', '', 0),
(329, 'C.', 'Pepito', '', 0),
(330, 'Daniel', 'Liang', '', 0),
(331, 'Alain', 'Trother', '', 0),
(332, 'Cerd', 'Keiser', '', 0),
(333, 'Haag', '', '', 0),
(334, 'Sarrah', 'Hutchinson', '', 0),
(335, 'Bryan', 'Syverson', '', 0),
(336, 'Simon', 'Bennett', '', 0),
(337, 'David A.', 'Gustafson', '', 0),
(338, 'Douglas', 'Bell', '', 0),
(339, 'M.', 'Barrenechea', '', 0),
(340, 'Kenneth', 'Kendall', '', 0),
(341, 'Gilbert', 'Held', '', 0),
(342, 'Clark', '', '', 0),
(343, 'Randall', 'Nichols', '', 0),
(344, 'Thomas', 'Wu', '', 0),
(345, 'Alice', 'Fischer', '', 0),
(346, 'Kelly', '', '', 0),
(347, 'M.', 'Laubach', '', 0),
(348, 'Leon W.', 'Couch II', '', 0),
(349, 'Sanjit K.', 'Mitra', '', 0),
(350, 'Jennifer', 'Kettell', '', 0),
(351, 'David', 'Plotkin', '', 0),
(352, 'T.', 'Staffer', '', 0),
(353, 'O.', 'Jones', '', 0),
(354, 'Fred', 'Hofstetter', '', 0),
(355, 'R.', 'Cadenhead', '', 0),
(356, 'Moshe', 'Bar', '', 0),
(357, 'Andrew', 'Tanenbaum', '', 0),
(358, 'Stephen', 'Nelson', '', 0),
(359, 'Jason', 'Couchman', '', 0),
(360, 'Anand', 'Adkoli', '', 0),
(361, 'Bradley', 'Brown', '', 0),
(362, 'Eric', 'Ladd', '', 0),
(363, 'Ian', 'Sommerville', '', 0),
(364, 'Anderson', '', '', 0),
(365, 'Kyle', 'MacRae', '', 0),
(366, 'Harley, David, et.al.', '', '', 0),
(367, 'Elaine', 'Weinmenn', '', 0),
(368, 'Nell', 'Dale', '', 0),
(369, 'C.J.', 'Date', '', 0),
(370, 'Jefferis', 'Jones', '', 0),
(371, 'Tom', 'Shaughnessy', '', 0),
(372, 'Richard', 'Berube', '', 0),
(373, 'Jodie', 'Dalgleish', '', 0),
(374, 'Sartaj', 'Sanhi', '', 0),
(375, 'Ramakrishnan', 'Raghu', '', 0),
(376, 'Pappas, Chris Murray, William III', '', '', 0),
(377, 'D.', 'Emberton', '', 0),
(378, 'Johnson', '', '', 0),
(379, 'Michael', 'Smith', '', 0),
(380, 'Bill', 'Ball', '', 0),
(381, 'Susan', 'Hillier', '', 0),
(382, 'Emmett', 'Dulaney', '', 0),
(383, 'Sarah', 'Hutchinson', '', 0),
(384, 'Laudon', 'Kenneth ', '', 0),
(385, 'Rosenblatt', 'Kenneth ', '', 0),
(386, 'Nell', 'Dale', '', 0),
(387, 'Michael', 'Olpin', '', 0),
(388, 'Maria', 'Langer', '', 0),
(389, 'John', 'Hubbard', '', 0),
(390, 'Averill M.', 'Law', '', 0),
(391, 'Charles', 'Harrell', '', 0),
(392, 'Laura', 'Lemay', '', 0),
(393, 'M.', 'Mazidi', '', 0),
(394, 'Marty', 'Paniatowski', '', 0),
(395, 'Herbert', 'Schildt', '', 0),
(396, 'Benoit', 'Marchal', '', 0),
(397, 'David', 'Peal', '', 0),
(398, 'Charles', 'Brooks', '', 0),
(399, 'David', 'Groth', '', 0),
(400, 'Zeff, Robbin Aronson, Brad', '', '', 0),
(401, 'John', 'Albritton', '', 0),
(402, 'Stephen', 'Schach', '', 0),
(403, 'George', 'Beckman', '', 0),
(404, 'Robert', 'Sebesta', '', 0),
(405, 'Milos', 'Ercegovac', '', 0),
(406, 'Greenlaw, Raymond Hepp, Ellen', '', '', 0),
(407, 'R.', 'Gaonkar', '', 0),
(408, 'Nancy', 'Warner', '', 0),
(409, 'Joe', 'Habraken', '', 0),
(410, 'Bill', 'Eager', '', 0),
(411, 'Roderick', 'Smith', '', 0),
(412, 'S.', 'Brusic', '', 0),
(413, 'L.', 'Stanton', '', 0),
(414, 'David', 'Medinets', '', 0),
(415, 'Stanton', 'Luther', '', 0),
(416, 'Scott', 'Warner', '', 0),
(417, 'C.', 'Yatch', '', 0),
(418, 'Nanay', 'Cavender', '', 0),
(419, 'Hy', 'Bender', '', 0),
(420, 'Timothy', 'Gottleber', '', 0),
(421, 'Vladimir', 'Zwass', '', 0),
(422, 'Floyd', 'Fuller', '', 0),
(423, 'Jane', 'Calabria', '', 0),
(424, 'Richard', 'Easlick', '', 0),
(425, 'William', 'Lee', '', 0),
(426, 'Dirk', 'Baldwin', '', 0),
(427, 'Jim', 'Bownan', '', 0),
(428, 'Brian', 'Komar', '', 0),
(429, 'Suc', 'Plumley', '', 0),
(430, 'Roland', 'Go', '', 0),
(431, 'Seiichi', 'Sampei', '', 0),
(432, 'S.', 'Schneberger', '', 0),
(433, 'George W.', 'Anderson', '', 0),
(434, 'D.', 'Montgomery', '', 0),
(435, 'Jerry D.', 'Daniels', '', 0),
(436, 'Winn L.', 'Rosch', '', 0),
(437, 'Elizabeth', 'Castro', '', 0),
(438, 'Garen', 'Grimes', '', 0),
(439, 'Fritz', 'Erickson', '', 0),
(440, 'Paul', 'Gilster', '', 0),
(465, 'John Lee', 'Candelaria', '', 0),
(466, 'Lisandro E.', 'Claudio', '', 0),
(467, 'Prince Patria', 'Aldama', '', 0),
(468, 'Jose Victor', 'Torres', '', 0),
(469, 'John Lee', 'Candelaria', '', 0),
(470, 'Arnel E.', 'Joven', '', 0),
(471, 'Prince Aian G.', 'Villanueva', '', 0),
(472, 'R.A.', 'Pawilen', '', 0),
(473, 'Antonio P.', 'Contreras', '', 0),
(474, 'Diana J.', 'Mendoza', '', 0),
(475, 'Lloyd B.', 'Ranises', '', 0),
(476, 'Vicente C.', 'Villan', '', 0),
(477, 'Vergie', 'Otig', '', 0),
(478, 'Eric', 'Peralta', '', 0),
(479, '', 'Alata', '', 0),
(480, 'Vergie S.', 'Otig', '', 0),
(481, 'Arleigh Ross', 'Dela Cruz', '', 0),
(482, 'Ricardo R.', 'Santos', '', 0),
(483, 'Antonio P.', 'Contreras', '', 0),
(484, 'Carlos P. Jr.', 'Tatel', '', 0),
(485, 'Alvin G.', 'Mejorada', '', 0),
(486, 'Mark', 'Erickson', '', 0),
(487, 'Noel Christian', 'Moratilla', '', 0),
(488, 'Lisandro E.', 'Claudio', '', 0),
(489, 'Prince Patria', 'Aldama', '', 0),
(490, 'Marilu', 'Madrunio', '', 0),
(491, 'Julia T.', 'Wood', '', 0),
(492, 'Marikit T.', 'Uychoco', '', 0),
(493, 'Kathleen S.', 'Verderber', '', 0),
(494, '', '3G Learning', '', 0),
(495, 'John Oliver M.', 'Ramos', '', 0),
(496, 'Paolo Niño M.', 'Valdez', '', 0),
(497, 'Anne Gelene', 'Tobias', '', 0),
(498, 'Simoun Victor', 'Redobaldo', '', 0),
(499, 'Satendra', 'Kumar', '', 0),
(500, 'Marilou S.', 'Syjueco', '', 0),
(501, 'Philippe John', 'Sipacio', '', 0),
(502, 'Shiella D.', 'Tandoc', '', 0),
(503, 'Luijim S.', 'Jose', '', 0),
(504, 'Jaime G.', 'Ang', '', 0),
(505, 'Jesus Z.', 'Menoy', '', 0),
(506, 'Paolo Niño M.', 'Valdez', '', 0),
(507, 'Heather', 'Mangieri', '', 0),
(508, 'Inez', 'Rovegno', '', 0),
(509, 'C.', 'Van Nieuwerburgh', '', 0),
(510, 'Kristi', 'Roth', '', 0),
(511, 'Frances', 'Donnelly', '', 0),
(512, 'Todd', 'Ellenbecker', '', 0),
(513, 'Ryan', 'Gialogo', '', 0),
(514, 'Werner', 'Hoeger', '', 0),
(515, 'Jerome', 'Porto', '', 0),
(516, 'Jitendra', 'Thakur', '', 0),
(517, 'Joy', 'Butler', '', 0),
(518, 'Werner', 'Hoeger', '', 0),
(519, 'Melissa', 'Layne', '', 0),
(520, 'Daniel', 'McLean', '', 0),
(521, 'V.', 'Burton II', '', 0),
(522, 'B.', 'Watnick', '', 0),
(523, 'K.', 'Jones', '', 0),
(524, 'Mark', 'Anthony D.', '', 0),
(525, 'Pauline', 'Boss', '', 0),
(526, 'Daniel', 'Levi', '', 0),
(527, 'Ma. Corazon O.', 'Bustria', '', 0),
(528, 'Javinto', 'Dela Cruz', '', 0),
(529, 'Ma. Lourdes F.', 'Melegrito', '', 0),
(530, 'Ricardo M.', 'Guevara', '', 0),
(531, 'R. M.', 'Guevara', '', 0),
(532, 'Linda A.', 'Mooney', '', 0),
(533, 'Alice', 'Hansen', '', 0),
(534, 'Karl J.', 'Smith', '', 0),
(535, 'Ronatos S.', 'Ballado', '', 0),
(536, 'Ryan V.', 'Dio', '', 0),
(537, 'David', 'Johnson', '', 0),
(538, 'Parmanand', 'Gupta', '', 0),
(539, 'Eduard M.', 'Albay', '', 0),
(540, 'Alvin V.', 'Barcelona', '', 0),
(541, 'Rizalde C.', 'Nocon', '', 0),
(542, 'Lynie', 'Dimasuay', '', 0),
(543, 'J.', 'Keengwe', '', 0),
(544, 'Heather', 'Mangieri', '', 0),
(545, 'Ryan', 'Gialogo', '', 0),
(546, 'Jerome', 'Porto', '', 0),
(547, 'L', 'Dougherty', '', 0),
(548, 'M.', 'Hooper', '', 0),
(549, 'G.', 'Gabera', '', 0),
(550, 'Mark Anthony D.', 'Abenir', '', 0),
(551, 'Pauline', 'Boss', '', 0),
(552, 'Daniel', 'Levi', '', 0),
(553, 'Ma. Corazon O.', 'Bustria', '', 0),
(554, 'Javinto', 'Dela Cruz', '', 0),
(555, 'Ma. Lourdes F.', 'Melegrito', '', 0),
(556, 'Marikit T.', 'Uychoco', '', 0),
(557, 'Allen', 'Montenegro-Gasulas', '', 0),
(558, 'Jesus Z.', 'Menoy', '', 0),
(559, 'Ma. Antonieta', 'Zoleta', '', 0),
(560, 'Philippe John', 'Sipacio', '', 0),
(561, 'Satendra', 'Kumar', '', 0),
(562, 'Marilou S.', 'Syjueco', '', 0),
(563, 'Paolo Niño M.', 'Valdez', '', 0),
(564, 'Bernardo N.', 'Caslib', '', 0),
(565, 'Barbara', 'McKinnon', '', 0),
(566, 'Augusto', 'Aguilla', '', 0),
(567, 'Marion', 'Mendez', '', 0),
(568, 'Noel Christian', 'Moratilla', '', 0),
(569, 'Winston B.', 'Gallinero', '', 0),
(570, 'Marc Oliver', 'Pasco', '', 0),
(571, 'Richard', 'Sandell', '', 0),
(572, 'Myla', 'Arcinas', '', 0),
(573, 'Aleli M.', 'Caraan', '', 0),
(574, 'Roberto', 'Abella', '', 0),
(575, 'Antonio', 'Contreras', '', 0),
(576, 'Ricardo', 'Santos', '', 0),
(577, 'Alvin', 'Mejorada', '', 0),
(578, 'Nazario', 'Cebreros', '', 0),
(579, 'Margarita', 'Saidali', '', 0),
(580, 'Ricardo', 'Guevara', '', 0),
(581, 'C.', 'Van Nieuwerburgh', '', 0),
(582, 'Inez', 'Rovegno', '', 0),
(583, 'Frances', 'Donnelly', '', 0),
(584, 'Kristi', 'Roth', '', 0),
(585, 'Ryan', 'Gialogo', '', 0),
(586, 'Jerome', 'Porto', '', 0),
(587, 'Jitendra', 'Thakur', '', 0),
(588, 'Joy', 'Butler', '', 0),
(589, 'Alata', '', '', 0),
(590, 'Heahter', 'Mangieri', '', 0),
(591, 'Inez', 'Rovegno', '', 0),
(592, 'C.', 'Van Nieuwerburgh', '', 0),
(593, 'Frances', 'Donnelly', '', 0),
(594, 'Todd', 'Ellenbecker', '', 0),
(595, 'Kristi', 'Roth', '', 0),
(596, 'Ryan', 'Gialogo', '', 0),
(597, 'Jerome', 'Porto', '', 0),
(598, 'Jitendra', 'Thakur', '', 0),
(599, 'Joy', 'Butler', '', 0),
(600, 'Fe', 'Tolibas', '', 0),
(601, 'Eric', 'Peralta', '', 0),
(602, 'Bernardo', 'Caslib', '', 0),
(603, 'James', 'Peoples', '', 0),
(604, 'Richard', 'Sandell', '', 0),
(605, 'Elizabeth', 'Urgel', '', 0),
(606, 'Noel Christian', 'Moratilla', '', 0),
(607, 'Aleli', 'Caraan', '', 0),
(608, 'Roberto', 'Abella', '', 0),
(609, 'Ricardo', 'Santos', '', 0),
(610, 'Alvin', 'Mejorada', '', 0),
(611, 'Rhodalyn', 'Wani-Obias', '', 0),
(612, 'Augusto', 'De Viana', '', 0),
(613, 'Ruben', 'Maranan', '', 0),
(614, 'Roselyn', 'Salum', '', 0),
(615, 'Gemma', 'Araneta', '', 0),
(616, 'asdasd', 'asdasd', NULL, 0),
(618, NULL, NULL, 'Justine Tagaan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course` varchar(50) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course`, `created_at`) VALUES
(1, 'BSABE', '2024-11-24'),
(2, 'BS Agriculture', '2024-11-24'),
(3, 'BS Biology', '2024-11-24'),
(4, 'BS Psychology', '2024-11-24'),
(5, 'BS Mathematics', '2024-11-24'),
(6, 'BSSW', '2024-11-24'),
(7, 'AB – English Language', '2024-11-24'),
(8, 'AB POLSCI', '2024-11-24'),
(9, 'BSA', '2024-11-24'),
(10, 'BSMA', '2024-11-24'),
(11, 'BSHM', '2024-11-24'),
(12, 'BSOA', '2024-11-24'),
(13, 'BSBA FM', '2024-11-24'),
(14, 'BSBA HRM', '2024-11-24'),
(15, 'BSBA MM', '2024-11-24'),
(16, 'BSCS', '2024-11-24'),
(17, 'BSIT', '2024-11-24'),
(18, 'BLIS', '2024-11-24'),
(19, 'CRIM', '2024-11-24'),
(20, 'DDM', '2024-11-24'),
(21, 'BEEd', '2024-11-24'),
(22, '(BSEd) Major in Filipino', '2024-11-24'),
(23, '(BSEd) Major in Mathematics', '2024-11-24'),
(24, '(BSEd) Major in English', '2024-11-24'),
(25, '(BSEd) Major in Science', '2024-11-24'),
(26, '(BSEd) Major in Social Studies', '2024-11-24'),
(27, 'BSCE', '2024-11-24'),
(28, 'BSEE', '2024-11-24'),
(29, 'BSMechE', '2024-11-24'),
(30, 'BSMarE', '2024-11-24'),
(31, 'BSMT', '2024-11-24'),
(32, 'BS MedTech', '2024-11-24'),
(33, 'BSN', '2024-11-24'),
(34, 'BSRT', '2024-11-24'),
(35, 'BSBA', '2024-11-24');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `deptname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `deptname`) VALUES
(1, 'Agriculture and Forestry'),
(2, 'Arts and Sciences'),
(3, 'Business and Management'),
(4, 'Computer Studies'),
(5, 'Criminology'),
(6, 'Dentistry'),
(7, 'Education'),
(8, 'Engineering and Technology'),
(9, 'Graduate School'),
(10, 'Maritime Education'),
(11, 'Medical Technology'),
(12, 'Nursing, Midwifery & Radiologic Technology');

-- --------------------------------------------------------

--
-- Table structure for table `holdings`
--

CREATE TABLE `holdings` (
  `hold_id` int(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `accss_num` int(255) NOT NULL,
  `call_num` varchar(255) NOT NULL,
  `published_year` varchar(255) NOT NULL,
  `copies` int(255) NOT NULL,
  `av_copies` int(255) NOT NULL,
  `course` varchar(20) NOT NULL,
  `department` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `holdings`
--

INSERT INTO `holdings` (`hold_id`, `title`, `accss_num`, `call_num`, `published_year`, `copies`, `av_copies`, `course`, `department`, `keyword`, `deleted`) VALUES
(289, 'Understanding the Self', 71, 'Recusandae Cumque e', '1981', 35, 57, 'BSIT', 11, 'Computer', 0),
(290, 'Reading in Philippine History', 87, 'Mollitia dolor tempo', '2004', 66, 54, 'BSBA', 3, 'Excepteur fugiat cul', 0),
(293, 'test test', 15, 'Maxime impedit simi', '1988', 11, 66, 'BSIT', 12, 'Computer', 0);

-- --------------------------------------------------------

--
-- Table structure for table `holdings_authors`
--

CREATE TABLE `holdings_authors` (
  `hold_auth_id` int(11) NOT NULL,
  `hold_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holdings_authors`
--

INSERT INTO `holdings_authors` (`hold_auth_id`, `hold_id`, `author_id`, `created_at`) VALUES
(39, 293, 298, '2024-12-01 14:33:41'),
(40, 293, 105, '2024-12-02 00:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `activity` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL,
  `admin_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `activity`, `timestamp`, `admin_id`) VALUES
(0001, 'New holding added: Title - 1212.', '2024-11-12 05:21:03', 1901037),
(0008, 'Holding updated: Title - testtt.', '2024-11-12 05:57:59', 1901037),
(0010, 'Holding deleted: Holding Id - 001132.', '2024-11-12 06:04:41', 1901037),
(0011, 'Holding updated: Title - Clean Code: A Handbook of Agile Software Craftsmanship.', '2024-11-12 06:13:53', 1901037),
(0012, 'Holding deleted: Holding Id - 000004.', '2024-11-12 06:22:01', 1901037),
(0013, 'Holding deleted: Holding Id - 000006.', '2024-11-12 06:22:09', 1901037),
(0016, 'New author added: Name - test testt.', '2024-11-12 06:34:50', 1901037),
(0017, 'Author updated: Name - test testting.', '2024-11-12 06:42:09', 1901037),
(0018, 'Author deleted: author id - 462.', '2024-11-12 06:46:18', 1901037),
(0019, 'New subject added: Subject - test.', '2024-11-12 07:11:10', 1901037),
(0020, 'Subject updated: Subject - test.', '2024-11-12 07:16:51', 1901037),
(0021, 'Subject deleted: Subject - 0199.', '2024-11-12 07:23:00', 1901037),
(0022, 'Holding updated: Title - Ethical hacking: techniques, tools, and countermeasures --4th ed..', '2024-11-12 13:08:07', 1901037),
(0023, 'Holding updated: Title - Ethical hacking: techniques, tools, and countermeasures --4th ed..', '2024-11-12 13:13:49', 1901037),
(0024, 'Admin details updated: Admin -  .', '2024-11-12 13:29:13', 1901037),
(0025, 'Admin details updated: Admin -  .', '2024-11-12 13:31:04', 1901037),
(0026, 'Admin details updated: Admin - zrephy steldt.', '2024-11-12 13:37:29', 1901037),
(0027, 'Admin details updated: Admin - Aljubehr Sahiol.', '2024-11-12 13:41:35', 1901037),
(0028, 'Deleted admin: Admin ID - 1901037.', '2024-11-12 13:51:21', 1901037),
(0029, 'Admin details updated: Admin - Aljubehr Sahiol.', '2024-11-12 13:55:01', 1901037),
(0030, 'Admin details updated: Admin - Aljubehr Sahiol.', '2024-11-12 14:39:07', 1901037),
(0031, 'Holding updated: Title - Programming logic and design.--10th ed..', '2024-11-12 14:41:45', 1901037),
(0032, 'Holding updated: Title - The life and works of Jose Rizal.', '2024-11-12 14:44:12', 1901037),
(0033, 'Holding updated: Title - El Filibusterismo.', '2024-11-12 14:46:30', 1901037),
(0034, 'Holding updated: Title - Rizal’s true love.', '2024-11-12 14:47:10', 1901037),
(0035, 'Holding updated: Title - Jose Rizal: first global Filipino hero.', '2024-11-12 14:47:33', 1901037),
(0036, 'Holding updated: Title - Jose Rizal: social reformer and patriot: a study.', '2024-11-12 14:48:21', 1901037),
(0037, 'Holding updated: Title - Purposive Communication: Using English in Multilingual Contexts.', '2024-11-12 14:52:07', 1901037),
(0038, 'Holding updated: Title - Communication in Our Lives.', '2024-11-12 14:53:03', 1901037),
(0039, 'Holding updated: Title - Communication for Society: Purposive Communication.', '2024-11-12 14:53:38', 1901037),
(0040, 'Holding updated: Title - Communicate.', '2024-11-12 14:54:03', 1901037),
(0041, 'Holding updated: Title - Oral Communication.', '2024-11-12 14:54:27', 1901037),
(0042, 'Holding updated: Title - Fundamentals of Creative Writing.', '2024-11-12 14:54:57', 1901037),
(0043, 'Holding updated: Title - English for the Globalized Classroom Series: English for Academic & Professional Purposes.', '2024-11-12 15:04:46', 1901037),
(0044, 'Holding updated: Title - English for Academic and Professional Purposes: A Multidisciplinary Approach.', '2024-11-12 15:05:24', 1901037),
(0045, 'Holding updated: Title - Reading and Writing Skills.', '2024-11-12 15:06:37', 1901037),
(0046, 'Holding updated: Title - Oral Communication in Context.', '2024-11-12 15:07:50', 1901037),
(0047, 'Holding updated: Title - Oral Communication in Context.', '2024-11-12 15:08:22', 1901037),
(0048, 'New holding added: Title - H.', '2024-11-12 17:24:22', 1901037),
(0049, 'Holding updated: Title - Ethical hacking: techniques, tools, and countermeasures --4th ed..', '2024-11-12 17:28:31', 1901037),
(0050, 'Holding updated: Title - Ethical hacking: techniques, tools, and countermeasures --4th ed..', '2024-11-12 17:29:01', 1901037),
(0051, 'New holding added: Title - dsf.', '2024-11-12 17:29:21', 1901037),
(0052, 'Holding updated: Title - Ethical hacking: techniques, tools, and countermeasures --4th ed..', '2024-11-12 17:29:50', 1901037),
(0053, 'Holding updated: Title - Introduction to Algorithms.', '2024-11-13 04:21:11', 1901037),
(0054, 'Holding updated: Title - Jose Rizal: social reformer and patriot: a study.', '2024-11-13 04:22:25', 1901037),
(0055, 'Holding updated: Title - Jose Rizal: social reformer and patriot: a study.', '2024-11-13 04:22:25', 1901037),
(0056, 'Holding updated: Title - PC anywhere 32.', '2024-11-13 04:22:58', 1901037),
(0057, 'Holding updated: Title - Community Engagement, Solidarity and Citizenship.', '2024-11-13 04:26:52', 1901037),
(0058, 'Holding updated: Title - Family Stress Management.', '2024-11-13 04:27:17', 1901037),
(0059, 'Holding updated: Title - Group Dynamics for Teams.', '2024-11-13 04:27:52', 1901037),
(0060, 'Holding updated: Title - Zeal for Action: Community Engagement, Solidarity and Citizenship.', '2024-11-13 06:57:12', 1901037),
(0061, 'Holding updated: Title - Penetration Testing Essentials.', '2024-11-13 06:58:00', 1901037),
(0062, 'Holding updated: Title - HTML, XHTML and XML.', '2024-11-13 07:17:04', 1901037),
(0063, 'Holding updated: Title - Computer operating and programming assistant.', '2024-11-13 07:17:34', 1901037),
(0064, 'Holding updated: Title - ARM assembly language: fundamentals and techniques.', '2024-11-13 07:18:50', 1901037),
(0065, 'Holding updated: Title - Design Patterns: Elements of Reusable Object-Oriented Software.', '2024-11-13 07:25:26', 1901037),
(0066, 'Holding updated: Title - Refactoring: Improving the Design of Existing Code.', '2024-11-13 07:31:17', 1901037),
(0067, 'Holding updated: Title - Introduction to Algorithms.', '2024-11-13 07:31:46', 1901037),
(0068, 'Holding updated: Title - Design Patterns: Elements of Reusable Object-Oriented Software.', '2024-11-13 07:32:03', 1901037),
(0069, 'New holding added: Title - rizaallll.', '2024-11-13 07:58:45', 1901037),
(0070, 'Holding deleted: Holding Id - 001137.', '2024-11-13 07:59:12', 1901037),
(0071, 'Holding updated: Title - Operations in Cybersecurity.--2nd ed..', '2024-11-13 08:02:18', 1901037),
(0072, 'Holding updated: Title - Operations in Cybersecurity.--2nd ed..', '2024-11-13 08:03:13', 1901037),
(0073, 'Holding updated: Title - Communication for Society: Purposive Communication.', '2024-11-13 08:04:31', 1901037),
(0074, 'Holding updated: Title - Communication for Society: Purposive Communication.', '2024-11-13 08:04:42', 1901037),
(0075, 'Holding updated: Title - Exploring Literature and Grammar: Reading and Writing Skills.', '2024-11-13 08:06:36', 1901037),
(0076, 'Holding updated: Title - Exploring Literature Grammar: Oral Communication in Context.', '2024-11-13 08:07:02', 1901037),
(0077, 'Holding updated: Title - Communicative English & ELT.', '2024-11-13 08:07:21', 1901037),
(0078, 'Holding updated: Title - Communicative English & ELT.', '2024-11-13 08:07:35', 1901037),
(0079, 'Holding updated: Title - Reading and Writing Skills.', '2024-11-13 08:08:16', 1901037),
(0080, 'Holding updated: Title - Applied English for Academic and Professional Purposes.', '2024-11-13 08:09:07', 1901037),
(0081, 'Holding updated: Title - Reading and Writing.', '2024-11-13 08:09:35', 1901037),
(0082, 'Holding updated: Title - English for the Globalized Classroom Series: English for academic & professional purposes.', '2024-11-13 08:10:25', 1901037),
(0083, 'Holding updated: Title - English for the Globalized Classroom Series: English for Academic & Professional Purposes.', '2024-11-13 08:10:37', 1901037),
(0084, 'Holding updated: Title - Foundations of computer science.', '2024-11-13 08:11:14', 1901037),
(0085, 'Holding updated: Title - Java all-in-one for dummies.', '2024-11-13 08:12:21', 1901037),
(0086, 'Holding updated: Title - Object-oriented programming.--3rd ed.	.', '2024-11-13 08:13:40', 1901037),
(0087, 'Holding updated: Title - Cyber security.--3rd ed. .', '2024-11-13 08:15:00', 1901037),
(0088, 'Holding updated: Title - Data structure and algorithm	.', '2024-11-13 08:15:54', 1901037),
(0089, 'Holding updated: Title - Discrete Mathematics.', '2024-11-13 08:16:09', 1901037),
(0090, 'Holding updated: Title - Object oriented analysis and design.', '2024-11-13 08:16:40', 1901037),
(0091, 'Holding updated: Title - Basic computer coding: SQL.--2nd ed..', '2024-11-13 08:17:04', 1901037),
(0092, 'Holding updated: Title - Readings in the Philippine History.', '2024-11-13 08:18:43', 1901037),
(0093, 'Holding updated: Title - Readings in the Philippine History.', '2024-11-13 08:18:43', 1901037),
(0094, 'New holding added: Title - test.', '2024-11-14 13:22:13', 1901037),
(0095, 'New holding added: Title - teessst.', '2024-11-14 13:23:58', 1901037),
(0096, 'New holding added: Title - TESTT.', '2024-11-14 13:49:17', 1901037),
(0097, 'Holding updated: Title - Introduction to Algorithmss.', '2024-11-14 14:58:46', 1901037),
(0098, 'Holding updated: Title - Introduction to Algorithmss.', '2024-11-14 15:08:17', 1901037),
(0099, 'Holding deleted: Holding Id - 001143.', '2024-11-14 15:10:28', 1901037),
(0100, 'New holding added: Title - testttt.', '2024-11-14 15:12:48', 1901037),
(0101, 'New holding added: Title - testtt1.', '2024-11-14 15:14:09', 1901037),
(0102, 'Holding deleted: Holding Id - 001145.', '2024-11-14 15:14:19', 1901037),
(0103, 'Holding deleted: Holding Id - 001144.', '2024-11-14 15:14:32', 1901037),
(0104, 'Holding deleted: Holding Id - 001140.', '2024-11-14 15:14:52', 1901037),
(0105, 'New holding added: Title - test11.', '2024-11-14 16:03:49', 1901037),
(0106, 'Holding updated: Title - test11.', '2024-11-14 16:04:05', 1901037),
(0107, 'Holding deleted: Holding Id - 001146.', '2024-11-14 16:04:16', 1901037),
(0108, 'New author added: Name - Kylah Ostia.', '2024-11-14 16:40:14', 1901037),
(0109, 'Author updated: Name - Ky Ostia.', '2024-11-14 16:48:49', 1901037),
(0110, 'Author updated: Name - Ky Ostia.', '2024-11-14 16:51:25', 1901037),
(0111, 'Author deleted: author id - 000.', '2024-11-14 16:53:19', 1901037),
(0112, 'New author added: Name - zrephy steldt.', '2024-11-14 16:55:21', 1901037),
(0113, 'Author updated: Name - zrephyyy steldt.', '2024-11-14 16:56:07', 1901037),
(0114, 'Author deleted: author id - 464.', '2024-11-14 16:56:59', 1901037),
(0115, 'New subject added: Subject - test.', '2024-11-14 17:37:35', 1901037),
(0116, 'Subject updated: Subject - OC 1.', '2024-11-14 17:56:12', 1901037),
(0117, 'Subject updated: Subject - OC 1.', '2024-11-14 17:56:20', 1901037),
(0118, 'Author deleted: author id - 0265.', '2024-11-14 17:57:38', 1901037),
(0119, 'Author deleted: author id - 0265.', '2024-11-14 18:00:08', 1901037),
(0120, 'Author deleted: author id - 0265.', '2024-11-14 18:00:22', 1901037),
(0121, 'Author deleted: author id - 0265.', '2024-11-14 18:03:07', 1901037),
(0122, 'Author deleted: author id - 0265.', '2024-11-14 18:03:30', 1901037),
(0123, 'Author deleted: author id - 0265.', '2024-11-14 18:07:20', 1901037),
(0124, 'Subject deleted: Subject - 0265.', '2024-11-14 18:12:21', 1901037),
(0125, 'New subject added: Subject - test.', '2024-11-14 18:13:01', 1901037),
(0126, 'Subject updated: Subject - test1.', '2024-11-14 18:13:08', 1901037),
(0127, 'Subject deleted: Subject - 0266.', '2024-11-14 18:13:25', 1901037),
(0128, 'New admin added: Admin - Aljubehr Sahiol.', '2024-11-14 19:40:49', 1901037),
(0129, 'New admin added: Admin - Aljubehr Sahiol.', '2024-11-14 19:42:08', 1901037),
(0130, 'New admin added: Admin - test test.', '2024-11-14 19:44:17', 1901037),
(0131, 'New admin added: Admin - Aljubehr Sahiol.', '2024-11-14 19:47:12', 1901037),
(0132, 'New admin added: Admin - test test.', '2024-11-14 19:48:38', 1901037),
(0133, 'Admin details updated: Admin - Aljubehr Sahiol.', '2024-11-14 19:53:24', 1901037),
(0134, 'Deleted admin: Admin ID - 1222222.', '2024-11-14 19:56:12', 1901037),
(0135, 'Deleted admin: Admin ID - 1901044.', '2024-11-14 19:56:18', 1901037),
(0136, 'Admin details updated: Admin - Aljubehr Sahiol.', '2024-11-14 19:57:07', 1901037),
(0137, 'Admin details updated: Admin - Aljubehr Sahiol.', '2024-11-14 20:20:24', 1901037),
(0141, 'New admin added: Admin - testtt Sahiol.', '2024-11-15 01:43:37', 1901037),
(0142, 'Admin details updated: Admin - testtt Sahiol.', '2024-11-15 01:43:59', 1901037),
(0143, 'Deleted admin: Admin ID - 1222222.', '2024-11-15 01:44:08', 1901037),
(0144, 'Admin details updated: Admin - testtest test.', '2024-11-15 01:44:19', 1901037),
(0145, 'Deleted admin: Admin ID - 1234567.', '2024-11-15 01:44:25', 1901037),
(0146, 'New subject added: Subject - test.', '2024-11-15 01:46:14', 1901037),
(0147, 'Subject updated: Subject - test1.', '2024-11-15 01:46:23', 1901037),
(0148, 'Subject deleted: Subject - 0267.', '2024-11-15 01:46:27', 1901037),
(0149, 'New author added: Name - test st.', '2024-11-15 01:48:13', 1901037),
(0150, 'Author updated: Name - test test.', '2024-11-15 01:48:21', 1901037),
(0151, 'Author deleted: author id - 616.', '2024-11-15 01:48:25', 1901037),
(0152, 'New holding added: Title - test.', '2024-11-15 01:48:53', 1901037),
(0153, 'Holding updated: Title - test.', '2024-11-15 01:49:13', 1901037),
(0154, 'Holding deleted: Holding Id - 001147.', '2024-11-15 01:49:35', 1901037),
(0155, 'Holding updated: Title - Java: an introduction to computer science and programming.', '2024-11-15 06:13:45', 1901037),
(0156, 'Holding updated: Title - Java: an introduction to computer science and programming.', '2024-11-15 06:14:14', 1901037),
(0157, 'Holding updated: Title - Readings in the Philippine History.', '2024-11-15 06:16:53', 1901037),
(0158, 'Holding updated: Title - The Contemporary World.', '2024-11-15 06:17:01', 1901037),
(0159, 'Holding updated: Title - The Contemporary World.', '2024-11-15 06:17:10', 1901037),
(0160, 'Holding deleted: Holding Id - 000001.', '2024-11-15 06:17:11', 1901037),
(0161, 'Holding deleted: Holding Id - 000003.', '2024-11-15 06:17:18', 1901037),
(0162, 'Holding updated: Title - The Flag and Heraldic Code of the Philippines: Illustrated.', '2024-11-15 06:17:19', 1901037),
(0163, 'Holding deleted: Holding Id - 000005.', '2024-11-15 06:17:25', 1901037),
(0164, 'Holding updated: Title - Batis: Sources in Philippine History.', '2024-11-15 06:17:27', 1901037),
(0165, 'Holding deleted: Holding Id - 001141.', '2024-11-15 06:17:35', 1901037),
(0166, 'Holding updated: Title - Reexamining the History of Philippine-Spanish Relations.', '2024-11-15 06:17:41', 1901037),
(0167, 'Author deleted: author id - 001.', '2024-11-15 06:17:47', 1901037),
(0168, 'Holding updated: Title - Understanding Culture, Society and Politics.', '2024-11-15 06:17:48', 1901037),
(0169, 'Holding updated: Title - Understanding Culture, Society and Politics.', '2024-11-15 06:18:01', 1901037),
(0170, 'Holding updated: Title - Historiograpiya at mga Salaysay na Pangsambayanan sa Kasaysayan at Kalinangang Pilipino.', '2024-11-15 06:18:09', 1901037),
(0171, 'Holding updated: Title - Jose Rizal: first global Filipino hero.', '2024-11-15 06:18:21', 1901037),
(0172, 'Holding updated: Title - Rizal’s true love.', '2024-11-15 06:18:27', 1901037),
(0173, 'Holding updated: Title - Museums, moralities and human rights.', '2024-11-15 06:19:41', 1901037),
(0174, 'Holding updated: Title - Museums, moralities and human rights.', '2024-11-15 06:19:48', 1901037),
(0175, 'Holding updated: Title - Trends, networks and critical thinking in the 21st century culture.', '2024-11-15 06:20:10', 1901037),
(0176, 'Holding updated: Title - Claiming Spaces: Understanding, Reading, and Writing Creative Nonfiction (A Textbook on Humanities and Social Sciences).', '2024-11-15 06:20:47', 1901037),
(0177, 'Holding updated: Title - Claiming Spaces: Understanding, Reading, and Writing Creative Non-fiction (A Textbook on Humanities and Social Sciences).', '2024-11-15 06:21:02', 1901037),
(0178, 'Holding updated: Title - Claiming spaces: understanding, reading and writing creative non-fiction (a textbook on humanities and social sciences).', '2024-11-15 06:21:24', 1901037),
(0179, 'Holding updated: Title - Introduction to philosophy of the human person.', '2024-11-15 06:21:46', 1901037),
(0180, 'Holding updated: Title - Introduction to the Philosophy of the human person.', '2024-11-15 06:21:56', 1901037),
(0181, 'Holding updated: Title - Introduction to philosophy of the human person.', '2024-11-15 06:22:07', 1901037),
(0182, 'Holding updated: Title - Introduction to the Philosophy of the human person.', '2024-11-15 06:22:19', 1901037),
(0183, 'Holding updated: Title - Personal development, 1st ed..', '2024-11-15 06:22:38', 1901037),
(0184, 'Holding updated: Title - Personal development, 1st ed..', '2024-11-15 06:22:47', 1901037),
(0185, 'Holding updated: Title - Growing in Character.', '2024-11-15 06:23:06', 1901037),
(0186, 'Holding updated: Title - Growing in character.', '2024-11-15 06:23:19', 1901037),
(0187, 'Holding updated: Title - Growing in character.', '2024-11-15 06:23:27', 1901037),
(0188, 'Holding updated: Title - A Course Module for Gender and Society: A Human Ecological Approach.', '2024-11-15 06:23:51', 1901037),
(0189, 'Holding updated: Title - Gender and Society.', '2024-11-15 06:23:59', 1901037),
(0190, 'Holding updated: Title - A course module for gender and society: a human ecological approach.', '2024-11-15 06:24:08', 1901037),
(0191, 'Holding updated: Title - Physical Education and Health.', '2024-11-15 06:24:49', 1901037),
(0192, 'Holding updated: Title - Physical Education and Health.', '2024-11-15 06:25:14', 1901037),
(0193, 'Holding updated: Title - Physical education and health.', '2024-11-15 06:25:30', 1901037),
(0194, 'Holding updated: Title - Fueling Young Athletes.', '2024-11-15 06:26:00', 1901037),
(0195, 'Holding updated: Title - Fueling Young Athletes.', '2024-11-15 06:26:13', 1901037),
(0196, 'Holding updated: Title - Fueling young athletes.', '2024-11-15 06:26:26', 1901037),
(0197, 'Holding updated: Title - Introduction to Physical Education, Fitness and Sport.', '2024-11-15 06:26:46', 1901037),
(0198, 'Holding updated: Title - Introduction to physical education, fitness and sport.', '2024-11-15 06:26:55', 1901037),
(0199, 'Holding updated: Title - Physical Education: Curriculum & Instruction.', '2024-11-15 06:27:17', 1901037),
(0200, 'Holding updated: Title - An Introduction to Coaching Skills: A Practical Guide.', '2024-11-15 06:27:36', 1901037),
(0201, 'Holding updated: Title - An introduction to coaching skills: a practical guide.', '2024-11-15 06:27:44', 1901037),
(0202, 'Holding updated: Title - An introduction to coaching skills: a practical guide.', '2024-11-15 06:27:52', 1901037),
(0203, 'Holding updated: Title - Science, technology and society.', '2024-11-15 06:28:48', 1901037),
(0204, 'Holding updated: Title - Science, Technology and Society.', '2024-11-15 06:29:09', 1901037),
(0205, 'Holding updated: Title - Science, Technology and Society.', '2024-11-15 06:29:20', 1901037),
(0206, 'Holding updated: Title - Science, Technology and Health.', '2024-11-15 06:29:35', 1901037),
(0207, 'Holding updated: Title - Science, Technology and Literature.', '2024-11-15 06:29:48', 1901037),
(0208, 'Holding updated: Title - Communication for Society: Purposive Communication.', '2024-11-15 06:30:48', 1901037),
(0209, 'Holding updated: Title - Communication for Society: Purposive Communication.', '2024-11-15 06:31:05', 1901037),
(0210, 'Holding updated: Title - Integrated English for Effective Communication: Creative.', '2024-11-15 06:31:25', 1901037),
(0211, 'Holding updated: Title - Exploring Literature Grammar: Oral Communication in Context.', '2024-11-15 06:31:43', 1901037),
(0212, 'Holding updated: Title - Exploring Literature Grammar: Oral Communication in Context.', '2024-11-15 06:31:56', 1901037),
(0213, 'Holding updated: Title - Oral Communication in Context.', '2024-11-15 06:32:11', 1901037),
(0214, 'Holding updated: Title - Oral Communication in Context.', '2024-11-15 06:33:50', 1901037),
(0215, 'Holding updated: Title - Oral Communication in Context.', '2024-11-15 06:34:01', 1901037),
(0216, 'Holding updated: Title - Zeal for Action: Community Engagement, Solidarity and Citizenship.', '2024-11-15 06:34:31', 1901037),
(0217, 'Holding updated: Title - Community Engagement, Solidarity and Citizenship.', '2024-11-15 06:34:42', 1901037),
(0218, 'Holding updated: Title - Zeal for Action: Community Engagement, Solidarity and Citizenship.', '2024-11-15 06:34:50', 1901037),
(0219, 'Holding updated: Title - Mathematics in the Modern World.', '2024-11-15 06:35:17', 1901037),
(0220, 'Holding updated: Title - Mathematical Excursions.', '2024-11-15 06:35:32', 1901037),
(0221, 'Holding updated: Title - Children’s Errors in Mathematics.', '2024-11-15 06:35:52', 1901037),
(0222, 'Holding updated: Title - Children’s Errors in Mathematics.', '2024-11-15 06:35:58', 1901037),
(0223, 'Holding updated: Title - The Nature of Mathematics.', '2024-11-15 06:36:16', 1901037),
(0224, 'Holding updated: Title - Discrete Mathematics.', '2024-11-15 06:37:10', 1901037),
(0225, 'Holding updated: Title - Discrete Mathematics.', '2024-11-15 06:37:18', 1901037),
(0226, 'Holding updated: Title - Discrete Mathematics and Graph Theory.', '2024-11-15 06:37:25', 1901037),
(0227, 'Holding updated: Title - Discrete mathematics demystified.', '2024-11-15 06:37:35', 1901037),
(0228, 'Holding updated: Title - Discrete mathematics: an introduction to proofs and combinatorics.', '2024-11-15 06:37:43', 1901037),
(0229, 'Holding updated: Title - Discrete mathematics and its application.', '2024-11-15 06:37:51', 1901037),
(0230, 'Holding updated: Title - Discrete mathematics and its application.', '2024-11-15 06:37:58', 1901037),
(0231, 'Holding updated: Title - Discrete mathematics and its application.', '2024-11-15 06:38:06', 1901037),
(0232, 'Holding updated: Title - Discrete Mathematics.', '2024-11-15 06:38:15', 1901037),
(0233, 'Holding updated: Title - Mathematics: A Practical Odyssey.', '2024-11-15 06:38:32', 1901037),
(0234, 'Holding updated: Title - Foundations of Mathematics.', '2024-11-15 06:38:47', 1901037),
(0235, 'Holding updated: Title - General Mathematics.', '2024-11-15 06:39:07', 1901037),
(0236, 'Holding updated: Title - Conceptual Math and Beyond: General Mathematics.', '2024-11-15 06:39:18', 1901037),
(0237, 'Holding updated: Title - General Mathematics.', '2024-11-15 06:39:24', 1901037),
(0238, 'Holding updated: Title - Conceptual Math and Beyond: General Mathematics.', '2024-11-15 06:39:37', 1901037),
(0239, 'Holding updated: Title - Essential Mathematics: For the Modern World.', '2024-11-15 06:39:54', 1901037),
(0240, 'Holding updated: Title - Physical Education and Health.', '2024-11-15 06:40:18', 1901037),
(0241, 'Holding updated: Title - Physical Education and Health.', '2024-11-15 06:40:25', 1901037),
(0242, 'Holding updated: Title - Physical Education and Health.', '2024-11-15 06:40:26', 1901037),
(0243, 'Holding updated: Title - Physical education and health.', '2024-11-15 06:40:34', 1901037),
(0244, 'Holding updated: Title - Physical education and health.', '2024-11-15 06:40:40', 1901037),
(0245, 'Holding updated: Title - Fueling Young Athletes.', '2024-11-15 06:41:04', 1901037),
(0246, 'Holding updated: Title - Fueling Young Athletes.', '2024-11-15 06:41:19', 1901037),
(0247, 'Holding updated: Title - Fueling young athletes.', '2024-11-15 06:41:32', 1901037),
(0248, 'Holding updated: Title - Claiming Spaces: Understanding, Reading, and Writing Creative Nonfiction (A Textbook on Humanities and Social Sciences).', '2024-11-15 06:42:06', 1901037),
(0249, 'Holding updated: Title - Exploring Literature and Grammar: Reading and Writing Skills.', '2024-11-15 06:42:14', 1901037),
(0250, 'Holding updated: Title - Reading and Writing Skills.', '2024-11-15 06:42:23', 1901037),
(0251, 'Holding updated: Title - Reading and Writing Skills.', '2024-11-15 06:42:30', 1901037),
(0252, 'Holding updated: Title - Reading and Writing.', '2024-11-15 06:42:39', 1901037),
(0253, 'Holding updated: Title - Claiming Spaces: Understanding, Reading, and Writing Creative Non-fiction (A Textbook on Humanities and Social Sciences).', '2024-11-15 06:42:49', 1901037),
(0254, 'Holding updated: Title - Claiming spaces: understanding, reading and writing creative non-fiction (a textbook on humanities and social sciences).', '2024-11-15 06:42:55', 1901037),
(0255, 'Holding updated: Title - Exploring Literature Grammar: Oral Communication in Context.', '2024-11-15 06:43:16', 1901037),
(0256, 'Holding updated: Title - Oral Communication in Context.', '2024-11-15 06:43:25', 1901037),
(0257, 'Holding updated: Title - Oral Communication in Context.', '2024-11-15 06:43:35', 1901037),
(0258, 'Holding updated: Title - Physical Education and Health.', '2024-11-15 07:35:01', 1901037),
(0259, 'Holding updated: Title - Physical education and health.', '2024-11-15 07:35:12', 1901037),
(0260, 'Holding updated: Title - An Introduction to Coaching Skills: A Practical Guide.', '2024-11-15 07:35:57', 1901037),
(0261, 'Holding updated: Title - An introduction to coaching skills: a practical guide.', '2024-11-15 07:36:16', 1901037),
(0262, 'Holding updated: Title - Fueling Young Athletes.', '2024-11-15 07:36:48', 1901037),
(0263, 'Holding updated: Title - Fueling Young Athletes.', '2024-11-15 07:37:08', 1901037),
(0264, 'Holding updated: Title - Fitness for Life: Health Optimizing Physical Education.', '2024-11-15 07:38:34', 1901037),
(0265, 'Holding updated: Title - Fitness for Life: Health Optimizing Physical Education.', '2024-11-15 07:38:48', 1901037),
(0266, 'Holding updated: Title - Fitness for life: Health Optimizing Physical education.', '2024-11-15 07:39:05', 1901037),
(0267, 'Holding updated: Title - Instructional Module on Civic Welfare Training Service.', '2024-11-15 07:39:39', 1901037),
(0268, 'Holding updated: Title - Instructional Module on Civic Welfare Training Service.', '2024-11-15 07:39:53', 1901037),
(0269, 'Holding updated: Title - Zeal for Action: Community Engagement, Solidarity and Citizenship.', '2024-11-15 07:42:00', 1901037),
(0270, 'Holding updated: Title - English for Academic and Professional Purposes: A Multidisciplinary Approach.', '2024-11-15 07:42:15', 1901037),
(0271, 'Holding updated: Title - English for Academic and Professional Purposes: A Multidisciplinary Approach.', '2024-11-15 07:42:24', 1901037),
(0272, 'Holding updated: Title - English for Academic and Professional Purposes: A Multi-Disciplinary Approach.', '2024-11-15 07:42:52', 1901037),
(0273, 'Holding updated: Title - Wording the World: The Art of Creative Writing.', '2024-11-15 07:46:19', 1901037),
(0274, 'Holding updated: Title - Contemporary Philippine Arts from the Regions.', '2024-11-15 07:46:38', 1901037),
(0275, 'Holding updated: Title - Understanding Human Rights & International Humanitarian Law.', '2024-11-15 07:47:02', 1901037),
(0276, 'Holding updated: Title - Understanding Human Rights & International Humanitarian Law.', '2024-11-15 07:47:19', 1901037),
(0277, 'Holding updated: Title - Understanding Human Rights & International Humanitarian Law.', '2024-11-15 07:47:31', 1901037),
(0278, 'Holding updated: Title - Ethics: Theory and Contemporary Issues.', '2024-11-15 07:48:15', 1901037),
(0279, 'Holding updated: Title - Ethics: theory and contemporary issues.', '2024-11-15 07:48:24', 1901037),
(0280, 'Holding updated: Title - Ethics: theory and contemporary issues.', '2024-11-15 07:48:24', 1901037),
(0281, 'Holding updated: Title - Ethics: theory and contemporary issues.', '2024-11-15 07:48:34', 1901037),
(0282, 'Holding updated: Title - Universal ethics and contemporary values.', '2024-11-15 07:50:35', 1901037),
(0283, 'Holding updated: Title - Ethics and values for law enforcers: criminal justice education, 2nd ed.', '2024-11-15 07:51:14', 1901037),
(0284, 'Holding updated: Title - Humanity: an introduction to cultural anthropology.', '2024-11-15 07:54:04', 1901037),
(0285, 'Holding updated: Title - Claiming Spaces: Understanding, Reading, and Writing Creative Nonfiction (A Textbook on Humanities and Social Sciences).', '2024-11-15 07:54:36', 1901037),
(0286, 'Holding updated: Title - Rizal’s true love.', '2024-11-15 07:55:20', 1901037),
(0287, 'Holding updated: Title - El Filibusterismo.', '2024-11-15 07:55:45', 1901037),
(0288, 'Holding updated: Title - Jose Rizal: first global Filipino hero.', '2024-11-15 07:56:21', 1901037),
(0289, 'Holding updated: Title - Personal development, 1st ed..', '2024-11-15 07:58:27', 1901037),
(0290, 'Holding updated: Title - Claiming Spaces: Understanding, Reading, and Writing Creative Nonfiction (A Textbook on Humanities and Social Sciences).', '2024-11-15 07:59:47', 1901037),
(0291, 'Holding updated: Title - Claiming Spaces: Understanding, Reading, and Writing Creative Non-fiction (A Textbook on Humanities and Social Sciences).', '2024-11-15 07:59:58', 1901037),
(0292, 'Holding updated: Title - Claiming spaces: understanding, reading and writing creative non-fiction (a textbook on humanities and social sciences).', '2024-11-15 08:00:08', 1901037),
(0293, 'Holding updated: Title - Philippine Politics and Governance.', '2024-11-15 08:01:29', 1901037),
(0294, 'Holding updated: Title - Philippine Politics and Governance.', '2024-11-15 08:01:36', 1901037),
(0295, 'Holding updated: Title - Philippine Politics and Governance.', '2024-11-15 08:01:36', 1901037),
(0296, 'Holding updated: Title - Philippine Politics and Governance.', '2024-11-15 08:01:44', 1901037),
(0297, 'Holding updated: Title - Politics without Borders: Philippine Politics and Governance.', '2024-11-15 08:01:51', 1901037),
(0298, 'Holding updated: Title - Readings in Philippine History, 1st ed..', '2024-11-15 08:02:07', 1901037),
(0299, 'Holding updated: Title - Readings in Philippine History, 1st ed..', '2024-11-15 08:02:18', 1901037),
(0300, 'Holding updated: Title - Batis: Sources in Philippine History.', '2024-11-15 08:02:44', 1901037),
(0301, 'Subject updated: Subject - CSIT 1.', '2024-11-17 03:25:18', 1901037),
(0302, 'New subject added: Subject - CRIM 1.', '2024-11-17 03:32:28', 1901037),
(0303, 'New subject added: Subject - SOC SCI 1.', '2024-11-17 03:32:57', 1901037),
(0304, 'New subject added: Subject - HIST 1.', '2024-11-17 03:34:12', 1901037),
(0305, 'New subject added: Subject - STS 1.', '2024-11-17 03:34:24', 1901037),
(0306, 'New subject added: Subject - MATH 1.', '2024-11-17 03:34:40', 1901037),
(0307, 'New subject added: Subject - PATH 1C.', '2024-11-17 03:34:51', 1901037),
(0308, 'New subject added: Subject - OC 1.', '2024-11-17 03:35:01', 1901037),
(0309, 'New subject added: Subject - NSTP 1.', '2024-11-17 03:35:12', 1901037),
(0310, 'New subject added: Subject - CLJ 1.', '2024-11-17 03:35:27', 1901037),
(0311, 'New subject added: Subject - CRIM 2.', '2024-11-17 03:35:38', 1901037),
(0312, 'New subject added: Subject - FS 1.', '2024-11-17 03:36:04', 1901037),
(0313, 'New subject added: Subject - SOC ECON 1.', '2024-11-17 03:36:17', 1901037),
(0314, 'New subject added: Subject - ENGL 1.', '2024-11-17 03:36:30', 1901037),
(0315, 'New subject added: Subject - CHEM 1C.', '2024-11-17 03:36:43', 1901037),
(0316, 'New subject added: Subject - PATHFIT 2C.', '2024-11-17 03:36:54', 1901037),
(0317, 'New subject added: Subject - GE EL 1.', '2024-11-17 03:37:06', 1901037),
(0318, 'New subject added: Subject - NSTP 1.', '2024-11-17 03:37:20', 1901037),
(0319, 'New subject added: Subject - LEA 1.', '2024-11-17 03:37:35', 1901037),
(0320, 'New subject added: Subject -  CLJ 2.', '2024-11-17 03:37:48', 1901037),
(0321, 'New subject added: Subject - FS 2.', '2024-11-17 03:38:04', 1901037),
(0322, 'New subject added: Subject - CDI 1.', '2024-11-17 03:38:17', 1901037),
(0323, 'New subject added: Subject - CRIM 3.', '2024-11-17 03:38:28', 1901037),
(0324, 'New subject added: Subject - COMM 1.', '2024-11-17 03:38:45', 1901037),
(0325, 'New subject added: Subject - GE EL 2.', '2024-11-17 03:38:58', 1901037),
(0326, 'New subject added: Subject - PATHFIT 3C.', '2024-11-17 03:39:21', 1901037),
(0327, 'New subject added: Subject - LEA 2.', '2024-11-17 03:39:32', 1901037),
(0328, 'New subject added: Subject - CDI 2.', '2024-11-17 03:39:42', 1901037),
(0329, 'New subject added: Subject - CLJ 3.', '2024-11-17 03:39:52', 1901037),
(0330, 'New subject added: Subject - LEA 3.', '2024-11-17 03:40:04', 1901037),
(0331, 'New subject added: Subject - PHILO 1.', '2024-11-17 03:40:14', 1901037),
(0332, 'New subject added: Subject - PHILO 1.', '2024-11-17 03:40:14', 1901037),
(0333, 'New subject added: Subject - EP 1.', '2024-11-17 03:40:25', 1901037),
(0334, 'New subject added: Subject - EP 1.', '2024-11-17 03:40:25', 1901037),
(0335, 'New subject added: Subject - PATHFIT 4C.', '2024-11-17 03:42:11', 1901037),
(0336, 'New subject added: Subject - EA 1.', '2024-11-17 03:42:24', 1901037),
(0337, 'New subject added: Subject - CFLM 1.', '2024-11-17 03:42:40', 1901037),
(0338, 'New subject added: Subject -  CRIM 4.', '2024-11-17 03:42:51', 1901037),
(0339, 'New subject added: Subject - CDI 3.', '2024-11-17 03:43:07', 1901037),
(0340, 'New subject added: Subject - D.', '2024-11-17 04:00:39', 1901037),
(0341, 'Subject updated: Subject - NSTP 2.', '2024-11-17 07:56:32', 1901037),
(0342, 'New subject added: Subject - d.', '2024-11-17 08:47:06', 1901037),
(0343, 'New subject added: Subject - d.', '2024-11-17 08:47:59', 1901037),
(0344, 'New subject added: Subject - d.', '2024-11-17 08:48:45', 1901037),
(0345, 'New subject added: Subject - STS 1.', '2024-11-17 08:50:22', 1901037),
(0346, 'New subject added: Subject - c.', '2024-11-17 12:15:51', 1901037),
(0347, 'New subject added: Subject - csadas.', '2024-11-17 12:18:49', 1901037),
(0348, 'Subject deleted: Subject - 0452.', '2024-11-17 12:18:56', 1901037),
(0349, 'New subject added: Subject - dsvdsavsadvsdvsdvds.', '2024-11-17 12:19:12', 1901037),
(0350, 'New subject added: Subject - ENGLES.', '2024-11-17 13:23:58', 1901037),
(0351, 'New subject added: Subject - MANENS2.', '2024-11-17 13:29:47', 1901037),
(0352, 'Subject deleted: Subject - 0458.', '2024-11-17 13:32:05', 1901037),
(0353, 'New subject added: Subject - EPE1.', '2024-11-17 13:36:17', 1901037),
(0354, 'New subject added: Subject - D.', '2024-11-17 16:13:57', 1901037),
(0355, 'New subject added: Subject - D.', '2024-11-17 16:13:57', 1901037),
(0356, 'New subject added: Subject - D.', '2024-11-17 16:13:57', 1901037),
(0357, 'New subject added: Subject - D.', '2024-11-17 16:13:57', 1901037),
(0358, 'New subject added: Subject - D.', '2024-11-17 16:13:57', 1901037),
(0359, 'New subject added: Subject - D.', '2024-11-17 16:13:57', 1901037),
(0360, 'New subject added: Subject - D.', '2024-11-17 16:13:57', 1901037),
(0361, 'New subject added: Subject - D.', '2024-11-17 16:13:57', 1901037),
(0362, 'New subject added: Subject - D.', '2024-11-17 16:13:57', 1901037),
(0363, 'New subject added: Subject - D.', '2024-11-17 16:17:45', 1901037),
(0364, 'New subject added: Subject - d.', '2024-11-17 16:17:58', 1901037),
(0365, 'Subject deleted: Subject - 0519.', '2024-11-17 16:26:04', 1901037),
(0366, 'Subject deleted: Subject - 0510.', '2024-11-17 16:26:21', 1901037),
(0367, 'Subject deleted: Subject - 0511.', '2024-11-17 16:37:17', 1901037),
(0368, 'New subject added: Subject - WERT.', '2024-11-18 00:50:03', 1901037),
(0369, 'New subject added: Subject - WERT.', '2024-11-18 00:50:10', 1901037),
(0370, 'New subject added: Subject - WERT.', '2024-11-18 00:50:29', 1901037),
(0371, 'New subject added: Subject - WERT.', '2024-11-18 00:51:01', 1901037),
(0372, 'New subject added: Subject - WERT.', '2024-11-18 00:53:31', 1901037),
(0373, 'New subject added: Subject - WERT.', '2024-11-18 00:54:22', 1901037),
(0374, 'New subject added: Subject - NGFH.', '2024-11-18 01:13:28', 1901037),
(0375, 'New subject added: Subject - NGFH.', '2024-11-18 01:13:55', 1901037),
(0376, 'New subject added: Subject - NGFH.', '2024-11-18 01:14:28', 1901037),
(0377, 'New subject added: Subject - NGFH.', '2024-11-18 01:14:39', 1901037),
(0378, 'New subject added: Subject - JEVS.', '2024-11-18 01:21:41', 1901037),
(0379, 'New subject added: Subject - JEVS.', '2024-11-18 01:23:53', 1901037),
(0380, 'New subject added: Subject - test.', '2024-11-18 01:24:19', 1901037),
(0381, 'New subject added: Subject - test1.', '2024-11-18 01:33:29', 1901037),
(0382, 'New subject added: Subject - 123.', '2024-11-19 13:23:33', 1901037),
(0383, 'New subject added: Subject - .', '2024-11-19 13:40:26', 1901037),
(0384, 'New subject added: Subject - .', '2024-11-19 13:40:51', 1901037),
(0385, 'New subject added: Subject - .', '2024-11-19 13:41:37', 1901037),
(0386, 'New subject added: Subject - .', '2024-11-19 13:45:46', 1901037),
(0387, 'New subject added: Subject - .', '2024-11-19 13:46:30', 1901037),
(0388, 'New subject added: Subject - .', '2024-11-19 13:47:51', 1901037),
(0389, 'New subject added: Subject - .', '2024-11-19 13:49:00', 1901037),
(0390, 'New subject added: Subject - postman.', '2024-11-19 13:53:01', 1901037),
(0391, 'New subject added: Subject - postman.', '2024-11-19 13:53:19', 1901037),
(0392, 'New subject added: Subject - postman.', '2024-11-19 13:59:25', 1901037),
(0393, 'New subject added: Subject - postman.', '2024-11-19 13:59:42', 1901037),
(0394, 'New subject added: Subject - testnew.', '2024-11-19 14:06:54', 1901037),
(0395, 'New subject added: Subject - testnew.', '2024-11-19 14:06:59', 1901037),
(0396, 'New subject added: Subject - testnew.', '2024-11-19 14:06:59', 1901037),
(0397, 'New subject added: Subject - testnew.', '2024-11-19 14:07:00', 1901037),
(0398, 'New subject added: Subject - testnew.', '2024-11-19 14:07:00', 1901037),
(0399, 'New subject added: Subject - testnew.', '2024-11-19 14:07:00', 1901037),
(0400, 'New subject added: Subject - testnew.', '2024-11-19 14:07:00', 1901037),
(0401, 'New subject added: Subject - testnew.', '2024-11-19 14:07:00', 1901037),
(0402, 'New subject added: Subject - testnew.', '2024-11-19 14:07:22', 1901037),
(0403, 'New subject added: Subject - testnew.', '2024-11-19 14:08:54', 1901037),
(0404, 'New subject added: Subject - testnew.', '2024-11-19 14:10:35', 1901037),
(0405, 'New subject added: Subject - postmannew.', '2024-11-19 14:17:25', 1901037),
(0406, 'New subject added: Subject - 123.', '2024-11-19 14:21:19', 1901037),
(0407, 'New subject added: Subject - 1234.', '2024-11-19 14:26:51', 1901037),
(0408, 'New subject added: Subject - 5.', '2024-11-19 14:27:44', 1901037),
(0409, 'New subject added: Subject - .', '2024-11-22 13:53:02', 1901037),
(0410, 'New admin added: Admin - d d.', '2024-11-22 13:55:00', 1901037),
(0411, 'New subject added: Subject - d.', '2024-11-22 13:55:18', 1901037),
(0412, 'Subject deleted: Subject - 2287.', '2024-11-22 13:56:16', 1901037),
(0413, 'New subject added: Subject - test.', '2024-11-22 13:57:02', 1901037),
(0414, 'Subject deleted: Subject - 2288.', '2024-11-22 13:59:19', 1901037),
(0415, 'New subject added: Subject - CSIT 5.', '2024-11-23 00:01:48', 1901037);

-- --------------------------------------------------------

--
-- Table structure for table `ocr_log`
--

CREATE TABLE `ocr_log` (
  `log_id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `ocr_result` text NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ocr_log`
--

INSERT INTO `ocr_log` (`log_id`, `ocr_result`, `timestamp`) VALUES
(0131, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 11:13:10'),
(0132, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 11:28:35'),
(0133, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 11:36:10'),
(0134, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 13:48:14'),
(0135, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 14:04:53'),
(0136, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 14:12:06'),
(0137, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 20:36:52'),
(0138, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 20:41:01'),
(0139, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 20:46:05'),
(0140, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 20:56:32'),
(0141, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 21:35:40'),
(0142, '_—— — ee e————————————————\nSUG \'§ i\n&€ an ed Misamis University\nEk ¥ Ozamiz City, 7200 Misamis Occidental, Philippines\nNBT +63 88521.0367 +63 88521.2917 @ mu@mu.edu.ph\nMU REGD-023/U30ctoberas i : Office RiSL@Vorske Veritas, The Netherlands Student Copy\nCERTIFIED: 150 9001,2015 Quality MEE oh IS AF ors ; t\nACCREDITED: Pal AREER of Eneglment Si Stetementrof shocountcreditation (PACUCOA)\nmester\nID No: 2201478 ’\nName: ZAMORA, JAY LAURENCE SONGCADOS Assessment of Fees:\nCourse& Year:  BSBA-3 Major: MM ] : Tuition Fee: 15,235.50\nDate Enrolled: 07/24/2024 Re-Assessed 07/24/2024 Laboratory Fee: 0.00\n\"Section Subject Units Time Day Room Ov ay Room Cyc Matriculation Fee 107567\nMRMAN341 MARMAN 34 30 09:35-11:05A MW M305 0 Other Fees: 666654 |\nfoscizzs BA-EL32 3.0 02:35-04:05F MW M305 0 Test Paper Fee: s97.45 |\nMNTED323 MGNT ED 32 3.0 11:10-12:40P  TTH M301 0 Cha ago |\nBA363 BA36 30  04:1005:40P MW M303 0 pes\nBA353 BA35 30  05:45-07:15F MW M302 0 Total: Bsrsis |\nMRMAN351 MARMAN 35 30 01:00-02:30P  TTH M304 0 Add: Old Account 0.00\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 —— wh\nTotal Account: 2357516 |\nLess: Discount: 000 |\n_ Payment 7,255.00\nBalance: 1632016 | |\n\\ _\nTotal Units: 21.0 ID JED |\n\' Entrance Prelim Midterm Semi-Final Final VALAD ) |\nDue: 700.00 5,718.79 5,718.79 5,718.79 5,718.79 (\nPayment: 700.00 5,718.79 836.21 0.00\nBalance: 0.00 4,882.58 5,718.79 5,718.79 (\\\nTotal: = = TT 488258 ~ 10,601.37 16,320.16 ec\nNote: 1) Piz. check and report immediately to your respective college encoders any error in this statement.\n2) Have your Certificate of Enrolment validated, otherwise your name wifl not be included in the Class List. -\n3.) Payment can also be made st the following banks: Misamis Bank, RET, RBK, UCPB, BDO, PNB, LBP, China & Metro, Encoder: ARIEL\n', '2024-11-24 21:56:58'),
(0143, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-11-24 23:17:49'),
(0144, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-11-24 23:24:42'),
(0145, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-11-25 19:34:48'),
(0146, '. — a i M paca a=\n| Lad ous mig gniversity\n9 . Dsgs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO OIVDNO ber “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: i og CERTIFIED ohio kaOLy Quality ffice of 1. 185 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the fel lofske Yaris, redon ft Student Copy\n: Seas v74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | Monten 4\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subjet Unis Time 2 =] ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om 2 SR\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B Sess\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PT\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\noh Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _-\"r a :\nance: 0.00 5,418.45 5,718.79 5,718.79 Fen ’\ni 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, inerwse vou nm wit be med ho Ck to\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro. i\nBN .s\n3 l= 135 : _- - - 8 SR a\n', '2024-11-25 21:21:12'),
(0147, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 22:06:04'),
(0148, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:04:00'),
(0149, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:07:58'),
(0150, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:19:00'),
(0151, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:20:10'),
(0152, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:28:03'),
(0153, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:29:09'),
(0154, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:30:26'),
(0155, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:36:12'),
(0156, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:37:35'),
(0157, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:42:01'),
(0158, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:49:05'),
(0159, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:51:45');
INSERT INTO `ocr_log` (`log_id`, `ocr_result`, `timestamp`) VALUES
(0160, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:55:30'),
(0161, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:56:35'),
(0162, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-01 23:57:52'),
(0163, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-02 00:00:32'),
(0164, 'Ol ea)\nShag\nOffice of the University Registrar Fen\nHE oe\ni Sh\n[Tr e—— Shain\nCortifcate of Enrolment & Statement of Accounts\nTH Samastar Schoo! Year 2034.3025\noho 1800715\nName ANDE ERIKCAEVE ABERGAS. TkooFes Zama\nCourse & year DMD Lab.Foo rye\nMajor own\nDato Enrolled  rizoro24 au Fee arse\nRo assossed\nSection Subject [7 o— f-Tr—) Ceiotic Oar Foss Taasan\nINFCONT INF CONT 20 TZ000700P TH DAVR o\ncao0ioon 1 PROLAS TestPapar sara\nPROSTHOZ1 PROSTHOZ 0 dacoioon  M_ BROLAD 0 a\nce0ioon TH pROLAB .\nPROSTHO31 PROSTHOR 40 gscoiooo £ROLAS 3 Charge 000\nPERIO! PERIO 1 30 01000300P MW D205 0 Toul... sos\nORTHO? ORTHO? 30 oloooxor TH Dos 0\nOPDENT2! OP DENT 2 30 osa00730P MW D204 0 Ad\n__opamiz OpaTHZ 30 Gso00s00r D204 0\nTotal Units EE —— rs Odncent + 735082\nEE — Bs —— a —\nErvacaprim Wate Bo Fal Addons 10000\nio TE REBEL E v TowlAcent © 586925\neR\nLaws\nDiscount 000\nPayment © 4600000\nBALANCE 2on258\noe 31 hc rs rr mn 0 me hr ors po\n3) Paya can abe mad of chow ark Maar Sar RBT, REX, CPO. BDO. PNG, LBP China ot\n', '2024-12-02 00:20:19'),
(0165, 'Ol ea)\nShag\nOffice of the University Registrar Fen\nHE oe\ni Sh\n[Tr e—— Shain\nCortifcate of Enrolment & Statement of Accounts\nTH Samastar Schoo! Year 2034.3025\noho 1800715\nName ANDE ERIKCAEVE ABERGAS. TkooFes Zama\nCourse & year DMD Lab.Foo rye\nMajor own\nDato Enrolled  rizoro24 au Fee arse\nRo assossed\nSection Subject [7 o— f-Tr—) Ceiotic Oar Foss Taasan\nINFCONT INF CONT 20 TZ000700P TH DAVR o\ncao0ioon 1 PROLAS TestPapar sara\nPROSTHOZ1 PROSTHOZ 0 dacoioon  M_ BROLAD 0 a\nce0ioon TH pROLAB .\nPROSTHO31 PROSTHOR 40 gscoiooo £ROLAS 3 Charge 000\nPERIO! PERIO 1 30 01000300P MW D205 0 Toul... sos\nORTHO? ORTHO? 30 oloooxor TH Dos 0\nOPDENT2! OP DENT 2 30 osa00730P MW D204 0 Ad\n__opamiz OpaTHZ 30 Gso00s00r D204 0\nTotal Units EE —— rs Odncent + 735082\nEE — Bs —— a —\nErvacaprim Wate Bo Fal Addons 10000\nio TE REBEL E v TowlAcent © 586925\neR\nLaws\nDiscount 000\nPayment © 4600000\nBALANCE 2on258\noe 31 hc rs rr mn 0 me hr ors po\n3) Paya can abe mad of chow ark Maar Sar RBT, REX, CPO. BDO. PNG, LBP China ot\n', '2024-12-02 00:25:10'),
(0166, '. — a i M paca a= li\n| fad os mig gniversity\n9 . DsEs ib LL City, 7200 Mi (dental, Philippines i\nMU REGO 0200 bers “8 921.0357 t oy Ts = 291 7 @ mu@mu.edu.ph\n: a oe CERTIFIED ohio kaOLy Quality ffice of 1 ISK 3%iorske Veritas, The Nether\nACCREDITED: Philippi hficate, agen, the Reg lofske Yaris, redone Student Copy\n: US eastsv74-20\n= ID No.: 2020165 - ’\n3 Name: TAGA-AN, JAN KENNETH RAMOS fo— —— 1. k\n1 Course & Year: BSBA-3 Major: MM | rey —t\nDate Enrolled: 07/25/2024 Re-Assessed 7/5670 i Laboratory fee: 1523550\n} Secon Subject Unis Time 2 Som ee Matriculation fee Rd §\nMRMAN341 MARMAN 34 3.0 09:35-11:05A mw om J al\nM305 Other Fees: A\n3 BAEL323 BA-EL 32 3.0 02:35-04:05p MW M305 0 Test B ese\n| MNTED323 MGNT ED 32 3.0 11:10-12:40p yyy M301 0 Paper Fee: © 5874\nBA363 BA 36 30 04:10-05:40p py M303 0 Charges: Lie\nBA353 BA 3S 3.0 05:45-07:15p Mw M302 0 Totat : ;\nMRMAN351 MARMAN 35 3.0 01:00-02:30p Ty M304 0 PE\nGEEL105BA GEEL1 3.0 09:35-11:05A  TTH HF203 0 - : :\nTo Fe.\nBalance:\nTotal Units: 21.0 Ba B\nEntrance Prelim Midterm Semi-Final Final SI -!\nDue: 700.00 5,718.79 5,718.79 571879 571879 --\nPayment: 700.00 300.34 0.00 _\"r a :\nance: 0.00 5418.45 5,718.79 5,718.79 Fen ’\nei 541845 ~ 11,137.04 1685603 : i. k\nNote: 1. Pls. check and report immediately to respect encoders in this st\n21 ov your Ceticate of Enoimentvlate, thers vou nm wit be med he Ck Wt\n3) Payment can also be made at the following banks: Misamis Bank, RT, RBK, UCP, BDO, PN, LoP, China & Metro i\nBN .s\nq l= 135 : _- - - 8 SR a\n', '2024-12-02 00:48:44');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `sub_id` int(4) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `sub_desc` varchar(255) NOT NULL,
  `year_level` enum('1','2','3','4','5','6') NOT NULL,
  `acad_year` varchar(255) NOT NULL,
  `semester` set('First semester','Second Semester','Summer') NOT NULL,
  `course` varchar(100) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`sub_id`, `sub_name`, `sub_desc`, `year_level`, `acad_year`, `semester`, `course`, `deleted`) VALUES
(2294, 'GE EL 1', 'Understanding the Self', '1', '2023', 'First semester', 'BSIT', 0),
(2295, 'GEEL1', 'Reading in Philippine History', '3', '2023', 'Second Semester', 'BSBA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subjects_holdings`
--

CREATE TABLE `subjects_holdings` (
  `sub_hold_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `hold_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects_holdings`
--

INSERT INTO `subjects_holdings` (`sub_hold_id`, `sub_id`, `hold_id`, `created_at`) VALUES
(18, 2295, 290, '2024-11-25 19:23:17'),
(40, 2294, 293, '2024-12-01 14:33:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_acc`
--
ALTER TABLE `admin_acc`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `holdings`
--
ALTER TABLE `holdings`
  ADD PRIMARY KEY (`hold_id`),
  ADD KEY `holdings_ibfk_2` (`department`);

--
-- Indexes for table `holdings_authors`
--
ALTER TABLE `holdings_authors`
  ADD PRIMARY KEY (`hold_auth_id`),
  ADD KEY `hold_id` (`hold_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `ocr_log`
--
ALTER TABLE `ocr_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `subjects_holdings`
--
ALTER TABLE `subjects_holdings`
  ADD PRIMARY KEY (`sub_hold_id`),
  ADD KEY `hold_id` (`hold_id`),
  ADD KEY `sub_id` (`sub_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=619;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `holdings`
--
ALTER TABLE `holdings`
  MODIFY `hold_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `holdings_authors`
--
ALTER TABLE `holdings_authors`
  MODIFY `hold_auth_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=416;

--
-- AUTO_INCREMENT for table `ocr_log`
--
ALTER TABLE `ocr_log`
  MODIFY `log_id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `sub_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2296;

--
-- AUTO_INCREMENT for table `subjects_holdings`
--
ALTER TABLE `subjects_holdings`
  MODIFY `sub_hold_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `holdings`
--
ALTER TABLE `holdings`
  ADD CONSTRAINT `holdings_ibfk_2` FOREIGN KEY (`department`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `holdings_authors`
--
ALTER TABLE `holdings_authors`
  ADD CONSTRAINT `holdings_authors_ibfk_1` FOREIGN KEY (`hold_id`) REFERENCES `holdings` (`hold_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `holdings_authors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin_acc` (`admin_id`);

--
-- Constraints for table `subjects_holdings`
--
ALTER TABLE `subjects_holdings`
  ADD CONSTRAINT `subjects_holdings_ibfk_1` FOREIGN KEY (`hold_id`) REFERENCES `holdings` (`hold_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subjects_holdings_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`sub_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
