-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 29, 2024 at 03:57 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pjs2`
--

-- --------------------------------------------------------

--
-- Table structure for table `agentes_agentes`
--

DROP TABLE IF EXISTS `agentes_agentes`;
CREATE TABLE IF NOT EXISTS `agentes_agentes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentes_agentes_categoria_id_fdf8b391` (`categoria_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `agentes_agentes`
--

INSERT INTO `agentes_agentes` (`id`, `nombre`, `descripcion`, `imagen`, `categoria_id`) VALUES
(12, 'diego farias', 'el mejor', '', 1),
(14, 'sdasdas', 'asdasdasdas', 'productos/deporte.jpg', 3),
(7, 'breachwewe', 'XD', '', 4),
(9, 'omen', 'q miedo', '', 5),
(10, 'brim', 'viejo sabroso', '', 5),
(13, 'gigachad rodriguez', 'sdasd', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `agentes_categoria`
--

DROP TABLE IF EXISTS `agentes_categoria`;
CREATE TABLE IF NOT EXISTS `agentes_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `agentes_categoria`
--

INSERT INTO `agentes_categoria` (`id`, `nombre`, `descripcion`) VALUES
(1, 'duelistas', 'estos son los encargados de atacar los sites'),
(3, 'centinelas', 'estos se encargan de defender el site'),
(4, 'iniciadores', 'estos tienen habilidades que permiten al equipo pasar con menos dificultad'),
(5, 'humos', 'estos tapan partes de los sites con la finalidad de controlar mejor el mapa');

-- --------------------------------------------------------

--
-- Table structure for table `agentes_personajes`
--

DROP TABLE IF EXISTS `agentes_personajes`;
CREATE TABLE IF NOT EXISTS `agentes_personajes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_spanish_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `agentes_personajes`
--

INSERT INTO `agentes_personajes` (`id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 'jett', 'este dashea', '');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'sadasdas');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add personajes', 7, 'add_personajes'),
(26, 'Can change personajes', 7, 'change_personajes'),
(27, 'Can delete personajes', 7, 'delete_personajes'),
(28, 'Can view personajes', 7, 'view_personajes'),
(29, 'Can add agentes', 8, 'add_agentes'),
(30, 'Can change agentes', 8, 'change_agentes'),
(31, 'Can delete agentes', 8, 'delete_agentes'),
(32, 'Can view agentes', 8, 'view_agentes'),
(33, 'Can add categoria', 9, 'add_categoria'),
(34, 'Can change categoria', 9, 'change_categoria'),
(35, 'Can delete categoria', 9, 'delete_categoria'),
(36, 'Can view categoria', 9, 'view_categoria');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_spanish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_spanish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'asd123', '2024-11-15 02:43:11.760948', 1, 'diego', '', '', 'diego@gmail.com', 1, 1, '2024-11-15 01:28:14.986872'),
(2, 'pbkdf2_sha256$870000$Po6bsSAYTZVllWES5RJy7F$Ce9oswUVvDfAYiEzSfVJmt1kjLyo7130s/La1TtD4DQ=', '2024-11-29 15:48:36.541667', 1, 'diego2', 'diego', 'farias', 'diego2@gmail.com', 1, 1, '2024-11-29 03:13:14.919262'),
(3, 'pbkdf2_sha256$870000$0GTVHPiTaguJHBZeBsH8ZP$exjahbbzL4YaNH/RkoYWJVhtgPkIH9LCQMl9Vm8rKgU=', '2024-11-29 15:37:05.680855', 0, 'rioter', 'nacho', 'araya', 'naraya@gmail.com', 0, 1, '2024-11-29 03:53:27.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 3, 32);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_spanish_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_spanish_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-11-15 01:28:39.214169', '1', 'sadasdas', 1, '[{\"added\": {}}]', 3, 1),
(2, '2024-11-15 01:41:05.881429', '1', 'x', 1, '[{\"added\": {}}]', 9, 1),
(3, '2024-11-15 01:41:07.203103', '1', 'hola', 1, '[{\"added\": {}}]', 8, 1),
(4, '2024-11-15 01:41:39.431082', '2', 'duelistas', 1, '[{\"added\": {}}]', 9, 1),
(5, '2024-11-15 01:42:03.693212', '1', 'jett', 1, '[{\"added\": {}}]', 7, 1),
(6, '2024-11-15 03:16:05.749030', '1', 'duelistas', 2, '[{\"changed\": {\"fields\": [\"Nombre\", \"Descripcion\"]}}]', 9, 1),
(7, '2024-11-15 03:16:09.499240', '2', 'duelistas', 3, '', 9, 1),
(8, '2024-11-15 03:17:01.927626', '2', 'jett', 1, '[{\"added\": {}}]', 8, 1),
(9, '2024-11-15 03:35:51.895908', '3', 'centinelas', 1, '[{\"added\": {}}]', 9, 1),
(10, '2024-11-15 03:35:55.008927', '3', 'jett', 1, '[{\"added\": {}}]', 8, 1),
(11, '2024-11-15 03:36:36.410199', '4', 'iniciadores', 1, '[{\"added\": {}}]', 9, 1),
(12, '2024-11-15 03:36:54.308162', '5', 'humos', 1, '[{\"added\": {}}]', 9, 1),
(13, '2024-11-15 03:37:40.520461', '4', 'reyna', 1, '[{\"added\": {}}]', 8, 1),
(14, '2024-11-15 03:37:56.275165', '5', 'killjoy', 1, '[{\"added\": {}}]', 8, 1),
(15, '2024-11-15 03:38:05.900191', '6', 'cypher', 1, '[{\"added\": {}}]', 8, 1),
(16, '2024-11-15 03:38:13.850288', '7', 'breach', 1, '[{\"added\": {}}]', 8, 1),
(17, '2024-11-15 03:38:20.501217', '8', 'sova', 1, '[{\"added\": {}}]', 8, 1),
(18, '2024-11-15 03:38:29.958962', '9', 'omen', 1, '[{\"added\": {}}]', 8, 1),
(19, '2024-11-15 03:38:39.368935', '10', 'brim', 1, '[{\"added\": {}}]', 8, 1),
(20, '2024-11-29 03:53:28.299682', '3', 'rioter', 1, '[{\"added\": {}}]', 4, 2),
(21, '2024-11-29 03:56:28.954032', '3', 'rioter', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"User permissions\"]}}]', 4, 2),
(22, '2024-11-29 03:58:56.362773', '3', 'rioter', 2, '[]', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'agentes', 'personajes'),
(8, 'agentes', 'agentes'),
(9, 'agentes', 'categoria');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-11-15 00:05:52.320516'),
(2, 'auth', '0001_initial', '2024-11-15 00:05:52.512363'),
(3, 'admin', '0001_initial', '2024-11-15 00:05:52.573181'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-15 00:05:52.579785'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-15 00:05:52.583690'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-15 00:05:52.615524'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-15 00:05:52.628967'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-11-15 00:05:52.644001'),
(9, 'auth', '0004_alter_user_username_opts', '2024-11-15 00:05:52.648617'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-11-15 00:05:52.662474'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-11-15 00:05:52.662945'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-15 00:05:52.667658'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-11-15 00:05:52.682713'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-15 00:05:52.697533'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-11-15 00:05:52.711884'),
(16, 'auth', '0011_update_proxy_permissions', '2024-11-15 00:05:52.716439'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-15 00:05:52.729698'),
(18, 'sessions', '0001_initial', '2024-11-15 00:05:52.744139'),
(19, 'agentes', '0001_initial', '2024-11-15 01:24:06.428066'),
(20, 'agentes', '0002_remove_agentes_cantidad_remove_agentes_precio_and_more', '2024-11-15 04:07:42.939772');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_spanish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('olryt85b9dl8rnaas2g8kx1nmxo05x15', '.eJxVjEEOwiAQRe_C2pCBCmVcuvcMZIBBqgaS0q6Md7dNutDtf-_9t_C0LsWvnWc_JXERSpx-t0DxyXUH6UH13mRsdZmnIHdFHrTLW0v8uh7u30GhXrZac7J2dBksayQ2IWOIyAyDzkBntBE0RB4JjVEO04CgdHZAKruwReLzBe16N9o:1tBl8P:t6ejlQ7m47A-OhdoFqPXP2lcB35MXUPMGi1ocuiQe7I', '2024-11-29 01:28:29.351664'),
('y396w251qwwzuibez57i411dg1h6kkju', '.eJxVjEEOwiAQRe_C2pCBCmVcuvcMZIBBqgaS0q6Md7dNutDtf-_9t_C0LsWvnWc_JXERSpx-t0DxyXUH6UH13mRsdZmnIHdFHrTLW0v8uh7u30GhXrZac7J2dBksayQ2IWOIyAyDzkBntBE0RB4JjVEO04CgdHZAKruwReLzBe16N9o:1tBmIh:BdCijuLmowcGJm4Y1hMuaWIhYrySVcDqYZyO3zDw8l0', '2024-11-29 02:43:11.762629');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
