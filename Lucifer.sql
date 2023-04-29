-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 17, 2019 at 03:46 PM
-- Server version: 5.7.27-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Lucifer`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `user` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`admin_id`, `name`, `last_name`, `user`, `password`, `mobile`, `email`, `country`, `flag`) VALUES
(1, 'Lucifer', 'Star', 'h.lucifer', '1', '9874563012', 'hlucifer44@gmail.com', 111, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Animal`
--

CREATE TABLE `Animal` (
  `animal_id` int(11) NOT NULL,
  `animal_name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `species` int(11) DEFAULT NULL,
  `native` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `lifespan` varchar(20) NOT NULL,
  `height` varchar(20) NOT NULL,
  `weight` varchar(20) NOT NULL,
  `image` varchar(300) NOT NULL,
  `descr` varchar(300) NOT NULL,
  `availability` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Animal`
--

INSERT INTO `Animal` (`animal_id`, `animal_name`, `type`, `species`, `native`, `price`, `discount`, `lifespan`, `height`, `weight`, `image`, `descr`, `availability`) VALUES
(1, 'Affenpinscher', 1, 1, 243, 60, 1, '12-14 years', '9-11 inches', '7-9 pounds', 'images/Dogs/Affenpinscher.jpg', 'static/descr/Dogs/Affenpinscher.txt', 1),
(2, 'Akita', 2, 1, 121, 65, 2, '10-12 years', '2ft-2.4ft', '70-130 pounds', 'images/Dogs/Akita.jpg', 'static/descr/Dogs/Akita.txt', 1),
(3, 'Boxer', 2, 1, 90, 45, 0, '10-12 years', '1ft.9in.-2ft.1in.', '60-70 pounds', 'images/Dogs/boxer.jpg', 'static/descr/Dogs/Boxer.txt', 1),
(4, 'Chihuahua', 1, 1, 154, 57, 3, '10-18 years', '6-9 inches', '3-6 pounds', 'images/Dogs/Chihuahua.jpg', 'static/descr/Dogs/Chihuahua.txt', 1),
(5, 'German Shepherd', 9, 1, 90, 47, 1, '10-14 years', '1ft.10in.-2ft.2in.', '75-95 pounds', 'images/Dogs/German-Shepherd.jpg', 'static/descr/Dogs/German-Shepherd.txt', 1),
(6, 'Manchester Terrier', 9, 1, 243, 87, 3, '14-16 years', '1ft,3in-1ft,4in', '12-22 pounds', 'images/Dogs/Manchester-terrier.jpg', 'static/descr/Dogs/Manchester-Terrier.txt', 1),
(7, 'Ragdoll', 21, 2, 244, 90, 2, '12-17 years', '17-21 inches', '10-20 pound', 'images/Cats/ragdoll.jpeg', 'static/descr/Cats/Ragdoll.txt', 1),
(8, 'Chartreux', 21, 2, 82, 97, 1, '11-15 years', '9-11 inches', '7-16 pounds', 'images/Cats/Chartreux.jpg', 'static/descr/Cats/Chartreux.txt', 1),
(9, 'Bengal Cat', 20, 2, 244, 85, 4, '10-16 years', '17-22 inches', '8-17 pounds', 'images/Cats/bengal-kitten.jpg', 'static/descr/Cats/Bengal-Cat.txt', 1),
(10, 'Arabian Horse', 16, 3, 203, 270, 5, '25-30 years', '1.4-1.6m', '800-100 lb', 'images/Horse/arabian-horse.jpg', 'static/descr/Horse/Arabian-Horse.txt', 1),
(11, 'American Quarter Horse', 12, 3, 244, 180, 1, '25 years', '57-64 inches', '950-1200 pounds', 'images/Horse/american-quarter.jpg', 'static/descr/Horse/American-Quarter-Horse.txt', 1),
(12, 'Morgan Horse', 12, 3, 244, 150, 0, '20-30 years', '57-66 inches', '1000 pounds', 'images/Horse/morgan-horse.jpg', 'static/descr/Horse/Morgan-Horse.txt', 1),
(13, 'Miniature Horse', 15, 3, 243, 105, 0, '25-30 years', '34-38 inches', '350 pounds', 'images/Horse/miniature-horse.jpg', 'static/descr/Horse/Miniature-Horse.txt', 1),
(14, 'Neon Tetra', 10, 11, 33, 8, 0, '5 years', '1.5 inches', '', 'images/Fish/neon-tetra.jpg', 'static/descr/Fish/Neon-Tetra.txt', 1),
(15, 'Guppy', 10, 11, 244, 5, 0, 'upto 2 years', '0.6-2.4 inches', '', 'images/Fish/guppy fish.png', 'static/descr/Fish/Guppy.txt', 1),
(16, 'Black Mouth Cur', 2, 1, 244, 36, 3, '12-18 years', '16-25 inches', '40-95 pounds', 'images/Dogs/black-mouth-cur.jpg', 'static/descr/Dogs/Black-Mouth-Cur.txt', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Cart`
--

CREATE TABLE `Cart` (
  `cart_id` int(11) NOT NULL,
  `cart_item` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '1',
  `r_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Country`
--

CREATE TABLE `Country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Country`
--

INSERT INTO `Country` (`country_id`, `country_name`) VALUES
(1, 'Afghanistan'),
(2, 'Akrotiri'),
(3, 'Albania'),
(4, 'Algeria'),
(5, 'American Samoa'),
(6, 'Andorra'),
(7, 'Angola'),
(8, 'Anguilla\n'),
(9, 'Antarctica'),
(10, 'Antigua and Barbuda'),
(11, 'Argentina'),
(12, 'Armenia'),
(13, 'Aruba'),
(14, 'Ashmore and Cartier Islands'),
(15, 'Australia'),
(16, 'Austria'),
(17, 'Azerbaijan'),
(18, 'Bahamas'),
(19, 'Bahrain'),
(20, 'Bangladesh'),
(21, 'Barbados'),
(22, 'Bassas da India'),
(23, 'Belarus'),
(24, 'Belgium'),
(25, 'Belize'),
(26, 'Benin'),
(27, 'Bermuda'),
(28, 'Bhutan'),
(29, 'Bolivia'),
(30, 'Bosnia and Herzegovina'),
(31, 'Botswana'),
(32, 'Bouvet Island'),
(33, 'Brazil'),
(34, 'British Indian Ocean Territory'),
(35, 'British Virgin Islands'),
(36, 'Brunei'),
(37, 'Bulgaria'),
(38, 'Burkina Faso'),
(39, 'Burma'),
(40, 'Burundi'),
(41, 'Cambodia'),
(42, 'Cameroon'),
(43, 'Canada'),
(44, 'Cape Verde'),
(45, 'Cayman Islands'),
(46, 'Central African Republic'),
(47, 'Chad'),
(48, 'Chile'),
(49, 'China'),
(50, 'Christmas Island'),
(51, 'Clipperton Island'),
(52, 'Cocos (Keeling) Islands'),
(53, 'Colombia'),
(54, 'Comoros'),
(55, 'Congo, Democratic Republic of the'),
(56, 'Congo, Republic of the'),
(57, 'Cook Islands'),
(58, 'Coral Sea Islands'),
(59, 'Costa Rica'),
(60, 'Cote d Ivoire'),
(61, 'Croatia'),
(62, 'Cuba'),
(63, 'Cyprus'),
(64, 'Czech Republic'),
(65, 'Denmark'),
(66, 'Dhekelia'),
(67, 'Djibouti'),
(68, 'Dominica'),
(69, 'Dominican Republic'),
(70, 'Ecuador'),
(71, 'Egypt'),
(72, 'El Salvador'),
(73, 'Equatorial Guinea'),
(74, 'Eritrea'),
(75, 'Estonia'),
(76, 'Ethiopia'),
(77, 'Europa Island'),
(78, 'Falkland Islands (Islas Malvinas)'),
(79, 'Faroe Islands'),
(80, 'Fiji'),
(81, 'Finland'),
(82, 'France'),
(83, 'French Guiana'),
(84, 'French Polynesia'),
(85, 'French Southern and Antarctic Lands'),
(86, 'Gabon'),
(87, 'Gambia'),
(88, 'Gaza Strip '),
(89, 'Georgia'),
(90, 'Germany'),
(91, 'Ghana'),
(92, 'Gibraltar'),
(93, 'Glorioso Islands'),
(94, 'Greece'),
(95, 'Greenland'),
(96, 'Grenada'),
(97, 'Guadeloupe'),
(98, 'Guam'),
(99, 'Guatemala'),
(100, 'Guernsey'),
(101, 'Guinea'),
(102, 'Guinea-Bissau'),
(103, 'Guyana'),
(104, 'Haiti'),
(105, 'Heard Island and McDonald Islands'),
(106, 'Holy See (Vatican City)'),
(107, 'Honduras'),
(108, 'Hong Kong'),
(109, 'Hungary'),
(110, 'Iceland'),
(111, 'India'),
(112, 'Indonesia'),
(113, 'Iran'),
(114, 'Iraq'),
(115, 'Ireland'),
(116, 'Isle of Man'),
(117, 'Israel'),
(118, 'Italy'),
(119, 'Jamaica'),
(120, 'Jan Mayen'),
(121, 'Japan'),
(122, 'Jersey'),
(123, 'Jordan'),
(124, 'Juan de Nova Island'),
(125, 'Kazakhstan'),
(126, 'Kenya'),
(127, 'Kiribati'),
(128, 'Korea, North'),
(129, 'Korea, South'),
(130, 'Kuwait'),
(131, 'Kyrgyzstan'),
(132, 'Laos'),
(133, 'Latvia'),
(134, 'Lebanon'),
(135, 'Lesotho'),
(136, 'Liberia'),
(137, 'Libya'),
(138, 'Liechtenstein'),
(139, 'Lithuania '),
(140, 'Luxembourg'),
(141, 'Macau'),
(142, 'Macedonia'),
(143, 'Madagascar'),
(144, 'Malawi'),
(145, 'Malaysia'),
(146, 'Maldives'),
(147, 'Mali'),
(148, 'Malta'),
(149, 'Marshall Islands'),
(150, 'Martinique'),
(151, 'Mauritania'),
(152, 'Mauritius'),
(153, 'Mayotte'),
(154, 'Mexico'),
(155, 'Micronesia, Federated States of'),
(156, 'Moldova'),
(157, 'Monaco'),
(158, 'Mongolia'),
(159, 'Montserrat'),
(160, 'Morocco'),
(161, 'Mozambique'),
(162, 'Namibia'),
(163, 'Nauru'),
(164, 'Navassa Island'),
(165, 'Nepal'),
(166, 'Netherlands'),
(167, 'Netherlands Antilles'),
(168, 'New Caledonia'),
(169, 'New Zealand'),
(170, 'Nicaragua'),
(171, 'Niger'),
(172, 'Nigeria'),
(173, 'Niue'),
(174, 'Norfolk Island'),
(175, 'Northern Mariana Islands'),
(176, 'Norway'),
(177, 'Oman'),
(178, 'Pakistan'),
(179, 'Palau'),
(180, 'Panama'),
(181, 'Papua New Guinea'),
(182, 'Paracel Islands'),
(183, 'Paraguay'),
(184, 'Peru'),
(185, 'Philippines'),
(186, 'Pitcairn Islands'),
(187, 'Poland'),
(188, 'Portugal'),
(189, 'Puerto Rico'),
(190, 'Qatar'),
(191, 'Reunion'),
(192, 'Romania'),
(193, 'Russia'),
(194, 'Rwanda'),
(195, 'Saint Helena'),
(196, 'Saint Kitts and Nevis'),
(197, 'Saint Lucia'),
(198, 'Saint Pierre and Miquelon'),
(199, 'Saint Vincent and the Grenadines'),
(200, 'Samoa'),
(201, 'San Marino'),
(202, 'Sao Tome and Principe'),
(203, 'Saudi Arabia'),
(204, 'Senegal'),
(205, 'Serbia and Montenegro'),
(206, 'Seychelles'),
(207, 'Sierra Leone'),
(208, 'Singapore'),
(209, 'Slovakia'),
(210, 'Slovenia'),
(211, 'Solomon Islands'),
(212, 'Somalia'),
(213, 'South Africa '),
(214, 'South Georgia and the South Sandwich Islands'),
(215, 'Spain'),
(216, 'Spratly Islands'),
(217, 'Sri Lanka'),
(218, 'Sudan'),
(219, 'Suriname'),
(220, 'Svalbard'),
(221, 'Swaziland'),
(222, 'Sweden'),
(223, 'Switzerland'),
(224, 'Syria'),
(225, 'Taiwan'),
(226, 'Tajikistan'),
(227, 'Tanzania'),
(228, 'Thailand'),
(229, 'Timor-Leste'),
(230, 'Togo'),
(231, 'Tokelau'),
(232, 'Tonga'),
(233, 'Trinidad and Tobago'),
(234, 'Tromelin Island'),
(235, 'Tunisia'),
(236, 'Turkey'),
(237, 'Turkmenistan'),
(238, 'Turks and Caicos Islands'),
(239, 'Tuvalu'),
(240, 'Uganda'),
(241, 'Ukraine'),
(242, 'United Arab Emirates'),
(243, 'United Kingdom'),
(244, 'United States'),
(245, 'Uruguay'),
(246, 'Uzbekistan'),
(247, 'Vanuatu'),
(248, 'Venezuela'),
(249, 'Vietnam'),
(250, 'Virgin Islands'),
(251, 'Wake Island'),
(252, 'Wallis and Futuna'),
(253, 'West Bank'),
(254, 'Western Sahara'),
(255, 'Yemen'),
(256, 'Zambia'),
(257, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `s_no` int(11) NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `order_detail` int(11) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`s_no`, `order_id`, `order_detail`, `r_id`) VALUES
(1, 'Aug201913Hus1420Att134730249373', 1, 3),
(2, 'Aug201913Hus1420Att134730249373', 6, 3),
(3, 'Aug201913Hus1420Att134730249373', 3, 3),
(4, 'Aug201913Hus1420Att134730249373', 4, 3),
(5, 'Aug201913Hus13Att112436013', 1, 3),
(6, 'Aug201916Hus36Att3236412573', 1, 3),
(7, 'Aug201916Hus36Att3236412573', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Query`
--

CREATE TABLE `Query` (
  `sno` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `query` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Query`
--

INSERT INTO `Query` (`sno`, `name`, `last_name`, `email`, `mobile`, `query`) VALUES
(1, 'Husain', 'Attari', 'hqamruddin786@rediffmail.com', '9874563012', 'Testing...!!!'),
(2, 'Kanak', 'Jhawar', 'kj@gmail.com', '1023546987', 'Testing multiple rows...!!'),
(4, 'Kapil', 'Gulani', 'rj.43@rediffmail.com', '6541203789', 'Testing..!!'),
(7, 'Muskan', 'Agrawal', 'hqamruddin786@rediffmail.com', '5463201789', 'Multiple Testing Continues..!!'),
(8, 'Keshav', 'Bhutada', 'hlucifer@rediffmail.com', '5463210789', 'Testing of Help..!!');

-- --------------------------------------------------------

--
-- Table structure for table `Register`
--

CREATE TABLE `Register` (
  `r_id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `address` varchar(300) NOT NULL,
  `flag` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Register`
--

INSERT INTO `Register` (`r_id`, `name`, `last_name`, `user`, `password`, `email`, `country`, `mobile`, `address`, `flag`) VALUES
(1, 'Husain', 'Attari', '1', '9874563210', 'qwerty@qwerty.com', 1, 'h_attari', '', 0),
(2, 'Husain', 'Attari', '1', '9874563210', 'qwerty@qwerty.com', 1, 'h_attari', '', 0),
(3, 'Husain', 'Attari', 'h_attari', '4', 'hqamruddin786@rediffmail.com', 111, '9874563210', '95, Kadwa Road, Mahabaleshwar, Mahrashtra', 0),
(4, 'Kanak', 'Jhawar', 'k_jhawar', '12345678', 'k_jhawar@hotmail.com', 111, '9874563210', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Rewards`
--

CREATE TABLE `Rewards` (
  `reward_id` int(11) NOT NULL,
  `coupon` varchar(50) NOT NULL,
  `reward_detail` varchar(30) DEFAULT NULL,
  `min_amount` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Rewards`
--

INSERT INTO `Rewards` (`reward_id`, `coupon`, `reward_detail`, `min_amount`, `date`, `r_id`) VALUES
(1, 'Discoutn Coupon', 'upto 50%', 300, '2020-06-01', 3),
(2, 'Lucky Coupon', 'upto 75%', 500, '2020-01-15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Species`
--

CREATE TABLE `Species` (
  `species_id` int(11) NOT NULL,
  `species_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Species`
--

INSERT INTO `Species` (`species_id`, `species_name`) VALUES
(1, 'Dog'),
(2, 'Cat'),
(3, 'Horse'),
(4, 'Hen'),
(5, 'Goat'),
(6, 'Sheep'),
(7, 'Cow'),
(8, 'Bufallo'),
(9, 'Bull'),
(10, 'Pig'),
(11, 'Fish'),
(12, 'Lobster'),
(13, 'Crab'),
(14, 'Rodent'),
(15, 'Mouse'),
(16, 'Rabbit'),
(17, 'Birds'),
(18, 'Camel'),
(19, 'Elephant'),
(20, 'Duck'),
(21, 'Goose'),
(22, 'Turtle'),
(23, 'Tortoise'),
(24, 'Lizard'),
(25, 'Snake');

-- --------------------------------------------------------

--
-- Table structure for table `Type`
--

CREATE TABLE `Type` (
  `type_id` int(11) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `species` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Type`
--

INSERT INTO `Type` (`type_id`, `type`, `species`) VALUES
(1, 'Companion', 1),
(2, 'Working', 1),
(3, 'Gaurd', 1),
(4, 'Primitive', 1),
(5, 'Pastoral', 1),
(6, 'Hunting', 1),
(7, 'Sled', 1),
(8, 'Turnspit', 1),
(9, 'Miscellaneous', 1),
(10, 'Fresh-Water', 11),
(11, 'Salt-Water', 11),
(12, 'Draft Horse', 3),
(13, 'Light Horse', 3),
(14, 'Pony', 3),
(15, 'Small', 3),
(16, 'Warm-blood', 3),
(17, 'Mediterranean', 4),
(18, 'English', 4),
(19, 'Fighting', 4),
(20, 'Farm-cat', 2),
(21, 'House-cat', 2),
(22, 'Venomous', 25),
(23, 'Non-Venomous', 25),
(24, 'Water-snake', 25),
(25, 'Single-humped', 18),
(26, 'Double-humped', 18),
(27, 'Forest', 19),
(28, 'Borneo', 19),
(29, 'Sumatran', 19),
(30, 'Pygmy', 5),
(31, 'Nigerian Dwarf', 5),
(32, 'Kinder', 5),
(33, 'Nigora', 5),
(34, 'Mole', 14),
(35, 'Dessert', 14),
(36, 'Racing', 17);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `Animal`
--
ALTER TABLE `Animal`
  ADD PRIMARY KEY (`animal_id`),
  ADD KEY `species` (`species`),
  ADD KEY `native` (`native`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `Cart`
--
ALTER TABLE `Cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_item` (`cart_item`),
  ADD KEY `r_id` (`r_id`);

--
-- Indexes for table `Country`
--
ALTER TABLE `Country`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `country_name` (`country_name`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`s_no`),
  ADD KEY `order_detail` (`order_detail`),
  ADD KEY `r_id` (`r_id`);

--
-- Indexes for table `Query`
--
ALTER TABLE `Query`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `Register`
--
ALTER TABLE `Register`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `Rewards`
--
ALTER TABLE `Rewards`
  ADD PRIMARY KEY (`reward_id`),
  ADD KEY `r_id` (`r_id`);

--
-- Indexes for table `Species`
--
ALTER TABLE `Species`
  ADD PRIMARY KEY (`species_id`);

--
-- Indexes for table `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `species` (`species`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Animal`
--
ALTER TABLE `Animal`
  MODIFY `animal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `Cart`
--
ALTER TABLE `Cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Country`
--
ALTER TABLE `Country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Query`
--
ALTER TABLE `Query`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Register`
--
ALTER TABLE `Register`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Rewards`
--
ALTER TABLE `Rewards`
  MODIFY `reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Species`
--
ALTER TABLE `Species`
  MODIFY `species_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `Type`
--
ALTER TABLE `Type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Admin`
--
ALTER TABLE `Admin`
  ADD CONSTRAINT `Admin_ibfk_1` FOREIGN KEY (`country`) REFERENCES `Country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Animal`
--
ALTER TABLE `Animal`
  ADD CONSTRAINT `Animal_ibfk_4` FOREIGN KEY (`species`) REFERENCES `Species` (`species_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Animal_ibfk_5` FOREIGN KEY (`type`) REFERENCES `Type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Animal_ibfk_6` FOREIGN KEY (`native`) REFERENCES `Country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Cart`
--
ALTER TABLE `Cart`
  ADD CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`cart_item`) REFERENCES `Animal` (`animal_id`),
  ADD CONSTRAINT `Cart_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `Register` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`order_detail`) REFERENCES `Animal` (`animal_id`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `Register` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Register`
--
ALTER TABLE `Register`
  ADD CONSTRAINT `Register_ibfk_1` FOREIGN KEY (`country`) REFERENCES `Country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Rewards`
--
ALTER TABLE `Rewards`
  ADD CONSTRAINT `Rewards_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `Register` (`r_id`) ON DELETE CASCADE;

--
-- Constraints for table `Type`
--
ALTER TABLE `Type`
  ADD CONSTRAINT `Type_ibfk_1` FOREIGN KEY (`species`) REFERENCES `Species` (`species_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
