-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2017 at 01:10 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homehelp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PUBLISHED',
  `date` date NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `category_id`, `title`, `slug`, `content`, `image`, `status`, `date`, `featured`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'tyiu', 'iui', '<p>fjhj</p>\r\n', NULL, 'PUBLISHED', '2017-06-23', 0, '2017-06-23 04:00:56', '2017-06-23 04:00:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE `article_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `lft`, `rgt`, `depth`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, NULL, NULL, NULL, 'hjhjhj', 'hjhjhj', '2017-06-23 04:00:38', '2017-06-23 04:00:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hh_documents`
--

CREATE TABLE `hh_documents` (
  `id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL,
  `expiry_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_document_entity`
--

CREATE TABLE `hh_document_entity` (
  `id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `doc_file` varchar(60) NOT NULL,
  `submitted_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_employees`
--

CREATE TABLE `hh_employees` (
  `id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_employers`
--

CREATE TABLE `hh_employers` (
  `id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_entities`
--

CREATE TABLE `hh_entities` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `address` varchar(40) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_jobs`
--

CREATE TABLE `hh_jobs` (
  `id` int(11) NOT NULL,
  `job_category_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `from_date_time` datetime NOT NULL,
  `to_date_time` datetime NOT NULL,
  `gender` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_job_applications`
--

CREATE TABLE `hh_job_applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `comments` text NOT NULL,
  `application_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_job_categories`
--

CREATE TABLE `hh_job_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_ratings`
--

CREATE TABLE `hh_ratings` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `rating_employee` int(11) NOT NULL,
  `rating_employer` int(11) NOT NULL,
  `comment_employee` int(11) NOT NULL,
  `comment_employer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_site_cms`
--

CREATE TABLE `hh_site_cms` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hh_transaction`
--

CREATE TABLE `hh_transaction` (
  `id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_08_04_130507_create_article_tag_table', 1),
(4, '2015_08_04_130520_create_articles_table', 1),
(5, '2015_08_04_130551_create_categories_table', 1),
(6, '2015_08_04_131614_create_settings_table', 1),
(7, '2015_08_04_131626_create_tags_table', 1),
(8, '2016_05_05_115641_create_menu_items_table', 1),
(9, '2016_05_10_130540_create_permission_tables', 1),
(10, '2016_05_25_121918_create_pages_table', 1),
(11, '2016_07_24_060017_add_slug_to_categories_table', 1),
(12, '2016_07_24_060101_add_slug_to_tags_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `extras` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_roles`
--

CREATE TABLE `permission_roles` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_users`
--

CREATE TABLE `permission_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `description`, `value`, `field`, `active`, `created_at`, `updated_at`) VALUES
(1, 'contact_email', 'Contact form email address', 'The email address that all emails from the contact form will go to.', 'admin@updivision.com', '{\"name\":\"value\",\"label\":\"Value\",\"type\":\"email\"}', 1, NULL, NULL),
(2, 'contact_cc', 'Contact form CC field', 'Email adresses separated by comma, to be included as CC in the email sent by the contact form.', '', '{\"name\":\"value\",\"label\":\"Value\",\"type\":\"email\"}', 1, NULL, NULL),
(3, 'contact_bcc', 'Contact form BCC field', 'Email adresses separated by comma, to be included as BCC in the email sent by the contact form.', '', '{\"name\":\"value\",\"label\":\"Value\",\"type\":\"email\"}', 1, NULL, NULL),
(4, 'motto', 'Motto', 'Website motto', 'this is the value', '{\"name\":\"value\",\"label\":\"Value\", \"title\":\"Motto value\" ,\"type\":\"textarea\"}', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `last_login_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`, `email`, `last_login_timestamp`) VALUES
(124, 'NurseAid Super Admin', 'nimesh124', 'nimesh124', 'admin@gmail.com', '2016-09-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cms`
--

CREATE TABLE `tbl_cms` (
  `id` int(11) NOT NULL,
  `some_col` varchar(111) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `last_modified_on` datetime NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cms`
--

INSERT INTO `tbl_cms` (`id`, `some_col`, `title`, `content`, `last_modified_on`, `created_by`) VALUES
(4, '', 'About Us', '<p>NurseAid provides recruitment solutions to aspiring healthcare sector personnel on a variety of roles through our clients. We specialise in the catering manpower needs of nursing homes and related companies. We are committed to providing quick and reliable real time recruitment options through our state-of-the-art web and mobile phone app based portals.</p>\r\n<p>All our staff hold a current Working with Vulnerable People certificate and Police Clearance. All staff employed by Nurseaid are interviewed, reference checked and are personally screened. We try our best to employ experienced professional staff with good work ethics. The intensive selection process guarantees that our employees are well prepared for the high expectation of our clients whilst representing them at your premises. Our list includes suitably qualified people in the healthcare sector with a range of skills and experience level. Our staff are available to work 7 days a week on 24 hour roster.</p>\r\n<p>Once you declare your requirements with Nurseaid, our state-of-the-art system instantly broadcasts that to our list of qualified staff for realtime response. You are comforted by knowledge that all our dealings are open and transparent at all times. Our web-based system gives you full flexibility to chose the right people into the role you want to fill in real time.</p>\r\n<p>Please check and download our app at <a href=\"http://www.nurseaid.com.au\">www.nurseaid.com.au</a>, send us an email at <a href=\"mailto:info@nurseaid.com.au\">info@nurseaid.com.au</a></p>', '2016-09-18 20:30:06', 124),
(5, '', 'Terms and Conditions', '<p>This following document sets out the Terms and Conditions for the All Items Pty Ltd (ACN 603 529 004) trading as the Nurseaid for website <em>www.nurseaid.com.au</em> (the site). In this policy, &ldquo;us&rdquo;, &ldquo;we&rdquo; or &ldquo;our&rdquo; means All Items Pty Ltd and its trading business the Nurseaid.</p>\r\n<p>Please read this agreement carefully before accessing or using the information and services available through the Nurseaidwebsite (&ldquo;the Site&rdquo;).By accessing or using the Site, you agree to be bound by the terms and conditions below. Nurseaid may modify this agreement at any time, and such modifications shall be effective immediately upon posting the modified agreement on the Site.</p>\r\n<h3>No guarantees as to the web service</h3>\r\n<p>This website is provided as is without any representations or warranties, express or implied. Nurseaid makes no representations or warranties in relation to this website or the information and materials provided on this website.</p>\r\n<p>Nurseaid provides no warranty to you that the web services generally available through its Site will be uninterrupted or error-free or that defects in the service will be corrected. You also understand that Nurseaid cannot and does not guarantee or warrant to you that document and information delivered via electronic mail through the Site will be free of viruses, worms, Trojan horses or other code that may contain contaminating or destructive properties. You are responsible for implementing sufficient procedures to satisfy your particular requirements for safety or accuracy of contents.</p>\r\n<h3>Copyright and trademarks</h3>\r\n<p>Copyright in the material and trademarks on the Site are owned by All Items Pty Ltd unless otherwise indicated and you agree not to infringe any intellectual property rights owned by it.You may not modify, reproduce, copy, republish, transmit or distribute in any way any material from the Site including any code and software. You must not use this Site for any purpose that is prohibited by these terms of use or is unlawful.</p>\r\n<p>You may not use screen scraping or similar automated data gathering, data mining, extraction or publication tools on the Site (including for the purposes of establishing, maintaining, advancing or reproducing information contained on our Site on your own website or in any other publication), except with our prior written consent.</p>\r\n<h3>No guarantees or endorsements</h3>\r\n<p>Nurseaid plays no role inthe endorsement or recommendationof any particular service provider listed in our Site. Nurseaid will not be liable for any damages or loss arising in any way out of or in connection with or incidental to any information or third party service provided by any third party.</p>\r\n<p>Nurseaid does not endorse any business or brands or any commercial or private entity that may be advertised on the Site. It is solely your responsibility to evaluate the accuracy, completeness and usefulness of all opinions, advice, services, promotions, merchandise and other information provided through the Site. We strongly recommend that prior to entering into any purchase agreement with any of the Advertisers on the Site, that you obtain your own independent legal, or any other advice as appropriate. In no event shallNurseaid be liable to you or anyone else for any decision made or action taken by you or anyone else in reliance upon any information contained on or omitted from the Site.</p>', '2016-09-19 07:05:22', 124),
(6, '', 'Privacy Policy', '<p>This following document sets out the Privacy Policy for the All Items Pty Ltd (ACN 603 529 004) trading as the Nurseaid for website www.nurseaid.com.au (the site). In this policy, \"us\", \"we\" or \"our\" means All Items Pty Ltd and its trading business the Nurseaid.</p>\r\n<p>Nurseaid is committed to providing you with the best possible customer service experience. Your privacy is important to us. Nurseaid is bound by the Privacy Act 1988 (Cth), which sets out a number of principles concerning the privacy of individuals.</p>\r\n<p>1. By using our website you consent to our use of cookies in accordance with the terms and conditions of this policy.</p>\r\n<p>2. Collection of your personal information<br />For access to Nurseaid customer features you are required to submit personally identifiable information. This may include but not limited to unique username and password or to providing sensitive information in the recovery of your lost password. For each visitor to the site, we also collect the following non-personally identifiable information, including but not limited to, browser type and its features, operating system, pages viewed while browsing the site, page access times and referring website address.</p>\r\n<p>3. Sharing of your personal information<br />We may occasionally hire other companies to provide services on our behalf, including but not limited to handling customer support enquiries or for processing transactions. Those companies will be permitted to obtain only the personal information they need to deliver the service. Nurseaid takes reasonable steps to ensure that these organisations are bound by confidentiality and privacy obligations in relation to the protection of your personal information. We may disclose your personal information to the police, any relevant body (including your Internet Service Provider or network administrator) or enforcement authority as required by the law , for example, if we have reason to suspect that you have committed a breach of any of our terms and conditions, or have otherwise been engaged in any unlawful activity, and we reasonably believe that disclosure is necessary.</p>\r\n<p>4. Use of your personal information<br />We use your personal information as required or permitted by any law (including the Privacy Act).<br />The collected information is also used for the purpose of appraising visitor traffic, trends and delivering personalized content to you while you are at this site. From time to time, we may use customer information for new, unanticipated uses not previously disclosed in our privacy notice. If our information practices change in the future the data collected onwards from the time of the policy change will be used in compliace to our updated practices.</p>\r\n<p>5. Changes to this Privacy Policy<br />Nurseaid reserves the right to make amendments to this Privacy Policy at any time. If you have objections to the Privacy Policy, you should not access or use the site.</p>\r\n<p>6. Accessing Your Personal Information</p>\r\n<p>You have a right to access your personal information, subject to exceptions allowed by law. You may be required to put your request for your personal informaton in writing for security reasons. Nurseaid reserves the right to charge a fee for providing access to your information on a per request basis.</p>\r\n<p>If you would like further information or have any questions about this Privacy Policy, please contact us during ACT business hours Monday to Friday.</p>\r\n<p>Nurseaid <br />E-mail: info@nurseaid.com.au</p>', '2016-09-21 19:58:21', 124),
(7, '', 'Employer Registration Page', '<p>Please download registration form and contract. Fill it and sign on both forms and attach it to its appropriate place. Alternatively, you can send all your documents to <a href=\"mailto:registration@nurseaid.com.au\">registration@nurseaid.com.au</a> <br /><br /> <span class=\"download-label\">Application Form</span><a class=\"btn btn-sm btn-info\" href=\"#\">Download</a><br /> <span class=\"download-label\">Contract</span><a class=\"btn btn-sm btn-info\" href=\"#\">Download</a></p>', '2016-09-22 13:56:40', 124),
(8, '', 'Employer Registration Successful', '<p>Thank you for signing up.</p>\r\n<p>Account has been created. Please check your email or contact administrator to activate&nbsp;your account !!!</p>', '2016-09-22 17:46:47', 124),
(9, '', 'Employee Registration Successful', '<p>Thank you for signing up.</p>\r\n<p>Account has been created. Please check your email or contact administrator to activate&nbsp;your account !!!</p>', '2016-09-23 12:29:38', 124),
(10, '', 'Employee Registration Page', '<table class=\"table-responsive table  table-bordered\">\r\n<tbody>\r\n<tr>\r\n<td colspan=\"2\"><strong>Please choose one of the below option to apply for any position:</strong></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h2>Apply online</h2>\r\n&shy; Your application will be received electronically by our office.</td>\r\n<td style=\"vertical-align: middle;\"><a class=\"btn btn-primary btn-block do-toggle\" title=\"Online Application\">Online&nbsp;Application</a></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h2>Apply manually</h2>\r\n&shy; You will need to download the application form, print and fill all the areas of the form and then finally email it to <a href=\"mailto:hr@nurseaid.com.au\">hr@nurseaid.com.au</a>&nbsp;along with all required documents such as: resume, certificates etc.</td>\r\n<td style=\"vertical-align: middle;\"><a class=\"btn btn-primary btn-block do-popup\" title=\"Download Application\" href=\"#\" target=\"_blank\">Download Application</a></td>\r\n</tr>\r\n</tbody>\r\n</table>', '2016-09-23 12:30:10', 124),
(11, '', 'NurseAid.com', '<p>NurseAid provides recruitment solutions to aspiring healthcare sector personnel on a variety of roles through our clients. We specialise in the catering manpower needs of nursing homes and related companies. We are committed to providing quick and reliable real time recruitment options through our state-of-the-art web and mobile phone app based portals.</p>', '2016-09-23 13:07:33', 124),
(12, '', 'Employee Registration Page Message', '<p>We are looking for the following positions: &nbsp;</p>\r\n<ul>\r\n<li>Registered Nurse (RN)</li>\r\n<li>Enrolled Nurse (EN)</li>\r\n<li>Assistant in Nursing (AIN)</li>\r\n</ul>', '2016-12-05 12:29:59', 124),
(13, '', 'Employee Registration Note', '<p class=\"help-block text-center\">Note: Applicant must provide 100 points of ID. Please refer below link to find out what document gives how much point. <a href=\"https://www.instantchecks.com.au/100points.aspx\" target=\"__blank\">https://www.instantchecks.com.au/100points.aspx</a></p>', '2016-12-05 13:00:39', 124),
(14, '', 'Employee Registration Preference Note', '<p>If you prefer to apply manually, please <a href=\"https://www.dropbox.com/s/kgbxwa2dwrzf53q/Application%20for%20Employment.docx?dl=0\" target=\"__blank\">Click here</a>.</p>', '2016-12-05 13:03:45', 124),
(15, '', 'Contact Us', '<p>contact here.....</p>', '2017-01-15 13:46:33', 124),
(16, '', 'Account Activation Successful - Employee', '<p>Thank you !!</p>\r\n<p>&nbsp;</p>\r\n<p>Your account has been activated. You can now log into the system.</p>\r\n<p>You need to supply all relevant documents to be able to apply for jobs. Please contact system administrator.</p>', '2017-02-13 17:21:29', 124),
(17, '', 'Account Activation Successful - Employer', '<p>Thank you !!</p>\r\n<p>&nbsp;</p>\r\n<p>Your account has been activated. You can now log into the system.</p>', '2017-03-01 06:56:41', 124),
(18, '', 'Download Job Application Pack', '<ul>\r\n<li><a href=\"../../../../resources/1_APPLICATION_FOR_EMPLOYMENT.pdf\" target=\"_blank\">Application for Employment</a></li>\r\n<li><a href=\"../../../../resources/2_CONFIDENTIALITY_AGREEMENT\" target=\"_blank\">Confidentiality Agreement</a></li>\r\n<li><a href=\"../../../../resources/3_PHOTOGRAPHIC_AUTHORITY_TO_PUBLISH_FORM\" target=\"_blank\">Photographic Authority to Publish Form</a></li>\r\n<li><a href=\"../../../../resources/4_BANKING_DETAILS.pdf\" target=\"_blank\">Banking Details</a></li>\r\n<li><a href=\"../../../../resources/5_STATUTORY_DECLARATION_1959.pdf\" target=\"_blank\">Statutory Declaration 1959</a></li>\r\n<li><a href=\"../../../../resources/6_SUPERANNUATION.pdf\" target=\"_blank\">SuperAnnuation</a></li>\r\n<li><a href=\"../../../../resources/7_CONSENT_FORM.pdf\" target=\"_blank\">Consent Form</a></li>\r\n</ul>', '2017-03-06 13:55:22', 124),
(19, '', 'Weekly Invoice', '\r\n<table width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td>{LOGO_WEB}</td>\r\n<td>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>\r\n<h3 style=\"color: #337ab7; margin: 0 0 5px 0;\">All Items Pty Ltd</h3>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td><span style=\"color: #337ab7; margin: 0 0 5px 0;\">ACN : 5555555</span></td>\r\n<td><span style=\"color: #337ab7; margin: 0 0 5px 0; padding-left: 10px;\">ABN : 2222222</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td><span style=\"color: #337ab7; margin: 0 0 5px 0;\">trading as</span></td>\r\n<td>\r\n<h3 style=\"color: #337ab7; margin: 0 0 0px 5px;\">NurseAid</h3>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"color: #337ab7; margin: 0 0 5px 0;\">PO Box: 259, Erindale Centre, ACT, 2903</span></td>\r\n</tr>\r\n<tr>\r\n<td><span style=\"color: #337ab7; margin: 0 0 5px 0;\">Phone 07 667 772882</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h1 style=\"color: #337ab7; margin-top: 0;\">&nbsp;</h1>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>{EMPLOYER_NAME}</td>\r\n</tr>\r\n<tr>\r\n<td>{EMPLOYER_ADDRESS_1}</td>\r\n</tr>\r\n<tr>\r\n<td>{EMPLOYER_ADDRESS_2}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td colspan=\"2\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>TAX Invoice Number - {TAX_INVOICE_NUMBER}</td>\r\n<td style=\"text-align: right;\">Date : {INVOICE_DATE}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n{INVOICE_CONTENTS} {NET_TABLE}\r\n<table style=\"width: 100%;\" align=\"left\">\r\n<tbody>\r\n<tr>\r\n<td>All Accounts payable 14 days</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Please pay to</td>\r\n</tr>\r\n<tr>\r\n<td>All Items Pty Ltd</td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-weight: bold;\">BSB 815-000</td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-weight: bold;\">Account No. 234799</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-weight: bold;\">Amount Payable : {AMOUNT_PAYABLE}</td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-weight: bold;\">Ref. : {TAX_INVOICE_NUMBER}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table style=\"width: 100%;\" align=\"left\">\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center;\">\r\n<h3 style=\"padding-bottom: 10px; font-size: 12px; color: #337ab7;\">http://www.nurseaid.com.au</h3>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2017-04-19 19:06:43', 124);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nimesh', 'nuru.freelancer@gmail.com', '$2y$10$3RiRc6MXLJYDoyusnhPPdOmPcca8MJwD0Q6WUjvLNioem5POrMZc.', NULL, '2017-06-22 03:29:42', '2017-06-22 03:29:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `hh_documents`
--
ALTER TABLE `hh_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hh_document_entity`
--
ALTER TABLE `hh_document_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_documents_document_entity` (`document_id`),
  ADD KEY `fk_entities_document_entity` (`entity_id`);

--
-- Indexes for table `hh_employees`
--
ALTER TABLE `hh_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entities_employees` (`entity_id`);

--
-- Indexes for table `hh_employers`
--
ALTER TABLE `hh_employers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entities_employers` (`entity_id`);

--
-- Indexes for table `hh_entities`
--
ALTER TABLE `hh_entities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hh_jobs`
--
ALTER TABLE `hh_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_job_categories_jobs` (`job_category_id`) USING BTREE,
  ADD KEY `fk_employers_jobs` (`employer_id`) USING BTREE;

--
-- Indexes for table `hh_job_applications`
--
ALTER TABLE `hh_job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jobs_job_applications` (`job_id`),
  ADD KEY `fk_employees_job_applications` (`employee_id`);

--
-- Indexes for table `hh_job_categories`
--
ALTER TABLE `hh_job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hh_ratings`
--
ALTER TABLE `hh_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jobs_ratings` (`job_id`),
  ADD KEY `fk_employees_ratings` (`employee_id`),
  ADD KEY `fk_employers_ratings` (`employer_id`);

--
-- Indexes for table `hh_site_cms`
--
ALTER TABLE `hh_site_cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hh_transaction`
--
ALTER TABLE `hh_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_roles`
--
ALTER TABLE `permission_roles`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_users`
--
ALTER TABLE `permission_users`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `permission_users_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `role_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cms`
--
ALTER TABLE `tbl_cms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tbl_cms_tbl_admin1` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `article_tag`
--
ALTER TABLE `article_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hh_documents`
--
ALTER TABLE `hh_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_document_entity`
--
ALTER TABLE `hh_document_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_employees`
--
ALTER TABLE `hh_employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_employers`
--
ALTER TABLE `hh_employers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_entities`
--
ALTER TABLE `hh_entities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_jobs`
--
ALTER TABLE `hh_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_job_applications`
--
ALTER TABLE `hh_job_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_job_categories`
--
ALTER TABLE `hh_job_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_ratings`
--
ALTER TABLE `hh_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_site_cms`
--
ALTER TABLE `hh_site_cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hh_transaction`
--
ALTER TABLE `hh_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `tbl_cms`
--
ALTER TABLE `tbl_cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `hh_document_entity`
--
ALTER TABLE `hh_document_entity`
  ADD CONSTRAINT `fk_documents_document_entity` FOREIGN KEY (`document_id`) REFERENCES `hh_documents` (`id`),
  ADD CONSTRAINT `fk_entities_document_entity` FOREIGN KEY (`entity_id`) REFERENCES `hh_entities` (`id`);

--
-- Constraints for table `hh_employees`
--
ALTER TABLE `hh_employees`
  ADD CONSTRAINT `fk_entities_employees` FOREIGN KEY (`entity_id`) REFERENCES `hh_entities` (`id`);

--
-- Constraints for table `hh_employers`
--
ALTER TABLE `hh_employers`
  ADD CONSTRAINT `fk_entities_employers` FOREIGN KEY (`entity_id`) REFERENCES `hh_entities` (`id`);

--
-- Constraints for table `hh_jobs`
--
ALTER TABLE `hh_jobs`
  ADD CONSTRAINT `FK_employerid` FOREIGN KEY (`employer_id`) REFERENCES `hh_employers` (`id`),
  ADD CONSTRAINT `FK_jobs_jobscategories` FOREIGN KEY (`job_category_id`) REFERENCES `hh_job_categories` (`id`);

--
-- Constraints for table `hh_job_applications`
--
ALTER TABLE `hh_job_applications`
  ADD CONSTRAINT `fk_employees_job_applications` FOREIGN KEY (`employee_id`) REFERENCES `hh_employees` (`id`),
  ADD CONSTRAINT `fk_jobs_job_applications` FOREIGN KEY (`job_id`) REFERENCES `hh_jobs` (`id`);

--
-- Constraints for table `hh_ratings`
--
ALTER TABLE `hh_ratings`
  ADD CONSTRAINT `fk_employees_ratings` FOREIGN KEY (`employee_id`) REFERENCES `hh_employees` (`id`),
  ADD CONSTRAINT `fk_employers_ratings` FOREIGN KEY (`employer_id`) REFERENCES `hh_employers` (`id`),
  ADD CONSTRAINT `fk_jobs_ratings` FOREIGN KEY (`job_id`) REFERENCES `hh_jobs` (`id`);

--
-- Constraints for table `permission_roles`
--
ALTER TABLE `permission_roles`
  ADD CONSTRAINT `permission_roles_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_users`
--
ALTER TABLE `permission_users`
  ADD CONSTRAINT `permission_users_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_users`
--
ALTER TABLE `role_users`
  ADD CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
