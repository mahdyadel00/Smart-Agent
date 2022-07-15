-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2022 at 02:58 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_agent`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_modules`
--

CREATE TABLE `activity_modules` (
  `id` int(11) NOT NULL,
  `status` enum('available','in_available') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_modules`
--

INSERT INTO `activity_modules` (`id`, `status`, `image`, `word`, `created_at`, `updated_at`) VALUES
(18, 'available', '/uploads/avtivity_module/16563867444.png', NULL, '2022-06-28 01:25:44', '2022-06-28 01:25:44'),
(19, 'available', '/uploads/avtivity_module/16563868044.png', NULL, '2022-06-28 01:26:44', '2022-06-28 01:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `activity_modules_data`
--

CREATE TABLE `activity_modules_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_modules_data`
--

INSERT INTO `activity_modules_data` (`id`, `title`, `description`, `lang_id`, `created_at`, `updated_at`, `activity_id`) VALUES
(30, 'what is laravel version?', 'test', 2, '2022-06-28 01:25:44', '2022-06-28 01:25:44', 18),
(31, 'xx', 'xx', 2, '2022-06-28 01:26:44', '2022-06-28 01:26:44', 19);

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(11) UNSIGNED DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(41, 'amira', 'amin@email.com', '01122907742', 'test', 'test', '2022-07-12 08:01:10', '2022-07-12 08:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `content_sections`
--

CREATE TABLE `content_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL,
  `columns` tinyint(4) NOT NULL,
  `type` enum('home','footer') COLLATE utf8mb4_unicode_ci DEFAULT 'home',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_sections`
--

INSERT INTO `content_sections` (`id`, `title`, `order`, `columns`, `type`, `created_at`, `updated_at`, `store_id`, `lang_id`) VALUES
(1, 'روابط سريعة', 10, 1, 'footer', '2020-06-15 07:35:47', '2021-03-09 11:17:08', NULL, 2),
(3, 'Working hours', 2, 1, 'footer', '2020-08-19 07:42:10', '2020-08-19 07:42:10', NULL, 1),
(5, 'About US', 1, 1, 'footer', '2020-08-25 05:12:11', '2020-08-25 05:12:11', NULL, 1),
(6, 'روابط سريعة', 7, 1, 'footer', '2020-11-11 23:09:35', '2020-11-11 23:09:35', NULL, 2),
(8, 'أوقات العمل', 2, 1, 'footer', '2020-11-25 09:09:47', '2020-11-25 09:09:47', NULL, 2),
(9, 'روابط سريعة', 9, 1, 'footer', '2020-11-25 09:11:25', '2020-11-25 09:13:10', NULL, 2),
(10, 'About US', 1, 1, 'footer', '2020-11-25 09:12:27', '2020-11-25 09:12:27', NULL, 1),
(11, 'Working hours', 2, 1, 'footer', '2020-11-25 09:13:10', '2020-11-25 09:13:10', NULL, 1),
(12, 'روابط سريعة', 7, 1, 'footer', '2020-12-20 11:25:26', '2020-12-21 11:06:27', NULL, 2),
(13, 'من نحن ؟', 1, 1, 'footer', '2021-02-09 19:40:30', '2021-02-11 00:03:53', NULL, 2),
(14, 'الدعم الفني', 6, 1, 'footer', '2021-02-11 00:07:08', '2021-02-15 18:48:54', NULL, 2),
(15, 'تسويق الكتروني', 10, 1, 'home', '2021-02-11 06:00:20', '2022-04-06 07:23:48', NULL, 2),
(82, 'services', 10, 1, 'home', '2022-04-06 08:10:10', '2022-04-06 08:47:28', NULL, NULL),
(84, 'about', 10, 1, 'footer', '2022-04-06 08:47:14', '2022-04-06 08:47:14', NULL, NULL),
(85, 'نحن', 10, 1, 'home', '2022-04-06 08:57:46', '2022-04-06 08:57:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_images`
--

CREATE TABLE `default_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `not_found` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `default_images`
--

INSERT INTO `default_images` (`id`, `favicon`, `header`, `footer`, `not_found`, `created_at`, `updated_at`) VALUES
(1, '1655954649.png', '1655954674.jpg', '1656081549.png', '1655954695.jpg', '2020-11-10 21:20:38', '2022-06-24 12:39:09'),
(2, '1606514346.png', '1606992458.svg', '1606514281.png', '1606514354.png', '2020-11-10 21:20:38', '2020-12-03 08:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_social`
--

CREATE TABLE `doctor_social` (
  `id` int(10) UNSIGNED NOT NULL,
  `doctor_teams_id` int(10) UNSIGNED NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor_social`
--

INSERT INTO `doctor_social` (`id`, `doctor_teams_id`, `link`, `type`, `created_at`, `updated_at`) VALUES
(26, 39, 'http://facebook.com', 'facebook', '2022-05-09 08:36:52', '2022-05-09 08:36:52'),
(27, 40, 'facebook.com/mahdy', 'facebook', '2022-05-10 05:44:10', '2022-05-10 05:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `feature_permission`
--

CREATE TABLE `feature_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `feature_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goals_modules`
--

CREATE TABLE `goals_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goals_modules`
--

INSERT INTO `goals_modules` (`id`, `image`, `created_at`, `updated_at`) VALUES
(28, '/uploads/goals_modules/16577850647.jpg', '2022-07-14 05:51:04', '2022-07-14 05:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `goals_modules_data`
--

CREATE TABLE `goals_modules_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `goal_module_id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goals_modules_data`
--

INSERT INTO `goals_modules_data` (`id`, `goal_module_id`, `lang_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(24, 28, 2, 'للمام طلاب برنامج STEM بماهية البيانات الضخمة وتحليلها.', '<p style=\"text-align: right;\">عزيزي الطالب في نهاية ه ا الموديول يجب أن تكون اد اً ر على أن:<br />\r\n▪ ت ر مفهوم البيانات الضخمة.<br />\r\n▪ تعدد خصائص البيانات الضخمة.▪ تتعرف على أنواد تحليلات البيانات الضخمة.</p>', '2022-07-14 05:51:04', '2022-07-14 05:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `helps`
--

CREATE TABLE `helps` (
  `id` int(10) UNSIGNED NOT NULL,
  `published` tinyint(1) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `helps`
--

INSERT INTO `helps` (`id`, `published`, `image`, `created_at`, `updated_at`) VALUES
(23, 1, '/uploads/helps/16573211384.png', '2022-07-08 20:58:58', '2022-07-08 20:58:58');

-- --------------------------------------------------------

--
-- Table structure for table `helps_data`
--

CREATE TABLE `helps_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `help_id` int(11) UNSIGNED NOT NULL,
  `lang_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `helps_data`
--

INSERT INTO `helps_data` (`id`, `help_id`, `lang_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(8, 23, 2, 'يمكنك اخستعانة بإحدى لقطات الفيديو التالية :', 'جولة لشرح واجهة التفاعل بواسطة الو يل ال ي.\r\n\r\nجولة لشرح يفية فتح محتوى المنصة الر مية. )تشغيل (\r\nجولة لشرح يفية فتح محتوى المنصة الر مية. )تشغيل (\r\nجولة لشرح يفية تسلسم الأنشطة. )تشغيل (\r\nجولة لشرح يفية استخدام تطبيقات التواصل المت ا زمنة وغير المت ا زمنة. )تشغيل (\r\nجولة لشرح يفية الحصول على مساعدة الو يل ال ي. )تشغيل(........في الموجه\r\nفقط.\r\nيمكنك تحميل دليل استخدام البيئة.؟؟؟؟ ؟', '2022-07-08 20:58:58', '2022-07-08 20:58:58');

-- --------------------------------------------------------

--
-- Table structure for table `image_accounts`
--

CREATE TABLE `image_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `image_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_accounts`
--

INSERT INTO `image_accounts` (`id`, `image_account`, `created_at`, `updated_at`) VALUES
(1, '1655954703.png', '2021-04-27 00:08:31', '2022-06-23 01:25:03');

-- --------------------------------------------------------

--
-- Table structure for table `insturctions`
--

CREATE TABLE `insturctions` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `insturctions`
--

INSERT INTO `insturctions` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(42, '/uploads/insturctions/16577856718.jpg', 1, '2022-07-14 06:01:11', '2022-07-14 06:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `insturctions_data`
--

CREATE TABLE `insturctions_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `insturction_id` int(11) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `insturctions_data`
--

INSERT INTO `insturctions_data` (`id`, `title`, `body`, `insturction_id`, `lang_id`, `created_at`, `updated_at`) VALUES
(51, 'عزيزي الطةةالةةب لكي يتسةةةةةةنى لةةك تحقيق الأهةةداف التعليميةةة المحةةددة للموديول بنجاح، عليك لتباد التعليمات التالية:', '<p style=\"text-align: right;\">بعةةد اختيةةارو للموديول الأول م بق ا رءة التعليمةةات جيةةدًا ثم م<br />\r\nبد ا رسة المحتوى التعليمي للموديول وأداء الأنشطة الخاصة به.</p>', 42, 2, '2022-07-14 06:01:11', '2022-07-14 06:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `title`, `code`, `flag`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'EN', 'en', 'USD.png', NULL, NULL, '2020-08-08 09:23:00'),
(2, 'AR', 'ar', 'SAR.png', NULL, NULL, '2020-08-08 09:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `image`, `created_at`, `updated_at`) VALUES
(24, '/uploads/login/16574670051.PNG', '2022-07-10 13:30:05', '2022-07-10 13:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `login_data`
--

CREATE TABLE `login_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `login_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_data`
--

INSERT INTO `login_data` (`id`, `login_id`, `title`, `description`, `lang_id`, `created_at`, `updated_at`) VALUES
(32, 24, 'الجانب التطبيقي لرسالة ماجستير', 'نمطا التحكم بالوكيل الذكي )الذاتي- الموجه ( بالمنصات الرقمية\r\nوأثرهما على تنمية مها ا رت تحليل البيانات الضخمة لدى طلبة\r\nبرنامج STEM بكليات التربية', 2, '2022-07-10 13:30:05', '2022-07-10 13:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `mains`
--

CREATE TABLE `mains` (
  `id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mains`
--

INSERT INTO `mains` (`id`, `image`, `created_at`, `updated_at`) VALUES
(10, '/uploads/main/1657127601logo.png', '2022-07-06 15:13:21', '2022-07-06 15:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `main_data`
--

CREATE TABLE `main_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `main_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_data`
--

INSERT INTO `main_data` (`id`, `main_id`, `title`, `description`, `lang_id`, `created_at`, `updated_at`) VALUES
(542, 10, 'رسالة ماجستير بعنوان', 'نمطا التحكم بالوكيل الذكي )الذاتي- الموجه ( بالمنصات الرقمية وأثرهما على تنمية مها ا رت تحليل البيانات الضخمة\r\nلدى طلبة برنامج STEM بكليات التربي ة\r\nإعداد الباحثة\r\nأميرة السيد سيداحمد السيد سلام ة\r\nمعيدة بقسم تكنولوجيا التعليم', 2, '2022-07-06 15:13:21', '2022-07-06 15:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `main_goals`
--

CREATE TABLE `main_goals` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_goals`
--

INSERT INTO `main_goals` (`id`, `image`, `created_at`, `updated_at`) VALUES
(18, '/uploads/main_goals/16571289232.jpg', '2022-07-06 15:35:23', '2022-07-06 15:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `main_goals_data`
--

CREATE TABLE `main_goals_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_goal_id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_goals_data`
--

INSERT INTO `main_goals_data` (`id`, `title`, `description`, `main_goal_id`, `lang_id`, `created_at`, `updated_at`) VALUES
(11, 'الإلمام بماهية البيانات الضخمة، وأنواعها ومصادرها، وأهمية تحليلها ..', 'التعرف على برنامج Orange Data Mining ، ومكوناته، ومها ا رت التعامل معه.\r\nالتمكن من مها ا رت التعامل مع البيانا ت الضخمة لدى طلاب برنامج STEM\r\nالتمكن من مها ا رت تمثيل البيانا ت لدى طلاب برنامج STEM\r\nالتمكن من مها ا ر ت تصنيف البيانات لدى طلاب برنامج STEM\r\nالتمكن من مها ا رت تحليل البيانات لدى طلاب برنامج STEM\r\nالتمكن من مها ا رت التنبؤ بالبيانات لدى طلاب برنامج STEM', 18, 2, '2022-07-06 15:35:23', '2022-07-06 15:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `main_insturcation`
--

CREATE TABLE `main_insturcation` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_insturcation`
--

INSERT INTO `main_insturcation` (`id`, `image`, `created_at`, `updated_at`) VALUES
(166, '/uploads/main_insturcation/16573190923.jpg', '2022-07-08 20:24:52', '2022-07-08 20:24:52');

-- --------------------------------------------------------

--
-- Table structure for table `main_insturcation_data`
--

CREATE TABLE `main_insturcation_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `main_insturcation_id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_insturcation_data`
--

INSERT INTO `main_insturcation_data` (`id`, `main_insturcation_id`, `lang_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(190, 166, 2, ')الخاصة بالوكيل الموجه (', 'يجب عليك عزيزي الطالب/ عزيزتي الطالبة فور الدخول للمنصةةةةةةة الر مية\r\nالتعرف على محتويةةاتهةةا ومعرفةةة أهةةدافهةةا، ومن ثم الةةدخول للى اخختبةةار\r\nالتحصةيلي القبلي لعياة الجوانب المعر ية لمها ا رت تحليل البيانات الضةخمة\r\nلديك.\r\nبعد اخنتهاء من اخختبار التحصةةيلي القبلي انتقل لد ا رسةةة المحتوى التعلي مي\r\nللبيانات الضخمة؛ وال ي يتكون من خمسة مديوخت لكل منها أهداف محددة\r\nخبد من اخطلاد عليها بل د ا رسة الموديول.\r\nبعد اخنتهاء من د ا رسة الموديول م بأداء النشاط الخاص به مستعينًا ببعض\r\nالمصادر المتاحة من بل المدرب بالتعاون مع أف ا رد مجموعتك.\r\nيمكنةك طلةب المسةةةةةةةةةةاعةدة من الو يةل الة ي في أي مرحلةة من م ا رحةل التعلم\r\nبالضغط على زر \"الو يل ال ي\" في واجهات تفاعل المنصة الر مية.', '2022-07-08 20:24:52', '2022-07-08 20:24:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(20, 'App\\Admin', 61),
(21, 'App\\Admin', 61),
(22, 'App\\Admin', 61),
(25, 'App\\Admin', 61),
(26, 'App\\Admin', 61),
(27, 'App\\Admin', 61),
(29, 'App\\Admin', 61),
(30, 'App\\Admin', 61),
(31, 'App\\Admin', 61),
(32, 'App\\Admin', 61),
(33, 'App\\Admin', 61),
(34, 'App\\Admin', 61),
(35, 'App\\Admin', 61),
(36, 'App\\Admin', 61),
(37, 'App\\Admin', 61),
(38, 'App\\Admin', 61),
(39, 'App\\Admin', 61),
(40, 'App\\Admin', 61),
(41, 'App\\Admin', 61),
(42, 'App\\Admin', 61),
(43, 'App\\Admin', 61),
(44, 'App\\Admin', 61),
(45, 'App\\Admin', 61),
(46, 'App\\Admin', 61),
(47, 'App\\Admin', 61),
(48, 'App\\Admin', 61),
(49, 'App\\Admin', 61),
(50, 'App\\Admin', 61),
(51, 'App\\Admin', 61),
(52, 'App\\Admin', 61),
(53, 'App\\Admin', 61),
(54, 'App\\Admin', 61),
(55, 'App\\Admin', 61),
(56, 'App\\Admin', 61),
(57, 'App\\Admin', 61),
(58, 'App\\Admin', 61),
(59, 'App\\Admin', 61),
(60, 'App\\Admin', 61),
(61, 'App\\Admin', 61),
(62, 'App\\Admin', 61),
(63, 'App\\Admin', 61),
(64, 'App\\Admin', 61),
(65, 'App\\Admin', 61),
(66, 'App\\Admin', 61),
(67, 'App\\Admin', 61),
(68, 'App\\Admin', 61),
(69, 'App\\Admin', 61),
(70, 'App\\Admin', 61),
(71, 'App\\Admin', 61),
(72, 'App\\Admin', 61),
(73, 'App\\Admin', 61),
(74, 'App\\Admin', 61),
(75, 'App\\Admin', 61),
(76, 'App\\Admin', 61),
(77, 'App\\Admin', 61),
(78, 'App\\Admin', 61),
(79, 'App\\Admin', 61),
(80, 'App\\Admin', 61),
(81, 'App\\Admin', 61),
(82, 'App\\Admin', 61),
(83, 'App\\Admin', 61),
(84, 'App\\Admin', 61),
(85, 'App\\Admin', 61),
(86, 'App\\Admin', 61),
(87, 'App\\Admin', 61),
(88, 'App\\Admin', 61),
(89, 'App\\Admin', 61),
(90, 'App\\Admin', 61),
(91, 'App\\Admin', 61),
(92, 'App\\Admin', 61),
(93, 'App\\Admin', 61),
(94, 'App\\Admin', 61),
(95, 'App\\Admin', 61),
(96, 'App\\Admin', 61),
(97, 'App\\Admin', 61),
(98, 'App\\Admin', 61),
(99, 'App\\Admin', 61),
(100, 'App\\Admin', 61),
(101, 'App\\Admin', 61),
(102, 'App\\Admin', 61),
(103, 'App\\Admin', 61),
(104, 'App\\Admin', 61),
(105, 'App\\Admin', 61),
(106, 'App\\Admin', 61),
(107, 'App\\Admin', 61),
(108, 'App\\Admin', 61),
(109, 'App\\Admin', 61),
(110, 'App\\Admin', 61),
(111, 'App\\Admin', 61),
(112, 'App\\Admin', 61),
(113, 'App\\Admin', 61),
(114, 'App\\Admin', 61),
(115, 'App\\Admin', 61),
(116, 'App\\Admin', 61),
(149, 'App\\Admin', 61),
(150, 'App\\Admin', 61),
(153, 'App\\Admin', 61),
(154, 'App\\Admin', 61),
(20, 'App\\Admin', 62),
(21, 'App\\Admin', 62),
(22, 'App\\Admin', 62),
(25, 'App\\Admin', 62),
(26, 'App\\Admin', 62),
(27, 'App\\Admin', 62),
(29, 'App\\Admin', 62),
(30, 'App\\Admin', 62),
(31, 'App\\Admin', 62),
(32, 'App\\Admin', 62),
(33, 'App\\Admin', 62),
(34, 'App\\Admin', 62),
(35, 'App\\Admin', 62),
(36, 'App\\Admin', 62),
(37, 'App\\Admin', 62),
(38, 'App\\Admin', 62),
(39, 'App\\Admin', 62),
(40, 'App\\Admin', 62),
(41, 'App\\Admin', 62),
(42, 'App\\Admin', 62),
(43, 'App\\Admin', 62),
(44, 'App\\Admin', 62),
(45, 'App\\Admin', 62),
(46, 'App\\Admin', 62),
(47, 'App\\Admin', 62),
(48, 'App\\Admin', 62),
(49, 'App\\Admin', 62),
(50, 'App\\Admin', 62),
(51, 'App\\Admin', 62),
(52, 'App\\Admin', 62),
(53, 'App\\Admin', 62),
(54, 'App\\Admin', 62),
(55, 'App\\Admin', 62),
(56, 'App\\Admin', 62),
(57, 'App\\Admin', 62),
(58, 'App\\Admin', 62),
(59, 'App\\Admin', 62),
(60, 'App\\Admin', 62),
(61, 'App\\Admin', 62),
(62, 'App\\Admin', 62),
(63, 'App\\Admin', 62),
(65, 'App\\Admin', 62),
(66, 'App\\Admin', 62),
(67, 'App\\Admin', 62),
(68, 'App\\Admin', 62),
(69, 'App\\Admin', 62),
(70, 'App\\Admin', 62),
(71, 'App\\Admin', 62),
(72, 'App\\Admin', 62),
(73, 'App\\Admin', 62),
(74, 'App\\Admin', 62),
(75, 'App\\Admin', 62),
(76, 'App\\Admin', 62),
(77, 'App\\Admin', 62),
(79, 'App\\Admin', 62),
(80, 'App\\Admin', 62),
(81, 'App\\Admin', 62),
(83, 'App\\Admin', 62),
(84, 'App\\Admin', 62),
(85, 'App\\Admin', 62),
(86, 'App\\Admin', 62),
(87, 'App\\Admin', 62),
(88, 'App\\Admin', 62),
(89, 'App\\Admin', 62),
(90, 'App\\Admin', 62),
(91, 'App\\Admin', 62),
(92, 'App\\Admin', 62),
(93, 'App\\Admin', 62),
(94, 'App\\Admin', 62),
(96, 'App\\Admin', 62),
(97, 'App\\Admin', 62),
(98, 'App\\Admin', 62),
(99, 'App\\Admin', 62),
(100, 'App\\Admin', 62),
(101, 'App\\Admin', 62),
(102, 'App\\Admin', 62),
(103, 'App\\Admin', 62),
(104, 'App\\Admin', 62),
(105, 'App\\Admin', 62),
(106, 'App\\Admin', 62),
(107, 'App\\Admin', 62),
(108, 'App\\Admin', 62),
(109, 'App\\Admin', 62),
(110, 'App\\Admin', 62),
(113, 'App\\Admin', 62),
(20, 'App\\Admin', 63),
(21, 'App\\Admin', 63),
(22, 'App\\Admin', 63),
(25, 'App\\Admin', 63),
(26, 'App\\Admin', 63),
(27, 'App\\Admin', 63),
(29, 'App\\Admin', 63),
(30, 'App\\Admin', 63),
(31, 'App\\Admin', 63),
(32, 'App\\Admin', 63),
(33, 'App\\Admin', 63),
(34, 'App\\Admin', 63),
(35, 'App\\Admin', 63),
(36, 'App\\Admin', 63),
(37, 'App\\Admin', 63),
(38, 'App\\Admin', 63),
(39, 'App\\Admin', 63),
(40, 'App\\Admin', 63),
(41, 'App\\Admin', 63),
(42, 'App\\Admin', 63),
(43, 'App\\Admin', 63),
(44, 'App\\Admin', 63),
(45, 'App\\Admin', 63),
(46, 'App\\Admin', 63),
(47, 'App\\Admin', 63),
(48, 'App\\Admin', 63),
(49, 'App\\Admin', 63),
(50, 'App\\Admin', 63),
(51, 'App\\Admin', 63),
(52, 'App\\Admin', 63),
(53, 'App\\Admin', 63),
(54, 'App\\Admin', 63),
(55, 'App\\Admin', 63),
(56, 'App\\Admin', 63),
(57, 'App\\Admin', 63),
(58, 'App\\Admin', 63),
(59, 'App\\Admin', 63),
(60, 'App\\Admin', 63),
(61, 'App\\Admin', 63),
(62, 'App\\Admin', 63),
(63, 'App\\Admin', 63),
(65, 'App\\Admin', 63),
(66, 'App\\Admin', 63),
(67, 'App\\Admin', 63),
(68, 'App\\Admin', 63),
(69, 'App\\Admin', 63),
(70, 'App\\Admin', 63),
(71, 'App\\Admin', 63),
(72, 'App\\Admin', 63),
(73, 'App\\Admin', 63),
(74, 'App\\Admin', 63),
(75, 'App\\Admin', 63),
(76, 'App\\Admin', 63),
(77, 'App\\Admin', 63),
(79, 'App\\Admin', 63),
(80, 'App\\Admin', 63),
(81, 'App\\Admin', 63),
(83, 'App\\Admin', 63),
(84, 'App\\Admin', 63),
(85, 'App\\Admin', 63),
(86, 'App\\Admin', 63),
(87, 'App\\Admin', 63),
(88, 'App\\Admin', 63),
(89, 'App\\Admin', 63),
(90, 'App\\Admin', 63),
(91, 'App\\Admin', 63),
(92, 'App\\Admin', 63),
(93, 'App\\Admin', 63),
(94, 'App\\Admin', 63),
(96, 'App\\Admin', 63),
(97, 'App\\Admin', 63),
(98, 'App\\Admin', 63),
(99, 'App\\Admin', 63),
(100, 'App\\Admin', 63),
(101, 'App\\Admin', 63),
(102, 'App\\Admin', 63),
(103, 'App\\Admin', 63),
(104, 'App\\Admin', 63),
(105, 'App\\Admin', 63),
(106, 'App\\Admin', 63),
(107, 'App\\Admin', 63),
(108, 'App\\Admin', 63),
(109, 'App\\Admin', 63),
(110, 'App\\Admin', 63),
(113, 'App\\Admin', 63),
(20, 'App\\Admin', 64),
(21, 'App\\Admin', 64),
(22, 'App\\Admin', 64),
(25, 'App\\Admin', 64),
(26, 'App\\Admin', 64),
(27, 'App\\Admin', 64),
(29, 'App\\Admin', 64),
(30, 'App\\Admin', 64),
(31, 'App\\Admin', 64),
(32, 'App\\Admin', 64),
(33, 'App\\Admin', 64),
(34, 'App\\Admin', 64),
(35, 'App\\Admin', 64),
(36, 'App\\Admin', 64),
(37, 'App\\Admin', 64),
(38, 'App\\Admin', 64),
(39, 'App\\Admin', 64),
(40, 'App\\Admin', 64),
(41, 'App\\Admin', 64),
(42, 'App\\Admin', 64),
(43, 'App\\Admin', 64),
(44, 'App\\Admin', 64),
(45, 'App\\Admin', 64),
(46, 'App\\Admin', 64),
(47, 'App\\Admin', 64),
(48, 'App\\Admin', 64),
(49, 'App\\Admin', 64),
(50, 'App\\Admin', 64),
(51, 'App\\Admin', 64),
(52, 'App\\Admin', 64),
(53, 'App\\Admin', 64),
(54, 'App\\Admin', 64),
(55, 'App\\Admin', 64),
(56, 'App\\Admin', 64),
(57, 'App\\Admin', 64),
(58, 'App\\Admin', 64),
(59, 'App\\Admin', 64),
(60, 'App\\Admin', 64),
(61, 'App\\Admin', 64),
(62, 'App\\Admin', 64),
(63, 'App\\Admin', 64),
(65, 'App\\Admin', 64),
(66, 'App\\Admin', 64),
(67, 'App\\Admin', 64),
(68, 'App\\Admin', 64),
(69, 'App\\Admin', 64),
(70, 'App\\Admin', 64),
(71, 'App\\Admin', 64),
(72, 'App\\Admin', 64),
(73, 'App\\Admin', 64),
(74, 'App\\Admin', 64),
(75, 'App\\Admin', 64),
(76, 'App\\Admin', 64),
(77, 'App\\Admin', 64),
(79, 'App\\Admin', 64),
(80, 'App\\Admin', 64),
(81, 'App\\Admin', 64),
(83, 'App\\Admin', 64),
(84, 'App\\Admin', 64),
(85, 'App\\Admin', 64),
(86, 'App\\Admin', 64),
(87, 'App\\Admin', 64),
(88, 'App\\Admin', 64),
(89, 'App\\Admin', 64),
(90, 'App\\Admin', 64),
(91, 'App\\Admin', 64),
(92, 'App\\Admin', 64),
(93, 'App\\Admin', 64),
(94, 'App\\Admin', 64),
(96, 'App\\Admin', 64),
(97, 'App\\Admin', 64),
(98, 'App\\Admin', 64),
(99, 'App\\Admin', 64),
(100, 'App\\Admin', 64),
(101, 'App\\Admin', 64),
(102, 'App\\Admin', 64),
(103, 'App\\Admin', 64),
(104, 'App\\Admin', 64),
(105, 'App\\Admin', 64),
(106, 'App\\Admin', 64),
(107, 'App\\Admin', 64),
(108, 'App\\Admin', 64),
(109, 'App\\Admin', 64),
(110, 'App\\Admin', 64),
(113, 'App\\Admin', 64),
(20, 'App\\Admin', 68),
(21, 'App\\Admin', 68),
(22, 'App\\Admin', 68),
(25, 'App\\Admin', 68),
(26, 'App\\Admin', 68),
(27, 'App\\Admin', 68),
(29, 'App\\Admin', 68),
(30, 'App\\Admin', 68),
(31, 'App\\Admin', 68),
(32, 'App\\Admin', 68),
(33, 'App\\Admin', 68),
(34, 'App\\Admin', 68),
(35, 'App\\Admin', 68),
(36, 'App\\Admin', 68),
(37, 'App\\Admin', 68),
(38, 'App\\Admin', 68),
(39, 'App\\Admin', 68),
(40, 'App\\Admin', 68),
(41, 'App\\Admin', 68),
(42, 'App\\Admin', 68),
(43, 'App\\Admin', 68),
(44, 'App\\Admin', 68),
(45, 'App\\Admin', 68),
(46, 'App\\Admin', 68),
(47, 'App\\Admin', 68),
(48, 'App\\Admin', 68),
(49, 'App\\Admin', 68),
(50, 'App\\Admin', 68),
(51, 'App\\Admin', 68),
(52, 'App\\Admin', 68),
(53, 'App\\Admin', 68),
(54, 'App\\Admin', 68),
(55, 'App\\Admin', 68),
(56, 'App\\Admin', 68),
(57, 'App\\Admin', 68),
(58, 'App\\Admin', 68),
(59, 'App\\Admin', 68),
(60, 'App\\Admin', 68),
(61, 'App\\Admin', 68),
(62, 'App\\Admin', 68),
(63, 'App\\Admin', 68),
(65, 'App\\Admin', 68),
(66, 'App\\Admin', 68),
(67, 'App\\Admin', 68),
(68, 'App\\Admin', 68),
(69, 'App\\Admin', 68),
(70, 'App\\Admin', 68),
(71, 'App\\Admin', 68),
(72, 'App\\Admin', 68),
(73, 'App\\Admin', 68),
(74, 'App\\Admin', 68),
(75, 'App\\Admin', 68),
(76, 'App\\Admin', 68),
(77, 'App\\Admin', 68),
(79, 'App\\Admin', 68),
(80, 'App\\Admin', 68),
(81, 'App\\Admin', 68),
(83, 'App\\Admin', 68),
(84, 'App\\Admin', 68),
(85, 'App\\Admin', 68),
(86, 'App\\Admin', 68),
(87, 'App\\Admin', 68),
(88, 'App\\Admin', 68),
(89, 'App\\Admin', 68),
(90, 'App\\Admin', 68),
(91, 'App\\Admin', 68),
(92, 'App\\Admin', 68),
(93, 'App\\Admin', 68),
(94, 'App\\Admin', 68),
(96, 'App\\Admin', 68),
(97, 'App\\Admin', 68),
(98, 'App\\Admin', 68),
(99, 'App\\Admin', 68),
(100, 'App\\Admin', 68),
(101, 'App\\Admin', 68),
(102, 'App\\Admin', 68),
(103, 'App\\Admin', 68),
(104, 'App\\Admin', 68),
(105, 'App\\Admin', 68),
(106, 'App\\Admin', 68),
(107, 'App\\Admin', 68),
(108, 'App\\Admin', 68),
(109, 'App\\Admin', 68),
(110, 'App\\Admin', 68),
(113, 'App\\Admin', 68),
(20, 'App\\Admin', 69),
(21, 'App\\Admin', 69),
(22, 'App\\Admin', 69),
(25, 'App\\Admin', 69),
(26, 'App\\Admin', 69),
(27, 'App\\Admin', 69),
(29, 'App\\Admin', 69),
(30, 'App\\Admin', 69),
(31, 'App\\Admin', 69),
(32, 'App\\Admin', 69),
(33, 'App\\Admin', 69),
(34, 'App\\Admin', 69),
(35, 'App\\Admin', 69),
(36, 'App\\Admin', 69),
(37, 'App\\Admin', 69),
(38, 'App\\Admin', 69),
(39, 'App\\Admin', 69),
(40, 'App\\Admin', 69),
(41, 'App\\Admin', 69),
(42, 'App\\Admin', 69),
(43, 'App\\Admin', 69),
(44, 'App\\Admin', 69),
(45, 'App\\Admin', 69),
(46, 'App\\Admin', 69),
(47, 'App\\Admin', 69),
(48, 'App\\Admin', 69),
(49, 'App\\Admin', 69),
(50, 'App\\Admin', 69),
(51, 'App\\Admin', 69),
(52, 'App\\Admin', 69),
(53, 'App\\Admin', 69),
(54, 'App\\Admin', 69),
(55, 'App\\Admin', 69),
(56, 'App\\Admin', 69),
(57, 'App\\Admin', 69),
(58, 'App\\Admin', 69),
(59, 'App\\Admin', 69),
(60, 'App\\Admin', 69),
(61, 'App\\Admin', 69),
(62, 'App\\Admin', 69),
(63, 'App\\Admin', 69),
(65, 'App\\Admin', 69),
(66, 'App\\Admin', 69),
(67, 'App\\Admin', 69),
(68, 'App\\Admin', 69),
(69, 'App\\Admin', 69),
(70, 'App\\Admin', 69),
(71, 'App\\Admin', 69),
(72, 'App\\Admin', 69),
(73, 'App\\Admin', 69),
(74, 'App\\Admin', 69),
(75, 'App\\Admin', 69),
(76, 'App\\Admin', 69),
(77, 'App\\Admin', 69),
(79, 'App\\Admin', 69),
(80, 'App\\Admin', 69),
(81, 'App\\Admin', 69),
(83, 'App\\Admin', 69),
(84, 'App\\Admin', 69),
(85, 'App\\Admin', 69),
(86, 'App\\Admin', 69),
(87, 'App\\Admin', 69),
(88, 'App\\Admin', 69),
(89, 'App\\Admin', 69),
(90, 'App\\Admin', 69),
(91, 'App\\Admin', 69),
(92, 'App\\Admin', 69),
(93, 'App\\Admin', 69),
(94, 'App\\Admin', 69),
(96, 'App\\Admin', 69),
(97, 'App\\Admin', 69),
(98, 'App\\Admin', 69),
(99, 'App\\Admin', 69),
(100, 'App\\Admin', 69),
(101, 'App\\Admin', 69),
(102, 'App\\Admin', 69),
(103, 'App\\Admin', 69),
(104, 'App\\Admin', 69),
(105, 'App\\Admin', 69),
(106, 'App\\Admin', 69),
(107, 'App\\Admin', 69),
(108, 'App\\Admin', 69),
(109, 'App\\Admin', 69),
(110, 'App\\Admin', 69),
(113, 'App\\Admin', 69),
(20, 'App\\Admin', 77),
(21, 'App\\Admin', 77),
(22, 'App\\Admin', 77),
(25, 'App\\Admin', 77),
(26, 'App\\Admin', 77),
(27, 'App\\Admin', 77),
(29, 'App\\Admin', 77),
(30, 'App\\Admin', 77),
(31, 'App\\Admin', 77),
(32, 'App\\Admin', 77),
(33, 'App\\Admin', 77),
(34, 'App\\Admin', 77),
(35, 'App\\Admin', 77),
(36, 'App\\Admin', 77),
(37, 'App\\Admin', 77),
(38, 'App\\Admin', 77),
(39, 'App\\Admin', 77),
(40, 'App\\Admin', 77),
(41, 'App\\Admin', 77),
(42, 'App\\Admin', 77),
(43, 'App\\Admin', 77),
(44, 'App\\Admin', 77),
(45, 'App\\Admin', 77),
(46, 'App\\Admin', 77),
(47, 'App\\Admin', 77),
(48, 'App\\Admin', 77),
(49, 'App\\Admin', 77),
(50, 'App\\Admin', 77),
(51, 'App\\Admin', 77),
(52, 'App\\Admin', 77),
(53, 'App\\Admin', 77),
(54, 'App\\Admin', 77),
(55, 'App\\Admin', 77),
(56, 'App\\Admin', 77),
(57, 'App\\Admin', 77),
(58, 'App\\Admin', 77),
(59, 'App\\Admin', 77),
(60, 'App\\Admin', 77),
(61, 'App\\Admin', 77),
(62, 'App\\Admin', 77),
(63, 'App\\Admin', 77),
(65, 'App\\Admin', 77),
(66, 'App\\Admin', 77),
(67, 'App\\Admin', 77),
(68, 'App\\Admin', 77),
(69, 'App\\Admin', 77),
(70, 'App\\Admin', 77),
(71, 'App\\Admin', 77),
(72, 'App\\Admin', 77),
(73, 'App\\Admin', 77),
(74, 'App\\Admin', 77),
(75, 'App\\Admin', 77),
(76, 'App\\Admin', 77),
(77, 'App\\Admin', 77),
(79, 'App\\Admin', 77),
(80, 'App\\Admin', 77),
(81, 'App\\Admin', 77),
(83, 'App\\Admin', 77),
(84, 'App\\Admin', 77),
(85, 'App\\Admin', 77),
(86, 'App\\Admin', 77),
(87, 'App\\Admin', 77),
(88, 'App\\Admin', 77),
(89, 'App\\Admin', 77),
(90, 'App\\Admin', 77),
(91, 'App\\Admin', 77),
(92, 'App\\Admin', 77),
(93, 'App\\Admin', 77),
(94, 'App\\Admin', 77),
(96, 'App\\Admin', 77),
(97, 'App\\Admin', 77),
(98, 'App\\Admin', 77),
(99, 'App\\Admin', 77),
(100, 'App\\Admin', 77),
(101, 'App\\Admin', 77),
(102, 'App\\Admin', 77),
(103, 'App\\Admin', 77),
(104, 'App\\Admin', 77),
(105, 'App\\Admin', 77),
(106, 'App\\Admin', 77),
(107, 'App\\Admin', 77),
(108, 'App\\Admin', 77),
(109, 'App\\Admin', 77),
(110, 'App\\Admin', 77),
(113, 'App\\Admin', 77),
(20, 'App\\Admin', 78),
(21, 'App\\Admin', 78),
(22, 'App\\Admin', 78),
(25, 'App\\Admin', 78),
(26, 'App\\Admin', 78),
(27, 'App\\Admin', 78),
(29, 'App\\Admin', 78),
(30, 'App\\Admin', 78),
(31, 'App\\Admin', 78),
(32, 'App\\Admin', 78),
(33, 'App\\Admin', 78),
(34, 'App\\Admin', 78),
(35, 'App\\Admin', 78),
(36, 'App\\Admin', 78),
(37, 'App\\Admin', 78),
(38, 'App\\Admin', 78),
(39, 'App\\Admin', 78),
(40, 'App\\Admin', 78),
(41, 'App\\Admin', 78),
(42, 'App\\Admin', 78),
(43, 'App\\Admin', 78),
(44, 'App\\Admin', 78),
(45, 'App\\Admin', 78),
(46, 'App\\Admin', 78),
(47, 'App\\Admin', 78),
(48, 'App\\Admin', 78),
(49, 'App\\Admin', 78),
(50, 'App\\Admin', 78),
(51, 'App\\Admin', 78),
(52, 'App\\Admin', 78),
(53, 'App\\Admin', 78),
(54, 'App\\Admin', 78),
(55, 'App\\Admin', 78),
(56, 'App\\Admin', 78),
(57, 'App\\Admin', 78),
(58, 'App\\Admin', 78),
(59, 'App\\Admin', 78),
(60, 'App\\Admin', 78),
(61, 'App\\Admin', 78),
(62, 'App\\Admin', 78),
(63, 'App\\Admin', 78),
(65, 'App\\Admin', 78),
(66, 'App\\Admin', 78),
(67, 'App\\Admin', 78),
(68, 'App\\Admin', 78),
(69, 'App\\Admin', 78),
(70, 'App\\Admin', 78),
(71, 'App\\Admin', 78),
(72, 'App\\Admin', 78),
(73, 'App\\Admin', 78),
(74, 'App\\Admin', 78),
(75, 'App\\Admin', 78),
(76, 'App\\Admin', 78),
(77, 'App\\Admin', 78),
(79, 'App\\Admin', 78),
(80, 'App\\Admin', 78),
(81, 'App\\Admin', 78),
(83, 'App\\Admin', 78),
(84, 'App\\Admin', 78),
(85, 'App\\Admin', 78),
(86, 'App\\Admin', 78),
(87, 'App\\Admin', 78),
(88, 'App\\Admin', 78),
(89, 'App\\Admin', 78),
(90, 'App\\Admin', 78),
(91, 'App\\Admin', 78),
(92, 'App\\Admin', 78),
(93, 'App\\Admin', 78),
(94, 'App\\Admin', 78),
(96, 'App\\Admin', 78),
(97, 'App\\Admin', 78),
(98, 'App\\Admin', 78),
(99, 'App\\Admin', 78),
(100, 'App\\Admin', 78),
(101, 'App\\Admin', 78),
(102, 'App\\Admin', 78),
(103, 'App\\Admin', 78),
(104, 'App\\Admin', 78),
(105, 'App\\Admin', 78),
(106, 'App\\Admin', 78),
(107, 'App\\Admin', 78),
(108, 'App\\Admin', 78),
(109, 'App\\Admin', 78),
(110, 'App\\Admin', 78),
(113, 'App\\Admin', 78),
(20, 'App\\Admin', 90),
(21, 'App\\Admin', 90),
(22, 'App\\Admin', 90),
(25, 'App\\Admin', 90),
(26, 'App\\Admin', 90),
(27, 'App\\Admin', 90),
(29, 'App\\Admin', 90),
(30, 'App\\Admin', 90),
(31, 'App\\Admin', 90),
(32, 'App\\Admin', 90),
(33, 'App\\Admin', 90),
(34, 'App\\Admin', 90),
(35, 'App\\Admin', 90),
(36, 'App\\Admin', 90),
(37, 'App\\Admin', 90),
(38, 'App\\Admin', 90),
(39, 'App\\Admin', 90),
(40, 'App\\Admin', 90),
(41, 'App\\Admin', 90),
(42, 'App\\Admin', 90),
(43, 'App\\Admin', 90),
(44, 'App\\Admin', 90),
(45, 'App\\Admin', 90),
(46, 'App\\Admin', 90),
(47, 'App\\Admin', 90),
(48, 'App\\Admin', 90),
(49, 'App\\Admin', 90),
(50, 'App\\Admin', 90),
(51, 'App\\Admin', 90),
(52, 'App\\Admin', 90),
(53, 'App\\Admin', 90),
(54, 'App\\Admin', 90),
(55, 'App\\Admin', 90),
(56, 'App\\Admin', 90),
(57, 'App\\Admin', 90),
(58, 'App\\Admin', 90),
(59, 'App\\Admin', 90),
(60, 'App\\Admin', 90),
(61, 'App\\Admin', 90),
(62, 'App\\Admin', 90),
(63, 'App\\Admin', 90),
(64, 'App\\Admin', 90),
(65, 'App\\Admin', 90),
(66, 'App\\Admin', 90),
(67, 'App\\Admin', 90),
(68, 'App\\Admin', 90),
(69, 'App\\Admin', 90),
(70, 'App\\Admin', 90),
(71, 'App\\Admin', 90),
(72, 'App\\Admin', 90),
(73, 'App\\Admin', 90),
(74, 'App\\Admin', 90),
(75, 'App\\Admin', 90),
(76, 'App\\Admin', 90),
(77, 'App\\Admin', 90),
(78, 'App\\Admin', 90),
(79, 'App\\Admin', 90),
(80, 'App\\Admin', 90),
(81, 'App\\Admin', 90),
(82, 'App\\Admin', 90),
(83, 'App\\Admin', 90),
(84, 'App\\Admin', 90),
(85, 'App\\Admin', 90),
(86, 'App\\Admin', 90),
(87, 'App\\Admin', 90),
(88, 'App\\Admin', 90),
(89, 'App\\Admin', 90),
(90, 'App\\Admin', 90),
(91, 'App\\Admin', 90),
(92, 'App\\Admin', 90),
(93, 'App\\Admin', 90),
(94, 'App\\Admin', 90),
(95, 'App\\Admin', 90),
(96, 'App\\Admin', 90),
(97, 'App\\Admin', 90),
(98, 'App\\Admin', 90),
(99, 'App\\Admin', 90),
(100, 'App\\Admin', 90),
(101, 'App\\Admin', 90),
(102, 'App\\Admin', 90),
(103, 'App\\Admin', 90),
(104, 'App\\Admin', 90),
(105, 'App\\Admin', 90),
(106, 'App\\Admin', 90),
(107, 'App\\Admin', 90),
(108, 'App\\Admin', 90),
(109, 'App\\Admin', 90),
(110, 'App\\Admin', 90),
(111, 'App\\Admin', 90),
(112, 'App\\Admin', 90),
(113, 'App\\Admin', 90),
(114, 'App\\Admin', 90),
(115, 'App\\Admin', 90),
(116, 'App\\Admin', 90),
(149, 'App\\Admin', 90),
(150, 'App\\Admin', 90),
(153, 'App\\Admin', 90),
(154, 'App\\Admin', 90),
(20, 'App\\Admin', 92),
(21, 'App\\Admin', 92),
(22, 'App\\Admin', 92),
(25, 'App\\Admin', 92),
(26, 'App\\Admin', 92),
(27, 'App\\Admin', 92),
(29, 'App\\Admin', 92),
(30, 'App\\Admin', 92),
(31, 'App\\Admin', 92),
(32, 'App\\Admin', 92),
(33, 'App\\Admin', 92),
(34, 'App\\Admin', 92),
(35, 'App\\Admin', 92),
(36, 'App\\Admin', 92),
(37, 'App\\Admin', 92),
(38, 'App\\Admin', 92),
(39, 'App\\Admin', 92),
(40, 'App\\Admin', 92),
(41, 'App\\Admin', 92),
(42, 'App\\Admin', 92),
(43, 'App\\Admin', 92),
(44, 'App\\Admin', 92),
(45, 'App\\Admin', 92),
(46, 'App\\Admin', 92),
(47, 'App\\Admin', 92),
(48, 'App\\Admin', 92),
(49, 'App\\Admin', 92),
(50, 'App\\Admin', 92),
(51, 'App\\Admin', 92),
(52, 'App\\Admin', 92),
(53, 'App\\Admin', 92),
(54, 'App\\Admin', 92),
(55, 'App\\Admin', 92),
(56, 'App\\Admin', 92),
(57, 'App\\Admin', 92),
(58, 'App\\Admin', 92),
(59, 'App\\Admin', 92),
(60, 'App\\Admin', 92),
(61, 'App\\Admin', 92),
(62, 'App\\Admin', 92),
(63, 'App\\Admin', 92),
(64, 'App\\Admin', 92),
(65, 'App\\Admin', 92),
(66, 'App\\Admin', 92),
(67, 'App\\Admin', 92),
(68, 'App\\Admin', 92),
(69, 'App\\Admin', 92),
(70, 'App\\Admin', 92),
(71, 'App\\Admin', 92),
(72, 'App\\Admin', 92),
(73, 'App\\Admin', 92),
(74, 'App\\Admin', 92),
(75, 'App\\Admin', 92),
(76, 'App\\Admin', 92),
(77, 'App\\Admin', 92),
(78, 'App\\Admin', 92),
(79, 'App\\Admin', 92),
(80, 'App\\Admin', 92),
(81, 'App\\Admin', 92),
(82, 'App\\Admin', 92),
(83, 'App\\Admin', 92),
(84, 'App\\Admin', 92),
(85, 'App\\Admin', 92),
(86, 'App\\Admin', 92),
(87, 'App\\Admin', 92),
(88, 'App\\Admin', 92),
(89, 'App\\Admin', 92),
(90, 'App\\Admin', 92),
(91, 'App\\Admin', 92),
(92, 'App\\Admin', 92),
(93, 'App\\Admin', 92),
(94, 'App\\Admin', 92),
(95, 'App\\Admin', 92),
(96, 'App\\Admin', 92),
(97, 'App\\Admin', 92),
(98, 'App\\Admin', 92),
(99, 'App\\Admin', 92),
(100, 'App\\Admin', 92),
(101, 'App\\Admin', 92),
(102, 'App\\Admin', 92),
(103, 'App\\Admin', 92),
(104, 'App\\Admin', 92),
(105, 'App\\Admin', 92),
(106, 'App\\Admin', 92),
(107, 'App\\Admin', 92),
(108, 'App\\Admin', 92),
(109, 'App\\Admin', 92),
(110, 'App\\Admin', 92),
(111, 'App\\Admin', 92),
(112, 'App\\Admin', 92),
(113, 'App\\Admin', 92),
(114, 'App\\Admin', 92),
(115, 'App\\Admin', 92),
(116, 'App\\Admin', 92),
(149, 'App\\Admin', 92),
(150, 'App\\Admin', 92),
(153, 'App\\Admin', 92),
(154, 'App\\Admin', 92),
(20, 'App\\Admin', 242),
(21, 'App\\Admin', 242),
(22, 'App\\Admin', 242),
(25, 'App\\Admin', 242),
(26, 'App\\Admin', 242),
(27, 'App\\Admin', 242),
(29, 'App\\Admin', 242),
(30, 'App\\Admin', 242),
(31, 'App\\Admin', 242),
(32, 'App\\Admin', 242),
(33, 'App\\Admin', 242),
(34, 'App\\Admin', 242),
(35, 'App\\Admin', 242),
(36, 'App\\Admin', 242),
(37, 'App\\Admin', 242),
(38, 'App\\Admin', 242),
(39, 'App\\Admin', 242),
(40, 'App\\Admin', 242),
(41, 'App\\Admin', 242),
(42, 'App\\Admin', 242),
(43, 'App\\Admin', 242),
(44, 'App\\Admin', 242),
(45, 'App\\Admin', 242),
(46, 'App\\Admin', 242),
(47, 'App\\Admin', 242),
(48, 'App\\Admin', 242),
(49, 'App\\Admin', 242),
(50, 'App\\Admin', 242),
(51, 'App\\Admin', 242),
(52, 'App\\Admin', 242),
(53, 'App\\Admin', 242),
(54, 'App\\Admin', 242),
(55, 'App\\Admin', 242),
(56, 'App\\Admin', 242),
(57, 'App\\Admin', 242),
(58, 'App\\Admin', 242),
(59, 'App\\Admin', 242),
(60, 'App\\Admin', 242),
(61, 'App\\Admin', 242),
(62, 'App\\Admin', 242),
(63, 'App\\Admin', 242),
(64, 'App\\Admin', 242),
(65, 'App\\Admin', 242),
(66, 'App\\Admin', 242),
(67, 'App\\Admin', 242),
(68, 'App\\Admin', 242),
(69, 'App\\Admin', 242),
(70, 'App\\Admin', 242),
(71, 'App\\Admin', 242),
(72, 'App\\Admin', 242),
(73, 'App\\Admin', 242),
(74, 'App\\Admin', 242),
(75, 'App\\Admin', 242),
(76, 'App\\Admin', 242),
(77, 'App\\Admin', 242),
(78, 'App\\Admin', 242),
(79, 'App\\Admin', 242),
(80, 'App\\Admin', 242),
(81, 'App\\Admin', 242),
(82, 'App\\Admin', 242),
(83, 'App\\Admin', 242),
(84, 'App\\Admin', 242),
(85, 'App\\Admin', 242),
(86, 'App\\Admin', 242),
(87, 'App\\Admin', 242),
(88, 'App\\Admin', 242),
(89, 'App\\Admin', 242),
(90, 'App\\Admin', 242),
(91, 'App\\Admin', 242),
(92, 'App\\Admin', 242),
(93, 'App\\Admin', 242),
(94, 'App\\Admin', 242),
(95, 'App\\Admin', 242),
(96, 'App\\Admin', 242),
(97, 'App\\Admin', 242),
(98, 'App\\Admin', 242),
(99, 'App\\Admin', 242),
(100, 'App\\Admin', 242),
(101, 'App\\Admin', 242),
(102, 'App\\Admin', 242),
(103, 'App\\Admin', 242),
(104, 'App\\Admin', 242),
(105, 'App\\Admin', 242),
(106, 'App\\Admin', 242),
(107, 'App\\Admin', 242),
(108, 'App\\Admin', 242),
(109, 'App\\Admin', 242),
(110, 'App\\Admin', 242),
(111, 'App\\Admin', 242),
(112, 'App\\Admin', 242),
(113, 'App\\Admin', 242),
(114, 'App\\Admin', 242),
(115, 'App\\Admin', 242),
(116, 'App\\Admin', 242),
(149, 'App\\Admin', 242),
(150, 'App\\Admin', 242),
(153, 'App\\Admin', 242),
(154, 'App\\Admin', 242),
(20, 'App\\Admin', 243),
(21, 'App\\Admin', 243),
(22, 'App\\Admin', 243),
(25, 'App\\Admin', 243),
(26, 'App\\Admin', 243),
(27, 'App\\Admin', 243),
(29, 'App\\Admin', 243),
(30, 'App\\Admin', 243),
(31, 'App\\Admin', 243),
(32, 'App\\Admin', 243),
(33, 'App\\Admin', 243),
(34, 'App\\Admin', 243),
(35, 'App\\Admin', 243),
(36, 'App\\Admin', 243),
(37, 'App\\Admin', 243),
(38, 'App\\Admin', 243),
(39, 'App\\Admin', 243),
(40, 'App\\Admin', 243),
(41, 'App\\Admin', 243),
(42, 'App\\Admin', 243),
(43, 'App\\Admin', 243),
(44, 'App\\Admin', 243),
(45, 'App\\Admin', 243),
(46, 'App\\Admin', 243),
(47, 'App\\Admin', 243),
(48, 'App\\Admin', 243),
(49, 'App\\Admin', 243),
(50, 'App\\Admin', 243),
(51, 'App\\Admin', 243),
(52, 'App\\Admin', 243),
(53, 'App\\Admin', 243),
(54, 'App\\Admin', 243),
(55, 'App\\Admin', 243),
(56, 'App\\Admin', 243),
(57, 'App\\Admin', 243),
(58, 'App\\Admin', 243),
(59, 'App\\Admin', 243),
(60, 'App\\Admin', 243),
(61, 'App\\Admin', 243),
(62, 'App\\Admin', 243),
(63, 'App\\Admin', 243),
(64, 'App\\Admin', 243),
(65, 'App\\Admin', 243),
(66, 'App\\Admin', 243),
(67, 'App\\Admin', 243),
(68, 'App\\Admin', 243),
(69, 'App\\Admin', 243),
(70, 'App\\Admin', 243),
(71, 'App\\Admin', 243),
(72, 'App\\Admin', 243),
(73, 'App\\Admin', 243),
(74, 'App\\Admin', 243),
(75, 'App\\Admin', 243),
(76, 'App\\Admin', 243),
(77, 'App\\Admin', 243),
(78, 'App\\Admin', 243),
(79, 'App\\Admin', 243),
(80, 'App\\Admin', 243),
(81, 'App\\Admin', 243),
(82, 'App\\Admin', 243),
(83, 'App\\Admin', 243),
(84, 'App\\Admin', 243),
(85, 'App\\Admin', 243),
(86, 'App\\Admin', 243),
(87, 'App\\Admin', 243),
(88, 'App\\Admin', 243),
(89, 'App\\Admin', 243),
(90, 'App\\Admin', 243),
(91, 'App\\Admin', 243),
(92, 'App\\Admin', 243),
(93, 'App\\Admin', 243),
(94, 'App\\Admin', 243),
(95, 'App\\Admin', 243),
(96, 'App\\Admin', 243),
(97, 'App\\Admin', 243),
(98, 'App\\Admin', 243),
(99, 'App\\Admin', 243),
(100, 'App\\Admin', 243),
(101, 'App\\Admin', 243),
(102, 'App\\Admin', 243),
(103, 'App\\Admin', 243),
(104, 'App\\Admin', 243),
(105, 'App\\Admin', 243),
(106, 'App\\Admin', 243),
(107, 'App\\Admin', 243),
(108, 'App\\Admin', 243),
(109, 'App\\Admin', 243),
(110, 'App\\Admin', 243),
(111, 'App\\Admin', 243),
(112, 'App\\Admin', 243),
(113, 'App\\Admin', 243),
(114, 'App\\Admin', 243),
(115, 'App\\Admin', 243),
(116, 'App\\Admin', 243),
(149, 'App\\Admin', 243),
(150, 'App\\Admin', 243),
(153, 'App\\Admin', 243),
(154, 'App\\Admin', 243),
(20, 'App\\Admin', 244),
(21, 'App\\Admin', 244),
(22, 'App\\Admin', 244),
(25, 'App\\Admin', 244),
(26, 'App\\Admin', 244),
(27, 'App\\Admin', 244),
(29, 'App\\Admin', 244),
(30, 'App\\Admin', 244),
(31, 'App\\Admin', 244),
(32, 'App\\Admin', 244),
(33, 'App\\Admin', 244),
(34, 'App\\Admin', 244),
(35, 'App\\Admin', 244),
(36, 'App\\Admin', 244),
(37, 'App\\Admin', 244),
(38, 'App\\Admin', 244),
(39, 'App\\Admin', 244),
(40, 'App\\Admin', 244),
(41, 'App\\Admin', 244),
(42, 'App\\Admin', 244),
(43, 'App\\Admin', 244),
(44, 'App\\Admin', 244),
(45, 'App\\Admin', 244),
(46, 'App\\Admin', 244),
(47, 'App\\Admin', 244),
(48, 'App\\Admin', 244),
(49, 'App\\Admin', 244),
(50, 'App\\Admin', 244),
(51, 'App\\Admin', 244),
(52, 'App\\Admin', 244),
(53, 'App\\Admin', 244),
(54, 'App\\Admin', 244),
(55, 'App\\Admin', 244),
(56, 'App\\Admin', 244),
(57, 'App\\Admin', 244),
(58, 'App\\Admin', 244),
(59, 'App\\Admin', 244),
(60, 'App\\Admin', 244),
(61, 'App\\Admin', 244),
(62, 'App\\Admin', 244),
(63, 'App\\Admin', 244),
(64, 'App\\Admin', 244),
(65, 'App\\Admin', 244),
(66, 'App\\Admin', 244),
(67, 'App\\Admin', 244),
(68, 'App\\Admin', 244),
(69, 'App\\Admin', 244),
(70, 'App\\Admin', 244),
(71, 'App\\Admin', 244),
(72, 'App\\Admin', 244),
(73, 'App\\Admin', 244),
(74, 'App\\Admin', 244),
(75, 'App\\Admin', 244),
(76, 'App\\Admin', 244),
(77, 'App\\Admin', 244),
(78, 'App\\Admin', 244),
(79, 'App\\Admin', 244),
(80, 'App\\Admin', 244),
(81, 'App\\Admin', 244),
(82, 'App\\Admin', 244),
(83, 'App\\Admin', 244),
(84, 'App\\Admin', 244),
(85, 'App\\Admin', 244),
(86, 'App\\Admin', 244),
(87, 'App\\Admin', 244),
(88, 'App\\Admin', 244),
(89, 'App\\Admin', 244),
(90, 'App\\Admin', 244),
(91, 'App\\Admin', 244),
(92, 'App\\Admin', 244),
(93, 'App\\Admin', 244),
(94, 'App\\Admin', 244),
(95, 'App\\Admin', 244),
(96, 'App\\Admin', 244),
(97, 'App\\Admin', 244),
(98, 'App\\Admin', 244),
(99, 'App\\Admin', 244),
(100, 'App\\Admin', 244),
(101, 'App\\Admin', 244),
(102, 'App\\Admin', 244),
(103, 'App\\Admin', 244),
(104, 'App\\Admin', 244),
(105, 'App\\Admin', 244),
(106, 'App\\Admin', 244),
(107, 'App\\Admin', 244),
(108, 'App\\Admin', 244),
(109, 'App\\Admin', 244),
(110, 'App\\Admin', 244),
(111, 'App\\Admin', 244),
(112, 'App\\Admin', 244),
(113, 'App\\Admin', 244),
(114, 'App\\Admin', 244),
(115, 'App\\Admin', 244),
(116, 'App\\Admin', 244),
(149, 'App\\Admin', 244),
(150, 'App\\Admin', 244),
(153, 'App\\Admin', 244),
(154, 'App\\Admin', 244),
(112, 'App\\Admin', 245),
(20, 'App\\Admin', 247),
(21, 'App\\Admin', 247),
(22, 'App\\Admin', 247),
(25, 'App\\Admin', 247),
(26, 'App\\Admin', 247),
(27, 'App\\Admin', 247),
(29, 'App\\Admin', 247),
(30, 'App\\Admin', 247),
(31, 'App\\Admin', 247),
(32, 'App\\Admin', 247),
(33, 'App\\Admin', 247),
(34, 'App\\Admin', 247),
(35, 'App\\Admin', 247),
(36, 'App\\Admin', 247),
(37, 'App\\Admin', 247),
(38, 'App\\Admin', 247),
(39, 'App\\Admin', 247),
(40, 'App\\Admin', 247),
(41, 'App\\Admin', 247),
(42, 'App\\Admin', 247),
(43, 'App\\Admin', 247),
(44, 'App\\Admin', 247),
(45, 'App\\Admin', 247),
(46, 'App\\Admin', 247),
(47, 'App\\Admin', 247),
(48, 'App\\Admin', 247),
(49, 'App\\Admin', 247),
(50, 'App\\Admin', 247),
(51, 'App\\Admin', 247),
(52, 'App\\Admin', 247),
(53, 'App\\Admin', 247),
(54, 'App\\Admin', 247),
(55, 'App\\Admin', 247),
(56, 'App\\Admin', 247),
(57, 'App\\Admin', 247),
(58, 'App\\Admin', 247),
(59, 'App\\Admin', 247),
(60, 'App\\Admin', 247),
(61, 'App\\Admin', 247),
(62, 'App\\Admin', 247),
(63, 'App\\Admin', 247),
(64, 'App\\Admin', 247),
(65, 'App\\Admin', 247),
(66, 'App\\Admin', 247),
(67, 'App\\Admin', 247),
(68, 'App\\Admin', 247),
(69, 'App\\Admin', 247),
(70, 'App\\Admin', 247),
(71, 'App\\Admin', 247),
(72, 'App\\Admin', 247),
(73, 'App\\Admin', 247),
(74, 'App\\Admin', 247),
(75, 'App\\Admin', 247),
(76, 'App\\Admin', 247),
(77, 'App\\Admin', 247),
(78, 'App\\Admin', 247),
(79, 'App\\Admin', 247),
(80, 'App\\Admin', 247),
(81, 'App\\Admin', 247),
(82, 'App\\Admin', 247),
(83, 'App\\Admin', 247),
(84, 'App\\Admin', 247),
(85, 'App\\Admin', 247),
(86, 'App\\Admin', 247),
(87, 'App\\Admin', 247),
(88, 'App\\Admin', 247),
(89, 'App\\Admin', 247),
(90, 'App\\Admin', 247),
(91, 'App\\Admin', 247),
(92, 'App\\Admin', 247),
(93, 'App\\Admin', 247),
(94, 'App\\Admin', 247),
(95, 'App\\Admin', 247),
(96, 'App\\Admin', 247),
(97, 'App\\Admin', 247),
(98, 'App\\Admin', 247),
(99, 'App\\Admin', 247),
(100, 'App\\Admin', 247),
(101, 'App\\Admin', 247),
(102, 'App\\Admin', 247),
(103, 'App\\Admin', 247),
(104, 'App\\Admin', 247),
(105, 'App\\Admin', 247),
(106, 'App\\Admin', 247),
(107, 'App\\Admin', 247),
(108, 'App\\Admin', 247),
(109, 'App\\Admin', 247),
(110, 'App\\Admin', 247),
(111, 'App\\Admin', 247),
(112, 'App\\Admin', 247),
(113, 'App\\Admin', 247),
(114, 'App\\Admin', 247),
(115, 'App\\Admin', 247),
(116, 'App\\Admin', 247),
(149, 'App\\Admin', 247),
(150, 'App\\Admin', 247),
(153, 'App\\Admin', 247),
(154, 'App\\Admin', 247),
(20, 'App\\Admin', 251),
(21, 'App\\Admin', 251),
(22, 'App\\Admin', 251),
(25, 'App\\Admin', 251),
(26, 'App\\Admin', 251),
(27, 'App\\Admin', 251),
(29, 'App\\Admin', 251),
(30, 'App\\Admin', 251),
(31, 'App\\Admin', 251),
(32, 'App\\Admin', 251),
(33, 'App\\Admin', 251),
(34, 'App\\Admin', 251),
(35, 'App\\Admin', 251),
(36, 'App\\Admin', 251),
(37, 'App\\Admin', 251),
(38, 'App\\Admin', 251),
(39, 'App\\Admin', 251),
(40, 'App\\Admin', 251),
(41, 'App\\Admin', 251),
(42, 'App\\Admin', 251),
(43, 'App\\Admin', 251),
(44, 'App\\Admin', 251),
(45, 'App\\Admin', 251),
(46, 'App\\Admin', 251),
(47, 'App\\Admin', 251),
(48, 'App\\Admin', 251),
(49, 'App\\Admin', 251),
(50, 'App\\Admin', 251),
(51, 'App\\Admin', 251),
(52, 'App\\Admin', 251),
(53, 'App\\Admin', 251),
(54, 'App\\Admin', 251),
(55, 'App\\Admin', 251),
(56, 'App\\Admin', 251),
(57, 'App\\Admin', 251),
(58, 'App\\Admin', 251),
(59, 'App\\Admin', 251),
(60, 'App\\Admin', 251),
(61, 'App\\Admin', 251),
(62, 'App\\Admin', 251),
(63, 'App\\Admin', 251),
(64, 'App\\Admin', 251),
(65, 'App\\Admin', 251),
(66, 'App\\Admin', 251),
(67, 'App\\Admin', 251),
(68, 'App\\Admin', 251),
(69, 'App\\Admin', 251),
(70, 'App\\Admin', 251),
(71, 'App\\Admin', 251),
(72, 'App\\Admin', 251),
(73, 'App\\Admin', 251),
(74, 'App\\Admin', 251),
(75, 'App\\Admin', 251),
(76, 'App\\Admin', 251),
(77, 'App\\Admin', 251),
(78, 'App\\Admin', 251),
(79, 'App\\Admin', 251),
(80, 'App\\Admin', 251),
(81, 'App\\Admin', 251),
(82, 'App\\Admin', 251),
(83, 'App\\Admin', 251),
(84, 'App\\Admin', 251),
(85, 'App\\Admin', 251),
(86, 'App\\Admin', 251),
(87, 'App\\Admin', 251),
(88, 'App\\Admin', 251),
(89, 'App\\Admin', 251),
(90, 'App\\Admin', 251),
(91, 'App\\Admin', 251),
(92, 'App\\Admin', 251),
(93, 'App\\Admin', 251),
(94, 'App\\Admin', 251),
(95, 'App\\Admin', 251),
(96, 'App\\Admin', 251),
(97, 'App\\Admin', 251),
(98, 'App\\Admin', 251),
(99, 'App\\Admin', 251),
(100, 'App\\Admin', 251),
(101, 'App\\Admin', 251),
(102, 'App\\Admin', 251),
(103, 'App\\Admin', 251),
(104, 'App\\Admin', 251),
(105, 'App\\Admin', 251),
(106, 'App\\Admin', 251),
(107, 'App\\Admin', 251),
(108, 'App\\Admin', 251),
(109, 'App\\Admin', 251),
(110, 'App\\Admin', 251),
(111, 'App\\Admin', 251),
(112, 'App\\Admin', 251),
(113, 'App\\Admin', 251),
(114, 'App\\Admin', 251),
(115, 'App\\Admin', 251),
(116, 'App\\Admin', 251),
(149, 'App\\Admin', 251),
(150, 'App\\Admin', 251),
(153, 'App\\Admin', 251),
(154, 'App\\Admin', 251),
(20, 'App\\Admin', 264),
(26, 'App\\Admin', 264),
(31, 'App\\Admin', 264),
(32, 'App\\Admin', 264),
(33, 'App\\Admin', 264),
(34, 'App\\Admin', 264),
(40, 'App\\Admin', 264),
(43, 'App\\Admin', 264),
(44, 'App\\Admin', 264),
(46, 'App\\Admin', 264),
(60, 'App\\Admin', 264),
(61, 'App\\Admin', 264),
(62, 'App\\Admin', 264),
(63, 'App\\Admin', 264),
(99, 'App\\Admin', 264),
(100, 'App\\Admin', 264),
(101, 'App\\Admin', 264),
(102, 'App\\Admin', 264),
(103, 'App\\Admin', 264),
(104, 'App\\Admin', 264),
(105, 'App\\Admin', 264),
(106, 'App\\Admin', 264),
(107, 'App\\Admin', 264),
(20, 'App\\Admin', 265),
(21, 'App\\Admin', 265),
(22, 'App\\Admin', 265),
(25, 'App\\Admin', 265),
(26, 'App\\Admin', 265),
(27, 'App\\Admin', 265),
(29, 'App\\Admin', 265),
(30, 'App\\Admin', 265),
(31, 'App\\Admin', 265),
(32, 'App\\Admin', 265),
(33, 'App\\Admin', 265),
(34, 'App\\Admin', 265),
(35, 'App\\Admin', 265),
(36, 'App\\Admin', 265),
(37, 'App\\Admin', 265),
(38, 'App\\Admin', 265),
(39, 'App\\Admin', 265),
(40, 'App\\Admin', 265),
(41, 'App\\Admin', 265),
(42, 'App\\Admin', 265),
(43, 'App\\Admin', 265),
(44, 'App\\Admin', 265),
(45, 'App\\Admin', 265),
(46, 'App\\Admin', 265),
(47, 'App\\Admin', 265),
(48, 'App\\Admin', 265),
(49, 'App\\Admin', 265),
(50, 'App\\Admin', 265),
(51, 'App\\Admin', 265),
(52, 'App\\Admin', 265),
(53, 'App\\Admin', 265),
(54, 'App\\Admin', 265),
(55, 'App\\Admin', 265),
(56, 'App\\Admin', 265),
(57, 'App\\Admin', 265),
(58, 'App\\Admin', 265),
(59, 'App\\Admin', 265),
(60, 'App\\Admin', 265),
(61, 'App\\Admin', 265),
(62, 'App\\Admin', 265),
(63, 'App\\Admin', 265),
(64, 'App\\Admin', 265),
(65, 'App\\Admin', 265),
(66, 'App\\Admin', 265),
(67, 'App\\Admin', 265),
(68, 'App\\Admin', 265),
(69, 'App\\Admin', 265),
(70, 'App\\Admin', 265),
(71, 'App\\Admin', 265),
(72, 'App\\Admin', 265),
(73, 'App\\Admin', 265),
(74, 'App\\Admin', 265),
(75, 'App\\Admin', 265),
(76, 'App\\Admin', 265),
(77, 'App\\Admin', 265),
(78, 'App\\Admin', 265),
(79, 'App\\Admin', 265),
(80, 'App\\Admin', 265),
(81, 'App\\Admin', 265),
(82, 'App\\Admin', 265),
(83, 'App\\Admin', 265),
(84, 'App\\Admin', 265),
(85, 'App\\Admin', 265),
(86, 'App\\Admin', 265),
(87, 'App\\Admin', 265),
(88, 'App\\Admin', 265),
(89, 'App\\Admin', 265),
(90, 'App\\Admin', 265),
(91, 'App\\Admin', 265),
(92, 'App\\Admin', 265),
(93, 'App\\Admin', 265),
(94, 'App\\Admin', 265),
(95, 'App\\Admin', 265),
(96, 'App\\Admin', 265),
(97, 'App\\Admin', 265),
(98, 'App\\Admin', 265),
(99, 'App\\Admin', 265),
(100, 'App\\Admin', 265),
(101, 'App\\Admin', 265),
(102, 'App\\Admin', 265),
(103, 'App\\Admin', 265),
(104, 'App\\Admin', 265),
(105, 'App\\Admin', 265),
(106, 'App\\Admin', 265),
(107, 'App\\Admin', 265),
(108, 'App\\Admin', 265),
(109, 'App\\Admin', 265),
(110, 'App\\Admin', 265),
(111, 'App\\Admin', 265),
(112, 'App\\Admin', 265),
(113, 'App\\Admin', 265),
(114, 'App\\Admin', 265),
(115, 'App\\Admin', 265),
(116, 'App\\Admin', 265),
(149, 'App\\Admin', 265),
(150, 'App\\Admin', 265),
(153, 'App\\Admin', 265),
(154, 'App\\Admin', 265),
(20, 'App\\Admin', 273),
(21, 'App\\Admin', 273),
(22, 'App\\Admin', 273),
(25, 'App\\Admin', 273),
(26, 'App\\Admin', 273),
(27, 'App\\Admin', 273),
(29, 'App\\Admin', 273),
(30, 'App\\Admin', 273),
(31, 'App\\Admin', 273),
(32, 'App\\Admin', 273),
(33, 'App\\Admin', 273),
(34, 'App\\Admin', 273),
(35, 'App\\Admin', 273),
(36, 'App\\Admin', 273),
(37, 'App\\Admin', 273),
(38, 'App\\Admin', 273),
(39, 'App\\Admin', 273),
(40, 'App\\Admin', 273),
(41, 'App\\Admin', 273),
(42, 'App\\Admin', 273),
(43, 'App\\Admin', 273),
(44, 'App\\Admin', 273),
(45, 'App\\Admin', 273),
(46, 'App\\Admin', 273),
(47, 'App\\Admin', 273),
(48, 'App\\Admin', 273),
(49, 'App\\Admin', 273),
(50, 'App\\Admin', 273),
(51, 'App\\Admin', 273),
(52, 'App\\Admin', 273),
(53, 'App\\Admin', 273),
(54, 'App\\Admin', 273),
(55, 'App\\Admin', 273),
(56, 'App\\Admin', 273),
(57, 'App\\Admin', 273),
(58, 'App\\Admin', 273),
(59, 'App\\Admin', 273),
(60, 'App\\Admin', 273),
(61, 'App\\Admin', 273),
(62, 'App\\Admin', 273),
(63, 'App\\Admin', 273),
(64, 'App\\Admin', 273),
(65, 'App\\Admin', 273),
(66, 'App\\Admin', 273),
(67, 'App\\Admin', 273),
(68, 'App\\Admin', 273),
(69, 'App\\Admin', 273),
(70, 'App\\Admin', 273),
(71, 'App\\Admin', 273),
(72, 'App\\Admin', 273),
(73, 'App\\Admin', 273),
(74, 'App\\Admin', 273),
(75, 'App\\Admin', 273),
(76, 'App\\Admin', 273),
(77, 'App\\Admin', 273),
(78, 'App\\Admin', 273),
(79, 'App\\Admin', 273),
(80, 'App\\Admin', 273),
(81, 'App\\Admin', 273),
(82, 'App\\Admin', 273),
(83, 'App\\Admin', 273),
(84, 'App\\Admin', 273),
(85, 'App\\Admin', 273),
(86, 'App\\Admin', 273),
(87, 'App\\Admin', 273),
(88, 'App\\Admin', 273),
(89, 'App\\Admin', 273),
(90, 'App\\Admin', 273),
(91, 'App\\Admin', 273),
(92, 'App\\Admin', 273),
(93, 'App\\Admin', 273),
(94, 'App\\Admin', 273),
(95, 'App\\Admin', 273),
(96, 'App\\Admin', 273),
(97, 'App\\Admin', 273),
(98, 'App\\Admin', 273),
(99, 'App\\Admin', 273),
(100, 'App\\Admin', 273),
(101, 'App\\Admin', 273),
(102, 'App\\Admin', 273),
(103, 'App\\Admin', 273),
(104, 'App\\Admin', 273),
(105, 'App\\Admin', 273),
(106, 'App\\Admin', 273),
(107, 'App\\Admin', 273),
(108, 'App\\Admin', 273),
(109, 'App\\Admin', 273),
(110, 'App\\Admin', 273),
(111, 'App\\Admin', 273),
(112, 'App\\Admin', 273),
(113, 'App\\Admin', 273),
(114, 'App\\Admin', 273),
(115, 'App\\Admin', 273),
(116, 'App\\Admin', 273),
(149, 'App\\Admin', 273),
(150, 'App\\Admin', 273),
(153, 'App\\Admin', 273),
(154, 'App\\Admin', 273),
(20, 'App\\Admin', 280),
(21, 'App\\Admin', 280),
(22, 'App\\Admin', 280),
(25, 'App\\Admin', 280),
(26, 'App\\Admin', 280),
(27, 'App\\Admin', 280),
(29, 'App\\Admin', 280),
(30, 'App\\Admin', 280),
(31, 'App\\Admin', 280),
(32, 'App\\Admin', 280),
(33, 'App\\Admin', 280),
(34, 'App\\Admin', 280),
(35, 'App\\Admin', 280),
(36, 'App\\Admin', 280),
(37, 'App\\Admin', 280),
(38, 'App\\Admin', 280),
(39, 'App\\Admin', 280),
(40, 'App\\Admin', 280),
(41, 'App\\Admin', 280),
(42, 'App\\Admin', 280),
(43, 'App\\Admin', 280),
(44, 'App\\Admin', 280),
(45, 'App\\Admin', 280),
(46, 'App\\Admin', 280),
(47, 'App\\Admin', 280),
(48, 'App\\Admin', 280),
(49, 'App\\Admin', 280),
(50, 'App\\Admin', 280),
(51, 'App\\Admin', 280),
(52, 'App\\Admin', 280),
(53, 'App\\Admin', 280),
(54, 'App\\Admin', 280),
(55, 'App\\Admin', 280),
(56, 'App\\Admin', 280),
(57, 'App\\Admin', 280),
(58, 'App\\Admin', 280),
(59, 'App\\Admin', 280),
(60, 'App\\Admin', 280),
(61, 'App\\Admin', 280),
(62, 'App\\Admin', 280),
(63, 'App\\Admin', 280),
(64, 'App\\Admin', 280),
(65, 'App\\Admin', 280),
(66, 'App\\Admin', 280),
(67, 'App\\Admin', 280),
(68, 'App\\Admin', 280),
(69, 'App\\Admin', 280),
(70, 'App\\Admin', 280),
(71, 'App\\Admin', 280),
(72, 'App\\Admin', 280),
(73, 'App\\Admin', 280),
(74, 'App\\Admin', 280),
(75, 'App\\Admin', 280),
(76, 'App\\Admin', 280),
(77, 'App\\Admin', 280),
(78, 'App\\Admin', 280),
(79, 'App\\Admin', 280),
(80, 'App\\Admin', 280),
(81, 'App\\Admin', 280),
(82, 'App\\Admin', 280),
(83, 'App\\Admin', 280),
(84, 'App\\Admin', 280),
(85, 'App\\Admin', 280),
(86, 'App\\Admin', 280),
(87, 'App\\Admin', 280),
(88, 'App\\Admin', 280),
(89, 'App\\Admin', 280),
(90, 'App\\Admin', 280),
(91, 'App\\Admin', 280),
(92, 'App\\Admin', 280),
(93, 'App\\Admin', 280),
(94, 'App\\Admin', 280),
(95, 'App\\Admin', 280),
(96, 'App\\Admin', 280),
(97, 'App\\Admin', 280),
(98, 'App\\Admin', 280),
(99, 'App\\Admin', 280),
(100, 'App\\Admin', 280),
(101, 'App\\Admin', 280),
(102, 'App\\Admin', 280),
(103, 'App\\Admin', 280),
(104, 'App\\Admin', 280),
(105, 'App\\Admin', 280),
(106, 'App\\Admin', 280),
(107, 'App\\Admin', 280),
(108, 'App\\Admin', 280),
(109, 'App\\Admin', 280),
(110, 'App\\Admin', 280),
(111, 'App\\Admin', 280),
(112, 'App\\Admin', 280),
(113, 'App\\Admin', 280),
(114, 'App\\Admin', 280),
(115, 'App\\Admin', 280),
(116, 'App\\Admin', 280),
(149, 'App\\Admin', 280),
(150, 'App\\Admin', 280),
(153, 'App\\Admin', 280),
(154, 'App\\Admin', 280),
(20, 'App\\Admin', 281),
(21, 'App\\Admin', 281),
(22, 'App\\Admin', 281),
(25, 'App\\Admin', 281),
(26, 'App\\Admin', 281),
(27, 'App\\Admin', 281),
(29, 'App\\Admin', 281),
(30, 'App\\Admin', 281),
(31, 'App\\Admin', 281),
(32, 'App\\Admin', 281),
(33, 'App\\Admin', 281),
(34, 'App\\Admin', 281),
(35, 'App\\Admin', 281),
(36, 'App\\Admin', 281),
(37, 'App\\Admin', 281),
(38, 'App\\Admin', 281),
(39, 'App\\Admin', 281),
(40, 'App\\Admin', 281),
(41, 'App\\Admin', 281),
(42, 'App\\Admin', 281),
(43, 'App\\Admin', 281),
(44, 'App\\Admin', 281),
(45, 'App\\Admin', 281),
(46, 'App\\Admin', 281),
(47, 'App\\Admin', 281),
(48, 'App\\Admin', 281),
(49, 'App\\Admin', 281),
(50, 'App\\Admin', 281),
(51, 'App\\Admin', 281),
(52, 'App\\Admin', 281),
(53, 'App\\Admin', 281),
(54, 'App\\Admin', 281),
(55, 'App\\Admin', 281),
(56, 'App\\Admin', 281),
(57, 'App\\Admin', 281),
(58, 'App\\Admin', 281),
(59, 'App\\Admin', 281),
(60, 'App\\Admin', 281),
(61, 'App\\Admin', 281),
(62, 'App\\Admin', 281),
(63, 'App\\Admin', 281),
(64, 'App\\Admin', 281),
(65, 'App\\Admin', 281),
(66, 'App\\Admin', 281),
(67, 'App\\Admin', 281),
(68, 'App\\Admin', 281),
(69, 'App\\Admin', 281),
(70, 'App\\Admin', 281),
(71, 'App\\Admin', 281),
(72, 'App\\Admin', 281),
(73, 'App\\Admin', 281),
(74, 'App\\Admin', 281),
(75, 'App\\Admin', 281),
(76, 'App\\Admin', 281),
(77, 'App\\Admin', 281),
(78, 'App\\Admin', 281),
(79, 'App\\Admin', 281),
(80, 'App\\Admin', 281),
(81, 'App\\Admin', 281),
(82, 'App\\Admin', 281),
(83, 'App\\Admin', 281),
(84, 'App\\Admin', 281),
(85, 'App\\Admin', 281),
(86, 'App\\Admin', 281),
(87, 'App\\Admin', 281),
(88, 'App\\Admin', 281),
(89, 'App\\Admin', 281),
(90, 'App\\Admin', 281),
(91, 'App\\Admin', 281),
(92, 'App\\Admin', 281),
(93, 'App\\Admin', 281),
(94, 'App\\Admin', 281),
(95, 'App\\Admin', 281),
(96, 'App\\Admin', 281),
(97, 'App\\Admin', 281),
(98, 'App\\Admin', 281),
(99, 'App\\Admin', 281),
(100, 'App\\Admin', 281),
(101, 'App\\Admin', 281),
(102, 'App\\Admin', 281),
(103, 'App\\Admin', 281),
(104, 'App\\Admin', 281),
(105, 'App\\Admin', 281),
(106, 'App\\Admin', 281),
(107, 'App\\Admin', 281),
(108, 'App\\Admin', 281),
(109, 'App\\Admin', 281),
(110, 'App\\Admin', 281),
(111, 'App\\Admin', 281),
(112, 'App\\Admin', 281),
(113, 'App\\Admin', 281),
(114, 'App\\Admin', 281),
(115, 'App\\Admin', 281),
(116, 'App\\Admin', 281),
(149, 'App\\Admin', 281),
(150, 'App\\Admin', 281),
(153, 'App\\Admin', 281),
(154, 'App\\Admin', 281),
(20, 'App\\Admin', 282),
(21, 'App\\Admin', 282),
(22, 'App\\Admin', 282),
(25, 'App\\Admin', 282),
(26, 'App\\Admin', 282),
(27, 'App\\Admin', 282),
(29, 'App\\Admin', 282),
(30, 'App\\Admin', 282),
(31, 'App\\Admin', 282),
(32, 'App\\Admin', 282),
(33, 'App\\Admin', 282),
(34, 'App\\Admin', 282),
(35, 'App\\Admin', 282),
(36, 'App\\Admin', 282),
(37, 'App\\Admin', 282),
(38, 'App\\Admin', 282),
(39, 'App\\Admin', 282),
(40, 'App\\Admin', 282),
(41, 'App\\Admin', 282),
(42, 'App\\Admin', 282),
(43, 'App\\Admin', 282),
(44, 'App\\Admin', 282),
(45, 'App\\Admin', 282),
(46, 'App\\Admin', 282),
(47, 'App\\Admin', 282),
(48, 'App\\Admin', 282),
(49, 'App\\Admin', 282),
(50, 'App\\Admin', 282),
(51, 'App\\Admin', 282),
(52, 'App\\Admin', 282),
(53, 'App\\Admin', 282),
(54, 'App\\Admin', 282),
(55, 'App\\Admin', 282),
(56, 'App\\Admin', 282),
(57, 'App\\Admin', 282),
(58, 'App\\Admin', 282),
(59, 'App\\Admin', 282),
(60, 'App\\Admin', 282),
(61, 'App\\Admin', 282),
(62, 'App\\Admin', 282),
(63, 'App\\Admin', 282),
(64, 'App\\Admin', 282),
(65, 'App\\Admin', 282),
(66, 'App\\Admin', 282),
(67, 'App\\Admin', 282),
(68, 'App\\Admin', 282),
(69, 'App\\Admin', 282),
(70, 'App\\Admin', 282),
(71, 'App\\Admin', 282),
(72, 'App\\Admin', 282),
(73, 'App\\Admin', 282),
(74, 'App\\Admin', 282),
(75, 'App\\Admin', 282),
(76, 'App\\Admin', 282),
(77, 'App\\Admin', 282),
(78, 'App\\Admin', 282),
(79, 'App\\Admin', 282),
(80, 'App\\Admin', 282),
(81, 'App\\Admin', 282),
(82, 'App\\Admin', 282),
(83, 'App\\Admin', 282),
(84, 'App\\Admin', 282),
(85, 'App\\Admin', 282),
(86, 'App\\Admin', 282),
(87, 'App\\Admin', 282),
(88, 'App\\Admin', 282),
(89, 'App\\Admin', 282),
(90, 'App\\Admin', 282),
(91, 'App\\Admin', 282),
(92, 'App\\Admin', 282),
(93, 'App\\Admin', 282),
(94, 'App\\Admin', 282),
(95, 'App\\Admin', 282),
(96, 'App\\Admin', 282),
(97, 'App\\Admin', 282),
(98, 'App\\Admin', 282),
(99, 'App\\Admin', 282),
(100, 'App\\Admin', 282),
(101, 'App\\Admin', 282),
(102, 'App\\Admin', 282),
(103, 'App\\Admin', 282),
(104, 'App\\Admin', 282),
(105, 'App\\Admin', 282),
(106, 'App\\Admin', 282),
(107, 'App\\Admin', 282),
(108, 'App\\Admin', 282),
(109, 'App\\Admin', 282),
(110, 'App\\Admin', 282),
(111, 'App\\Admin', 282),
(112, 'App\\Admin', 282),
(113, 'App\\Admin', 282),
(114, 'App\\Admin', 282),
(115, 'App\\Admin', 282),
(116, 'App\\Admin', 282),
(149, 'App\\Admin', 282),
(150, 'App\\Admin', 282),
(153, 'App\\Admin', 282),
(154, 'App\\Admin', 282),
(20, 'App\\Admin', 283),
(21, 'App\\Admin', 283),
(22, 'App\\Admin', 283),
(25, 'App\\Admin', 283),
(26, 'App\\Admin', 283),
(27, 'App\\Admin', 283),
(29, 'App\\Admin', 283),
(30, 'App\\Admin', 283),
(31, 'App\\Admin', 283),
(32, 'App\\Admin', 283),
(33, 'App\\Admin', 283),
(34, 'App\\Admin', 283),
(35, 'App\\Admin', 283),
(36, 'App\\Admin', 283),
(37, 'App\\Admin', 283),
(38, 'App\\Admin', 283),
(39, 'App\\Admin', 283),
(40, 'App\\Admin', 283),
(41, 'App\\Admin', 283),
(42, 'App\\Admin', 283),
(43, 'App\\Admin', 283),
(44, 'App\\Admin', 283),
(45, 'App\\Admin', 283),
(46, 'App\\Admin', 283),
(47, 'App\\Admin', 283),
(48, 'App\\Admin', 283),
(49, 'App\\Admin', 283),
(50, 'App\\Admin', 283),
(51, 'App\\Admin', 283),
(52, 'App\\Admin', 283),
(53, 'App\\Admin', 283),
(54, 'App\\Admin', 283),
(55, 'App\\Admin', 283),
(56, 'App\\Admin', 283),
(57, 'App\\Admin', 283),
(58, 'App\\Admin', 283),
(59, 'App\\Admin', 283),
(60, 'App\\Admin', 283),
(61, 'App\\Admin', 283),
(62, 'App\\Admin', 283),
(63, 'App\\Admin', 283),
(64, 'App\\Admin', 283),
(65, 'App\\Admin', 283),
(66, 'App\\Admin', 283),
(67, 'App\\Admin', 283),
(68, 'App\\Admin', 283),
(69, 'App\\Admin', 283),
(70, 'App\\Admin', 283),
(71, 'App\\Admin', 283),
(72, 'App\\Admin', 283),
(73, 'App\\Admin', 283),
(74, 'App\\Admin', 283),
(75, 'App\\Admin', 283),
(76, 'App\\Admin', 283),
(77, 'App\\Admin', 283),
(78, 'App\\Admin', 283),
(79, 'App\\Admin', 283),
(80, 'App\\Admin', 283),
(81, 'App\\Admin', 283),
(82, 'App\\Admin', 283),
(83, 'App\\Admin', 283),
(84, 'App\\Admin', 283),
(85, 'App\\Admin', 283),
(86, 'App\\Admin', 283),
(87, 'App\\Admin', 283),
(88, 'App\\Admin', 283),
(89, 'App\\Admin', 283),
(90, 'App\\Admin', 283),
(91, 'App\\Admin', 283),
(92, 'App\\Admin', 283),
(93, 'App\\Admin', 283),
(94, 'App\\Admin', 283),
(95, 'App\\Admin', 283),
(96, 'App\\Admin', 283),
(97, 'App\\Admin', 283),
(98, 'App\\Admin', 283),
(99, 'App\\Admin', 283),
(100, 'App\\Admin', 283),
(101, 'App\\Admin', 283),
(102, 'App\\Admin', 283),
(103, 'App\\Admin', 283),
(104, 'App\\Admin', 283),
(105, 'App\\Admin', 283),
(106, 'App\\Admin', 283),
(107, 'App\\Admin', 283),
(108, 'App\\Admin', 283),
(109, 'App\\Admin', 283),
(110, 'App\\Admin', 283),
(111, 'App\\Admin', 283),
(112, 'App\\Admin', 283),
(113, 'App\\Admin', 283),
(114, 'App\\Admin', 283),
(115, 'App\\Admin', 283),
(116, 'App\\Admin', 283),
(149, 'App\\Admin', 283),
(150, 'App\\Admin', 283),
(153, 'App\\Admin', 283),
(154, 'App\\Admin', 283),
(64, 'App\\Models\\Admin', 289),
(76, 'App\\Models\\Admin', 289),
(81, 'App\\Models\\Admin', 289),
(84, 'App\\Models\\Admin', 289),
(86, 'App\\Models\\Admin', 289),
(91, 'App\\Models\\Admin', 289),
(92, 'App\\Models\\Admin', 289),
(104, 'App\\Models\\Admin', 289),
(20, 'App\\Models\\Admin', 290),
(29, 'App\\Models\\Admin', 290),
(30, 'App\\Models\\Admin', 290),
(31, 'App\\Models\\Admin', 290),
(35, 'App\\Models\\Admin', 290),
(36, 'App\\Models\\Admin', 290),
(37, 'App\\Models\\Admin', 290),
(38, 'App\\Models\\Admin', 290),
(39, 'App\\Models\\Admin', 290),
(96, 'App\\Models\\Admin', 290),
(97, 'App\\Models\\Admin', 290),
(99, 'App\\Models\\Admin', 290),
(107, 'App\\Models\\Admin', 290),
(109, 'App\\Models\\Admin', 290),
(110, 'App\\Models\\Admin', 290),
(113, 'App\\Models\\Admin', 290),
(114, 'App\\Models\\Admin', 290),
(154, 'App\\Models\\Admin', 290),
(155, 'App\\Models\\Admin', 290),
(20, 'App\\Models\\Admin', 291),
(21, 'App\\Models\\Admin', 291),
(22, 'App\\Models\\Admin', 291),
(25, 'App\\Models\\Admin', 291),
(26, 'App\\Models\\Admin', 291),
(27, 'App\\Models\\Admin', 291),
(29, 'App\\Models\\Admin', 291),
(30, 'App\\Models\\Admin', 291),
(31, 'App\\Models\\Admin', 291),
(34, 'App\\Models\\Admin', 291),
(35, 'App\\Models\\Admin', 291),
(36, 'App\\Models\\Admin', 291),
(37, 'App\\Models\\Admin', 291),
(38, 'App\\Models\\Admin', 291),
(39, 'App\\Models\\Admin', 291),
(40, 'App\\Models\\Admin', 291),
(41, 'App\\Models\\Admin', 291),
(42, 'App\\Models\\Admin', 291),
(43, 'App\\Models\\Admin', 291),
(44, 'App\\Models\\Admin', 291),
(45, 'App\\Models\\Admin', 291),
(46, 'App\\Models\\Admin', 291),
(47, 'App\\Models\\Admin', 291),
(60, 'App\\Models\\Admin', 291),
(62, 'App\\Models\\Admin', 291),
(63, 'App\\Models\\Admin', 291),
(96, 'App\\Models\\Admin', 291),
(99, 'App\\Models\\Admin', 291),
(102, 'App\\Models\\Admin', 291),
(103, 'App\\Models\\Admin', 291),
(107, 'App\\Models\\Admin', 291),
(108, 'App\\Models\\Admin', 291),
(110, 'App\\Models\\Admin', 291),
(112, 'App\\Models\\Admin', 291),
(154, 'App\\Models\\Admin', 291),
(155, 'App\\Models\\Admin', 291),
(156, 'App\\Models\\Admin', 291),
(157, 'App\\Models\\Admin', 291),
(158, 'App\\Models\\Admin', 291),
(159, 'App\\Models\\Admin', 291),
(160, 'App\\Models\\Admin', 291),
(161, 'App\\Models\\Admin', 291),
(162, 'App\\Models\\Admin', 291),
(163, 'App\\Models\\Admin', 291),
(164, 'App\\Models\\Admin', 291),
(165, 'App\\Models\\Admin', 291),
(166, 'App\\Models\\Admin', 291),
(167, 'App\\Models\\Admin', 291),
(168, 'App\\Models\\Admin', 291),
(169, 'App\\Models\\Admin', 291),
(170, 'App\\Models\\Admin', 291),
(171, 'App\\Models\\Admin', 291),
(172, 'App\\Models\\Admin', 291),
(173, 'App\\Models\\Admin', 291),
(174, 'App\\Models\\Admin', 291),
(175, 'App\\Models\\Admin', 291),
(176, 'App\\Models\\Admin', 291),
(177, 'App\\Models\\Admin', 291),
(178, 'App\\Models\\Admin', 291),
(179, 'App\\Models\\Admin', 291),
(180, 'App\\Models\\Admin', 291),
(181, 'App\\Models\\Admin', 291),
(182, 'App\\Models\\Admin', 291),
(183, 'App\\Models\\Admin', 291),
(184, 'App\\Models\\Admin', 291),
(185, 'App\\Models\\Admin', 291),
(186, 'App\\Models\\Admin', 291),
(187, 'App\\Models\\Admin', 291),
(188, 'App\\Models\\Admin', 291),
(189, 'App\\Models\\Admin', 291),
(190, 'App\\Models\\Admin', 291),
(194, 'App\\Models\\Admin', 291),
(195, 'App\\Models\\Admin', 291),
(196, 'App\\Models\\Admin', 291),
(197, 'App\\Models\\Admin', 291),
(198, 'App\\Models\\Admin', 291),
(199, 'App\\Models\\Admin', 291),
(20, 'App\\Models\\Admin', 61),
(21, 'App\\Models\\Admin', 61),
(22, 'App\\Models\\Admin', 61),
(25, 'App\\Models\\Admin', 61),
(26, 'App\\Models\\Admin', 61),
(27, 'App\\Models\\Admin', 61),
(29, 'App\\Models\\Admin', 61),
(30, 'App\\Models\\Admin', 61),
(31, 'App\\Models\\Admin', 61),
(34, 'App\\Models\\Admin', 61),
(35, 'App\\Models\\Admin', 61),
(36, 'App\\Models\\Admin', 61),
(37, 'App\\Models\\Admin', 61),
(38, 'App\\Models\\Admin', 61),
(39, 'App\\Models\\Admin', 61),
(40, 'App\\Models\\Admin', 61),
(41, 'App\\Models\\Admin', 61),
(42, 'App\\Models\\Admin', 61),
(43, 'App\\Models\\Admin', 61),
(44, 'App\\Models\\Admin', 61),
(45, 'App\\Models\\Admin', 61),
(46, 'App\\Models\\Admin', 61),
(47, 'App\\Models\\Admin', 61),
(60, 'App\\Models\\Admin', 61),
(62, 'App\\Models\\Admin', 61),
(63, 'App\\Models\\Admin', 61),
(96, 'App\\Models\\Admin', 61),
(99, 'App\\Models\\Admin', 61),
(102, 'App\\Models\\Admin', 61),
(103, 'App\\Models\\Admin', 61),
(107, 'App\\Models\\Admin', 61),
(108, 'App\\Models\\Admin', 61),
(110, 'App\\Models\\Admin', 61),
(112, 'App\\Models\\Admin', 61),
(154, 'App\\Models\\Admin', 61),
(155, 'App\\Models\\Admin', 61),
(156, 'App\\Models\\Admin', 61),
(157, 'App\\Models\\Admin', 61),
(158, 'App\\Models\\Admin', 61),
(159, 'App\\Models\\Admin', 61),
(160, 'App\\Models\\Admin', 61),
(161, 'App\\Models\\Admin', 61),
(162, 'App\\Models\\Admin', 61),
(163, 'App\\Models\\Admin', 61);
INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(164, 'App\\Models\\Admin', 61),
(165, 'App\\Models\\Admin', 61),
(166, 'App\\Models\\Admin', 61),
(167, 'App\\Models\\Admin', 61),
(168, 'App\\Models\\Admin', 61),
(169, 'App\\Models\\Admin', 61),
(170, 'App\\Models\\Admin', 61),
(171, 'App\\Models\\Admin', 61),
(172, 'App\\Models\\Admin', 61),
(173, 'App\\Models\\Admin', 61),
(174, 'App\\Models\\Admin', 61),
(175, 'App\\Models\\Admin', 61),
(176, 'App\\Models\\Admin', 61),
(177, 'App\\Models\\Admin', 61),
(178, 'App\\Models\\Admin', 61),
(179, 'App\\Models\\Admin', 61),
(180, 'App\\Models\\Admin', 61),
(181, 'App\\Models\\Admin', 61),
(182, 'App\\Models\\Admin', 61),
(183, 'App\\Models\\Admin', 61),
(184, 'App\\Models\\Admin', 61),
(185, 'App\\Models\\Admin', 61),
(186, 'App\\Models\\Admin', 61),
(187, 'App\\Models\\Admin', 61),
(188, 'App\\Models\\Admin', 61),
(189, 'App\\Models\\Admin', 61),
(190, 'App\\Models\\Admin', 61),
(194, 'App\\Models\\Admin', 61),
(195, 'App\\Models\\Admin', 61),
(196, 'App\\Models\\Admin', 61),
(197, 'App\\Models\\Admin', 61),
(198, 'App\\Models\\Admin', 61),
(199, 'App\\Models\\Admin', 61),
(20, 'App\\Models\\Admin', 293),
(29, 'App\\Models\\Admin', 293),
(30, 'App\\Models\\Admin', 293),
(31, 'App\\Models\\Admin', 293),
(35, 'App\\Models\\Admin', 293),
(36, 'App\\Models\\Admin', 293),
(37, 'App\\Models\\Admin', 293),
(38, 'App\\Models\\Admin', 293),
(39, 'App\\Models\\Admin', 293),
(96, 'App\\Models\\Admin', 293),
(99, 'App\\Models\\Admin', 293),
(107, 'App\\Models\\Admin', 293),
(110, 'App\\Models\\Admin', 293),
(154, 'App\\Models\\Admin', 293),
(155, 'App\\Models\\Admin', 293);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(23, 'App\\Admin', 240),
(23, 'App\\Models\\Admin', 291),
(23, 'App\\Models\\Admin', 61),
(22, 'App\\Models\\Admin', 293);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(916, '/uploads/modules/1657784483logo.png', 1, '2022-07-14 05:41:23', '2022-07-14 05:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `modules_content`
--

CREATE TABLE `modules_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules_content`
--

INSERT INTO `modules_content` (`id`, `module_id`, `title`, `video`, `created_at`, `updated_at`) VALUES
(70, 916, 'مقدمة الموديول', '/uploads/modules/16577844838.jpg', '2022-07-14 05:41:23', '2022-07-14 05:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `modules_data`
--

CREATE TABLE `modules_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `body` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules_data`
--

INSERT INTO `modules_data` (`id`, `module_id`, `title`, `lang_id`, `body`) VALUES
(605, 916, 'مقدمة الموديول', 2, '<p style=\"text-align: right;\">يعد مصةطلح البيانات الضةخمة من المصةطلحات الحديثة التي تهرت بوصةفها اتجا ها<br />\r\nحدي ثًا في وصف التد ق الهائل للبيانات، فكما هو ملاحظ، فإننا جميعً ا نقوم بإنتاج م<br />\r\n&nbsp;</p>');

-- --------------------------------------------------------

--
-- Table structure for table `order_product_items`
--

CREATE TABLE `order_product_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_product_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type_code` enum('product','service','food','digital_product','cards','donation','multi_products') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `published` tinyint(1) DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `palce` enum('header','footer','aboutUs','home') COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `published`, `image`, `palce`, `page_order`, `created_at`, `updated_at`) VALUES
(2, 1, '', 'header', 0, '2020-08-19 01:21:14', '2020-08-19 01:21:14'),
(4, 1, '', 'header', 1, '2020-11-24 03:38:37', '2020-12-13 16:21:57'),
(5, 1, '', 'header', 2, '2020-12-15 16:32:24', '2020-12-15 16:32:24'),
(6, 1, '', 'header', 3, '2020-12-15 16:34:20', '2020-12-15 16:34:44'),
(7, 1, '', 'header', 4, '2020-12-22 06:38:36', '2020-12-22 06:38:36'),
(8, 0, '', 'header', 5, '2021-05-19 06:16:58', '2021-05-19 06:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `pages_data`
--

CREATE TABLE `pages_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages_data`
--

INSERT INTO `pages_data` (`id`, `page_id`, `lang_id`, `source_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'Souq', '<p>Souq.com.</p>', '2020-06-15 04:25:11', '2020-06-15 05:06:46'),
(2, 1, 2, 1, 'سوق', '<p>سوق كوم</p>', '2020-06-15 05:07:42', '2020-06-15 05:07:42'),
(3, 2, 1, NULL, 'Pag1', '<p>Ahmed</p>', '2020-08-19 01:21:14', '2020-08-19 01:21:14'),
(6, 4, 2, NULL, 'الشروط والأحكام', '<p style=\"text-align: justify;\"><span style=\"font-size:24px;\"><strong>الشروط والأحكام</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>المقدمة :<br />\r\nشركة منصة &quot;سلتك&quot; هي شركة كويتية تهدف الي تمكين قطاع التجزئة في الكويت من الدخول الي عالم التجارة الالكترونية من خلال انشاء متجر الكتروني متكامل يساعد في التوسع جغرافياً وتوسيع النطاق الجغرافي للمنتجات مما يعزز في انتشار علامتك التجارية دون الحاجة الي تكاليف انشاء المحلات التجارية على ارض الواقع </strong>.</span></span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:24px;\"><strong>&bull; شروط انشاء المتجر الكتروني وفتح الحساب</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">&bull; يجب أن يكون عمرك 18 سنة أو أكثر حسب القوانيين والأنظمة في دولة الكويت<br />\r\n&bull; أن يكون نشاط المتجر من الأنشطة المسموح بمزاولتها داخل الكويت وفقا لجنسية الشريك والمدير وشروط وضوابط الجهات الرقابية<br />\r\n&bull; يجب عليك التسجيل في سلتك لاستخدام الخدمة والاستفادة منها عن طريق كتابة الاسم بشكل كامل كما يظهر في الأوراق الرسمية والعنوان الحالي ورقم الهاتف النقال وبريد إلكتروني صحيح وأي معلومة مطلوبة كما هو موضح، تطلب في نموذج التسجيل ويحق لـ سلتك رفض طلب إنشاء أي حساب ،كما يحق لـ سلتك انهاء الخدمة لأي سبب من الأسباب ودون سابق أنذار وفي أي وقت<br />\r\n&bull; يدفع المستخدم قيمة الرسوم المفروضة على اشتراكه في الخدمة قبل إنتهاء مدة أشتراكة بيوم واحد وأي رسوم أخرى مطلوبة بما في ذلك على سبيل المثال لا الحصر الرسوم المتعلقة بشراء أي منتجات أو خدمات مثل ترقية الباقة لباقة أعلى أو شراء رسائل الجوال أو شراء استايل للمتجر أو شراء / تجديد نطاق الدومين أو خدمات الطرف الثالث</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>&bull; منصة سلتك لاتقدم خدماتها الي :-</strong></span></p>\r\n\r\n<div class=\"flex-container flex-align-items-stretch flex-align-content-flex-start flex-full-width aps font-ember border-color-transparent decor-border--reg\" id=\"\" style=\"width:100%\">\r\n<div class=\"text align-end color-squidInk font-body font-b3\" style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>1. القمار واليانصيب والرهانات والمراهنة على المسابقات والسحوبات<br />\r\n2. الخمور والكحوليات ( ومشروبات الطاقة بأنواعها )<br />\r\n3. المخدّرات والسجائر ومستلزماتها<br />\r\n4. الأسلحة والذخائر والأدوات الحادة والخطرة<br />\r\n5. خدمات المواعدة والمرافقة والدردشة والزواج<br />\r\n6. خدمات الاستحواذ على العملاء وزيادة المتابعين الوهميين لمواقع التواصل الاجتماعي<br />\r\n7. المواد الإباحية والمنتجات الجنسية<br />\r\n8. التسويق المتعدد المستويات والتسويق الهرمي والتسويق الشبكي أو المتسلسل<br />\r\n9. بيع المنتجات أو الخدمات المُقلّدة<br />\r\n10. بيع أو توزيع أو انتهاك المواد ذات حقوق ملكية فكرية</strong></span></span></div>\r\n\r\n<div class=\"text align-end color-squidInk font-body font-b3\" style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>11. تداول العملات الأجنبية وتداول الأسهم<br />\r\n12. الخدمات المالية والبنكية<br />\r\n13. خدمات الاستثمار والائتمان والعملات الرقمية<br />\r\n14. المنتجات الطبية الغير مصرح بها من الجهات المختصة<br />\r\n15. خدمات جمع البيانات المرخّص لها والغير مرخّص لها<br />\r\n16. خدمات الجوّال / الاتصال عبر الإنترنت<br />\r\n17. البيع عن طريق الهاتف أو مراكز الاتصال<br />\r\n18. المجوهرات والساعات الثمينة<br />\r\n19. جمع التبرعات والأعمال الخيرية والتمويل الجماعي</strong></span></span></div>\r\n\r\n<div class=\"text align-end color-squidInk font-body font-b3\" style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>20. الأغاني والافلام والشيلات</strong></span></span></div>\r\n</div>\r\n\r\n<p><br />\r\n<span style=\"font-size:24px;\"><strong>&bull; أسعار الخدمات والباقات المدفوعة المتوفرة في منصة سلتك 2 باقة ويتم دفع قيمة الاشتراك أو الخدمات مقدماً وهي قيمة غير مسترجعة :-</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:24px;\"><strong><span style=\"color:#20365f;\">&bull; نوع الباقة : سلتك جو &nbsp;</span></strong></span></li>\r\n	<li><span style=\"font-size:12px;\"><span style=\"color:#ff0000;\"><strong>شاملة دومين مجاني ( أختياري )مع خصم 7 د.ك للدفع السنوي</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><strong>13 د.ك شهري&nbsp; -&nbsp; 149 د.ك سنة واحدة<span style=\"color:#20365f;\">&nbsp; </span></strong></span></li>\r\n	<li><span style=\"font-size:24px;\"><strong><span style=\"color:#20365f;\">&bull; نوع الباقة : سلتك برو</span></strong></span>&nbsp;&nbsp;</li>\r\n	<li><span style=\"font-size:12px;\"><span style=\"color:#ff0000;\"><strong>شاملة دومين مجاني ( أختياري ) مع خصم 9 د.ك للدفع السنوي</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><strong>29 د.ك شهري&nbsp; -&nbsp; 339 د.ك سنة واحدة</strong></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">&bull; تجديد دومين المتجر يشمل سعر الباقة ويتم تجديدة من خلال منصة سلّتك فقط.<br />\r\n&bull; جميع التصاميم المعروضة في منصة سلتك تم تصميمها من خلال فريق عمل سلتك وكل باقة لها تصميم مخصص لها ضمن الباقة .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>&bull; أسعار الرسائل النصية :- خاصة بالشبكات داخل الكويت فقط</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align: justify;\"><span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">500 نقطة بقيمة 7 د.ك صالحة لمدة سنتين</span></strong></span></li>\r\n	<li style=\"text-align: justify;\"><span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">1000 نقطة بقيمة 13 د.ك صالحة لمدة سنتين</span></strong></span></li>\r\n	<li style=\"text-align: justify;\"><span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">3000 نقطة بقيمة 36 د.ك صالحة لمدة سنتين</span></strong></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>&bull; أسعار استخدام الخدمات والباقات غير ثابتة وقابلة للتغيير على أن يتم إشعار المستخدم قبل ٣٠ يوما. ويمكن تقديم هذا الإخطار في أي وقت عن الموقع الالكترونية / التطبيق أو عن طريق مراسلة العملاء (sallatk.com) طريق بالبريد الالكتروني أو من خلال نشر التغييرات على موقع سلّتك<br />\r\n&bull; المستخدم هو المسؤول عن جميع الأنشطة والمحتويات كالبيانات والرسومات والصور والروابط التي يتم تحميلها تحت حسابه في سلتك (&ldquo;محتوى المتجر&rdquo;). وينبغي عدم نقل أي فاي روس أو ديدان حاسوبية أو أي رموز ذات طبيعة مدمرة كما أن منصة سلتك غير مسؤولة عن أي عملية قرصنة<br />\r\n&bull; المستخدم هو المسؤول عن حفظ كلمة المرور الخاصة به آمنة. كما أن سلتك غير مسؤولة عن أي خسارة أو ضرر يقع نتيجة للنسيان وعدم الحفاظ على أمن الحساب وكلمة المرور<br />\r\n&bull; إن مهمة منصة سلتك هي مجرد تقديم أدوات الدعم الالكتروني، عن طريق تأسيس المتجر، حيث أن التزام منصة سلتك بموجب هذه الاتفاقية هو فقط انشاء المتجر الالكتروني الخاص بالتاجر لدى منصة سلتك الالكترونية، ووضع المتجر أمام المستخدمين<br />\r\n&bull; إن جميع التعاملات التي تتم بين التاجر والمستهلك لا علاقة لها بشخص منصة سلتك، ومنصة سلتك غير مسئولة عنها، حيث أن هذا التعامل هو علاقة تعاقدية مستقلة تخضع للاتفاق الذي يبرم بين التاجر والمستهلك. وبناءً عليه فإذا تخلّف المستهلك عن سداد ثمن الخدمة أو المنتج الذي يوفّره التاجر فلا علاقة لمنصة سلتك بهذه المخالفات<br />\r\n&bull; أنت تعلم أن منصة سلتك تعتبر منصة إلكترونية تقنية على شبكة الانترنت تتيح للتاجر الذي يوافق على هذه الاتفاقية تأسيس متجره الالكتروني ، وممارسة نشاطه عبر المتجر ، ومهمتها تنتهي عند هذا الحد. فليس هناك أدنى مسئولية على منصة سلتك حول المخالفات التي يقوم بها التاجر في متجره بالمخالفة لأحكام هذه الاتفاقية، وليس لمنصة سلتك أي علاقة بالنسبة للتعاملات التي تتم بين التاجر والمستهلك<br />\r\n&bull; في حالة كان التاجر المتقدّم لطلب الانضمام وتأسيس المتجر عبارة عن تاجر فرد &ldquo;شخص طبيعي&rdquo;، فيلتزم كذلك بالتحقق من الاشتراطات المطلوبة لدى الجهات الرسمية وتوفيرها بحسب طبيعة نشاط الفرد التاجر، حيث أن التاجر الفرد يقر بأنه ملتزم بهذه الاشتراطات وملتزم بتوفيرها وتجهيزها، كما يلتزم التاجر الفرد بتوفير رقم هويته الوطنية وغير ذلك من المعلومات اللازمة والوثائق التي<br />\r\nتطلبها منصة سلتك<br />\r\n&bull; في حالة كان التاجر المتقدم لطلب الانضمام وتأسيس متجره يمثل مؤسسة تجارية أو شركة أو مؤسسة خيرية أو جهة اعتبارية فلابُد من تزويد منصة سلتك بكافة المعلومات والوثائق الثبوتية، مثل السجل التجاري وأي وثائق أخرى للمتجر تطلبها منصة سلتك للتسجيل ولإثبات الشخصية القانونية الخاصة بالمتجر<br />\r\n&bull; يحق لـ سلتك إزالة محتوى المتجر والحسابات التي تتضمن محتوى تراه سلتك وفقًا لتقديرها الخاص غير قانوني أو مسيء أو يحتوي على تهديد أو تشهير أو قذف أو تروج لأعمال اباحية وفاحشة أو محتويات غير مرغوب فيها بأي شكل من الأشكال أو ينتهك الملكية الفكرية لأي طرف أو يخالف شروط الاستخدام</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>&bull; خدمات الطرف الثالث :- بوابات الدفع - خدمات الشحن والتوصيل - رسائل الهاتف النقال - نطاق الدومين</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>&bull; إن جميع التعاملات التي تتم بين التاجر ومزودي الخدمات ( خدمات الطرف الثالث ) الذين توفر منصة سلتك الربط مع خدماتهم أو عرض خدماتهم ليستفيد منها التاجر والمستهلك لا علاقة لها بمنصة سلتك ، حيث أن هذا التعامل هو علاقة تعاقدية مستقلة عن منصة سلتك وخاضعة للاتفاق المبرم بين التاجر ومزود الخدمة ، وبناءً عليه فإذا تخلّف أو امتنع أو لم يلتزم أحد الاطراف في تنفيذ<br />\r\nالتزاماته التي جرى الاتفاق عليها أو لم ينفذها على الوجه المطلوب فإن منصة سلتك غير مسئولة عن ما ينتج عن هذه التصرفات ، إن منصة سلتك غير مسئولة عن أي مخالفات تحدث أو يتم ارتكابها بين التاجر ومزود الخدمة .<br />\r\n&bull; بموجب قواعد وأحكام اتفاقية الاستخدام هذه فإن منصة سلتك قدّ توفّر بعض الخدمات الإستراتيجية أو اللوجستية عن طريق طرف ثالث أو أطراف ثالثة وقد تكون هذه الخدمات على سبيل المثال لا الحصر : خدمات شركات الشحن وبوابات الدفع الالكتروني وتوصيل المنتجات والبضائع<br />\r\n&bull; تحيطكم منصة سلتك علمًا بأن توفيرها للخدمات الإستراتيجية أو اللوجستية ليس إلا تسهيلًا وتعاونًا منها ولمساعدة مستخدمين منصة سلتك وهي غير ملزمة بذلك وتتطلب منها موافقة بموجب كتاب يقدم لها .<br />\r\n&bull; تحيطكم علمًا منصة سلتك بأنها غير مسئولة تمامًا بشكل مباشر أو غير مباشر عن أي تصرفات تصدُر من أي طرف ثالث وأن ما تقوم به هو مجرد ربط بين المستخدم ومُقدِم الخدمة الطرف الثالث<br />\r\n&bull; تحيطكم علمًا منصة سلتك بأن طلب هذه الخدمة غير إلزامي وإنما يعود هذا الأمر إلى رغبة وحاجة المستخدم، وعند استخدام التاجر لخدمات الطرف الثالث المتوفّر لدى منصة سلتك فإن منصة سلتك تخلي مسئوليتها عن هذه العلاقة وتكون لهذه العلاقة أحكامها المستقلة التي تتم بين التاجر وبين الطرف الثالث .<br />\r\n&bull; إن بعض مقدمين الخدمات الإستراتيجية واللوجستية يضعون اشتراطات خاصة بهم أو تكاليف خاصة بهم ولا تملك منصة سلتك أي سلطة على هذه الاشتراطات أو هذه التكاليف ، ولذلك تنصح منصة سلتك التجّار المسجّلين لديها إلى الاطلاع على شروط مقدم الخدمة ( الطرف الثالث ) وتكاليف خدماته قبل تأكيد طلب الخدمة .<br />\r\n&bull; في حال تقدّم المستخدم بطلب خدمة مقدّمة عن طريق ( طرف ثالث ) فإن المستخدم بهذا التصرّف يصرّح لمنصة سلتك ويمنحها الإذن بتزويد مقدم الخدمة ( الطرف الثالث ) ببيانات المستخدم الشخصية التي يطلبها ، وغير ذلك من البيانات التي يحتاجها مقدّم الخدمة ( الطرف الثالث ) ، ويكون ذلك وفقاً لقواعد وأحكام سياسة الخصوصية وسرية المعلومات المعمول بها لدى منصّة سلتك .</strong></span></span></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:18px;\"><strong>منصة سلّتك تتمنى لكم<br />\r\nتجارة الكترونية ناجحة</strong></span></p>', '2020-11-24 03:38:37', '2021-06-18 00:39:31'),
(7, 5, 2, NULL, 'الدفع الالكتروني', '<p style=\"text-align: center;\"><span style=\"font-size:24px;\"><strong>وفرنا لك خيارات للشراء متعددة في متجرك يمكنك تفعليها بكل سهولة</strong></span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>حرصنا في شركة منصة سلتك بتوفير طرق دفع متعددة تخدم أصحاب المتاجر الالكترونية ، ولهذا فقد قمنا بتزويد عملائنا بأفضل الحلول والخدمات والشراكات بالتعاون مع مزودي الخدمات في المنطقة ووفق لهذه الشراكة فأن عملاء منصة سلتك أصحاب المتاجر الإلكترونية سيحصلون على بوابة دفع الكتروني شاملة تركيب مجاني وسعر ثابت لعمليات الدفع&nbsp; الإلكتروني ومن غير أي اشتراكات أو رسوم شهرية أو سنوية لبوابة الدفع فقط لعملاء الباقات المدفوعة في منصة سلتك ، عبر &quot;شركاء النجاح&quot; ماي فاتورة</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>&quot; اقرار وتعهد &quot;</strong></span></p>\r\n\r\n<p><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>يوافق كل فرد / شركة / مؤسسة ( المتقدم بطلب لبوابة الدفع الالكتروني ) على أن الشركة المزودة لخدمة الدفع الالكتروني هي من تقوم بتحصيل الأموال له في المتجر الالكتروني الخاص به والذي تمتلك حقوق برمجتة منصة سلتك وانه يخلي مسؤولية سلتك من أي خلل أو خطأ أو تأخير في التحصيل أو استرجاع أي مبالغ له في رصيد حسابه لدى مزود خدمة الدفع الالكتروني أو عدم موافقة مزود خدمة الدفع الالكتروني بالطلب أو ايقاف الخدمة.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>خيارات الدفع المتوفرة لك في المتجر الالكتروني هي :-</strong></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>1- خيار التحويل البنكي أو الحوالات البنكية هو اضافة رقم الحساب البنكي ليظهر عند كل عملية تسوق في المتجر وذلك ليتم تحويل المبالغ لك من العميل ويقوم العميل بتصوير صورة الحوالة البنكية وارفاقها لك لتأكيد الحوالة</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>2- خيار الدفع عند الاستلام هو خاص بالدفع الكاش ( النقدي )</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>3- خيار الدفع الالكتروني ( خاصة في&nbsp;مزود خدمة الدفع الالكتروني )</strong></span></span></li>\r\n</ul>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n<span style=\"font-size:24px;\"><strong>الدفع من خلال :-</strong></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>1- كي نت</strong></span></span></li>\r\n	<li><span style=\"color:#20365f;\"><span style=\"font-size:18px;\"><strong>2- فيزا ، ماستر&nbsp;&nbsp; </strong></span><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;</span></span><span style=\"color:#666666;\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>رسوم التحصيل ( وهي خاصة في عملاء منصة سلّتك )</strong></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>1- كي نت 250 فلس / للعملية الواحدة ثابتة</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>2- الفيزا والماستر كارد 2.5 % + 100 فلس / للعملية الواحدة</strong></span></span></li>\r\n</ul>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n<span style=\"font-size:24px;\"><strong>مدة تحصيل الأموال</strong></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>1- المدفوعات عن طريق كي نت ( 1 يوم عمل )</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>2- المدفوعات عن طريق البطاقة الإتمانية ( 2 يوم عمل )</strong></span></span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>لايوجد رسوم تأسيس أو رسوم أشتراك شهري لبوابة الدفع</strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>تركيب كود الـ Api لبوابة الدفع من خلال لوحة تحكم متجرك :-</strong></span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:24px;\"><strong>فرد</strong></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>1- صورة من الهوية الشخصية ( أمام وخلف )</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>2- رقم الآيبان الخاص بصاحب الهوية</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>3- العنوان ورقم الهاتف الخاص بالمشروع&nbsp;&nbsp;</strong> </span></span><span style=\"color:#666666;\"><span style=\"font-size:18px;\">&nbsp;</span><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>مؤسسة</strong></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>1- صورة من السجل التجاري</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>2- صورة من الهوية الشخصية ( أمام وخلف )</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>3- رقم الآيبان</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>4- العنوان ورقم الهاتف الخاص بالمؤسسة &nbsp;</strong></span></span></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:18px;\"><strong>* الموافقة والتفعيل لبوابة الدفع الالكتروني ( يومين عمل )</strong></span></p>\r\n\r\n<p><span style=\"font-size:18px;\"><strong>* سيتم إخطار مزود خدمة الدفع الالكتروني لإيقاف وإلغاء بوابة الدفع الالكتروني عند انتهاء فترة اشتراك المتجر الالكتروني المدفوع أو عند عدم التزامه في بنود الشروط والاحكام الخاصة في &quot;منصة سلتك&quot; وانه يخلي مسؤولية شركة منصة سلتك من الاضرار المترتبة علية بعد توقف الخدمة عنة من مزود خدمة الدفع الالكتروني</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>* ملاحظة / نحيطكم علمًا بأن توفيرنا للخدمات الإستراتيجية أو اللوجستية ليس إلا تسهيلًا وتعاونًا منا لمساعدة مستخدمين منصة سلتك ، لهذا فأن منصة سلتك غير مسئولة تمامًا بشكل مباشر أو غير مباشر عن أي تصرفات تصدُر من أي طرف ثالث وأن ما تقوم به هو مجرد ربط بين المستخدم ومُقدِم الخدمة الطرف الثالث بعد أخذ الموافقة منها وتأكدة من اكتمال جميع الشروط لتوافرها</strong></span></span><br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;<br />\r\n<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 18px; line-height: inherit; font-family: inherit; vertical-align: baseline;\"><strong style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bolder; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">راجع صفحة <a href=\"https://sallatk.com/page/4\">الشروط والأحكام</a></strong></span></p>\r\n\r\n<p>&nbsp;</p>', '2020-12-15 16:32:24', '2021-08-15 01:03:03'),
(8, 6, 2, NULL, 'الأسئلة الشائعة', '<p><span style=\"font-size:24px;\"><strong>الأسئلة الشائعة</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>هل لديك أي أسئلة لم يتم ذكرها هنا في صفحة الأسئلة الشائعة .؟ تواصل معنا من خلال الواتساب +96555494522</strong></span><br />\r\n&nbsp;<br />\r\n<span style=\"font-size:24px;\"><strong>* خطوات التسجيل والأشتراك .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- 1- أختر الباقة المناسبة لك حسب نشاطك التجاري وقم بتعبئة نموذج الطلب 2- أختر دومين ينتهي بـ دوت كوم مجاناً 3- أشترك مع خدمة الدفع الالكتروني والتركيب مجاني 4- أنشر متجرك في مواقع التواصل لأستقبال الطلبات </strong></span></span><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يوجد شرح للوحة التحكم .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- نعم توجد شروحات على الاونلاين تشرح أستخدام لوحة التحكم من خلال قناتنا على اليوتيوب</strong></span></span> <span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>بالأضافة الي الدعم الفني المتواجد من خلال الشات داخل لوحة التحكم للمساعدة .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻛﻢ ﻋﺪد الباقات ﻟﺪﻳﻜﻢ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- ﻓﻲ ﻣﻨﺼﺔ ﺳﻠﺘﻚ ﻳﻮﺟﺪ 3 ﺑﺎﻗﺎت اﻟﺒﺎﻗﺔ اﻻﺳﺎﺳﻴﺔ ( مجانية ) - باقة سلتك جو ( مدفوعة ) - باقة سلتك برو ( مدفوعة ) ، ﻛﻞ ﻣﻦ ﻫﺬه اﻟﺒﺎﻗﺎت ﻟﻬﺎ ﻣﻴﺰات ﺧﺎﺻﺔ وﻣﻨﺎﺳﺒﺔ ﻷﻧﻮاع ﻣﺨﺘﻠﻔﺔ ﻣﻦ ﻣﺴﺘﺨﺪﻣﻲ اﻟﺘﺠﺎرة اﻻﻟﻜﺘﺮوﻧﻴﺔ ، مقارنة المميزات من خلال صفحة الأسعار .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل تتوفر تجربة مجانية للباقات المدفوعة .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- 1- نعم توجد فترة سماح تجريبية للمميزات ولمدة شهر من غير بوابة دفع الكترونية ويمكنك من خلالها تجربة وتجهيز متجرك الالكتروني قبل أنطلاقة ، وتذكر أن سلتك لاتوفر خدمة استرجاع المبلغ </strong></span></span><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل تتوفر الخدمة في بلدي .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- المركز الرئيسي لمنصة سلتك هو دولة الكويت ويمكن لفريقنا التقني تقديم الحلول التقنية و الدعم الفني لجميع عملائنا عبر وسائل التواصل الموضحة والمتوفرة في سلتك بكل سهولة وراحة تامة </strong></span></span><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻛﻴﻒ يمكنني الأشتراك ﻓﻲ اﺣﺪى اﻟﺒﺎﻗﺎت المدفوعة .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- يمكنك ترقية الباقة من ﺧﻼل ﻟﻮﺣﺔ اﻟﺘﺤﻜﻢ اﻟﺨﺎﺻﺔ ﺑﻚ وأﺧﺘﻴﺎر ﻧﻄﺎق ﺧﺎص ﺑﻚ وﺑﺴﻬﻮﻟﺔ ﺗﺎﻣﺔ بعدها قم بأضافة رابط متجرك في البايو الخاص بك في مواقع التواصل لأستقبال طلباتك .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻛﻢ ﻣﺪة اﺷﺘﺮاك اﻟﺒﺎﻗﺎت ﻟﺪﻳﻜﻢ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- ﻓﻲ اﻟﺒﺎﻗﺔ اﻟﻤﺠﺎﻧﻴﺔ ﻻﻳﻮﺟﺪ ﻟﻬﺎ وﻗﺖ اﻣﺎ اﻟﺒﺎﻗﺎت اﻟﻤﺪﻓﻮﻋﺔ ﻓﻴﻤﻜﻨﻚ أﺧﺘﻴﺎر ﻃﺮﻳﻘﺔ اﻻﺷﺘﺮاك واﻟﺪﻓﻊ ، شهر أو سنة حسب رغبتك ، وفرنا لكم في ( الباقات السنوية خصم )</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻫﻞ ﻳﻤﻜﻦ ﻧﻘﻞ متجري اﻟﻲ ﺷﺮﻛﺔ أﺧﺮى .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- ﻻ ﻳﻤﻜﻦ ، ﻧﻘﻞ متجرك اﻟﻲ شركة أﺧﺮى ، ﺟﻤﻴﻊ ﺧﻄﻄﻨﺎ ﺗﺄﺗﻲ ﻣﻊ اﺳﺘﻀﺎﻓﺔ وﻳﺐ ﺧﺎﺻﺔ ﺑﻬﺎ ، ﻣﻊ اﻟﺘﺄﻛﺪ ﻣﻦ أن ﻣﻮﻗﻊ اﻟﻮﻳﺐ اﻟﺨﺎص ﺑﻚ ﻣﺆﻣﻦ وﻣﺘﻮﻓﺮ ﻃﻮال اﻟﻮﻗﺖ.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* لدي نطاق ( Domain ) خاص هل يمكنني ربطه معكم .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- نعم يمكنك ذلك وبكل سهولة كل ماعليك فعله هو ربط النطاق الخاص بك بالـ DNS الخاص بالسيرفرات لدينا وسيتم التفعيل خلال 24 ساعة أو اقل ولمزيد من المعلومات اكثر أو المساعدة تواصل معنا على واتساب رقم +96555494522 .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻛﻴﻒ ﻳﻤﻜﻦ إﻟﻐﺎء اﻻﺷﺘﺮاك .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- ﻧﻌﻢ ﻳﻤﻜﻨﻚ اﻻﻟﻐﺎء أو إيقاف اشتراكك أو حذف متجرك ﻓﻲ أي وﻗﺖ وﻷي ﻇﺮف من خلال لوحة التحكم الخاص بك وﻟﻜﻦ ﺳﻠﺘﻚ ﻻﺗﻮﻓﺮ ﺧﺪﻣﺔ اﺳﺘﺮﺟﺎع اﻟﻤﺒﻠﻎ .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻫﻞ ﻳﻤﻜﻦ إﻧﺸﺎء ﻣﺘﺠﺮ اﻟﻜﺘﺮوﻧﻲ ﻣﺠﺎﻧﻲ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- ﻧﻌﻢ ﻳﻤﻜﻨﻚ ﻓﺘﺢ ﻣﺘﺠﺮ اﻟﻜﺘﺮوﻧﻲ ﻣﺪﻋﻮم ﺑﺮاﺑﻂ ﻣﻨﺼﺔ ﺳﻠﺘﻚ ﻣﺠﺎﻧﺎ وﻓﻲ ﺣﺎل رﻏﺒﺖ ﻓﻲ ﺑﺎﻗﺔ ﻣﺪﻓﻮﻋﺔ يمكنك ذلك من خلال ترقية الباقة الخاصة بك وأختيار الميزات الأنسب لمشروعك التجاري .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻫﻞ ﻳﻤﻜﻦ ﺗﺮﻗﻴﺔ اﻟﺒﺎﻗﺔ أو ﺗﻐﻴﺮ اﻟﺒﺎﻗﺔ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- ﻧﻌﻢ ﻳﻤﻜﻦ ذﻟﻚ ﻓﻲ ﺟﻤﻴﻊ اﻟﺒﺎﻗﺎت اﻟﻤﺪﻓﻮﻋﺔ , وﻟﻜﻦ ﻻﻳﻤﻜﻨﻚ اﻟﺮﺟﻮع اﻟﻲ اﻟﺒﺎﻗﺔ اﻟﻤﺠﺎﻧﻴﺔ .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل توجد رسوم أضافية .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- نعم عند طلب خدمة خاصة بخدمات الطرف الثالث مثل شراء رسائل الجوال SMS , أو رسوم خدمات التوصيل والشحن , أو رسوم عمليات الدفع الالكتروني</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻫﻞ ﻳﻤﻜﻦ أﺧﺬ ﻧﺴﺨﺔ ﻣﻦ ﻣﻮﻗﻌﻲ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- ﻻﻳﻤﻜﻦ ، وﻻﺗﺤﺘﺎج اﻟﻲ ﻧﺴﺨﺔ ﻓﺠﻤﻴﻊ ﻣﺎﺗﺤﺘﺎج ﻣﻌﺮﻓﺘﺔ ﻳﻤﻜﻨﻚ اﻟﺮﺟﻮع ﻟﻪ ﺑﻮاﺳﻄﺔ ﻟﻮﺣﺔ اﻟﺘﺤﻜﻢ اﻟﺨﺎﺻﺔ ﺑﻚ</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل تتوفر لديكم خدمة التوصيل والشحن .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- لا ، ولكن يمكنك أضافة أسعار التوصيل والشحن الخاصة بك وبمندوب متجرك ، وأيضاً يمكنك الربط مع شركات الشحن والتوصيل حسب رغبتك من خلال لوحة متجرك .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل منصة سلتك تأخذ عمولة على المبيعات .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- لا , العمولة التي يتم خصمها منك هي رسوم خاصة في شركات الدفع الالكتروني وليس لمنصة سلتك أي نسبة منها .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يمكنني التحكم في الوان متجري .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- نعم يمكنك التعديل على الالوان والتحكم بها حسب البراند الخاص في هويتك التجارية .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يمكنني إنشاء طلب للعميل .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- نعم يمكن ذلك من خلال لوحة تحكم متجرك وايضا تستطيع التعديل على الطلبات .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يتوفر نظام محاسبي في متجري .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- نعم توجد احصائيات شاملة عن المبيعات يومية ، أسبوعية , شهرية , سنوية جاهزة ومنظمة في أي تاريخ تطلبه .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يشترط وجود سجل تجاري للأفراد للتسجيل في منصة سلتك .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- لا يشترط وجود سجل تجاري للمتجر للإفراد ، ولكن يفضّل وجود سجل تجاري لحفظ هويتك واعتمادها ولزيادة موثوقية العملاء لمتجرك</span></strong></span></p>', '2020-12-15 16:34:20', '2021-02-11 03:18:59'),
(9, 4, 1, NULL, 'Terms and Conditions', '<p dir=\"ltr\"><strong>Terms and conditions</strong></p>\r\n\r\n<p dir=\"ltr\">Introduction:</p>\r\n\r\n<p class=\"tw-data-text tw-text-large XcVN5d tw-ta\" data-placeholder=\"الترجمة\" dir=\"ltr\" id=\"tw-target-text\" style=\"text-align: left;\">The &quot;Sallatk&quot; platform company is a Kuwaiti company that aims to enable the retail sector in Kuwait, the Gulf and the Arab world to enter the world of e-commerce by establishing an integrated online store that helps in expanding geographically and expanding the geographical range of products, thus enhancing the spread of your brand without the need for the costs of establishing stores Commercial on the ground.</p>\r\n\r\n<p dir=\"ltr\"><strong>&bull; Conditions for setting up an online store and opening the account.</strong></p>\r\n\r\n<p dir=\"ltr\">&bull; You must be 18 years of age or older depending on the laws and regulations of Kuwait and by country.<br />\r\n&bull; The activity of the store must be one of the activities allowed to be conducted within Kuwait in accordance with the nationality of the partner and the manager and the conditions and controls of the regulators according to each country.<br />\r\n&bull; You must register in your Sallatk to use the service and benefit from it by writing the name in full as shown in the official papers, current address, mobile phone number, correct email and any information required as described, requested in the registration form and your Sallatk may refuse to request the creation of any account, and Sallatk has the right to terminate the service for any reason and without prior warning and at any time.<br />\r\n&bull; The user pays the fee charged for his subscription to the service one day before the end of the subscription period and any other fees required including but not limited to the fees related to the purchase of any products or services such as upgrading the package to a higher package, buying mobile messages, buying style for the store or buying/renewing the domain domain or third party services.</p>\r\n\r\n<p dir=\"ltr\"><br />\r\n<strong>&bull; Sallatk platform does not provide its services to : -</strong></p>\r\n\r\n<p dir=\"ltr\">1. Gambling, lotteries, bets, betting on competitions and draws<br />\r\n2. Liquor and alcohol (and energy drinks of all kinds)<br />\r\n3. Drugs, cigarettes and supplies<br />\r\n4. Weapons, ammunition and sharp and dangerous objects<br />\r\n5. Dating, escort, chat and marriage services<br />\r\n6. Customer acquisition services and increased fake followers of social networking sites<br />\r\n7. Pornography and sexual products<br />\r\n8. Multi-level marketing, pyramid marketing, network marketing or serial marketing<br />\r\n9. Selling counterfeit products or services<br />\r\n10. Sale, distribution or violation of intellectual property rights materials<br />\r\n11. Forex trading and stock trading<br />\r\n12. Financial and Banking Services<br />\r\n13. Investment, credit and cryptocurrency services<br />\r\n14. Medical products not authorized by the competent authorities<br />\r\n15. Licensed and unlicensed data collection services<br />\r\n16. Mobile Services / Internet Connectivity<br />\r\n17. Selling by phone or call centers<br />\r\n18. Precious Jewelry and Watches<br />\r\n19. Fundraising, philanthropy and crowdfunding<br />\r\n20. Songs, Movies and Shilat</p>\r\n\r\n<p dir=\"ltr\"><br />\r\n&bull; Prices of paid services and packages available on the Sallatk platform 2 packages and the payment of subscription or services in advance is an unrecovered value:-.<br />\r\n&bull; Package type: Sallatk Go. 13 K.D Monthly - K.D. 149 One Year Inclusive Of Free Domain Receives&nbsp; 7 K.D Discount for Annual Payment.<br />\r\n&bull; Package type: Sallatk Pro. 29 K.D Monthly - 339 K.D One Year Inclusive Of Free Domain Receives&nbsp; 9 K.D Discount for Annual Payment.<br />\r\n&bull; Domain Store renewal includes the price of the package and is renewed through the Sallatk platform only.<br />\r\n&bull; All designs displayed in the Sallatk platform are designed by the Sallatk team and each package has a custom design within the package.<br />\r\n&bull; Sms prices:- <strong>Kuwait networks only</strong><br />\r\n. 500 letters worth KD 7 valid for two years<br />\r\n. 1000 letters worth KD 13 valid for two years<br />\r\n. 3000 letters worth KD 36 valid for two years.<br />\r\n&bull; Rates for the use of services and packages are not fixed and subject to change, with the user notified 30 days in advance. This notification can be provided at any time about the website/app or by emailing customers (sallatk.com) or by posting changes to the Sallatk website.<br />\r\n&bull; The user is responsible for all activities and content such as data, graphics, images and links uploaded under their Sallatk account (&quot;Store Content&quot;). No Phi-Ross, computer worms or symbols of a destructive nature should be transported.<br />\r\n&bull; The user is responsible for keeping their password secure. Sallatk is not responsible for any loss or damage caused by forgetting and not maintaining account and password security.<br />\r\n&bull; The mission of The Sallatk Platform is simply to provide electronic support tools, by establishing the store, as the commitment of the Sallatk platform under this agreement is only to create the merchant&#39;s online store at the Sallatk electronic platform, and to put the store in front of users.<br />\r\n&bull; All transactions between the trader and the consumer have nothing to do with the person of the Sallatk platform, and the Sallatk platform is not responsible for it, as this transaction is an independent contractual relationship subject to the agreement between the trader and the consumer. Accordingly, if the consumer fails to pay for the service or product provided by the merchant, the Sallatk platform has nothing to do with these irregularities.<br />\r\n&bull; You know that Sallatk is a technical electronic platform on the internet that allows the trader who agrees to this agreement to establish his online store, and to practice his activity across the store, and its mission ends thereby. There is no liability on the Sallatk platform for the irregularities that the trader in his store makes in violation of the terms of this agreement, and Sallatk has nothing to do with transactions between the trader and the consumer.<br />\r\n&bull; In the event that the applicant is a &quot;natural person&quot; trader, the trader is also obliged to verify and provide the requirements required by the official authorities according to the nature of the trader&#39;s activity, as the individual trader acknowledges that he is complying with these requirements and is committed to providing and processing them, and the individual trader is obliged to provide his national identity number and other necessary information and documents. It&#39;s ordered by your Sallatk platform.<br />\r\n&bull; If the applicant merchant is a business, company, charity or legal entity, the Sallatk platform must be provided with all information and documentary documents, such as the commercial register and any other documents of the store requested by the Sallatk registration platform and to prove the store&#39;s legal identity.<br />\r\n&bull; Sallatk has the right to remove the content of the Store and accounts that contain content deemed illegal, offensive, threatening, defamatory, defamatory, defamatory, promoting pornographic, obscene or unwanted content in any way, violating the intellectual property of any party or in violation of the terms of use.</p>\r\n\r\n<p dir=\"ltr\"><br />\r\n<strong>&bull; Third-party services: - payment gateways - shipping and delivery services - mobile messages - domain range.</strong></p>\r\n\r\n<p dir=\"ltr\"><br />\r\n&bull; All transactions between the merchant and service providers (third party services) whoprovide the Sallatk platform to link with their services or offer their services to benefit the merchant and the consumer have nothing to do with the Sallatk platform, as this transaction is a contractual relationship independent of the Sallatk platform and subject to the agreement between the merchant and the service provider, and accordingly if one of the parties defaults or refrains or does not commit to the implementation of<br />\r\nIts obligations agreed or not implemented as required, The Sallatk Platform is not responsible for the consequences of these actions, the Sallatk platform is not responsible for any irregularities that occur or are committed between the merchant and the service provider.<br />\r\n&bull; Under the rules and provisions of this use agreement, The Sallatk Platform may provide some strategic or logistical services through a third party or third parties, such as but not limited to: shipping company services, electronic payment gateways and delivery of products and goods.<br />\r\n&bull; The Sallatk Platform takes note that its provision of strategic or logistics services is only facilitated and cooperated with it and to assist users of the Sallatk platform She is not obliged to do so and requires her approval under a book submitted to her.<br />\r\n&bull; You take note of the Sallatk platform that it is not fully or directly responsible for any actions issued by any third party and that what you are doing is merely a link between the user and the third party service provider.<br />\r\n&bull; Take note of the Sallatk platform that the request for this service is not mandatory, but this is due to the desire and need of the user, and when the trader uses the services of the third party available at The Sallatk platform, The Sallatk Platform disclaims responsibility for this relationship and this relationship has its own independent provisions that take place between the trader and the third party.<br />\r\n&bull; Some strategic and logistics service providers set their own requirements or costs and Sallatk does not have any authority over these requirements or costs, so Sallatk recommends that registered traders see the terms of the service provider (third party) and the costs of its services before confirming the service request.<br />\r\n&bull; In the event that the user submits a request for a service provided by (third party), the user of this behavior authorizes the Sallatk platform and gives it permission to provide the service provider (third party) with the personal user data requested by the service provider (third party), and this is in accordance with the rules and provisions of the privacy policy and the confidentiality of the information applicable to the Sallatk platform.</p>\r\n\r\n<p dir=\"ltr\">&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Sallatk platform wishes you<br />\r\nSuccessful e-commerce</p>\r\n\r\n<p dir=\"ltr\">&nbsp;</p>', '2020-12-16 20:02:13', '2021-01-06 05:16:45'),
(10, 5, 1, NULL, 'E-payment', '<p dir=\"ltr\" style=\"text-align: justify;\">We&#39;ve provided you with multiple options to buy in your store that you can do with ease</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">We have provided our customers with the best solutions, services and partnerships in cooperation with the best service providers in the region and according to this partnership, Sallatk platform customers who own e-stores will receive a free electronic payment gateway and a fixed price for electronic payments and without any subscriptions or monthly or annual fees for the payment gateway only to customers of payment packages in the Sallatk platform, through &quot;Partners&quot;</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">&quot;Acknowledge and pledge&quot;</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Each individual/company/institution (applicant for electronic payment gateway) agrees that the company providing the electronic payment service is the one who collects money for him in his online store and who owns the rights to program the Sallatk platform and that he discharges the responsibility of your basket from any defect, error, delay in collection or refund of any amounts in his account balance with the electronic payment service provider or the disapproval of the electronic payment service provider to request or stop the service.</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">The payment options available to you in the online store are:</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">1- The option of bank transfer or bank transfers is to add the bank account number to appear at every shopping in the store in order to transfer the amounts to you from the customer and the customer photographs the picture of the wire transfer and attach it to you to confirm the transfer<br />\r\n2- The option to pay on receipt is for cash payment .<br />\r\n3- Electronic payment option (especially in the electronic payment service provider)</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Payment through: -</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">1. KNet<br />\r\n2- Visa, Master&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Collection fees (especially in Sallatk platform customers)</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">1- Keynet 250 fils / for one fixed operation<br />\r\n2- Visa and MasterCard 2.5% + 100 fils / per operation</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">The duration of collection of funds</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">1- Payments via KNet (1 working day)<br />\r\n2- Payments by credit card (2 working days)</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">There is no establishment fee or monthly subscription fee for the payment gateway</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Installation of the Api code for the payment gateway through your store&#39;s control panel:</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">A gun</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">1- A copy of the id (front and back)<br />\r\n2- IBAN number for the owner of the id<br />\r\n3. The address and telephone number of the project&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Foundation</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">1- A copy of the commercial register<br />\r\n2- A copy of the id (front and back)<br />\r\n3- Iban Number<br />\r\n4- The address and phone number of the organization &nbsp;</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">* Approval and activation of the electronic payment portal (two working days)</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">* The e-payment service provider will be notified to stop and cancel the e-payment gateway at the end of the subscription period of the paid e-store or when it does not comply with the terms and conditions of the &quot;Sallatk Platform&quot; and that it discharges the responsibility of the Company platform Sallatk from the damagecaused by it after the service ceases to be suspended from the e-payment service provider</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">* Note / We inform you that our provision of strategic or logistics services is only a facility and cooperation from us to assist users of the Sallatk platform, therefore the Sallatk platform is not fully or indirectly responsible for any actions issued by any third party and that what you are doing is just linking the user and the third party service provider after taking approval from them and making sure that all conditions are complete for their availability.<br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\nSee the Terms and Conditions page</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">&nbsp;</p>', '2020-12-16 20:25:57', '2021-02-22 16:12:37'),
(11, 6, 1, NULL, 'FAQs', '<p dir=\"ltr\">FAQs<br />\r\nDo you have any questions that are not mentioned here on the FAQ page? Connect with us through WhatsApp +96555494522<br />\r\n&nbsp;<br />\r\n<strong>* Registration and subscription steps ?</strong><br />\r\n- 1 - Choose the package that is right for you according to your business and fill out the application form 2 - Choose Domain ends with dot com free 3 - Subscribe with the service of electronic payment and installation free 4 - publish your store on the networksites to receive orders.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is there an explanation of the control panel ?</strong><br />\r\n- Yes there are explanations on the internet explaining the use of the control panel through our YouTube channel in addition to the technical support that is available through chat inside the control panel to help.</p>\r\n\r\n<p dir=\"ltr\"><strong>* How many packages do you have ?</strong><br />\r\n- On the Sallatk platform there are 3 basic packages (free) - Sallatk Go Package (Paid) - Sallatk Pro Package (Paid), each of these packages has special features and is suitable for different types of e-commerce users, comparing features through the price page.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is there a free experience of paid packages ?</strong><br />\r\n- Yes there is a trial grace period for the benefits and for a period of one month without an electronic payment portal and you can try and equip your e-store before starting, and remember that your Sallatk does not provide a refund service.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is the service available in my country ?</strong><br />\r\n- The main center of The Sallatk Platform is Kuwait and our technical team can provide technical solutions and technical support to all our customers through the means of communication described and available in your Sallatk with ease and complete convenience.</p>\r\n\r\n<p dir=\"ltr\"><strong>* How can I subscribe to one of the paid packages ?</strong><br />\r\n- You can upgrade the package through your control panel and choose your own range and easily then add the link to your store in your bio in the networking sites to receive your requests.</p>\r\n\r\n<p dir=\"ltr\"><strong>* How long do you have a package subscription ?</strong><br />\r\n- In the free package there is no time either paid packages you can choose the method of subscription and payment, month or year as you wish, and we save you in (annual discount packages)</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can my store be moved to another company ?</strong><br />\r\n- Can&#39;t move your store to another company, all our plans come with their own web hosting, making sure that your website is secure and available all the time.</p>\r\n\r\n<p dir=\"ltr\"><strong>* I have a special Domain domain can I link it with you ?</strong><br />\r\n- Yes you can do this and with ease all you have to do is link your domain to the DNS of our servers and will be activated within 24 hours or less and for more information or help contact us on WhatsApp +96555444522.</p>\r\n\r\n<p dir=\"ltr\"><strong>* How can I unsubscribe ?</strong><br />\r\n- Yes, you can cancel, stop or delete your store at any time and for any circumstances through your control panel, but your basket does not provide a refund service.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can i create a free online store ?</strong><br />\r\n- Yes, you can open an online store supported by the Sallatk platform link for free and if you want a paid package you can do so by upgrading your package and choosing the most suitable features for your business.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can i upgrade the package or change the package ?</strong><br />\r\n- Yes this can be done in all paid packages, but you can not refer to the free package.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Are there additional fees ?</strong><br />\r\n- Yes when requesting a service for third party services such as the purchase of mobile sms, delivery and shipping fees, or electronic payment fees</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can I take a copy of my site ?</strong><br />\r\n- You can&#39;t, you don&#39;t need a copy, everything you need to know you can refer to with your control panel</p>\r\n\r\n<p dir=\"ltr\"><strong>* Do you have a delivery and shipping service ?</strong><br />\r\n- No, but you can add your delivery and shipping prices and your shop rep, and also you can link with shipping and delivery companies as you wish through your shop board.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Does Sallatk take a commission on sales ?</strong><br />\r\n- No, the commission charged by you is a special fee in electronic payment companies and the Sallatk platform does not have any percentage of it.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can I control the colors of my store ?</strong><br />\r\n- Yes, you can modify and control the colors according to the brand in your business identity.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can I create a customer order ?</strong><br />\r\n- Yes, this can be done through your store&#39;s control panel and you can also edit orders.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is there an accounting system in my store ?</strong><br />\r\n- Yes, there are comprehensive statistics on daily, weekly, monthly, annual sales ready and organized on any date you request.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is a commercial register required to register on the Sallatk platform ?</strong></p>\r\n\r\n<div class=\"tw-ta-container hide-focus-ring tw-nfl\" id=\"tw-target-text-container\" tabindex=\"0\">\r\n<p class=\"tw-data-text tw-text-large XcVN5d tw-ta\" data-placeholder=\"الترجمة\" dir=\"ltr\" id=\"tw-target-text\" style=\"text-align: left;\">- It is not required to have a commercial register for the store for individuals, but it is preferable to have a commercial register to preserve and approve your identity and to increase the reliability of customers for your store</p>\r\n</div>', '2020-12-16 20:32:40', '2021-02-11 03:20:06');
INSERT INTO `pages_data` (`id`, `page_id`, `lang_id`, `source_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(12, 7, 2, NULL, 'مميزات متجر سلتك', '<div class=\"head_title_page\">\r\n<div class=\"row justify-content-md-center\">\r\n<div class=\"col-lg-9 col-md-10\">\r\n<div class=\"section-header text-center onle-way-h2\">\r\n<h2 class=\"section-title \" data-wow-delay=\"0.3s\" style=\"color: rgb(81, 83, 166); text-align: center;\"><span style=\"color:#28365e;\"><strong>إدارة سهلة لمتجرك</strong></span></h2>\r\n\r\n<p style=\"color: rgb(53, 58, 67); text-align: center;\"><strong>تجعلك تتحكم من أي مكان و في أي وقت</strong></p>\r\n\r\n<p style=\"color: rgb(53, 58, 67); text-align: center;\">&nbsp;</p>\r\n\r\n<div class=\"shape wow \" data-wow-delay=\"0.3s\"><img alt=\"مميزات متجر سلتك\" src=\"https://sallatk.com/uploads/site/media/0.05139600 1622546525.gif\" style=\"width: 340px; height: 220px;\" /></div>\r\n\r\n<div class=\"shape wow \" data-wow-delay=\"0.3s\">&nbsp;</div>\r\n\r\n<div class=\"shape wow \" data-wow-delay=\"0.3s\">&nbsp;</div>\r\n\r\n<div class=\"shape wow \" data-wow-delay=\"0.3s\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.08911200 1626181417.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4>&nbsp;</h4>\r\n\r\n			<h4><span style=\"color:#f3811f;\"><strong>صفحة التقارير</strong></span></h4>\r\n\r\n			<p><strong>تمكنك من معرفة المبيعات و الأرباح و رسوم الشحن و ضريبة القيمة المضافة و غيرها و يمكن فلترتها بحسب فترة زمنية محددة .</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.64704600 1626181532.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4>&nbsp;</h4>\r\n\r\n			<h4><span style=\"color:#28365e;\"><strong>إدارة الطلبات</strong></span></h4>\r\n\r\n			<p><strong>بيانات واضحة لك ( بيانات العميل , تفاصيل الشحن , طريقة الدفع , المنتجات المطلوبة , مراسلة العميل , طباعة الفاتورة , ارسال نسخة من الفاتورة , تغير حالة الطلب (جاري التحضير , جاري الشحن , اكتمل , استرجاع , ملغي )</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.72961700 1626181564.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4>&nbsp;</h4>\r\n\r\n			<h4><span style=\"color:#f3811f;\"><strong>إدارة وأضافة المنتجات</strong></span></h4>\r\n\r\n			<p><strong>يمكنك إضافة منتجاتك و اضافة الصور والسعر و الوصف و العنوان والتحكم في الخيارات الخاصة بالمنتج بشكل واضح و بسيط مهما كان نوع منتجك يمكنك ادراجها بسهولة .</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.34339400 1626181931.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4>&nbsp;</h4>\r\n\r\n			<h4><span style=\"color:#28365e;\"><strong>سهولة معرفة المخزون</strong></span></h4>\r\n\r\n			<p><strong>يمكنك مراجعة مخزون متجرك بضغطة زر واحدة وكذلك يمكنك التحكم والتعديل على المخزون من خلال خيارات سهلة .</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.88911300 1626184357.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4>&nbsp;</h4>\r\n\r\n			<h4><span style=\"color:#f3811f;\"><strong>خيارات دفع أكثر</strong></span></h4>\r\n\r\n			<p><strong>وفر لعملائك أكثر من طريقة للتسوق في متجرك الالكتروني من خلال شريكنا ماي فاتورة واعرف تفاصيل كل عملية دفع تتم على متجرك .</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2020-12-22 06:38:36', '2021-07-13 08:53:28'),
(13, 7, 1, NULL, 'Sallatk Features', '<div class=\"head_title_page\">\r\n<div class=\"row justify-content-md-center\">\r\n<div class=\"col-lg-9 col-md-10\">\r\n<div class=\"section-header text-center onle-way-h2\">\r\n<h2 class=\"section-title \" data-wow-delay=\"0.3s\" style=\"color: rgb(81, 83, 166); text-align: center;\"><strong>Easy management for your store</strong></h2>\r\n\r\n<p style=\"color: rgb(53, 58, 67); text-align: center;\">It makes you control from anywhere, anytime</p>\r\n\r\n<div class=\"shape wow \" data-wow-delay=\"0.3s\" style=\"text-align: left;\"><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.05139600%201622546525.gif\" style=\"width: 360px; height: 233px;\" /></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: left;\"><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.08911200%201626181417.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4 style=\"text-align: left;\"><strong>Reports page</strong></h4>\r\n\r\n			<p style=\"text-align: left;\">It enables you to know sales, profits, shipping fees, VAT, etc. and can be filtered according to a specified time period.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: left;\"><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.64704600%201626181532.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4 style=\"text-align: left;\"><strong>Order management</strong></h4>\r\n\r\n			<p style=\"text-align: left;\">Clear data for you (customer data, shipping details, payment method, required products, customer correspondence, invoice printing, order status change (preparation, shipping, completed, refunded, cancelled)</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: left;\"><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.72961700%201626181564.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4 style=\"text-align: left;\"><strong>Product Management and Add-on</strong></h4>\r\n\r\n			<p style=\"text-align: left;\">You can add your products, add photos, price, description, title, and control the product&#39;s options clearly and simply.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: left;\"><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.34339400%201626181931.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4 style=\"text-align: left;\"><strong>Easy inventory knowledge</strong></h4>\r\n\r\n			<p style=\"text-align: left;\">You can review your store&#39;s inventory at the touch of a button and you can control and adjust the inventory with easy options.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n\r\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:60%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: left;\"><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.88911300%201626184357.png\" style=\"width: 360px; height: 248px;\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h4 style=\"text-align: left;\"><strong>More payment options</strong></h4>\r\n\r\n			<p style=\"text-align: left;\">Provide your customers with more than one way to shop in your online store through our partner My Fatoorah.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align: left;\">&nbsp;</p>', '2020-12-22 06:39:27', '2021-07-13 08:58:15'),
(14, 8, 2, NULL, 'الدعم الفني للمشتركين', '<p style=\"text-align: center;\"><strong><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.67231900 1621420531.png\" style=\"width: 360px; height: 360px;\" /></span></span></strong><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><u><strong><span style=\"font-size:18px;\">تذاكر الدعم الفني للمشتركين</span></strong></u></p>\r\n\r\n<p><strong><span style=\"font-size:16px;\">نحب أن نؤكد لكم هو أننا نبذل كل ما في وسعنا لنجعل من تجربتكم تجربة مميزة معنا لذلك في بعض الأحيان قد تواجهك بعض الأمور التي تتطلب منا مساعدتك فيها مثل شرح بعض الأدوات والمميزات في لوحة تحكم متجركم أو قد يكون لديك مشكلة فيمكنك أن تتواصل معنا من خلال مركز الدعم الفني وسنقوم بالرد عليكم في أسرع وقت . التأخر في الرد أحياناً قد يرجع لأسباب كثيرة، وللمشاكل الطارئة جدا برجاء التواصل من خلال رقم الواتساب <a href=\"https://api.whatsapp.com/send?phone=96569666947\">بالضغط هنا</a></span></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:18px;\"><strong>أوقات العمل لدينا في الشركة هي </strong></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:14px;\"><strong>فريق الدعم الفني من 10 ص الي 6 م ( الجمعة , السبت - إجازة )</strong></span></li>\r\n	<li><strong><span style=\"font-size:16px;\"><a href=\"https://api.whatsapp.com/send?phone=96555494522\">Whatsapp - +965-55494522</a></span></strong></li>\r\n	<li><span style=\"font-size:14px;\"><strong>فريق خدمة العملاء والمبيعات معك دائماً</strong></span></li>\r\n	<li><strong><span style=\"font-size:16px;\"><a href=\"https://api.whatsapp.com/send?phone=96569666947\">Whatsapp - +965-69666947</a></span></strong></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><span style=\"font-size:18px;\">من خلال الدخول على لوحة التحكم - في القائمة الرئيسية يمين الشاشة</span></strong></p>\r\n\r\n<p><strong><span style=\"font-size:14px;\">الدعم الفني - طلب جديد</span></strong></p>\r\n\r\n<p><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.55903300 1621421827.png\" style=\"width: 360px; height: 360px;\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:18px;\"><strong>أكتب عنواناً واضحاً لمشكلتك وحدد جهة الرد و أهمية التذكرة</strong></span></p>\r\n\r\n<p><strong><span style=\"font-size:14px;\">الدعم الفني - المبيعات - الاقتراحات / أولوية منخفضة - هامة</span></strong></p>\r\n\r\n<p><img alt=\"\" src=\"https://sallatk.com/uploads/site/media/0.34097200 1621422123.png\" style=\"width: 360px; height: 360px;\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><span style=\"font-size:16px;\">نحن نبذل أقصى جهد لتحقيق رضاكم ، ونرجوا منكم مراعاة فروقات التوقيت فنحن نعمل بتوقيت دولة الكويت . كل ما نريده منكم هو أنتظار بعض الوقت كحد أقصى 24 ساعة وكل شيء سيبقى على ما يرام.</span></strong></p>\r\n\r\n<p><strong><span style=\"font-size:16px;\">بالنهاية نتمنى لكم تجارة الكترونية ناجحة ان شاءالله مع منصة <a href=\"https://sallatk.com\">سلتك&nbsp;</a> دمتم بخير</span></strong> 🧡</p>', '2021-05-19 06:16:58', '2021-08-15 00:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_shown` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `is_shown`, `created_at`, `updated_at`) VALUES
(20, 'Create Permission', 'admin', 1, '2020-06-05 04:48:50', '2020-06-05 04:48:50'),
(21, 'Edit Permission', 'admin', 0, '2020-06-05 04:49:15', '2020-06-05 04:49:15'),
(22, 'Delete Permission', 'admin', 0, '2020-06-05 04:51:05', '2020-06-05 04:51:05'),
(25, 'Create Language', 'admin', 0, '2020-06-05 05:34:37', '2020-06-05 05:34:37'),
(26, 'Update Language', 'admin', 0, '2020-06-05 05:34:54', '2020-06-05 05:34:54'),
(27, 'Delete Language', 'admin', 0, '2020-06-05 05:35:07', '2020-06-05 05:35:07'),
(29, 'Permissions', 'admin', 1, '2020-10-13 08:23:45', '2020-10-13 08:23:45'),
(30, 'Admins', 'admin', 1, '2020-10-13 08:25:04', '2020-10-13 08:25:04'),
(31, 'Dashboard', 'admin', 1, '2020-10-13 08:31:22', '2020-10-13 08:31:22'),
(34, 'Languages', 'admin', 0, '2020-10-13 08:32:38', '2020-10-13 08:32:38'),
(35, 'Roles', 'admin', 1, '2020-10-13 08:32:53', '2020-10-13 08:32:53'),
(36, 'Create admin', 'admin', 1, '2020-10-13 08:36:26', '2020-10-13 08:36:26'),
(37, 'Edit admin', 'admin', 1, '2020-10-13 08:36:39', '2020-10-13 08:36:39'),
(38, 'Update admins', 'admin', 1, '2020-10-13 08:36:56', '2020-10-13 08:36:56'),
(39, 'Delete admins', 'admin', 1, '2020-10-13 08:37:17', '2020-10-13 08:37:17'),
(40, 'Users', 'admin', 0, '2020-10-13 08:37:34', '2020-10-13 08:37:34'),
(41, 'Create users', 'admin', 0, '2020-10-13 08:37:49', '2020-10-13 08:37:49'),
(42, 'Update users', 'admin', 0, '2020-10-13 08:37:59', '2020-10-13 08:37:59'),
(43, 'Delete users', 'admin', 0, '2020-10-13 08:38:13', '2020-10-13 08:38:13'),
(44, 'Goals', 'admin', 0, '2020-10-13 08:50:19', '2020-10-13 08:50:19'),
(45, 'Create_goals', 'admin', 0, '2020-10-13 08:50:30', '2020-10-13 08:50:30'),
(46, 'Update_goals', 'admin', 0, '2020-10-13 08:50:43', '2020-10-13 08:50:43'),
(47, 'Delete_goals', 'admin', 0, '2020-10-13 08:50:58', '2020-10-13 08:50:58'),
(60, 'Insturctions', 'admin', 0, '2020-10-13 08:54:04', '2020-10-13 08:54:04'),
(61, 'Create_insturctions', 'admin', 0, '2020-10-13 08:54:14', '2020-10-13 08:54:14'),
(62, 'Update_insturctions', 'admin', 0, '2020-10-13 08:54:45', '2020-10-13 08:54:45'),
(63, 'Delete_insturctions', 'admin', 0, '2020-10-13 08:55:01', '2020-10-13 08:55:01'),
(64, 'Lang_insturctions', 'admin', 0, '2020-10-13 09:25:23', '2020-10-13 09:25:23'),
(96, 'Contact us', 'admin', 1, '2020-10-13 09:23:35', '2020-10-13 09:23:35'),
(99, 'Settings', 'admin', 1, '2020-10-13 09:24:33', '2020-10-13 09:24:33'),
(102, 'Sliders', 'admin', 0, '2020-10-13 09:25:11', '2020-10-13 09:25:11'),
(107, 'QuizModule', 'admin', 1, '2020-10-13 09:26:35', '2020-10-13 09:26:35'),
(108, 'Create_quiz_module', 'admin', 0, '2020-10-13 09:26:52', '2020-10-13 09:26:52'),
(110, 'Update_quiz_module', 'admin', 1, '2020-10-13 09:27:14', '2020-10-13 09:27:14'),
(112, 'Delete_quiz_module', 'admin', 0, '2020-10-13 09:27:49', '2020-10-13 09:27:49'),
(154, 'Lang_quiz_module', 'admin', 1, '2020-11-25 09:13:02', '2020-11-25 09:13:02'),
(155, 'Security', 'admin', 1, '2020-11-25 09:13:02', '2020-11-25 09:13:02'),
(156, 'Login', 'admin', 1, '2022-01-25 11:17:16', '2022-01-26 11:17:16'),
(157, 'Create_login', 'admin', 1, '2022-04-08 08:52:20', '2022-04-07 08:52:20'),
(158, 'Update_login', 'admin', 1, '2021-12-17 12:12:47', '2021-11-05 06:06:56'),
(159, 'Delete_login', 'admin', 1, '2022-02-16 12:29:19', '2022-02-10 12:29:19'),
(160, 'Lang_login', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(161, 'Create_activity_modules', 'admin', 1, '2022-02-16 12:29:19', '2022-02-10 12:29:19'),
(162, 'Update_activity_modules', 'admin', 1, '2021-11-10 07:11:46', '2021-11-05 06:06:56'),
(163, 'Delete_activity_modules', 'admin', 1, '2022-02-16 12:29:19', '2022-02-10 12:29:19'),
(164, 'Lang_activity_modules', 'admin', 1, '2020-11-10 20:20:38', '2022-04-07 08:52:20'),
(165, 'mainPage', 'admin', 1, '2022-02-16 12:29:19', '2022-02-10 12:29:19'),
(166, 'Create_main', 'admin', 1, '2021-11-10 07:11:46', '2021-11-10 07:11:46'),
(167, 'Update_main', 'admin', 1, '2022-02-16 12:29:19', '2022-02-10 12:29:19'),
(168, 'Pages', 'admin', 1, '2022-01-25 11:17:16', '2022-01-26 11:17:16'),
(169, 'Create_page', 'admin', 1, '2022-02-16 12:29:19', '2022-02-10 12:29:19'),
(170, 'Update_page', 'admin', 1, '2021-12-17 12:12:47', '2021-06-08 11:00:59'),
(171, 'Delete_page', 'admin', 1, '2022-02-16 12:29:19', '2022-02-10 12:29:19'),
(172, 'Lang_main', 'admin', 1, '2020-11-10 20:20:38', '2022-04-07 08:52:20'),
(176, 'Modules', 'admin', 1, '2022-01-25 11:17:16', '2022-01-26 11:17:16'),
(177, 'Create_modules', 'admin', 1, '2022-02-16 12:29:19', '2022-02-10 12:29:19'),
(178, 'Update_modules', 'admin', 1, '2022-04-08 08:52:20', '2021-11-05 06:06:56'),
(179, 'Delete_modules', 'admin', 1, '2022-02-16 12:29:19', '2022-05-12 09:46:05'),
(180, 'Question', 'admin', 1, '2021-11-01 06:06:56', '2021-06-08 11:00:59'),
(181, 'Create_question', 'admin', 1, '2021-12-17 12:12:47', '2021-06-08 11:00:59'),
(182, 'Update_question', 'admin', 1, '2022-02-16 12:29:19', '2022-05-12 09:46:05'),
(183, 'Delete_question', 'admin', 1, '2021-11-01 06:06:56', '2021-11-05 06:06:56'),
(184, 'Delete_main', 'admin', 1, '2020-11-10 20:20:38', '2022-04-07 08:52:20'),
(187, 'Lang_goals', 'admin', 1, '2022-01-25 11:17:16', '2021-11-05 06:06:56'),
(188, 'Lang_question', 'admin', 1, '2022-04-08 08:52:20', '2022-01-26 11:17:16'),
(189, 'Lnag_modules', 'admin', 1, '2020-11-10 20:20:38', '2022-04-07 08:52:20'),
(190, 'mainGoal', 'admin', 1, '2020-11-10 20:20:38', '2021-11-05 06:06:56'),
(194, 'Create_main_goals', 'admin', 1, '2022-02-16 12:29:19', '2022-05-12 09:46:05'),
(195, 'Update_main_goals', 'admin', 1, '2021-11-10 07:11:46', '2021-11-05 06:06:56'),
(196, 'Delete_main_goals', 'admin', 1, '2022-02-16 12:29:19', '2022-05-12 09:46:05'),
(197, 'Lang_main_goals', 'admin', 1, '2021-11-01 06:06:56', '2021-11-10 07:11:46'),
(198, 'Delete_contact', 'admin', 1, '2022-02-16 12:29:19', '2022-05-12 09:46:05'),
(199, 'MainInsturcation', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(200, 'Create_main_insturcation', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(201, 'Update_main_insturcation', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(202, 'Delete_main_insturcation', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(203, 'Lang_main_insturcation', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(204, 'Help', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(205, 'Create_help', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(206, 'Update_help', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(207, 'Delete_help', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(208, 'Lang_help', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(209, 'Question Details', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(210, 'Create_question_details', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(211, 'Update_question_details', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(212, 'Delete_question_details', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(213, 'Lang_question_details', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59'),
(214, 'Question MCQ', 'admin', 1, '2022-04-08 08:52:20', '2021-06-08 11:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `permission_data`
--

CREATE TABLE `permission_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_data`
--

INSERT INTO `permission_data` (`id`, `title`, `lang_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 'Create Permission', 1, 20, '2020-06-05 04:48:50', '2020-06-05 09:35:48'),
(2, 'Edit Permission', 1, 21, '2020-06-05 04:49:15', '2020-06-05 04:49:15'),
(3, 'Delete Permission', 1, 22, '2020-06-05 04:51:05', '2020-06-05 04:51:05'),
(6, 'Create Language', 1, 25, '2020-06-05 05:34:37', '2020-06-05 05:34:37'),
(7, 'Update Language', 1, 26, '2020-06-05 05:34:54', '2020-06-05 05:34:54'),
(8, 'Delete Language', 1, 27, '2020-06-05 05:35:07', '2020-06-05 05:35:07'),
(46, 'إضافة صلاحية', 2, 20, '2020-06-05 09:23:00', '2020-06-05 09:23:00'),
(47, 'تعديل صلاحية', 2, 21, '2020-06-05 09:23:04', '2020-06-05 09:23:04'),
(48, 'حذف صلاحية', 2, 22, '2020-06-05 09:23:15', '2020-06-05 09:23:15'),
(49, 'إضافة لغة', 2, 25, '2020-06-05 09:23:31', '2020-06-05 09:23:31'),
(50, 'تعديل لغة', 2, 26, '2020-06-05 09:23:40', '2020-06-05 09:23:40'),
(51, 'حذف لغة', 2, 27, '2020-06-05 09:23:46', '2020-06-05 09:23:46'),
(52, 'Affiliate', 1, 28, '2020-06-18 07:35:50', '2020-06-18 07:35:50'),
(53, 'Permissions', 1, 29, '2020-10-13 08:23:45', '2020-10-13 08:23:45'),
(54, 'Admins', 1, 30, '2020-10-13 08:25:04', '2020-10-13 08:25:04'),
(55, 'Dashboard', 1, 31, '2020-10-13 08:31:22', '2020-10-13 08:31:22'),
(56, 'Stock', 1, 32, '2020-10-13 08:31:39', '2020-10-13 08:31:39'),
(57, 'Stock delete', 1, 33, '2020-10-13 08:31:57', '2020-10-13 08:31:57'),
(58, 'Languages', 1, 34, '2020-10-13 08:32:38', '2020-10-13 08:32:38'),
(59, 'Roles', 1, 35, '2020-10-13 08:32:53', '2020-10-13 08:32:53'),
(60, 'Create admin', 1, 36, '2020-10-13 08:36:26', '2020-10-13 08:36:26'),
(61, 'Edit admin', 1, 37, '2020-10-13 08:36:39', '2020-10-13 08:36:39'),
(62, 'Update admins', 1, 38, '2020-10-13 08:36:56', '2020-10-13 08:36:56'),
(63, 'Delete admins', 1, 39, '2020-10-13 08:37:17', '2020-10-13 08:37:17'),
(64, 'Users', 1, 40, '2020-10-13 08:37:34', '2020-10-13 08:37:34'),
(65, 'Create users', 1, 41, '2020-10-13 08:37:49', '2020-10-13 08:37:49'),
(66, 'Update users', 1, 42, '2020-10-13 08:37:59', '2020-10-13 08:37:59'),
(67, 'Delete users', 1, 43, '2020-10-13 08:38:13', '2020-10-13 08:38:13'),
(68, 'Brands', 1, 44, '2020-10-13 08:50:19', '2020-10-13 08:50:19'),
(69, 'Create brand', 1, 45, '2020-10-13 08:50:30', '2020-10-13 08:50:30'),
(70, 'Update brand', 1, 46, '2020-10-13 08:50:43', '2020-10-13 08:50:43'),
(71, 'Delete brand', 1, 47, '2020-10-13 08:50:58', '2020-10-13 08:50:58'),
(72, 'Types', 1, 48, '2020-10-13 08:51:07', '2020-10-13 08:51:07'),
(73, 'Create type', 1, 49, '2020-10-13 08:51:16', '2020-10-13 08:51:16'),
(74, 'Update type', 1, 50, '2020-10-13 08:51:25', '2020-10-13 08:51:25'),
(75, 'Delete type', 1, 51, '2020-10-13 08:51:56', '2020-10-13 08:51:56'),
(76, 'Currencies', 1, 52, '2020-10-13 08:52:09', '2020-10-13 08:52:09'),
(77, 'Create currency', 1, 53, '2020-10-13 08:52:18', '2020-10-13 08:52:18'),
(78, 'Update currency', 1, 54, '2020-10-13 08:52:27', '2020-10-13 08:52:27'),
(79, 'Delete currency', 1, 55, '2020-10-13 08:52:41', '2020-10-13 08:52:41'),
(80, 'Sounds', 1, 56, '2020-10-13 08:52:53', '2020-10-13 08:52:53'),
(81, 'Create sound', 1, 57, '2020-10-13 08:53:05', '2020-10-13 08:53:05'),
(82, 'Update sound', 1, 58, '2020-10-13 08:53:31', '2020-10-13 08:53:31'),
(83, 'Delete sound', 1, 59, '2020-10-13 08:53:46', '2020-10-13 08:53:46'),
(84, 'Categories', 1, 60, '2020-10-13 08:54:04', '2020-10-13 08:54:04'),
(85, 'Create category', 1, 61, '2020-10-13 08:54:14', '2020-10-13 08:54:14'),
(86, 'Update category', 1, 62, '2020-10-13 08:54:45', '2020-10-13 08:54:45'),
(87, 'Delete category', 1, 63, '2020-10-13 08:55:01', '2020-10-13 08:55:01'),
(88, 'Discount codes', 1, 64, '2020-10-13 08:55:47', '2020-10-13 08:55:47'),
(89, 'Offers', 1, 65, '2020-10-13 08:56:01', '2020-10-13 08:56:01'),
(90, 'Create offer', 1, 66, '2020-10-13 08:56:10', '2020-10-13 08:56:10'),
(91, 'Update offer', 1, 67, '2020-10-13 08:56:27', '2020-10-13 08:56:27'),
(92, 'Delete offer', 1, 68, '2020-10-13 08:56:51', '2020-10-13 08:56:51'),
(93, 'Campaigns', 1, 69, '2020-10-13 08:57:01', '2020-10-13 08:57:01'),
(94, 'Create campaign', 1, 70, '2020-10-13 08:57:09', '2020-10-13 08:57:09'),
(95, 'Update campaign', 1, 71, '2020-10-13 08:57:23', '2020-10-13 08:57:23'),
(96, 'Delete campaign', 1, 72, '2020-10-13 08:59:08', '2020-10-13 08:59:08'),
(97, 'Abandoned carts', 1, 73, '2020-10-13 08:59:23', '2020-10-13 08:59:23'),
(98, 'Customers', 1, 74, '2020-10-13 09:17:00', '2020-10-13 09:17:00'),
(99, 'Create customers group', 1, 75, '2020-10-13 09:17:19', '2020-10-13 09:17:19'),
(100, 'Update customers group', 1, 76, '2020-10-13 09:17:34', '2020-10-13 09:17:34'),
(101, 'Delete customers group', 1, 77, '2020-10-13 09:17:47', '2020-10-13 09:17:47'),
(102, 'Customers group', 1, 78, '2020-10-13 09:18:03', '2020-10-13 09:18:03'),
(103, 'Create customer', 1, 79, '2020-10-13 09:18:28', '2020-10-13 09:18:28'),
(104, 'Update customer', 1, 80, '2020-10-13 09:18:44', '2020-10-13 09:18:44'),
(105, 'Delete customer', 1, 81, '2020-10-13 09:18:58', '2020-10-13 09:18:58'),
(106, 'Affiliate', 1, 82, '2020-10-13 09:20:05', '2020-10-13 09:20:05'),
(107, 'Orders', 1, 83, '2020-10-13 09:20:28', '2020-10-13 09:20:28'),
(108, 'Mailing list', 1, 84, '2020-10-13 09:20:41', '2020-10-13 09:20:41'),
(109, 'Create mailing list', 1, 85, '2020-10-13 09:20:53', '2020-10-13 09:20:53'),
(110, 'Import mailing list', 1, 86, '2020-10-13 09:21:07', '2020-10-13 09:21:07'),
(111, 'Update mailing list', 1, 87, '2020-10-13 09:21:17', '2020-10-13 09:21:17'),
(112, 'Delete mailing list', 1, 88, '2020-10-13 09:21:29', '2020-10-13 09:21:29'),
(113, 'Create mailing list group', 1, 89, '2020-10-13 09:21:50', '2020-10-13 09:21:50'),
(114, 'Update mailing list group', 1, 90, '2020-10-13 09:22:02', '2020-10-13 09:22:02'),
(115, 'Delete mailing list group', 1, 91, '2020-10-13 09:22:15', '2020-10-13 09:22:15'),
(116, 'Mailing templates', 1, 92, '2020-10-13 09:22:25', '2020-10-13 09:22:25'),
(117, 'Create mailing template', 1, 93, '2020-10-13 09:22:37', '2020-10-13 09:22:37'),
(118, 'Update mailing template', 1, 94, '2020-10-13 09:22:54', '2020-10-13 09:22:54'),
(119, 'Tickets', 1, 95, '2020-10-13 09:23:14', '2020-10-13 09:23:14'),
(120, 'Contact us', 1, 96, '2020-10-13 09:23:35', '2020-10-13 09:23:35'),
(121, 'Notifications', 1, 97, '2020-10-13 09:23:46', '2020-10-13 09:23:46'),
(122, 'Links', 1, 98, '2020-10-13 09:23:57', '2020-10-13 09:23:57'),
(123, 'Settings', 1, 99, '2020-10-13 09:24:33', '2020-10-13 09:24:33'),
(124, 'Shipping', 1, 100, '2020-10-13 09:24:43', '2020-10-13 09:24:43'),
(125, 'Banks', 1, 101, '2020-10-13 09:25:00', '2020-10-13 09:25:00'),
(126, 'Sliders', 1, 102, '2020-10-13 09:25:11', '2020-10-13 09:25:11'),
(127, 'Banners', 1, 103, '2020-10-13 09:25:23', '2020-10-13 09:25:23'),
(128, 'SMS', 1, 104, '2020-10-13 09:25:35', '2020-10-13 09:25:35'),
(129, 'Taxes', 1, 105, '2020-10-13 09:25:47', '2020-10-13 09:25:47'),
(130, 'Newsletter', 1, 106, '2020-10-13 09:26:22', '2020-10-13 09:26:22'),
(131, 'Sections', 1, 107, '2020-10-13 09:26:35', '2020-10-13 09:26:35'),
(132, 'Content management', 1, 108, '2020-10-13 09:26:53', '2020-10-13 09:26:53'),
(133, 'Pages', 1, 109, '2020-10-13 09:27:04', '2020-10-13 09:27:04'),
(134, 'Blog', 1, 110, '2020-10-13 09:27:15', '2020-10-13 09:27:15'),
(135, 'Points', 1, 111, '2020-10-13 09:27:39', '2020-10-13 09:27:39'),
(136, 'Chat', 1, 112, '2020-10-13 09:27:49', '2020-10-13 09:27:49'),
(137, 'Products', 1, 113, '2020-10-13 09:28:51', '2020-10-13 09:28:51'),
(138, 'Comments', 1, 114, '2020-10-13 09:29:01', '2020-10-13 09:29:01'),
(139, 'Invoices', 1, 115, '2020-10-13 09:29:15', '2020-10-13 09:29:15'),
(140, 'Reports', 1, 116, '2020-10-13 09:31:14', '2020-10-13 09:31:14'),
(146, 'Dashboard', 1, 122, '2020-10-25 07:31:48', '2020-10-25 07:31:48'),
(147, 'Roles', 1, 123, '2020-10-25 07:31:56', '2020-10-25 07:31:56'),
(148, 'Permissions', 1, 124, '2020-10-25 07:32:29', '2020-10-25 07:32:29'),
(149, 'Admins', 1, 125, '2020-10-25 07:32:37', '2020-10-25 07:32:37'),
(153, 'Settings', 1, 129, '2020-10-28 13:28:21', '2020-10-28 13:28:21'),
(154, 'التحكم في الاعدادات', 2, 129, '2020-10-28 13:28:39', '2020-10-28 13:31:06'),
(155, 'Language', 1, 130, '2020-10-28 13:29:47', '2020-10-28 13:29:47'),
(156, 'التحكم في اللغة', 2, 130, '2020-10-28 13:29:58', '2020-10-28 13:30:49'),
(157, 'التحكم في المديرين', 2, 125, '2020-10-28 13:31:28', '2020-10-28 13:31:28'),
(158, 'التحكم في الصلاحيات', 2, 124, '2020-10-28 13:31:52', '2020-10-28 13:32:33'),
(159, 'التحكم في مجموعة الصلاحيات', 2, 123, '2020-10-28 13:32:24', '2020-10-28 13:32:24'),
(160, 'التحكم في الداشبورد', 2, 122, '2020-10-28 13:32:52', '2020-10-28 13:32:52'),
(161, 'Slider', 1, 131, '2020-10-28 13:33:43', '2020-10-28 13:33:43'),
(162, 'التحكم في السلايدر', 2, 131, '2020-10-28 13:34:02', '2020-10-28 13:34:02'),
(163, 'Countries', 1, 132, '2020-10-28 13:37:19', '2020-10-28 13:37:19'),
(164, 'التحكم في الدول', 2, 132, '2020-10-28 13:37:38', '2020-10-28 13:37:38'),
(165, 'Cities', 1, 133, '2020-10-28 13:37:54', '2020-10-28 13:37:54'),
(166, 'التحكم في المدن', 2, 133, '2020-10-28 13:38:07', '2020-10-28 13:38:07'),
(167, 'Pages', 1, 134, '2020-10-28 13:38:23', '2020-10-28 13:38:23'),
(168, 'التحكم في محتوي الصفحات', 2, 134, '2020-10-28 13:38:44', '2020-10-28 13:43:43'),
(169, 'Sms', 1, 135, '2020-10-28 13:40:35', '2020-10-28 13:40:35'),
(170, 'التحكم في باقات الرسائل', 2, 135, '2020-10-28 13:41:01', '2020-10-28 13:41:01'),
(171, 'Packages', 1, 136, '2020-10-28 13:43:09', '2020-10-28 13:43:09'),
(172, 'التحكم في الباقات', 2, 136, '2020-10-28 13:44:01', '2020-10-28 13:44:01'),
(173, 'Contents', 1, 137, '2020-10-28 13:44:58', '2020-10-28 13:44:58'),
(174, 'التحكم في محتوي الصفحة الرئيسية', 2, 137, '2020-10-28 13:45:25', '2020-10-28 13:45:25'),
(175, 'Sup-Pages', 1, 138, '2020-10-28 14:06:24', '2020-10-28 14:06:24'),
(176, 'التحكم في الصفحات الفرعية', 2, 138, '2020-10-28 14:06:52', '2020-10-28 14:06:52'),
(177, 'Contact-Us', 1, 139, '2020-10-28 14:08:28', '2020-10-28 14:08:28'),
(178, 'التحكم في رسائل تواصل معنا', 2, 139, '2020-10-28 14:09:08', '2020-10-28 14:09:08'),
(179, 'Mailing-Templates', 1, 140, '2020-10-28 14:10:11', '2020-10-28 14:10:11'),
(180, 'التحكم في القوائم البريدية', 2, 140, '2020-10-28 14:10:34', '2020-10-28 14:10:34'),
(181, 'Blogs', 1, 141, '2020-10-28 14:12:20', '2020-10-28 14:12:20'),
(182, 'التحكم في المدونات', 2, 141, '2020-10-28 14:12:36', '2020-10-28 14:12:36'),
(183, 'Templates', 1, 142, '2020-10-28 14:14:03', '2020-10-28 14:14:03'),
(184, 'التحكم في القوالب', 2, 142, '2020-10-28 14:14:35', '2020-10-28 14:14:35'),
(185, 'Sms-Gates', 1, 143, '2020-10-28 14:15:31', '2020-10-28 14:15:31'),
(186, 'التحكم في بوابات الرسائل القصيرة', 2, 143, '2020-10-28 14:15:59', '2020-10-28 14:15:59'),
(187, 'Payment-Gates', 1, 144, '2020-10-28 14:16:32', '2020-10-28 14:16:32'),
(188, 'التحكم في بوابات الدفع', 2, 144, '2020-10-28 14:16:53', '2020-10-28 14:16:53'),
(189, 'Sms-Reservation', 1, 145, '2020-10-28 14:18:10', '2020-10-28 14:18:10'),
(190, 'التحكم في حجز الرسائل القصيرة', 2, 145, '2020-10-28 14:18:41', '2020-10-28 14:18:41'),
(191, 'Stores', 1, 146, '2020-10-28 14:19:56', '2020-10-28 14:19:56'),
(192, 'التحكم في المتاجر', 2, 146, '2020-10-28 14:20:15', '2020-10-28 14:20:15'),
(193, 'Financial-Transactions', 1, 148, '2020-10-28 14:41:18', '2020-10-28 14:41:18'),
(194, 'التحكم في المعاملات المالية', 2, 148, '2020-10-28 14:41:44', '2020-10-28 14:41:44'),
(195, 'Design', 1, 149, '2020-10-29 10:39:31', '2020-10-29 10:39:31'),
(196, 'Online', 1, 150, '2020-10-29 10:39:41', '2020-10-29 10:39:41'),
(198, 'Currencies', 1, 152, '2020-11-05 09:07:02', '2020-11-05 09:07:02'),
(199, 'Countries', 1, 153, '2020-11-25 09:10:43', '2020-11-25 09:10:43'),
(200, 'Cities', 1, 154, '2020-11-25 09:13:02', '2020-11-25 09:13:02'),
(201, 'الدول', 2, 153, '2020-11-25 09:21:16', '2020-11-25 09:21:16'),
(202, 'المدن', 2, 154, '2020-11-25 09:21:48', '2020-11-25 09:21:48'),
(203, 'Security', 1, 155, NULL, NULL),
(204, 'الحماية', 2, 155, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_donations`
--

CREATE TABLE `product_donations` (
  `id` int(10) UNSIGNED NOT NULL,
  `min_price` int(11) NOT NULL,
  `max_price` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_lables`
--

CREATE TABLE `product_lables` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_id` int(10) UNSIGNED NOT NULL,
  `lable_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_lables`
--

INSERT INTO `product_lables` (`id`, `created_at`, `updated_at`, `product_id`, `lable_id`, `active`) VALUES
(1710, '2022-01-18 10:15:25', '2022-01-18 10:15:25', 320, 96, 1),
(1711, '2022-01-18 10:16:59', '2022-01-18 10:16:59', 320, 103, 1),
(1715, '2022-02-01 10:18:44', '2022-02-01 10:18:44', 305, 96, 1),
(1716, '2022-02-20 06:09:23', '2022-02-20 06:09:23', 443, 107, 1),
(1719, '2022-02-23 11:03:10', '2022-02-23 11:03:10', 448, 98, 1),
(1721, '2022-02-28 10:15:31', '2022-02-28 10:15:31', 4, 109, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_lables_data`
--

CREATE TABLE `product_lables_data` (
  `id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_lables_data`
--

INSERT INTO `product_lables_data` (`id`, `value`, `created_at`, `updated_at`, `lang_id`, `item_id`) VALUES
(3006, 'مصر', '2022-01-23 08:34:14', '2022-01-23 06:34:14', 2, 1710),
(3007, 'a1', '2022-01-18 10:16:59', '2022-01-18 10:16:59', 1, 1711),
(3008, 'egypt', '2022-01-18 12:49:31', '2022-01-18 10:49:31', 1, 1710),
(3015, 'مصر', '2022-02-01 10:18:44', '2022-02-01 10:18:44', 2, 1715),
(3016, 'تجربة', '2022-02-20 06:09:24', '2022-02-20 06:09:24', 2, 1716),
(3019, 'مصر', '2022-02-23 11:03:10', '2022-02-23 11:03:10', 2, 1719),
(3020, 'egypt', '2022-02-23 11:05:55', '2022-02-23 11:05:55', 1, 1719),
(3022, 'تجربة', '2022-02-28 12:16:06', '2022-02-28 10:16:06', 1, 1721);

-- --------------------------------------------------------

--
-- Table structure for table `product_out_notify`
--

CREATE TABLE `product_out_notify` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_photos`
--

CREATE TABLE `product_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_photos`
--

INSERT INTO `product_photos` (`id`, `product_id`, `lang_id`, `source_id`, `tag`, `photo`, `description`, `main`, `created_at`, `updated_at`, `deleted_at`) VALUES
(384, 7, NULL, NULL, '164035703131671', '/uploads/products/194/164035703131671.jpg', '164035703131671', 0, '2021-12-24 12:43:51', '2021-12-24 12:43:51', NULL),
(385, 3, NULL, NULL, '164035704348956.jpg', '/uploads/products/194/164035704348956.jpg', '164035704348956.jpg', 1, '2021-12-24 12:17:41', '2021-12-24 12:44:03', NULL),
(388, 195, NULL, NULL, '164037128739679', '/uploads/products/195/164037128739679.png', '164037128739679', 0, '2021-12-24 16:41:27', '2021-12-24 16:41:27', NULL),
(389, 195, NULL, NULL, '164037132331502.jpg', '/uploads/products/195/164037132331502.jpg', '164037132331502.jpg', 1, '2021-12-24 16:42:03', '2021-12-24 16:42:03', NULL),
(393, 199, NULL, NULL, '164044065044338', '/uploads/products/199/164044065044338.jpeg', '164044065044338', 0, '2021-12-25 11:57:30', '2021-12-25 11:57:30', NULL),
(394, 199, NULL, NULL, '164044065724245.jpg', '/uploads/products/199/164044065724245.jpg', '164044065724245.jpg', 1, '2021-12-25 11:57:37', '2021-12-25 11:57:37', NULL),
(401, 202, NULL, NULL, '164044943168281', '/uploads/products/202/164044943168281.jpg', '164044943168281', 0, '2021-12-25 14:23:51', '2021-12-25 14:23:51', NULL),
(402, 202, NULL, NULL, '164044943590367.jpg', '/uploads/products/202/164044943590367.jpg', '164044943590367.jpg', 1, '2021-12-25 14:23:55', '2021-12-25 14:23:55', NULL),
(414, 208, NULL, NULL, '164061452371392', '/uploads/products/208/164061452371392.jpeg', '164061452371392', 0, '2021-12-27 12:15:23', '2021-12-27 12:15:23', NULL),
(415, 208, NULL, NULL, '164061452666474', '/uploads/products/208/164061452666474.jpeg', '164061452666474', 0, '2021-12-27 12:15:26', '2021-12-27 12:15:26', NULL),
(416, 208, NULL, NULL, '164061453667081.jpeg', '/uploads/products/208/164061453667081.jpeg', '164061453667081.jpeg', 1, '2021-12-27 12:15:36', '2021-12-27 12:15:36', NULL),
(417, 209, NULL, NULL, '164061639844037', '/uploads/products/209/164061639844037.jpeg', '164061639844037', 0, '2021-12-27 12:46:38', '2021-12-27 12:46:38', NULL),
(418, 209, NULL, NULL, '164061643599726', '/uploads/products/209/164061643599726.jpeg', '164061643599726', 0, '2021-12-27 12:47:15', '2021-12-27 12:47:15', NULL),
(419, 209, NULL, NULL, '164061643970767.jpg', '/uploads/products/209/164061643970767.jpg', '164061643970767.jpg', 1, '2021-12-27 12:47:19', '2021-12-27 12:47:19', NULL),
(420, 210, NULL, NULL, '164061852274758', '/uploads/products/210/164061852274758.jpeg', '164061852274758', 0, '2021-12-27 13:22:02', '2021-12-27 13:22:02', NULL),
(421, 210, NULL, NULL, '164061852649535.jpg', '/uploads/products/210/164061852649535.jpg', '164061852649535.jpg', 1, '2021-12-27 13:22:06', '2021-12-27 13:22:06', NULL),
(422, 211, NULL, NULL, '164062358965399.png', '/uploads/products/211/164062358965399.png', '164062358965399.png', 1, '2021-12-27 14:46:06', '2021-12-27 14:46:29', NULL),
(423, 212, NULL, NULL, '164078863137504.jpg', '/uploads/products/212/164078863137504.jpg', '164078863137504.jpg', 1, '2021-12-29 12:37:11', '2021-12-29 12:37:11', NULL),
(424, 213, NULL, NULL, '164078985480189', '/uploads/products/213/164078985480189.jpeg', '164078985480189', 0, '2021-12-29 12:57:34', '2021-12-29 12:57:34', NULL),
(425, 213, NULL, NULL, '164078985941457.jpeg', '/uploads/products/213/164078985941457.jpeg', '164078985941457.jpeg', 1, '2021-12-29 12:57:39', '2021-12-29 12:57:39', NULL),
(426, 214, NULL, NULL, '164079185712894', '/uploads/products/214/164079185712894.png', '164079185712894', 0, '2021-12-29 13:30:57', '2021-12-29 13:30:57', NULL),
(427, 214, NULL, NULL, '164079186463928.jpeg', '/uploads/products/214/164079186463928.jpeg', '164079186463928.jpeg', 1, '2021-12-29 13:31:04', '2021-12-29 13:31:04', NULL),
(428, 215, NULL, NULL, '164079285249830', '/uploads/products/215/164079285249830.png', '164079285249830', 0, '2021-12-29 13:47:32', '2021-12-29 13:47:32', NULL),
(429, 215, NULL, NULL, '164079285747590.png', '/uploads/products/215/164079285747590.png', '164079285747590.png', 1, '2021-12-29 13:47:37', '2021-12-29 13:47:37', NULL),
(430, 216, NULL, NULL, '164079354134106', '/uploads/products/216/164079354134106.jpeg', '164079354134106', 0, '2021-12-29 13:59:01', '2021-12-29 13:59:01', NULL),
(431, 216, NULL, NULL, '164079354539215.jpeg', '/uploads/products/216/164079354539215.jpeg', '164079354539215.jpeg', 1, '2021-12-29 13:59:05', '2021-12-29 13:59:05', NULL),
(432, 217, NULL, NULL, '164079447371903', '/uploads/products/217/164079447371903.jpeg', '164079447371903', 0, '2021-12-29 14:14:33', '2021-12-29 14:14:33', NULL),
(433, 217, NULL, NULL, '164079447762715.jpeg', '/uploads/products/217/164079447762715.jpeg', '164079447762715.jpeg', 1, '2021-12-29 14:14:37', '2021-12-29 14:14:37', NULL),
(434, 218, NULL, NULL, '164079619725596', '/uploads/products/218/164079619725596.png', '164079619725596', 0, '2021-12-29 14:43:17', '2021-12-29 14:43:17', NULL),
(435, 218, NULL, NULL, '164079621172063.png', '/uploads/products/218/164079621172063.png', '164079621172063.png', 1, '2021-12-29 14:43:24', '2021-12-29 14:43:31', NULL),
(436, 219, NULL, NULL, '164079885645794', '/uploads/products/219/164079885645794.png', '164079885645794', 0, '2021-12-29 15:27:36', '2021-12-29 15:27:36', NULL),
(437, 219, NULL, NULL, '164079885916802.jpeg', '/uploads/products/219/164079885916802.jpeg', '164079885916802.jpeg', 1, '2021-12-29 15:27:39', '2021-12-29 15:27:39', NULL),
(438, 220, NULL, NULL, '164079897260601', '/uploads/products/220/164079897260601.jpeg', '164079897260601', 0, '2021-12-29 15:29:32', '2021-12-29 15:29:32', NULL),
(439, 220, NULL, NULL, '164079897538233.jpg', '/uploads/products/220/164079897538233.jpg', '164079897538233.jpg', 1, '2021-12-29 15:29:35', '2021-12-29 15:29:35', NULL),
(440, 221, NULL, NULL, '164079994358796.jpeg', '/uploads/products/221/164079994358796.jpeg', '164079994358796.jpeg', 1, '2021-12-29 15:45:43', '2021-12-29 15:45:43', NULL),
(441, 222, NULL, NULL, '164080147919846', '/uploads/products/222/164080147919846.jpg', '164080147919846', 0, '2021-12-29 16:11:19', '2021-12-29 16:11:19', NULL),
(442, 222, NULL, NULL, '164080148246883.jpeg', '/uploads/products/222/164080148246883.jpeg', '164080148246883.jpeg', 1, '2021-12-29 16:11:22', '2021-12-29 16:11:22', NULL),
(443, 222, NULL, NULL, '164080238874553', '/uploads/products/222/164080238874553.png', '164080238874553', 0, '2021-12-29 16:26:28', '2021-12-29 16:26:28', NULL),
(444, 223, NULL, NULL, '164080264046056', '/uploads/products/223/164080264046056.png', '164080264046056', 0, '2021-12-29 16:30:40', '2021-12-29 16:30:40', NULL),
(445, 223, NULL, NULL, '164080264299576', '/uploads/products/223/164080264299576.png', '164080264299576', 0, '2021-12-29 16:30:42', '2021-12-29 16:30:42', NULL),
(446, 223, NULL, NULL, '164080264545217.png', '/uploads/products/223/164080264545217.png', '164080264545217.png', 1, '2021-12-29 16:30:45', '2021-12-29 16:30:45', NULL),
(447, 224, NULL, NULL, '164080425453720', '/uploads/products/224/164080425453720.png', '164080425453720', 0, '2021-12-29 16:57:34', '2021-12-29 16:57:34', NULL),
(448, 224, NULL, NULL, '164080425763924', '/uploads/products/224/164080425763924.png', '164080425763924', 0, '2021-12-29 16:57:37', '2021-12-29 16:57:37', NULL),
(449, 224, NULL, NULL, '164080426056899.png', '/uploads/products/224/164080426056899.png', '164080426056899.png', 1, '2021-12-29 16:57:40', '2021-12-29 16:57:40', NULL),
(450, 226, NULL, NULL, '164080561162123', '/uploads/products/226/164080561162123.png', '164080561162123', 0, '2021-12-29 17:20:11', '2021-12-29 17:20:11', NULL),
(451, 226, NULL, NULL, '164080561241510.png', '/uploads/products/226/164080561241510.png', '164080561241510.png', 1, '2021-12-29 17:20:12', '2021-12-29 17:20:12', NULL),
(452, 225, NULL, NULL, '164080568251469', '/uploads/products/225/164080568251469.jpg', '164080568251469', 0, '2021-12-29 17:21:22', '2021-12-29 17:21:22', NULL),
(453, 225, NULL, NULL, '164080568629175.jpg', '/uploads/products/225/164080568629175.jpg', '164080568629175.jpg', 1, '2021-12-29 17:21:26', '2021-12-29 17:21:26', NULL),
(454, 227, NULL, NULL, '164080654564722', '/uploads/products/227/164080654564722.png', '164080654564722', 0, '2021-12-29 17:35:45', '2021-12-29 17:35:45', NULL),
(455, 227, NULL, NULL, '164080654713868', '/uploads/products/227/164080654713868.png', '164080654713868', 0, '2021-12-29 17:35:47', '2021-12-29 17:35:47', NULL),
(456, 227, NULL, NULL, '164080655232631.png', '/uploads/products/227/164080655232631.png', '164080655232631.png', 1, '2021-12-29 17:35:52', '2021-12-29 17:35:52', NULL),
(457, 228, NULL, NULL, '164080779845861', '/uploads/products/228/164080779845861.png', '164080779845861', 0, '2021-12-29 17:56:38', '2021-12-29 17:56:38', NULL),
(458, 228, NULL, NULL, '164080782340055.png', '/uploads/products/228/164080782340055.png', '164080782340055.png', 1, '2021-12-29 17:57:03', '2021-12-29 17:57:03', NULL),
(459, 229, NULL, NULL, '164087787757326', '/uploads/products/229/164087787757326.png', '164087787757326', 0, '2021-12-30 13:24:37', '2021-12-30 13:24:37', NULL),
(460, 229, NULL, NULL, '164087788443429', '/uploads/products/229/164087788443429.png', '164087788443429', 0, '2021-12-30 13:24:44', '2021-12-30 13:24:44', NULL),
(461, 229, NULL, NULL, '164087788627111', '/uploads/products/229/164087788627111.png', '164087788627111', 0, '2021-12-30 13:24:46', '2021-12-30 13:24:46', NULL),
(462, 229, NULL, NULL, '164087789074610', '/uploads/products/229/164087789074610.png', '164087789074610', 0, '2021-12-30 13:24:50', '2021-12-30 13:24:50', NULL),
(463, 229, NULL, NULL, '164087789698344.png', '/uploads/products/229/164087789698344.png', '164087789698344.png', 1, '2021-12-30 13:24:56', '2021-12-30 13:24:56', NULL),
(464, 230, NULL, NULL, '164087882265759.jpeg', '/uploads/products/230/164087882265759.jpeg', '164087882265759.jpeg', 1, '2021-12-30 13:40:12', '2021-12-30 13:40:22', NULL),
(465, 230, NULL, NULL, '164087881753313', '/uploads/products/230/164087881753313.png', '164087881753313', 0, '2021-12-30 13:40:17', '2021-12-30 13:40:17', NULL),
(466, 230, NULL, NULL, '164087881941320', '/uploads/products/230/164087881941320.jpeg', '164087881941320', 0, '2021-12-30 13:40:19', '2021-12-30 13:40:19', NULL),
(467, 231, NULL, NULL, '164087943790458.jpeg', '/uploads/products/231/164087943790458.jpeg', '164087943790458.jpeg', 1, '2021-12-30 13:50:37', '2021-12-30 13:50:37', NULL),
(468, 232, NULL, NULL, '164088030315151.jpeg', '/uploads/products/232/164088030315151.jpeg', '164088030315151.jpeg', 1, '2021-12-30 14:05:03', '2021-12-30 14:05:03', NULL),
(469, 233, NULL, NULL, '164088214113048', '/uploads/products/233/164088214113048.jpg', '164088214113048', 0, '2021-12-30 14:35:41', '2021-12-30 14:35:41', NULL),
(470, 233, NULL, NULL, '164088214525133.jpeg', '/uploads/products/233/164088214525133.jpeg', '164088214525133.jpeg', 1, '2021-12-30 14:35:45', '2021-12-30 14:35:45', NULL),
(471, 234, NULL, NULL, '164088261086691', '/uploads/products/234/164088261086691.png', '164088261086691', 0, '2021-12-30 14:43:30', '2021-12-30 14:43:30', NULL),
(472, 234, NULL, NULL, '164088261222060', '/uploads/products/234/164088261222060.png', '164088261222060', 0, '2021-12-30 14:43:32', '2021-12-30 14:43:32', NULL),
(473, 234, NULL, NULL, '164088261358080.png', '/uploads/products/234/164088261358080.png', '164088261358080.png', 1, '2021-12-30 14:43:33', '2021-12-30 14:43:33', NULL),
(474, 235, NULL, NULL, '164088318281313', '/uploads/products/235/164088318281313.png', '164088318281313', 0, '2021-12-30 14:53:02', '2021-12-30 14:53:02', NULL),
(475, 235, NULL, NULL, '164088318440085', '/uploads/products/235/164088318440085.png', '164088318440085', 0, '2021-12-30 14:53:04', '2021-12-30 14:53:04', NULL),
(476, 235, NULL, NULL, '164088318865599.png', '/uploads/products/235/164088318865599.png', '164088318865599.png', 1, '2021-12-30 14:53:08', '2021-12-30 14:53:08', NULL),
(477, 236, NULL, NULL, '164088446837206', '/uploads/products/236/164088446837206.png', '164088446837206', 0, '2021-12-30 15:14:28', '2021-12-30 15:14:28', NULL),
(478, 236, NULL, NULL, '164088447066544', '/uploads/products/236/164088447066544.png', '164088447066544', 0, '2021-12-30 15:14:30', '2021-12-30 15:14:30', NULL),
(479, 236, NULL, NULL, '164088447358660.png', '/uploads/products/236/164088447358660.png', '164088447358660.png', 1, '2021-12-30 15:14:33', '2021-12-30 15:14:33', NULL),
(480, 237, NULL, NULL, '164088559446897', '/uploads/products/237/164088559446897.jpeg', '164088559446897', 0, '2021-12-30 15:33:14', '2021-12-30 15:33:14', NULL),
(481, 237, NULL, NULL, '164088559987660.jpeg', '/uploads/products/237/164088559987660.jpeg', '164088559987660.jpeg', 1, '2021-12-30 15:33:19', '2021-12-30 15:33:19', NULL),
(482, 238, NULL, NULL, '164088646951360.png', '/uploads/products/238/164088646951360.png', '164088646951360.png', 1, '2021-12-30 15:47:49', '2021-12-30 15:47:49', NULL),
(483, 240, NULL, NULL, '164088733829211', '/uploads/products/240/164088733829211.png', '164088733829211', 0, '2021-12-30 16:02:18', '2021-12-30 16:02:18', NULL),
(484, 240, NULL, NULL, '164088733936445.png', '/uploads/products/240/164088733936445.png', '164088733936445.png', 1, '2021-12-30 16:02:19', '2021-12-30 16:02:19', NULL),
(485, 239, NULL, NULL, '164088836225499', '/uploads/products/239/164088836225499.png', '164088836225499', 0, '2021-12-30 16:19:22', '2021-12-30 16:19:22', NULL),
(486, 239, NULL, NULL, '164088836235270.png', '/uploads/products/239/164088836235270.png', '164088836235270.png', 1, '2021-12-30 16:19:22', '2021-12-30 16:19:22', NULL),
(487, 241, NULL, NULL, '164088850742589', '/uploads/products/241/164088850742589.png', '164088850742589', 0, '2021-12-30 16:21:47', '2021-12-30 16:21:47', NULL),
(488, 241, NULL, NULL, '164088850881263.png', '/uploads/products/241/164088850881263.png', '164088850881263.png', 1, '2021-12-30 16:21:48', '2021-12-30 16:21:48', NULL),
(489, 242, NULL, NULL, '164088911159871', '/uploads/products/242/164088911159871.png', '164088911159871', 0, '2021-12-30 16:31:51', '2021-12-30 16:31:51', NULL),
(490, 242, NULL, NULL, '164088911484165', '/uploads/products/242/164088911484165.png', '164088911484165', 0, '2021-12-30 16:31:54', '2021-12-30 16:31:54', NULL),
(491, 242, NULL, NULL, '164088911976634.png', '/uploads/products/242/164088911976634.png', '164088911976634.png', 1, '2021-12-30 16:31:59', '2021-12-30 16:31:59', NULL),
(492, 243, NULL, NULL, '164088985824227', '/uploads/products/243/164088985824227.png', '164088985824227', 0, '2021-12-30 16:44:18', '2021-12-30 16:44:18', NULL),
(493, 243, NULL, NULL, '164088986126554', '/uploads/products/243/164088986126554.png', '164088986126554', 0, '2021-12-30 16:44:21', '2021-12-30 16:44:21', NULL),
(494, 243, NULL, NULL, '164088986173866.png', '/uploads/products/243/164088986173866.png', '164088986173866.png', 1, '2021-12-30 16:44:21', '2021-12-30 16:44:21', NULL),
(495, 244, NULL, NULL, '164089055859538', '/uploads/products/244/164089055859538.png', '164089055859538', 0, '2021-12-30 16:55:58', '2021-12-30 16:55:58', NULL),
(496, 244, NULL, NULL, '164089056219167', '/uploads/products/244/164089056219167.png', '164089056219167', 0, '2021-12-30 16:56:02', '2021-12-30 16:56:02', NULL),
(497, 244, NULL, NULL, '164089056539320.png', '/uploads/products/244/164089056539320.png', '164089056539320.png', 1, '2021-12-30 16:56:05', '2021-12-30 16:56:05', NULL),
(498, 245, NULL, NULL, '164089064722551', '/uploads/products/245/164089064722551.jpg', '164089064722551', 0, '2021-12-30 16:57:27', '2021-12-30 16:57:27', NULL),
(499, 245, NULL, NULL, '164089064837553.jpg', '/uploads/products/245/164089064837553.jpg', '164089064837553.jpg', 1, '2021-12-30 16:57:28', '2021-12-30 16:57:28', NULL),
(500, 246, NULL, NULL, '164089153575432', '/uploads/products/246/164089153575432.jpeg', '164089153575432', 0, '2021-12-30 17:12:15', '2021-12-30 17:12:15', NULL),
(501, 246, NULL, NULL, '164089153696680', '/uploads/products/246/164089153696680.jpeg', '164089153696680', 0, '2021-12-30 17:12:16', '2021-12-30 17:12:16', NULL),
(502, 246, NULL, NULL, '164089153948043.jpeg', '/uploads/products/246/164089153948043.jpeg', '164089153948043.jpeg', 1, '2021-12-30 17:12:19', '2021-12-30 17:12:19', NULL),
(503, 247, NULL, NULL, '164089220631850', '/uploads/products/247/164089220631850.jpg', '164089220631850', 0, '2021-12-30 17:23:26', '2021-12-30 17:23:26', NULL),
(504, 247, NULL, NULL, '164089220781145.jpg', '/uploads/products/247/164089220781145.jpg', '164089220781145.jpg', 1, '2021-12-30 17:23:27', '2021-12-30 17:23:27', NULL),
(505, 248, NULL, NULL, '164089248099169', '/uploads/products/248/164089248099169.jpeg', '164089248099169', 0, '2021-12-30 17:28:00', '2021-12-30 17:28:00', NULL),
(506, 248, NULL, NULL, '164089248166773.jpeg', '/uploads/products/248/164089248166773.jpeg', '164089248166773.jpeg', 1, '2021-12-30 17:28:01', '2021-12-30 17:28:01', NULL),
(507, 249, NULL, NULL, '164089336793908.jpeg', '/uploads/products/249/164089336793908.jpeg', '164089336793908.jpeg', 1, '2021-12-30 17:42:47', '2021-12-30 17:42:47', NULL),
(508, 249, NULL, NULL, '164089351786415', '/uploads/products/249/164089351786415.png', '164089351786415', 0, '2021-12-30 17:45:17', '2021-12-30 17:45:17', NULL),
(509, 249, NULL, NULL, '164089352015479', '/uploads/products/249/164089352015479.png', '164089352015479', 0, '2021-12-30 17:45:20', '2021-12-30 17:45:20', NULL),
(510, 249, NULL, NULL, '164089352146379', '/uploads/products/249/164089352146379.png', '164089352146379', 0, '2021-12-30 17:45:21', '2021-12-30 17:45:21', NULL),
(511, 250, NULL, NULL, '164089420298463', '/uploads/products/250/164089420298463.png', '164089420298463', 0, '2021-12-30 17:56:42', '2021-12-30 17:56:42', NULL),
(512, 250, NULL, NULL, '164089420428098', '/uploads/products/250/164089420428098.png', '164089420428098', 0, '2021-12-30 17:56:44', '2021-12-30 17:56:44', NULL),
(513, 250, NULL, NULL, '164089422190572.png', '/uploads/products/250/164089422190572.png', '164089422190572.png', 1, '2021-12-30 17:56:48', '2021-12-30 17:57:01', NULL),
(514, 251, NULL, NULL, '164089484826926.jpg', '/uploads/products/251/164089484826926.jpg', '164089484826926.jpg', 1, '2021-12-30 18:04:40', '2021-12-30 18:07:28', NULL),
(515, 251, NULL, NULL, '164089468835754', '/uploads/products/251/164089468835754.jpg', '164089468835754', 0, '2021-12-30 18:04:48', '2021-12-30 18:04:48', NULL),
(516, 252, NULL, NULL, '164089505863859.jpeg', '/uploads/products/252/164089505863859.jpeg', '164089505863859.jpeg', 1, '2021-12-30 18:10:58', '2021-12-30 18:10:58', NULL),
(517, 253, NULL, NULL, '164089753092085', '/uploads/products/253/164089753092085.jpg', '164089753092085', 0, '2021-12-30 18:52:10', '2021-12-30 18:52:10', NULL),
(518, 253, NULL, NULL, '164089753469750.jpg', '/uploads/products/253/164089753469750.jpg', '164089753469750.jpg', 1, '2021-12-30 18:52:14', '2021-12-30 18:52:14', NULL),
(519, 254, NULL, NULL, '164095408033785', '/uploads/products/254/164095408033785.png', '164095408033785', 0, '2021-12-31 10:34:41', '2021-12-31 10:34:41', NULL),
(520, 254, NULL, NULL, '164095408599006', '/uploads/products/254/164095408599006.png', '164095408599006', 0, '2021-12-31 10:34:45', '2021-12-31 10:34:45', NULL),
(521, 254, NULL, NULL, '164095408638145.png', '/uploads/products/254/164095408638145.png', '164095408638145.png', 1, '2021-12-31 10:34:46', '2021-12-31 10:34:46', NULL),
(522, 255, NULL, NULL, '164095476745239', '/uploads/products/255/164095476745239.jpeg', '164095476745239', 0, '2021-12-31 10:46:07', '2021-12-31 10:46:07', NULL),
(523, 255, NULL, NULL, '164095477037518', '/uploads/products/255/164095477037518.jpeg', '164095477037518', 0, '2021-12-31 10:46:10', '2021-12-31 10:46:10', NULL),
(524, 255, NULL, NULL, '164095486631488', '/uploads/products/255/164095486631488.jpeg', '164095486631488', 0, '2021-12-31 10:47:46', '2021-12-31 10:47:46', NULL),
(525, 255, NULL, NULL, '164095486940958.png', '/uploads/products/255/164095486940958.png', '164095486940958.png', 1, '2021-12-31 10:47:49', '2021-12-31 10:47:49', NULL),
(526, 256, NULL, NULL, '164095583478956.jpeg', '/uploads/products/256/164095583478956.jpeg', '164095583478956.jpeg', 1, '2021-12-31 11:03:54', '2021-12-31 11:03:54', NULL),
(527, 257, NULL, NULL, '164095631663397', '/uploads/products/257/164095631663397.jpeg', '164095631663397', 0, '2021-12-31 11:11:56', '2021-12-31 11:11:56', NULL),
(528, 257, NULL, NULL, '164095631798900.jpeg', '/uploads/products/257/164095631798900.jpeg', '164095631798900.jpeg', 1, '2021-12-31 11:11:57', '2021-12-31 11:11:57', NULL),
(529, 258, NULL, NULL, '164095696695100', '/uploads/products/258/164095696695100.jpeg', '164095696695100', 0, '2021-12-31 11:22:46', '2021-12-31 11:22:46', NULL),
(530, 258, NULL, NULL, '164095696988206.jpeg', '/uploads/products/258/164095696988206.jpeg', '164095696988206.jpeg', 1, '2021-12-31 11:22:49', '2021-12-31 11:22:49', NULL),
(531, 259, NULL, NULL, '164095759570137', '/uploads/products/259/164095759570137.png', '164095759570137', 0, '2021-12-31 11:33:15', '2021-12-31 11:33:15', NULL),
(532, 259, NULL, NULL, '164095759848408.png', '/uploads/products/259/164095759848408.png', '164095759848408.png', 1, '2021-12-31 11:33:18', '2021-12-31 11:33:18', NULL),
(533, 260, NULL, NULL, '164095822526576', '/uploads/products/260/164095822526576.png', '164095822526576', 0, '2021-12-31 11:43:45', '2021-12-31 11:43:45', NULL),
(534, 260, NULL, NULL, '164095825620975', '/uploads/products/260/164095825620975.png', '164095825620975', 0, '2021-12-31 11:44:16', '2021-12-31 11:44:16', NULL),
(535, 260, NULL, NULL, '164095825950239.png', '/uploads/products/260/164095825950239.png', '164095825950239.png', 1, '2021-12-31 11:44:19', '2021-12-31 11:44:19', NULL),
(536, 261, NULL, NULL, '164095881594208', '/uploads/products/261/164095881594208.png', '164095881594208', 0, '2021-12-31 11:53:35', '2021-12-31 11:53:35', NULL),
(537, 261, NULL, NULL, '164095881791208.png', '/uploads/products/261/164095881791208.png', '164095881791208.png', 1, '2021-12-31 11:53:37', '2021-12-31 11:53:37', NULL),
(538, 262, NULL, NULL, '164095984168470', '/uploads/products/262/164095984168470.png', '164095984168470', 0, '2021-12-31 12:10:41', '2021-12-31 12:10:41', NULL),
(539, 262, NULL, NULL, '164095984278940.png', '/uploads/products/262/164095984278940.png', '164095984278940.png', 1, '2021-12-31 12:10:42', '2021-12-31 12:10:42', NULL),
(540, 263, NULL, NULL, '164096055996098.png', '/uploads/products/263/164096055996098.png', '164096055996098.png', 1, '2021-12-31 12:22:39', '2021-12-31 12:22:39', NULL),
(541, 264, NULL, NULL, '164096140520357', '/uploads/products/264/164096140520357.png', '164096140520357', 0, '2021-12-31 12:36:45', '2021-12-31 12:36:45', NULL),
(542, 264, NULL, NULL, '164096140667500.png', '/uploads/products/264/164096140667500.png', '164096140667500.png', 1, '2021-12-31 12:36:46', '2021-12-31 12:36:46', NULL),
(543, 265, NULL, NULL, '164096201258831.png', '/uploads/products/265/164096201258831.png', '164096201258831.png', 1, '2021-12-31 12:46:52', '2021-12-31 12:46:52', NULL),
(544, 265, NULL, NULL, '164096201548996', '/uploads/products/265/164096201548996.png', '164096201548996', 0, '2021-12-31 12:46:56', '2021-12-31 12:46:56', NULL),
(545, 265, NULL, NULL, '164096203470993', '/uploads/products/265/164096203470993.png', '164096203470993', 0, '2021-12-31 12:47:14', '2021-12-31 12:47:14', NULL),
(546, 266, NULL, NULL, '164096273578312', '/uploads/products/266/164096273578312.png', '164096273578312', 0, '2021-12-31 12:58:55', '2021-12-31 12:58:55', NULL),
(547, 266, NULL, NULL, '164096273789790', '/uploads/products/266/164096273789790.png', '164096273789790', 0, '2021-12-31 12:58:57', '2021-12-31 12:58:57', NULL),
(548, 266, NULL, NULL, '164096273988561.png', '/uploads/products/266/164096273988561.png', '164096273988561.png', 1, '2021-12-31 12:58:59', '2021-12-31 12:58:59', NULL),
(549, 267, NULL, NULL, '164096355421076', '/uploads/products/267/164096355421076.png', '164096355421076', 0, '2021-12-31 13:12:34', '2021-12-31 13:12:34', NULL),
(550, 267, NULL, NULL, '164096355533674', '/uploads/products/267/164096355533674.png', '164096355533674', 0, '2021-12-31 13:12:35', '2021-12-31 13:12:35', NULL),
(551, 267, NULL, NULL, '164096355796113.png', '/uploads/products/267/164096355796113.png', '164096355796113.png', 1, '2021-12-31 13:12:37', '2021-12-31 13:12:37', NULL),
(552, 268, NULL, NULL, '164096423672767.jpeg', '/uploads/products/268/164096423672767.jpeg', '164096423672767.jpeg', 1, '2021-12-31 13:23:56', '2021-12-31 13:23:56', NULL),
(553, 269, NULL, NULL, '164096478233134', '/uploads/products/269/164096478233134.jpeg', '164096478233134', 0, '2021-12-31 13:33:02', '2021-12-31 13:33:02', NULL),
(554, 269, NULL, NULL, '164096479143477.png', '/uploads/products/269/164096479143477.png', '164096479143477.png', 1, '2021-12-31 13:33:11', '2021-12-31 13:33:11', NULL),
(555, 270, NULL, NULL, '164096556059554', '/uploads/products/270/164096556059554.jpeg', '164096556059554', 0, '2021-12-31 13:46:00', '2021-12-31 13:46:00', NULL),
(556, 270, NULL, NULL, '164096556391700.jpeg', '/uploads/products/270/164096556391700.jpeg', '164096556391700.jpeg', 1, '2021-12-31 13:46:03', '2021-12-31 13:46:03', NULL),
(557, 271, NULL, NULL, '164096599150161.png', '/uploads/products/271/164096599150161.png', '164096599150161.png', 1, '2021-12-31 13:53:11', '2021-12-31 13:53:11', NULL),
(558, 272, NULL, NULL, '164096661659119.jpeg', '/uploads/products/272/164096661659119.jpeg', '164096661659119.jpeg', 1, '2021-12-31 14:03:36', '2021-12-31 14:03:36', NULL),
(559, 273, NULL, NULL, '164096719735144', '/uploads/products/273/164096719735144.png', '164096719735144', 0, '2021-12-31 14:13:17', '2021-12-31 14:13:17', NULL),
(560, 273, NULL, NULL, '164096720161675.png', '/uploads/products/273/164096720161675.png', '164096720161675.png', 1, '2021-12-31 14:13:21', '2021-12-31 14:13:21', NULL),
(561, 274, NULL, NULL, '164096826047477.png', '/uploads/products/274/164096826047477.png', '164096826047477.png', 1, '2021-12-31 14:31:00', '2021-12-31 14:31:00', NULL),
(562, 275, NULL, NULL, '164096888166973.jpeg', '/uploads/products/275/164096888166973.jpeg', '164096888166973.jpeg', 1, '2021-12-31 14:41:21', '2021-12-31 14:41:21', NULL),
(563, 276, NULL, NULL, '164096945149784.png', '/uploads/products/276/164096945149784.png', '164096945149784.png', 1, '2021-12-31 14:50:51', '2021-12-31 14:50:51', NULL),
(564, 277, NULL, NULL, '164096955617516.jpg', '/uploads/products/277/164096955617516.jpg', '164096955617516.jpg', 1, '2021-12-31 14:52:36', '2021-12-31 14:52:36', NULL),
(565, 278, NULL, NULL, '164097028390724.jpeg', '/uploads/products/278/164097028390724.jpeg', '164097028390724.jpeg', 1, '2021-12-31 15:04:43', '2021-12-31 15:04:43', NULL),
(566, 279, NULL, NULL, '164097164676406', '/uploads/products/279/164097164676406.png', '164097164676406', 0, '2021-12-31 15:27:26', '2021-12-31 15:27:26', NULL),
(567, 279, NULL, NULL, '164097164965097.png', '/uploads/products/279/164097164965097.png', '164097164965097.png', 1, '2021-12-31 15:27:29', '2021-12-31 15:27:29', NULL),
(568, 280, NULL, NULL, '164097217991525', '/uploads/products/280/164097217991525.png', '164097217991525', 0, '2021-12-31 15:36:19', '2021-12-31 15:36:19', NULL),
(569, 280, NULL, NULL, '164097218324065.png', '/uploads/products/280/164097218324065.png', '164097218324065.png', 1, '2021-12-31 15:36:23', '2021-12-31 15:36:23', NULL),
(570, 281, NULL, NULL, '164097326459892', '/uploads/products/281/164097326459892.png', '164097326459892', 0, '2021-12-31 15:54:24', '2021-12-31 15:54:24', NULL),
(571, 281, NULL, NULL, '164097326614242', '/uploads/products/281/164097326614242.png', '164097326614242', 0, '2021-12-31 15:54:26', '2021-12-31 15:54:26', NULL),
(572, 281, NULL, NULL, '164097329392606.png', '/uploads/products/281/164097329392606.png', '164097329392606.png', 1, '2021-12-31 15:54:53', '2021-12-31 15:54:53', NULL),
(573, 282, NULL, NULL, '164097415078972.png', '/uploads/products/282/164097415078972.png', '164097415078972.png', 1, '2021-12-31 16:09:10', '2021-12-31 16:09:10', NULL),
(574, 283, NULL, NULL, '164097475673151', '/uploads/products/283/164097475673151.png', '164097475673151', 0, '2021-12-31 16:19:16', '2021-12-31 16:19:16', NULL),
(575, 283, NULL, NULL, '164097475629513.png', '/uploads/products/283/164097475629513.png', '164097475629513.png', 1, '2021-12-31 16:19:16', '2021-12-31 16:19:16', NULL),
(576, 284, NULL, NULL, '164097528076726', '/uploads/products/284/164097528076726.png', '164097528076726', 0, '2021-12-31 16:28:00', '2021-12-31 16:28:00', NULL),
(577, 284, NULL, NULL, '164097528220172', '/uploads/products/284/164097528220172.png', '164097528220172', 0, '2021-12-31 16:28:02', '2021-12-31 16:28:02', NULL),
(578, 284, NULL, NULL, '164097528659346.png', '/uploads/products/284/164097528659346.png', '164097528659346.png', 1, '2021-12-31 16:28:06', '2021-12-31 16:28:06', NULL),
(579, 285, NULL, NULL, '164097645115059', '/uploads/products/285/164097645115059.png', '164097645115059', 0, '2021-12-31 16:47:31', '2021-12-31 16:47:31', NULL),
(580, 285, NULL, NULL, '164097649641488.png', '/uploads/products/285/164097649641488.png', '164097649641488.png', 1, '2021-12-31 16:47:33', '2021-12-31 16:48:16', NULL),
(581, 285, NULL, NULL, '164097649117655', '/uploads/products/285/164097649117655.jpeg', '164097649117655', 0, '2021-12-31 16:48:11', '2021-12-31 16:48:11', NULL),
(582, 286, NULL, NULL, '164097762285008', '/uploads/products/286/164097762285008.png', '164097762285008', 0, '2021-12-31 17:07:02', '2021-12-31 17:07:02', NULL),
(583, 286, NULL, NULL, '164097762375111.png', '/uploads/products/286/164097762375111.png', '164097762375111.png', 1, '2021-12-31 17:07:03', '2021-12-31 17:07:03', NULL),
(584, 287, NULL, NULL, '164097834815816', '/uploads/products/287/164097834815816.jpeg', '164097834815816', 0, '2021-12-31 17:19:08', '2021-12-31 17:19:08', NULL),
(585, 287, NULL, NULL, '164097835016496', '/uploads/products/287/164097835016496.jpeg', '164097835016496', 0, '2021-12-31 17:19:10', '2021-12-31 17:19:10', NULL),
(586, 287, NULL, NULL, '164097835117696', '/uploads/products/287/164097835117696.jpeg', '164097835117696', 0, '2021-12-31 17:19:11', '2021-12-31 17:19:11', NULL),
(587, 287, NULL, NULL, '164097835566194.jpeg', '/uploads/products/287/164097835566194.jpeg', '164097835566194.jpeg', 1, '2021-12-31 17:19:15', '2021-12-31 17:19:15', NULL),
(588, 288, NULL, NULL, '164097924492802', '/uploads/products/288/164097924492802.jpg', '164097924492802', 0, '2021-12-31 17:34:04', '2021-12-31 17:34:04', NULL),
(589, 288, NULL, NULL, '164097924653045.jpg', '/uploads/products/288/164097924653045.jpg', '164097924653045.jpg', 1, '2021-12-31 17:34:06', '2021-12-31 17:34:06', NULL),
(590, 289, NULL, NULL, '164097937533667.png', '/uploads/products/289/164097937533667.png', '164097937533667.png', 1, '2021-12-31 17:36:15', '2021-12-31 17:36:15', NULL),
(591, 290, NULL, NULL, '164098035715937.jpeg', '/uploads/products/290/164098035715937.jpeg', '164098035715937.jpeg', 1, '2021-12-31 17:52:37', '2021-12-31 17:52:37', NULL),
(592, 291, NULL, NULL, '164098151248840.jpg', '/uploads/products/291/164098151248840.jpg', '164098151248840.jpg', 1, '2021-12-31 18:11:52', '2021-12-31 18:11:52', NULL),
(593, 292, NULL, NULL, '164104628439563', '/uploads/products/292/164104628439563.jpg', '164104628439563', 0, '2022-01-01 12:11:24', '2022-01-01 12:11:24', NULL),
(594, 292, NULL, NULL, '164104628557478.jpg', '/uploads/products/292/164104628557478.jpg', '164104628557478.jpg', 1, '2022-01-01 12:11:25', '2022-01-01 12:11:25', NULL),
(595, 293, NULL, NULL, '164104945441469', '/uploads/products/293/164104945441469.png', '164104945441469', 0, '2022-01-01 13:04:14', '2022-01-01 13:04:14', NULL),
(596, 293, NULL, NULL, '164104945630285.jpg', '/uploads/products/293/164104945630285.jpg', '164104945630285.jpg', 1, '2022-01-01 13:04:16', '2022-01-01 13:04:16', NULL),
(597, 294, NULL, NULL, '164105248654653', '/uploads/products/294/164105248654653.jpg', '164105248654653', 0, '2022-01-01 13:54:46', '2022-01-01 13:54:46', NULL),
(598, 294, NULL, NULL, '164105249063799.jpeg', '/uploads/products/294/164105249063799.jpeg', '164105249063799.jpeg', 1, '2022-01-01 13:54:50', '2022-01-01 13:54:50', NULL),
(599, 295, NULL, NULL, '164105861974722', '/uploads/products/295/164105861974722.jpg', '164105861974722', 0, '2022-01-01 15:36:59', '2022-01-01 15:36:59', NULL),
(600, 295, NULL, NULL, '164105862213245.jpg', '/uploads/products/295/164105862213245.jpg', '164105862213245.jpg', 1, '2022-01-01 15:37:02', '2022-01-01 15:37:02', NULL),
(601, 296, NULL, NULL, '164106173358453', '/uploads/products/296/164106173358453.jpg', '164106173358453', 0, '2022-01-01 16:28:53', '2022-01-01 16:28:53', NULL),
(602, 296, NULL, NULL, '164106173451003.jpg', '/uploads/products/296/164106173451003.jpg', '164106173451003.jpg', 1, '2022-01-01 16:28:54', '2022-01-01 16:28:54', NULL),
(603, 297, NULL, NULL, '164106548649480', '/uploads/products/297/164106548649480.jpg', '164106548649480', 0, '2022-01-01 17:31:26', '2022-01-01 17:31:26', NULL),
(604, 297, NULL, NULL, '164106548883231.jpg', '/uploads/products/297/164106548883231.jpg', '164106548883231.jpg', 1, '2022-01-01 17:31:28', '2022-01-01 17:31:28', NULL),
(605, 298, NULL, NULL, '164106790813693', '/uploads/products/298/164106790813693.jpg', '164106790813693', 0, '2022-01-01 18:11:48', '2022-01-01 18:11:48', NULL),
(606, 298, NULL, NULL, '164106791167672.jpg', '/uploads/products/298/164106791167672.jpg', '164106791167672.jpg', 1, '2022-01-01 18:11:51', '2022-01-01 18:11:51', NULL),
(607, 299, NULL, NULL, '164107007044868', '/uploads/products/299/164107007044868.jpg', '164107007044868', 0, '2022-01-01 18:47:50', '2022-01-01 18:47:50', NULL),
(608, 299, NULL, NULL, '164107007298022.jpg', '/uploads/products/299/164107007298022.jpg', '164107007298022.jpg', 1, '2022-01-01 18:47:52', '2022-01-01 18:47:52', NULL),
(609, 300, NULL, NULL, '164107150778183', '/uploads/products/300/164107150778183.jpg', '164107150778183', 0, '2022-01-01 19:11:47', '2022-01-01 19:11:47', NULL),
(610, 300, NULL, NULL, '164107151081413.jpg', '/uploads/products/300/164107151081413.jpg', '164107151081413.jpg', 1, '2022-01-01 19:11:50', '2022-01-01 19:11:50', NULL),
(611, 301, NULL, NULL, '164107367319342', '/uploads/products/301/164107367319342.jpg', '164107367319342', 0, '2022-01-01 19:47:53', '2022-01-01 19:47:53', NULL),
(612, 301, NULL, NULL, '164107367518968.jpg', '/uploads/products/301/164107367518968.jpg', '164107367518968.jpg', 1, '2022-01-01 19:47:55', '2022-01-01 19:47:55', NULL),
(613, 302, NULL, NULL, '164107520915384', '/uploads/products/302/164107520915384.jpg', '164107520915384', 0, '2022-01-01 20:13:29', '2022-01-01 20:13:29', NULL),
(614, 302, NULL, NULL, '164107521054598.jpg', '/uploads/products/302/164107521054598.jpg', '164107521054598.jpg', 1, '2022-01-01 20:13:30', '2022-01-01 20:13:30', NULL),
(615, 303, NULL, NULL, '164107756799183', '/uploads/products/303/164107756799183.jpg', '164107756799183', 0, '2022-01-01 20:52:47', '2022-01-01 20:52:47', NULL),
(616, 303, NULL, NULL, '164107756978318.jpg', '/uploads/products/303/164107756978318.jpg', '164107756978318.jpg', 1, '2022-01-01 20:52:49', '2022-01-01 20:52:49', NULL),
(617, 304, NULL, NULL, '164112564017019', '/uploads/products/304/164112564017019.png', '164112564017019', 0, '2022-01-02 10:14:00', '2022-01-02 10:14:00', NULL),
(618, 304, NULL, NULL, '164112564540360.png', '/uploads/products/304/164112564540360.png', '164112564540360.png', 1, '2022-01-02 10:14:05', '2022-01-02 10:14:05', NULL),
(619, 305, NULL, NULL, '164112626664320.jpeg', '/uploads/products/305/164112626664320.jpeg', '164112626664320.jpeg', 1, '2022-01-02 10:24:26', '2022-01-02 10:24:26', NULL),
(620, 306, NULL, NULL, '164112685436278', '/uploads/products/306/164112685436278.png', '164112685436278', 0, '2022-01-02 10:34:14', '2022-01-02 10:34:14', NULL),
(621, 306, NULL, NULL, '164112685537069.png', '/uploads/products/306/164112685537069.png', '164112685537069.png', 1, '2022-01-02 10:34:15', '2022-01-02 10:34:15', NULL),
(622, 307, NULL, NULL, '164114037357110', '/uploads/products/307/164114037357110.png', '164114037357110', 0, '2022-01-02 14:19:33', '2022-01-02 14:19:33', NULL),
(623, 307, NULL, NULL, '164114038296567.jpeg', '/uploads/products/307/164114038296567.jpeg', '164114038296567.jpeg', 1, '2022-01-02 14:19:42', '2022-01-02 14:19:42', NULL),
(624, 308, NULL, NULL, '164114069460426.jpeg', '/uploads/products/308/164114069460426.jpeg', '164114069460426.jpeg', 1, '2022-01-02 14:24:54', '2022-01-02 14:24:54', NULL),
(625, 309, NULL, NULL, '164114215546284', '/uploads/products/309/164114215546284.png', '164114215546284', 0, '2022-01-02 14:49:15', '2022-01-02 14:49:15', NULL),
(626, 309, NULL, NULL, '164114215559417.png', '/uploads/products/309/164114215559417.png', '164114215559417.png', 1, '2022-01-02 14:49:15', '2022-01-02 14:49:15', NULL),
(627, 310, NULL, NULL, '164114278437720', '/uploads/products/310/164114278437720.png', '164114278437720', 0, '2022-01-02 14:59:44', '2022-01-02 14:59:44', NULL),
(628, 310, NULL, NULL, '164114278661822', '/uploads/products/310/164114278661822.png', '164114278661822', 0, '2022-01-02 14:59:46', '2022-01-02 14:59:46', NULL),
(629, 310, NULL, NULL, '164114279024505.png', '/uploads/products/310/164114279024505.png', '164114279024505.png', 1, '2022-01-02 14:59:50', '2022-01-02 14:59:50', NULL),
(630, 312, NULL, NULL, '164114378023706', '/uploads/products/312/164114378023706.png', '164114378023706', 0, '2022-01-02 15:16:20', '2022-01-02 15:16:20', NULL),
(631, 312, NULL, NULL, '164114378441589.png', '/uploads/products/312/164114378441589.png', '164114378441589.png', 1, '2022-01-02 15:16:24', '2022-01-02 15:16:24', NULL),
(632, 311, NULL, NULL, '164114403597633', '/uploads/products/311/164114403597633.jpeg', '164114403597633', 0, '2022-01-02 15:20:35', '2022-01-02 15:20:35', NULL),
(633, 311, NULL, NULL, '164114405170787.png', '/uploads/products/311/164114405170787.png', '164114405170787.png', 1, '2022-01-02 15:20:51', '2022-01-02 15:20:51', NULL),
(634, 313, NULL, NULL, '164114520951896.jpeg', '/uploads/products/313/164114520951896.jpeg', '164114520951896.jpeg', 1, '2022-01-02 15:40:09', '2022-01-02 15:40:09', NULL),
(635, 314, NULL, NULL, '164114698791487', '/uploads/products/314/164114698791487.png', '164114698791487', 0, '2022-01-02 16:09:47', '2022-01-02 16:09:47', NULL),
(636, 314, NULL, NULL, '164114698962113', '/uploads/products/314/164114698962113.png', '164114698962113', 0, '2022-01-02 16:09:49', '2022-01-02 16:09:49', NULL),
(637, 314, NULL, NULL, '164114699284339.png', '/uploads/products/314/164114699284339.png', '164114699284339.png', 1, '2022-01-02 16:09:52', '2022-01-02 16:09:52', NULL),
(638, 315, NULL, NULL, '164114727875225', '/uploads/products/315/164114727875225.png', '164114727875225', 0, '2022-01-02 16:14:38', '2022-01-02 16:14:38', NULL),
(639, 315, NULL, NULL, '164114728078068', '/uploads/products/315/164114728078068.png', '164114728078068', 0, '2022-01-02 16:14:40', '2022-01-02 16:14:40', NULL),
(640, 315, NULL, NULL, '164114728245923.png', '/uploads/products/315/164114728245923.png', '164114728245923.png', 1, '2022-01-02 16:14:42', '2022-01-02 16:14:42', NULL),
(641, 316, NULL, NULL, '164114833342470', '/uploads/products/316/164114833342470.png', '164114833342470', 0, '2022-01-02 16:32:14', '2022-01-02 16:32:14', NULL),
(642, 316, NULL, NULL, '164114834169599', '/uploads/products/316/164114834169599.jpeg', '164114834169599', 0, '2022-01-02 16:32:21', '2022-01-02 16:32:21', NULL),
(643, 316, NULL, NULL, '164114834435170.jpeg', '/uploads/products/316/164114834435170.jpeg', '164114834435170.jpeg', 1, '2022-01-02 16:32:24', '2022-01-02 16:32:24', NULL),
(644, 317, NULL, NULL, '164114927037164', '/uploads/products/317/164114927037164.png', '164114927037164', 0, '2022-01-02 16:47:50', '2022-01-02 16:47:50', NULL),
(645, 317, NULL, NULL, '164114927221996', '/uploads/products/317/164114927221996.png', '164114927221996', 0, '2022-01-02 16:47:52', '2022-01-02 16:47:52', NULL),
(646, 317, NULL, NULL, '164114927315294.png', '/uploads/products/317/164114927315294.png', '164114927315294.png', 1, '2022-01-02 16:47:53', '2022-01-02 16:47:53', NULL),
(647, 445, NULL, NULL, '164551964943356.jfif', '/uploads/products/445/164551964943356.jfif', '164551964943356.jfif', 1, '2022-02-22 06:47:29', '2022-02-22 06:47:29', NULL),
(648, 447, NULL, NULL, '164552222858348.jfif', '/uploads/products/447/164552222858348.jfif', '164552222858348.jfif', 1, '2022-02-22 07:30:28', '2022-02-22 07:30:28', NULL),
(649, 448, NULL, NULL, '164561168572531.png', '/uploads/products/448/164561168572531.png', '164561168572531.png', 1, '2022-02-23 08:21:25', '2022-02-23 08:21:25', NULL),
(650, 450, NULL, NULL, '164562235224852.jpg', '/uploads/products/450/164562235224852.jpg', '164562235224852.jpg', 1, '2022-02-23 11:19:12', '2022-02-23 11:19:12', NULL),
(651, 1, NULL, NULL, '164603546846965.jpg', '/uploads/products/1/164603546846965.jpg', '164603546846965.jpg', 1, '2022-02-27 12:57:51', '2022-02-28 06:04:28', NULL),
(652, 4, NULL, NULL, '164604883653096.png', '/uploads/products/3/164604883653096.png', '164604883653096.png', 1, '2022-02-27 12:59:24', '2022-02-28 09:47:16', NULL),
(653, 4, NULL, NULL, '164604964497490.jpg', '/uploads/products/4/164604964497490.jpg', '164604964497490.jpg', 1, '2022-02-28 10:00:44', '2022-02-28 10:00:44', NULL),
(654, 7, NULL, NULL, '164862802850294.png', '/uploads/products/7/164862802850294.png', '164862802850294.png', 1, '2022-03-06 10:47:59', '2022-03-30 06:13:48', NULL),
(655, 9, NULL, NULL, '164907530333020.jpg', '/uploads/products/9/164907530333020.jpg', '164907530333020.jpg', 1, '2022-03-29 12:38:17', '2022-04-04 10:28:23', NULL),
(656, 5, NULL, NULL, '164862770114190.jpg', '/uploads/products/5/164862770114190.jpg', '164862770114190.jpg', 1, '2022-03-30 06:08:21', '2022-03-30 06:08:21', NULL),
(657, 9, NULL, NULL, '164907480391046', '/uploads/products/9/164907480391046.png', '164907480391046', 0, '2022-04-04 10:20:03', '2022-04-04 10:20:03', NULL),
(658, 9, NULL, NULL, '164907480377293', '/uploads/products/9/164907480377293.png', '164907480377293', 0, '2022-04-04 10:20:03', '2022-04-04 10:20:03', NULL),
(659, 9, NULL, NULL, '164907480467158', '/uploads/products/9/164907480467158.png', '164907480467158', 0, '2022-04-04 10:20:04', '2022-04-04 10:20:04', NULL),
(660, 9, NULL, NULL, '164907480562604', '/uploads/products/9/164907480562604.png', '164907480562604', 0, '2022-04-04 10:20:05', '2022-04-04 10:20:05', NULL),
(661, 7, NULL, NULL, '164907481785784', '/uploads/products/7/164907481785784.JPG', '164907481785784', 0, '2022-04-04 10:20:17', '2022-04-04 10:20:17', NULL),
(662, 7, NULL, NULL, '164907482123566', '/uploads/products/7/164907482123566.JPG', '164907482123566', 0, '2022-04-04 10:20:21', '2022-04-04 10:20:21', NULL),
(663, 7, NULL, NULL, '164907482422071', '/uploads/products/7/164907482422071.JPG', '164907482422071', 0, '2022-04-04 10:20:24', '2022-04-04 10:20:24', NULL),
(664, 7, NULL, NULL, '164907482758949', '/uploads/products/7/164907482758949.JPG', '164907482758949', 0, '2022-04-04 10:20:27', '2022-04-04 10:20:27', NULL),
(665, 7, NULL, NULL, '164907482891964', '/uploads/products/7/164907482891964.png', '164907482891964', 0, '2022-04-04 10:20:28', '2022-04-04 10:20:28', NULL),
(666, 7, NULL, NULL, '164907483452153', '/uploads/products/7/164907483452153.jpg', '164907483452153', 0, '2022-04-04 10:20:34', '2022-04-04 10:20:34', NULL),
(667, 7, NULL, NULL, '164907483414538', '/uploads/products/7/164907483414538.png', '164907483414538', 0, '2022-04-04 10:20:34', '2022-04-04 10:20:34', NULL),
(668, 7, NULL, NULL, '164907483520856', '/uploads/products/7/164907483520856.png', '164907483520856', 0, '2022-04-04 10:20:35', '2022-04-04 10:20:35', NULL),
(669, 7, NULL, NULL, '164907483516628', '/uploads/products/7/164907483516628.png', '164907483516628', 0, '2022-04-04 10:20:35', '2022-04-04 10:20:35', NULL),
(670, 7, NULL, NULL, '164907483699904', '/uploads/products/7/164907483699904.png', '164907483699904', 0, '2022-04-04 10:20:36', '2022-04-04 10:20:36', NULL),
(671, 5, NULL, NULL, '164907487472513', '/uploads/products/5/164907487472513.png', '164907487472513', 0, '2022-04-04 10:21:14', '2022-04-04 10:21:14', NULL),
(672, 5, NULL, NULL, '164907487412698', '/uploads/products/5/164907487412698.png', '164907487412698', 0, '2022-04-04 10:21:14', '2022-04-04 10:21:14', NULL),
(673, 5, NULL, NULL, '164907487591900', '/uploads/products/5/164907487591900.png', '164907487591900', 0, '2022-04-04 10:21:15', '2022-04-04 10:21:15', NULL),
(674, 5, NULL, NULL, '164907487684502', '/uploads/products/5/164907487684502.png', '164907487684502', 0, '2022-04-04 10:21:16', '2022-04-04 10:21:16', NULL),
(675, 5, NULL, NULL, '164907487770707', '/uploads/products/5/164907487770707.png', '164907487770707', 0, '2022-04-04 10:21:17', '2022-04-04 10:21:17', NULL),
(676, 5, NULL, NULL, '164907487728227', '/uploads/products/5/164907487728227.png', '164907487728227', 0, '2022-04-04 10:21:17', '2022-04-04 10:21:17', NULL),
(677, 10, NULL, NULL, '164907503854072', '/uploads/products/10/164907503854072.jpg', '164907503854072', 0, '2022-04-04 10:23:58', '2022-04-04 10:23:58', NULL),
(678, 10, NULL, NULL, '164907503924151', '/uploads/products/10/164907503924151.png', '164907503924151', 0, '2022-04-04 10:23:59', '2022-04-04 10:23:59', NULL),
(679, 10, NULL, NULL, '164907504025302', '/uploads/products/10/164907504025302.png', '164907504025302', 0, '2022-04-04 10:24:00', '2022-04-04 10:24:00', NULL),
(680, 10, NULL, NULL, '164907504070882', '/uploads/products/10/164907504070882.png', '164907504070882', 0, '2022-04-04 10:24:00', '2022-04-04 10:24:00', NULL),
(681, 10, NULL, NULL, '164907504150001', '/uploads/products/10/164907504150001.png', '164907504150001', 0, '2022-04-04 10:24:01', '2022-04-04 10:24:01', NULL),
(682, 10, NULL, NULL, '164907504170885', '/uploads/products/10/164907504170885.png', '164907504170885', 0, '2022-04-04 10:24:01', '2022-04-04 10:24:01', NULL),
(683, 10, NULL, NULL, '164907504242712', '/uploads/products/10/164907504242712.png', '164907504242712', 0, '2022-04-04 10:24:02', '2022-04-04 10:24:02', NULL),
(684, 10, NULL, NULL, '164907504281331', '/uploads/products/10/164907504281331.jpg', '164907504281331', 0, '2022-04-04 10:24:02', '2022-04-04 10:24:02', NULL),
(685, 10, NULL, NULL, '164907504395101', '/uploads/products/10/164907504395101.jpg', '164907504395101', 0, '2022-04-04 10:24:03', '2022-04-04 10:24:03', NULL),
(686, 10, NULL, NULL, '164907504419824', '/uploads/products/10/164907504419824.png', '164907504419824', 0, '2022-04-04 10:24:04', '2022-04-04 10:24:04', NULL),
(687, 10, NULL, NULL, '164907519238335.jpg', '/uploads/products/10/164907519238335.jpg', '164907519238335.jpg', 1, '2022-04-04 10:26:14', '2022-04-04 10:26:32', NULL),
(688, 9, NULL, NULL, '164907527977663', '/uploads/products/9/164907527977663.JPG', '164907527977663', 0, '2022-04-04 10:27:59', '2022-04-04 10:27:59', NULL),
(689, 9, NULL, NULL, '164907528223232', '/uploads/products/9/164907528223232.png', '164907528223232', 0, '2022-04-04 10:28:02', '2022-04-04 10:28:02', NULL),
(690, 9, NULL, NULL, '164907528348653', '/uploads/products/9/164907528348653.png', '164907528348653', 0, '2022-04-04 10:28:03', '2022-04-04 10:28:03', NULL),
(691, 9, NULL, NULL, '164907528361386', '/uploads/products/9/164907528361386.png', '164907528361386', 0, '2022-04-04 10:28:03', '2022-04-04 10:28:03', NULL),
(692, 9, NULL, NULL, '164907528465250', '/uploads/products/9/164907528465250.png', '164907528465250', 0, '2022-04-04 10:28:04', '2022-04-04 10:28:04', NULL),
(693, 9, NULL, NULL, '164907528554835', '/uploads/products/9/164907528554835.png', '164907528554835', 0, '2022-04-04 10:28:05', '2022-04-04 10:28:05', NULL),
(694, 9, NULL, NULL, '164907529432939', '/uploads/products/9/164907529432939.png', '164907529432939', 0, '2022-04-04 10:28:14', '2022-04-04 10:28:14', NULL),
(695, 9, NULL, NULL, '164907529564716', '/uploads/products/9/164907529564716.png', '164907529564716', 0, '2022-04-04 10:28:15', '2022-04-04 10:28:15', NULL),
(696, 9, NULL, NULL, '164907529594592', '/uploads/products/9/164907529594592.png', '164907529594592', 0, '2022-04-04 10:28:15', '2022-04-04 10:28:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_code` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`id`, `created_at`, `updated_at`, `type_code`) VALUES
(49, '2020-03-02 16:58:48', '2020-03-02 16:58:48', 1),
(50, '2020-03-02 16:58:48', '2020-03-02 16:58:48', 2),
(51, '2020-03-02 16:58:49', '2020-03-02 16:58:49', 3),
(52, '2020-03-02 16:58:49', '2020-03-02 16:58:49', 4),
(53, '2020-03-02 16:58:49', '2020-03-02 16:58:49', 5),
(54, '2020-03-02 16:58:49', '2020-03-02 16:58:49', 6),
(55, '2020-03-02 16:58:49', '2020-03-02 16:58:49', 7);

-- --------------------------------------------------------

--
-- Table structure for table `product_types_code`
--

CREATE TABLE `product_types_code` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` enum('product','service','food','digital_product','cards','donation','multi_products') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_types_code`
--

INSERT INTO `product_types_code` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'product', NULL, NULL),
(2, 'service', NULL, NULL),
(3, 'food', NULL, NULL),
(4, 'digital_product', NULL, NULL),
(5, 'cards', NULL, NULL),
(6, 'donation', NULL, NULL),
(7, 'multi_products', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_types_code_data`
--

CREATE TABLE `product_types_code_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_types_cod_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_types_code_data`
--

INSERT INTO `product_types_code_data` (`id`, `product_types_cod_id`, `lang_id`, `source_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, 'منتج جاهز', 'المنتجات الملموسة والقابلة للشحن', NULL, NULL),
(2, 2, 2, NULL, 'خدمة حسب الطلب', 'التصميم، الطباعة، الحجوزات', NULL, NULL),
(3, 3, 2, NULL, 'أكل', 'المأكولات والمشروبات التي تتطلب شحن خاص', NULL, NULL),
(4, 4, 2, NULL, 'منج رقمي', 'الكتب الالكترونية، الدورات، ملفات للتحميل', NULL, NULL),
(5, 5, 2, NULL, 'بطاقة رقمية', 'بطاقات شحن، حسابات للبيع', NULL, NULL),
(6, 6, 2, NULL, 'تبرع', 'زكاة، صدقة، دعم', NULL, NULL),
(7, 7, 2, NULL, 'مجموعة منتجات', 'اكثر من منتج في منتج واحد', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_types_data`
--

CREATE TABLE `product_types_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_types_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_types_data`
--

INSERT INTO `product_types_data` (`id`, `product_types_id`, `lang_id`, `source_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(30, 49, 2, NULL, 'منتج جاهز', 'المنتجات الملموسة والقابلة للشحن', '2020-03-02 16:58:48', '2020-03-02 16:58:48'),
(31, 50, 2, NULL, 'خدمة حسب الطلب', 'التصميم، الطباعة، الحجوزات', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(32, 51, 2, NULL, 'أكل', 'المأكولات والمشروبات التي تتطلب شحن خاص', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(33, 52, 2, NULL, 'منج رقمي', 'الكتب الالكترونية، الدورات، ملفات للتحميل', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(34, 53, 2, NULL, 'بطاقة رقمية', 'بطاقات شحن، حسابات للبيع', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(35, 54, 2, NULL, 'تبرع', 'زكاة، صدقة، دعم', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(36, 55, 2, NULL, 'مجموعة منتجات', 'اكثر من منتج في منتج واحد', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(205, 49, 1, 30, 'Ready product', 'Tangible and rechargeable products', '2020-03-02 16:58:48', '2020-03-02 16:58:48'),
(206, 50, 1, 31, 'Customized service', 'Design, printing, reservations', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(207, 51, 1, 32, 'Food', 'Food and beverages that require special shipping', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(208, 52, 1, 33, 'Digital product', 'E-books, courses, downloadable files\r\n', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(209, 53, 1, 34, 'Digital card\r\n', 'Recharge cards, accounts for sale', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(210, 54, 1, 35, 'Donation', 'Zakat, charity, support', '2020-03-02 16:58:49', '2020-03-02 16:58:49'),
(211, 55, 1, 36, 'Product group', 'More than one product in one product', '2020-03-02 16:58:49', '2020-03-02 16:58:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_videos`
--

CREATE TABLE `product_videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_visits`
--

CREATE TABLE `product_visits` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_visits`
--

INSERT INTO `product_visits` (`id`, `ip`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(8885, '145.82.204.111', NULL, 194, '2021-12-24 12:41:50', '2021-12-24 12:41:50'),
(8886, '145.82.204.111', NULL, 194, '2021-12-24 13:49:22', '2021-12-24 13:49:22'),
(8887, '145.82.204.111', NULL, 194, '2021-12-24 13:53:25', '2021-12-24 13:53:25'),
(8888, '145.82.204.111', NULL, 194, '2021-12-24 13:53:48', '2021-12-24 13:53:48'),
(8889, '145.82.204.111', NULL, 194, '2021-12-24 14:03:48', '2021-12-24 14:03:48'),
(8890, '145.82.204.111', NULL, 194, '2021-12-24 14:04:04', '2021-12-24 14:04:04'),
(8891, '145.82.204.111', NULL, 194, '2021-12-24 14:04:24', '2021-12-24 14:04:24'),
(8892, '145.82.204.111', NULL, 194, '2021-12-24 14:04:55', '2021-12-24 14:04:55'),
(8893, '145.82.204.111', NULL, 194, '2021-12-24 14:06:03', '2021-12-24 14:06:03'),
(8894, '145.82.204.111', NULL, 194, '2021-12-24 14:06:10', '2021-12-24 14:06:10'),
(8895, '145.82.204.111', NULL, 194, '2021-12-24 14:06:53', '2021-12-24 14:06:53'),
(8896, '145.82.204.111', NULL, 194, '2021-12-24 14:06:58', '2021-12-24 14:06:58'),
(8897, '145.82.204.111', NULL, 194, '2021-12-24 14:09:23', '2021-12-24 14:09:23'),
(8898, '145.82.204.111', NULL, 194, '2021-12-24 14:17:15', '2021-12-24 14:17:15'),
(8899, '145.82.204.111', NULL, 194, '2021-12-24 14:19:00', '2021-12-24 14:19:00'),
(8900, '145.82.204.111', NULL, 194, '2021-12-24 14:19:12', '2021-12-24 14:19:12'),
(8901, '145.82.204.111', NULL, 194, '2021-12-24 14:19:22', '2021-12-24 14:19:22'),
(8902, '145.82.204.111', NULL, 194, '2021-12-24 14:20:02', '2021-12-24 14:20:02'),
(8903, '145.82.204.111', NULL, 194, '2021-12-24 14:20:07', '2021-12-24 14:20:07'),
(8904, '145.82.204.111', NULL, 194, '2021-12-24 14:24:06', '2021-12-24 14:24:06'),
(8905, '145.82.204.111', NULL, 194, '2021-12-24 14:24:52', '2021-12-24 14:24:52'),
(8906, '145.82.204.111', NULL, 194, '2021-12-24 14:25:34', '2021-12-24 14:25:34'),
(8907, '145.82.204.111', NULL, 194, '2021-12-24 14:25:35', '2021-12-24 14:25:35'),
(8908, '145.82.204.111', NULL, 194, '2021-12-24 14:53:33', '2021-12-24 14:53:33'),
(8909, '145.82.204.111', NULL, 194, '2021-12-24 14:53:44', '2021-12-24 14:53:44'),
(8910, '145.82.204.111', NULL, 194, '2021-12-24 14:54:25', '2021-12-24 14:54:25'),
(8911, '145.82.204.111', NULL, 194, '2021-12-24 14:57:45', '2021-12-24 14:57:45'),
(8912, '145.82.204.111', NULL, 194, '2021-12-24 14:58:49', '2021-12-24 14:58:49'),
(8913, '145.82.204.111', NULL, 194, '2021-12-24 16:46:25', '2021-12-24 16:46:25'),
(8914, '145.82.204.111', NULL, 194, '2021-12-24 16:54:48', '2021-12-24 16:54:48'),
(8915, '145.82.204.111', NULL, 194, '2021-12-24 16:55:04', '2021-12-24 16:55:04'),
(8916, '145.82.204.111', NULL, 194, '2021-12-24 16:55:30', '2021-12-24 16:55:30'),
(8917, '145.82.204.111', NULL, 194, '2021-12-24 16:55:44', '2021-12-24 16:55:44'),
(8918, '145.82.204.111', NULL, 194, '2021-12-24 16:58:28', '2021-12-24 16:58:28'),
(8919, '145.82.204.111', NULL, 194, '2021-12-24 16:59:09', '2021-12-24 16:59:09'),
(8920, '145.82.204.111', NULL, 194, '2021-12-24 16:59:12', '2021-12-24 16:59:12'),
(8921, '145.82.204.111', NULL, 194, '2021-12-24 17:11:01', '2021-12-24 17:11:01'),
(8922, '145.82.204.111', NULL, 194, '2021-12-24 17:14:54', '2021-12-24 17:14:54'),
(8923, '145.82.204.111', NULL, 194, '2021-12-24 17:16:05', '2021-12-24 17:16:05'),
(8924, '145.82.204.111', NULL, 194, '2021-12-24 17:16:20', '2021-12-24 17:16:20'),
(8925, '145.82.204.111', NULL, 194, '2021-12-24 17:16:43', '2021-12-24 17:16:43'),
(8926, '145.82.204.111', NULL, 194, '2021-12-24 17:17:15', '2021-12-24 17:17:15'),
(8927, '145.82.204.111', NULL, 194, '2021-12-24 17:17:56', '2021-12-24 17:17:56'),
(8928, '145.82.204.111', NULL, 194, '2021-12-24 17:24:53', '2021-12-24 17:24:53'),
(8929, '145.82.204.111', NULL, 194, '2021-12-24 17:25:01', '2021-12-24 17:25:01'),
(8930, '145.82.204.111', NULL, 194, '2021-12-24 17:25:15', '2021-12-24 17:25:15'),
(8931, '145.82.204.111', NULL, 194, '2021-12-24 17:51:42', '2021-12-24 17:51:42'),
(8932, '145.82.204.111', NULL, 195, '2021-12-24 17:51:59', '2021-12-24 17:51:59'),
(8933, '145.82.204.111', NULL, 195, '2021-12-24 17:54:10', '2021-12-24 17:54:10'),
(8934, '145.82.204.111', NULL, 195, '2021-12-24 17:56:12', '2021-12-24 17:56:12'),
(8935, '145.82.204.111', NULL, 195, '2021-12-24 17:59:14', '2021-12-24 17:59:14'),
(8936, '145.82.204.111', NULL, 195, '2021-12-24 17:59:41', '2021-12-24 17:59:41'),
(8937, '157.90.209.83', NULL, 194, '2021-12-25 09:04:54', '2021-12-25 09:04:54'),
(8938, '157.90.209.83', NULL, 195, '2021-12-25 09:04:59', '2021-12-25 09:04:59'),
(8939, '145.82.204.111', NULL, 195, '2021-12-25 11:36:08', '2021-12-25 11:36:08'),
(8940, '145.82.204.111', NULL, 195, '2021-12-25 11:38:03', '2021-12-25 11:38:03'),
(8941, '145.82.204.111', NULL, 195, '2021-12-25 11:38:18', '2021-12-25 11:38:18'),
(8942, '145.82.204.111', NULL, 195, '2021-12-25 11:38:30', '2021-12-25 11:38:30'),
(8943, '145.82.204.111', NULL, 195, '2021-12-25 11:38:31', '2021-12-25 11:38:31'),
(8944, '145.82.204.111', NULL, 195, '2021-12-25 11:38:48', '2021-12-25 11:38:48'),
(8945, '145.82.204.111', NULL, 195, '2021-12-25 11:38:58', '2021-12-25 11:38:58'),
(8946, '145.82.204.111', NULL, 195, '2021-12-25 12:56:40', '2021-12-25 12:56:40'),
(8947, '145.82.204.111', NULL, 195, '2021-12-25 12:56:44', '2021-12-25 12:56:44'),
(8948, '145.82.204.111', NULL, 195, '2021-12-25 12:56:48', '2021-12-25 12:56:48'),
(8949, '145.82.204.111', NULL, 195, '2021-12-25 12:57:12', '2021-12-25 12:57:12'),
(8950, '145.82.204.111', NULL, 195, '2021-12-25 12:57:32', '2021-12-25 12:57:32'),
(8951, '145.82.204.111', NULL, 194, '2021-12-25 12:58:00', '2021-12-25 12:58:00'),
(8952, '145.82.204.111', NULL, 194, '2021-12-25 12:58:15', '2021-12-25 12:58:15'),
(8953, '145.82.204.111', NULL, 194, '2021-12-25 12:58:19', '2021-12-25 12:58:19'),
(8954, '145.82.204.111', NULL, 195, '2021-12-25 12:58:54', '2021-12-25 12:58:54'),
(8955, '145.82.204.111', NULL, 195, '2021-12-25 12:59:08', '2021-12-25 12:59:08'),
(8956, '145.82.204.111', NULL, 195, '2021-12-25 12:59:22', '2021-12-25 12:59:22'),
(8957, '145.82.204.111', NULL, 195, '2021-12-25 13:02:01', '2021-12-25 13:02:01'),
(8958, '145.82.204.111', NULL, 195, '2021-12-25 13:02:13', '2021-12-25 13:02:13'),
(8959, '145.82.204.111', NULL, 195, '2021-12-25 13:02:30', '2021-12-25 13:02:30'),
(8960, '197.120.182.245', NULL, 194, '2021-12-25 13:09:47', '2021-12-25 13:09:47'),
(8961, '154.184.238.166', NULL, 194, '2021-12-25 13:13:15', '2021-12-25 13:13:15'),
(8962, '154.184.238.166', NULL, 194, '2021-12-25 13:13:16', '2021-12-25 13:13:16'),
(8963, '154.184.238.166', NULL, 194, '2021-12-25 13:19:15', '2021-12-25 13:19:15'),
(8964, '154.184.238.166', NULL, 194, '2021-12-25 13:19:57', '2021-12-25 13:19:57'),
(8965, '154.184.238.166', NULL, 194, '2021-12-25 13:20:07', '2021-12-25 13:20:07'),
(8966, '145.82.204.111', NULL, 199, '2021-12-25 13:51:11', '2021-12-25 13:51:11'),
(8967, '145.82.204.111', NULL, 199, '2021-12-25 14:00:04', '2021-12-25 14:00:04'),
(8968, '145.82.204.111', NULL, 199, '2021-12-25 14:02:25', '2021-12-25 14:02:25'),
(8969, '145.82.204.111', NULL, 199, '2021-12-25 14:03:15', '2021-12-25 14:03:15'),
(8970, '145.82.204.111', NULL, 199, '2021-12-25 14:04:49', '2021-12-25 14:04:49'),
(8971, '145.82.204.111', NULL, 199, '2021-12-25 14:08:07', '2021-12-25 14:08:07'),
(8972, '145.82.204.111', NULL, 199, '2021-12-25 15:02:56', '2021-12-25 15:02:56'),
(8973, '154.184.238.166', NULL, 194, '2021-12-25 15:03:50', '2021-12-25 15:03:50'),
(8974, '154.184.238.166', NULL, 199, '2021-12-25 15:04:23', '2021-12-25 15:04:23'),
(8975, '154.184.238.166', NULL, 194, '2021-12-25 15:07:50', '2021-12-25 15:07:50'),
(8976, '154.184.238.166', NULL, 194, '2021-12-25 15:08:54', '2021-12-25 15:08:54'),
(8977, '154.184.238.166', NULL, 194, '2021-12-25 15:19:58', '2021-12-25 15:19:58'),
(8978, '154.184.238.166', NULL, 194, '2021-12-25 15:21:58', '2021-12-25 15:21:58'),
(8979, '154.184.238.166', NULL, 194, '2021-12-25 15:22:11', '2021-12-25 15:22:11'),
(8980, '154.184.238.166', NULL, 194, '2021-12-25 15:22:28', '2021-12-25 15:22:28'),
(8981, '154.184.238.166', NULL, 194, '2021-12-25 15:25:48', '2021-12-25 15:25:48'),
(8982, '154.184.238.166', NULL, 194, '2021-12-25 15:25:53', '2021-12-25 15:25:53'),
(8983, '154.184.238.166', NULL, 194, '2021-12-25 15:26:32', '2021-12-25 15:26:32'),
(8984, '154.184.238.166', NULL, 194, '2021-12-25 15:26:44', '2021-12-25 15:26:44'),
(8985, '154.184.238.166', NULL, 194, '2021-12-25 15:26:54', '2021-12-25 15:26:54'),
(8986, '154.184.238.166', NULL, 194, '2021-12-25 15:27:11', '2021-12-25 15:27:11'),
(8987, '154.184.238.166', NULL, 194, '2021-12-25 15:27:22', '2021-12-25 15:27:22'),
(8988, '154.184.238.166', NULL, 194, '2021-12-25 15:28:18', '2021-12-25 15:28:18'),
(8989, '154.184.238.166', NULL, 194, '2021-12-25 15:28:30', '2021-12-25 15:28:30'),
(8990, '145.82.204.111', NULL, 202, '2021-12-25 15:29:14', '2021-12-25 15:29:14'),
(8991, '145.82.204.111', NULL, 202, '2021-12-25 15:32:25', '2021-12-25 15:32:25'),
(8992, '145.82.204.111', NULL, 202, '2021-12-25 15:32:58', '2021-12-25 15:32:58'),
(8993, '145.82.204.111', NULL, 202, '2021-12-25 15:33:56', '2021-12-25 15:33:56'),
(8994, '197.120.182.245', NULL, 194, '2021-12-25 18:22:51', '2021-12-25 18:22:51'),
(8995, '197.120.182.245', NULL, 199, '2021-12-25 18:29:54', '2021-12-25 18:29:54'),
(8996, '197.120.182.245', NULL, 199, '2021-12-25 18:34:13', '2021-12-25 18:34:13'),
(8997, '197.120.182.245', NULL, 199, '2021-12-25 18:34:36', '2021-12-25 18:34:36'),
(8998, '197.120.182.245', NULL, 199, '2021-12-25 18:35:38', '2021-12-25 18:35:38'),
(8999, '197.120.182.245', NULL, 199, '2021-12-25 18:35:45', '2021-12-25 18:35:45'),
(9000, '197.120.182.245', NULL, 199, '2021-12-25 18:38:19', '2021-12-25 18:38:19'),
(9001, '77.88.5.33', NULL, 202, '2021-12-26 06:47:36', '2021-12-26 06:47:36'),
(9002, '77.88.5.33', NULL, 199, '2021-12-26 06:49:20', '2021-12-26 06:49:20'),
(9003, '77.88.5.33', NULL, 195, '2021-12-26 06:49:33', '2021-12-26 06:49:33'),
(9004, '77.88.5.213', NULL, 194, '2021-12-26 06:49:41', '2021-12-26 06:49:41'),
(9005, '156.201.96.208', NULL, 194, '2021-12-26 07:58:17', '2021-12-26 07:58:17'),
(9006, '156.201.96.208', NULL, 202, '2021-12-26 07:58:33', '2021-12-26 07:58:33'),
(9007, '156.201.96.208', NULL, 194, '2021-12-26 08:04:16', '2021-12-26 08:04:16'),
(9008, '156.201.96.208', NULL, 195, '2021-12-26 08:19:42', '2021-12-26 08:19:42'),
(9009, '145.82.204.111', NULL, 194, '2021-12-26 14:04:41', '2021-12-26 14:04:41'),
(9011, '185.191.171.26', NULL, 194, '2021-12-27 11:06:39', '2021-12-27 11:06:39'),
(9012, '31.166.179.175', NULL, 210, '2021-12-27 14:00:08', '2021-12-27 14:00:08'),
(9013, '5.108.185.194', NULL, 210, '2021-12-27 14:05:58', '2021-12-27 14:05:58'),
(9014, '31.166.179.175', NULL, 210, '2021-12-27 14:08:07', '2021-12-27 14:08:07'),
(9015, '31.166.179.175', NULL, 211, '2021-12-27 15:28:09', '2021-12-27 15:28:09'),
(9016, '31.166.179.175', NULL, 211, '2021-12-27 15:36:07', '2021-12-27 15:36:07'),
(9017, '31.166.179.175', NULL, 211, '2021-12-27 15:36:20', '2021-12-27 15:36:20'),
(9018, '31.166.179.175', NULL, 211, '2021-12-27 15:36:51', '2021-12-27 15:36:51'),
(9019, '31.166.179.175', NULL, 211, '2021-12-27 15:36:57', '2021-12-27 15:36:57'),
(9020, '31.166.179.175', NULL, 211, '2021-12-27 15:37:03', '2021-12-27 15:37:03'),
(9021, '31.166.179.175', NULL, 211, '2021-12-27 15:37:37', '2021-12-27 15:37:37'),
(9022, '168.149.10.243', NULL, 211, '2021-12-28 03:13:45', '2021-12-28 03:13:45'),
(9023, '197.41.242.5', NULL, 211, '2021-12-28 09:04:48', '2021-12-28 09:04:48'),
(9024, '197.41.66.124', NULL, 199, '2021-12-28 10:19:13', '2021-12-28 10:19:13'),
(9025, '197.41.66.124', NULL, 202, '2021-12-28 10:19:31', '2021-12-28 10:19:31'),
(9026, '197.41.66.124', NULL, 195, '2021-12-28 10:21:51', '2021-12-28 10:21:51'),
(9027, '114.119.151.206', NULL, 202, '2021-12-28 11:19:38', '2021-12-28 11:19:38'),
(9028, '114.119.151.192', NULL, 199, '2021-12-28 14:31:08', '2021-12-28 14:31:08'),
(9029, '185.191.171.40', NULL, 195, '2021-12-28 23:04:36', '2021-12-28 23:04:36'),
(9030, '197.41.66.124', 274, 199, '2021-12-29 06:28:05', '2021-12-29 06:28:05'),
(9031, '197.41.66.124', NULL, 211, '2021-12-29 09:17:07', '2021-12-29 09:17:07'),
(9032, '197.41.66.124', 240, 211, '2021-12-29 09:18:37', '2021-12-29 09:18:37'),
(9033, '197.41.66.124', 240, 211, '2021-12-29 09:18:42', '2021-12-29 09:18:42'),
(9034, '197.41.66.124', 240, 211, '2021-12-29 09:18:52', '2021-12-29 09:18:52'),
(9035, '197.41.66.124', NULL, 211, '2021-12-29 09:30:46', '2021-12-29 09:30:46'),
(9036, '197.41.66.124', NULL, 211, '2021-12-29 09:30:54', '2021-12-29 09:30:54'),
(9037, '197.41.66.124', NULL, 211, '2021-12-29 09:31:02', '2021-12-29 09:31:02'),
(9038, '197.41.66.124', NULL, 211, '2021-12-29 09:47:10', '2021-12-29 09:47:10'),
(9039, '197.41.66.124', NULL, 211, '2021-12-29 09:47:32', '2021-12-29 09:47:32'),
(9040, '197.41.66.124', NULL, 211, '2021-12-29 09:47:38', '2021-12-29 09:47:38'),
(9041, '197.41.66.124', NULL, 211, '2021-12-29 11:42:31', '2021-12-29 11:42:31'),
(9042, '114.119.151.206', NULL, 194, '2021-12-29 12:15:08', '2021-12-29 12:15:08'),
(9043, '185.191.171.21', NULL, 194, '2021-12-29 14:07:23', '2021-12-29 14:07:23'),
(9044, '185.191.171.40', NULL, 202, '2021-12-29 15:10:06', '2021-12-29 15:10:06'),
(9045, '5.109.84.117', NULL, 195, '2021-12-29 15:36:57', '2021-12-29 15:36:57'),
(9046, '5.109.84.117', NULL, 194, '2021-12-29 15:38:12', '2021-12-29 15:38:12'),
(9047, '5.109.84.117', NULL, 202, '2021-12-29 15:38:50', '2021-12-29 15:38:50'),
(9048, '168.149.10.243', NULL, 202, '2021-12-29 15:39:11', '2021-12-29 15:39:11'),
(9049, '168.149.10.243', NULL, 202, '2021-12-29 15:39:15', '2021-12-29 15:39:15'),
(9050, '168.149.10.243', NULL, 202, '2021-12-29 17:34:02', '2021-12-29 17:34:02'),
(9051, '168.149.10.243', NULL, 227, '2021-12-29 17:49:17', '2021-12-29 17:49:17'),
(9052, '168.149.10.243', NULL, 223, '2021-12-29 17:50:14', '2021-12-29 17:50:14'),
(9053, '168.149.10.243', NULL, 223, '2021-12-29 17:50:46', '2021-12-29 17:50:46'),
(9054, '168.149.10.243', NULL, 228, '2021-12-29 18:05:25', '2021-12-29 18:05:25'),
(9055, '5.109.84.117', NULL, 220, '2021-12-29 18:31:40', '2021-12-29 18:31:40'),
(9056, '5.109.84.117', NULL, 225, '2021-12-29 18:33:55', '2021-12-29 18:33:55'),
(9057, '5.109.84.117', NULL, 225, '2021-12-29 18:36:19', '2021-12-29 18:36:19'),
(9058, '40.77.167.39', NULL, 228, '2021-12-29 20:18:28', '2021-12-29 20:18:28'),
(9059, '157.55.39.32', NULL, 227, '2021-12-29 20:18:30', '2021-12-29 20:18:30'),
(9060, '185.191.171.17', NULL, 195, '2021-12-30 00:27:57', '2021-12-30 00:27:57'),
(9061, '114.119.151.192', NULL, 211, '2021-12-30 03:31:24', '2021-12-30 03:31:24'),
(9062, '40.77.167.13', NULL, 211, '2021-12-30 04:14:47', '2021-12-30 04:14:47'),
(9063, '157.55.39.4', NULL, 220, '2021-12-30 05:38:27', '2021-12-30 05:38:27'),
(9064, '40.77.167.13', NULL, 199, '2021-12-30 06:48:22', '2021-12-30 06:48:22'),
(9065, '185.191.171.16', NULL, 199, '2021-12-30 07:32:52', '2021-12-30 07:32:52'),
(9066, '185.191.171.4', NULL, 211, '2021-12-30 11:26:51', '2021-12-30 11:26:51'),
(9067, '156.201.58.34', NULL, 228, '2021-12-30 12:11:03', '2021-12-30 12:11:03'),
(9068, '5.82.52.98', NULL, 202, '2021-12-30 15:50:47', '2021-12-30 15:50:47'),
(9069, '168.149.10.243', NULL, 252, '2021-12-30 18:19:48', '2021-12-30 18:19:48'),
(9070, '168.149.10.243', NULL, 228, '2021-12-30 18:20:02', '2021-12-30 18:20:02'),
(9071, '168.149.10.243', NULL, 248, '2021-12-30 18:20:15', '2021-12-30 18:20:15'),
(9072, '168.149.10.243', NULL, 252, '2021-12-30 18:20:47', '2021-12-30 18:20:47'),
(9073, '185.191.171.13', NULL, 199, '2021-12-30 18:46:05', '2021-12-30 18:46:05'),
(9074, '157.55.39.4', NULL, 237, '2021-12-30 19:01:15', '2021-12-30 19:01:15'),
(9075, '157.55.39.4', NULL, 236, '2021-12-30 19:01:17', '2021-12-30 19:01:17'),
(9076, '5.82.52.98', NULL, 253, '2021-12-30 19:32:01', '2021-12-30 19:32:01'),
(9077, '5.82.52.98', NULL, 239, '2021-12-30 19:32:51', '2021-12-30 19:32:51'),
(9078, '5.82.52.98', NULL, 247, '2021-12-30 19:33:18', '2021-12-30 19:33:18'),
(9079, '207.46.13.211', NULL, 240, '2021-12-30 19:56:51', '2021-12-30 19:56:51'),
(9080, '114.119.151.208', NULL, 202, '2021-12-30 20:33:06', '2021-12-30 20:33:06'),
(9081, '157.55.39.4', NULL, 241, '2021-12-30 21:56:42', '2021-12-30 21:56:42'),
(9082, '40.77.167.13', NULL, 253, '2021-12-30 21:56:59', '2021-12-30 21:56:59'),
(9083, '157.55.39.4', NULL, 251, '2021-12-30 22:12:14', '2021-12-30 22:12:14'),
(9084, '157.55.39.4', NULL, 243, '2021-12-31 04:31:59', '2021-12-31 04:31:59'),
(9085, '157.55.39.32', NULL, 249, '2021-12-31 04:32:17', '2021-12-31 04:32:17'),
(9086, '40.77.167.13', NULL, 237, '2021-12-31 06:33:18', '2021-12-31 06:33:18'),
(9087, '207.46.13.194', NULL, 236, '2021-12-31 06:33:20', '2021-12-31 06:33:20'),
(9088, '185.191.171.20', NULL, 195, '2021-12-31 08:03:35', '2021-12-31 08:03:35'),
(9089, '207.46.13.211', NULL, 199, '2021-12-31 09:06:55', '2021-12-31 09:06:55'),
(9090, '40.77.167.13', NULL, 240, '2021-12-31 11:33:57', '2021-12-31 11:33:57'),
(9091, '157.55.39.32', NULL, 222, '2021-12-31 11:33:58', '2021-12-31 11:33:58'),
(9092, '40.77.167.13', NULL, 246, '2021-12-31 11:34:00', '2021-12-31 11:34:00'),
(9093, '157.55.39.32', NULL, 239, '2021-12-31 11:58:50', '2021-12-31 11:58:50'),
(9094, '207.46.13.194', NULL, 202, '2021-12-31 11:58:53', '2021-12-31 11:58:53'),
(9095, '207.46.13.194', NULL, 251, '2021-12-31 11:58:55', '2021-12-31 11:58:55'),
(9096, '157.55.39.4', NULL, 225, '2021-12-31 11:59:13', '2021-12-31 11:59:13'),
(9097, '207.46.13.211', NULL, 235, '2021-12-31 12:51:37', '2021-12-31 12:51:37'),
(9098, '157.55.39.32', NULL, 234, '2021-12-31 12:51:47', '2021-12-31 12:51:47'),
(9099, '40.77.167.13', NULL, 235, '2021-12-31 14:28:03', '2021-12-31 14:28:03'),
(9100, '40.77.167.13', NULL, 234, '2021-12-31 14:28:24', '2021-12-31 14:28:24'),
(9101, '5.108.51.2', NULL, 194, '2021-12-31 16:29:43', '2021-12-31 16:29:43'),
(9102, '157.55.39.32', NULL, 211, '2021-12-31 16:35:37', '2021-12-31 16:35:37'),
(9103, '5.108.51.2', NULL, 199, '2021-12-31 16:41:00', '2021-12-31 16:41:00'),
(9104, '5.108.51.2', NULL, 194, '2021-12-31 17:25:34', '2021-12-31 17:25:34'),
(9105, '5.108.51.2', NULL, 245, '2021-12-31 17:27:01', '2021-12-31 17:27:01'),
(9106, '168.149.10.243', NULL, 194, '2021-12-31 17:38:48', '2021-12-31 17:38:48'),
(9107, '168.149.10.243', NULL, 195, '2021-12-31 17:39:09', '2021-12-31 17:39:09'),
(9108, '168.149.10.243', NULL, 220, '2021-12-31 17:39:32', '2021-12-31 17:39:32'),
(9109, '5.108.51.2', NULL, 288, '2021-12-31 18:04:16', '2021-12-31 18:04:16'),
(9110, '168.149.10.243', NULL, 288, '2021-12-31 18:04:38', '2021-12-31 18:04:38'),
(9111, '5.108.51.2', NULL, 288, '2021-12-31 18:08:48', '2021-12-31 18:08:48'),
(9112, '185.191.171.17', NULL, 202, '2021-12-31 18:17:32', '2021-12-31 18:17:32'),
(9113, '185.191.171.43', NULL, 194, '2021-12-31 18:29:18', '2021-12-31 18:29:18'),
(9114, '207.46.13.194', NULL, 250, '2021-12-31 19:50:08', '2021-12-31 19:50:08'),
(9115, '40.77.167.13', NULL, 241, '2021-12-31 20:15:47', '2021-12-31 20:15:47'),
(9116, '40.77.167.39', NULL, 228, '2021-12-31 22:30:07', '2021-12-31 22:30:07'),
(9117, '185.191.171.25', NULL, 194, '2022-01-01 02:58:31', '2022-01-01 02:58:31'),
(9118, '185.191.171.21', NULL, 195, '2022-01-01 03:25:05', '2022-01-01 03:25:05'),
(9119, '185.191.171.42', NULL, 225, '2022-01-01 06:17:48', '2022-01-01 06:17:48'),
(9120, '157.55.39.32', NULL, 227, '2022-01-01 08:10:45', '2022-01-01 08:10:45'),
(9121, '185.191.171.19', NULL, 220, '2022-01-01 09:42:26', '2022-01-01 09:42:26'),
(9122, '77.88.5.213', NULL, 240, '2022-01-01 10:17:04', '2022-01-01 10:17:04'),
(9123, '77.88.5.33', NULL, 222, '2022-01-01 10:17:16', '2022-01-01 10:17:16'),
(9124, '77.88.5.213', NULL, 246, '2022-01-01 10:17:21', '2022-01-01 10:17:21'),
(9125, '77.88.5.33', NULL, 226, '2022-01-01 10:17:25', '2022-01-01 10:17:25'),
(9126, '77.88.5.33', NULL, 237, '2022-01-01 10:17:28', '2022-01-01 10:17:28'),
(9127, '77.88.5.213', NULL, 236, '2022-01-01 10:17:31', '2022-01-01 10:17:31'),
(9128, '77.88.5.213', NULL, 223, '2022-01-01 10:17:34', '2022-01-01 10:17:34'),
(9129, '77.88.5.33', NULL, 199, '2022-01-01 10:17:35', '2022-01-01 10:17:35'),
(9130, '77.88.5.213', NULL, 239, '2022-01-01 10:17:36', '2022-01-01 10:17:36'),
(9131, '77.88.5.33', NULL, 251, '2022-01-01 10:17:37', '2022-01-01 10:17:37'),
(9132, '77.88.5.33', NULL, 210, '2022-01-01 10:17:38', '2022-01-01 10:17:38'),
(9133, '77.88.5.213', NULL, 250, '2022-01-01 10:17:41', '2022-01-01 10:17:41'),
(9134, '77.88.5.213', NULL, 228, '2022-01-01 10:18:20', '2022-01-01 10:18:20'),
(9135, '77.88.5.218', NULL, 202, '2022-01-01 10:18:50', '2022-01-01 10:18:50'),
(9136, '77.88.5.33', NULL, 248, '2022-01-01 10:19:08', '2022-01-01 10:19:08'),
(9137, '77.88.5.33', NULL, 241, '2022-01-01 10:20:15', '2022-01-01 10:20:15'),
(9138, '77.88.5.33', NULL, 225, '2022-01-01 10:20:35', '2022-01-01 10:20:35'),
(9139, '77.88.5.213', NULL, 227, '2022-01-01 10:21:38', '2022-01-01 10:21:38'),
(9140, '77.88.5.33', NULL, 252, '2022-01-01 10:22:03', '2022-01-01 10:22:03'),
(9141, '185.191.171.43', NULL, 251, '2022-01-01 13:08:09', '2022-01-01 13:08:09'),
(9142, '157.55.39.4', NULL, 248, '2022-01-01 13:31:00', '2022-01-01 13:31:00'),
(9143, '157.55.39.4', NULL, 223, '2022-01-01 13:31:02', '2022-01-01 13:31:02'),
(9144, '207.46.13.211', NULL, 228, '2022-01-01 13:31:08', '2022-01-01 13:31:08'),
(9145, '40.77.167.39', NULL, 227, '2022-01-01 13:31:11', '2022-01-01 13:31:11'),
(9146, '114.119.151.185', NULL, 248, '2022-01-01 14:25:44', '2022-01-01 14:25:44'),
(9147, '185.191.171.7', NULL, 211, '2022-01-01 14:44:35', '2022-01-01 14:44:35'),
(9148, '188.132.18.26', NULL, 294, '2022-01-01 14:47:43', '2022-01-01 14:47:43'),
(9149, '207.46.13.211', NULL, 253, '2022-01-01 14:50:05', '2022-01-01 14:50:05'),
(9150, '157.55.39.4', NULL, 245, '2022-01-01 16:05:36', '2022-01-01 16:05:36'),
(9151, '188.132.18.26', NULL, 295, '2022-01-01 16:40:35', '2022-01-01 16:40:35'),
(9152, '114.119.151.179', NULL, 243, '2022-01-01 17:38:34', '2022-01-01 17:38:34'),
(9153, '156.201.58.34', NULL, 222, '2022-01-01 17:54:22', '2022-01-01 17:54:22'),
(9154, '114.119.151.175', NULL, 195, '2022-01-01 18:15:03', '2022-01-01 18:15:03'),
(9155, '40.77.167.39', NULL, 228, '2022-01-01 19:00:54', '2022-01-01 19:00:54'),
(9156, '188.132.18.26', NULL, 303, '2022-01-01 21:17:57', '2022-01-01 21:17:57'),
(9157, '185.191.171.37', NULL, 222, '2022-01-01 21:35:44', '2022-01-01 21:35:44'),
(9158, '114.119.151.208', NULL, 249, '2022-01-01 21:44:53', '2022-01-01 21:44:53'),
(9159, '40.77.167.39', NULL, 293, '2022-01-01 21:54:21', '2022-01-01 21:54:21'),
(9160, '185.191.171.25', NULL, 210, '2022-01-01 23:13:08', '2022-01-01 23:13:08'),
(9161, '157.55.39.4', NULL, 296, '2022-01-02 00:26:33', '2022-01-02 00:26:33'),
(9162, '207.46.13.194', NULL, 294, '2022-01-02 00:26:38', '2022-01-02 00:26:38'),
(9163, '40.77.167.13', NULL, 302, '2022-01-02 00:26:38', '2022-01-02 00:26:38'),
(9164, '207.46.13.194', NULL, 298, '2022-01-02 00:26:39', '2022-01-02 00:26:39'),
(9165, '207.46.13.211', NULL, 297, '2022-01-02 00:26:41', '2022-01-02 00:26:41'),
(9166, '157.55.39.32', NULL, 300, '2022-01-02 00:26:42', '2022-01-02 00:26:42'),
(9167, '40.77.167.39', NULL, 299, '2022-01-02 00:26:44', '2022-01-02 00:26:44'),
(9168, '185.191.171.33', NULL, 223, '2022-01-02 00:47:44', '2022-01-02 00:47:44'),
(9169, '114.119.151.184', NULL, 220, '2022-01-02 00:53:58', '2022-01-02 00:53:58'),
(9170, '157.55.39.4', NULL, 220, '2022-01-02 02:01:41', '2022-01-02 02:01:41'),
(9171, '157.55.39.32', NULL, 227, '2022-01-02 02:38:07', '2022-01-02 02:38:07'),
(9172, '114.119.151.175', NULL, 228, '2022-01-02 03:47:34', '2022-01-02 03:47:34'),
(9173, '185.191.171.44', NULL, 225, '2022-01-02 05:42:18', '2022-01-02 05:42:18'),
(9174, '40.77.167.13', NULL, 253, '2022-01-02 05:45:31', '2022-01-02 05:45:31'),
(9175, '157.55.39.4', NULL, 236, '2022-01-02 08:35:02', '2022-01-02 08:35:02'),
(9176, '157.55.39.4', NULL, 241, '2022-01-02 10:18:13', '2022-01-02 10:18:13'),
(9177, '114.119.151.185', NULL, 236, '2022-01-02 10:36:54', '2022-01-02 10:36:54'),
(9178, '185.191.171.9', NULL, 291, '2022-01-02 11:58:47', '2022-01-02 11:58:47'),
(9179, '157.55.39.32', NULL, 246, '2022-01-02 12:00:14', '2022-01-02 12:00:14'),
(9180, '185.191.171.44', NULL, 220, '2022-01-02 12:05:38', '2022-01-02 12:05:38'),
(9181, '95.187.139.253', NULL, 294, '2022-01-02 13:07:08', '2022-01-02 13:07:08'),
(9182, '157.55.39.4', NULL, 237, '2022-01-02 14:01:44', '2022-01-02 14:01:44'),
(9183, '185.191.171.34', NULL, 236, '2022-01-02 14:29:49', '2022-01-02 14:29:49'),
(9184, '175.110.219.77', NULL, 307, '2022-01-02 14:42:31', '2022-01-02 14:42:31'),
(9185, '175.110.219.77', NULL, 307, '2022-01-02 14:45:30', '2022-01-02 14:45:30'),
(9186, '175.110.219.77', NULL, 307, '2022-01-02 14:45:41', '2022-01-02 14:45:41'),
(9187, '175.110.219.77', NULL, 307, '2022-01-02 14:45:47', '2022-01-02 14:45:47'),
(9188, '175.110.219.77', NULL, 307, '2022-01-02 15:24:24', '2022-01-02 15:24:24'),
(9189, '175.110.219.77', NULL, 311, '2022-01-02 15:24:57', '2022-01-02 15:24:57'),
(9190, '175.110.219.77', NULL, 311, '2022-01-02 15:25:58', '2022-01-02 15:25:58'),
(9191, '175.110.219.77', NULL, 307, '2022-01-02 15:26:58', '2022-01-02 15:26:58'),
(9192, '175.110.219.77', NULL, 311, '2022-01-02 15:27:17', '2022-01-02 15:27:17'),
(9193, '175.110.219.77', NULL, 311, '2022-01-02 15:27:30', '2022-01-02 15:27:30'),
(9194, '175.110.219.77', NULL, 311, '2022-01-02 15:27:38', '2022-01-02 15:27:38'),
(9195, '175.110.219.77', NULL, 312, '2022-01-02 15:31:30', '2022-01-02 15:31:30'),
(9196, '175.110.219.77', NULL, 312, '2022-01-02 15:31:45', '2022-01-02 15:31:45'),
(9197, '175.110.219.77', NULL, 312, '2022-01-02 15:32:16', '2022-01-02 15:32:16'),
(9198, '175.110.219.77', NULL, 312, '2022-01-02 15:32:20', '2022-01-02 15:32:20'),
(9199, '175.110.219.77', NULL, 307, '2022-01-02 15:38:34', '2022-01-02 15:38:34'),
(9200, '175.110.219.77', NULL, 307, '2022-01-02 15:39:01', '2022-01-02 15:39:01'),
(9201, '175.110.219.77', NULL, 311, '2022-01-02 15:39:43', '2022-01-02 15:39:43'),
(9202, '175.110.219.77', NULL, 311, '2022-01-02 15:39:56', '2022-01-02 15:39:56'),
(9203, '175.110.219.77', NULL, 312, '2022-01-02 15:40:28', '2022-01-02 15:40:28'),
(9204, '175.110.219.77', NULL, 311, '2022-01-02 15:41:32', '2022-01-02 15:41:32'),
(9205, '175.110.219.77', NULL, 307, '2022-01-02 15:41:42', '2022-01-02 15:41:42'),
(9206, '114.119.151.206', NULL, 251, '2022-01-02 15:42:26', '2022-01-02 15:42:26'),
(9207, '175.110.219.77', NULL, 307, '2022-01-02 15:46:01', '2022-01-02 15:46:01'),
(9208, '175.110.219.77', NULL, 311, '2022-01-02 15:46:21', '2022-01-02 15:46:21'),
(9209, '175.110.219.77', NULL, 311, '2022-01-02 15:48:41', '2022-01-02 15:48:41'),
(9210, '40.77.167.13', NULL, 199, '2022-01-02 16:01:30', '2022-01-02 16:01:30'),
(9211, '175.110.219.77', NULL, 313, '2022-01-02 16:02:45', '2022-01-02 16:02:45'),
(9212, '175.110.219.77', NULL, 313, '2022-01-02 16:03:00', '2022-01-02 16:03:00'),
(9213, '175.110.219.77', NULL, 313, '2022-01-02 16:03:40', '2022-01-02 16:03:40'),
(9214, '175.110.219.77', NULL, 313, '2022-01-02 16:03:45', '2022-01-02 16:03:45'),
(9215, '175.110.219.77', NULL, 313, '2022-01-02 16:03:49', '2022-01-02 16:03:49'),
(9216, '185.191.171.34', NULL, 202, '2022-01-02 16:07:49', '2022-01-02 16:07:49'),
(9217, '175.110.219.77', NULL, 315, '2022-01-02 16:22:52', '2022-01-02 16:22:52'),
(9218, '175.110.219.77', NULL, 315, '2022-01-02 16:23:08', '2022-01-02 16:23:08'),
(9219, '175.110.219.77', NULL, 316, '2022-01-02 16:41:53', '2022-01-02 16:41:53'),
(9220, '175.110.219.77', NULL, 316, '2022-01-02 16:42:10', '2022-01-02 16:42:10'),
(9221, '175.110.219.77', NULL, 316, '2022-01-02 16:42:24', '2022-01-02 16:42:24'),
(9222, '175.110.219.77', NULL, 316, '2022-01-02 16:42:34', '2022-01-02 16:42:34'),
(9223, '175.110.219.77', NULL, 316, '2022-01-02 16:42:58', '2022-01-02 16:42:58'),
(9224, '175.110.219.77', NULL, 316, '2022-01-02 16:43:01', '2022-01-02 16:43:01'),
(9225, '185.191.171.2', NULL, 226, '2022-01-02 16:53:24', '2022-01-02 16:53:24'),
(9226, '185.191.171.26', NULL, 225, '2022-01-02 18:12:25', '2022-01-02 18:12:25'),
(9227, '40.77.167.39', NULL, 228, '2022-01-02 18:39:12', '2022-01-02 18:39:12'),
(9228, '154.54.249.196', NULL, 195, '2022-01-02 18:39:52', '2022-01-02 18:39:52'),
(9229, '154.54.249.196', NULL, 199, '2022-01-02 18:40:09', '2022-01-02 18:40:09'),
(9230, '154.54.249.196', NULL, 194, '2022-01-02 18:40:25', '2022-01-02 18:40:25'),
(9231, '154.54.249.196', NULL, 202, '2022-01-02 18:46:51', '2022-01-02 18:46:51'),
(9232, '40.77.167.13', NULL, 235, '2022-01-02 19:38:20', '2022-01-02 19:38:20'),
(9233, '157.55.39.4', NULL, 220, '2022-01-02 19:41:26', '2022-01-02 19:41:26'),
(9234, '185.191.171.15', NULL, 220, '2022-01-02 20:56:55', '2022-01-02 20:56:55'),
(9235, '207.46.13.194', NULL, 250, '2022-01-02 21:37:31', '2022-01-02 21:37:31'),
(9236, '157.55.39.4', NULL, 251, '2022-01-02 22:27:12', '2022-01-02 22:27:12'),
(9237, '40.77.167.13', NULL, 237, '2022-01-02 22:31:27', '2022-01-02 22:31:27'),
(9238, '157.55.39.4', NULL, 241, '2022-01-02 22:58:15', '2022-01-02 22:58:15'),
(9239, '185.191.171.43', NULL, 245, '2022-01-03 00:39:31', '2022-01-03 00:39:31'),
(9240, '114.119.151.197', NULL, 225, '2022-01-03 01:50:31', '2022-01-03 01:50:31'),
(9241, '40.77.167.13', NULL, 241, '2022-01-03 02:00:15', '2022-01-03 02:00:15'),
(9242, '207.46.13.211', NULL, 199, '2022-01-03 03:00:15', '2022-01-03 03:00:15'),
(9243, '185.191.171.19', NULL, 247, '2022-01-03 03:25:08', '2022-01-03 03:25:08'),
(9244, '157.55.39.4', NULL, 237, '2022-01-03 03:28:00', '2022-01-03 03:28:00'),
(9245, '157.55.39.4', NULL, 243, '2022-01-03 03:30:20', '2022-01-03 03:30:20'),
(9246, '40.77.167.13', NULL, 211, '2022-01-03 03:56:27', '2022-01-03 03:56:27'),
(9247, '40.77.167.13', NULL, 199, '2022-01-03 04:01:57', '2022-01-03 04:01:57'),
(9248, '185.191.171.45', NULL, 199, '2022-01-03 04:25:45', '2022-01-03 04:25:45'),
(9249, '157.55.39.6', NULL, 239, '2022-01-03 04:29:17', '2022-01-03 04:29:17'),
(9250, '157.55.39.6', NULL, 222, '2022-01-03 04:34:18', '2022-01-03 04:34:18'),
(9251, '114.119.151.208', NULL, 240, '2022-01-03 04:52:00', '2022-01-03 04:52:00'),
(9252, '114.119.151.185', NULL, 227, '2022-01-03 05:12:39', '2022-01-03 05:12:39'),
(9253, '207.46.13.211', NULL, 235, '2022-01-03 05:34:20', '2022-01-03 05:34:20'),
(9254, '156.201.58.34', NULL, 194, '2022-01-03 05:49:59', '2022-01-03 05:49:59'),
(9255, '156.201.58.34', NULL, 253, '2022-01-03 05:50:26', '2022-01-03 05:50:26'),
(9256, '40.77.167.13', NULL, 253, '2022-01-03 06:04:03', '2022-01-03 06:04:03'),
(9257, '207.46.13.211', NULL, 240, '2022-01-03 07:17:49', '2022-01-03 07:17:49'),
(9258, '114.119.151.206', NULL, 303, '2022-01-03 07:23:27', '2022-01-03 07:23:27'),
(9259, '40.77.167.13', NULL, 246, '2022-01-03 07:38:59', '2022-01-03 07:38:59'),
(9260, '157.55.39.6', NULL, 211, '2022-01-03 07:45:27', '2022-01-03 07:45:27'),
(9261, '185.191.171.11', NULL, 288, '2022-01-03 08:17:12', '2022-01-03 08:17:12'),
(9262, '185.191.171.15', NULL, 211, '2022-01-03 08:26:33', '2022-01-03 08:26:33'),
(9263, '127.0.0.1', NULL, 211, '2022-01-04 06:21:02', '2022-01-04 06:21:02'),
(9641, '127.0.0.1', NULL, 211, '2022-01-04 08:01:50', '2022-01-04 08:01:50'),
(9642, '127.0.0.1', NULL, 211, '2022-01-04 08:04:21', '2022-01-04 08:04:21'),
(9643, '127.0.0.1', 274, 211, '2022-01-04 08:07:45', '2022-01-04 08:07:45'),
(9644, '127.0.0.1', NULL, 320, '2022-01-17 11:12:15', '2022-01-17 11:12:15'),
(9645, '127.0.0.1', NULL, 320, '2022-01-17 11:12:26', '2022-01-17 11:12:26'),
(9646, '127.0.0.1', 278, 195, '2022-01-26 06:37:49', '2022-01-26 06:37:49'),
(9647, '::1', NULL, 194, '2022-01-26 07:23:15', '2022-01-26 07:23:15'),
(9648, '::1', 278, 194, '2022-01-26 07:26:00', '2022-01-26 07:26:00'),
(9649, '::1', 278, 194, '2022-01-26 09:58:49', '2022-01-26 09:58:49'),
(9650, '127.0.0.1', NULL, 220, '2022-01-30 05:27:30', '2022-01-30 05:27:30'),
(9651, '127.0.0.1', NULL, 220, '2022-01-30 05:33:53', '2022-01-30 05:33:53'),
(9652, '127.0.0.1', NULL, 220, '2022-01-30 05:34:26', '2022-01-30 05:34:26'),
(9653, '127.0.0.1', NULL, 220, '2022-01-30 05:35:16', '2022-01-30 05:35:16'),
(9654, '127.0.0.1', NULL, 220, '2022-01-30 05:37:24', '2022-01-30 05:37:24'),
(9655, '127.0.0.1', NULL, 220, '2022-01-30 05:39:45', '2022-01-30 05:39:45'),
(9656, '127.0.0.1', NULL, 220, '2022-01-30 05:40:10', '2022-01-30 05:40:10'),
(9657, '127.0.0.1', NULL, 277, '2022-02-02 06:19:13', '2022-02-02 06:19:13'),
(9658, '127.0.0.1', 278, 195, '2022-02-02 09:38:01', '2022-02-02 09:38:01'),
(9659, '127.0.0.1', 278, 243, '2022-02-02 10:33:07', '2022-02-02 10:33:07'),
(9660, '127.0.0.1', 278, 243, '2022-02-02 10:33:59', '2022-02-02 10:33:59'),
(9661, '127.0.0.1', 278, 243, '2022-02-02 10:38:38', '2022-02-02 10:38:38'),
(9662, '127.0.0.1', 278, 243, '2022-02-02 10:39:02', '2022-02-02 10:39:02'),
(9663, '127.0.0.1', 278, 311, '2022-02-02 10:39:17', '2022-02-02 10:39:17'),
(9664, '127.0.0.1', 278, 223, '2022-02-02 10:52:47', '2022-02-02 10:52:47'),
(9665, '127.0.0.1', 278, 195, '2022-02-02 11:49:37', '2022-02-02 11:49:37'),
(9666, '127.0.0.1', 278, 199, '2022-02-02 11:49:53', '2022-02-02 11:49:53'),
(9667, '127.0.0.1', 278, 211, '2022-02-02 12:03:02', '2022-02-02 12:03:02'),
(9668, '127.0.0.1', 278, 195, '2022-02-02 12:03:33', '2022-02-02 12:03:33'),
(9669, '127.0.0.1', 278, 195, '2022-02-02 12:17:38', '2022-02-02 12:17:38'),
(9670, '127.0.0.1', 278, 195, '2022-02-02 12:30:47', '2022-02-02 12:30:47'),
(9671, '127.0.0.1', 278, 307, '2022-02-02 13:03:03', '2022-02-02 13:03:03'),
(9672, '127.0.0.1', 278, 210, '2022-02-03 08:09:10', '2022-02-03 08:09:10'),
(9673, '127.0.0.1', 278, 210, '2022-02-03 08:18:00', '2022-02-03 08:18:00'),
(9674, '127.0.0.1', 278, 210, '2022-02-03 08:18:17', '2022-02-03 08:18:17'),
(9675, '127.0.0.1', 278, 195, '2022-02-03 11:59:20', '2022-02-03 11:59:20'),
(9676, '127.0.0.1', 278, 195, '2022-02-03 11:59:37', '2022-02-03 11:59:37'),
(9677, '127.0.0.1', NULL, 194, '2022-02-06 07:29:20', '2022-02-06 07:29:20'),
(9678, '127.0.0.1', NULL, 194, '2022-02-06 07:30:20', '2022-02-06 07:30:20'),
(9679, '127.0.0.1', NULL, 194, '2022-02-06 07:30:48', '2022-02-06 07:30:48'),
(9680, '127.0.0.1', NULL, 194, '2022-02-06 07:47:12', '2022-02-06 07:47:12'),
(9681, '127.0.0.1', NULL, 194, '2022-02-06 07:48:29', '2022-02-06 07:48:29'),
(9682, '127.0.0.1', NULL, 194, '2022-02-06 07:55:19', '2022-02-06 07:55:19'),
(9683, '127.0.0.1', NULL, 194, '2022-02-06 07:56:17', '2022-02-06 07:56:17'),
(9684, '127.0.0.1', NULL, 194, '2022-02-06 07:56:37', '2022-02-06 07:56:37'),
(9685, '127.0.0.1', NULL, 194, '2022-02-06 07:57:58', '2022-02-06 07:57:58'),
(9686, '127.0.0.1', NULL, 194, '2022-02-06 08:33:54', '2022-02-06 08:33:54'),
(9687, '::1', 271, 318, '2022-02-08 11:33:41', '2022-02-08 11:33:41'),
(9688, '127.0.0.1', 278, 195, '2022-02-09 09:20:37', '2022-02-09 09:20:37'),
(9689, '127.0.0.1', 278, 307, '2022-02-09 14:26:03', '2022-02-09 14:26:03'),
(9690, '127.0.0.1', 278, 307, '2022-02-09 14:26:12', '2022-02-09 14:26:12'),
(9691, '127.0.0.1', 278, 307, '2022-02-09 14:26:30', '2022-02-09 14:26:30'),
(9692, '127.0.0.1', 278, 195, '2022-02-09 14:30:30', '2022-02-09 14:30:30'),
(9693, '127.0.0.1', 278, 195, '2022-02-09 14:33:15', '2022-02-09 14:33:15'),
(9694, '127.0.0.1', 278, 210, '2022-02-09 14:37:36', '2022-02-09 14:37:36'),
(9695, '::1', 278, 302, '2022-02-13 11:55:24', '2022-02-13 11:55:24'),
(9696, '127.0.0.1', NULL, 194, '2022-02-13 13:40:26', '2022-02-13 13:40:26'),
(9697, '127.0.0.1', NULL, 194, '2022-02-13 13:42:16', '2022-02-13 13:42:16'),
(9698, '127.0.0.1', NULL, 194, '2022-02-13 14:02:26', '2022-02-13 14:02:26'),
(9699, '127.0.0.1', NULL, 194, '2022-02-13 14:03:14', '2022-02-13 14:03:14'),
(9700, '127.0.0.1', NULL, 194, '2022-02-13 14:06:31', '2022-02-13 14:06:31'),
(9701, '127.0.0.1', NULL, 194, '2022-02-13 14:06:58', '2022-02-13 14:06:58'),
(9702, '::1', 278, 211, '2022-02-13 14:02:02', '2022-02-13 14:02:02'),
(9703, '::1', NULL, 302, '2022-02-14 09:01:17', '2022-02-14 09:01:17'),
(9704, '127.0.0.1', NULL, 195, '2022-02-14 11:40:28', '2022-02-14 11:40:28'),
(9705, '127.0.0.1', 240, 195, '2022-02-14 11:52:38', '2022-02-14 11:52:38'),
(9706, '127.0.0.1', 240, 195, '2022-02-14 11:52:48', '2022-02-14 11:52:48'),
(9707, '127.0.0.1', 278, 211, '2022-02-14 14:50:21', '2022-02-14 14:50:21'),
(9708, '127.0.0.1', 240, 211, '2022-02-14 14:53:08', '2022-02-14 14:53:08'),
(9709, '127.0.0.1', 240, 202, '2022-02-15 08:13:41', '2022-02-15 08:13:41'),
(9710, '127.0.0.1', 240, 210, '2022-02-15 12:54:18', '2022-02-15 12:54:18'),
(9711, '127.0.0.1', 240, 195, '2022-02-15 14:01:01', '2022-02-15 14:01:01'),
(9712, '127.0.0.1', NULL, 211, '2022-02-15 14:09:50', '2022-02-15 14:09:50'),
(9713, '127.0.0.1', 278, 195, '2022-02-15 14:44:56', '2022-02-15 14:44:56'),
(9714, '127.0.0.1', 278, 210, '2022-02-15 14:58:44', '2022-02-15 14:58:44'),
(9715, '127.0.0.1', 278, 220, '2022-02-15 15:07:48', '2022-02-15 15:07:48'),
(9716, '127.0.0.1', 278, 239, '2022-02-15 15:16:23', '2022-02-15 15:16:23'),
(9717, '127.0.0.1', 278, 194, '2022-02-15 15:21:30', '2022-02-15 15:21:30'),
(9718, '127.0.0.1', 278, 295, '2022-02-16 09:02:29', '2022-02-16 09:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_mcq_id` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_mcq_id`, `published`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2022-07-13 21:55:36', '2022-06-24 08:09:00'),
(2, 4, 1, '2022-07-13 21:55:39', '2022-06-27 18:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `questions_data`
--

CREATE TABLE `questions_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions_data`
--

INSERT INTO `questions_data` (`id`, `question_id`, `lang_id`, `title`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'what is laravel ?', 1, '2022-07-13 21:55:49', '2022-06-24 12:19:26'),
(2, 2, 2, 'what is new in laravel ?', 0, '2022-07-13 21:55:51', '2022-06-27 18:04:53');

-- --------------------------------------------------------

--
-- Table structure for table `question_details`
--

CREATE TABLE `question_details` (
  `id` int(11) NOT NULL,
  `title` varchar(199) CHARACTER SET latin1 NOT NULL,
  `published` tinyint(1) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_details`
--

INSERT INTO `question_details` (`id`, `title`, `published`, `lang_id`, `description`, `created_at`, `updated_at`) VALUES
(2, 'Maiores exercitation', 1, 1, 'Provident in impedi', '2022-07-12 17:40:13', '2022-07-12 17:40:13'),
(3, 'Incididunt ea id omn', 0, 2, '<p>testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest</p>', '2022-07-12 17:43:39', '2022-07-12 17:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `question_mcq`
--

CREATE TABLE `question_mcq` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_mcq`
--

INSERT INTO `question_mcq` (`id`, `title`, `published`, `lang_id`, `created_at`, `updated_at`) VALUES
(3, 'PRODUCTS', 1, 2, '2022-02-27 12:59:13', '2022-07-12 18:37:17'),
(4, 'LED', 1, 2, '2022-02-27 13:02:09', '2022-07-12 18:37:08'),
(5, 'CIRCUIT BREAKER ENCLOSURE', 1, 2, '2022-02-28 10:00:33', '2022-07-12 18:34:44'),
(6, 'CIRCUIT BREAKER ENCLOSURE', 0, 1, '2022-02-28 10:02:47', '2022-02-28 10:45:21'),
(11, 'test', 0, 2, '2022-03-29 05:11:57', '2022-03-29 05:11:57'),
(12, 'test', 0, 2, '2022-03-29 12:38:07', '2022-03-29 12:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_after_modules`
--

CREATE TABLE `quiz_after_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_after_modules`
--

INSERT INTO `quiz_after_modules` (`id`, `status`, `image`, `created_at`, `updated_at`) VALUES
(15, 1, '/uploads/quiz_module/16565578064.png', '2022-06-30 00:56:46', '2022-06-30 00:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_after_modules_data`
--

CREATE TABLE `quiz_after_modules_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_after_modules_data`
--

INSERT INTO `quiz_after_modules_data` (`id`, `quiz_id`, `lang_id`, `title`, `description`, `answer`, `created_at`, `updated_at`) VALUES
(22, 15, 2, 'what is the module?', 'what is this?', 1, '2022-06-30 00:56:46', '2022-06-30 00:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `replys`
--

CREATE TABLE `replys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replys`
--

INSERT INTO `replys` (`id`, `user_id`, `contact_id`, `message`, `created_at`, `updated_at`) VALUES
(2, 61, 1, 'hi', '2022-05-09 04:23:53', '2022-05-09 04:23:53'),
(3, 61, 27, 'hello', '2022-05-09 04:24:08', '2022-05-09 04:24:08'),
(4, 61, 31, 'test', '2022-05-09 04:24:20', '2022-05-09 04:24:20'),
(5, 61, 28, 'ggfdgfdg', '2022-05-09 04:26:43', '2022-05-09 04:26:43'),
(6, 61, 35, 'sgfdg', '2022-05-09 04:26:55', '2022-05-09 04:26:55'),
(7, 61, 1, 'fgfdgfdg', '2022-05-09 04:54:12', '2022-05-09 04:54:12'),
(8, 61, 1, 'erewrewr', '2022-05-09 05:27:44', '2022-05-09 05:27:44'),
(9, 61, 1, 'mahdy', '2022-05-09 05:53:30', '2022-05-09 05:53:30'),
(10, 61, 1, 'gg', '2022-05-10 11:12:31', '2022-05-10 11:12:31'),
(11, 61, 1, 'hjhgjg', '2022-05-10 11:19:36', '2022-05-10 11:19:36'),
(12, 61, 1, 'fdgdfgdf', '2022-05-10 11:20:06', '2022-05-10 11:20:06'),
(13, 61, 1, 'gfhgfhfg', '2022-05-10 11:25:05', '2022-05-10 11:25:05'),
(14, 61, 1, 'gggg', '2022-05-10 11:27:25', '2022-05-10 11:27:25'),
(15, 61, 1, 'fffff', '2022-05-10 11:31:28', '2022-05-10 11:31:28'),
(16, 61, 27, 'hi', '2022-05-11 03:48:08', '2022-05-11 03:48:08'),
(17, 61, 27, 'ghghg', '2022-05-11 03:56:00', '2022-05-11 03:56:00'),
(18, 61, 27, 'gg', '2022-05-11 03:56:25', '2022-05-11 03:56:25'),
(19, 61, 27, 'bb', '2022-05-11 03:56:57', '2022-05-11 03:56:57'),
(20, 61, 27, 'ff', '2022-05-11 03:58:29', '2022-05-11 03:58:29'),
(21, 61, 27, 'ff', '2022-05-11 03:58:37', '2022-05-11 03:58:37'),
(22, 61, 27, 'jj', '2022-05-11 03:59:07', '2022-05-11 03:59:07'),
(23, 61, 27, 'jj', '2022-05-11 03:59:32', '2022-05-11 03:59:32'),
(24, 61, 27, 'jj', '2022-05-11 03:59:51', '2022-05-11 03:59:51'),
(25, 61, 27, 'jj', '2022-05-11 04:02:08', '2022-05-11 04:02:08'),
(26, 61, 27, 'jj', '2022-05-11 04:10:24', '2022-05-11 04:10:24'),
(27, 61, 27, 'jj', '2022-05-11 04:11:04', '2022-05-11 04:11:04'),
(28, 61, 27, 'jj', '2022-05-11 04:13:24', '2022-05-11 04:13:24'),
(29, 61, 27, 'k', '2022-05-11 04:13:40', '2022-05-11 04:13:40'),
(30, 61, 27, 'k', '2022-05-11 04:14:09', '2022-05-11 04:14:09'),
(31, 61, 27, 'k', '2022-05-11 04:16:12', '2022-05-11 04:16:12'),
(32, 61, 27, 'k', '2022-05-11 04:16:30', '2022-05-11 04:16:30'),
(33, 61, 27, 'k', '2022-05-11 04:17:08', '2022-05-11 04:17:08'),
(34, 61, 27, 'k', '2022-05-11 04:17:22', '2022-05-11 04:17:22'),
(35, 61, 27, 'k', '2022-05-11 04:21:16', '2022-05-11 04:21:16'),
(36, 61, 27, 'k', '2022-05-11 04:21:43', '2022-05-11 04:21:43'),
(37, 61, 27, 'mahdy', '2022-05-11 04:22:28', '2022-05-11 04:22:28'),
(38, 61, 31, 'hi', '2022-05-11 07:58:17', '2022-05-11 07:58:17'),
(39, 61, 31, 'hi', '2022-05-11 07:58:52', '2022-05-11 07:58:52');

-- --------------------------------------------------------

--
-- Table structure for table `request_products`
--

CREATE TABLE `request_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(555) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(22, 'Adminn', 'admin', '2022-03-06 07:46:54', '2022-03-06 07:46:54'),
(23, 'Super Admin', 'admin', '2022-03-06 07:46:54', '2022-03-06 07:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `role_data`
--

CREATE TABLE `role_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(60, 9),
(61, 9),
(62, 9),
(63, 9),
(65, 9),
(66, 9),
(68, 9),
(112, 10),
(63, 19),
(67, 19),
(71, 19),
(20, 20),
(26, 20),
(31, 20),
(32, 20),
(33, 20),
(34, 20),
(40, 20),
(43, 20),
(44, 20),
(46, 20),
(60, 20),
(61, 20),
(62, 20),
(63, 20),
(99, 20),
(100, 20),
(101, 20),
(102, 20),
(103, 20),
(104, 20),
(105, 20),
(106, 20),
(107, 20),
(26, 3),
(39, 3),
(75, 3),
(83, 3),
(95, 3),
(52, 6),
(60, 6),
(76, 6),
(80, 6),
(83, 6),
(105, 6),
(64, 21),
(76, 21),
(81, 21),
(84, 21),
(86, 21),
(91, 21),
(92, 21),
(104, 21),
(20, 22),
(29, 22),
(30, 22),
(31, 22),
(35, 22),
(36, 22),
(37, 22),
(38, 22),
(39, 22),
(96, 22),
(97, 22),
(99, 22),
(107, 22),
(109, 22),
(110, 22),
(113, 22),
(114, 22),
(154, 22),
(155, 22),
(22, 26),
(29, 26),
(30, 26),
(31, 26),
(35, 26),
(40, 26),
(44, 26),
(60, 26),
(96, 26),
(99, 26),
(102, 26),
(103, 26),
(107, 26),
(108, 26),
(110, 26),
(112, 26),
(154, 26),
(155, 26),
(156, 26),
(160, 26),
(164, 26),
(168, 26),
(172, 26),
(176, 26),
(180, 26),
(20, 23),
(21, 23),
(22, 23),
(25, 23),
(26, 23),
(27, 23),
(29, 23),
(30, 23),
(31, 23),
(34, 23),
(35, 23),
(36, 23),
(37, 23),
(38, 23),
(39, 23),
(40, 23),
(41, 23),
(42, 23),
(43, 23),
(44, 23),
(45, 23),
(46, 23),
(47, 23),
(60, 23),
(62, 23),
(63, 23),
(96, 23),
(99, 23),
(102, 23),
(103, 23),
(107, 23),
(108, 23),
(110, 23),
(112, 23),
(154, 23),
(155, 23),
(156, 23),
(157, 23),
(158, 23),
(159, 23),
(160, 23),
(161, 23),
(162, 23),
(163, 23),
(164, 23),
(165, 23),
(166, 23),
(167, 23),
(168, 23),
(169, 23),
(170, 23),
(171, 23),
(172, 23),
(173, 23),
(174, 23),
(175, 23),
(176, 23),
(177, 23),
(178, 23),
(179, 23),
(180, 23),
(181, 23),
(182, 23),
(183, 23),
(184, 23),
(185, 23),
(186, 23),
(187, 23),
(188, 23),
(189, 23),
(190, 23),
(194, 23),
(195, 23),
(196, 23),
(197, 23),
(198, 23),
(199, 23),
(26, 24),
(37, 24);

-- --------------------------------------------------------

--
-- Table structure for table `section_category_master`
--

CREATE TABLE `section_category_master` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_products`
--

CREATE TABLE `section_products` (
  `id` int(11) NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_products`
--

INSERT INTO `section_products` (`id`, `section_id`, `product_id`) VALUES
(11, 97, 7),
(12, 116, 7),
(13, 117, 7),
(14, 118, 7),
(15, 119, 7),
(16, 120, 9),
(17, 122, 7),
(19, 124, 3),
(20, 128, 3),
(21, 132, 3),
(22, 133, 3),
(23, 134, 3),
(24, 140, 3),
(25, 141, 3),
(26, 142, 3),
(29, 153, 3),
(30, 159, 3);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '/uploads/services/1649247591contact-head-img.jpg', 1, '2021-02-08 17:54:42', '2022-04-06 10:19:51'),
(6, '/uploads/services/1649248125pexels-andrea-piacquadio-3779706.jpg', 1, '2021-04-19 16:40:10', '2022-04-06 10:28:45'),
(10, '/uploads/services/1649247613dental-checkup.png', 1, '2022-02-24 07:19:51', '2022-04-06 10:20:13'),
(13, '/uploads/services/1649248118c927e9370e76dc14f5727aeeee648fa8.png', 1, '2022-03-06 07:33:16', '2022-04-06 10:28:38'),
(15, '/uploads/services/1649755001braces.png', 1, '2022-04-12 07:16:23', '2022-04-12 07:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `services_attachments`
--

CREATE TABLE `services_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services_attachments`
--

INSERT INTO `services_attachments` (`id`, `service_id`, `file`) VALUES
(1, 2, '/uploads/services/1644937078Project Templet.docx'),
(2, 1, '/images/pdf-icon.webp'),
(3, 6, '/uploads/services/6/1645696699date.txt'),
(4, 6, '/uploads/services/6/1645696721download.jfif'),
(5, 9, '/uploads/services/9/1646559640about-us.jpg'),
(6, 1, '/uploads/services/1/1649247581services-head-img.jpg'),
(7, 15, '/uploads/services/15/1649754992blog-head-img.jpg'),
(8, 6, '/uploads/services/6/1649764917features-img.png');

-- --------------------------------------------------------

--
-- Table structure for table `services_data`
--

CREATE TABLE `services_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services_data`
--

INSERT INTO `services_data` (`id`, `title`, `body`, `service_id`, `lang_id`, `created_at`, `updated_at`) VALUES
(1, 'International Presence', 'Lorem Ipsum is simply dumm of the printing and typesetting industry.', 1, 1, '2021-02-08 17:54:42', '2021-02-08 17:54:42'),
(6, 'خدمة جديدة', '<p>تجربة الخدمة الجديدة</p>', 6, 2, '2021-04-19 16:40:10', '2021-04-19 16:40:10'),
(10, 'الحضور الدولي', '<p>الحضور الدولي وصف&nbsp;الحضور الدولي وصف&nbsp;الحضور الدولي وصف</p>', 1, 2, '2022-02-24 07:15:32', '2022-02-24 07:15:57'),
(13, 'Construction', '<p>Construction description&nbsp;Construction description&nbsp;Construction description&nbsp;Construction description&nbsp;Construction description&nbsp;Construction description&nbsp;Construction description&nbsp;Construction description&nbsp;</p>', 10, 1, '2022-02-24 07:19:51', '2022-02-24 07:19:51'),
(14, 'البناء البناء البناء البناء البناء البناء البناء البناء البناء البناء البناء', '<p>وصف البناء&nbsp;وصف البناء&nbsp;وصف البناءوصف البناءوصف البناءوصف البناءوصف البناءوصف البناء</p>', 10, 2, '2022-02-24 07:20:20', '2022-03-06 07:32:01'),
(17, 'teesst  teesst  teesst  teesst  teesst  teesst  teesst  teesst', '<p>teeest teeest</p>', 13, 2, '2022-03-06 07:33:17', '2022-03-06 07:34:36'),
(20, 'hospital', '<p>hospital</p>', 15, 1, '2022-04-12 07:16:23', '2022-04-12 07:16:23'),
(21, 'مستشفى', '<p>مستشفى</p>', 15, 2, '2022-04-12 07:17:04', '2022-04-12 07:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `service_section`
--

CREATE TABLE `service_section` (
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snapchat_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_accept` int(11) NOT NULL DEFAULT '1',
  `product_rating` int(11) NOT NULL DEFAULT '1',
  `product_outStock` int(11) NOT NULL DEFAULT '1',
  `discount_codes` int(11) NOT NULL DEFAULT '1',
  `product_purchases_count` int(11) NOT NULL DEFAULT '1',
  `similar_products` int(11) NOT NULL DEFAULT '1',
  `tax_on_product` int(11) NOT NULL,
  `tax_on_shipping` int(11) NOT NULL,
  `maintenance` tinyint(4) NOT NULL,
  `products_per_page_admin` int(11) NOT NULL,
  `products_per_page_website` int(11) NOT NULL,
  `minimum_products_stock_before_sms_notification` int(11) DEFAULT NULL,
  `product_notification_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_notification_msg` text COLLATE utf8mb4_unicode_ci,
  `chat_mode` int(11) NOT NULL,
  `chat_code` text COLLATE utf8mb4_unicode_ci,
  `whatsapp` int(11) NOT NULL,
  `mobile_whatsapp` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `points_mode` int(11) NOT NULL,
  `points_minimum` int(11) NOT NULL,
  `points_quantity` int(11) NOT NULL,
  `points_price` float(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `myfatoorah_type` enum('sandbox','live') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `myfatoorah_token` text COLLATE utf8mb4_unicode_ci,
  `show_brands` tinyint(1) NOT NULL DEFAULT '1',
  `show_our_features` tinyint(1) NOT NULL DEFAULT '1',
  `show_payment_gates` tinyint(1) NOT NULL DEFAULT '1',
  `show_social_icons` tinyint(1) NOT NULL DEFAULT '1',
  `captcha_enabled` int(11) NOT NULL DEFAULT '0',
  `terms_page` int(10) UNSIGNED DEFAULT NULL,
  `customer_count` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `projects_count` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branches_no` int(11) NOT NULL,
  `doctors_no` int(11) NOT NULL,
  `years_exp_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `email2`, `logo`, `facebook_url`, `instagram_url`, `twitter_url`, `youtube_url`, `snapchat_url`, `mail_url`, `phone1`, `phone2`, `work_time`, `description`, `order_accept`, `product_rating`, `product_outStock`, `discount_codes`, `product_purchases_count`, `similar_products`, `tax_on_product`, `tax_on_shipping`, `maintenance`, `products_per_page_admin`, `products_per_page_website`, `minimum_products_stock_before_sms_notification`, `product_notification_mobile`, `product_notification_msg`, `chat_mode`, `chat_code`, `whatsapp`, `mobile_whatsapp`, `points_mode`, `points_minimum`, `points_quantity`, `points_price`, `created_at`, `updated_at`, `myfatoorah_type`, `myfatoorah_token`, `show_brands`, `show_our_features`, `show_payment_gates`, `show_social_icons`, `captcha_enabled`, `terms_page`, `customer_count`, `experience`, `projects_count`, `branches_no`, `doctors_no`, `years_exp_no`) VALUES
(1, 'mahdyadel00@gmail.com', 'mahdy@gmail.com', 'abc.png', 'https://www.facebook.com/h', 'https://www.instgram.com/h', 'https://www.twitter.com/h', 'https://www.youtube.com/h', NULL, 'admin@email.com', '01122907742', '01065839463', '9:00 AM - 5:00 PM', '', 1, 1, 1, 1, 0, 1, 1, 1, 0, 45, 45, 3, '201021367387', 'تنبيه: متبقي 3 العرض', 1, '<!--Start of Tawk.to Script-->\r\n<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/62015d48b9e4e21181bde509/1fral8pi4\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>\r\n<!--End of Tawk.to Script-->', 1, '01122907742', 1, 1, 40, 1.00, NULL, '2022-06-24 14:06:50', 'live', NULL, 1, 1, 1, 1, 1, 4, '22', '15', '33', 15, 14, 13);

-- --------------------------------------------------------

--
-- Table structure for table `settings_data`
--

CREATE TABLE `settings_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenance_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maintenance_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_hours` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `setting_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings_data`
--

INSERT INTO `settings_data` (`id`, `title`, `description`, `keywords`, `maintenance_title`, `maintenance_message`, `footer_description`, `working_hours`, `lang_id`, `setting_id`, `created_at`, `updated_at`) VALUES
(1, 'الوكيل الذكي', 'الوكيل الذكي', 'الوكيل الذكي', 'مغلق للصيانة', 'نتاسف على ازعاجكم \r\nنحن نعمل من اجلكم نطور ونحسن من اجلكم لانكم انتم وقودنا..\r\nسنعود قريباً كونوا مستعدين', 'الوكيل الذكي', 'من السبت إلى الخميس من 7:30 صباحا إلى 1:45صباحا يوم الجمعة من 4 عصرا إلى 12 صباحا', 2, 1, NULL, '2022-06-17 13:21:39'),
(2, 'Smart Agent', 'Smart Agent', 'Smart Agent', '123', '123456', 'Smart Agent', 'Smart Agent', 1, 1, NULL, '2022-06-17 13:21:20');

-- --------------------------------------------------------

--
-- Table structure for table `site_article_category`
--

CREATE TABLE `site_article_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `published` tinyint(1) DEFAULT '0',
  `img_url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_article_category_data`
--

CREATE TABLE `site_article_category_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_blog_categories`
--

CREATE TABLE `site_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_blog_categories_data`
--

CREATE TABLE `site_blog_categories_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `blog_id` int(11) DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_pages`
--

CREATE TABLE `site_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `published` tinyint(1) DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` enum('header','footer','about_us','privacy','home') COLLATE utf8mb4_unicode_ci NOT NULL,
  `undeletable` tinyint(1) DEFAULT NULL,
  `page_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_pages`
--

INSERT INTO `site_pages` (`id`, `published`, `image`, `place`, `undeletable`, `page_order`, `created_at`, `updated_at`) VALUES
(4, 1, '/uploads/pages/1646046633about-us-inner-head.webp', 'footer', 1, 1, '2020-11-24 05:38:37', '2022-02-28 09:10:33'),
(5, 1, '/uploads/pages/16557809922.jpg', 'footer', 1, 2, '2020-12-15 18:32:24', '2022-06-21 01:13:46'),
(20, 1, '/uploads/pages/16557816993.jpg', 'footer', NULL, 5, '2022-02-28 07:55:29', '2022-06-21 01:24:22'),
(23, 1, '/uploads/blogs/1646049320help_black_24dp.webp', 'privacy', NULL, 5, '2022-02-28 09:55:20', '2022-02-28 09:55:20'),
(25, 0, '/uploads/blogs/164655519810311d4f4d87ba1722c9f2c730b9985f.png', 'header', NULL, 5, '2022-03-06 06:26:38', '2022-03-06 06:30:49'),
(32, 1, '/uploads/pages/1649755206contact-head-img.jpg', 'home', NULL, 5, '2022-04-12 07:19:04', '2022-04-12 07:20:06'),
(33, 1, '/uploads/blogs/16560814372.jpg', 'about_us', NULL, 5, '2022-06-24 12:37:17', '2022-06-24 12:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `site_pages_data`
--

CREATE TABLE `site_pages_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_pages_data`
--

INSERT INTO `site_pages_data` (`id`, `page_id`, `lang_id`, `source_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(6, 4, 2, NULL, 'الشروط والأحكام', '<p style=\"text-align: justify;\"><span style=\"font-size:24px;\"><strong>الشروط والأحكام</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>المقدمة :<br />\r\nشركة منصة &quot;سلتك&quot; هي شركة كويتية تهدف الي تمكين قطاع التجزئة في الكويت من الدخول الي عالم التجارة الالكترونية من خلال انشاء متجر الكتروني متكامل يساعد في التوسع جغرافياً وتوسيع النطاق الجغرافي للمنتجات مما يعزز في انتشار علامتك التجارية دون الحاجة الي تكاليف انشاء المحلات التجارية على ارض الواقع </strong>.</span></span></p>\r\n\r\n<p><br />\r\n<span style=\"font-size:24px;\"><strong>&bull; شروط انشاء المتجر الكتروني وفتح الحساب</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">&bull; يجب أن يكون عمرك 18 سنة أو أكثر حسب القوانيين والأنظمة في دولة الكويت<br />\r\n&bull; أن يكون نشاط المتجر من الأنشطة المسموح بمزاولتها داخل الكويت وفقا لجنسية الشريك والمدير وشروط وضوابط الجهات الرقابية<br />\r\n&bull; يجب عليك التسجيل في سلتك لاستخدام الخدمة والاستفادة منها عن طريق كتابة الاسم بشكل كامل كما يظهر في الأوراق الرسمية والعنوان الحالي ورقم الهاتف النقال وبريد إلكتروني صحيح وأي معلومة مطلوبة كما هو موضح، تطلب في نموذج التسجيل ويحق لـ سلتك رفض طلب إنشاء أي حساب ،كما يحق لـ سلتك انهاء الخدمة لأي سبب من الأسباب ودون سابق أنذار وفي أي وقت<br />\r\n&bull; يدفع المستخدم قيمة الرسوم المفروضة على اشتراكه في الخدمة قبل إنتهاء مدة أشتراكة بيوم واحد وأي رسوم أخرى مطلوبة بما في ذلك على سبيل المثال لا الحصر الرسوم المتعلقة بشراء أي منتجات أو خدمات مثل ترقية الباقة لباقة أعلى أو شراء رسائل الجوال أو شراء استايل للمتجر أو شراء / تجديد نطاق الدومين أو خدمات الطرف الثالث</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>&bull; منصة سلتك لاتقدم خدماتها الي :-</strong></span></p>\r\n\r\n<div class=\"flex-container flex-align-items-stretch flex-align-content-flex-start flex-full-width aps font-ember border-color-transparent decor-border--reg\" id=\"\" style=\"width:100%\">\r\n<div class=\"text align-end color-squidInk font-body font-b3\" style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>1. القمار واليانصيب والرهانات والمراهنة على المسابقات والسحوبات<br />\r\n2. الخمور والكحوليات ( ومشروبات الطاقة بأنواعها )<br />\r\n3. المخدّرات والسجائر ومستلزماتها<br />\r\n4. الأسلحة والذخائر والأدوات الحادة والخطرة<br />\r\n5. خدمات المواعدة والمرافقة والدردشة والزواج<br />\r\n6. خدمات الاستحواذ على العملاء وزيادة المتابعين الوهميين لمواقع التواصل الاجتماعي<br />\r\n7. المواد الإباحية والمنتجات الجنسية<br />\r\n8. التسويق المتعدد المستويات والتسويق الهرمي والتسويق الشبكي أو المتسلسل<br />\r\n9. بيع المنتجات أو الخدمات المُقلّدة<br />\r\n10. بيع أو توزيع أو انتهاك المواد ذات حقوق ملكية فكرية</strong></span></span></div>\r\n\r\n<div class=\"text align-end color-squidInk font-body font-b3\" style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>11. تداول العملات الأجنبية وتداول الأسهم<br />\r\n12. الخدمات المالية والبنكية<br />\r\n13. خدمات الاستثمار والائتمان والعملات الرقمية<br />\r\n14. المنتجات الطبية الغير مصرح بها من الجهات المختصة<br />\r\n15. خدمات جمع البيانات المرخّص لها والغير مرخّص لها<br />\r\n16. خدمات الجوّال / الاتصال عبر الإنترنت<br />\r\n17. البيع عن طريق الهاتف أو مراكز الاتصال<br />\r\n18. المجوهرات والساعات الثمينة<br />\r\n19. جمع التبرعات والأعمال الخيرية والتمويل الجماعي</strong></span></span></div>\r\n\r\n<div class=\"text align-end color-squidInk font-body font-b3\" style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>20. الأغاني والافلام والشيلات</strong></span></span></div>\r\n</div>\r\n\r\n<p><br />\r\n<span style=\"font-size:24px;\"><strong>&bull; أسعار الخدمات والباقات المدفوعة المتوفرة في منصة سلتك 2 باقة ويتم دفع قيمة الاشتراك أو الخدمات مقدماً وهي قيمة غير مسترجعة :-</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:24px;\"><strong><span style=\"color:#20365f;\">&bull; نوع الباقة : سلتك جو &nbsp;</span></strong></span></li>\r\n	<li><span style=\"font-size:12px;\"><span style=\"color:#ff0000;\"><strong>شاملة دومين مجاني ( أختياري )مع خصم 7 د.ك للدفع السنوي</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><strong>13 د.ك شهري&nbsp; -&nbsp; 149 د.ك سنة واحدة<span style=\"color:#20365f;\">&nbsp; </span></strong></span></li>\r\n	<li><span style=\"font-size:24px;\"><strong><span style=\"color:#20365f;\">&bull; نوع الباقة : سلتك برو</span></strong></span>&nbsp;&nbsp;</li>\r\n	<li><span style=\"font-size:12px;\"><span style=\"color:#ff0000;\"><strong>شاملة دومين مجاني ( أختياري ) مع خصم 9 د.ك للدفع السنوي</strong></span></span></li>\r\n	<li><span style=\"font-size:18px;\"><strong>29 د.ك شهري&nbsp; -&nbsp; 339 د.ك سنة واحدة</strong></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">&bull; تجديد دومين المتجر يشمل سعر الباقة ويتم تجديدة من خلال منصة سلّتك فقط.<br />\r\n&bull; جميع التصاميم المعروضة في منصة سلتك تم تصميمها من خلال فريق عمل سلتك وكل باقة لها تصميم مخصص لها ضمن الباقة .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>&bull; أسعار الرسائل النصية :- خاصة بالشبكات داخل الكويت فقط</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<ul>\r\n	<li style=\"text-align: justify;\"><span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">500 نقطة بقيمة 7 د.ك صالحة لمدة سنتين</span></strong></span></li>\r\n	<li style=\"text-align: justify;\"><span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">1000 نقطة بقيمة 13 د.ك صالحة لمدة سنتين</span></strong></span></li>\r\n	<li style=\"text-align: justify;\"><span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">3000 نقطة بقيمة 36 د.ك صالحة لمدة سنتين</span></strong></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>&bull; أسعار استخدام الخدمات والباقات غير ثابتة وقابلة للتغيير على أن يتم إشعار المستخدم قبل ٣٠ يوما. ويمكن تقديم هذا الإخطار في أي وقت عن الموقع الالكترونية / التطبيق أو عن طريق مراسلة العملاء (sallatk.com) طريق بالبريد الالكتروني أو من خلال نشر التغييرات على موقع سلّتك<br />\r\n&bull; المستخدم هو المسؤول عن جميع الأنشطة والمحتويات كالبيانات والرسومات والصور والروابط التي يتم تحميلها تحت حسابه في سلتك (&ldquo;محتوى المتجر&rdquo;). وينبغي عدم نقل أي فاي روس أو ديدان حاسوبية أو أي رموز ذات طبيعة مدمرة كما أن منصة سلتك غير مسؤولة عن أي عملية قرصنة<br />\r\n&bull; المستخدم هو المسؤول عن حفظ كلمة المرور الخاصة به آمنة. كما أن سلتك غير مسؤولة عن أي خسارة أو ضرر يقع نتيجة للنسيان وعدم الحفاظ على أمن الحساب وكلمة المرور<br />\r\n&bull; إن مهمة منصة سلتك هي مجرد تقديم أدوات الدعم الالكتروني، عن طريق تأسيس المتجر، حيث أن التزام منصة سلتك بموجب هذه الاتفاقية هو فقط انشاء المتجر الالكتروني الخاص بالتاجر لدى منصة سلتك الالكترونية، ووضع المتجر أمام المستخدمين<br />\r\n&bull; إن جميع التعاملات التي تتم بين التاجر والمستهلك لا علاقة لها بشخص منصة سلتك، ومنصة سلتك غير مسئولة عنها، حيث أن هذا التعامل هو علاقة تعاقدية مستقلة تخضع للاتفاق الذي يبرم بين التاجر والمستهلك. وبناءً عليه فإذا تخلّف المستهلك عن سداد ثمن الخدمة أو المنتج الذي يوفّره التاجر فلا علاقة لمنصة سلتك بهذه المخالفات<br />\r\n&bull; أنت تعلم أن منصة سلتك تعتبر منصة إلكترونية تقنية على شبكة الانترنت تتيح للتاجر الذي يوافق على هذه الاتفاقية تأسيس متجره الالكتروني ، وممارسة نشاطه عبر المتجر ، ومهمتها تنتهي عند هذا الحد. فليس هناك أدنى مسئولية على منصة سلتك حول المخالفات التي يقوم بها التاجر في متجره بالمخالفة لأحكام هذه الاتفاقية، وليس لمنصة سلتك أي علاقة بالنسبة للتعاملات التي تتم بين التاجر والمستهلك<br />\r\n&bull; في حالة كان التاجر المتقدّم لطلب الانضمام وتأسيس المتجر عبارة عن تاجر فرد &ldquo;شخص طبيعي&rdquo;، فيلتزم كذلك بالتحقق من الاشتراطات المطلوبة لدى الجهات الرسمية وتوفيرها بحسب طبيعة نشاط الفرد التاجر، حيث أن التاجر الفرد يقر بأنه ملتزم بهذه الاشتراطات وملتزم بتوفيرها وتجهيزها، كما يلتزم التاجر الفرد بتوفير رقم هويته الوطنية وغير ذلك من المعلومات اللازمة والوثائق التي<br />\r\nتطلبها منصة سلتك<br />\r\n&bull; في حالة كان التاجر المتقدم لطلب الانضمام وتأسيس متجره يمثل مؤسسة تجارية أو شركة أو مؤسسة خيرية أو جهة اعتبارية فلابُد من تزويد منصة سلتك بكافة المعلومات والوثائق الثبوتية، مثل السجل التجاري وأي وثائق أخرى للمتجر تطلبها منصة سلتك للتسجيل ولإثبات الشخصية القانونية الخاصة بالمتجر<br />\r\n&bull; يحق لـ سلتك إزالة محتوى المتجر والحسابات التي تتضمن محتوى تراه سلتك وفقًا لتقديرها الخاص غير قانوني أو مسيء أو يحتوي على تهديد أو تشهير أو قذف أو تروج لأعمال اباحية وفاحشة أو محتويات غير مرغوب فيها بأي شكل من الأشكال أو ينتهك الملكية الفكرية لأي طرف أو يخالف شروط الاستخدام</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>&bull; خدمات الطرف الثالث :- بوابات الدفع - خدمات الشحن والتوصيل - رسائل الهاتف النقال - نطاق الدومين</strong></span></p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>&bull; إن جميع التعاملات التي تتم بين التاجر ومزودي الخدمات ( خدمات الطرف الثالث ) الذين توفر منصة سلتك الربط مع خدماتهم أو عرض خدماتهم ليستفيد منها التاجر والمستهلك لا علاقة لها بمنصة سلتك ، حيث أن هذا التعامل هو علاقة تعاقدية مستقلة عن منصة سلتك وخاضعة للاتفاق المبرم بين التاجر ومزود الخدمة ، وبناءً عليه فإذا تخلّف أو امتنع أو لم يلتزم أحد الاطراف في تنفيذ<br />\r\nالتزاماته التي جرى الاتفاق عليها أو لم ينفذها على الوجه المطلوب فإن منصة سلتك غير مسئولة عن ما ينتج عن هذه التصرفات ، إن منصة سلتك غير مسئولة عن أي مخالفات تحدث أو يتم ارتكابها بين التاجر ومزود الخدمة .<br />\r\n&bull; بموجب قواعد وأحكام اتفاقية الاستخدام هذه فإن منصة سلتك قدّ توفّر بعض الخدمات الإستراتيجية أو اللوجستية عن طريق طرف ثالث أو أطراف ثالثة وقد تكون هذه الخدمات على سبيل المثال لا الحصر : خدمات شركات الشحن وبوابات الدفع الالكتروني وتوصيل المنتجات والبضائع<br />\r\n&bull; تحيطكم منصة سلتك علمًا بأن توفيرها للخدمات الإستراتيجية أو اللوجستية ليس إلا تسهيلًا وتعاونًا منها ولمساعدة مستخدمين منصة سلتك وهي غير ملزمة بذلك وتتطلب منها موافقة بموجب كتاب يقدم لها .<br />\r\n&bull; تحيطكم علمًا منصة سلتك بأنها غير مسئولة تمامًا بشكل مباشر أو غير مباشر عن أي تصرفات تصدُر من أي طرف ثالث وأن ما تقوم به هو مجرد ربط بين المستخدم ومُقدِم الخدمة الطرف الثالث<br />\r\n&bull; تحيطكم علمًا منصة سلتك بأن طلب هذه الخدمة غير إلزامي وإنما يعود هذا الأمر إلى رغبة وحاجة المستخدم، وعند استخدام التاجر لخدمات الطرف الثالث المتوفّر لدى منصة سلتك فإن منصة سلتك تخلي مسئوليتها عن هذه العلاقة وتكون لهذه العلاقة أحكامها المستقلة التي تتم بين التاجر وبين الطرف الثالث .<br />\r\n&bull; إن بعض مقدمين الخدمات الإستراتيجية واللوجستية يضعون اشتراطات خاصة بهم أو تكاليف خاصة بهم ولا تملك منصة سلتك أي سلطة على هذه الاشتراطات أو هذه التكاليف ، ولذلك تنصح منصة سلتك التجّار المسجّلين لديها إلى الاطلاع على شروط مقدم الخدمة ( الطرف الثالث ) وتكاليف خدماته قبل تأكيد طلب الخدمة .<br />\r\n&bull; في حال تقدّم المستخدم بطلب خدمة مقدّمة عن طريق ( طرف ثالث ) فإن المستخدم بهذا التصرّف يصرّح لمنصة سلتك ويمنحها الإذن بتزويد مقدم الخدمة ( الطرف الثالث ) ببيانات المستخدم الشخصية التي يطلبها ، وغير ذلك من البيانات التي يحتاجها مقدّم الخدمة ( الطرف الثالث ) ، ويكون ذلك وفقاً لقواعد وأحكام سياسة الخصوصية وسرية المعلومات المعمول بها لدى منصّة سلتك .</strong></span></span></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:18px;\"><strong>منصة سلّتك تتمنى لكم<br />\r\nتجارة الكترونية ناجحة</strong></span></p>', '2020-11-24 05:38:37', '2021-06-18 02:39:31'),
(7, 5, 2, NULL, 'الاهداف', '<p style=\"text-align: right;\"><span style=\"font-size:24px;\"><strong>الاهداف</strong></span></p>\r\n\r\n<p style=\"text-align: right;\"><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>⦁&nbsp;&nbsp; &nbsp;الإلمام بماهية البيانات الضخمة، وأنواعها ومصادرها، وأهمية تحليلها.<br />\r\n⦁&nbsp;&nbsp; &nbsp;التعرف على برنامج Orange Data Mining، ومكوناته، ومهارات التعامل معه.<br />\r\n⦁&nbsp;&nbsp; &nbsp;التمكن من مهارات التعامل مع البيانات الضخمة لدى طلاب برنامج STEM.<br />\r\n⦁&nbsp;&nbsp; &nbsp;التمكن من مهارات تمثيل البيانات لدى طلاب برنامج STEM.<br />\r\n⦁&nbsp;&nbsp; &nbsp;التمكن من مهارات تصنيف البيانات لدى طلاب برنامج STEM.<br />\r\n⦁&nbsp;&nbsp; &nbsp;التمكن من مهارات تحليل البيانات لدى طلاب برنامج STEM.<br />\r\n⦁&nbsp;&nbsp; &nbsp;التمكن من مهارات التنبؤ بالبيانات لدى طلاب برنامج STEM.</strong></span></span></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', '2020-12-15 18:32:24', '2022-06-21 01:12:01'),
(8, 6, 2, NULL, 'الأسئلة الشائعة', '<p><span style=\"font-size:24px;\"><strong>الأسئلة الشائعة</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>هل لديك أي أسئلة لم يتم ذكرها هنا في صفحة الأسئلة الشائعة .؟ تواصل معنا من خلال الواتساب +96555494522</strong></span><br />\r\n&nbsp;<br />\r\n<span style=\"font-size:24px;\"><strong>* خطوات التسجيل والأشتراك .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- 1- أختر الباقة المناسبة لك حسب نشاطك التجاري وقم بتعبئة نموذج الطلب 2- أختر دومين ينتهي بـ دوت كوم مجاناً 3- أشترك مع خدمة الدفع الالكتروني والتركيب مجاني 4- أنشر متجرك في مواقع التواصل لأستقبال الطلبات </strong></span></span><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يوجد شرح للوحة التحكم .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- نعم توجد شروحات على الاونلاين تشرح أستخدام لوحة التحكم من خلال قناتنا على اليوتيوب</strong></span></span> <span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>بالأضافة الي الدعم الفني المتواجد من خلال الشات داخل لوحة التحكم للمساعدة .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻛﻢ ﻋﺪد الباقات ﻟﺪﻳﻜﻢ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- ﻓﻲ ﻣﻨﺼﺔ ﺳﻠﺘﻚ ﻳﻮﺟﺪ 3 ﺑﺎﻗﺎت اﻟﺒﺎﻗﺔ اﻻﺳﺎﺳﻴﺔ ( مجانية ) - باقة سلتك جو ( مدفوعة ) - باقة سلتك برو ( مدفوعة ) ، ﻛﻞ ﻣﻦ ﻫﺬه اﻟﺒﺎﻗﺎت ﻟﻬﺎ ﻣﻴﺰات ﺧﺎﺻﺔ وﻣﻨﺎﺳﺒﺔ ﻷﻧﻮاع ﻣﺨﺘﻠﻔﺔ ﻣﻦ ﻣﺴﺘﺨﺪﻣﻲ اﻟﺘﺠﺎرة اﻻﻟﻜﺘﺮوﻧﻴﺔ ، مقارنة المميزات من خلال صفحة الأسعار .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل تتوفر تجربة مجانية للباقات المدفوعة .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- 1- نعم توجد فترة سماح تجريبية للمميزات ولمدة شهر من غير بوابة دفع الكترونية ويمكنك من خلالها تجربة وتجهيز متجرك الالكتروني قبل أنطلاقة ، وتذكر أن سلتك لاتوفر خدمة استرجاع المبلغ </strong></span></span><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل تتوفر الخدمة في بلدي .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- المركز الرئيسي لمنصة سلتك هو دولة الكويت ويمكن لفريقنا التقني تقديم الحلول التقنية و الدعم الفني لجميع عملائنا عبر وسائل التواصل الموضحة والمتوفرة في سلتك بكل سهولة وراحة تامة </strong></span></span><span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻛﻴﻒ يمكنني الأشتراك ﻓﻲ اﺣﺪى اﻟﺒﺎﻗﺎت المدفوعة .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- يمكنك ترقية الباقة من ﺧﻼل ﻟﻮﺣﺔ اﻟﺘﺤﻜﻢ اﻟﺨﺎﺻﺔ ﺑﻚ وأﺧﺘﻴﺎر ﻧﻄﺎق ﺧﺎص ﺑﻚ وﺑﺴﻬﻮﻟﺔ ﺗﺎﻣﺔ بعدها قم بأضافة رابط متجرك في البايو الخاص بك في مواقع التواصل لأستقبال طلباتك .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻛﻢ ﻣﺪة اﺷﺘﺮاك اﻟﺒﺎﻗﺎت ﻟﺪﻳﻜﻢ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- ﻓﻲ اﻟﺒﺎﻗﺔ اﻟﻤﺠﺎﻧﻴﺔ ﻻﻳﻮﺟﺪ ﻟﻬﺎ وﻗﺖ اﻣﺎ اﻟﺒﺎﻗﺎت اﻟﻤﺪﻓﻮﻋﺔ ﻓﻴﻤﻜﻨﻚ أﺧﺘﻴﺎر ﻃﺮﻳﻘﺔ اﻻﺷﺘﺮاك واﻟﺪﻓﻊ ، شهر أو سنة حسب رغبتك ، وفرنا لكم في ( الباقات السنوية خصم )</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻫﻞ ﻳﻤﻜﻦ ﻧﻘﻞ متجري اﻟﻲ ﺷﺮﻛﺔ أﺧﺮى .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- ﻻ ﻳﻤﻜﻦ ، ﻧﻘﻞ متجرك اﻟﻲ شركة أﺧﺮى ، ﺟﻤﻴﻊ ﺧﻄﻄﻨﺎ ﺗﺄﺗﻲ ﻣﻊ اﺳﺘﻀﺎﻓﺔ وﻳﺐ ﺧﺎﺻﺔ ﺑﻬﺎ ، ﻣﻊ اﻟﺘﺄﻛﺪ ﻣﻦ أن ﻣﻮﻗﻊ اﻟﻮﻳﺐ اﻟﺨﺎص ﺑﻚ ﻣﺆﻣﻦ وﻣﺘﻮﻓﺮ ﻃﻮال اﻟﻮﻗﺖ.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* لدي نطاق ( Domain ) خاص هل يمكنني ربطه معكم .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- نعم يمكنك ذلك وبكل سهولة كل ماعليك فعله هو ربط النطاق الخاص بك بالـ DNS الخاص بالسيرفرات لدينا وسيتم التفعيل خلال 24 ساعة أو اقل ولمزيد من المعلومات اكثر أو المساعدة تواصل معنا على واتساب رقم +96555494522 .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻛﻴﻒ ﻳﻤﻜﻦ إﻟﻐﺎء اﻻﺷﺘﺮاك .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- ﻧﻌﻢ ﻳﻤﻜﻨﻚ اﻻﻟﻐﺎء أو إيقاف اشتراكك أو حذف متجرك ﻓﻲ أي وﻗﺖ وﻷي ﻇﺮف من خلال لوحة التحكم الخاص بك وﻟﻜﻦ ﺳﻠﺘﻚ ﻻﺗﻮﻓﺮ ﺧﺪﻣﺔ اﺳﺘﺮﺟﺎع اﻟﻤﺒﻠﻎ .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻫﻞ ﻳﻤﻜﻦ إﻧﺸﺎء ﻣﺘﺠﺮ اﻟﻜﺘﺮوﻧﻲ ﻣﺠﺎﻧﻲ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- ﻧﻌﻢ ﻳﻤﻜﻨﻚ ﻓﺘﺢ ﻣﺘﺠﺮ اﻟﻜﺘﺮوﻧﻲ ﻣﺪﻋﻮم ﺑﺮاﺑﻂ ﻣﻨﺼﺔ ﺳﻠﺘﻚ ﻣﺠﺎﻧﺎ وﻓﻲ ﺣﺎل رﻏﺒﺖ ﻓﻲ ﺑﺎﻗﺔ ﻣﺪﻓﻮﻋﺔ يمكنك ذلك من خلال ترقية الباقة الخاصة بك وأختيار الميزات الأنسب لمشروعك التجاري .</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻫﻞ ﻳﻤﻜﻦ ﺗﺮﻗﻴﺔ اﻟﺒﺎﻗﺔ أو ﺗﻐﻴﺮ اﻟﺒﺎﻗﺔ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- ﻧﻌﻢ ﻳﻤﻜﻦ ذﻟﻚ ﻓﻲ ﺟﻤﻴﻊ اﻟﺒﺎﻗﺎت اﻟﻤﺪﻓﻮﻋﺔ , وﻟﻜﻦ ﻻﻳﻤﻜﻨﻚ اﻟﺮﺟﻮع اﻟﻲ اﻟﺒﺎﻗﺔ اﻟﻤﺠﺎﻧﻴﺔ .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل توجد رسوم أضافية .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- نعم عند طلب خدمة خاصة بخدمات الطرف الثالث مثل شراء رسائل الجوال SMS , أو رسوم خدمات التوصيل والشحن , أو رسوم عمليات الدفع الالكتروني</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* ﻫﻞ ﻳﻤﻜﻦ أﺧﺬ ﻧﺴﺨﺔ ﻣﻦ ﻣﻮﻗﻌﻲ .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#20365f;\"><strong>- ﻻﻳﻤﻜﻦ ، وﻻﺗﺤﺘﺎج اﻟﻲ ﻧﺴﺨﺔ ﻓﺠﻤﻴﻊ ﻣﺎﺗﺤﺘﺎج ﻣﻌﺮﻓﺘﺔ ﻳﻤﻜﻨﻚ اﻟﺮﺟﻮع ﻟﻪ ﺑﻮاﺳﻄﺔ ﻟﻮﺣﺔ اﻟﺘﺤﻜﻢ اﻟﺨﺎﺻﺔ ﺑﻚ</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل تتوفر لديكم خدمة التوصيل والشحن .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- لا ، ولكن يمكنك أضافة أسعار التوصيل والشحن الخاصة بك وبمندوب متجرك ، وأيضاً يمكنك الربط مع شركات الشحن والتوصيل حسب رغبتك من خلال لوحة متجرك .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل منصة سلتك تأخذ عمولة على المبيعات .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- لا , العمولة التي يتم خصمها منك هي رسوم خاصة في شركات الدفع الالكتروني وليس لمنصة سلتك أي نسبة منها .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يمكنني التحكم في الوان متجري .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- نعم يمكنك التعديل على الالوان والتحكم بها حسب البراند الخاص في هويتك التجارية .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يمكنني إنشاء طلب للعميل .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- نعم يمكن ذلك من خلال لوحة تحكم متجرك وايضا تستطيع التعديل على الطلبات .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يتوفر نظام محاسبي في متجري .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- نعم توجد احصائيات شاملة عن المبيعات يومية ، أسبوعية , شهرية , سنوية جاهزة ومنظمة في أي تاريخ تطلبه .</span></strong></span></p>\r\n\r\n<p><span style=\"font-size:24px;\"><strong>* هل يشترط وجود سجل تجاري للأفراد للتسجيل في منصة سلتك .؟</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong><span style=\"color:#20365f;\">- لا يشترط وجود سجل تجاري للمتجر للإفراد ، ولكن يفضّل وجود سجل تجاري لحفظ هويتك واعتمادها ولزيادة موثوقية العملاء لمتجرك</span></strong></span></p>', '2020-12-15 18:34:20', '2021-02-11 05:18:59'),
(9, 4, 1, NULL, 'Terms and Conditions', '<p dir=\"ltr\"><strong>Terms and conditions</strong></p>\r\n\r\n<p dir=\"ltr\">Introduction:</p>\r\n\r\n<p class=\"tw-data-text tw-text-large XcVN5d tw-ta\" data-placeholder=\"الترجمة\" dir=\"ltr\" id=\"tw-target-text\" style=\"text-align: left;\">The &quot;Sallatk&quot; platform company is a Kuwaiti company that aims to enable the retail sector in Kuwait, the Gulf and the Arab world to enter the world of e-commerce by establishing an integrated online store that helps in expanding geographically and expanding the geographical range of products, thus enhancing the spread of your brand without the need for the costs of establishing stores Commercial on the ground.</p>\r\n\r\n<p dir=\"ltr\"><strong>&bull; Conditions for setting up an online store and opening the account.</strong></p>\r\n\r\n<p dir=\"ltr\">&bull; You must be 18 years of age or older depending on the laws and regulations of Kuwait and by country.<br />\r\n&bull; The activity of the store must be one of the activities allowed to be conducted within Kuwait in accordance with the nationality of the partner and the manager and the conditions and controls of the regulators according to each country.<br />\r\n&bull; You must register in your Sallatk to use the service and benefit from it by writing the name in full as shown in the official papers, current address, mobile phone number, correct email and any information required as described, requested in the registration form and your Sallatk may refuse to request the creation of any account, and Sallatk has the right to terminate the service for any reason and without prior warning and at any time.<br />\r\n&bull; The user pays the fee charged for his subscription to the service one day before the end of the subscription period and any other fees required including but not limited to the fees related to the purchase of any products or services such as upgrading the package to a higher package, buying mobile messages, buying style for the store or buying/renewing the domain domain or third party services.</p>\r\n\r\n<p dir=\"ltr\"><br />\r\n<strong>&bull; Sallatk platform does not provide its services to : -</strong></p>\r\n\r\n<p dir=\"ltr\">1. Gambling, lotteries, bets, betting on competitions and draws<br />\r\n2. Liquor and alcohol (and energy drinks of all kinds)<br />\r\n3. Drugs, cigarettes and supplies<br />\r\n4. Weapons, ammunition and sharp and dangerous objects<br />\r\n5. Dating, escort, chat and marriage services<br />\r\n6. Customer acquisition services and increased fake followers of social networking sites<br />\r\n7. Pornography and sexual products<br />\r\n8. Multi-level marketing, pyramid marketing, network marketing or serial marketing<br />\r\n9. Selling counterfeit products or services<br />\r\n10. Sale, distribution or violation of intellectual property rights materials<br />\r\n11. Forex trading and stock trading<br />\r\n12. Financial and Banking Services<br />\r\n13. Investment, credit and cryptocurrency services<br />\r\n14. Medical products not authorized by the competent authorities<br />\r\n15. Licensed and unlicensed data collection services<br />\r\n16. Mobile Services / Internet Connectivity<br />\r\n17. Selling by phone or call centers<br />\r\n18. Precious Jewelry and Watches<br />\r\n19. Fundraising, philanthropy and crowdfunding<br />\r\n20. Songs, Movies and Shilat</p>\r\n\r\n<p dir=\"ltr\"><br />\r\n&bull; Prices of paid services and packages available on the Sallatk platform 2 packages and the payment of subscription or services in advance is an unrecovered value:-.<br />\r\n&bull; Package type: Sallatk Go. 13 K.D Monthly - K.D. 149 One Year Inclusive Of Free Domain Receives&nbsp; 7 K.D Discount for Annual Payment.<br />\r\n&bull; Package type: Sallatk Pro. 29 K.D Monthly - 339 K.D One Year Inclusive Of Free Domain Receives&nbsp; 9 K.D Discount for Annual Payment.<br />\r\n&bull; Domain Store renewal includes the price of the package and is renewed through the Sallatk platform only.<br />\r\n&bull; All designs displayed in the Sallatk platform are designed by the Sallatk team and each package has a custom design within the package.<br />\r\n&bull; Sms prices:- <strong>Kuwait networks only</strong><br />\r\n. 500 letters worth KD 7 valid for two years<br />\r\n. 1000 letters worth KD 13 valid for two years<br />\r\n. 3000 letters worth KD 36 valid for two years.<br />\r\n&bull; Rates for the use of services and packages are not fixed and subject to change, with the user notified 30 days in advance. This notification can be provided at any time about the website/app or by emailing customers (sallatk.com) or by posting changes to the Sallatk website.<br />\r\n&bull; The user is responsible for all activities and content such as data, graphics, images and links uploaded under their Sallatk account (&quot;Store Content&quot;). No Phi-Ross, computer worms or symbols of a destructive nature should be transported.<br />\r\n&bull; The user is responsible for keeping their password secure. Sallatk is not responsible for any loss or damage caused by forgetting and not maintaining account and password security.<br />\r\n&bull; The mission of The Sallatk Platform is simply to provide electronic support tools, by establishing the store, as the commitment of the Sallatk platform under this agreement is only to create the merchant&#39;s online store at the Sallatk electronic platform, and to put the store in front of users.<br />\r\n&bull; All transactions between the trader and the consumer have nothing to do with the person of the Sallatk platform, and the Sallatk platform is not responsible for it, as this transaction is an independent contractual relationship subject to the agreement between the trader and the consumer. Accordingly, if the consumer fails to pay for the service or product provided by the merchant, the Sallatk platform has nothing to do with these irregularities.<br />\r\n&bull; You know that Sallatk is a technical electronic platform on the internet that allows the trader who agrees to this agreement to establish his online store, and to practice his activity across the store, and its mission ends thereby. There is no liability on the Sallatk platform for the irregularities that the trader in his store makes in violation of the terms of this agreement, and Sallatk has nothing to do with transactions between the trader and the consumer.<br />\r\n&bull; In the event that the applicant is a &quot;natural person&quot; trader, the trader is also obliged to verify and provide the requirements required by the official authorities according to the nature of the trader&#39;s activity, as the individual trader acknowledges that he is complying with these requirements and is committed to providing and processing them, and the individual trader is obliged to provide his national identity number and other necessary information and documents. It&#39;s ordered by your Sallatk platform.<br />\r\n&bull; If the applicant merchant is a business, company, charity or legal entity, the Sallatk platform must be provided with all information and documentary documents, such as the commercial register and any other documents of the store requested by the Sallatk registration platform and to prove the store&#39;s legal identity.<br />\r\n&bull; Sallatk has the right to remove the content of the Store and accounts that contain content deemed illegal, offensive, threatening, defamatory, defamatory, defamatory, promoting pornographic, obscene or unwanted content in any way, violating the intellectual property of any party or in violation of the terms of use.</p>\r\n\r\n<p dir=\"ltr\"><br />\r\n<strong>&bull; Third-party services: - payment gateways - shipping and delivery services - mobile messages - domain range.</strong></p>\r\n\r\n<p dir=\"ltr\"><br />\r\n&bull; All transactions between the merchant and service providers (third party services) whoprovide the Sallatk platform to link with their services or offer their services to benefit the merchant and the consumer have nothing to do with the Sallatk platform, as this transaction is a contractual relationship independent of the Sallatk platform and subject to the agreement between the merchant and the service provider, and accordingly if one of the parties defaults or refrains or does not commit to the implementation of<br />\r\nIts obligations agreed or not implemented as required, The Sallatk Platform is not responsible for the consequences of these actions, the Sallatk platform is not responsible for any irregularities that occur or are committed between the merchant and the service provider.<br />\r\n&bull; Under the rules and provisions of this use agreement, The Sallatk Platform may provide some strategic or logistical services through a third party or third parties, such as but not limited to: shipping company services, electronic payment gateways and delivery of products and goods.<br />\r\n&bull; The Sallatk Platform takes note that its provision of strategic or logistics services is only facilitated and cooperated with it and to assist users of the Sallatk platform She is not obliged to do so and requires her approval under a book submitted to her.<br />\r\n&bull; You take note of the Sallatk platform that it is not fully or directly responsible for any actions issued by any third party and that what you are doing is merely a link between the user and the third party service provider.<br />\r\n&bull; Take note of the Sallatk platform that the request for this service is not mandatory, but this is due to the desire and need of the user, and when the trader uses the services of the third party available at The Sallatk platform, The Sallatk Platform disclaims responsibility for this relationship and this relationship has its own independent provisions that take place between the trader and the third party.<br />\r\n&bull; Some strategic and logistics service providers set their own requirements or costs and Sallatk does not have any authority over these requirements or costs, so Sallatk recommends that registered traders see the terms of the service provider (third party) and the costs of its services before confirming the service request.<br />\r\n&bull; In the event that the user submits a request for a service provided by (third party), the user of this behavior authorizes the Sallatk platform and gives it permission to provide the service provider (third party) with the personal user data requested by the service provider (third party), and this is in accordance with the rules and provisions of the privacy policy and the confidentiality of the information applicable to the Sallatk platform.</p>\r\n\r\n<p dir=\"ltr\">&nbsp;</p>\r\n\r\n<p dir=\"ltr\">Sallatk platform wishes you<br />\r\nSuccessful e-commerce</p>\r\n\r\n<p dir=\"ltr\">&nbsp;</p>', '2020-12-16 22:02:13', '2021-01-06 07:16:45'),
(10, 5, 1, NULL, 'Objectives', '<section>\r\n<p><img alt=\"\" src=\"images/about-us-inner-head.webp\" /></p>\r\n\r\n<p><strong><span style=\"color:#e67e22;\">Overview</span></strong></p>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &lsquo;Content here, content here&rsquo;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &lsquo;lorem ipsum&rsquo; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</section>\r\n\r\n<section>\r\n<p>A World-Class Industrial Zone</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s.</p>\r\n</section>\r\n\r\n<section>\r\n<p><span style=\"font-size:16px;\"><span style=\"color:#e67e22;\"><strong>Our Vision</strong></span></span></p>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &lsquo;Content here, content here&rsquo;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &lsquo;lorem ipsum&rsquo; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</section>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">&nbsp;</p>', '2020-12-16 22:25:57', '2022-06-21 01:12:58'),
(11, 6, 1, NULL, 'FAQs', '<p dir=\"ltr\">FAQs<br />\r\nDo you have any questions that are not mentioned here on the FAQ page? Connect with us through WhatsApp +96555494522<br />\r\n&nbsp;<br />\r\n<strong>* Registration and subscription steps ?</strong><br />\r\n- 1 - Choose the package that is right for you according to your business and fill out the application form 2 - Choose Domain ends with dot com free 3 - Subscribe with the service of electronic payment and installation free 4 - publish your store on the networksites to receive orders.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is there an explanation of the control panel ?</strong><br />\r\n- Yes there are explanations on the internet explaining the use of the control panel through our YouTube channel in addition to the technical support that is available through chat inside the control panel to help.</p>\r\n\r\n<p dir=\"ltr\"><strong>* How many packages do you have ?</strong><br />\r\n- On the Sallatk platform there are 3 basic packages (free) - Sallatk Go Package (Paid) - Sallatk Pro Package (Paid), each of these packages has special features and is suitable for different types of e-commerce users, comparing features through the price page.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is there a free experience of paid packages ?</strong><br />\r\n- Yes there is a trial grace period for the benefits and for a period of one month without an electronic payment portal and you can try and equip your e-store before starting, and remember that your Sallatk does not provide a refund service.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is the service available in my country ?</strong><br />\r\n- The main center of The Sallatk Platform is Kuwait and our technical team can provide technical solutions and technical support to all our customers through the means of communication described and available in your Sallatk with ease and complete convenience.</p>\r\n\r\n<p dir=\"ltr\"><strong>* How can I subscribe to one of the paid packages ?</strong><br />\r\n- You can upgrade the package through your control panel and choose your own range and easily then add the link to your store in your bio in the networking sites to receive your requests.</p>\r\n\r\n<p dir=\"ltr\"><strong>* How long do you have a package subscription ?</strong><br />\r\n- In the free package there is no time either paid packages you can choose the method of subscription and payment, month or year as you wish, and we save you in (annual discount packages)</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can my store be moved to another company ?</strong><br />\r\n- Can&#39;t move your store to another company, all our plans come with their own web hosting, making sure that your website is secure and available all the time.</p>\r\n\r\n<p dir=\"ltr\"><strong>* I have a special Domain domain can I link it with you ?</strong><br />\r\n- Yes you can do this and with ease all you have to do is link your domain to the DNS of our servers and will be activated within 24 hours or less and for more information or help contact us on WhatsApp +96555444522.</p>\r\n\r\n<p dir=\"ltr\"><strong>* How can I unsubscribe ?</strong><br />\r\n- Yes, you can cancel, stop or delete your store at any time and for any circumstances through your control panel, but your basket does not provide a refund service.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can i create a free online store ?</strong><br />\r\n- Yes, you can open an online store supported by the Sallatk platform link for free and if you want a paid package you can do so by upgrading your package and choosing the most suitable features for your business.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can i upgrade the package or change the package ?</strong><br />\r\n- Yes this can be done in all paid packages, but you can not refer to the free package.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Are there additional fees ?</strong><br />\r\n- Yes when requesting a service for third party services such as the purchase of mobile sms, delivery and shipping fees, or electronic payment fees</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can I take a copy of my site ?</strong><br />\r\n- You can&#39;t, you don&#39;t need a copy, everything you need to know you can refer to with your control panel</p>\r\n\r\n<p dir=\"ltr\"><strong>* Do you have a delivery and shipping service ?</strong><br />\r\n- No, but you can add your delivery and shipping prices and your shop rep, and also you can link with shipping and delivery companies as you wish through your shop board.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Does Sallatk take a commission on sales ?</strong><br />\r\n- No, the commission charged by you is a special fee in electronic payment companies and the Sallatk platform does not have any percentage of it.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can I control the colors of my store ?</strong><br />\r\n- Yes, you can modify and control the colors according to the brand in your business identity.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Can I create a customer order ?</strong><br />\r\n- Yes, this can be done through your store&#39;s control panel and you can also edit orders.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is there an accounting system in my store ?</strong><br />\r\n- Yes, there are comprehensive statistics on daily, weekly, monthly, annual sales ready and organized on any date you request.</p>\r\n\r\n<p dir=\"ltr\"><strong>* Is a commercial register required to register on the Sallatk platform ?</strong></p>\r\n\r\n<div class=\"tw-ta-container hide-focus-ring tw-nfl\" id=\"tw-target-text-container\" tabindex=\"0\">\r\n<p class=\"tw-data-text tw-text-large XcVN5d tw-ta\" data-placeholder=\"الترجمة\" dir=\"ltr\" id=\"tw-target-text\" style=\"text-align: left;\">- It is not required to have a commercial register for the store for individuals, but it is preferable to have a commercial register to preserve and approve your identity and to increase the reliability of customers for your store</p>\r\n</div>', '2020-12-16 22:32:40', '2021-02-11 05:20:06'),
(29, 20, 1, NULL, 'التعليمات', '<p style=\"text-align: right;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">(For the directed agent) </font></font><br />\r\n<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">⦁ Dear student, upon entering the digital platform, you must familiarize yourself with its contents and know its objectives, and then enter the pre-achievement test to measure the cognitive aspects of your big data analysis skills. </font></font><br />\r\n<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">⦁ After completing the pre-achievement test, go to study the educational content of big data; </font><font style=\"vertical-align: inherit;\">Which consists of five modules, each with specific objectives that must be viewed before studying the module. </font></font><br />\r\n<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">⦁ After completing the study of the module, perform its activity using some of the resources provided by the trainer in cooperation with the members of your group. </font></font><br />\r\n<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">⦁ You can request assistance from the Smart Agent at any stage of learning by pressing the &ldquo;Smart Agent&rdquo; button in the digital platform&rsquo;s interaction interfaces.</font></font></p>', '2022-02-28 07:55:29', '2022-06-21 01:24:02'),
(32, 20, 2, 29, 'التعليمات', '(الخاصة بالوكيل الموجه)\r\n⦁	يجب عليك عزيزي الطالب/ عزيزتي الطالبة فور الدخول للمنصة الرقمية التعرف على محتوياتها ومعرفة أهدافها، ومن ثم الدخول إلى الاختبار التحصيلي القبلي لقياس الجوانب المعرفية لمهارات تحليل البيانات الضخمة لديك.\r\n⦁	بعد الانتهاء من الاختبار التحصيلي القبلي انتقل لدراسة المحتوى التعليمي للبيانات الضخمة؛ والذي يتكون من خمسة مديولات لكل منها أهداف محددة لابد من الاطلاع عليها قبل دراسة الموديول.\r\n⦁	بعد الانتهاء من دراسة الموديول قم بأداء النشاط الخاص به مستعينًا ببعض المصادر المتاحة من قبل المدرب بالتعاون مع أفراد مجموعتك.\r\n⦁	يمكنك طلب المساعدة من الوكيل الذكي في أي مرحلة من مراحل التعلم بالضغط على زر \"الوكيل الذكي\" في واجهات تفاعل المنصة الرقمية.', '2022-02-28 08:44:40', '2022-06-21 01:22:33'),
(41, 23, 1, NULL, 'Customer Inquiry', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum</p>', '2022-02-28 09:55:21', '2022-02-28 09:55:21'),
(42, 23, 2, 41, 'استفسار العميل', '<p>لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد. لوريم إيبسوم</p>', '2022-02-28 09:56:09', '2022-02-28 09:56:09'),
(44, 25, 1, NULL, 'header page', '<p>header page decription&nbsp;</p>', '2022-03-06 06:26:40', '2022-03-06 06:26:40'),
(56, 32, 2, NULL, 'من نحن', '<p>من نحن&nbsp;</p>', '2022-04-12 07:19:04', '2022-04-12 07:19:04'),
(57, 32, 1, 56, 'we', '<p>we</p>', '2022-04-12 07:20:23', '2022-04-12 07:20:23'),
(58, 33, 2, NULL, 'test', 'test', '2022-06-24 12:37:17', '2022-06-24 12:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `site_ticket_categories`
--

CREATE TABLE `site_ticket_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_ticket_categories_data`
--

CREATE TABLE `site_ticket_categories_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ticket_category_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_ticket_category_users`
--

CREATE TABLE `site_ticket_category_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `status`, `url`, `published`, `image`, `logo`, `created_at`, `updated_at`, `store_id`) VALUES
(9, NULL, 'https://www.youtube.com/watch?v=w5CclWQ5pvw', 1, '/uploads/sliders/9/1650361179.png', NULL, '2022-04-05 11:11:09', '2022-04-19 07:39:39', NULL),
(13, NULL, 'http://s.localhost/new_sallatk/public/admin/settings/sliders', 1, '/uploads/sliders/13/1650361607.png', NULL, '2022-04-12 06:00:16', '2022-04-19 07:46:47', NULL),
(14, NULL, 'http://s.localhost/new_sallatk/public/admin/settings/sliders', 1, '/uploads/sliders/14/1650361612.png', NULL, '2022-04-12 07:23:22', '2022-04-19 07:46:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders_data`
--

CREATE TABLE `sliders_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `slider_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders_data`
--

INSERT INTO `sliders_data` (`id`, `slider_id`, `lang_id`, `source_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(20, 9, 1, NULL, 'test', 'test', '2022-04-05 11:11:09', '2022-04-05 11:11:09'),
(21, 9, 2, NULL, 'new test', 'test', '2022-04-05 11:11:10', '2022-04-06 05:50:20'),
(27, 13, 2, NULL, 'new slider', 'new slider', '2022-04-12 06:00:16', '2022-04-12 06:00:16'),
(28, 13, 1, 27, 'slider new', 'slider new', '2022-04-12 06:01:07', '2022-04-12 06:01:07'),
(30, 14, 2, NULL, 'سليدر', 'سليدر', '2022-04-12 07:23:22', '2022-04-12 07:23:22'),
(31, 14, 1, 30, 'slider two', 'slider two', '2022-04-12 07:24:01', '2022-04-12 07:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `quantity`, `user_id`, `details`, `order_id`, `created_at`, `updated_at`) VALUES
(258, 194, 6, 244, NULL, NULL, '2021-12-24 12:11:15', '2021-12-24 12:11:15'),
(259, 195, 4, 244, NULL, NULL, '2021-12-24 16:14:33', '2021-12-24 16:14:33'),
(263, 199, 5, 244, NULL, NULL, '2021-12-25 11:55:08', '2021-12-25 11:55:08'),
(266, 202, 5, 244, NULL, NULL, '2021-12-25 14:21:05', '2021-12-25 14:21:05'),
(272, 208, 17, 243, NULL, NULL, '2021-12-27 12:11:16', '2021-12-27 12:11:16'),
(273, 209, 12, 243, NULL, NULL, '2021-12-27 12:44:12', '2021-12-27 12:44:12'),
(274, 210, 17, 243, NULL, NULL, '2021-12-27 13:19:09', '2021-12-27 13:19:09'),
(275, 211, 6, 243, NULL, NULL, '2021-12-27 14:43:52', '2021-12-27 14:43:52'),
(276, 212, 6, 243, NULL, NULL, '2021-12-29 12:36:08', '2021-12-29 12:36:08'),
(277, 213, 6, 243, NULL, NULL, '2021-12-29 12:56:17', '2021-12-29 12:56:17'),
(278, 214, 6, 243, NULL, NULL, '2021-12-29 13:21:37', '2021-12-29 13:21:37'),
(279, 215, 10, 243, NULL, NULL, '2021-12-29 13:47:11', '2021-12-29 13:47:11'),
(280, 216, 6, 243, NULL, NULL, '2021-12-29 13:58:42', '2021-12-29 13:58:42'),
(281, 217, 10, 273, NULL, NULL, '2021-12-29 14:10:12', '2021-12-29 14:10:12'),
(282, 218, 6, 243, NULL, NULL, '2021-12-29 14:41:43', '2021-12-29 14:41:43'),
(283, 219, 5, 243, NULL, NULL, '2021-12-29 15:26:02', '2021-12-29 15:26:02'),
(284, 220, 8, 244, NULL, NULL, '2021-12-29 15:27:25', '2021-12-29 15:27:25'),
(285, 221, 6, 243, NULL, NULL, '2021-12-29 15:44:37', '2021-12-29 15:44:37'),
(286, 222, NULL, 243, NULL, NULL, '2021-12-29 16:05:57', '2021-12-29 16:05:57'),
(287, 223, 7, 243, NULL, NULL, '2021-12-29 16:29:29', '2021-12-29 16:29:29'),
(288, 224, 6, 243, NULL, NULL, '2021-12-29 16:55:09', '2021-12-29 16:55:09'),
(289, 225, 8, 244, NULL, NULL, '2021-12-29 17:18:42', '2021-12-29 17:18:42'),
(290, 226, 6, 243, NULL, NULL, '2021-12-29 17:19:13', '2021-12-29 17:19:13'),
(291, 227, 6, 243, NULL, NULL, '2021-12-29 17:35:04', '2021-12-29 17:35:04'),
(292, 228, 6, 243, NULL, NULL, '2021-12-29 17:55:17', '2021-12-29 17:55:17'),
(293, 229, 6, 243, NULL, NULL, '2021-12-30 13:22:59', '2021-12-30 13:22:59'),
(294, 230, 6, 243, NULL, NULL, '2021-12-30 13:37:49', '2021-12-30 13:37:49'),
(295, 231, 6, 243, NULL, NULL, '2021-12-30 13:50:02', '2021-12-30 13:50:02'),
(296, 232, 6, 243, NULL, NULL, '2021-12-30 14:03:33', '2021-12-30 14:03:33'),
(297, 233, 6, 243, NULL, NULL, '2021-12-30 14:21:31', '2021-12-30 14:21:31'),
(298, 234, 6, 243, NULL, NULL, '2021-12-30 14:41:53', '2021-12-30 14:41:53'),
(299, 235, 6, 243, NULL, NULL, '2021-12-30 14:52:47', '2021-12-30 14:52:47'),
(300, 236, 6, 243, NULL, NULL, '2021-12-30 15:13:35', '2021-12-30 15:13:35'),
(301, 237, 6, 243, NULL, NULL, '2021-12-30 15:31:46', '2021-12-30 15:31:46'),
(302, 238, 6, 243, NULL, NULL, '2021-12-30 15:46:49', '2021-12-30 15:46:49'),
(303, 239, 12, 244, NULL, NULL, '2021-12-30 15:55:55', '2021-12-30 15:55:55'),
(304, 240, 6, 243, NULL, NULL, '2021-12-30 15:59:47', '2021-12-30 15:59:47'),
(305, 241, 6, 243, NULL, NULL, '2021-12-30 16:21:37', '2021-12-30 16:21:37'),
(306, 242, 6, 243, NULL, NULL, '2021-12-30 16:31:38', '2021-12-30 16:31:38'),
(307, 243, 6, 243, NULL, NULL, '2021-12-30 16:43:44', '2021-12-30 16:43:44'),
(308, 244, 6, 243, NULL, NULL, '2021-12-30 16:54:51', '2021-12-30 16:54:51'),
(309, 245, 6, 244, NULL, NULL, '2021-12-30 16:55:23', '2021-12-30 16:55:23'),
(310, 246, 6, 243, NULL, NULL, '2021-12-30 17:09:03', '2021-12-30 17:09:03'),
(311, 247, 4, 244, NULL, NULL, '2021-12-30 17:23:03', '2021-12-30 17:23:03'),
(312, 248, 6, 243, NULL, NULL, '2021-12-30 17:27:20', '2021-12-30 17:27:20'),
(313, 249, 6, 243, NULL, NULL, '2021-12-30 17:41:31', '2021-12-30 17:41:31'),
(314, 250, 6, 243, NULL, NULL, '2021-12-30 17:56:33', '2021-12-30 17:56:33'),
(315, 251, 7, 244, NULL, NULL, '2021-12-30 18:02:33', '2021-12-30 18:02:33'),
(316, 252, 12, 243, NULL, NULL, '2021-12-30 18:10:02', '2021-12-30 18:10:02'),
(317, 253, 3, 244, NULL, NULL, '2021-12-30 18:51:51', '2021-12-30 18:51:51'),
(318, 254, 6, 243, NULL, NULL, '2021-12-31 10:34:23', '2021-12-31 10:34:23'),
(319, 255, 6, 243, NULL, NULL, '2021-12-31 10:44:06', '2021-12-31 10:44:06'),
(320, 256, 6, 243, NULL, NULL, '2021-12-31 11:02:55', '2021-12-31 11:02:55'),
(321, 257, 6, 243, NULL, NULL, '2021-12-31 11:11:15', '2021-12-31 11:11:15'),
(322, 258, 6, 243, NULL, NULL, '2021-12-31 11:21:50', '2021-12-31 11:21:50'),
(323, 259, 6, 243, NULL, NULL, '2021-12-31 11:32:39', '2021-12-31 11:32:39'),
(324, 260, 6, 243, NULL, NULL, '2021-12-31 11:42:06', '2021-12-31 11:42:06'),
(325, 261, 6, 243, NULL, NULL, '2021-12-31 11:52:58', '2021-12-31 11:52:58'),
(326, 262, 6, 243, NULL, NULL, '2021-12-31 12:07:43', '2021-12-31 12:07:43'),
(327, 263, 6, 243, NULL, NULL, '2021-12-31 12:22:03', '2021-12-31 12:22:03'),
(328, 264, 10, 243, NULL, NULL, '2021-12-31 12:36:02', '2021-12-31 12:36:02'),
(329, 265, 10, 243, NULL, NULL, '2021-12-31 12:45:44', '2021-12-31 12:45:44'),
(330, 266, 10, 243, NULL, NULL, '2021-12-31 12:58:21', '2021-12-31 12:58:21'),
(331, 267, 10, 243, NULL, NULL, '2021-12-31 13:12:02', '2021-12-31 13:12:02'),
(332, 268, 6, 243, NULL, NULL, '2021-12-31 13:23:15', '2021-12-31 13:23:15'),
(333, 269, 6, 243, NULL, NULL, '2021-12-31 13:32:02', '2021-12-31 13:32:02'),
(334, 270, 6, 243, NULL, NULL, '2021-12-31 13:44:10', '2021-12-31 13:44:10'),
(335, 271, 7, 243, NULL, NULL, '2021-12-31 13:52:14', '2021-12-31 13:52:14'),
(336, 272, 6, 243, NULL, NULL, '2021-12-31 14:02:29', '2021-12-31 14:02:29'),
(337, 273, 6, 243, NULL, NULL, '2021-12-31 14:12:44', '2021-12-31 14:12:44'),
(338, 274, 6, 243, NULL, NULL, '2021-12-31 14:30:41', '2021-12-31 14:30:41'),
(339, 275, 6, 243, NULL, NULL, '2021-12-31 14:41:07', '2021-12-31 14:41:07'),
(340, 276, 6, 243, NULL, NULL, '2021-12-31 14:50:06', '2021-12-31 14:50:06'),
(341, 277, 4, 244, NULL, NULL, '2021-12-31 14:52:18', '2021-12-31 14:52:18'),
(342, 278, 6, 243, NULL, NULL, '2021-12-31 15:03:28', '2021-12-31 15:03:28'),
(343, 279, 6, 243, NULL, NULL, '2021-12-31 15:27:16', '2021-12-31 15:27:16'),
(344, 280, 1, 243, NULL, NULL, '2021-12-31 15:35:35', '2021-12-31 15:35:35'),
(345, 281, 6, 243, NULL, NULL, '2021-12-31 15:53:37', '2021-12-31 15:53:37'),
(346, 282, 6, 243, NULL, NULL, '2021-12-31 16:09:00', '2021-12-31 16:09:00'),
(347, 283, 6, 243, NULL, NULL, '2021-12-31 16:18:47', '2021-12-31 16:18:47'),
(348, 284, 6, 243, NULL, NULL, '2021-12-31 16:27:37', '2021-12-31 16:27:37'),
(349, 285, 6, 243, NULL, NULL, '2021-12-31 16:47:23', '2021-12-31 16:47:23'),
(350, 286, 6, 243, NULL, NULL, '2021-12-31 17:05:27', '2021-12-31 17:05:27'),
(351, 287, 6, 243, NULL, NULL, '2021-12-31 17:18:08', '2021-12-31 17:18:08'),
(352, 288, 9, 244, NULL, NULL, '2021-12-31 17:33:48', '2021-12-31 17:33:48'),
(353, 289, 6, 243, NULL, NULL, '2021-12-31 17:36:04', '2021-12-31 17:36:04'),
(354, 290, 6, 243, NULL, NULL, '2021-12-31 17:51:59', '2021-12-31 17:51:59'),
(355, 291, 12, 244, NULL, NULL, '2021-12-31 18:10:56', '2021-12-31 18:10:56'),
(356, 292, 6, 244, NULL, NULL, '2022-01-01 12:10:29', '2022-01-01 12:10:29'),
(357, 293, 12, 244, NULL, NULL, '2022-01-01 13:01:01', '2022-01-01 13:01:01'),
(358, 294, 8, 244, NULL, NULL, '2022-01-01 13:50:35', '2022-01-01 13:50:35'),
(359, 295, 5, 244, NULL, NULL, '2022-01-01 15:35:54', '2022-01-01 15:35:54'),
(360, 296, 4, 244, NULL, NULL, '2022-01-01 16:27:29', '2022-01-01 16:27:29'),
(361, 297, 5, 244, NULL, NULL, '2022-01-01 17:30:59', '2022-01-01 17:30:59'),
(362, 298, 6, 244, NULL, NULL, '2022-01-01 18:10:52', '2022-01-01 18:10:52'),
(363, 299, 3, 244, NULL, NULL, '2022-01-01 18:46:11', '2022-01-01 18:46:11'),
(364, 300, 7, 244, NULL, NULL, '2022-01-01 19:10:17', '2022-01-01 19:10:17'),
(365, 301, 10, 244, NULL, NULL, '2022-01-01 19:47:40', '2022-01-01 19:47:40'),
(366, 302, 4, 244, NULL, NULL, '2022-01-01 20:12:57', '2022-01-01 20:12:57'),
(367, 303, 3, 244, NULL, NULL, '2022-01-01 20:52:32', '2022-01-01 20:52:32'),
(368, 304, 6, 243, NULL, NULL, '2022-01-02 10:13:52', '2022-01-02 10:13:52'),
(369, 305, 6, 243, NULL, NULL, '2022-01-02 10:23:44', '2022-01-02 10:23:44'),
(370, 306, 6, 243, NULL, NULL, '2022-01-02 10:33:50', '2022-01-02 10:33:50'),
(371, 307, 5, 273, NULL, NULL, '2022-01-02 14:10:22', '2022-01-02 14:10:22'),
(372, 308, 6, 243, NULL, NULL, '2022-01-02 14:23:56', '2022-01-02 14:23:56'),
(373, 309, 6, 243, NULL, NULL, '2022-01-02 14:48:51', '2022-01-02 14:48:51'),
(374, 310, 6, 243, NULL, NULL, '2022-01-02 14:56:22', '2022-01-02 14:56:22'),
(375, 311, 1, 273, NULL, NULL, '2022-01-02 15:07:24', '2022-01-02 15:07:24'),
(376, 312, 6, 243, NULL, NULL, '2022-01-02 15:14:03', '2022-01-02 15:14:03'),
(377, 313, 6, 243, NULL, NULL, '2022-01-02 15:34:31', '2022-01-02 15:34:31'),
(378, 314, 6, 243, NULL, NULL, '2022-01-02 16:05:56', '2022-01-02 16:05:56'),
(379, 315, 6, 243, NULL, NULL, '2022-01-02 16:14:10', '2022-01-02 16:14:10'),
(380, 316, 6, 243, NULL, NULL, '2022-01-02 16:32:04', '2022-01-02 16:32:04'),
(381, 317, 6, 243, NULL, NULL, '2022-01-02 16:47:40', '2022-01-02 16:47:40'),
(382, 318, 10, 61, NULL, NULL, '2022-01-04 06:54:26', '2022-01-04 06:54:26'),
(383, 319, 11, 61, NULL, NULL, '2022-01-11 09:14:21', '2022-01-11 09:14:21'),
(384, 320, 22, 61, NULL, NULL, '2022-01-11 10:03:22', '2022-01-11 10:03:22'),
(385, 311, -1, 278, NULL, 669, '2022-02-09 08:38:13', '2022-02-09 08:38:13'),
(386, 243, -1, 278, NULL, 669, '2022-02-09 08:38:13', '2022-02-09 08:38:13'),
(387, 195, -1, 278, NULL, 670, '2022-02-09 14:06:57', '2022-02-09 14:06:57'),
(388, 307, -1, 278, NULL, 671, '2022-02-09 14:27:53', '2022-02-09 14:27:53'),
(389, 195, -1, 278, NULL, 672, '2022-02-09 14:31:50', '2022-02-09 14:31:50'),
(390, 211, -1, 240, NULL, 686, '2022-02-14 13:58:27', '2022-02-14 13:58:27'),
(391, 195, -1, 240, NULL, 686, '2022-02-14 13:58:27', '2022-02-14 13:58:27'),
(392, 243, -1, 240, NULL, 686, '2022-02-14 13:58:28', '2022-02-14 13:58:28'),
(393, 250, -1, 240, NULL, 687, '2022-02-14 14:45:17', '2022-02-14 14:45:17'),
(394, 202, -1, 240, NULL, 691, '2022-02-15 10:27:34', '2022-02-15 10:27:34'),
(395, 243, -1, 240, NULL, 691, '2022-02-15 10:27:35', '2022-02-15 10:27:35'),
(396, 223, -1, 240, NULL, 694, '2022-02-15 12:48:19', '2022-02-15 12:48:19'),
(397, 235, -1, 240, NULL, 695, '2022-02-15 13:20:31', '2022-02-15 13:20:31'),
(398, 195, -1, 278, NULL, 703, '2022-02-15 14:57:16', '2022-02-15 14:57:16'),
(399, 243, -1, 278, NULL, 703, '2022-02-15 14:57:16', '2022-02-15 14:57:16'),
(400, 220, -1, 278, NULL, 704, '2022-02-15 15:11:01', '2022-02-15 15:11:01'),
(401, 239, -1, 278, NULL, 705, '2022-02-15 15:17:04', '2022-02-15 15:17:04'),
(402, 194, -1, 278, NULL, 706, '2022-02-15 15:25:02', '2022-02-15 15:25:02'),
(403, 226, -1, 278, NULL, 725, '2022-02-16 08:56:03', '2022-02-16 08:56:03'),
(404, 242, -1, 278, NULL, 726, '2022-02-16 09:00:03', '2022-02-16 09:00:03'),
(405, 295, -1, 278, NULL, 728, '2022-02-16 09:06:18', '2022-02-16 09:06:18'),
(406, 252, -1, 278, NULL, 734, '2022-02-16 10:24:37', '2022-02-16 10:24:37'),
(407, 293, -1, 278, NULL, 736, '2022-02-16 11:07:02', '2022-02-16 11:07:02'),
(408, 244, -1, 278, NULL, 737, '2022-02-16 11:19:04', '2022-02-16 11:19:04'),
(409, 236, -1, 278, NULL, 737, '2022-02-16 11:19:05', '2022-02-16 11:19:05'),
(410, 301, -1, 278, NULL, 738, '2022-02-16 11:24:21', '2022-02-16 11:24:21'),
(411, 302, -1, 278, NULL, 741, '2022-02-16 12:32:34', '2022-02-16 12:32:34'),
(412, 319, -1, 278, NULL, 742, '2022-02-16 12:40:46', '2022-02-16 12:40:46'),
(413, 225, -1, 278, NULL, 743, '2022-02-16 12:45:43', '2022-02-16 12:45:43'),
(414, 293, -1, 278, NULL, 744, '2022-02-16 12:47:51', '2022-02-16 12:47:51'),
(415, 293, -2, 278, NULL, 746, '2022-02-16 12:52:07', '2022-02-16 12:52:07'),
(416, 194, -1, 278, NULL, 746, '2022-02-16 12:52:07', '2022-02-16 12:52:07'),
(417, 302, -1, 278, NULL, 747, '2022-02-16 12:55:17', '2022-02-16 12:55:17'),
(418, 314, -1, 278, NULL, 748, '2022-02-16 13:08:32', '2022-02-16 13:08:32'),
(419, 291, -1, 278, NULL, 749, '2022-02-16 13:12:28', '2022-02-16 13:12:28'),
(420, 0, 500, 61, NULL, NULL, '2022-02-17 06:54:20', '2022-02-17 06:54:20'),
(421, 0, 500, 61, NULL, NULL, '2022-02-17 06:54:46', '2022-02-17 06:54:46'),
(574, 442, 50, 61, NULL, NULL, '2022-02-17 11:05:42', '2022-02-17 11:05:42'),
(575, 443, 20, 61, NULL, NULL, '2022-02-20 05:32:15', '2022-02-20 05:32:15'),
(576, 444, 20, 61, NULL, NULL, '2022-02-20 06:28:09', '2022-02-20 06:28:09'),
(577, 445, 10, 61, NULL, NULL, '2022-02-22 06:47:17', '2022-02-22 06:47:17'),
(578, 446, 44, 61, NULL, NULL, '2022-02-22 07:15:35', '2022-02-22 07:15:35'),
(579, 447, NULL, 61, NULL, NULL, '2022-02-22 07:30:17', '2022-02-22 07:30:17'),
(580, 448, 52, 61, NULL, NULL, '2022-02-23 08:18:53', '2022-02-23 08:18:53'),
(581, 450, 30, 61, NULL, NULL, '2022-02-23 11:11:09', '2022-02-23 11:11:09'),
(582, 1, 10, 61, NULL, NULL, '2022-02-27 12:47:53', '2022-02-27 12:47:53'),
(583, 2, 20, 61, NULL, NULL, '2022-02-27 12:59:12', '2022-02-27 12:59:12'),
(584, 3, 20, 61, NULL, NULL, '2022-02-27 12:59:14', '2022-02-27 12:59:14'),
(585, 4, 20, 61, NULL, NULL, '2022-02-28 10:00:34', '2022-02-28 10:00:34'),
(586, 5, 44, 61, NULL, NULL, '2022-03-03 12:21:41', '2022-03-03 12:21:41'),
(587, 6, 22, 61, NULL, NULL, '2022-03-06 07:08:26', '2022-03-06 07:08:26'),
(588, 7, 20, 290, NULL, NULL, '2022-03-06 10:47:41', '2022-03-06 10:47:41'),
(589, 8, 1, 61, NULL, NULL, '2022-03-29 05:11:57', '2022-03-29 05:11:57'),
(590, 9, 1, 61, NULL, NULL, '2022-03-29 12:38:08', '2022-03-29 12:38:08'),
(591, 10, 10, 61, NULL, NULL, '2022-04-04 10:23:27', '2022-04-04 10:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `sub_pages`
--

CREATE TABLE `sub_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order` int(11) DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_pages`
--

INSERT INTO `sub_pages` (`id`, `order`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '/uploads/site/sub_pages/1/1603958470.svg', '2020-10-29 06:01:10', '2020-10-29 06:01:10'),
(3, 3, '/uploads/site/sub_pages/3/1603958601.svg', '2020-10-29 06:03:21', '2020-10-29 06:03:21'),
(4, 4, '/uploads/site/sub_pages/4/1603958620.svg', '2020-10-29 06:03:40', '2020-10-29 06:09:24'),
(5, 5, '/uploads/site/sub_pages/5/1603958638.svg', '2020-10-29 06:03:58', '2020-10-29 06:09:32'),
(6, 6, '/uploads/site/sub_pages/6/1603958659.svg', '2020-10-29 06:04:19', '2020-10-29 06:04:19'),
(7, 1, '/uploads/site/sub_pages/7/1622747270.png', '2020-10-29 06:50:13', '2021-06-03 16:07:50'),
(8, 3, '/uploads/site/sub_pages/8/1622551206.png', '2020-10-29 07:11:00', '2021-06-01 09:40:06'),
(9, 2, '/uploads/site/sub_pages/9/1622736597.png', '2020-10-29 07:11:17', '2021-06-03 13:09:57'),
(13, 3, '/uploads/site/sub_pages/13/1608901938.svg', '2020-10-29 07:27:16', '2020-12-25 10:12:18'),
(14, 3, '/uploads/site/sub_pages/14/1608902272.svg', '2020-10-29 07:28:15', '2020-12-25 10:17:52'),
(15, 3, '/uploads/site/sub_pages/15/1608902467.svg', '2020-10-29 07:28:25', '2020-12-25 10:21:07'),
(16, 1, '/uploads/site/sub_pages/16/1622159383.png', '2020-10-29 07:28:36', '2021-05-27 20:49:43'),
(17, 1, '/uploads/site/sub_pages/17/1622160001.png', '2020-10-29 07:28:47', '2021-05-27 21:00:01'),
(20, 1, '/uploads/site/sub_pages/20/1604485720.svg', '2020-11-04 07:28:40', '2020-11-04 07:28:40');

-- --------------------------------------------------------

--
-- Table structure for table `sub_pages_data`
--

CREATE TABLE `sub_pages_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_pages_data`
--

INSERT INTO `sub_pages_data` (`id`, `title`, `description`, `lang_id`, `page_id`, `created_at`, `updated_at`) VALUES
(1, 'Own A Store With Your Identity At The Lowest Costs.', 'Through your Sallatk , you can get a professional online store in just a few minutes, and you can also get free hosting and continuous updates without any sales fees.', 1, 1, '2020-10-29 06:01:10', '2020-11-08 20:13:13'),
(3, 'Offer your customers more payment options and select your shopping currency', 'Provide your customers with multiple options to buy in your store and do it at the click of a unit button with ease and select one or more currencies to shop in your store KNet, Visa, MasterCard, Mada, Sadad, Benefit, PayPal', 1, 3, '2020-10-29 06:03:21', '2021-05-10 04:33:58'),
(4, 'Provide protection and continuity to your store', 'Provide protection and continuity to operate your store by 99.9% to reach your store to your customers as quickly as possible and with the least effects on the speed and flexibility of the properties you need, do not think about losing your data even in the most difficult circumstances', 1, 4, '2020-10-29 06:03:40', '2021-06-07 15:27:15'),
(5, 'Quick shopping and saving your customer\'s address', 'Your customer can shop through his or her membership in your store or non-membership through the quick shopping option, and your customer can also save his address or navigate between his pre-saved addresses', 1, 5, '2020-10-29 06:03:58', '2021-05-10 05:12:59'),
(6, 'A number of marketing tools to increase sales', 'We have provided you with easy tools to help you increase your sales such as creating discount coupons, as well as an option to reduce a particular product or more than one product or on a section, as well as an option tell me when the product is available and more tools', 1, 6, '2020-10-29 06:04:19', '2021-05-10 05:19:08'),
(7, 'Sample free package', 'Sallatk platform offers you an online store and a control panel site to view your products online for free, introduce your products online and free of charge', 1, 7, '2020-10-29 06:50:13', '2021-03-14 02:14:48'),
(8, 'Sallatk Pro package', 'One of the designs for the paid Sallatk Pro, the design is characterized by distinctive touches and additions and is also adaptable in Arabic and English and the page orientation according to the language with all browsers accepted for computers, tablets and smartphones', 1, 8, '2020-10-29 07:11:00', '2020-11-11 01:45:59'),
(9, 'Sallatk Go package', 'One of the design models for the paid Sallatk Go , and the design is characterized by being adaptive in both Arabic and English and the page orientation according to the language and accepts all browsers for computers, tablets and smart phonesOne of the design models for the paid package is your Sallatk go, and the design is characterized by adaptation to all browsers for the computer, tablets and smartphones', 1, 9, '2020-10-29 07:11:17', '2020-11-11 01:43:08'),
(13, 'Tahani Abaya', 'Perfect elegance and perfect materials with the finest fabrics for the games by the designer Tahani Abaya', 1, 13, '2020-10-29 07:27:16', '2021-05-27 21:07:50'),
(14, 'Ahmed Perfumes Store', 'Ahmed Perfume Shop manufactures fragrances in different flavors and kuwaiti arms perfect fragrances that keep pace with the world', 1, 14, '2020-10-29 07:28:15', '2021-05-27 21:08:24'),
(15, 'Mgr Aloud Store', 'Mgr Aloud shop the finest types of incense and oud you find in the Mgr Aloud of the oud a Kuwaiti product', 1, 15, '2020-10-29 07:28:25', '2021-05-27 21:09:35'),
(16, 'blazefut', 'Your first reference in FIFA is the fastest, cheapest and most secure game you can count on', 1, 16, '2020-10-29 07:28:36', '2021-05-27 21:10:41'),
(17, 'Manthoor', 'manthoor name shop for lovers of elegance and excellence exclusive models', 1, 17, '2020-10-29 07:28:47', '2021-05-27 21:11:57'),
(19, 'أنشئ متجرك الالكتروني بأقل تكلفة', 'مع سلتك يمكنك إنشاء متجر إلكتروني إحترافي فقط في دقائق معدودة كما يمكنك الحصول على إستضافة مجانية و تحديثات مستمرة بدون أي رسوم على المبيعات.', 2, 1, '2020-11-01 19:35:28', '2021-05-10 03:52:44'),
(20, 'قدم لعملائك خيارات دفع أكثر وحدد عملة التسوق', 'وفر لعملائك خيارات متعددة للشراء في متجرك و فعلها بضغطة زر وحدة وبكل سهولة وحدد عملة واحدة أو أكثر للتسوق في متجرك كي نت , فيزا , ماستركارد , مدى , سداد , بنفت , باي بال', 2, 3, '2020-11-04 05:52:08', '2021-05-10 04:33:22'),
(22, 'توفير الحماية والاستمرارية لمتجرك', 'توفير الحماية والاستمرارية لتشغيل متجرك بنسبة 99.9% ليصل متجرك إلى عملائك بأسرع مايمكن وبأقل التأثيرات على سرعة ومرونة الخواص التي تحتاجها , لا تفكر بفقدان بياناتك حتى في أصعب الظروف', 2, 4, '2020-11-04 06:42:55', '2021-06-07 15:26:58'),
(24, 'التسوق السريع وحفظ عنوان عميلك', 'يمكن لعميلك أن يتسوق من خلال عضويتة في متجرك أو من غير عضوية من خلال خيار التسوق السريع , وأيضا يمكن لعميلك حفظ عنوانه أو التنقل بين عناوينه المحفوظة مسبقاً', 2, 5, '2020-11-04 07:15:04', '2021-05-10 05:12:15'),
(25, 'عدد من الأدوات التسويقية لزيادة المبيعات', 'وفرنا لكم أدوات سهلة تساعدكم في زيادة مبيعاتكم مثل إنشاء كوبونات خصم وايضا خيار للتخفيضات لمنتج معين أو أكثر من منتج أو على قسم وايضا خيار أخبرني عند توفر المنتج والمزيد من الأدوات', 2, 6, '2020-11-04 07:22:38', '2021-05-10 05:18:37'),
(26, 'Receive your requests in an easy way online', 'Whatever type of product or business you eat, perfumes, fashion, sweets, design, electronics, accessories, cloaks, pharmacies, games, restaurant, you can receive your orders through your own store', 1, 20, '2020-11-04 07:28:40', '2021-05-10 04:15:05'),
(27, 'أستقبل طلباتك بطريقة سهلة أونلاين', 'مهما كان نوع منتجك أو مشروعك التجاري أكل , عطور , أزياء , حلويات , تصميم , الكترونيات , اكسسوارات , عبايات , صيدليات , العاب , مطعم , يمكنك أستقبال طلباتك من خلال متجرك الخاص', 2, 20, '2020-11-04 07:30:19', '2021-05-10 04:13:56'),
(29, 'متجر تهاني عباية - Tahani Abaya', 'أناقة كاملة وخامات مثالية مع اجود انواع الاقمشة للعبايات من المصممة تهاني عباية', 2, 13, '2020-11-04 09:20:09', '2021-05-27 20:36:48'),
(30, 'متجر أحمد للعطور', 'متجر أحمد للعطور صناعة العطر بنكهات مختلفة وبسواعد كويتية عطور مثالية تواكب العالمية', 2, 14, '2020-11-04 09:35:07', '2021-05-27 20:41:50'),
(31, 'متجر مقر العود', 'متجر مقر العود أجود أنواع البخور والعود تجدها في مقر العود منتج كويتي', 2, 15, '2020-11-04 09:39:28', '2021-05-27 20:48:43'),
(32, 'متجر blazefut', 'مرجعك الأول في لعبة فيفا الأسرع والأرخص والأضمن ويمكنك الاعتماد عليهم', 2, 16, '2020-11-04 09:43:29', '2021-05-27 20:56:18'),
(33, 'متجر منثور - ManThoor', 'متجر منثور أسم لامع لمحبين الأناقة والتميز موديلات حصرية', 2, 17, '2020-11-04 09:50:23', '2021-05-27 21:05:17'),
(35, 'نموذج للباقة المجانية', 'منصة سلتك تقدملك متجر الكتروني وموقع خاص بلوحة تحكم لعرض منتجاتك أونلاين مجاناً ، أعرض منتجاتك بشكل أونلاين ومجاناً', 2, 7, '2020-11-04 10:20:32', '2021-03-14 02:14:25'),
(36, 'نموذج من باقة سلّتك برو', 'قالب خاص في الباقة برو , يتميز بلمسات خاصة ويدعم جميع المتصفحات والتابليت والهواتف الذكية', 2, 8, '2020-11-04 10:28:10', '2021-03-14 02:27:40'),
(37, 'نموذج باقة سلّتك جو', 'قالب خاص في الباقة جو , يتميز في البساطة ويدعم جميع المتصفحات والتابليت والهواتف الذكية', 2, 9, '2020-11-04 10:32:30', '2021-03-20 23:51:53');

-- --------------------------------------------------------

--
-- Table structure for table `success_partners`
--

CREATE TABLE `success_partners` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `success_partners_data`
--

CREATE TABLE `success_partners_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_partner_id` int(10) UNSIGNED DEFAULT NULL,
  `lang_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `success_partner_section`
--

CREATE TABLE `success_partner_section` (
  `success_partner_id` int(10) UNSIGNED DEFAULT NULL,
  `section_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook_id` varchar(222) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dialing_code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `code` int(11) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `gender` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `affiliate_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_points` float(8,2) DEFAULT NULL,
  `balance` float(8,2) DEFAULT NULL,
  `product_points` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `online_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `membership_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` int(11) DEFAULT NULL,
  `social_token` int(11) DEFAULT NULL,
  `social_type` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `facebook_id`, `name`, `lastname`, `dialing_code`, `phone`, `phone_verified_at`, `email`, `email_verified_at`, `password`, `guard`, `provider`, `provider_id`, `country_id`, `image`, `address`, `code`, `pin_code`, `gender`, `birthdate`, `is_active`, `city_id`, `remember_token`, `affiliate_id`, `affiliate_code`, `affiliate_points`, `balance`, `product_points`, `created_at`, `updated_at`, `online_at`, `status`, `membership_id`, `social_id`, `social_token`, `social_type`) VALUES
(61, NULL, 'admin', 'mahdy', '+20', '010101010', NULL, 'admin@email.com', '2021-01-23 10:00:03', '$2y$10$JmIsEOhWu0axGP/ZhCFrWu/lT0QJuOBrE3jlkqWxJU1gD6472QBqS', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'n86PEr79YxA12uyRbEysi2ZTi0Sq9hGoWr2jgbBNmDF9eIfjD59cSAsvvR6r', NULL, NULL, NULL, -310.00, 0, '2021-01-23 09:59:04', '2022-02-28 12:25:03', '2022-01-25 05:21:53', 0, 'U1061', NULL, NULL, NULL),
(293, NULL, 'Mahdy', 'Adel', NULL, '01122907742', NULL, 'mahdy@email.com', '2022-07-19 22:00:00', '$2y$10$PGP4McOcUMD9R5r8uoHzOeX41pgltZorWVsqBMVNs1bteCG0smvIa', 'admin', NULL, NULL, NULL, '26910.png', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-07-10 13:49:31', '2022-07-10 13:49:32', NULL, 0, NULL, NULL, NULL, NULL);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `insert_member_id` BEFORE INSERT ON `users` FOR EACH ROW BEGIN DECLARE P1 VARCHAR(200);
SELECT
  AUTO_INCREMENT into P1
FROM
  INFORMATION_SCHEMA.TABLES
WHERE
  TABLE_SCHEMA = "soin"
  AND TABLE_NAME = 'users';
set
  New.membership_id = concat("U", (1000 + P1));
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_modules`
--
ALTER TABLE `activity_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_modules_data`
--
ALTER TABLE `activity_modules_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_lang_id_foreign` (`lang_id`),
  ADD KEY `job_id` (`activity_id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_sections`
--
ALTER TABLE `content_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `default_images`
--
ALTER TABLE `default_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_permission`
--
ALTER TABLE `feature_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals_modules`
--
ALTER TABLE `goals_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals_modules_data`
--
ALTER TABLE `goals_modules_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helps`
--
ALTER TABLE `helps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helps_data`
--
ALTER TABLE `helps_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_accounts`
--
ALTER TABLE `image_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insturctions`
--
ALTER TABLE `insturctions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insturctions_data`
--
ALTER TABLE `insturctions_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_blogs_datalang_id` (`lang_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_data`
--
ALTER TABLE `login_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mains`
--
ALTER TABLE `mains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_data`
--
ALTER TABLE `main_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_goals`
--
ALTER TABLE `main_goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_goals_data`
--
ALTER TABLE `main_goals_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_goal_id` (`main_goal_id`);

--
-- Indexes for table `main_insturcation`
--
ALTER TABLE `main_insturcation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_insturcation_data`
--
ALTER TABLE `main_insturcation_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_data_banner_id_foreign` (`main_insturcation_id`),
  ADD KEY `banners_data_lang_id_foreign` (`lang_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules_content`
--
ALTER TABLE `modules_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_data_banner_id_foreign` (`module_id`);

--
-- Indexes for table `modules_data`
--
ALTER TABLE `modules_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_product_items`
--
ALTER TABLE `order_product_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_data`
--
ALTER TABLE `pages_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_data_page_id_foreign` (`page_id`),
  ADD KEY `pages_data_lang_id_foreign` (`lang_id`),
  ADD KEY `pages_data_source_id_foreign` (`source_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_data`
--
ALTER TABLE `permission_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_donations`
--
ALTER TABLE `product_donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_lables`
--
ALTER TABLE `product_lables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_lables_data`
--
ALTER TABLE `product_lables_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_out_notify`
--
ALTER TABLE `product_out_notify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_photos`
--
ALTER TABLE `product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_types_code`
--
ALTER TABLE `product_types_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_types_code_data`
--
ALTER TABLE `product_types_code_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_types_data`
--
ALTER TABLE `product_types_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_visits`
--
ALTER TABLE `product_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions_data`
--
ALTER TABLE `questions_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_details`
--
ALTER TABLE `question_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_mcq`
--
ALTER TABLE `question_mcq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_after_modules`
--
ALTER TABLE `quiz_after_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_after_modules_data`
--
ALTER TABLE `quiz_after_modules_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_products`
--
ALTER TABLE `request_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_data`
--
ALTER TABLE `role_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_category_master`
--
ALTER TABLE `section_category_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_products`
--
ALTER TABLE `section_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_kk` (`section_id`),
  ADD KEY `products_k` (`product_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_attachments`
--
ALTER TABLE `services_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_data`
--
ALTER TABLE `services_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_datalang_id` (`lang_id`);

--
-- Indexes for table `service_section`
--
ALTER TABLE `service_section`
  ADD KEY `service_sectionsection_id` (`section_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `settings_data`
--
ALTER TABLE `settings_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_datalang_id` (`lang_id`);

--
-- Indexes for table `site_article_category`
--
ALTER TABLE `site_article_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_article_category_data`
--
ALTER TABLE `site_article_category_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_blog_categories`
--
ALTER TABLE `site_blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_blog_categories_data`
--
ALTER TABLE `site_blog_categories_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_pages`
--
ALTER TABLE `site_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_pages_data`
--
ALTER TABLE `site_pages_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_data_page_id_foreign` (`page_id`),
  ADD KEY `pages_data_lang_id_foreign` (`lang_id`),
  ADD KEY `pages_data_source_id_foreign` (`source_id`);

--
-- Indexes for table `site_ticket_categories`
--
ALTER TABLE `site_ticket_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_ticket_categories_data`
--
ALTER TABLE `site_ticket_categories_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_ticket_category_users`
--
ALTER TABLE `site_ticket_category_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders_data`
--
ALTER TABLE `sliders_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slider_id` (`slider_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_pages`
--
ALTER TABLE `sub_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_pages_data`
--
ALTER TABLE `sub_pages_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_pages_data_page_id_foreign` (`page_id`),
  ADD KEY `sub_pages_datalang_id` (`lang_id`);

--
-- Indexes for table `success_partners`
--
ALTER TABLE `success_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `success_partners_data`
--
ALTER TABLE `success_partners_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `success_partners_data_success_partner_id_foreign` (`success_partner_id`),
  ADD KEY `success_partners_datalang_id` (`lang_id`);

--
-- Indexes for table `success_partner_section`
--
ALTER TABLE `success_partner_section`
  ADD KEY `success_partner_sectionsection_id` (`section_id`),
  ADD KEY `success_partner_section_ibfk_1` (`success_partner_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userscountry_id` (`country_id`),
  ADD KEY `userscity_id` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_modules`
--
ALTER TABLE `activity_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `activity_modules_data`
--
ALTER TABLE `activity_modules_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `content_sections`
--
ALTER TABLE `content_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `default_images`
--
ALTER TABLE `default_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feature_permission`
--
ALTER TABLE `feature_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goals_modules`
--
ALTER TABLE `goals_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `goals_modules_data`
--
ALTER TABLE `goals_modules_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `helps`
--
ALTER TABLE `helps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `helps_data`
--
ALTER TABLE `helps_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `image_accounts`
--
ALTER TABLE `image_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `insturctions`
--
ALTER TABLE `insturctions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `insturctions_data`
--
ALTER TABLE `insturctions_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `login_data`
--
ALTER TABLE `login_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `mains`
--
ALTER TABLE `mains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `main_data`
--
ALTER TABLE `main_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=543;

--
-- AUTO_INCREMENT for table `main_goals`
--
ALTER TABLE `main_goals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `main_goals_data`
--
ALTER TABLE `main_goals_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `main_insturcation`
--
ALTER TABLE `main_insturcation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `main_insturcation_data`
--
ALTER TABLE `main_insturcation_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=918;

--
-- AUTO_INCREMENT for table `modules_content`
--
ALTER TABLE `modules_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `modules_data`
--
ALTER TABLE `modules_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=607;

--
-- AUTO_INCREMENT for table `order_product_items`
--
ALTER TABLE `order_product_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pages_data`
--
ALTER TABLE `pages_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `product_donations`
--
ALTER TABLE `product_donations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_lables`
--
ALTER TABLE `product_lables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1722;

--
-- AUTO_INCREMENT for table `product_lables_data`
--
ALTER TABLE `product_lables_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3023;

--
-- AUTO_INCREMENT for table `product_out_notify`
--
ALTER TABLE `product_out_notify`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_photos`
--
ALTER TABLE `product_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=697;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `product_types_code`
--
ALTER TABLE `product_types_code`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_types_code_data`
--
ALTER TABLE `product_types_code_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_types_data`
--
ALTER TABLE `product_types_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `product_videos`
--
ALTER TABLE `product_videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_visits`
--
ALTER TABLE `product_visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9719;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions_data`
--
ALTER TABLE `questions_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question_details`
--
ALTER TABLE `question_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `question_mcq`
--
ALTER TABLE `question_mcq`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `quiz_after_modules`
--
ALTER TABLE `quiz_after_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `quiz_after_modules_data`
--
ALTER TABLE `quiz_after_modules_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `request_products`
--
ALTER TABLE `request_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `role_data`
--
ALTER TABLE `role_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_category_master`
--
ALTER TABLE `section_category_master`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_products`
--
ALTER TABLE `section_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `services_attachments`
--
ALTER TABLE `services_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services_data`
--
ALTER TABLE `services_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `settings_data`
--
ALTER TABLE `settings_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_article_category`
--
ALTER TABLE `site_article_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_article_category_data`
--
ALTER TABLE `site_article_category_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_blog_categories`
--
ALTER TABLE `site_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_blog_categories_data`
--
ALTER TABLE `site_blog_categories_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_pages`
--
ALTER TABLE `site_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `site_pages_data`
--
ALTER TABLE `site_pages_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `site_ticket_categories`
--
ALTER TABLE `site_ticket_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_ticket_categories_data`
--
ALTER TABLE `site_ticket_categories_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_ticket_category_users`
--
ALTER TABLE `site_ticket_category_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sliders_data`
--
ALTER TABLE `sliders_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=592;

--
-- AUTO_INCREMENT for table `sub_pages`
--
ALTER TABLE `sub_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sub_pages_data`
--
ALTER TABLE `sub_pages_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `success_partners`
--
ALTER TABLE `success_partners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `success_partners_data`
--
ALTER TABLE `success_partners_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `main_goals_data`
--
ALTER TABLE `main_goals_data`
  ADD CONSTRAINT `main_goals_data_ibfk_1` FOREIGN KEY (`main_goal_id`) REFERENCES `main_goals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `main_insturcation_data`
--
ALTER TABLE `main_insturcation_data`
  ADD CONSTRAINT `main_insturcation_data_ibfk_1` FOREIGN KEY (`main_insturcation_id`) REFERENCES `main_insturcation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sliders_data`
--
ALTER TABLE `sliders_data`
  ADD CONSTRAINT `sliders_data_ibfk_1` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
