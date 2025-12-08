-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 08, 2025 at 06:59 PM
-- Server version: 10.11.14-MariaDB-cll-lve
-- PHP Version: 8.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zyrs8966_topup-games`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_post_id` bigint(20) UNSIGNED NOT NULL,
  `activityable_id` text DEFAULT NULL,
  `activityable_type` text DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `image_driver` varchar(20) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `admin_access` text DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `password`, `image`, `image_driver`, `phone`, `address`, `role_id`, `admin_access`, `last_login`, `last_seen`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '$2y$10$oJjedvDptyOeFa42S55bY.1vR065RK4wZAUAuVDBPVg4fS7bANY1u', 'adminProfileImage/N62QSX6kYEjOCqlYcKwpkKEdnA7cN0.webp', 'local', '+6283807914090', 'Indonesian, Jakarta', NULL, NULL, '2025-12-08 13:05:22', '2025-12-08 14:26:27', 1, 'jKFsyVq6QbfaKQkPx8bGPbb51korKPHXs5rt3d8B1UFnqyAj1yM2iwMLCy4c', NULL, '2025-12-08 07:26:27'),
(6, 'Eha Gaming', 'ehadmin', 'eha.biutipul@gamify.com', '$2y$10$buTilTaSFj.K8xkWGZ81/.V8diKR5r5rBLeEn5cqjbvaE26opKqC2', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-12-05 12:33:04', 1, NULL, '2025-12-05 05:28:53', '2025-12-05 05:33:04'),
(7, 'Natan TYZ', 'natanwok', 'natan.wibu@gamify.com', '$2y$10$KcZtyNGpaNA98ootNo5PPeUYGiI3irfQjjFthO3W12SWdvhQRjhQ.', NULL, NULL, NULL, NULL, 2, NULL, '2025-12-05 12:36:09', '2025-12-05 12:37:16', 1, NULL, '2025-12-05 05:30:17', '2025-12-05 05:37:16'),
(8, 'Kekez Impact', 'kekezpact', 'kekez.impact@gamify.com', '$2y$10$F8NhtO5Z2m8dpM.Kcb8IY.KJy0FlCEnHxY1bX1meRrg89ZO0bMGke', NULL, NULL, NULL, NULL, 3, NULL, '2025-12-05 12:35:16', '2025-12-05 12:35:58', 1, NULL, '2025-12-05 05:31:39', '2025-12-05 05:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `basic_controls`
--

CREATE TABLE `basic_controls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `time_zone` varchar(50) DEFAULT NULL,
  `base_currency` varchar(20) DEFAULT NULL,
  `currency_symbol` varchar(20) DEFAULT NULL,
  `admin_prefix` varchar(191) DEFAULT NULL,
  `is_currency_position` enum('left','right') NOT NULL DEFAULT 'left',
  `has_space_between_currency_and_amount` tinyint(1) NOT NULL DEFAULT 0,
  `is_force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `paginate` int(11) DEFAULT NULL,
  `strong_password` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => disable, 1 => enable',
  `fraction_number` int(11) DEFAULT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `sender_email_name` varchar(255) DEFAULT NULL,
  `email_description` text DEFAULT NULL,
  `push_notification` tinyint(1) NOT NULL DEFAULT 0,
  `in_app_notification` tinyint(1) NOT NULL DEFAULT 0,
  `active_in_app` enum('pusher','reverb') NOT NULL DEFAULT 'pusher',
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `tawk_id` varchar(255) DEFAULT NULL,
  `tawk_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_messenger_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_app_id` varchar(255) DEFAULT NULL,
  `fb_page_id` varchar(255) DEFAULT NULL,
  `manual_recaptcha` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =>inactive, 1 => active',
  `google_recaptcha` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>inactive, 1 =>active',
  `recaptcha_admin_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '	0 => inactive, 1 => active',
  `google_reCapture_admin_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '	0 => inactive, 1 => active',
  `google_reCaptcha_status_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '	0 => inactive, 1 => active',
  `google_recaptcha_admin_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '	0 => inactive, 1 => active',
  `google_reCaptcha_status_registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '	0 => inactive, 1 => active',
  `reCaptcha_status_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '	0 => inactive, 1 => active',
  `reCaptcha_status_registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '	0 => inactive, 1 => active',
  `measurement_id` varchar(255) DEFAULT NULL,
  `analytic_status` tinyint(1) DEFAULT NULL,
  `error_log` tinyint(1) DEFAULT NULL,
  `is_active_cron_notification` tinyint(1) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_driver` varchar(20) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `favicon_driver` varchar(20) DEFAULT NULL,
  `admin_logo` varchar(255) DEFAULT NULL,
  `admin_logo_driver` varchar(20) DEFAULT NULL,
  `admin_dark_mode_logo` varchar(255) DEFAULT NULL,
  `admin_dark_mode_logo_driver` varchar(50) DEFAULT NULL,
  `currency_layer_access_key` varchar(191) DEFAULT NULL,
  `currency_layer_auto_update_at` varchar(191) DEFAULT NULL,
  `currency_layer_auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `coin_market_cap_app_key` varchar(191) DEFAULT NULL,
  `coin_market_cap_auto_update_at` varchar(191) DEFAULT NULL,
  `coin_market_cap_auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `date_time_format` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `cookie_status` tinyint(1) NOT NULL DEFAULT 0,
  `cookie_heading` varchar(255) DEFAULT NULL,
  `cookie_description` text DEFAULT NULL,
  `cookie_button` varchar(255) DEFAULT NULL,
  `cookie_button_link` varchar(255) DEFAULT NULL,
  `cookie_image` varchar(200) DEFAULT NULL,
  `cookie_image_driver` varchar(50) DEFAULT NULL,
  `table_view` enum('flex','scrolling') NOT NULL DEFAULT 'scrolling' COMMENT 'How to show user pannel mobile version table view',
  `sell_post` tinyint(1) NOT NULL DEFAULT 1,
  `payment_expired` int(11) NOT NULL DEFAULT 15,
  `payment_released` int(11) NOT NULL DEFAULT 7,
  `top_up` tinyint(1) NOT NULL DEFAULT 1,
  `card` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `app_color` varchar(255) DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  `app_build` varchar(255) DEFAULT NULL,
  `is_major` varchar(255) DEFAULT NULL,
  `light_primary_color` varchar(50) DEFAULT NULL,
  `light_secondary_color` varchar(50) DEFAULT NULL,
  `dark_primary_color` varchar(50) DEFAULT NULL,
  `dark_secondary_color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_controls`
--

INSERT INTO `basic_controls` (`id`, `theme`, `site_title`, `time_zone`, `base_currency`, `currency_symbol`, `admin_prefix`, `is_currency_position`, `has_space_between_currency_and_amount`, `is_force_ssl`, `is_maintenance_mode`, `paginate`, `strong_password`, `registration`, `fraction_number`, `sender_email`, `sender_email_name`, `email_description`, `push_notification`, `in_app_notification`, `active_in_app`, `email_notification`, `email_verification`, `sms_notification`, `sms_verification`, `tawk_id`, `tawk_status`, `fb_messenger_status`, `fb_app_id`, `fb_page_id`, `manual_recaptcha`, `google_recaptcha`, `recaptcha_admin_login`, `google_reCapture_admin_login`, `google_reCaptcha_status_login`, `google_recaptcha_admin_login`, `google_reCaptcha_status_registration`, `reCaptcha_status_login`, `reCaptcha_status_registration`, `measurement_id`, `analytic_status`, `error_log`, `is_active_cron_notification`, `logo`, `logo_driver`, `favicon`, `favicon_driver`, `admin_logo`, `admin_logo_driver`, `admin_dark_mode_logo`, `admin_dark_mode_logo_driver`, `currency_layer_access_key`, `currency_layer_auto_update_at`, `currency_layer_auto_update`, `coin_market_cap_app_key`, `coin_market_cap_auto_update_at`, `coin_market_cap_auto_update`, `date_time_format`, `contact_number`, `cookie_status`, `cookie_heading`, `cookie_description`, `cookie_button`, `cookie_button_link`, `cookie_image`, `cookie_image_driver`, `table_view`, `sell_post`, `payment_expired`, `payment_released`, `top_up`, `card`, `created_at`, `updated_at`, `app_color`, `app_version`, `app_build`, `is_major`, `light_primary_color`, `light_secondary_color`, `dark_primary_color`, `dark_secondary_color`) VALUES
(1, 'dark', 'Gamify', 'Asia/Jakarta', 'IDR', 'Rp.', 'admin', 'left', 0, 1, 0, 10, 0, 1, 2, 'support@gmail.com', 'Bug Admin', '<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n<meta name=\"viewport\" content=\"width=device-width\">\n<style type=\"text/css\">\n    @media only screen and (min-width: 620px) {\n        * [lang=x-wrapper] h1 {\n        }\n\n        * [lang=x-wrapper] h1 {\n            font-size: 26px !important;\n            line-height: 34px !important\n        }\n\n        * [lang=x-wrapper] h2 {\n        }\n\n        * [lang=x-wrapper] h2 {\n            font-size: 20px !important;\n            line-height: 28px !important\n        }\n\n        * [lang=x-wrapper] h3 {\n        }\n\n        * [lang=x-layout__inner] p,\n        * [lang=x-layout__inner] ol,\n        * [lang=x-layout__inner] ul {\n        }\n\n        * div [lang=x-size-8] {\n            font-size: 8px !important;\n            line-height: 14px !important\n        }\n\n        * div [lang=x-size-9] {\n            font-size: 9px !important;\n            line-height: 16px !important\n        }\n\n        * div [lang=x-size-10] {\n            font-size: 10px !important;\n            line-height: 18px !important\n        }\n\n        * div [lang=x-size-11] {\n            font-size: 11px !important;\n            line-height: 19px !important\n        }\n\n        * div [lang=x-size-12] {\n            font-size: 12px !important;\n            line-height: 19px !important\n        }\n\n        * div [lang=x-size-13] {\n            font-size: 13px !important;\n            line-height: 21px !important\n        }\n\n        * div [lang=x-size-14] {\n            font-size: 14px !important;\n            line-height: 21px !important\n        }\n\n        * div [lang=x-size-15] {\n            font-size: 15px !important;\n            line-height: 23px !important\n        }\n\n        * div [lang=x-size-16] {\n            font-size: 16px !important;\n            line-height: 24px !important\n        }\n\n        * div [lang=x-size-17] {\n            font-size: 17px !important;\n            line-height: 26px !important\n        }\n\n        * div [lang=x-size-18] {\n            font-size: 18px !important;\n            line-height: 26px !important\n        }\n\n        * div [lang=x-size-18] {\n            font-size: 18px !important;\n            line-height: 26px !important\n        }\n\n        * div [lang=x-size-20] {\n            font-size: 20px !important;\n            line-height: 28px !important\n        }\n\n        * div [lang=x-size-22] {\n            font-size: 22px !important;\n            line-height: 31px !important\n        }\n\n        * div [lang=x-size-24] {\n            font-size: 24px !important;\n            line-height: 32px !important\n        }\n\n        * div [lang=x-size-26] {\n            font-size: 26px !important;\n            line-height: 34px !important\n        }\n\n        * div [lang=x-size-28] {\n            font-size: 28px !important;\n            line-height: 36px !important\n        }\n\n        * div [lang=x-size-30] {\n            font-size: 30px !important;\n            line-height: 38px !important\n        }\n\n        * div [lang=x-size-32] {\n            font-size: 32px !important;\n            line-height: 40px !important\n        }\n\n        * div [lang=x-size-34] {\n            font-size: 34px !important;\n            line-height: 43px !important\n        }\n\n        * div [lang=x-size-36] {\n            font-size: 36px !important;\n            line-height: 43px !important\n        }\n\n        * div [lang=x-size-40] {\n            font-size: 40px !important;\n            line-height: 47px !important\n        }\n\n        * div [lang=x-size-44] {\n            font-size: 44px !important;\n            line-height: 50px !important\n        }\n\n        * div [lang=x-size-48] {\n            font-size: 48px !important;\n            line-height: 54px !important\n        }\n\n        * div [lang=x-size-56] {\n            font-size: 56px !important;\n            line-height: 60px !important\n        }\n\n        * div [lang=x-size-64] {\n            font-size: 64px !important;\n            line-height: 63px !important\n        }\n    }\n</style>\n<style type=\"text/css\">\n    body {\n        margin: 0;\n        padding: 0;\n    }\n\n    table {\n        border-collapse: collapse;\n        table-layout: fixed;\n    }\n\n    * {\n        line-height: inherit;\n    }\n\n    [x-apple-data-detectors],\n    [href^=\"tel\"],\n    [href^=\"sms\"] {\n        color: inherit !important;\n        text-decoration: none !important;\n    }\n\n    .wrapper .footer__share-button a:hover,\n    .wrapper .footer__share-button a:focus {\n        color: #ffffff !important;\n    }\n\n    .btn a:hover,\n    .btn a:focus,\n    .footer__share-button a:hover,\n    .footer__share-button a:focus,\n    .email-footer__links a:hover,\n    .email-footer__links a:focus {\n        opacity: 0.8;\n    }\n\n    .preheader,\n    .header,\n    .layout,\n    .column {\n        transition: width 0.25s ease-in-out, max-width 0.25s ease-in-out;\n    }\n\n    .layout,\n    .header {\n        max-width: 400px !important;\n        -fallback-width: 95% !important;\n        width: calc(100% - 20px) !important;\n    }\n\n    div.preheader {\n        max-width: 360px !important;\n        -fallback-width: 90% !important;\n        width: calc(100% - 60px) !important;\n    }\n\n    .snippet,\n    .webversion {\n        Float: none !important;\n    }\n\n    .column {\n        max-width: 400px !important;\n        width: 100% !important;\n    }\n\n    .fixed-width.has-border {\n        max-width: 402px !important;\n    }\n\n    .fixed-width.has-border .layout__inner {\n        box-sizing: border-box;\n    }\n\n    .snippet,\n    .webversion {\n        width: 50% !important;\n    }\n\n    .ie .btn {\n        width: 100%;\n    }\n\n    .ie .column,\n    [owa] .column,\n    .ie .gutter,\n    [owa] .gutter {\n        display: table-cell;\n        float: none !important;\n        vertical-align: top;\n    }\n\n    .ie div.preheader,\n    [owa] div.preheader,\n    .ie .email-footer,\n    [owa] .email-footer {\n        max-width: 560px !important;\n        width: 560px !important;\n    }\n\n    .ie .snippet,\n    [owa] .snippet,\n    .ie .webversion,\n    [owa] .webversion {\n        width: 280px !important;\n    }\n\n    .ie .header,\n    [owa] .header,\n    .ie .layout,\n    [owa] .layout,\n    .ie .one-col .column,\n    [owa] .one-col .column {\n        max-width: 600px !important;\n        width: 600px !important;\n    }\n\n    .ie .fixed-width.has-border,\n    [owa] .fixed-width.has-border,\n    .ie .has-gutter.has-border,\n    [owa] .has-gutter.has-border {\n        max-width: 602px !important;\n        width: 602px !important;\n    }\n\n    .ie .two-col .column,\n    [owa] .two-col .column {\n        width: 300px !important;\n    }\n\n    .ie .three-col .column,\n    [owa] .three-col .column,\n    .ie .narrow,\n    [owa] .narrow {\n        width: 200px !important;\n    }\n\n    .ie .wide,\n    [owa] .wide {\n        width: 400px !important;\n    }\n\n    .ie .two-col.has-gutter .column,\n    [owa] .two-col.x_has-gutter .column {\n        width: 290px !important;\n    }\n\n    .ie .three-col.has-gutter .column,\n    [owa] .three-col.x_has-gutter .column,\n    .ie .has-gutter .narrow,\n    [owa] .has-gutter .narrow {\n        width: 188px !important;\n    }\n\n    .ie .has-gutter .wide,\n    [owa] .has-gutter .wide {\n        width: 394px !important;\n    }\n\n    .ie .two-col.has-gutter.has-border .column,\n    [owa] .two-col.x_has-gutter.x_has-border .column {\n        width: 292px !important;\n    }\n\n    .ie .three-col.has-gutter.has-border .column,\n    [owa] .three-col.x_has-gutter.x_has-border .column,\n    .ie .has-gutter.has-border .narrow,\n    [owa] .has-gutter.x_has-border .narrow {\n        width: 190px !important;\n    }\n\n    .ie .has-gutter.has-border .wide,\n    [owa] .has-gutter.x_has-border .wide {\n        width: 396px !important;\n    }\n\n    .ie .fixed-width .layout__inner {\n        border-left: 0 none white !important;\n        border-right: 0 none white !important;\n    }\n\n    .ie .layout__edges {\n        display: none;\n    }\n\n    .mso .layout__edges {\n        font-size: 0;\n    }\n\n    .layout-fixed-width,\n    .mso .layout-full-width {\n        background-color: #ffffff;\n    }\n\n    @media only screen and (min-width: 620px) {\n\n        .column,\n        .gutter {\n            display: table-cell;\n            Float: none !important;\n            vertical-align: top;\n        }\n\n        div.preheader,\n        .email-footer {\n            max-width: 560px !important;\n            width: 560px !important;\n        }\n\n        .snippet,\n        .webversion {\n            width: 280px !important;\n        }\n\n        .header,\n        .layout,\n        .one-col .column {\n            max-width: 600px !important;\n            width: 600px !important;\n        }\n\n        .fixed-width.has-border,\n        .fixed-width.ecxhas-border,\n        .has-gutter.has-border,\n        .has-gutter.ecxhas-border {\n            max-width: 602px !important;\n            width: 602px !important;\n        }\n\n        .two-col .column {\n            width: 300px !important;\n        }\n\n        .three-col .column,\n        .column.narrow {\n            width: 200px !important;\n        }\n\n        .column.wide {\n            width: 400px !important;\n        }\n\n        .two-col.has-gutter .column,\n        .two-col.ecxhas-gutter .column {\n            width: 290px !important;\n        }\n\n        .three-col.has-gutter .column,\n        .three-col.ecxhas-gutter .column,\n        .has-gutter .narrow {\n            width: 188px !important;\n        }\n\n        .has-gutter .wide {\n            width: 394px !important;\n        }\n\n        .two-col.has-gutter.has-border .column,\n        .two-col.ecxhas-gutter.ecxhas-border .column {\n            width: 292px !important;\n        }\n\n        .three-col.has-gutter.has-border .column,\n        .three-col.ecxhas-gutter.ecxhas-border .column,\n        .has-gutter.has-border .narrow,\n        .has-gutter.ecxhas-border .narrow {\n            width: 190px !important;\n        }\n\n        .has-gutter.has-border .wide,\n        .has-gutter.ecxhas-border .wide {\n            width: 396px !important;\n        }\n    }\n\n    @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {\n        .fblike {\n            background-image: url(https://i3.createsend1.com/static/eb/customise/13-the-blueprint-3/images/fblike@2x.png) !important;\n        }\n\n        .tweet {\n            background-image: url(https://i4.createsend1.com/static/eb/customise/13-the-blueprint-3/images/tweet@2x.png) !important;\n        }\n\n        .linkedinshare {\n            background-image: url(https://i6.createsend1.com/static/eb/customise/13-the-blueprint-3/images/lishare@2x.png) !important;\n        }\n\n        .forwardtoafriend {\n            background-image: url(https://i5.createsend1.com/static/eb/customise/13-the-blueprint-3/images/forward@2x.png) !important;\n        }\n    }\n\n    @media (max-width: 321px) {\n        .fixed-width.has-border .layout__inner {\n            border-width: 1px 0 !important;\n        }\n\n        .layout,\n        .column {\n            min-width: 320px !important;\n            width: 320px !important;\n        }\n\n        .border {\n            display: none;\n        }\n    }\n\n    .mso div {\n        border: 0 none white !important;\n    }\n\n    .mso .w560 .divider {\n        margin-left: 260px !important;\n        margin-right: 260px !important;\n    }\n\n    .mso .w360 .divider {\n        margin-left: 160px !important;\n        margin-right: 160px !important;\n    }\n\n    .mso .w260 .divider {\n        margin-left: 110px !important;\n        margin-right: 110px !important;\n    }\n\n    .mso .w160 .divider {\n        margin-left: 60px !important;\n        margin-right: 60px !important;\n    }\n\n    .mso .w354 .divider {\n        margin-left: 157px !important;\n        margin-right: 157px !important;\n    }\n\n    .mso .w250 .divider {\n        margin-left: 105px !important;\n        margin-right: 105px !important;\n    }\n\n    .mso .w148 .divider {\n        margin-left: 54px !important;\n        margin-right: 54px !important;\n    }\n\n    .mso .font-avenir,\n    .mso .font-cabin,\n    .mso .font-open-sans,\n    .mso .font-ubuntu {\n        font-family: sans-serif !important;\n    }\n\n    .mso .font-bitter,\n    .mso .font-merriweather,\n    .mso .font-pt-serif {\n        font-family: Georgia, serif !important;\n    }\n\n    .mso .font-lato,\n    .mso .font-roboto {\n        font-family: Tahoma, sans-serif !important;\n    }\n\n    .mso .font-pt-sans {\n        font-family: \"Trebuchet MS\", sans-serif !important;\n    }\n\n    .mso .footer__share-button p {\n        margin: 0;\n    }\n\n    @media only screen and (min-width: 620px) {\n        .wrapper .size-8 {\n            font-size: 8px !important;\n            line-height: 14px !important;\n        }\n\n        .wrapper .size-9 {\n            font-size: 9px !important;\n            line-height: 16px !important;\n        }\n\n        .wrapper .size-10 {\n            font-size: 10px !important;\n            line-height: 18px !important;\n        }\n\n        .wrapper .size-11 {\n            font-size: 11px !important;\n            line-height: 19px !important;\n        }\n\n        .wrapper .size-12 {\n            font-size: 12px !important;\n            line-height: 19px !important;\n        }\n\n        .wrapper .size-13 {\n            font-size: 13px !important;\n            line-height: 21px !important;\n        }\n\n        .wrapper .size-14 {\n            font-size: 14px !important;\n            line-height: 21px !important;\n        }\n\n        .wrapper .size-15 {\n            font-size: 15px !important;\n            line-height: 23px !important;\n        }\n\n        .wrapper .size-16 {\n            font-size: 16px !important;\n            line-height: 24px !important;\n        }\n\n        .wrapper .size-17 {\n            font-size: 17px !important;\n            line-height: 26px !important;\n        }\n\n        .wrapper .size-18 {\n            font-size: 18px !important;\n            line-height: 26px !important;\n        }\n\n        .wrapper .size-20 {\n            font-size: 20px !important;\n            line-height: 28px !important;\n        }\n\n        .wrapper .size-22 {\n            font-size: 22px !important;\n            line-height: 31px !important;\n        }\n\n        .wrapper .size-24 {\n            font-size: 24px !important;\n            line-height: 32px !important;\n        }\n\n        .wrapper .size-26 {\n            font-size: 26px !important;\n            line-height: 34px !important;\n        }\n\n        .wrapper .size-28 {\n            font-size: 28px !important;\n            line-height: 36px !important;\n        }\n\n        .wrapper .size-30 {\n            font-size: 30px !important;\n            line-height: 38px !important;\n        }\n\n        .wrapper .size-32 {\n            font-size: 32px !important;\n            line-height: 40px !important;\n        }\n\n        .wrapper .size-34 {\n            font-size: 34px !important;\n            line-height: 43px !important;\n        }\n\n        .wrapper .size-36 {\n            font-size: 36px !important;\n            line-height: 43px !important;\n        }\n\n        .wrapper .size-40 {\n            font-size: 40px !important;\n            line-height: 47px !important;\n        }\n\n        .wrapper .size-44 {\n            font-size: 44px !important;\n            line-height: 50px !important;\n        }\n\n        .wrapper .size-48 {\n            font-size: 48px !important;\n            line-height: 54px !important;\n        }\n\n        .wrapper .size-56 {\n            font-size: 56px !important;\n            line-height: 60px !important;\n        }\n\n        .wrapper .size-64 {\n            font-size: 64px !important;\n            line-height: 63px !important;\n        }\n    }\n\n    .mso .size-8,\n    .ie .size-8 {\n        font-size: 8px !important;\n        line-height: 14px !important;\n    }\n\n    .mso .size-9,\n    .ie .size-9 {\n        font-size: 9px !important;\n        line-height: 16px !important;\n    }\n\n    .mso .size-10,\n    .ie .size-10 {\n        font-size: 10px !important;\n        line-height: 18px !important;\n    }\n\n    .mso .size-11,\n    .ie .size-11 {\n        font-size: 11px !important;\n        line-height: 19px !important;\n    }\n\n    .mso .size-12,\n    .ie .size-12 {\n        font-size: 12px !important;\n        line-height: 19px !important;\n    }\n\n    .mso .size-13,\n    .ie .size-13 {\n        font-size: 13px !important;\n        line-height: 21px !important;\n    }\n\n    .mso .size-14,\n    .ie .size-14 {\n        font-size: 14px !important;\n        line-height: 21px !important;\n    }\n\n    .mso .size-15,\n    .ie .size-15 {\n        font-size: 15px !important;\n        line-height: 23px !important;\n    }\n\n    .mso .size-16,\n    .ie .size-16 {\n        font-size: 16px !important;\n        line-height: 24px !important;\n    }\n\n    .mso .size-17,\n    .ie .size-17 {\n        font-size: 17px !important;\n        line-height: 26px !important;\n    }\n\n    .mso .size-18,\n    .ie .size-18 {\n        font-size: 18px !important;\n        line-height: 26px !important;\n    }\n\n    .mso .size-20,\n    .ie .size-20 {\n        font-size: 20px !important;\n        line-height: 28px !important;\n    }\n\n    .mso .size-22,\n    .ie .size-22 {\n        font-size: 22px !important;\n        line-height: 31px !important;\n    }\n\n    .mso .size-24,\n    .ie .size-24 {\n        font-size: 24px !important;\n        line-height: 32px !important;\n    }\n\n    .mso .size-26,\n    .ie .size-26 {\n        font-size: 26px !important;\n        line-height: 34px !important;\n    }\n\n    .mso .size-28,\n    .ie .size-28 {\n        font-size: 28px !important;\n        line-height: 36px !important;\n    }\n\n    .mso .size-30,\n    .ie .size-30 {\n        font-size: 30px !important;\n        line-height: 38px !important;\n    }\n\n    .mso .size-32,\n    .ie .size-32 {\n        font-size: 32px !important;\n        line-height: 40px !important;\n    }\n\n    .mso .size-34,\n    .ie .size-34 {\n        font-size: 34px !important;\n        line-height: 43px !important;\n    }\n\n    .mso .size-36,\n    .ie .size-36 {\n        font-size: 36px !important;\n        line-height: 43px !important;\n    }\n\n    .mso .size-40,\n    .ie .size-40 {\n        font-size: 40px !important;\n        line-height: 47px !important;\n    }\n\n    .mso .size-44,\n    .ie .size-44 {\n        font-size: 44px !important;\n        line-height: 50px !important;\n    }\n\n    .mso .size-48,\n    .ie .size-48 {\n        font-size: 48px !important;\n        line-height: 54px !important;\n    }\n\n    .mso .size-56,\n    .ie .size-56 {\n        font-size: 56px !important;\n        line-height: 60px !important;\n    }\n\n    .mso .size-64,\n    .ie .size-64 {\n        font-size: 64px !important;\n        line-height: 63px !important;\n    }\n\n    .footer__share-button p {\n        margin: 0;\n    }\n</style>\n\n<title></title>\n<!--[if !mso]><!-->\n<style type=\"text/css\">\n    @import url(https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400);\n</style>\n<link href=\"https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400\" rel=\"stylesheet\" type=\"text/css\">\n<!--<![endif]-->\n<style type=\"text/css\">\n    body {\n        background-color: #f5f7fa\n    }\n\n    .mso h1 {\n    }\n\n    .mso h1 {\n        font-family: sans-serif !important\n    }\n\n    .mso h2 {\n    }\n\n    .mso h3 {\n    }\n\n    .mso .column,\n    .mso .column__background td {\n    }\n\n    .mso .column,\n    .mso .column__background td {\n        font-family: sans-serif !important\n    }\n\n    .mso .btn a {\n    }\n\n    .mso .btn a {\n        font-family: sans-serif !important\n    }\n\n    .mso .webversion,\n    .mso .snippet,\n    .mso .layout-email-footer td,\n    .mso .footer__share-button p {\n    }\n\n    .mso .webversion,\n    .mso .snippet,\n    .mso .layout-email-footer td,\n    .mso .footer__share-button p {\n        font-family: sans-serif !important\n    }\n\n    .mso .logo {\n    }\n\n    .mso .logo {\n        font-family: Tahoma, sans-serif !important\n    }\n\n    .logo a:hover,\n    .logo a:focus {\n        color: #859bb1 !important\n    }\n\n    .mso .layout-has-border {\n        border-top: 1px solid #b1c1d8;\n        border-bottom: 1px solid #b1c1d8\n    }\n\n    .mso .layout-has-bottom-border {\n        border-bottom: 1px solid #b1c1d8\n    }\n\n    .mso .border,\n    .ie .border {\n        background-color: #b1c1d8\n    }\n\n    @media only screen and (min-width: 620px) {\n        .wrapper h1 {\n        }\n\n        .wrapper h1 {\n            font-size: 26px !important;\n            line-height: 34px !important\n        }\n\n        .wrapper h2 {\n        }\n\n        .wrapper h2 {\n            font-size: 20px !important;\n            line-height: 28px !important\n        }\n\n        .wrapper h3 {\n        }\n\n        .column p,\n        .column ol,\n        .column ul {\n        }\n    }\n\n    .mso h1,\n    .ie h1 {\n    }\n\n    .mso h1,\n    .ie h1 {\n        font-size: 26px !important;\n        line-height: 34px !important\n    }\n\n    .mso h2,\n    .ie h2 {\n    }\n\n    .mso h2,\n    .ie h2 {\n        font-size: 20px !important;\n        line-height: 28px !important\n    }\n\n    .mso h3,\n    .ie h3 {\n    }\n\n    .mso .layout__inner p,\n    .ie .layout__inner p,\n    .mso .layout__inner ol,\n    .ie .layout__inner ol,\n    .mso .layout__inner ul,\n    .ie .layout__inner ul {\n    }\n</style>\n<meta name=\"robots\" content=\"noindex,nofollow\">\n\n<meta property=\"og:title\" content=\"Just One More Step\">\n\n<link href=\"https://css.createsend1.com/css/social.min.css?h=0ED47CE120160920\" media=\"screen,projection\" rel=\"stylesheet\" type=\"text/css\">\n\n\n<div class=\"wrapper\" style=\"min-width: 320px;background-color: #f5f7fa;\" lang=\"x-wrapper\">\n    <div class=\"preheader\" style=\"margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;\">\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\n            </div>\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\n            </div>\n        </div>\n\n        <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #c4e5dc;\" lang=\"x-layout__inner\">\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\n                    <div style=\"margin-left: 20px;margin-right: 20px;margin-top: 24px;margin-bottom: 24px;\">\n                        <h1 style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #44a8c7;font-size: 36px;line-height: 43px;font-family: bitter,georgia,serif;text-align: center;\">\n                            <img style=\"width: 200px;\" src=\"https://bug-finder.s3.ap-southeast-1.amazonaws.com/assets/logo/header-logo.svg\" data-filename=\"imageedit_76_3542310111.png\"></h1>\n                    </div>\n                </div>\n            </div>\n\n            <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\n                <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;\" lang=\"x-layout__inner\">\n                    <div class=\"column\" style=\"text-align: left; background: rgb(237, 241, 235); line-height: 21px; max-width: 600px; min-width: 320px; width: 320px;\">\n\n                        <div style=\"color: rgb(96, 102, 109); font-size: 14px; margin-left: 20px; margin-right: 20px; margin-top: 24px;\">\n                            <div style=\"line-height:10px;font-size:1px\">&nbsp;</div>\n                        </div>\n\n                        <div style=\"margin-left: 20px; margin-right: 20px;\">\n\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 16px; margin-bottom: 0px;\"><strong>Hello [[name]],</strong></p>\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 20px; margin-bottom: 20px;\"><strong>[[message]]</strong></p>\n                            <p style=\"margin-top: 20px; margin-bottom: 20px;\"><strong style=\"color: rgb(96, 102, 109); font-size: 14px;\">Sincerely,<br>Team&nbsp;</strong><font color=\"#60666d\"><b>Bug Finder</b></font></p>\n                        </div>\n\n                    </div>\n                </div>\n            </div>\n\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #2c3262; margin-bottom: 20px\" lang=\"x-layout__inner\">\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\n                    <div style=\"margin-top: 5px;margin-bottom: 5px;\">\n                        <p style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #ffffff;font-size: 16px;line-height: 35px;font-family: bitter,georgia,serif;text-align: center;\">\n                            2024 ©  All Right Reserved</p>\n                    </div>\n                </div>\n            </div>\n\n        </div>\n\n\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\n            </div>\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\n            </div>\n        </div>\n    </div>\n</div>', 0, 0, 'pusher', 0, 0, 0, 0, 'XXXXXXXXXXXX', 0, 0, 'XXXXXXXXXXXX', 'XXXXXXXXXXXX', 0, 0, 1, 1, 1, 1, 1, 1, 1, 'XXXXXXXXXXXXXXX', 1, 0, 1, 'logo/y1953xDKMLSeleh7QyAQNvgthBKMPn.webp', 'local', 'logo/bB6DWZcUQbASh6YVkrUycuIFOkmON4.webp', 'local', 'logo/Kap36fDNXpxYTAJS02LOyJZi7s0zyR.webp', 'local', 'logo/FVmXMb77vrURw7662h0sNffZjLHJ9d.webp', 'local', 'XXXXXXXXXXXX', 'everyMinute', 0, 'XXXXXXXXXXXX', 'everyMinute', 0, 'l, F j, Y', '+6283807914090', 0, 'We Use Cookies!', 'We use cookies to ensure that give you the best experience on your website.', 'See more', 'cookie-policy', 'cookie/mMlmi1wOgdEIIlB8S9Oxpp7kA8IcKT.webp', 'local', 'flex', 1, 30, 7, 1, 1, NULL, '2025-12-05 15:47:28', '#2c9cfe', '1.1.0', '25,26,27', '1', '#6f4ff2', '#292d32', '#6f4ff2', '#000000');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `blog_image` varchar(255) DEFAULT NULL,
  `blog_image_driver` varchar(255) DEFAULT NULL,
  `banner_image` text DEFAULT NULL,
  `banner_image_driver` varchar(10) DEFAULT NULL,
  `breadcrumb_status` varchar(255) DEFAULT NULL,
  `breadcrumb_image` varchar(255) DEFAULT NULL,
  `breadcrumb_image_driver` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_image_driver` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `slug`, `blog_image`, `blog_image_driver`, `banner_image`, `banner_image_driver`, `breadcrumb_status`, `breadcrumb_image`, `breadcrumb_image_driver`, `status`, `page_title`, `meta_title`, `meta_keywords`, `meta_description`, `meta_image`, `meta_image_driver`, `created_at`, `updated_at`) VALUES
(1, 2, 'guide-to-game-top-up', 'blog/bbMhuaLFzwzxgETDtTeW6M48AODiw5.webp', 'local', 'blog/9QB8k33amSURRmgZwhI6w7p4IvrB5W.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:03:50', '2025-01-27 11:30:07'),
(2, 3, 'guide-to-gift-card', 'blog/IiAV8a9fLn5o0EM5YGE2RiibjcUZ3N.webp', 'local', 'blog/D4PnbbHSOS9hKiouMxRhWUxoRdqdZh.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:09:07', '2025-01-27 11:30:04'),
(3, 1, 'evolution-of-pubg', 'blog/ySuZMbvUnAPVykKp3OykAz0PQ9xjjt.webp', 'local', 'blog/3RjElSZtBxAkW6JeTgloY9i8zxiIhE.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 11:11:15', '2025-01-27 11:30:01'),
(4, 4, 'gold-piggy-bank', 'blog/FtgCy2EbhO1z45DgP397Br4n2ezAva.webp', 'local', 'blog/LQvbkTabi5csBb4LxAFJlL0ORgM6c6.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-31 06:54:32', '2025-01-27 11:29:57'),
(5, 1, 'gold-piggy-bank-with-gold-coin', 'blog/qzWl5E3P1kKlXHapAW50cBdTn6tSSS.webp', 'local', 'blog/EqSg0T19S5KQjEsN2xT7SicAQOEKyU.webp', 'local', NULL, NULL, NULL, 1, 'Blog Details', 'Gold piggy bank with gold coin money stacks and growing', '[\"Gold\",\"piggy\",\"stacks\"]', 'Gift cards have become a popular and versatile gifting option for people of all ages. Whether you\'re looking for a last-minute present, a way to give someone the freedom to choose their gift, or a simple way to manage spending, gift cards offer a convenient solution.', '/OMQHIYB8XghHEaCSxEhpytbTB1bHx8.webp', 'local', '2024-10-31 06:56:34', '2025-01-27 11:29:54'),
(6, 3, 'gold-piggy-bank-with-gold-coin-and-growing', 'blog/2vmsUUDiYEcOG4G6TO9QJboeBiQPPJ.webp', 'local', 'blog/GzJxKrm0NGVD2wbFMXrBzD7qoOoJsW.webp', 'local', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-31 06:57:14', '2025-01-27 11:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Beginners Gamers', 'beginners-gamers', 1, '2024-07-31 10:52:07', '2025-01-27 10:45:31'),
(2, 'Top Up', 'top-up', 1, '2024-07-31 10:52:42', '2025-01-27 10:45:28'),
(3, 'Gift Card', 'gift-card', 1, '2024-07-31 10:53:02', '2025-01-27 10:45:25'),
(4, 'Announcement', 'announcement', 1, '2024-10-31 06:36:28', '2025-01-27 10:45:21');

-- --------------------------------------------------------

--
-- Table structure for table `blog_details`
--

CREATE TABLE `blog_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_details`
--

INSERT INTO `blog_details` (`id`, `blog_id`, `language_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'The Ultimate Guide to Game Top-Up: Everything You Need to Know', '<h3>Introduction</h3><p>In the world of online gaming, game top-up services have become an essential part of the experience. Whether you\'re purchasing in-game currency, unlocking new content, or buying exclusive items, topping up your game account can enhance your gameplay and provide you with exciting opportunities. In this blog, we\'ll explore everything you need to know about game top-up services, from the benefits and methods to the best practices and tips for a smooth experience.</p><h3>What is a Game Top-Up?</h3><p>A game top-up is the process of adding funds or virtual currency to your gaming account. This can be used to purchase in-game items, skins, upgrades, or other digital goods. Game top-ups are typically done through online platforms, mobile apps, or directly within the game itself. They offer a convenient way for players to enhance their gaming experience by accessing premium content.</p><h3>Why Do Players Use Game Top-Up Services?</h3><ol><li><p><strong>Access to Exclusive Content</strong>: Many games offer exclusive items, characters, or levels that can only be accessed through in-game purchases. Top-up services enable players to acquire these items, giving them a competitive edge or unique customization options.</p></li><li><p><strong>Convenience</strong>: Game top-up services provide a quick and easy way to purchase in-game currency without the need for a credit card or bank transfer every time. This is especially useful for mobile gamers who prefer using prepaid cards or e-wallets.</p></li><li><p><strong>Promotions and Discounts</strong>: Players often receive bonuses, discounts, or promotional items when they top up their accounts. These offers can provide additional value and enhance the overall gaming experience.Popular Game Top-Up Methods</p></li></ol><ol><li><p><strong>Credit/Debit Cards</strong>: One of the most common methods, allowing players to use their bank cards to purchase in-game currency.</p></li><li><p><strong>E-Wallets</strong>: Platforms like PayPal, Skrill, and Payoneer offer secure and fast transactions for game top-ups.</p></li><li><p><strong>Prepaid Cards</strong>: Many players use prepaid cards like Google Play, iTunes, or specific game cards to top up their accounts without linking their bank accounts.</p></li><li><p><strong>Cryptocurrency</strong>: With the rise of digital currencies, some platforms accept cryptocurrencies like Bitcoin for game top-ups.</p></li><li><p><strong>Mobile Payment</strong>: Services like Apple Pay, Google Pay, and carrier billing allow players to charge purchases to their mobile phone bills.</p></li></ol><h3><br></h3><h3>Conclusion</h3><p>Game top-up services are a convenient and popular way for players to enhance their gaming experience. Whether you\'re looking to unlock exclusive content, gain a competitive edge, or simply enjoy the game more, understanding the ins and outs of game top-ups can help you make informed decisions. Remember to use reputable platforms, take advantage of promotions, and always practice responsible spending. Happy gaming!</p>', '2024-07-31 11:03:50', '2024-10-31 06:47:05'),
(2, 2, 1, 'The Ultimate Guide to Gift Cards: Everything You Need to Know', '<h3>Introduction</h3><p>Gift cards have become a popular and versatile gifting option for people of all ages. Whether you\'re looking for a last-minute present, a way to give someone the freedom to choose their gift, or a simple way to manage spending, gift cards offer a convenient solution. In this blog, we\'ll explore everything you need to know about gift cards, from the different types and benefits to tips for using them effectively.</p><h3>What Are Gift Cards?</h3><p>Gift cards are prepaid cards that contain a specific monetary value, which can be used to purchase goods or services from a particular retailer or a range of stores. They come in two main types: physical cards, which resemble traditional credit or debit cards, and digital (or e-gift) cards, which are delivered electronically via email or mobile apps.</p><h3>Types of Gift Cards</h3><ol><li><p><strong>Retailer-Specific Gift Cards</strong>: These cards are issued by a specific store or brand and can only be used at that retailer. Examples include Amazon, Starbucks, and Best Buy gift cards.</p></li><li><p><strong>Multi-Store Gift Cards</strong>: These cards can be used at multiple retailers within a specific group or network. Examples include shopping mall gift cards and gift cards from major payment networks like Visa, Mastercard, and American Express.</p></li><li><p><strong>Prepaid Debit Cards</strong>: These are versatile cards that can be used anywhere that accepts debit cards. They often come with fees but offer the flexibility of being used at a wide range of locations.</p></li><li><p><strong>Specialty Gift Cards</strong>: These include cards for specific services or experiences, such as spa treatments, movie tickets, or travel bookings.</p></li></ol><h3>Benefits of Gift Cards</h3><ol><li><p><strong>Convenience</strong>: Gift cards are easy to purchase and use, making them a hassle-free gifting option. They can be bought online or in-store and are available in various denominations.</p></li><li><p><strong>Flexibility</strong>: Recipients have the freedom to choose what they want to buy, ensuring they get something they truly desire. This is particularly useful for hard-to-shop-for individuals.</p></li><li><p><strong>Budget Management</strong>: For personal use, gift cards can help with budgeting by limiting spending to the card\'s value. This is especially helpful for sticking to a shopping budget or teaching kids about managing money.</p></li><li><p><strong>Last-Minute Gifting</strong>: Gift cards are an excellent solution for last-minute gifts, as they can be purchased and delivered instantly, especially digital gift cards.</p></li></ol><h3>How to Purchase and Redeem Gift Cards</h3><ol><li><p><strong>Buying Gift Cards</strong>: You can buy gift cards at retail stores, online, or through mobile apps. Many retailers also offer customizable options, allowing you to choose the card\'s design and value.</p></li><li><p><strong>Redeeming Gift Cards</strong>: To redeem a gift card, present it at the checkout (for physical cards) or enter the card code online (for digital cards). The card\'s value will be applied to your purchase, and any remaining balance can be used for future transactions.</p></li></ol><h3>Conclusion</h3><p>Gift cards are a practical and thoughtful gift option that offers recipients the freedom to choose their own gifts. Whether for birthdays, holidays, or special occasions, they provide convenience and flexibility. By understanding the different types of gift cards and how to use them effectively, you can make the most out of this versatile gifting option. Happy gifting!</p>', '2024-07-31 11:09:07', '2024-10-31 06:45:55'),
(3, 3, 1, 'The Rise and Evolution of PUBG: A Game-Changing Phenomenon', '<h3>Introduction</h3><p>PlayerUnknown\'s Battlegrounds (PUBG) has become a landmark in the world of online gaming, defining and popularizing the battle royale genre. Since its release in 2017, PUBG has captivated millions of players worldwide with its intense gameplay, strategic depth, and ever-evolving content. In this blog, we\'ll explore the rise and evolution of PUBG, its impact on the gaming industry, and what makes it such a compelling game for players of all levels.</p><h3><br></h3><h3>Key Features and Gameplay Mechanics</h3><ol><li><p><strong>Battle Royale Mode</strong>: The core mode of PUBG involves up to 100 players parachuting onto an island and scavenging for weapons, armor, and supplies. The playable area gradually shrinks, forcing players into increasingly close quarters until only one player or team remains.</p></li><li><p><strong>Realistic Combat</strong>: PUBG is known for its realistic weapon mechanics and physics. Players must account for factors like bullet drop, recoil, and weapon attachments, making combat both challenging and rewarding.</p></li><li><p><strong>Diverse Maps</strong>: The game features multiple maps, each with unique terrains, environments, and strategic elements. Maps like Erangel, Miramar, Sanhok, and Vikendi offer different playstyles, from long-range sniping to close-quarters combat.</p></li><li><p><strong>Solo, Duo, and Squad Modes</strong>: Players can choose to play solo, with a partner, or in a squad of up to four players. This variety allows for different tactical approaches and enhances the social aspect of the game.</p></li><li><p><strong>Customization and Progression</strong>: PUBG offers a range of cosmetic items, including skins, outfits, and emotes, allowing players to personalize their characters. The game also features a ranking system and seasonal passes, providing ongoing challenges and rewards.</p></li></ol><h3>The Impact of PUBG on the Gaming Industry</h3><p>PUBG\'s success has had a profound impact on the gaming industry, popularizing the battle royale genre and influencing the development of other games. The game\'s innovative mechanics and emphasis on survival created a new subgenre, leading to the release of other popular battle royale titles like Fortnite, Apex Legends, and Call of Duty: Warzone.</p><p>Moreover, PUBG\'s success demonstrated the potential of early access games and the importance of community feedback in game development. The game\'s developers actively engaged with the player base, addressing bugs, balancing gameplay, and introducing new content based on player input.</p><h3>The Evolution and Future of PUBG</h3><p>Over the years, PUBG has continued to evolve, with regular updates introducing new maps, weapons, modes, and features. The game has expanded its reach with the release of PUBG Mobile, which brought the battle royale experience to mobile devices, reaching a global audience.</p><p>Looking to the future, PUBG Corporation has plans to further expand the PUBG universe. This includes new game modes, collaborations, and potential spin-offs that explore different aspects of the game\'s lore and mechanics.</p><h3>Conclusion</h3><p>PUBG has become a cultural phenomenon, revolutionizing the battle royale genre and leaving a lasting impact on the gaming industry. Its blend of realistic combat, strategic gameplay, and community engagement has captivated millions of players worldwide. As the game continues to evolve, PUBG remains a testament to the power of innovation and the enduring appeal of competitive gaming. Whether you\'re a seasoned player or new to the game, PUBG offers an exhilarating experience that keeps players coming back for more.</p>', '2024-07-31 11:11:15', '2024-10-31 06:44:58'),
(4, 4, 1, 'Gold piggy bank with gold coin money stacks and growing', '<h3 style=\"font-size: 1.14844rem;\">Introduction</h3><p>Gift cards have become a popular and versatile gifting option for people of all ages. Whether you\'re looking for a last-minute present, a way to give someone the freedom to choose their gift, or a simple way to manage spending, gift cards offer a convenient solution. In this blog, we\'ll explore everything you need to know about gift cards, from the different types and benefits to tips for using them effectively.</p><h3 style=\"font-size: 1.14844rem;\">What Are Gift Cards?</h3><p>Gift cards are prepaid cards that contain a specific monetary value, which can be used to purchase goods or services from a particular retailer or a range of stores. They come in two main types: physical cards, which resemble traditional credit or debit cards, and digital (or e-gift) cards, which are delivered electronically via email or mobile apps.</p><h3 style=\"font-size: 1.14844rem;\">Types of Gift Cards</h3><ol><li><p><span style=\"font-weight: bolder;\">Retailer-Specific Gift Cards</span>: These cards are issued by a specific store or brand and can only be used at that retailer. Examples include Amazon, Starbucks, and Best Buy gift cards.</p></li><li><p><span style=\"font-weight: bolder;\">Multi-Store Gift Cards</span>: These cards can be used at multiple retailers within a specific group or network. Examples include shopping mall gift cards and gift cards from major payment networks like Visa, Mastercard, and American Express.</p></li><li><p><span style=\"font-weight: bolder;\">Prepaid Debit Cards</span>: These are versatile cards that can be used anywhere that accepts debit cards. They often come with fees but offer the flexibility of being used at a wide range of locations.</p></li><li><p><span style=\"font-weight: bolder;\">Specialty Gift Cards</span>: These include cards for specific services or experiences, such as spa treatments, movie tickets, or travel bookings.</p></li></ol><h3 style=\"font-size: 1.14844rem;\">How to Purchase and Redeem Gift Cards</h3><ol><li><p><span style=\"font-weight: bolder;\">Buying Gift Cards</span>: You can buy gift cards at retail stores, online, or through mobile apps. Many retailers also offer customizable options, allowing you to choose the card\'s design and value.</p></li><li><p><span style=\"font-weight: bolder;\">Redeeming Gift Cards</span>: To redeem a gift card, present it at the checkout (for physical cards) or enter the card code online (for digital cards). The card\'s value will be applied to your purchase, and any remaining balance can be used for future transactions.</p></li></ol><h3 style=\"font-size: 1.14844rem;\">Conclusion</h3><p>Gift cards are a practical and thoughtful gift option that offers recipients the freedom to choose their own gifts. Whether for birthdays, holidays, or special occasions, they provide convenience and flexibility. By understanding the different types of gift cards and how to use them effectively, you can make the most out of this versatile gifting option. Happy gifting!</p>', '2024-10-31 06:54:32', '2024-10-31 07:13:09'),
(5, 5, 1, 'Gold piggy bank with gold coin money stacks and growing2', '<h3 style=\"font-size: 1.14844rem;\">Introduction</h3><p>Gift cards have become a popular and versatile gifting option for people of all ages. Whether you\'re looking for a last-minute present, a way to give someone the freedom to choose their gift, or a simple way to manage spending, gift cards offer a convenient solution. In this blog, we\'ll explore everything you need to know about gift cards, from the different types and benefits to tips for using them effectively.</p><h3 style=\"font-size: 1.14844rem;\">What Are Gift Cards?</h3><p>Gift cards are prepaid cards that contain a specific monetary value, which can be used to purchase goods or services from a particular retailer or a range of stores. They come in two main types: physical cards, which resemble traditional credit or debit cards, and digital (or e-gift) cards, which are delivered electronically via email or mobile apps.</p><h3 style=\"font-size: 1.14844rem;\">Types of Gift Cards</h3><ol><li><p><span style=\"font-weight: bolder;\">Retailer-Specific Gift Cards</span>: These cards are issued by a specific store or brand and can only be used at that retailer. Examples include Amazon, Starbucks, and Best Buy gift cards.</p></li><li><p><span style=\"font-weight: bolder;\">Multi-Store Gift Cards</span>: These cards can be used at multiple retailers within a specific group or network. Examples include shopping mall gift cards and gift cards from major payment networks like Visa, Mastercard, and American Express.</p></li><li><p><span style=\"font-weight: bolder;\">Prepaid Debit Cards</span>: These are versatile cards that can be used anywhere that accepts debit cards. They often come with fees but offer the flexibility of being used at a wide range of locations.</p></li><li><p><span style=\"font-weight: bolder;\">Specialty Gift Cards</span>: These include cards for specific services or experiences, such as spa treatments, movie tickets, or travel bookings.</p></li></ol><h3 style=\"font-size: 1.14844rem;\">How to Purchase and Redeem Gift Cards</h3><ol><li><p><span style=\"font-weight: bolder;\">Buying Gift Cards</span>: You can buy gift cards at retail stores, online, or through mobile apps. Many retailers also offer customizable options, allowing you to choose the card\'s design and value.</p></li><li><p><span style=\"font-weight: bolder;\">Redeeming Gift Cards</span>: To redeem a gift card, present it at the checkout (for physical cards) or enter the card code online (for digital cards). The card\'s value will be applied to your purchase, and any remaining balance can be used for future transactions.</p></li></ol><h3 style=\"font-size: 1.14844rem;\">Conclusion</h3><p>Gift cards are a practical and thoughtful gift option that offers recipients the freedom to choose their own gifts. Whether for birthdays, holidays, or special occasions, they provide convenience and flexibility. By understanding the different types of gift cards and how to use them effectively, you can make the most out of this versatile gifting option. Happy gifting!</p>', '2024-10-31 06:56:34', '2024-11-14 11:14:16'),
(6, 6, 1, 'Gold piggy bank with gold coin money stacks and growing', '<h3 style=\"font-size: 1.14844rem;\">Introduction</h3><p>Gift cards have become a popular and versatile gifting option for people of all ages. Whether you\'re looking for a last-minute present, a way to give someone the freedom to choose their gift, or a simple way to manage spending, gift cards offer a convenient solution. In this blog, we\'ll explore everything you need to know about gift cards, from the different types and benefits to tips for using them effectively.</p><h3 style=\"font-size: 1.14844rem;\">What Are Gift Cards?</h3><p>Gift cards are prepaid cards that contain a specific monetary value, which can be used to purchase goods or services from a particular retailer or a range of stores. They come in two main types: physical cards, which resemble traditional credit or debit cards, and digital (or e-gift) cards, which are delivered electronically via email or mobile apps.</p><h3 style=\"font-size: 1.14844rem;\">Types of Gift Cards</h3><ol><li><p><span style=\"font-weight: bolder;\">Retailer-Specific Gift Cards</span>: These cards are issued by a specific store or brand and can only be used at that retailer. Examples include Amazon, Starbucks, and Best Buy gift cards.</p></li><li><p><span style=\"font-weight: bolder;\">Multi-Store Gift Cards</span>: These cards can be used at multiple retailers within a specific group or network. Examples include shopping mall gift cards and gift cards from major payment networks like Visa, Mastercard, and American Express.</p></li><li><p><span style=\"font-weight: bolder;\">Prepaid Debit Cards</span>: These are versatile cards that can be used anywhere that accepts debit cards. They often come with fees but offer the flexibility of being used at a wide range of locations.</p></li><li><p><span style=\"font-weight: bolder;\">Specialty Gift Cards</span>: These include cards for specific services or experiences, such as spa treatments, movie tickets, or travel bookings.</p></li></ol><h3 style=\"font-size: 1.14844rem;\">How to Purchase and Redeem Gift Cards</h3><ol><li><p><span style=\"font-weight: bolder;\">Buying Gift Cards</span>: You can buy gift cards at retail stores, online, or through mobile apps. Many retailers also offer customizable options, allowing you to choose the card\'s design and value.</p></li><li><p><span style=\"font-weight: bolder;\">Redeeming Gift Cards</span>: To redeem a gift card, present it at the checkout (for physical cards) or enter the card code online (for digital cards). The card\'s value will be applied to your purchase, and any remaining balance can be used for future transactions.</p></li></ol><h3 style=\"font-size: 1.14844rem;\">Conclusion</h3><p>Gift cards are a practical and thoughtful gift option that offers recipients the freedom to choose their own gifts. Whether for birthdays, holidays, or special occasions, they provide convenience and flexibility. By understanding the different types of gift cards and how to use them effectively, you can make the most out of this versatile gifting option. Happy gifting!</p>', '2024-10-31 06:57:14', '2024-10-31 07:12:50'),
(7, 6, 2, 'Alcancía de oro con pilas de monedas de oro y dinero en aumento', '<p>Introducción</p><p>Las tarjetas de regalo se han convertido en una opción de regalo popular y versátil para personas de todas las edades. Ya sea que esté buscando un regalo de último momento, una forma de darle a alguien la libertad de elegir su regalo o una forma sencilla de administrar los gastos, las tarjetas de regalo ofrecen una solución conveniente. En este blog, exploraremos todo lo que necesita saber sobre las tarjetas de regalo, desde los diferentes tipos y beneficios hasta consejos para usarlas de manera efectiva.</p><p><br></p><p>¿Qué son las tarjetas de regalo?</p><p>Las tarjetas de regalo son tarjetas prepagas que contienen un valor monetario específico, que se puede utilizar para comprar bienes o servicios de un minorista en particular o una variedad de tiendas. Vienen en dos tipos principales: tarjetas físicas, que se parecen a las tarjetas de crédito o débito tradicionales, y tarjetas digitales (o de regalo electrónicas), que se envían electrónicamente a través de correo electrónico o aplicaciones móviles.</p><p><br></p><p>Tipos de tarjetas de regalo</p><p>Tarjetas de regalo específicas de un minorista: estas tarjetas son emitidas por una tienda o marca específica y solo se pueden usar en ese minorista. Algunos ejemplos incluyen tarjetas de regalo de Amazon, Starbucks y Best Buy.</p><p><br></p><p>Tarjetas de regalo de múltiples tiendas: estas tarjetas se pueden usar en múltiples minoristas dentro de un grupo o red específicos. Algunos ejemplos son las tarjetas de regalo de centros comerciales y las tarjetas de regalo de las principales redes de pago, como Visa, Mastercard y American Express.</p><p><br></p><p>Tarjetas de débito prepagas: son tarjetas versátiles que se pueden usar en cualquier lugar que acepte tarjetas de débito. Suelen tener comisiones, pero ofrecen la flexibilidad de poder usarse en una amplia variedad de lugares.</p><p><br></p><p>Tarjetas de regalo especiales: incluyen tarjetas para servicios o experiencias específicos, como tratamientos de spa, entradas de cine o reservas de viajes.</p><p><br></p><p>Cómo comprar y canjear tarjetas de regalo</p><p>Comprar tarjetas de regalo: puedes comprar tarjetas de regalo en tiendas minoristas, en línea o mediante aplicaciones móviles. Muchos minoristas también ofrecen opciones personalizables, lo que te permite elegir el diseño y el valor de la tarjeta.</p><p><br></p><p>Canjear tarjetas de regalo: para canjear una tarjeta de regalo, preséntala en la caja (para tarjetas físicas) o ingresa el código de la tarjeta en línea (para tarjetas digitales). El valor de la tarjeta se aplicará a tu compra y el saldo restante se puede usar para futuras transacciones.</p><p><br></p><p>Conclusión</p><p>Las tarjetas de regalo son una opción de regalo práctica y considerada que ofrece a los destinatarios la libertad de elegir sus propios regalos. Ya sea para cumpleaños, días festivos u ocasiones especiales, brindan comodidad y flexibilidad. Si comprende los diferentes tipos de tarjetas de regalo y cómo usarlas de manera eficaz, podrá aprovechar al máximo esta opción de obsequio versátil. ¡Feliz regalo!</p>', '2025-01-07 06:39:15', '2025-01-07 06:39:15'),
(8, 5, 2, 'Alcancía de oro con pilas de monedas de oro y monedas en crecimiento2', '<p>Introducción</p><p>Las tarjetas de regalo se han convertido en una opción de regalo popular y versátil para personas de todas las edades. Ya sea que esté buscando un regalo de último momento, una forma de darle a alguien la libertad de elegir su regalo o una forma sencilla de administrar los gastos, las tarjetas de regalo ofrecen una solución conveniente. En este blog, exploraremos todo lo que necesita saber sobre las tarjetas de regalo, desde los diferentes tipos y beneficios hasta consejos para usarlas de manera efectiva.</p><p><br></p><p>¿Qué son las tarjetas de regalo?</p><p>Las tarjetas de regalo son tarjetas prepagas que contienen un valor monetario específico, que se puede utilizar para comprar bienes o servicios de un minorista en particular o una variedad de tiendas. Vienen en dos tipos principales: tarjetas físicas, que se parecen a las tarjetas de crédito o débito tradicionales, y tarjetas digitales (o de regalo electrónicas), que se envían electrónicamente a través de correo electrónico o aplicaciones móviles.</p><p><br></p><p>Tipos de tarjetas de regalo</p><p>Tarjetas de regalo específicas de un minorista: estas tarjetas son emitidas por una tienda o marca específica y solo se pueden usar en ese minorista. Algunos ejemplos incluyen tarjetas de regalo de Amazon, Starbucks y Best Buy.</p><p><br></p><p>Tarjetas de regalo de múltiples tiendas: estas tarjetas se pueden usar en múltiples minoristas dentro de un grupo o red específicos. Algunos ejemplos son las tarjetas de regalo de centros comerciales y las tarjetas de regalo de las principales redes de pago, como Visa, Mastercard y American Express.</p><p><br></p><p>Tarjetas de débito prepagas: son tarjetas versátiles que se pueden usar en cualquier lugar que acepte tarjetas de débito. Suelen tener comisiones, pero ofrecen la flexibilidad de poder usarse en una amplia variedad de lugares.</p><p><br></p><p>Tarjetas de regalo especiales: incluyen tarjetas para servicios o experiencias específicos, como tratamientos de spa, entradas de cine o reservas de viajes.</p><p><br></p><p>Cómo comprar y canjear tarjetas de regalo</p><p>Comprar tarjetas de regalo: puedes comprar tarjetas de regalo en tiendas minoristas, en línea o mediante aplicaciones móviles. Muchos minoristas también ofrecen opciones personalizables, lo que te permite elegir el diseño y el valor de la tarjeta.</p><p><br></p><p>Canjear tarjetas de regalo: para canjear una tarjeta de regalo, preséntala en la caja (para tarjetas físicas) o ingresa el código de la tarjeta en línea (para tarjetas digitales). El valor de la tarjeta se aplicará a tu compra y el saldo restante se puede usar para futuras transacciones.</p><p><br></p><p>Conclusión</p><p>Las tarjetas de regalo son una opción de regalo práctica y considerada que ofrece a los destinatarios la libertad de elegir sus propios regalos. Ya sea para cumpleaños, días festivos u ocasiones especiales, brindan comodidad y flexibilidad. Si comprende los diferentes tipos de tarjetas de regalo y cómo usarlas de manera eficaz, podrá aprovechar al máximo esta opción de obsequio versátil. ¡Feliz regalo!</p>', '2025-01-07 06:41:27', '2025-01-07 06:41:27'),
(9, 4, 2, 'Alcancía de oro con pilas de monedas de oro y dinero en aumento', '<p>Introducción</p><p>Las tarjetas de regalo se han convertido en una opción de regalo popular y versátil para personas de todas las edades. Ya sea que esté buscando un regalo de último momento, una forma de darle a alguien la libertad de elegir su regalo o una forma sencilla de administrar los gastos, las tarjetas de regalo ofrecen una solución conveniente. En este blog, exploraremos todo lo que necesita saber sobre las tarjetas de regalo, desde los diferentes tipos y beneficios hasta consejos para usarlas de manera efectiva.</p><p><br></p><p>¿Qué son las tarjetas de regalo?</p><p>Las tarjetas de regalo son tarjetas prepagas que contienen un valor monetario específico, que se puede utilizar para comprar bienes o servicios de un minorista en particular o una variedad de tiendas. Vienen en dos tipos principales: tarjetas físicas, que se parecen a las tarjetas de crédito o débito tradicionales, y tarjetas digitales (o de regalo electrónicas), que se envían electrónicamente a través de correo electrónico o aplicaciones móviles.</p><p><br></p><p>Tipos de tarjetas de regalo</p><p>Tarjetas de regalo específicas de un minorista: estas tarjetas son emitidas por una tienda o marca específica y solo se pueden usar en ese minorista. Algunos ejemplos incluyen tarjetas de regalo de Amazon, Starbucks y Best Buy.</p><p><br></p><p>Tarjetas de regalo de múltiples tiendas: estas tarjetas se pueden usar en múltiples minoristas dentro de un grupo o red específicos. Algunos ejemplos son las tarjetas de regalo de centros comerciales y las tarjetas de regalo de las principales redes de pago, como Visa, Mastercard y American Express.</p><p><br></p><p>Tarjetas de débito prepagas: son tarjetas versátiles que se pueden usar en cualquier lugar que acepte tarjetas de débito. Suelen tener comisiones, pero ofrecen la flexibilidad de poder usarse en una amplia variedad de lugares.</p><p><br></p><p>Tarjetas de regalo especiales: incluyen tarjetas para servicios o experiencias específicos, como tratamientos de spa, entradas de cine o reservas de viajes.</p><p><br></p><p>Cómo comprar y canjear tarjetas de regalo</p><p>Comprar tarjetas de regalo: puedes comprar tarjetas de regalo en tiendas minoristas, en línea o mediante aplicaciones móviles. Muchos minoristas también ofrecen opciones personalizables, lo que te permite elegir el diseño y el valor de la tarjeta.</p><p><br></p><p>Canjear tarjetas de regalo: para canjear una tarjeta de regalo, preséntala en la caja (para tarjetas físicas) o ingresa el código de la tarjeta en línea (para tarjetas digitales). El valor de la tarjeta se aplicará a tu compra y el saldo restante se puede usar para futuras transacciones.</p><p><br></p><p>Conclusión</p><p>Las tarjetas de regalo son una opción de regalo práctica y considerada que ofrece a los destinatarios la libertad de elegir sus propios regalos. Ya sea para cumpleaños, días festivos u ocasiones especiales, brindan comodidad y flexibilidad. Si comprende los diferentes tipos de tarjetas de regalo y cómo usarlas de manera eficaz, podrá aprovechar al máximo esta opción de obsequio versátil. ¡Feliz regalo!</p>', '2025-01-07 06:43:12', '2025-01-07 06:43:12'),
(10, 3, 2, 'El auge y la evolución de PUBG: un fenómeno que cambió las reglas del juego', '<p>Introducción</p><p>PlayerUnknown\'s Battlegrounds (PUBG) se ha convertido en un hito en el mundo de los juegos en línea, definiendo y popularizando el género Battle Royale. Desde su lanzamiento en 2017, PUBG ha cautivado a millones de jugadores en todo el mundo con su juego intenso, profundidad estratégica y contenido en constante evolución. En este blog, exploraremos el surgimiento y la evolución de PUBG, su impacto en la industria de los juegos y lo que lo convierte en un juego tan atractivo para jugadores de todos los niveles.</p><p><br></p><p>Características principales y mecánica de juego</p><p>Modo Battle Royale: el modo principal de PUBG implica que hasta 100 jugadores se lancen en paracaídas sobre una isla y busquen armas, armaduras y suministros. El área jugable se reduce gradualmente, lo que obliga a los jugadores a estar cada vez más cerca hasta que solo queda un jugador o equipo.</p><p><br></p><p>Combate realista: PUBG es conocido por su mecánica y física de armas realistas. Los jugadores deben tener en cuenta factores como la caída de la bala, el retroceso y los accesorios de las armas, lo que hace que el combate sea desafiante y gratificante.</p><p><br></p><p>Mapas diversos: el juego cuenta con varios mapas, cada uno con terrenos, entornos y elementos estratégicos únicos. Mapas como Erangel, Miramar, Sanhok y Vikendi ofrecen diferentes estilos de juego, desde francotiradores de largo alcance hasta combates cuerpo a cuerpo.</p><p><br></p><p>Modos en solitario, dúo y escuadrón: los jugadores pueden elegir jugar solos, con un compañero o en un escuadrón de hasta cuatro jugadores. Esta variedad permite diferentes enfoques tácticos y mejora el aspecto social del juego.</p><p><br></p><p>Personalización y progresión: PUBG ofrece una variedad de elementos cosméticos, que incluyen aspectos, atuendos y gestos, lo que permite a los jugadores personalizar a sus personajes. El juego también cuenta con un sistema de clasificación y pases de temporada, que brindan desafíos y recompensas constantes.</p><p><br></p><p>El impacto de PUBG en la industria del juego</p><p>El éxito de PUBG ha tenido un profundo impacto en la industria del juego, popularizando el género Battle Royale e influyendo en el desarrollo de otros juegos. La mecánica innovadora del juego y el énfasis en la supervivencia crearon un nuevo subgénero, lo que llevó al lanzamiento de otros títulos populares de Battle Royale como Fortnite, Apex Legends y Call of Duty: Warzone.</p><p><br></p><p>Además, el éxito de PUBG demostró el potencial de los juegos de acceso anticipado y la importancia de la retroalimentación de la comunidad en el desarrollo del juego. Los desarrolladores del juego interactuaron activamente con la base de jugadores, solucionando errores, equilibrando la jugabilidad e introduciendo contenido nuevo en función de las aportaciones de los jugadores.</p><p><br></p><p>La evolución y el futuro de PUBG</p><p>A lo largo de los años, PUBG ha seguido evolucionando, con actualizaciones periódicas que introducen nuevos mapas, armas, modos y funciones. El juego ha ampliado su alcance con el lanzamiento de PUBG Mobile, que llevó la experiencia de Battle Royale a los dispositivos móviles, llegando a una audiencia global.</p><p><br></p><p>De cara al futuro, PUBG Corporation tiene planes de expandir aún más el universo de PUBG. Esto incluye nuevos modos de juego, colaboraciones y posibles spin-offs que exploran diferentes aspectos de la tradición y la mecánica del juego.</p><p><br></p><p>Conclusión</p><p>PUBG se ha convertido en un fenómeno cultural, revolucionando el género Battle Royale y dejando un impacto duradero en la industria del juego. Su combinación de combate realista, juego estratégico y participación de la comunidad ha cautivado a millones de jugadores en todo el mundo. A medida que el juego continúa evolucionando, PUBG sigue siendo un testimonio del poder de la innovación y el atractivo perdurable de los juegos competitivos. Ya seas un jugador experimentado o nuevo en el juego, PUBG ofrece una experiencia emocionante que hace que los jugadores vuelvan por más.</p>', '2025-01-07 06:44:54', '2025-01-07 06:44:54'),
(11, 2, 2, 'La guía definitiva sobre tarjetas de regalo: todo lo que necesitas saber', '<p>Introducción</p><p>Las tarjetas de regalo se han convertido en una opción de regalo popular y versátil para personas de todas las edades. Ya sea que esté buscando un regalo de último momento, una forma de darle a alguien la libertad de elegir su regalo o una forma sencilla de administrar los gastos, las tarjetas de regalo ofrecen una solución conveniente. En este blog, exploraremos todo lo que necesita saber sobre las tarjetas de regalo, desde los diferentes tipos y beneficios hasta consejos para usarlas de manera efectiva.</p><p><br></p><p>¿Qué son las tarjetas de regalo?</p><p>Las tarjetas de regalo son tarjetas prepagas que contienen un valor monetario específico, que se puede utilizar para comprar bienes o servicios de un minorista en particular o una variedad de tiendas. Vienen en dos tipos principales: tarjetas físicas, que se parecen a las tarjetas de crédito o débito tradicionales, y tarjetas digitales (o de regalo electrónicas), que se envían electrónicamente a través de correo electrónico o aplicaciones móviles.</p><p><br></p><p>Tipos de tarjetas de regalo</p><p>Tarjetas de regalo específicas de un minorista: estas tarjetas son emitidas por una tienda o marca específica y solo se pueden usar en ese minorista. Algunos ejemplos incluyen tarjetas de regalo de Amazon, Starbucks y Best Buy.</p><p><br></p><p>Tarjetas de regalo de múltiples tiendas: estas tarjetas se pueden usar en múltiples minoristas dentro de un grupo o red específicos. Algunos ejemplos son las tarjetas de regalo de centros comerciales y las tarjetas de regalo de las principales redes de pago, como Visa, Mastercard y American Express.</p><p><br></p><p>Tarjetas de débito prepagas: son tarjetas versátiles que se pueden usar en cualquier lugar que acepte tarjetas de débito. Suelen tener comisiones, pero ofrecen la flexibilidad de poder usarse en una amplia variedad de lugares.</p><p><br></p><p>Tarjetas de regalo especiales: incluyen tarjetas para servicios o experiencias específicos, como tratamientos de spa, entradas de cine o reservas de viajes.</p><p><br></p><p>Beneficios de las tarjetas de regalo</p><p>Conveniencia: las tarjetas de regalo son fáciles de comprar y usar, lo que las convierte en una opción de regalo sin complicaciones. Se pueden comprar en línea o en la tienda y están disponibles en varias denominaciones.</p><p><br></p><p>Flexibilidad: los destinatarios tienen la libertad de elegir lo que quieren comprar, lo que garantiza que obtengan algo que realmente desean. Esto es particularmente útil para las personas a las que les resulta difícil comprar.</p><p><br></p><p>Gestión del presupuesto: para uso personal, las tarjetas de regalo pueden ayudar a elaborar un presupuesto al limitar el gasto al valor de la tarjeta. Esto es especialmente útil para ceñirse a un presupuesto de compras o enseñar a los niños a administrar el dinero.</p><p><br></p><p>Regalos de último momento: las tarjetas de regalo son una excelente solución para los regalos de último momento, ya que se pueden comprar y entregar al instante, especialmente las tarjetas de regalo digitales.</p><p><br></p><p>Cómo comprar y canjear tarjetas de regalo</p><p>Comprar tarjetas de regalo: puede comprar tarjetas de regalo en tiendas minoristas, en línea o mediante aplicaciones móviles. Muchos minoristas también ofrecen opciones personalizables, lo que le permite elegir el diseño y el valor de la tarjeta.</p><p><br></p><p>Canjear tarjetas de regalo: para canjear una tarjeta de regalo, preséntela en la caja (para tarjetas físicas) o ingrese el código de la tarjeta en línea (para tarjetas digitales). El valor de la tarjeta se aplicará a su compra y cualquier saldo restante se puede usar para futuras transacciones.</p><p><br></p><p>Conclusión</p><p>Las tarjetas de regalo son una opción de regalo práctica y considerada que ofrece a los destinatarios la libertad de elegir sus propios regalos. Ya sea para cumpleaños, días festivos u ocasiones especiales, brindan comodidad y flexibilidad. Si comprende los diferentes tipos de tarjetas de regalo y cómo usarlas de manera eficaz, puede aprovechar al máximo esta opción de obsequio versátil. ¡Feliz regalo!</p>', '2025-01-07 07:36:27', '2025-01-07 07:36:27'),
(12, 1, 2, 'La guía definitiva para recargar juegos: todo lo que necesitas saber', '<p>Introducción</p><p>En el mundo de los juegos en línea, los servicios de recarga de juegos se han convertido en una parte esencial de la experiencia. Ya sea que esté comprando moneda del juego, desbloqueando contenido nuevo o comprando artículos exclusivos, recargar su cuenta de juego puede mejorar su juego y brindarle oportunidades emocionantes. En este blog, exploraremos todo lo que necesita saber sobre los servicios de recarga de juegos, desde los beneficios y métodos hasta las mejores prácticas y consejos para una experiencia fluida.</p><p><br></p><p>¿Qué es una recarga de juego?</p><p>Una recarga de juego es el proceso de agregar fondos o moneda virtual a su cuenta de juego. Esto se puede usar para comprar artículos, aspectos, mejoras u otros bienes digitales del juego. Las recargas de juegos generalmente se realizan a través de plataformas en línea, aplicaciones móviles o directamente dentro del juego. Ofrecen una forma conveniente para que los jugadores mejoren su experiencia de juego al acceder a contenido premium.</p><p><br></p><p>¿Por qué los jugadores usan los servicios de recarga de juegos?</p><p>Acceso a contenido exclusivo: muchos juegos ofrecen artículos, personajes o niveles exclusivos a los que solo se puede acceder a través de compras dentro del juego. Los servicios de recarga permiten a los jugadores adquirir estos artículos, lo que les da una ventaja competitiva u opciones de personalización únicas.</p><p><br></p><p>Comodidad: los servicios de recarga de juegos brindan una forma rápida y sencilla de comprar moneda del juego sin la necesidad de una tarjeta de crédito o transferencia bancaria cada vez. Esto es especialmente útil para los jugadores móviles que prefieren usar tarjetas prepagas o billeteras electrónicas.</p><p><br></p><p>Promociones y descuentos: los jugadores a menudo reciben bonificaciones, descuentos o artículos promocionales cuando recargan sus cuentas. Estas ofertas pueden brindar valor adicional y mejorar la experiencia de juego en general. Métodos populares de recarga de juegos</p><p><br></p><p>Tarjetas de crédito/débito: uno de los métodos más comunes, que permite a los jugadores usar sus tarjetas bancarias para comprar moneda del juego.</p><p><br></p><p>Billeteras electrónicas: plataformas como PayPal, Skrill y Payoneer ofrecen transacciones seguras y rápidas para recargas de juegos.</p><p><br></p><p>Tarjetas prepagas: muchos jugadores usan tarjetas prepagas como Google Play, iTunes o tarjetas de juegos específicas para recargar sus cuentas sin vincular sus cuentas bancarias.</p><p><br></p><p>Criptomonedas: con el auge de las monedas digitales, algunas plataformas aceptan criptomonedas como Bitcoin para recargas de juegos.</p><p><br></p><p>Pago móvil: servicios como Apple Pay, Google Pay y facturación del operador permiten a los jugadores cargar las compras a sus facturas de telefonía móvil.</p><p><br></p><p>Conclusión</p><p>Los servicios de recarga de juegos son una forma conveniente y popular para que los jugadores mejoren su experiencia de juego. Ya sea que esté buscando desbloquear contenido exclusivo, obtener una ventaja competitiva o simplemente disfrutar más del juego, comprender los entresijos de las recargas de juegos puede ayudarlo a tomar decisiones informadas. Recuerde utilizar plataformas confiables, aprovechar las promociones y practicar siempre el gasto responsable. ¡Feliz juego!</p>', '2025-01-07 07:37:47', '2025-01-07 07:37:47');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>off,1=>on',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `instant_delivery` tinyint(1) NOT NULL DEFAULT 1,
  `image` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `guide` longtext DEFAULT NULL,
  `sort_by` int(11) DEFAULT NULL,
  `sell_count` int(11) NOT NULL DEFAULT 0,
  `total_review` int(11) NOT NULL DEFAULT 0,
  `avg_rating` float NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `meta_robots` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_image_driver` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `category_id`, `name`, `slug`, `region`, `note`, `status`, `instant_delivery`, `image`, `description`, `guide`, `sort_by`, `sell_count`, `total_review`, `avg_rating`, `trending`, `deleted_at`, `created_at`, `updated_at`, `meta_title`, `meta_keywords`, `meta_description`, `og_description`, `meta_robots`, `meta_image`, `meta_image_driver`) VALUES
(1, 8, 'a', 'a', 'a', NULL, 1, 0, '{\"image\":null,\"image_driver\":null,\"preview\":null,\"preview_driver\":null}', NULL, NULL, NULL, 0, 0, 0, 0, '2025-11-24 02:11:33', '2025-11-23 15:29:23', '2025-11-24 02:11:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 12, 'Roblox GiftCard', 'roblox-giftcard', 'Global', 'Dapatkan Roblox Gift Cards dan nikmati pengalaman top up yang mudah hanya di Gamify.', 1, 1, '{\"image\":\"card\\/TVd7zdPdNEXIncJAOT2VIYozJ8PDUs.webp\",\"image_driver\":\"local\",\"preview\":\"card\\/gyiJ4XCXMRhgMcQcNoclqeBzrkU78p.webp\",\"preview_driver\":\"local\"}', '<p>Buy <strong>GiftCard Roblox </strong>100% Legal.aman, cepat, dan Terpercaya! banyak pilihan produk dan metode pembayaran terlengkap Hanya di <strong>Gamify</strong>.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Harap Dibaca Sebelum Order :</strong></p>\r\n<p>Pesanan Diproses Manual Pukul 12.00 - 00.00 WIB / Jam ONLINE<br>Jika Ingin Order Via WhatsApp Silahkan Hubungi Admin<strong>&nbsp;</strong><a href=\"https://wa.me/6283807914090\" target=\"_blank\" rel=\"noopener\"><strong>083807914090</strong></a></p>', '<p>Cara topup:<br>1) Masukkan Keranjang<br>2) Pilih Nominal<br>3) Tentukan Jumlah Pembelian<br>4) Pilih Pembayaran<br>5) Masukkan Kode Promo (jika ada)<br>6) Isi Detail Kontak<br>7) Klik Pesan Sekarang dan lakukan Pembayaran<br>8) Selesai</p>', NULL, 0, 0, 0, 0, NULL, '2025-12-05 16:30:24', '2025-12-07 15:52:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `card_services`
--

CREATE TABLE `card_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `card_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `image_driver` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `discount_type` enum('flat','percentage') NOT NULL DEFAULT 'flat',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>off 1=>on',
  `is_offered` tinyint(1) NOT NULL DEFAULT 0,
  `offered_sell` int(11) NOT NULL DEFAULT 0 COMMENT 'how many sell at the campaign',
  `max_sell` int(11) NOT NULL DEFAULT 0 COMMENT 'max limit of sell in campaign',
  `sort_by` int(11) NOT NULL DEFAULT 1,
  `old_data` text DEFAULT NULL,
  `campaign_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `card_services`
--

INSERT INTO `card_services` (`id`, `card_id`, `name`, `image`, `image_driver`, `price`, `discount`, `discount_type`, `status`, `is_offered`, `offered_sell`, `max_sell`, `sort_by`, `old_data`, `campaign_data`, `created_at`, `updated_at`) VALUES
(1, 1, 'a', NULL, NULL, 1, 1, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-11-23 15:29:32', '2025-11-23 15:29:32'),
(2, 2, 'Roblox Gift Card 50000', 'card-service/fB120lRjSfRWjoZJuJPdTz9WFqAyOK.webp', 'local', 50000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 16:30:46', '2025-12-05 16:30:46'),
(3, 2, 'Roblox Gift Card 65000', 'card-service/WXcEBWmHe64oYh4ebKlld9vnUmPMQM.webp', 'local', 65000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 16:31:05', '2025-12-05 16:31:05'),
(4, 2, 'Roblox Gift Card 100000', 'card-service/oPDre40F8JwuwCrsAWrATyJfkhEnH9.webp', 'local', 100000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 16:31:21', '2025-12-05 16:31:56'),
(5, 2, 'Roblox Gift Card 200000', 'card-service/pZVqm6iHFVvnDbdvFR61h6BtOxBF6s.webp', 'local', 200000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 16:31:33', '2025-12-05 16:32:00'),
(6, 2, 'Roblox Gift Card 500000', 'card-service/J9zFqWVGtM1Mp4POzVTorcRO9HwFbA.webp', 'local', 500000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 16:31:44', '2025-12-05 16:32:04');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type` enum('top_up','card','game') NOT NULL DEFAULT 'card',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive,1=>active',
  `sort_by` int(11) NOT NULL DEFAULT 1,
  `active_children` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `type`, `status`, `sort_by`, `active_children`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Strategy', 'bi bi-joystick', 'top_up', 1, 2, 0, '2025-05-28 08:29:51', '2025-04-01 12:51:38', '2025-05-28 08:29:51'),
(2, 'RPG', 'bi bi-shield-fill', 'top_up', 1, 4, 2, NULL, '2025-04-01 12:53:02', '2025-12-05 13:17:33'),
(3, 'Puzzle', 'bi bi-puzzle-fill', 'top_up', 1, 1, 0, '2025-05-28 08:29:35', '2025-04-01 12:53:43', '2025-05-28 08:29:35'),
(4, 'Roleplay', 'bi bi-person-badge', 'top_up', 1, 5, 0, NULL, '2025-05-28 08:32:41', '2025-12-05 13:17:33'),
(5, 'Subscriptions', 'bi bi-person-workspace', 'top_up', 1, 1, 1, '2025-12-05 13:03:59', '2025-05-28 08:34:09', '2025-12-05 13:03:59'),
(6, 'Pulsa', 'bi bi-sd-card-fill', 'top_up', 1, 1, 0, '2025-12-05 13:04:04', '2025-05-28 08:35:54', '2025-12-05 13:04:04'),
(7, 'Paket Data', 'bi bi-wifi', 'top_up', 1, 1, 0, '2025-12-05 13:02:49', '2025-05-28 08:36:29', '2025-12-05 13:02:49'),
(8, 'a', 'bi bi-alarm', 'card', 1, 1, 1, '2025-11-24 02:11:44', '2025-11-23 15:29:16', '2025-11-24 02:11:44'),
(9, 'Strategi', 'bi bi-joystick', 'top_up', 1, 6, 0, NULL, '2025-12-05 13:10:30', '2025-12-05 13:17:33'),
(10, 'FPS', 'bi bi-fire', 'top_up', 1, 2, 0, NULL, '2025-12-05 13:12:46', '2025-12-05 13:17:33'),
(11, 'Battle Royale', 'bi bi-person-video3', 'top_up', 1, 1, 0, NULL, '2025-12-05 13:14:23', '2025-12-05 13:17:33'),
(12, 'Roleplay', 'bi bi-person-badge', 'card', 1, 1, 0, NULL, '2025-12-05 13:15:45', '2025-12-05 13:15:45'),
(13, 'MOBA', 'bi bi-controller', 'top_up', 1, 3, 0, NULL, '2025-12-05 13:17:16', '2025-12-05 13:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codeable_type` varchar(255) NOT NULL,
  `codeable_id` bigint(20) UNSIGNED NOT NULL,
  `passcode` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive,1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`id`, `codeable_type`, `codeable_id`, `passcode`, `status`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\CardService', 2, 'YUMMY-X7M2-FEAST', 1, '2025-12-07 15:47:09', '2025-12-07 15:47:09'),
(3, 'App\\Models\\CardService', 2, 'KOPI-BREW-9K2L', 1, '2025-12-07 15:47:09', '2025-12-07 15:47:09'),
(4, 'App\\Models\\CardService', 2, 'SNACK-TIME-8888', 1, '2025-12-07 15:47:09', '2025-12-07 15:47:09'),
(5, 'App\\Models\\CardService', 2, 'TASTY-BITE-Z1Z1', 1, '2025-12-07 15:47:09', '2025-12-07 15:47:09'),
(6, 'App\\Models\\CardService', 2, 'DINER-GOLD-VCHR', 1, '2025-12-07 15:47:09', '2025-12-07 15:47:09'),
(7, 'App\\Models\\CardService', 3, 'STYLE-UP24-GLAM', 1, '2025-12-07 15:47:41', '2025-12-07 15:47:41'),
(8, 'App\\Models\\CardService', 3, 'CHIC-VIBE-X9X9', 1, '2025-12-07 15:47:41', '2025-12-07 15:47:41'),
(9, 'App\\Models\\CardService', 3, 'TREND-SET-R777', 1, '2025-12-07 15:47:41', '2025-12-07 15:47:41'),
(10, 'App\\Models\\CardService', 3, 'LUXE-BAGS-Q2Q2', 1, '2025-12-07 15:47:41', '2025-12-07 15:47:41'),
(11, 'App\\Models\\CardService', 3, 'OOTD-SHOP-W1SE', 1, '2025-12-07 15:47:41', '2025-12-07 15:47:41'),
(12, 'App\\Models\\CardService', 4, 'LEVEL-UP99-XP', 1, '2025-12-07 15:48:49', '2025-12-07 15:48:49'),
(13, 'App\\Models\\CardService', 4, 'G4ME-ONXX-2077', 1, '2025-12-07 15:48:49', '2025-12-07 15:48:49'),
(14, 'App\\Models\\CardService', 4, 'CYBER-GIFT-V2', 1, '2025-12-07 15:48:49', '2025-12-07 15:48:49'),
(15, 'App\\Models\\CardService', 4, 'PRESS-STRT-W1N', 1, '2025-12-07 15:48:49', '2025-12-07 15:48:49'),
(16, 'App\\Models\\CardService', 4, 'TECH-GEEK-0101', 1, '2025-12-07 15:48:49', '2025-12-07 15:48:49'),
(17, 'App\\Models\\CardService', 5, 'TRIP-GOOO-ANY', 1, '2025-12-07 15:49:16', '2025-12-07 15:49:16'),
(18, 'App\\Models\\CardService', 5, 'VACA-MODE-ON25', 1, '2025-12-07 15:49:16', '2025-12-07 15:49:16'),
(19, 'App\\Models\\CardService', 5, 'FLYH-IGH8-SKY', 1, '2025-12-07 15:49:16', '2025-12-07 15:49:16'),
(20, 'App\\Models\\CardService', 5, 'STAY-CALM-B3ACH', 1, '2025-12-07 15:49:16', '2025-12-07 15:49:16'),
(21, 'App\\Models\\CardService', 5, 'XPLR-WRLD-MAP1', 1, '2025-12-07 15:49:16', '2025-12-07 15:49:16'),
(22, 'App\\Models\\CardService', 6, 'RELAX-NOW-ZEN8', 1, '2025-12-07 15:50:10', '2025-12-07 15:50:10'),
(23, 'App\\Models\\CardService', 6, 'GLOW-SKIN-C4RE', 1, '2025-12-07 15:50:10', '2025-12-07 15:50:10'),
(24, 'App\\Models\\CardService', 6, 'PEACE-MIND-000', 1, '2025-12-07 15:50:10', '2025-12-07 15:50:10'),
(25, 'App\\Models\\CardService', 6, 'FRESH-LOOK-NEW', 1, '2025-12-07 15:50:10', '2025-12-07 15:50:10'),
(26, 'App\\Models\\CardService', 6, 'SPA-DAYY-VCHR', 1, '2025-12-07 15:50:10', '2025-12-07 15:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `media` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name`, `type`, `media`, `created_at`, `updated_at`) VALUES
(1, 'topup', 'single', NULL, '2024-10-30 12:36:32', '2024-10-30 12:36:32'),
(2, 'promotion', 'single', NULL, '2024-10-30 12:36:57', '2024-10-30 12:36:57'),
(3, 'card', 'single', NULL, '2024-10-30 12:37:12', '2024-10-30 12:37:12'),
(4, 'blog', 'single', NULL, '2024-10-30 12:37:39', '2024-10-30 12:37:39'),
(5, 'feature', 'single', '{\"image\":{\"path\":\"contents\\/Cdx1KY09K4F9rBFqdhedzLPshYwdFN.webp\",\"driver\":\"local\"}}', '2024-10-30 12:38:51', '2024-10-30 12:46:28'),
(6, 'feature', 'multiple', NULL, '2024-10-30 12:39:09', '2024-10-30 12:39:09'),
(7, 'feature', 'multiple', NULL, '2024-10-30 12:39:17', '2024-10-30 12:39:17'),
(8, 'feature', 'multiple', NULL, '2024-10-30 12:39:25', '2024-10-30 12:39:25'),
(9, 'feature', 'multiple', NULL, '2024-10-30 12:39:34', '2024-10-30 12:39:34'),
(10, 'contact', 'single', '{\"my_link\":\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d193595.15830869428!2d-74.119763973046!3d40.69766374874431!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1668508535036!5m2!1sen!2sbd\"}', '2024-10-30 12:42:44', '2024-10-30 12:42:44'),
(11, 'authentication', 'single', '{\"image\":{\"path\":\"contents\\/hys5bKhxaVRtiHJiU0i6L41txuSB7L.webp\",\"driver\":\"local\"}}', '2024-10-30 12:45:40', '2025-01-06 05:52:28'),
(12, 'footer', 'single', NULL, '2024-10-31 05:06:54', '2024-10-31 05:06:54'),
(13, 'social', 'single', '{\"my_link\":\"https:\\/\\/www.facebook.com\\/\",\"icon\":\"fab fa-facebook-f\"}', '2024-10-31 05:28:38', '2024-12-12 09:25:41'),
(14, 'social', 'multiple', '{\"my_link\":\"https:\\/\\/x.com\\/\",\"icon\":\"fab fa-twitter\"}', '2024-10-31 05:29:10', '2024-10-31 05:29:10'),
(15, 'social', 'multiple', '{\"my_link\":\"https:\\/\\/bd.linkedin.com\\/\",\"icon\":\"fab fa-linkedin\"}', '2024-10-31 05:29:37', '2024-10-31 05:29:37'),
(16, 'social', 'multiple', '{\"my_link\":\"https:\\/\\/www.instagram.com\\/\",\"icon\":\"fab fa-instagram\"}', '2024-10-31 05:30:03', '2024-10-31 05:30:03'),
(17, 'dark_hero', 'single', '{\"background_image\":{\"path\":\"contents\\/T9N6xELscfNdfjGBCw0cjx4WN0UV1x.webp\",\"driver\":\"local\"}}', '2024-12-09 06:32:41', '2024-12-09 07:01:32'),
(18, 'dark_hero', 'multiple', '{\"background_image\":{\"path\":\"contents\\/1RyB0xiKtBF3NDX5FpPiIZoWgG1ycx.webp\",\"driver\":\"local\"}}', '2024-12-09 06:34:35', '2024-12-09 06:34:35'),
(19, 'dark_hero', 'multiple', '{\"background_image\":{\"path\":\"contents\\/7e3mDBGEdorqr1dTbOrSKkiLq2LpRN.webp\",\"driver\":\"local\"}}', '2024-12-09 06:35:36', '2024-12-09 06:35:36'),
(20, 'dark_about', 'single', '{\"image\":{\"path\":\"contents\\/lMM57KaXtbpmvXen0Jh7hEZcHS5gwh.webp\",\"driver\":\"local\"},\"button_link\":\"https:\\/\\/zyrex.win\\/\"}', '2024-12-10 12:52:52', '2025-03-29 23:49:27'),
(21, 'dark_exclusive_card', 'single', '{\"button_link\":\"https:\\/\\/zyrex.win\\/\"}', '2024-12-11 04:40:58', '2025-03-29 23:49:17'),
(22, 'dark_campaign', 'single', '{\"image\":{\"path\":\"contents\\/6GGZRzmom2TXnCdXas8jAIS4Gg0gaE.webp\",\"driver\":\"local\"}}', '2024-12-11 05:26:17', '2024-12-11 05:26:17'),
(23, 'dark_top_up', 'single', '{\"button_link\":\"https:\\/zyrex.win\\/\"}', '2024-12-11 10:48:25', '2025-03-29 23:49:01'),
(24, 'dark_why_chose_us', 'single', '{\"image\":{\"path\":\"contents\\/84LB2IifH0m75yVzOsBkT8g0jdu3Ly.webp\",\"driver\":\"local\"}}', '2024-12-11 11:10:15', '2024-12-11 11:10:15'),
(25, 'dark_why_chose_us', 'multiple', NULL, '2024-12-11 11:16:53', '2024-12-11 11:16:53'),
(26, 'dark_why_chose_us', 'multiple', NULL, '2024-12-11 11:17:13', '2024-12-11 11:17:13'),
(27, 'dark_why_chose_us', 'multiple', NULL, '2024-12-11 11:17:31', '2024-12-11 11:17:31'),
(28, 'dark_testimonial', 'single', '{\"button_link\":\"https:\\/\\/zyrex.win\\/\"}', '2024-12-11 11:36:29', '2025-03-29 23:46:11'),
(29, 'dark_testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/RB67GzeguScIvFppx2x3arKS8tHDbt.webp\",\"driver\":\"local\"}}', '2024-12-11 11:37:29', '2025-03-29 23:47:31'),
(30, 'dark_testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/9vgps5v5YRvcwF8f2NEJZOBeTb7I1B.webp\",\"driver\":\"local\"}}', '2024-12-11 11:38:22', '2025-03-29 23:48:39'),
(32, 'dark_blog', 'single', '{\"button_link\":\"https:\\/\\/zyrex.win\\/\"}', '2024-12-11 12:05:29', '2025-03-29 23:46:02'),
(33, 'footer', 'multiple', '{\"my_link\":\"https:\\/\\/www.facebook.com\\/\",\"icon\":\"fab fa-facebook-f\"}', '2024-12-12 07:33:04', '2024-12-12 07:34:52'),
(34, 'footer', 'multiple', '{\"my_link\":\"https:\\/\\/www.x.com\\/\",\"icon\":\"fab fa-twitter\"}', '2024-12-12 07:33:29', '2024-12-12 07:35:10'),
(35, 'footer', 'multiple', '{\"my_link\":\"https:\\/\\/www.linkedin.com\\/\",\"icon\":\"fab fa-linkedin\"}', '2024-12-12 07:33:59', '2024-12-12 07:35:24'),
(36, 'footer', 'multiple', '{\"my_link\":\"https:\\/\\/www.instagram.com\\/\",\"icon\":\"fab fa-instagram\"}', '2024-12-12 07:34:26', '2024-12-12 07:35:35'),
(37, 'dark_contact', 'single', '{\"image\":{\"path\":\"contents\\/CVDLOSZavcxz3wDsI3GxsMtfEXfA8K.webp\",\"driver\":\"local\"}}', '2024-12-12 10:26:07', '2024-12-12 10:26:07'),
(38, 'light_blog', 'single', '{\"button_link\":\"https:\\/\\/xead.my.id\\/\"}', '2024-12-19 04:32:45', '2025-05-28 08:23:58'),
(39, 'light_testimonial', 'single', '{\"image\":{\"path\":\"contents\\/4gqHFkWDUadeys8AgvX6VSkEQA6nri.webp\",\"driver\":\"local\"}}', '2024-12-19 05:00:58', '2024-12-19 05:00:59'),
(40, 'light_testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/8RLcIrdj2RjVotIVz08tM10VtYYvsW.webp\",\"driver\":\"local\"}}', '2024-12-19 05:02:49', '2024-12-19 05:02:49'),
(41, 'light_testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/LY3WLtDV4MvmNvLDTAEp1uRurXO6TO.webp\",\"driver\":\"local\"}}', '2024-12-19 05:03:34', '2024-12-19 05:03:34'),
(42, 'light_testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/WBZpY2fvziMwONoXmR7Om3ijBcPVos.webp\",\"driver\":\"local\"}}', '2024-12-19 05:04:02', '2024-12-19 05:04:02'),
(43, 'light_why_chose_us', 'single', '{\"image\":{\"path\":\"contents\\/HWURlhW8c3iFLufTglFdZieYpzVL6X.webp\",\"driver\":\"local\"},\"button_link\":\"https:\\/\\/bugfinder.net\\/\"}', '2024-12-19 05:52:24', '2024-12-19 05:52:24'),
(44, 'light_why_chose_us', 'multiple', NULL, '2024-12-19 05:53:00', '2024-12-19 05:53:00'),
(45, 'light_why_chose_us', 'multiple', NULL, '2024-12-19 05:53:52', '2024-12-19 05:53:52'),
(46, 'light_why_chose_us', 'multiple', NULL, '2024-12-19 05:54:09', '2024-12-19 05:54:09'),
(47, 'light_why_chose_us', 'multiple', NULL, '2024-12-19 05:54:25', '2024-12-19 05:54:25'),
(48, 'light_top_up', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/\"}', '2024-12-19 06:10:40', '2024-12-19 06:10:40'),
(49, 'light_campaign', 'single', '{\"image\":{\"path\":\"contents\\/y7bByQCD00PaLoVgupnnHgdgsciitx.webp\",\"driver\":\"local\"}}', '2024-12-19 06:56:18', '2024-12-19 06:56:26'),
(50, 'light_about', 'single', '{\"image\":{\"path\":\"contents\\/8vVjw7LOSskVOiGKOGi5vAAxmP7ZGN.webp\",\"driver\":\"local\"},\"button_link\":\"https:\\/\\/bugfinder.net\\/\"}', '2024-12-19 07:32:06', '2024-12-19 07:32:06'),
(51, 'light_brand', 'multiple', '{\"icon\":\"fa-regular fa-star-of-life\"}', '2024-12-19 07:42:15', '2024-12-19 07:42:15'),
(52, 'light_brand', 'multiple', '{\"icon\":\"fa-regular fa-star-of-life\"}', '2024-12-19 07:42:30', '2024-12-19 07:42:30'),
(53, 'light_brand', 'multiple', '{\"icon\":\"fa-regular fa-star-of-life\"}', '2024-12-19 07:42:39', '2024-12-19 07:42:39'),
(54, 'light_brand', 'multiple', '{\"icon\":\"fa-regular fa-star-of-life\"}', '2024-12-19 07:42:56', '2024-12-19 07:42:56'),
(55, 'light_brand', 'multiple', '{\"icon\":\"fa-regular fa-star-of-life\"}', '2024-12-19 07:43:28', '2024-12-19 07:43:28'),
(56, 'light_brand', 'multiple', '{\"icon\":\"fa-regular fa-star-of-life\"}', '2024-12-19 07:43:52', '2024-12-19 07:43:52'),
(57, 'light_brand', 'multiple', '{\"icon\":\"fa-regular fa-star-of-life\"}', '2024-12-19 07:44:20', '2024-12-19 07:44:20'),
(58, 'light_brand', 'multiple', '{\"icon\":\"fa-regular fa-star-of-life\"}', '2024-12-19 07:44:33', '2024-12-19 07:44:33'),
(59, 'light_exclusive_card', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/\"}', '2024-12-19 07:55:58', '2024-12-19 07:55:58'),
(60, 'light_trending_item', 'single', NULL, '2024-12-19 09:27:27', '2024-12-19 09:27:27'),
(62, 'light_hero', 'multiple', '{\"image\":{\"path\":\"contents\\/ARPiIA2P0wFohNFwMVdk4MAvSG8CbS.webp\",\"driver\":\"local\"},\"image_two\":{\"path\":\"contents\\/FvVwW5GOQqTUFaOfjkNPrgxfJozoyD.webp\",\"driver\":\"local\"},\"image_three\":{\"path\":\"contents\\/Ux0tO9vqDoBtSylUaUi932y7X05u1T.webp\",\"driver\":\"local\"},\"button_link\":\"https:\\/\\/bugfinder.net\\/\"}', '2024-12-19 10:36:10', '2024-12-19 10:36:11'),
(63, 'light_hero', 'multiple', '{\"image\":{\"path\":\"contents\\/dQxsVMHsh5KqmuB3PBdGRYZ0X6n18j.webp\",\"driver\":\"local\"},\"image_two\":{\"path\":\"contents\\/qzpDPvZPiIip8mLa8q9mNb5L1XtG5r.webp\",\"driver\":\"local\"},\"image_three\":{\"path\":\"contents\\/toUw3FfQl6toAhAuelFIKIJtDdToQD.webp\",\"driver\":\"local\"},\"button_link\":\"https:\\/\\/bugfinder.net\\/\"}', '2024-12-19 10:40:25', '2024-12-19 10:40:25'),
(64, 'light_contact', 'single', NULL, '2024-12-19 10:59:28', '2024-12-19 10:59:28'),
(65, 'light_buy_game_id', 'single', '{\"button_link\":\"https:\\/\\/bugfinder.net\\/\"}', '2024-12-29 05:14:06', '2024-12-29 05:14:06'),
(66, 'dark_buy_game_id', 'single', '{\"button_link\":\"https:\\/\\/zyrex.win\\/\"}', '2024-12-29 12:46:50', '2025-03-29 23:45:25'),
(67, 'app_page', 'single', '{\"image\":{\"path\":\"contents\\/ny9YVuLSndzlnD364zc7o7bYjpK50I.webp\",\"driver\":\"local\"}}', '2025-02-04 09:33:49', '2025-03-29 23:42:10');

-- --------------------------------------------------------

--
-- Table structure for table `content_details`
--

CREATE TABLE `content_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_details`
--

INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '{\"heading\":\"Popular Top Up\"}', '2024-10-30 12:36:32', '2024-10-30 12:36:32'),
(2, 2, 1, '{\"heading\":\"More currently trending offers\",\"sub_heading\":\"Don\'t miss out \\u2013 grab them while you still have the chance!\"}', '2024-10-30 12:36:57', '2024-10-30 12:36:57'),
(3, 3, 1, '{\"heading\":\"Latest Card\"}', '2024-10-30 12:37:12', '2024-10-30 12:37:12'),
(4, 4, 1, '{\"heading\":\"Popular Blog\",\"button_name\":\"Explore More\"}', '2024-10-30 12:37:39', '2024-10-30 12:37:39'),
(5, 5, 1, '{\"heading\":\"What G2BUlP Can Provide\",\"sub_heading\":\"Dynamically deliver multidisciplinary infrastructures via revolution process products deliverables premium after just in time scenarios.\"}', '2024-10-30 12:38:51', '2024-10-30 12:38:51'),
(6, 6, 1, '{\"heading\":\"Multiple Payment Methods\",\"sub_heading\":\"Completely synergize B2C paradigms through researched technology. Credibly term high-impact imperatives.\"}', '2024-10-30 12:39:09', '2024-10-30 12:39:09'),
(7, 7, 1, '{\"heading\":\"Promotions for various Region\",\"sub_heading\":\"Completely synergize B2C paradigms through researched technology. Credibly term high-impact imperatives.\"}', '2024-10-30 12:39:17', '2024-10-30 12:39:17'),
(8, 8, 1, '{\"heading\":\"Protection of user privacy\",\"sub_heading\":\"Completely synergize B2C paradigms through researched technology. Credibly term high-impact imperatives.\"}', '2024-10-30 12:39:25', '2024-10-30 12:39:25'),
(9, 9, 1, '{\"heading\":\"Protection of user privacy\",\"sub_heading\":\"Completely synergize B2C paradigms through researched technology. Credibly term high-impact imperatives.\"}', '2024-10-30 12:39:34', '2024-10-30 12:39:34'),
(10, 10, 1, '{\"phone\":\"+45345847431324\",\"email\":\"demo@example.com\",\"address\":\"22 Baker Street, London\",\"contact_heading\":\"Contact Information\",\"contact_sub_heading\":\"Give us a call or drop by anytime, we endeavour to answer all enquiries within 24 hours on business days. We will be happy to answer your questions.\",\"message_heading\":\"We\\u2019re always here for you\",\"message_sub_heading\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia blanditiis consequuntur rem, sit itaque impedit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam consequatur Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sequi, perferendis?\"}', '2024-10-30 12:42:44', '2024-10-30 12:42:44'),
(11, 11, 1, '{\"login_page_heading\":\"Welcome back!\",\"login_page_sub_heading\":\"Hey Enter your details to get sign in to your account\",\"register_page_heading\":\"Welcome back!\",\"register_page_sub_heading\":\"Hey Enter your details to get sign in to your account\"}', '2024-10-30 12:45:40', '2024-10-30 12:45:40'),
(12, 12, 1, '{\"newsletter_text\":\"Subscribe Newsletter\",\"newsletter_button\":\"Subscribe\",\"message\":\"Need to get in touch with us ? Please contact with us with email.\",\"footer_email\":\"jonathan.zefanya16@gmail.com\",\"footer_location\":\"Jl. Puspitek, Setu, Kec. Serpong, Kota Tangerang Selatan, Banten 15314\",\"footer_phone\":\"6283807914090\",\"copyright_text_one\":\"Copyright \\u00a92025\",\"copyright_text_two\":\"All Rights Reserved!\",\"app_store_link\":\"#\",\"google_store_link\":\"#\"}', '2024-10-31 05:06:54', '2025-03-29 23:44:28'),
(13, 13, 1, '{\"footer_email\":\"jonathan.zefanya16@gmail.com\",\"footer_location\":\"Jl. Puspitek, Setu, Kec. Serpong, Kota Tangerang Selatan, Banten 15314\",\"footer_phone\":\"6283807914090\"}', '2024-10-31 05:28:38', '2025-03-29 23:43:27'),
(14, 14, 1, '{\"name\":\"Twitter\"}', '2024-10-31 05:29:10', '2024-10-31 05:29:10'),
(15, 15, 1, '{\"name\":\"Linkedin\"}', '2024-10-31 05:29:37', '2024-10-31 05:29:37'),
(16, 16, 1, '{\"name\":\"Instagram\"}', '2024-10-31 05:30:03', '2024-10-31 05:30:03'),
(17, 17, 1, '{\"trend_title\":\"Trending Items\",\"trend_sub_title\":\"Don\'t miss out\\u2014grab yours now!\"}', '2024-12-09 06:32:42', '2024-12-09 07:01:32'),
(18, 18, 1, '{\"title\":\"Warrior\'s Path Resurrection\",\"sub_title\":\"25% Off Get Unlimited Offer\",\"description\":\"Exchange skins get new once with best conditions\",\"kew-text\":\"Grab the offer\",\"box_type\":\"dark-moderate-blue-box\"}', '2024-12-09 06:34:35', '2024-12-09 06:42:42'),
(19, 19, 1, '{\"title\":\"Dragon Quest Remake EN United States\",\"sub_title\":\"25% Off Get Unlimited Offer\",\"description\":\"Exchange skins get new once with best conditions\",\"kew-text\":\"Grab the offer\",\"box_type\":\"very-light-blue-box\"}', '2024-12-09 06:35:36', '2024-12-09 06:43:00'),
(20, 20, 1, '{\"title\":\"About GameShop\",\"description\":\"<div style=\\\"color: rgb(8, 8, 8);\\\"><pre style=\\\"font-family:\'JetBrains Mono\',monospace;font-size:11.3pt;\\\">GameMart is a premier digital marketplace for purchasing top-ups, gift cards, and in-game<br>currencies, offering gamers a fast and hassle-free way to elevate their gaming adventures.<br>Whether you\\u2019re recharging your<br>favorite game or gifting credits, GameMart delivers reliable and efficient solutions<br>tailored to your gaming needs..\\r\\n\\r\\n<div><pre style=\\\"font-family:\'JetBrains Mono\',monospace;font-size:11.3pt;\\\">GameMart stands out with its exclusive discounts, seasonal promotions, and<br>    intuitive platform, making it the ultimate destination for gamers around the globe.<\\/pre><\\/div><\\/pre><\\/div>\",\"button\":\"know More\"}', '2024-12-10 12:52:53', '2024-12-10 12:52:53'),
(21, 21, 1, '{\"title\":\"Exclusive Card\",\"sub_title\":\"Don\'t miss our limited-time offers!  Discover current deals today!\",\"button\":\"Explore More\"}', '2024-12-11 04:40:58', '2024-12-22 05:46:02'),
(22, 22, 1, '{\"heading\":\"Flash Deal\",\"title\":\"Flash Sale offers\",\"sub_title\":\"Don\'t miss out \\u2013 grab them while you still have the chance!\"}', '2024-12-11 05:26:17', '2024-12-11 05:26:17'),
(23, 23, 1, '{\"title\":\"Game Top-Up Offers! \\ud83d\\udd25\",\"sub_title\":\"Don\'t miss our limited-time offers! Discover current deals today!\",\"button\":\"Explore More\"}', '2024-12-11 10:48:25', '2024-12-22 05:46:28'),
(24, 24, 1, '{\"title\":\"Experience the Difference with Us\",\"sub_title\":\"Delivering quality, reliability, and innovation every step of the way.\"}', '2024-12-11 11:10:15', '2024-12-11 11:10:15'),
(25, 25, 1, '{\"title\":\"Affordable Pricing\",\"description\":\"Enjoy premium services without breaking the bank. We offer competitive rates tailored to your budget\"}', '2024-12-11 11:16:53', '2024-12-11 11:16:53'),
(26, 26, 1, '{\"title\":\"Exceptional Support\",\"description\":\"Our dedicated team is available 24\\/7 to assist you, ensuring a seamless experience from start to finish.\"}', '2024-12-11 11:17:13', '2024-12-11 11:17:13'),
(27, 27, 1, '{\"title\":\"Trusted by Thousands\",\"description\":\"Join a community of happy customers who trust us for our reliability and outstanding results.\"}', '2024-12-11 11:17:31', '2024-12-11 11:17:31'),
(28, 28, 1, '{\"title\":\"Real success stories from our clients\",\"button\":\"Explore More\"}', '2024-12-11 11:36:29', '2024-12-11 11:36:29'),
(29, 29, 1, '{\"name\":\"Daffa NF\",\"location\":\"Legok\",\"review\":\"Keren Websitenya\",\"rating\":\"5\"}', '2024-12-11 11:37:29', '2025-03-29 23:47:41'),
(30, 30, 1, '{\"name\":\"Dimas AY\",\"location\":\"Legok\",\"review\":\"Murah Banget Cuy\",\"rating\":\"5\"}', '2024-12-11 11:38:22', '2025-03-29 23:48:39'),
(32, 32, 1, '{\"title\":\"Updated Blogs Post\",\"button\":\"Explore More\"}', '2024-12-11 12:05:29', '2024-12-11 12:05:29'),
(33, 33, 1, '{\"name\":\"Facebook\"}', '2024-12-12 07:33:04', '2024-12-12 07:33:04'),
(34, 34, 1, '{\"name\":\"Twitter\"}', '2024-12-12 07:33:29', '2024-12-12 07:33:29'),
(35, 35, 1, '{\"name\":\"LinkedIn\"}', '2024-12-12 07:33:59', '2024-12-12 07:33:59'),
(36, 36, 1, '{\"name\":\"Instagram\"}', '2024-12-12 07:34:26', '2024-12-12 07:34:26'),
(37, 37, 1, '{\"title\":\"Keep In Touch With Us.\",\"sub_title\":\"Neque convallis a cras semper auctor. Libero id faucibus nisl tincidunt egetnvallis.\",\"form_title\":\"Send a Message\",\"form_sub_title\":\"Let\'s Ask Your Questions\",\"email\":\"jonathan.zefanya16@gmail.com\",\"location\":\"zyrex.win\",\"phone\":\"+6283807914090\",\"button\":\"Send a massage\"}', '2024-12-12 10:26:07', '2025-03-29 23:45:46'),
(38, 38, 1, '{\"title\":\"Updated Blogs Post\",\"button\":\"view all\"}', '2024-12-19 04:32:45', '2024-12-19 04:32:45'),
(39, 39, 1, '{\"title\":\"What\'s our Customer say\",\"sub_title\":\"GEMOT is my go-to platform for game top-ups and gift cards. Their service is always quick, and the  process is hassle-free. Highly recommended!\"}', '2024-12-19 05:00:59', '2024-12-19 05:00:59'),
(40, 40, 1, '{\"name\":\"Jim Morison\",\"location\":\"London, UK\",\"review\":\"Gamers Arena is a paradise for gamers! I discovered amazing tips, connected with fellow gamers, and leveled up my skills like never before!\",\"rating\":\"5\"}', '2024-12-19 05:02:49', '2024-12-19 05:02:49'),
(41, 41, 1, '{\"name\":\"Jim Morison\",\"location\":\"London, UK\",\"review\":\"Thanks to Gamers Arena, I found my perfect gaming community. The tournaments and discussions here are next-level. Truly a gamer\'s haven!\",\"rating\":\"5\"}', '2024-12-19 05:03:34', '2024-12-19 05:03:34'),
(42, 42, 1, '{\"name\":\"Jim Morison\",\"location\":\"London, UK\",\"review\":\"From the latest game reviews to strategies, Gamers Arena has it all. It\\u2019s my go-to hub for everything gaming!\",\"rating\":\"5\"}', '2024-12-19 05:04:02', '2024-12-19 05:04:02'),
(43, 43, 1, '{\"title\":\"Experience the Difference with Us\",\"sub_title\":\"Delivering quality, reliability, and innovation every step of the way.\",\"button\":\"learn more\"}', '2024-12-19 05:52:24', '2024-12-19 05:52:24'),
(44, 44, 1, '{\"title\":\"Affordable Pricing\",\"description\":\"Enjoy premium services without breaking the bank. We offer competitive rates tailored to your budget\"}', '2024-12-19 05:53:00', '2024-12-19 05:53:00'),
(45, 45, 1, '{\"title\":\"Exceptional Support\",\"description\":\"Our dedicated team is available 24\\/7 to assist you, ensuring a seamless experience from start to finish.\"}', '2024-12-19 05:53:52', '2024-12-19 05:53:52'),
(46, 46, 1, '{\"title\":\"Trusted by Thousands\",\"description\":\"Join a community of happy customers who trust us for our reliability and outstanding results.\"}', '2024-12-19 05:54:09', '2024-12-19 05:54:09'),
(47, 47, 1, '{\"title\":\"Instant Delivery\",\"description\":\"Get purchases instantly! Our system ensures your in-game  currency or digital products are just a click away.\"}', '2024-12-19 05:54:25', '2024-12-19 05:54:25'),
(48, 48, 1, '{\"title\":\"Game Top-Up Offers! \\ud83d\\udd25\",\"sub_title\":\"Don\'t miss our limited-time offers! Discover current deals today!\",\"button\":\"view all\"}', '2024-12-19 06:10:40', '2024-12-22 05:57:45'),
(49, 49, 1, '{\"heading\":\"Flash Deal\",\"title\":\"Flash Sale offers\",\"sub_title\":\"Don\'t miss out \\u2013 grab them while you still have the chance!\"}', '2024-12-19 06:56:18', '2024-12-19 06:56:18'),
(50, 50, 1, '{\"title\":\"About GameShop\",\"description\":\"<div style=\\\"\\\"><pre style=\\\"\\\"><pre style=\\\"font-family: &quot;JetBrains Mono&quot;, monospace; font-size: 11.3pt; color: rgb(8, 8, 8);\\\">GameMart is a premier digital marketplace for purchasing top-ups, gift cards, and in-game<br>currencies, offering gamers a fast and hassle-free way to elevate their gaming adventures.<br>Whether you\\u2019re recharging your<br>favorite game or gifting credits, GameMart delivers reliable and efficient solutions<br>tailored to your gaming needs..\\r\\n\\r\\n<div><pre style=\\\"font-family: &quot;JetBrains Mono&quot;, monospace; font-size: 11.3pt;\\\">GameMart stands out with its exclusive discounts, seasonal promotions, and intuitive platform, making it the ultimate destination for gamers around the globe.<\\/pre><\\/div><\\/pre><\\/pre><\\/div>\",\"button\":\"know more\"}', '2024-12-19 07:32:06', '2024-12-21 10:55:57'),
(51, 51, 1, '{\"item\":\"Game Top-Up\"}', '2024-12-19 07:42:15', '2024-12-19 07:42:15'),
(52, 52, 1, '{\"item\":\"Digital Vouchers\"}', '2024-12-19 07:42:30', '2024-12-19 07:42:30'),
(53, 53, 1, '{\"item\":\"In-Game Currency\"}', '2024-12-19 07:42:39', '2024-12-19 07:42:39'),
(54, 54, 1, '{\"item\":\"Exclusive Deals\"}', '2024-12-19 07:42:56', '2024-12-19 07:42:56'),
(55, 55, 1, '{\"item\":\"Gift Cards\"}', '2024-12-19 07:43:28', '2024-12-19 07:43:28'),
(56, 56, 1, '{\"item\":\"Membership Codes\"}', '2024-12-19 07:43:52', '2024-12-19 07:43:52'),
(57, 57, 1, '{\"item\":\"Promo Bundles\"}', '2024-12-19 07:44:20', '2024-12-19 07:44:20'),
(58, 58, 1, '{\"item\":\"Special Gaming Offers\"}', '2024-12-19 07:44:33', '2024-12-19 07:44:33'),
(59, 59, 1, '{\"title\":\"Exclusive Cards\",\"sub_title\":\"Don\'t miss our limited-time offers! Discover current deals today!\",\"button\":\"view all\"}', '2024-12-19 07:55:58', '2024-12-22 05:49:11'),
(60, 60, 1, '{\"title\":\"Card Items\",\"sub_title\":\"Don\'t miss out\\u2014grab yours now!\"}', '2024-12-19 09:27:27', '2024-12-22 06:00:08'),
(62, 62, 1, '{\"title\":\"25% Off Get Unlimited Offer\",\"sub_title\":\"Relive the Shattering Cataclysm Arrives\",\"description\":\"Exchange skins get new once with best conditions\",\"button\":\"know more\"}', '2024-12-19 10:36:11', '2024-12-19 10:36:11'),
(63, 63, 1, '{\"title\":\"25% Off Get Unlimited Offer\",\"sub_title\":\"Relive the Shattering Cataclysm Arrives\",\"description\":\"Exchange skins get new once with best conditions\",\"button\":\"know more\"}', '2024-12-19 10:40:25', '2024-12-19 10:40:25'),
(64, 64, 1, '{\"title\":\"Contact Information\",\"sub_title\":\"Give us a call or drop by anytime, we endeavour to answer all enquiries within 24 hours on business days. We will be happy to answer your questions.\",\"form_title\":\"We\\u2019re always here for you\",\"form_sub_title\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia blanditiis consequuntur rem, sit itaque impedit. Lorem ipsum dolor sit amet consectetur  adipisicing elit. Quam consequatur Lorem ipsum dolor sit, amet consectetur  adipisicing elit. Sequi, perferendis?\",\"email\":\"demo@example.com\",\"location\":\"22 Baker Street, London\",\"phone\":\"+45345847431324\",\"button\":\"Send a massage\"}', '2024-12-19 10:59:28', '2024-12-19 10:59:28'),
(65, 65, 1, '{\"title\":\"Buy Game IDs! \\ud83c\\udfae\",\"sub_title\":\"Exclusive Limited-Time Offers Just for You!\",\"button\":\"view all\"}', '2024-12-29 05:14:06', '2024-12-29 05:14:06'),
(66, 66, 1, '{\"title\":\"Buy Game IDs! \\ud83c\\udfae\",\"sub_title\":\"Exclusive Limited-Time Offers Just for You!\",\"button\":\"Explore more\"}', '2024-12-29 12:46:50', '2024-12-29 12:47:28'),
(135, 67, 1, '{\"heading\":\"Enjoy the Game\",\"sub_heading\":\"GAMESHOP UNIVERSE\",\"button_name\":\"Shop Now\"}', '2025-02-04 09:33:49', '2025-02-04 09:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` float DEFAULT 0,
  `discount_type` enum('percent','flat') DEFAULT 'percent',
  `used_limit` int(11) NOT NULL DEFAULT 0,
  `is_unlimited` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>no,1=>yes',
  `top_up_list` longtext DEFAULT NULL,
  `card_list` longtext DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `total_use` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` text DEFAULT NULL,
  `rate` double NOT NULL DEFAULT 1 COMMENT '1 base currency = rate',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive,1=>active',
  `sort_by` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `rate`, `status`, `sort_by`, `created_at`, `updated_at`) VALUES
(1, 'Rupiah', 'IDR', 'Rp.', 1, 1, 1, '2025-03-29 23:53:03', '2025-11-23 16:20:57');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `depositable_id` int(11) DEFAULT NULL,
  `depositable_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_currency` varchar(255) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `amount_in_base` double NOT NULL DEFAULT 0,
  `percentage_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `payable_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount payed',
  `btc_amount` decimal(18,8) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `trx_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=success, 2=request, 3=rejected',
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_crypto_currency` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `depositable_id`, `depositable_type`, `user_id`, `payment_method_id`, `payment_method_currency`, `amount`, `amount_in_base`, `percentage_charge`, `fixed_charge`, `charge`, `payable_amount`, `btc_amount`, `btc_wallet`, `payment_id`, `information`, `trx_id`, `status`, `note`, `created_at`, `updated_at`, `payment_crypto_currency`) VALUES
(4, 5, 'App\\Models\\Order', 1, 1000, 'IDR', 550000.00000000, 550000, 60500.00000000, 0.50000000, 60500.50000000, 610500.50000000, NULL, NULL, NULL, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"validation\":\"required\",\"field_value\":\"123\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"validation\":\"required\",\"field_value\":\"123\",\"type\":\"text\"},\"Address\":{\"field_name\":\"Address\",\"validation\":\"required\",\"field_value\":\"Abc\",\"type\":\"text\"},\"NID\":{\"field_name\":\"NID\",\"field_value\":\"deposit\\/LzmDyhHoTBMPyhIe6jQnTTKimwqWq1.webp\",\"field_driver\":\"local\",\"validation\":\"required\",\"type\":\"file\"}}', 'D775920401855', 1, 'Keren kamu bang', '2025-11-24 10:18:57', '2025-11-24 10:20:22', NULL),
(5, 7, 'App\\Models\\Order', 3, 1000, 'USD', 0.65000000, 10918.86, 0.15000000, 0.50000000, 0.65000000, 1.30000000, NULL, NULL, NULL, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"validation\":\"required\",\"field_value\":\"miauw\",\"type\":\"text\"},\"BeneficiaryName\":{\"field_name\":\"BeneficiaryName\",\"validation\":\"required\",\"field_value\":\"asfafjk\",\"type\":\"text\"},\"Address\":{\"field_name\":\"Address\",\"validation\":\"required\",\"field_value\":\"affalfa\",\"type\":\"text\"},\"NID\":{\"field_name\":\"NID\",\"field_value\":\"deposit\\/F7m2MfjUEhpLUa7xGVaggwEH42E7Pq.webp\",\"field_driver\":\"local\",\"validation\":\"required\",\"type\":\"file\"}}', 'D775920401856', 3, 'AOKWOAKWOKWOK', '2025-11-29 07:03:37', '2025-12-05 16:26:22', NULL),
(6, 8, 'App\\Models\\Order', 3, 1000, 'USD', 0.65000000, 10918.86, 0.15000000, 0.50000000, 0.65000000, 1.30000000, NULL, NULL, NULL, NULL, 'D775920401857', 0, NULL, '2025-11-30 10:02:15', '2025-11-30 10:02:15', NULL),
(7, 9, 'App\\Models\\Order', 3, 1000, 'USD', 0.65000000, 10918.86, 0.15000000, 0.50000000, 0.65000000, 1.30000000, NULL, NULL, NULL, NULL, 'D775920401858', 0, NULL, '2025-11-30 11:04:06', '2025-11-30 11:04:06', NULL),
(8, 13, 'App\\Models\\Order', 1, 1008, 'IDR', 16000.00000000, 16000, 1760.00000000, 1000.00000000, 2760.00000000, 18760.00000000, NULL, NULL, NULL, NULL, 'D775920401859', 0, NULL, '2025-12-05 16:40:26', '2025-12-05 16:40:26', NULL),
(9, NULL, NULL, 1, 1000, 'IDR', 100000.00000000, 100000, 11000.00000000, 10000.00000000, 21000.00000000, 121000.00000000, NULL, NULL, NULL, NULL, 'D775920401860', 0, NULL, '2025-12-05 16:41:47', '2025-12-05 16:41:47', NULL),
(10, NULL, NULL, 1, 1000, 'IDR', 99999.00000000, 99999, 10999.89000000, 10000.00000000, 20999.89000000, 120998.89000000, NULL, NULL, NULL, NULL, 'D775920401861', 0, NULL, '2025-12-05 16:42:28', '2025-12-05 16:42:28', NULL),
(11, 15, 'App\\Models\\Order', 1, 1000, 'IDR', 1000000.00000000, 1000000, 110000.00000000, 10000.00000000, 120000.00000000, 1120000.00000000, NULL, NULL, NULL, NULL, 'D775920401862', 0, NULL, '2025-12-05 16:42:39', '2025-12-05 16:42:39', NULL),
(12, NULL, NULL, 1, 1008, 'IDR', 10000.00000000, 10000, 1100.00000000, 1000.00000000, 2100.00000000, 12100.00000000, NULL, NULL, NULL, NULL, 'D775920401863', 0, NULL, '2025-12-07 15:35:33', '2025-12-07 15:35:33', NULL),
(13, 17, 'App\\Models\\Order', 1, 1000, 'IDR', 100000.00000000, 100000, 11000.00000000, 10000.00000000, 21000.00000000, 121000.00000000, NULL, NULL, NULL, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"validation\":\"required\",\"field_value\":\"123\",\"type\":\"text\"},\"NamaPengirim\":{\"field_name\":\"NamaPengirim\",\"validation\":\"required\",\"field_value\":\"aa\",\"type\":\"text\"},\"BuktiTransfer\":{\"field_name\":\"BuktiTransfer\",\"field_value\":\"deposit\\/1CCsDKIGvVGHifEwk78aqDiFPYkY57.webp\",\"field_driver\":\"local\",\"validation\":\"required\",\"type\":\"file\"}}', 'D775920401864', 1, 'gg sir', '2025-12-07 15:41:52', '2025-12-07 15:42:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_storages`
--

CREATE TABLE `file_storages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => active, 0 => inactive',
  `parameters` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_storages`
--

INSERT INTO `file_storages` (`id`, `code`, `name`, `status`, `parameters`, `created_at`, `updated_at`) VALUES
(1, 's3', 'Amazon S3', 0, '{\"access_key_id\":\"XXXXXXXXXX\",\"secret_access_key\":\"XXXXXXXXXXXX\",\"default_region\":\"blr1\",\"bucket\":\"XXXXXXXXXXXX\",\"url\":\"https:\\/\\/g2bulk.blr1.digitaloceanspaces.com\",\"endpoint\":\"https:\\/\\/blr1.digitaloceanspaces.com\"}', NULL, '2025-03-09 05:33:06'),
(2, 'sftp', 'SFTP', 0, '{\"sftp_username\":\"XXXXXXXXXXXXX\",\"sftp_password\":\"XXXXXXXXXXXXX\"}', NULL, '2025-03-09 05:33:23'),
(3, 'do', 'Digitalocean Spaces', 0, '{\"spaces_key\":\"XXXXXXXXXXXX\",\"spaces_secret\":\"XXXXXXXXXXXXXXX\",\"spaces_endpoint\":\"XXXXXXXXXXXX\",\"spaces_region\":\"XXXXXXXXXXXXX\",\"spaces_bucket\":\"assets-coral\"}', NULL, '2025-03-09 05:33:35'),
(4, 'ftp', 'FTP', 0, '{\"ftp_host\":\"ftp.zyrex.win\",\"ftp_username\":\"JonathanZefanya@zyrex.win\",\"ftp_password\":\"085217342122Aa.\"}', NULL, '2025-03-29 23:40:03'),
(5, 'local', 'Local Storage', 1, NULL, NULL, '2025-03-29 23:40:03');

-- --------------------------------------------------------

--
-- Table structure for table `fire_base_tokens`
--

CREATE TABLE `fire_base_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_id` int(11) DEFAULT NULL,
  `tokenable_type` varchar(255) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_by` int(11) DEFAULT 1,
  `image` varchar(191) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1: active',
  `parameters` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `extra_parameters` text DEFAULT NULL,
  `supported_currency` varchar(255) DEFAULT NULL,
  `receivable_currencies` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `currency_type` tinyint(1) NOT NULL DEFAULT 1,
  `is_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `environment` enum('test','live') NOT NULL DEFAULT 'live',
  `is_manual` tinyint(1) DEFAULT 1,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `sort_by`, `image`, `driver`, `status`, `parameters`, `currencies`, `extra_parameters`, `supported_currency`, `receivable_currencies`, `description`, `currency_type`, `is_sandbox`, `environment`, `is_manual`, `note`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'Paypal', 8, 'gateway/Nk4vMzucK39NN3enEZLxHKyUm8LYCC.webp', 'local', 0, '{\"cleint_id\":\"XXXXXXXXXXXXXXXX\",\"secret\":\"XXXXXXXXXXXXXXXXX\"}', '{\"0\":{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-12 09:29:00'),
(2, 'stripe', 'Stripe', 1, 'gateway/fkcARCIw6q6Fb3DY1AIS3FvxCc0khe.webp', 'local', 0, '{\"secret_key\":\"XXXXXXXXXXXX\",\"publishable_key\":\"XXXXXXXXXXXXXXXX\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}}', NULL, '[\"USD\",\"EUR\",\"GBP\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"0.1\",\"max_limit\":\"100000\",\"percentage_charge\":\"1\",\"fixed_charge\":\"0\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.94\",\"min_limit\":\"0.1\",\"max_limit\":\"100000\",\"percentage_charge\":\"1\",\"fixed_charge\":\"0\"},{\"name\":\"GBP\",\"currency_symbol\":\"GBP\",\"conversion_rate\":\"0.78\",\"min_limit\":\"0.1\",\"max_limit\":\"100000\",\"percentage_charge\":\"2\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-12 09:28:26'),
(3, 'skrill', 'Skrill', 17, 'gateway/C4thMOqpc0I1KMNzHVaLFBh1jzMv8t.webp', 'local', 0, '{\"pay_to_email\":\"XXXXXXXXXXXXXXX\",\"secret_key\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}}', NULL, '[\"AUD\",\"USD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(4, 'perfectmoney', 'Perfect Money', 7, 'gateway/GuDH5siaapn6SHRDUDqXecX51zh8GE.webp', 'local', 0, '{\"passphrase\":\"XXXXXXXXXXXXXXX\",\"payee_account\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(5, 'paytm', 'PayTM', 6, 'gateway/SHDMZxj6WifHck4MYwjCSapYC9mbCL.webp', 'local', 0, '{\"MID\":\"XXXXXXXXXXXXXXX\",\"merchant_key\":\"XXXXXXXXXXXXXX\",\"WEBSITE\":\"DIYtestingweb\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\",\"environment_url\":\"https:\\/\\/securegw-stage.paytm.in\",\"process_transaction_url\":\"https:\\/\\/securegw-stage.paytm.in\\/theia\\/processTransaction\"}', '{\"0\":{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-12 09:28:44'),
(6, 'payeer', 'Payeer', 24, 'gateway/P5KPCePinssVbsnypNXupvk3vSFPBs.webp', 'local', 0, '{\"merchant_id\":\"XXXXXXXXXXXXX\",\"secret_key\":\"XXXXXXXXXXXX\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}}', '{\"status\":\"ipn\"}', '[\"USD\",\"RUB\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"RUB\",\"currency_symbol\":\"RUB\",\"conversion_rate\":\"0.81\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(7, 'paystack', 'PayStack', 12, 'gateway/vLBlcoKlu7GJU3Lk5cHI41wpjmom5l.webp', 'local', 0, '{\"public_key\":\"XXXXXXXXXXXXXXXX\",\"secret_key\":\"XXXXXXXXXXXXXXXX\"}', '{\"0\":{\"USD\":\"USD\",\"NGN\":\"NGN\"}}', '{\"callback\":\"ipn\",\"webhook\":\"ipn\"}\r\n', '[\"USD\",\"NGN\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(8, 'voguepay', 'VoguePay', 37, 'gateway/Dp96eF1CkMZuRIOb31ZRoqnkguEEg3.webp', 'local', 0, '{\"merchant_id\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"ZAR\":\"ZAR\",\"JPY\":\"JPY\",\"INR\":\"INR\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PLN\":\"PLN\"}}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL, '[\"NGN\",\"EUR\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(9, 'flutterwave', 'Flutterwave', 2, 'gateway/4yeVYeCUiDSsRrfJu1DXtasGr3Cn2g.webp', 'local', 0, '{\"public_key\":\"XXXXXXXXXXXXXX\",\"secret_key\":\"XXXXXXXXXXXX\",\"encryption_key\":\"FLWSECK_TEST817a365e142b\"}', '{\"0\":{\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}}', NULL, '[\"GHS\",\"NGN\",\"USD\"]', '[{\"name\":\"GHS\",\"currency_symbol\":\"GHS\",\"conversion_rate\":\"0.11\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(10, 'razorpay', 'RazorPay', 4, 'gateway/HW86pFkI6wkIZe5AJ0JWgqLW1oj6Ja.webp', 'local', 0, '{\"key_id\":\"XXXXXXXXXXXXXXXXXXXX\",\"key_secret\":\"XXXXXXXXXXXXXXX\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-12 09:28:34'),
(11, 'instamojo', 'instamojo', 21, 'gateway/AiNxmEp7ak05BnJGCgLtlvWpYloaLm.webp', 'local', 0, '{\"api_key\":\"XXXXXXXXXXXXXXX\",\"auth_token\":\"XXXXXXXXXXXXX\",\"salt\":\"XXXXXXXXXXXXXXX\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(12, 'mollie', 'Mollie', 10, 'gateway/zHwwEwEdoELWdyoNvq4xkH0jx02QW2.webp', 'local', 0, '{\"api_key\":\"XXXXXXXXXXXX\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}}', NULL, '[\"AUD\",\"BRL\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"BRL\",\"currency_symbol\":\"BRL\",\"conversion_rate\":\"0.045\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-12 09:29:03'),
(13, 'twocheckout', '2checkout', 19, 'gateway/m2sdUTSsSY8pfO7BrCnf7m5vpYNo50.webp', 'local', 0, '{\"merchant_code\":\"XXXXXXXXXXXXXX\",\"secret_key\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"DZD\":\"DZD\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BSD\":\"BSD\",\"BDT\":\"BDT\",\"BBD\":\"BBD\",\"BZD\":\"BZD\",\"BMD\":\"BMD\",\"BOB\":\"BOB\",\"BWP\":\"BWP\",\"BRL\":\"BRL\",\"GBP\":\"GBP\",\"BND\":\"BND\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"XCD\":\"XCD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JMD\":\"JMD\",\"JPY\":\"JPY\",\"KZT\":\"KZT\",\"KES\":\"KES\",\"LAK\":\"LAK\",\"MMK\":\"MMK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MOP\":\"MOP\",\"MYR\":\"MYR\",\"MVR\":\"MVR\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PGK\":\"PGK\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"WST\":\"WST\",\"SAR\":\"SAR\",\"SCR\":\"SCR\",\"SGD\":\"SGD\",\"SBD\":\"SBD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TRY\":\"TRY\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"USD\":\"USD\",\"VUV\":\"VUV\",\"VND\":\"VND\",\"XOF\":\"XOF\",\"YER\":\"YER\"}}', '{\"approved_url\":\"ipn\"}', '[\"AFN\",\"ARS\"]', '[{\"name\":\"AFN\",\"currency_symbol\":\"AFN\",\"conversion_rate\":\"0.63\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":\"3.24\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(14, 'authorizenet', 'Authorize.Net', 18, 'gateway/d9l4GeVSHMxOkdmdxstnFGySMdprwr.webp', 'local', 0, '{\"login_id\":\"XXXXXXXXXXXXXXXXX\",\"current_transaction_key\":\"XXXXXXXXXXXXXX\"}', '{\"0\":{\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"USD\":\"USD\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-12 09:29:08'),
(16, 'payumoney', 'PayUmoney', 41, 'gateway/R8KCOLwNGqYxgy8FM4GJxM3LiLPVV4.webp', 'local', 0, '{\"merchant_key\":\"XXXXXXXXXXXXX\",\"salt\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(17, 'mercadopago', 'Mercado Pago', 25, 'gateway/HL5XKciRmtAW5AMrhIhW794JKJ0hlp.webp', 'local', 0, '{\"access_token\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"ARS\":\"ARS\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"DOP\":\"DOP\",\"EUR\":\"EUR\",\"GTQ\":\"GTQ\",\"HNL\":\"HNL\",\"MXN\":\"MXN\",\"NIO\":\"NIO\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PYG\":\"PYG\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VES\":\"VES\"}}', NULL, '[\"ARS\"]', '[{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":\"3.24\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(18, 'coingate', 'Coingate', 26, 'gateway/M6BdYSH74P0eqyoYyIDACBotf5moDR.webp', 'local', 0, '{\"api_key\":\"XXXXXXXXXXXXXXXXX\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(19, 'coinbasecommerce', 'Coinbase Commerce', 23, 'gateway/GoKEpwU5XQXRfT2phJZ2sJcVlmGj1S.webp', 'local', 0, '{\"api_key\":\"XXXXXXXXXXXXXX\",\"secret\":\"XXXXXXXXXXXXXX\"}', '{\"0\":{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}}', '{\"webhook\":\"ipn\"}', '[\"AED\",\"ALL\"]', '[{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":\"0.033\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ALL\",\"currency_symbol\":\"ALL\",\"conversion_rate\":\"0.85\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(20, 'monnify', 'Monnify', 27, 'gateway/BbZ9WJQbxtYdFApARHyEv8h3co70cH.webp', 'local', 0, '{\"api_key\":\"XXXXXXXXXXXXXXXX\",\"secret_key\":\"XXXXXXXXXXXXXXXXXXXXXXX\",\"contract_code\":\"XXXXXXXXXXXXXXXXX\"}', '{\"0\":{\"NGN\":\"NGN\"}}', NULL, '[\"NGN\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(22, 'coinpayments', 'CoinPayments', 28, 'gateway/inbt6OudI8tpKqnDHgg4NqPHbXAHMc.webp', 'local', 0, '{\"merchant_id\":\"XXXXXXXXXXXXXXXX\",\"private_key\":\"XXXXXXXXXXXXXXXXXXX\",\"public_key\":\"XXXXXXXXXXXXXXXXXX\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"},\"1\":{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}}', '{\"callback\":\"ipn\"}', '[\"USD\",\"AUD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(23, 'blockchain', 'Blockchain', 9, 'gateway/IRA1GwbTWfW3Bkt1R0PUb3lixxjFEY.webp', 'local', 0, '{\"api_key\":\"XXXXXXXXXXXXXXXXX\",\"xpub_code\":\"XXXXXXXXXXXXXXX\"}', '{\"1\":{\"BTC\":\"BTC\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"0.01\",\"max_limit\":\"500000\",\"percentage_charge\":\"10\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2025-04-12 09:28:56'),
(25, 'cashmaal', 'cashmaal', 30, 'gateway/fzk2sEmTAzs9yJAmxsGjaQTBvVLvtd.webp', 'local', 0, '{\"web_id\":\"XXXXXXXXXXXX\",\"ipn_key\":\"XX\"}', '{\"0\":{\"PKR\":\"PKR\",\"USD\":\"USD\"}}', '{\"ipn_url\":\"ipn\"}', '[\"PKR\",\"USD\"]', '[{\"name\":\"PKR\",\"currency_symbol\":\"PKR\",\"conversion_rate\":\"2.56\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, NULL, '2025-04-01 20:25:48'),
(26, 'midtrans', 'Midtrans', 16, 'gateway/z0Co0xJx2JlL3yYzQl1TCXxp3igSRk.webp', 'local', 0, '{\"client_key\":\"XXXXXXXXXXXXXX\",\"server_key\":\"XXXXXXXXXXXX\"}', '{\"0\":{\"IDR\":\"IDR\"}}', '{\"payment_notification_url\":\"ipn\", \"finish redirect_url\":\"ipn\", \"unfinish redirect_url\":\"failed\",\"error redirect_url\":\"failed\"}', '[\"IDR\"]', '[{\"name\":\"IDR\",\"currency_symbol\":\"IDR\",\"conversion_rate\":\"141.38\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, '', '2020-09-08 21:05:02', '2025-04-01 20:25:48'),
(27, 'peachpayments', 'peachpayments', 38, 'gateway/9ok3JvnF5NjdYGFAq0AIskQK3d2ffT.webp', 'local', 0, '{\"Authorization_Bearer\":\"XXXXXXXXXXXX\",\"Entity_ID\":\"XXXXXXXXXXXXXX\",\"Recur_Channel\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"AED\":\"AED\",\"AFA\":\"AFA\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZM\":\"AZM\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYR\":\"BYR\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CYP\":\"CYP\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EEK\":\"EEK\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHC\":\"GHC\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LTL\":\"LTL\",\"LVL\":\"LVL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MTL\":\"MTL\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZM\":\"MZM\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PTS\":\"PTS\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDD\":\"SDD\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SIT\":\"SIT\",\"SKK\":\"SKK\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SPL\":\"SPL\",\"SRD\":\"SRD\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMM\":\"TMM\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRL\":\"TRL\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TVD\":\"TVD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMK\":\"ZMK\",\"ZWD\":\"ZWD\"}}', NULL, '[\"AED\",\"CAD\"]', '[{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.033\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-09 03:05:02', '2025-04-01 20:25:48'),
(28, 'nowpayments', 'Nowpayments', 32, 'gateway/090wVjftHnUzBNt0QXkwEYSQqATqVv.webp', 'local', 0, '{\"api_key\":\"XXXXXXXXXXXXXXX\"}', '{\"1\":{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}}', '{\"cron\":\"ipn\"}', '[\"ETH\",\"XEM\"]', '[{\"name\":\"ETH\",\"currency_symbol\":\"ETH\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"10\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"XEM\",\"currency_symbol\":\"XEM\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"10\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2025-04-01 20:25:48'),
(29, 'khalti', 'Khalti Payment', 33, 'gateway/x4BeAPBkYuM494NvWfAkrxTfk1tbUt.avif', 'local', 0, '{\"secret_key\":\"test_secret_key_e241fa0cf56e44b3a5e55a20f6a45e84\",\"public_key\":\"test_public_key_d4d1c327935749508ee25b52e22ebabb\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-04-01 20:25:48'),
(30, 'swagger', 'MAGUA PAY', 29, 'gateway/TAofN7wyhRqWNapL25bwpSqTtEUUos.webp', 'local', 0, '{\"MAGUA_PAY_ACCOUNT\":\"XXXXXXXXXXXXX\",\"MerchantKey\":\"XXXXXXXXXXXXXX\",\"Secret\":\"XXXXXXXXXXXXXXXXXXX\"}', '{\"0\":{\"EUR\":\"EUR\"}}', NULL, '[\"EUR\"]', '[{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-04-01 20:25:48'),
(31, 'freekassa', 'Free kassa', 39, 'gateway/zW3twzzFSf6Spq3DkOpfyuMjjWSvOa.webp', 'local', 0, '{\"merchant_id\":\"8896\",\"merchant_key\":\"21b1f9f32162cdd5e59df622d0c28db5\",\"secret_word\":\"XXXXXXXXXXX\",\"secret_word2\":\"XXXXXXXXXXX\"}', '{\"0\":{\"RUB\":\"RUB\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"UAH\":\"UAH\",\"KZT\":\"KZT\"}}', '{\"ipn_url\":\"ipn\"}', '[\"RUB\",\"USD\"]', '[{\"name\":\"RUB\",\"currency_symbol\":\"RUB\",\"conversion_rate\":\"0.81\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-04-01 20:25:48'),
(32, 'konnect', 'Konnect', 34, 'gateway/FiY4gIT1aXAKBLW86BWuCvmrntQ4tA.webp', 'local', 0, '{\"api_key\":\"XXXXXXXXXXX\",\"receiver_wallet_Id\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"TND\":\"TND\",\"EUR\":\"EUR\",\"USD\":\"USD\"}}', '{\"webhook\":\"ipn\"}', '[\"TND\",\"EUR\",\"USD\"]', '[{\"name\":\"TND\",\"currency_symbol\":\"TND\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.028\",\"min_limit\":\"1\",\"max_limit\":\"20000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"60000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2025-04-01 20:25:48'),
(33, 'mypay', 'Mypay Np', 36, 'gateway/4GMe3Ij57iCQsFjrXxrPS96cVNhRut.webp', 'local', 0, '{\"merchant_username\":\"XXXXXXXXXXXX\",\"merchant_api_password\":\"XXXXXXXXXXXXXX\",\"merchant_id\":\"XXXXXXXXXXXX\",\"api_key\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2025-04-01 20:25:48'),
(35, 'imepay', 'IME PAY', 20, 'gateway/yssiHLTwmz6tZGHBenAyMK3MFPDtjE.webp', 'local', 0, '{\"MerchantModule\":\"XXXXXXXXXXXX\",\"MerchantCode\":\"XXXXXXXXXXXXX\",\"username\":\"XXXXXXXXXXXX\",\"password\":\"XXXXXXXXXXXX\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"10\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"1.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2025-04-01 20:25:48'),
(36, 'cashonexHosted', 'Cashonex Hosted', 22, 'gateway/Bz46MPJVz8FqLOvsUHvq9p8Gy7oFj9.webp', 'local', 0, '{\"idempotency_key\":\"XXXXXXXXXXXXXX\",\"salt\":\"XXXXXXXXXXXXXX\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:31:33', '2025-04-01 20:25:48'),
(37, 'cashonex', 'cashonex', 35, 'gateway/LYGeCnXEKepVNXbgk6yqGGEXv6DKpn.webp', 'local', 0, '{\"idempotency_key\":\"155228-ck-651971-ody-329243-h6i\",\"salt\":\"5a05d0f7336738460c4d098785cd0f2785bd60631bec019ea2ca61ed195ea8b5\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0.0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:34:54', '2025-04-01 20:25:48'),
(38, 'binance', 'Binance', 11, 'gateway/sZOVbwUjssiUdYzrEbRNq4GzPVliPp.webp', 'local', 0, '{\"mercent_api_key\":\"XXXXXXXXXXXXXXXXXXX\",\"mercent_secret\":\"XXXXXXXXXXXXXXXX\"}', '{\"1\":{\"ADA\":\"ADA\",\"ATOM\":\"ATOM\",\"AVA\":\"AVA\",\"BCH\":\"BCH\",\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"BUSD\":\"BUSD\",\"CTSI\":\"CTSI\",\"DASH\":\"DASH\",\"DOGE\":\"DOGE\",\"DOT\":\"DOT\",\"EGLD\":\"EGLD\",\"EOS\":\"EOS\",\"ETC\":\"ETC\",\"ETH\":\"ETH\",\"FIL\":\"FIL\",\"FRONT\":\"FRONT\",\"FTM\":\"FTM\",\"GRS\":\"GRS\",\"HBAR\":\"HBAR\",\"IOTX\":\"IOTX\",\"LINK\":\"LINK\",\"LTC\":\"LTC\",\"MANA\":\"MANA\",\"MATIC\":\"MATIC\",\"NEO\":\"NEO\",\"OM\":\"OM\",\"ONE\":\"ONE\",\"PAX\":\"PAX\",\"QTUM\":\"QTUM\",\"STRAX\":\"STRAX\",\"SXP\":\"SXP\",\"TRX\":\"TRX\",\"TUSD\":\"TUSD\",\"UNI\":\"UNI\",\"USDC\":\"USDC\",\"USDT\":\"USDT\",\"WRX\":\"WRX\",\"XLM\":\"XLM\",\"XMR\":\"XMR\",\"XRP\":\"XRP\",\"XTZ\":\"XTZ\",\"XVS\":\"XVS\",\"ZEC\":\"ZEC\",\"ZIL\":\"ZIL\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":\"0.000027\",\"min_limit\":\"1\",\"max_limit\":\"5\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2023-04-02 19:36:14', '2025-04-01 20:25:48'),
(39, 'cinetpay', 'CinetPay', 40, 'gateway/8ntOYEeg7XhiHLgGjxvVi93X6vsRCl.webp', 'local', 0, '{\"apiKey\":\"XXXXXXXXXXXXXXXXXXX\",\"site_id\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"XOF\":\"XOF\",\"XAF\":\"XAF\",\"CDF\":\"CDF\",\"GNF\":\"GNF\",\"USD\":\"USD\"}}', 'NULL', '[\"XOF\"]', '[{\"name\":\"XOF\",\"currency_symbol\":\"XOF\",\"conversion_rate\":\"5.45\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2023-04-02 19:36:14', '2025-04-01 20:25:48'),
(40, 'bkash', 'BKash', 3, 'gateway/hg54wAOO67AP6o8p8pTIn8ethI3bSk.webp', 'local', 0, '{\"username\":\"XXXXXXXXXXXXXX\",\"password\":\"XXXXXXXXXXXX\",\"app_key\":\"XXXXXXXXXXXXXXXXXXX\",\"app_secret\":\"XXXXXXXXXXXXX\"}', '{\"0\":{\"BDT\":\"BDT\"}}', NULL, '[\"BDT\"]', '[{\"name\":\"BDT\",\"currency_symbol\":\"BDT\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\".5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-12 09:28:30'),
(41, 'nagad', 'Nagad', 5, 'gateway/vERfObcEUEVDJsmdKGtcEWjBjjAgHZ.webp', 'local', 0, '{\"merchant_id\":\"683002007104225\",\"merchant_phone\":\"01670229009\",\"public_key\":\"XXXXXXXXXXXXXXXXXXX\",\"private_key\":\"XXXXXXXXXXXXXXXXXXXX\"}', '{\"0\":{\"BDT\":\"BDT\"}}', NULL, '[\"BDT\"]', '[{\"name\":\"BDT\",\"currency_symbol\":\"BDT\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\".5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-12 09:28:38'),
(42, 'toyyibpay', 'Toyyibpay', 14, 'gateway/JFmngidbrQlSsOBLPaoMElU7u0SUOY.webp', 'local', 0, '{\"category_code\":\"XXXXXXXXXXXXX\",\"secret_key\":\"XXXXXXXXXXXXXXXXXX\"}', '{\"0\":{\"MYR\":\"MYR\"}}', NULL, '[\"MYR\"]', '[{\"name\":\"MYR\",\"currency_symbol\":\"MYR\",\"conversion_rate\":\"4.27\",\"min_limit\":\"1\",\"max_limit\":\"1000000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(43, 'eCitizen', 'eCitizen', 15, 'gateway/yzcQw8wKrLvu3dKxhg7t3f4J6pzErb.webp', 'local', 0, '{\"api_client_ID\":\"XXXXXXXXXX\",\"service_ID\":\"XXXXXXXXXXXX\",\"key\":\"XXXXXXXXXXXXXXXX\",\"secret\":\"XXXXXXXXXXXXXXX\"}', '{\"0\":{\"KES\":\"KES\"}}', NULL, '[\"KES\"]', '[{\"name\":\"KES\",\"currency_symbol\":\"KES\",\"conversion_rate\":\"129.04\",\"min_limit\":\"1\",\"max_limit\":\"1000000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(44, 'shkeeper', 'SHKeeper', 13, 'gateway/yzcQw8wKrLvu3dKxhg7t3f4J6pzENg.webp', 'local', 0, '{\"api_key\":\"XXXXXXXXXXXXXXXXXXX\",\"hosted_url\":\"https:\\/\\/demo.shkeeper.io\"}', '{\"0\":{\"BTC\":\"BTC\",\"LTC\":\"LTC\",\"DOGE\":\"DOGE\",\"XMR\":\"XMR\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH-USDT\":\"ETH-USDT\",\"ETH-USDC\":\"ETH-USDC\",\"TRX\":\"TRX\",\"USDT\":\"USDT\",\"USDC\":\"USDC\",\"AVAX\":\"AVAX\",\"AVALANCHE-USDT\":\"AVALANCHE-USDT\",\"AVALANCHE-USDC\":\"AVALANCHE-USDC\",\"BNB\":\"BNB\",\"BNB-USDT\":\"BNB-USDT\",\"BNB-USDC\":\"BNB-USDC\",\"MATIC\":\"MATIC\",\"POLYGON-USDT\":\"POLYGON-USDT\",\"POLYGON-USDC\":\"POLYGON-USDC\"}}', NULL, '[\"BTC\",\"LTC\",\"ETH\",\"USDT\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":\"0.0084\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"LTC\",\"currency_symbol\":\"LTC\",\"conversion_rate\":\"0.0084\",\"min_limit\":\"0.1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"ETH\",\"currency_symbol\":\"ETH\",\"conversion_rate\":\"0.0084\",\"min_limit\":\"0.1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"1\"},{\"name\":\"USDT\",\"currency_symbol\":\"USDT\",\"conversion_rate\":\"0.0084\",\"min_limit\":\"0.1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 0, 'test', NULL, NULL, '2020-09-10 03:05:02', '2025-04-01 20:25:48'),
(45, 'uddoktapay', 'Uddoktapay', 13, 'gateway/yzcQw8wKrLvu3dKxhg7t3f4J6pzE.webp', 'local', 0, '{\"api_key\":\"982d381360a69d419689740d9f2e26ce36fb7\",\"base_url\":\"https://sandbox.uddoktapay.com/\"}', '{\"0\":{\"BDT\":\"BDT\"}}', NULL, '[\"BDT\"]', '[{\"name\":\"BDT\",\"currency_symbol\":\"BDT\",\"conversion_rate\":\"120\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 02:05:02', '2025-01-08 06:26:49'),
(1000, 'bank-transfer', 'DANA', 1, 'gateway/AcBvhbQ3OOsVzxrMFnCyil6Rx4bsxc.webp', 'local', 1, '{\"AccountNumber\":{\"field_name\":\"AccountNumber\",\"field_label\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"NamaPengirim\":{\"field_name\":\"NamaPengirim\",\"field_label\":\"Nama Pengirim\",\"type\":\"text\",\"validation\":\"required\"},\"BuktiTransfer\":{\"field_name\":\"BuktiTransfer\",\"field_label\":\"Bukti Transfer\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, NULL, '[\"IDR\"]', '[{\"currency\":\"IDR\",\"conversion_rate\":\"1\",\"min_limit\":\"10000\",\"max_limit\":\"99999999999999999\",\"percentage_charge\":\"11\",\"fixed_charge\":\"10000\"}]', 'Aplikasi DANA adalah salah satu dompet digital di Indonesia.', 1, 0, 'live', NULL, '<p><b>Instruksi Pembayaran:</b></p><p>Silakan lakukan transfer saldo DANA ke rincian berikut:</p><ul><li><p><b>Nomor DANA:</b> 083807914090</p></li><li><p><b>Atas Nama:</b> Gamify Toko Top Up Aseli ITI</p></li></ul><p><b>Cara Melakukan Pembayaran:</b></p><ol><li><p>Buka aplikasi DANA Anda.</p></li><li><p>Pilih menu <b>\"Kirim\" (Send)</b> -&gt; <b>\"Kirim ke Teman\"</b>.</p></li><li><p>Masukkan nomor tujuan di atas.</p></li><li><p>Masukkan nominal pembayaran sesuai dengan total tagihan.</p></li><li><p>Lakukan konfirmasi pembayaran.</p></li></ol><p><b>PENTING:</b> Setelah transfer berhasil, harap <b>screenshot bukti pembayaran</b> dan lampirkan pada formulir konfirmasi atau kirimkan kepada Admin.</p>', NULL, '2025-12-05 16:42:03'),
(1008, 'bca', 'BCA', 1, 'gateway/ouQ1kY5Yf2pp9vu5GNixeZLJIb0uhK.webp', 'local', 1, '{\"NomorRekening\":{\"field_name\":\"NomorRekening\",\"field_label\":\"Nomor Rekening\",\"type\":\"text\",\"validation\":\"required\"},\"NamaPengirim\":{\"field_name\":\"NamaPengirim\",\"field_label\":\"Nama Pengirim\",\"type\":\"text\",\"validation\":\"required\"},\"BuktiPembayaran\":{\"field_name\":\"BuktiPembayaran\",\"field_label\":\"Bukti Pembayaran\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, NULL, '[\"IDR\"]', '[{\"currency\":\"IDR\",\"conversion_rate\":\"1\",\"min_limit\":\"10000\",\"max_limit\":\"999999999999999999999999\",\"percentage_charge\":\"11\",\"fixed_charge\":\"1000\"}]', 'Salah satu bank swasta terbesar di Indonesia yang menyediakan berbagai layanan perbankan', 1, 0, 'live', 1, '<p><b>Instruksi Pembayaran via Bank BCA:</b></p><p>Silakan lakukan transfer pelunasan ke rekening berikut:</p><ul><li><p><b>Bank:</b> BCA (Bank Central Asia)</p></li><li><p><b>Nomor Rekening:</b> <b>12890384928</b></p></li><li><p><b>Atas Nama:</b> <b>Gamify Toko Top Up </b></p></li></ul><p><b>Catatan Penting:</b></p><ol><li><p>Mohon transfer sesuai dengan <b>total nominal</b> yang tertera pada tagihan.</p></li><li><p>Simpan bukti transfer/struk Anda.</p></li><li><p><b>Upload bukti transfer</b> untuk mempercepat proses verifikasi pembayaran.</p></li></ol>', '2025-12-05 08:08:43', '2025-12-05 16:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `in_app_notifications`
--

CREATE TABLE `in_app_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `in_app_notificationable_id` int(11) DEFAULT NULL,
  `in_app_notificationable_type` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(125, 'default', '{\"uuid\":\"695bd867-d72f-490e-aac0-46709de226e4\",\"displayName\":\"App\\\\Jobs\\\\UserNotificationTempletes\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserNotificationTempletes\",\"command\":\"O:34:\\\"App\\\\Jobs\\\\UserNotificationTempletes\\\":1:{s:42:\\\"\\u0000App\\\\Jobs\\\\UserNotificationTempletes\\u0000userID\\\";i:1;}\"}}', 0, NULL, 1743315611, 1743315611),
(126, 'default', '{\"uuid\":\"6514c026-0904-490f-bd44-ceaf0e1e640b\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:27:\\\"2a09:bac5:3a03:2723::3e6:58\\\";s:6:\\\"remark\\\";s:26:\\\"Update profile information\\\";}\"}}', 0, NULL, 1743315631, 1743315631),
(127, 'default', '{\"uuid\":\"6affba7e-097d-4181-ad2f-60224fc4c9aa\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:27:\\\"2a09:bac5:3a03:2723::3e6:58\\\";s:6:\\\"remark\\\";s:20:\\\"Update profile image\\\";}\"}}', 0, NULL, 1743315643, 1743315643),
(128, 'default', '{\"uuid\":\"be38ec68-29ac-4b57-8188-787e930582a6\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:27:\\\"2a09:bac5:3a03:2723::3e6:58\\\";s:6:\\\"remark\\\";s:20:\\\"Update profile image\\\";}\"}}', 0, NULL, 1743315649, 1743315649),
(129, 'default', '{\"uuid\":\"c8184793-ec75-4b32-9575-3d2dec5d1d29\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:27:\\\"2a09:bac5:3a03:2723::3e6:58\\\";s:6:\\\"remark\\\";s:26:\\\"Update profile information\\\";}\"}}', 0, NULL, 1743315654, 1743315654),
(130, 'default', '{\"uuid\":\"3d30709f-1ee2-4e90-a9a8-a361e6aa46f0\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1743537470, 1743537470),
(131, 'default', '{\"uuid\":\"25c82699-f181-4160-8ed6-9c08ee417b40\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1743537874, 1743537874),
(132, 'default', '{\"uuid\":\"c68fb7fd-c064-47d3-94a3-bcd55a275269\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:14:\\\"114.124.205.20\\\";s:6:\\\"remark\\\";s:20:\\\"Update profile image\\\";}\"}}', 0, NULL, 1743538121, 1743538121),
(133, 'default', '{\"uuid\":\"26d001a1-f54d-4535-8e15-260fb203b7ae\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:14:\\\"114.124.205.20\\\";s:6:\\\"remark\\\";s:20:\\\"Update profile image\\\";}\"}}', 0, NULL, 1743538139, 1743538139),
(134, 'default', '{\"uuid\":\"a93a526d-9de0-4888-8f7d-a31327b7dcac\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1743538496, 1743538496),
(135, 'default', '{\"uuid\":\"2e428302-7d0f-410b-bcd6-40cdf05ef338\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1743538558, 1743538558),
(136, 'default', '{\"uuid\":\"7b198600-73f0-4111-bf6b-41d0b8af5de3\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449339, 1744449339),
(137, 'default', '{\"uuid\":\"5b3a2b80-30ab-425b-b5a3-6a31cd8b5b0b\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449434, 1744449434),
(138, 'default', '{\"uuid\":\"d47f2edb-5998-4722-af68-855d30abc42d\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449457, 1744449457),
(139, 'default', '{\"uuid\":\"6b832c6b-9335-4693-8c61-ab7a7ffb7fcb\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449469, 1744449469),
(140, 'default', '{\"uuid\":\"a1322470-62ea-470f-8e08-3265a58fb570\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449499, 1744449499),
(141, 'default', '{\"uuid\":\"c75a39db-e5dd-4fe6-87d6-a8fb1419b054\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449688, 1744449688),
(142, 'default', '{\"uuid\":\"f6310911-7efd-492a-b508-ff92a39d1fbf\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449793, 1744449793),
(143, 'default', '{\"uuid\":\"987fdffe-c70e-4151-8621-c17e2c2c94b2\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449879, 1744449879),
(144, 'default', '{\"uuid\":\"38a418e6-8451-4043-9f8e-436db5b6abd4\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449892, 1744449892),
(145, 'default', '{\"uuid\":\"aad8c921-8e1e-4a7c-b094-63d619abd1ab\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449914, 1744449914),
(146, 'default', '{\"uuid\":\"10cf0c6c-10a0-4bd2-974f-29e19d2209d1\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449942, 1744449942),
(147, 'default', '{\"uuid\":\"a1fcb80d-ee80-4d9d-9ea4-24e20f4fedb6\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:2;s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1744449965, 1744449965),
(148, 'default', '{\"uuid\":\"60e5b447-be14-4b42-969a-820990d8c3e8\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:25:\\\"2a09:bac5:3a09:88c::da:fc\\\";s:6:\\\"remark\\\";s:166:\\\"Sent manual payment request by Bank Transfer <h5>Trx: D163070308343<\\/h5><a href=\\\"https:\\/\\/toko-topup.zyrex.win\\/admin\\/payment\\/log\\\">Click here<\\/a> to see payment details\\\";}\"}}', 0, NULL, 1744451933, 1744451933),
(149, 'default', '{\"uuid\":\"c59245fa-7b88-447e-9c4d-8debb95c54c6\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:25:\\\"2a09:bac5:3a09:88c::da:fc\\\";s:6:\\\"remark\\\";s:43:\\\"Payment For Direct Top Up Via Bank Transfer\\\";}\"}}', 0, NULL, 1744452002, 1744452002),
(150, 'default', '{\"uuid\":\"50040bee-6e0a-495b-ab73-b73189f864f0\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:25:\\\"2a09:bac5:3a09:88c::da:fc\\\";s:6:\\\"remark\\\";s:17:\\\"Generated API key\\\";}\"}}', 0, NULL, 1744452023, 1744452023),
(151, 'default', '{\"uuid\":\"15be8b7a-5d24-49e3-be58-fe50a2772057\",\"displayName\":\"App\\\\Jobs\\\\UserNotificationTempletes\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserNotificationTempletes\",\"command\":\"O:34:\\\"App\\\\Jobs\\\\UserNotificationTempletes\\\":1:{s:42:\\\"\\u0000App\\\\Jobs\\\\UserNotificationTempletes\\u0000userID\\\";i:2;}\"}}', 0, NULL, 1744773728, 1744773728),
(152, 'default', '{\"uuid\":\"195f0bf3-aee7-429a-958f-7af5b544b40b\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748420877, 1748420877),
(153, 'default', '{\"uuid\":\"4b715cfd-1abd-4f7d-890c-8a9d2f0fee1c\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748420881, 1748420881),
(154, 'default', '{\"uuid\":\"1550a263-2921-4741-8fd6-f18220272265\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748421565, 1748421565),
(155, 'default', '{\"uuid\":\"e401bf66-a2e0-41da-86db-c4624783f06e\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748421609, 1748421609),
(156, 'default', '{\"uuid\":\"40c82240-f521-4a2f-9c6e-adbb3f85ea0f\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748421759, 1748421759),
(157, 'default', '{\"uuid\":\"8c6c9c10-655f-4e40-a8e9-0f5d64c824cb\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748421769, 1748421769),
(158, 'default', '{\"uuid\":\"0705e3f1-1d02-422f-b59d-61e7a46d21ba\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748421797, 1748421797),
(159, 'default', '{\"uuid\":\"c98a0634-390f-4722-b639-656a5fb6f6b1\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748421823, 1748421823),
(160, 'default', '{\"uuid\":\"1b969430-d5cd-4937-b783-2c19074628a1\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748421845, 1748421845),
(161, 'default', '{\"uuid\":\"4c55f2aa-aa7d-43b9-8db7-d9e7b16e48a4\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"5\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748422067, 1748422067),
(162, 'default', '{\"uuid\":\"357385ee-f624-4a16-a1f3-a6348fafcb51\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"5\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748422122, 1748422122),
(163, 'default', '{\"uuid\":\"60f3722f-3b01-487e-aaae-7fb6d6905959\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"5\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748422159, 1748422159),
(164, 'default', '{\"uuid\":\"1319befc-4e2c-4d49-8f2f-a965099dd59b\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"5\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748422177, 1748422177),
(165, 'default', '{\"uuid\":\"1fd20b77-bf98-4881-bf17-587b34c18755\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"5\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748422199, 1748422199),
(166, 'default', '{\"uuid\":\"2dafeb8a-81a5-4130-8f9e-b82fb872110c\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"5\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748422212, 1748422212),
(167, 'default', '{\"uuid\":\"5acfaacf-5767-40f9-98b1-d1ac9ea3052f\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"5\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748422223, 1748422223),
(168, 'default', '{\"uuid\":\"f58c9587-7230-42b2-b564-e73d300927d8\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"5\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1748422307, 1748422307),
(169, 'default', '{\"uuid\":\"fc3b4fc6-bc8a-4df6-8467-69341b280b32\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:26:\\\"2a09:bac5:3a23:15f::23:46f\\\";s:6:\\\"remark\\\";s:166:\\\"Sent manual payment request by Bank Transfer <h5>Trx: D163070308344<\\/h5><a href=\\\"https:\\/\\/toko-topup.zyrex.win\\/admin\\/payment\\/log\\\">Click here<\\/a> to see payment details\\\";}\"}}', 0, NULL, 1748422660, 1748422660),
(170, 'default', '{\"uuid\":\"3816d150-88ba-4331-9db6-150d1d44f465\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";s:1:\\\"1\\\";s:2:\\\"ip\\\";s:26:\\\"2a09:bac5:3a23:15f::23:46f\\\";s:6:\\\"remark\\\";s:43:\\\"Payment For Direct Top Up Via Bank Transfer\\\";}\"}}', 0, NULL, 1748422777, 1748422777),
(171, 'default', '{\"uuid\":\"dd18d504-6239-4916-95f4-56d4dd233c5c\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"8\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1763911763, 1763911763),
(172, 'default', '{\"uuid\":\"bd0a0e5b-d345-45a5-89a8-e744a434777b\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:8;s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1763911773, 1763911773),
(173, 'default', '{\"uuid\":\"ec89bb8a-c738-4d97-89c3-2689a90a09a8\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";i:8;s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1763911828, 1763911828),
(174, 'default', '{\"uuid\":\"0dad614e-38e5-4f01-827d-eedb981af9ae\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"7\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1763950428, 1763950428),
(175, 'default', '{\"uuid\":\"f73989da-430b-47de-a506-71604c0ec968\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"7\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1763950578, 1763950578),
(176, 'default', '{\"uuid\":\"591f8864-3a19-4eca-8d7f-9405f4da63a0\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"7\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1763950626, 1763950626),
(177, 'default', '{\"uuid\":\"e040cb27-488d-4702-8cea-cf44440f796d\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:14:\\\"103.224.124.62\\\";s:6:\\\"remark\\\";s:166:\\\"Sent manual payment request by Bank Transfer <h5>Trx: D775920401855<\\/h5><a href=\\\"https:\\/\\/toko-topup.zyrex.win\\/admin\\/payment\\/log\\\">Click here<\\/a> to see payment details\\\";}\"}}', 0, NULL, 1763979537, 1763979537),
(178, 'default', '{\"uuid\":\"37d157b5-9e9d-406f-ba2d-17e5695a0090\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";s:1:\\\"1\\\";s:2:\\\"ip\\\";s:14:\\\"103.224.124.62\\\";s:6:\\\"remark\\\";s:43:\\\"Payment For Direct Top Up Via Bank Transfer\\\";}\"}}', 0, NULL, 1763979622, 1763979622),
(179, 'default', '{\"uuid\":\"5064d60b-b4de-485f-8a55-76f5e912a92d\",\"displayName\":\"App\\\\Jobs\\\\UserNotificationTempletes\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserNotificationTempletes\",\"command\":\"O:34:\\\"App\\\\Jobs\\\\UserNotificationTempletes\\\":1:{s:42:\\\"\\u0000App\\\\Jobs\\\\UserNotificationTempletes\\u0000userID\\\";i:3;}\"}}', 0, NULL, 1764399452, 1764399452),
(180, 'default', '{\"uuid\":\"257723cc-31b4-4de4-942e-a5a3bfc5a4bf\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:3;s:2:\\\"ip\\\";s:13:\\\"103.3.222.135\\\";s:6:\\\"remark\\\";s:166:\\\"Sent manual payment request by Bank Transfer <h5>Trx: D775920401856<\\/h5><a href=\\\"https:\\/\\/toko-topup.zyrex.win\\/admin\\/payment\\/log\\\">Click here<\\/a> to see payment details\\\";}\"}}', 0, NULL, 1764399817, 1764399817),
(181, 'default', '{\"uuid\":\"bef27393-1972-458a-a024-f54bbcc5a3d3\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"4\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764940260, 1764940260),
(182, 'default', '{\"uuid\":\"7cb6401c-716d-4936-9094-43684188f1fd\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764940895, 1764940895),
(183, 'default', '{\"uuid\":\"72cbc5da-2901-4ba0-9874-89e77c3426e7\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941041, 1764941041),
(184, 'default', '{\"uuid\":\"2aa0638b-a57a-49cb-8174-9dfef8b5ae54\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941063, 1764941063),
(185, 'default', '{\"uuid\":\"46e0fcac-7b92-4862-b25e-b774183de7c8\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941085, 1764941085),
(186, 'default', '{\"uuid\":\"0696dc22-aa9a-46db-b2b5-d23849f98c6d\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941126, 1764941126),
(187, 'default', '{\"uuid\":\"30e0c288-8a01-4fb0-a8a5-94fcf6258b4c\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941150, 1764941150),
(188, 'default', '{\"uuid\":\"ad625398-de7a-48a9-86e3-f628a49d757d\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941173, 1764941173),
(189, 'default', '{\"uuid\":\"7a0c98f2-e909-4776-b842-617115eef9aa\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941194, 1764941194),
(190, 'default', '{\"uuid\":\"ea9cdd2e-23e9-4863-864b-e2ba5142645f\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941214, 1764941214),
(191, 'default', '{\"uuid\":\"f736cce1-90af-44d7-880a-ee8c905fe521\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941241, 1764941241),
(192, 'default', '{\"uuid\":\"005f30f4-f5e6-4723-ba0b-d7444243ce63\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941263, 1764941263),
(193, 'default', '{\"uuid\":\"2ecffeed-e080-408b-956a-e1ce06196d39\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941292, 1764941292),
(194, 'default', '{\"uuid\":\"ce2562f5-4c5a-4051-805b-7a384abdb4fc\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941319, 1764941319),
(195, 'default', '{\"uuid\":\"5ab25ba0-6971-4908-a19f-c51a0038ed9a\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"4\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941347, 1764941347),
(196, 'default', '{\"uuid\":\"65daf333-109c-4227-a33f-2384006b9f7f\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"13\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941497, 1764941497),
(197, 'default', '{\"uuid\":\"29f9a9a5-c9aa-4cb9-9ae5-2e8f32773d7f\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941522, 1764941522),
(198, 'default', '{\"uuid\":\"26e99032-44d1-400f-83cf-595d2af5334d\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941592, 1764941592),
(199, 'default', '{\"uuid\":\"273842d9-a478-446d-a98c-a9973aaa9f4d\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941610, 1764941610),
(200, 'default', '{\"uuid\":\"9421abef-6be6-4b16-b6d2-5062ccdcd64b\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941626, 1764941626),
(201, 'default', '{\"uuid\":\"343aa7ed-9a0b-4aea-8c0e-e6ffca9d6dde\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941645, 1764941645),
(202, 'default', '{\"uuid\":\"d1b73475-ccf3-42a0-9533-6dc031027456\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941662, 1764941662),
(203, 'default', '{\"uuid\":\"4ae51791-f01d-4fa6-b40c-aaba548099a0\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941678, 1764941678),
(204, 'default', '{\"uuid\":\"f6651cc8-fe04-4ec9-ade2-a19277d37651\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941695, 1764941695),
(205, 'default', '{\"uuid\":\"d665d182-68ef-4c2e-bfd2-1fbb1a4a0770\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941711, 1764941711),
(206, 'default', '{\"uuid\":\"70eb19a2-0ccf-4258-9bb5-ef73d20786f5\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941746, 1764941746),
(207, 'default', '{\"uuid\":\"e37c9d1f-2b2c-4aa8-821f-a5a8f7311bda\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"11\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764941761, 1764941761),
(208, 'default', '{\"uuid\":\"c5339847-112e-4335-94cd-a9fed80c40ee\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764942011, 1764942011),
(209, 'default', '{\"uuid\":\"96858c19-e3fb-4e56-90ed-109991b6add5\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764942040, 1764942040),
(210, 'default', '{\"uuid\":\"42932ac0-4d46-4563-bf15-730e1b560724\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764942191, 1764942191),
(211, 'default', '{\"uuid\":\"119ffd40-4a9f-42df-8967-e6bd29226f15\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:1:\\\"2\\\";s:4:\\\"type\\\";s:6:\\\"top_up\\\";}\"}}', 0, NULL, 1764942308, 1764942308),
(212, 'default', '{\"uuid\":\"52f78740-5244-42be-b999-7cf0e09827ce\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:14:\\\"103.224.124.62\\\";s:6:\\\"remark\\\";s:17:\\\"Generated API key\\\";}\"}}', 0, NULL, 1764948942, 1764948942);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(213, 'default', '{\"uuid\":\"90198c03-0fdb-4a55-a6c6-a4f441e96c04\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";s:1:\\\"1\\\";s:2:\\\"ip\\\";s:14:\\\"103.224.124.62\\\";s:6:\\\"remark\\\";s:36:\\\"Payment For Direct Top Up Via Wallet\\\";}\"}}', 0, NULL, 1764951602, 1764951602),
(214, 'default', '{\"uuid\":\"db1a385d-be82-4510-88bc-6995482fc2f6\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952224, 1764952224),
(215, 'default', '{\"uuid\":\"93596e55-0cf5-4a2b-84da-357dd1976ca5\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952246, 1764952246),
(216, 'default', '{\"uuid\":\"d1f37eaa-c49a-4aee-8a6b-8a0731246f22\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952265, 1764952265),
(217, 'default', '{\"uuid\":\"009a4c67-de2a-4771-91c3-9e88b6e61002\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952281, 1764952281),
(218, 'default', '{\"uuid\":\"c1806472-dcb7-471b-bd14-e20b0c107fc9\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952293, 1764952293),
(219, 'default', '{\"uuid\":\"ab1b773b-2370-47a9-89f8-c3f184df823e\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952304, 1764952304),
(220, 'default', '{\"uuid\":\"d8f042d1-ab2c-4a34-9681-9e609c5267c3\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952316, 1764952316),
(221, 'default', '{\"uuid\":\"a43782d3-7241-49a6-bc25-b31df25b836b\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952320, 1764952320),
(222, 'default', '{\"uuid\":\"c8a85401-0e1a-4c7a-8ef8-c3bd8ec32b3b\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952324, 1764952324),
(223, 'default', '{\"uuid\":\"84ffb091-cf5e-4f73-88d1-da71297a1828\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952340, 1764952340),
(224, 'default', '{\"uuid\":\"8ac8cff5-c8e0-422f-8c0f-df6729f9a496\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1764952508, 1764952508),
(225, 'default', '{\"uuid\":\"5f43ce50-a60b-4a53-94b6-74af901bebff\",\"displayName\":\"App\\\\Jobs\\\\CodeSendBuyer\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CodeSendBuyer\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CodeSendBuyer\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:2:{i:0;s:12:\\\"orderDetails\\\";i:1;s:23:\\\"orderDetails.detailable\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1765121925, 1765121925),
(226, 'default', '{\"uuid\":\"b9b85522-0289-4b84-9ada-7667352b3177\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";s:1:\\\"1\\\";s:2:\\\"ip\\\";s:14:\\\"103.224.124.62\\\";s:6:\\\"remark\\\";s:27:\\\"Payment For Card Via Wallet\\\";}\"}}', 0, NULL, 1765121925, 1765121925),
(227, 'default', '{\"uuid\":\"ab200902-75f2-4f6c-9bfb-db4a54d0d0fd\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";i:1;s:2:\\\"ip\\\";s:14:\\\"103.224.124.62\\\";s:6:\\\"remark\\\";s:153:\\\"Sent manual payment request by DANA <h5>Trx: D775920401864<\\/h5><a href=\\\"https:\\/\\/gamify.zyrex.win\\/admin\\/payment\\/log\\\">Click here<\\/a> to see payment details\\\";}\"}}', 0, NULL, 1765122112, 1765122112),
(228, 'default', '{\"uuid\":\"8470442b-de5b-4813-bb8e-eaf3a3520d24\",\"displayName\":\"App\\\\Jobs\\\\CodeSendBuyer\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CodeSendBuyer\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CodeSendBuyer\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:3:{i:0;s:12:\\\"orderDetails\\\";i:1;s:23:\\\"orderDetails.detailable\\\";i:2;s:7:\\\"gateway\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1765122165, 1765122165),
(229, 'default', '{\"uuid\":\"f40eed7a-d560-4f7f-bedf-a61205fa9a18\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";s:1:\\\"1\\\";s:2:\\\"ip\\\";s:14:\\\"103.224.124.62\\\";s:6:\\\"remark\\\";s:25:\\\"Payment For Card Via DANA\\\";}\"}}', 0, NULL, 1765122165, 1765122165),
(230, 'default', '{\"uuid\":\"86293823-89ef-4a39-a403-0537376a329b\",\"displayName\":\"App\\\\Jobs\\\\CodeSendBuyer\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\CodeSendBuyer\",\"command\":\"O:22:\\\"App\\\\Jobs\\\\CodeSendBuyer\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:2:{i:0;s:12:\\\"orderDetails\\\";i:1;s:23:\\\"orderDetails.detailable\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1765122710, 1765122710),
(231, 'default', '{\"uuid\":\"08d38a71-f928-43e9-8f16-6e2284542089\",\"displayName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserTrackingJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\UserTrackingJob\\\":3:{s:6:\\\"userId\\\";s:1:\\\"1\\\";s:2:\\\"ip\\\";s:14:\\\"103.224.124.62\\\";s:6:\\\"remark\\\";s:27:\\\"Payment For Card Via Wallet\\\";}\"}}', 0, NULL, 1765122710, 1765122710),
(232, 'default', '{\"uuid\":\"2eb5cb50-8dc4-42a0-b9a8-2257e3e4e51c\",\"displayName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UpdateChildCountJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\UpdateChildCountJob\\\":2:{s:10:\\\"categoryId\\\";s:2:\\\"12\\\";s:4:\\\"type\\\";s:4:\\\"card\\\";}\"}}', 0, NULL, 1765122746, 1765122746);

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `input_form` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1 => Active, 0 => Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `flag_driver` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 => Inactive, 1 => Active',
  `rtl` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => Inactive, 1 => Active',
  `default_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `flag_driver`, `status`, `rtl`, `default_status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'language/3kEE1NVudjAzx6UAhG0xG9gS8IjJK3.webp', 'local', 1, 0, 1, '2023-06-16 22:35:53', '2025-12-05 05:23:42'),
(4, 'Indonesia', 'id', 'language/fyn0OjqZNli4xDELWigqxNXqB9nZeu.webp', 'local', 0, 0, 0, '2025-12-05 05:24:21', '2025-12-05 13:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_modes`
--

CREATE TABLE `maintenance_modes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_driver` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_modes`
--

INSERT INTO `maintenance_modes` (`id`, `heading`, `description`, `image`, `image_driver`, `created_at`, `updated_at`) VALUES
(1, 'The website under maintenance!', '<p>We are currently undergoing scheduled maintenance to improve our services and enhance your user experience. During this time, our website/system will be temporarily unavailable.\r\n</p><p><br></p><p>\r\nWe apologize for any inconvenience this may cause and appreciate your patience. Please rest assured that we are working diligently to complete the maintenance as quickly as possible.</p>', 'maintenanceMode/3jXAnm42OZuYy3kVDcHKUjW3gyiG8eSo96rlgg19.png', 'local', '2023-10-03 22:44:32', '2025-03-29 23:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `manage_menus`
--

CREATE TABLE `manage_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_section` varchar(255) NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `menu_items` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manage_menus`
--

INSERT INTO `manage_menus` (`id`, `menu_section`, `theme`, `menu_items`, `created_at`, `updated_at`) VALUES
(3, 'header', 'light', '{\"useful_link\":[\"blog\"],\"support_link\":[\"privacy &amp; policy\",\"terms &amp; conditions\"]}', '2023-10-16 06:54:10', '2025-12-05 13:51:47'),
(4, 'footer', 'light', '{\"useful_link\":[\"blog\"],\"support_link\":[\"privacy &amp; policy\",\"terms &amp; conditions\"]}', '2023-10-16 06:54:10', '2024-12-18 11:28:56'),
(5, 'header', 'dark', '[\"home\",\"Top Up\",\"Card\",\"developer\"]', '2023-10-16 06:54:10', '2025-12-05 13:48:33'),
(6, 'footer', 'dark', '{\"useful_link\":[\"blog\",\"contact\"],\"support_link\":[\"privacy and policy\",\"terms and conditions\"]}', '2023-10-16 06:54:10', '2024-12-14 05:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `manual_sms_configs`
--

CREATE TABLE `manual_sms_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action_method` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `header_data` text DEFAULT NULL,
  `param_data` text DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manual_sms_configs`
--

INSERT INTO `manual_sms_configs` (`id`, `action_method`, `action_url`, `header_data`, `param_data`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'GET', 'https://rest.nexmo.com/sms/json', NULL, NULL, NULL, '2024-08-08 11:12:56', '2025-03-03 08:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_06_07_064911_create_admins_table', 1),
(7, '2023_06_10_061241_create_basic_controls_table', 1),
(8, '2023_06_10_123329_create_file_storages_table', 1),
(9, '2023_06_17_085447_create_languages_table', 1),
(10, '2023_06_20_080624_create_support_tickets_table', 1),
(11, '2023_06_20_080731_create_support_ticket_messages_table', 1),
(12, '2023_06_20_080833_create_support_ticket_attachments_table', 1),
(13, '2023_06_20_212143_create_fire_base_tokens_table', 1),
(14, '2023_06_21_124322_create_in_app_notifications_table', 1),
(15, '2023_06_22_084256_create_gateways_table', 1),
(16, '2023_07_15_162549_create_kycs_table', 1),
(17, '2023_07_18_084411_create_pages_table', 1),
(18, '2023_07_22_130913_create_manage_menus_table', 1),
(19, '2023_08_20_140757_create_contents_table', 1),
(20, '2023_08_20_140808_create_content_details_table', 1),
(21, '2023_09_07_151706_create_user_logins_table', 1),
(22, '2023_09_09_105217_create_transactions_table', 1),
(23, '2023_09_19_131540_create_deposits_table', 1),
(24, '2023_10_02_162152_create_page_details_table', 1),
(25, '2023_10_04_102054_create_maintenance_modes_table', 1),
(26, '2023_10_05_124445_create_notify_templates_table', 1),
(27, '2023_10_19_140559_create_manual_sms_configs_table', 1),
(28, '2023_10_19_161530_create_jobs_table', 1),
(29, '2023_12_10_085818_create_blog_categories_table', 1),
(30, '2023_12_10_094858_create_blogs_table', 1),
(31, '2023_12_10_094925_create_blog_details_table', 1),
(32, '2024_06_02_111050_create_user_kycs_table', 1),
(34, '2024_06_26_153713_create_categories_table', 2),
(35, '2024_06_27_105524_create_currencies_table', 3),
(36, '2024_06_29_161429_create_top_ups_table', 4),
(37, '2024_07_02_102744_create_top_up_services_table', 5),
(38, '2024_07_06_192044_create_cards_table', 6),
(39, '2024_07_07_114057_create_card_services_table', 7),
(40, '2024_07_07_133317_create_codes_table', 8),
(41, '2024_07_08_122749_create_games_table', 9),
(42, '2024_07_08_162131_create_game_service_maps_table', 10),
(43, '2024_07_29_161739_create_banner_settings_table', 11),
(44, '2024_08_07_110557_create_orders_table', 12),
(45, '2024_08_07_120923_create_order_details_table', 13),
(46, '2024_08_22_182852_create_reviews_table', 14),
(47, '2024_09_03_103145_create_collections_table', 15),
(48, '2024_11_11_113154_create_campaigns_table', 16),
(49, '2023_09_20_093121_create_payouts_table', 17),
(50, '2024_04_30_091056_create_notification_settings_table', 18),
(51, '2024_08_28_110406_create_payout_methods_table', 19),
(52, '2024_12_23_183941_create_notification_settings_table', 20),
(53, '2024_12_26_111104_create_sell_posts_table', 21),
(54, '2024_12_26_111232_create_sell_post_categories_table', 22),
(55, '2024_12_26_111315_create_sell_post_category_details_table', 23),
(56, '2024_12_26_111417_create_sell_post_chats_table', 24),
(57, '2024_12_26_111549_create_sell_post_offers_table', 25),
(58, '2024_12_26_111956_create_activity_logs_table', 26),
(59, '2025_01_02_105204_create_currencies_table', 27),
(60, '2025_01_20_133622_add_slug_to_blogs_table', 28),
(61, '2025_01_20_155048_add_app_settings_to_basic_controls_table', 29),
(62, '2025_01_22_131841_add_field_to_deposits_table', 30),
(64, '2025_01_12_122246_add_social_to_users_table', 31),
(65, '2025_01_30_114415_add_another_field_to_users_table', 32),
(66, '2025_02_27_131453_add_colours_to_basic_controls_table', 32),
(67, '2025_10_12_104959_version4.1', 33);

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notifyable_id` int(11) DEFAULT NULL,
  `notifyable_type` varchar(255) DEFAULT NULL,
  `template_email_key` text DEFAULT NULL,
  `template_sms_key` text DEFAULT NULL,
  `template_in_app_key` text DEFAULT NULL,
  `template_push_key` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `template_key` varchar(255) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `sms` text DEFAULT NULL,
  `in_app` text DEFAULT NULL,
  `push` text DEFAULT NULL,
  `status` text DEFAULT NULL COMMENT '	mail = 0(inactive), mail = 1(active), sms = 0(inactive), sms = 1(active), in_app = 0(inactive), in_app = 1(active), push = 0(inactive), push = 1(active)',
  `notify_for` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => user, 1 => admin',
  `lang_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `language_id`, `name`, `email_from`, `template_key`, `subject`, `short_keys`, `email`, `sms`, `in_app`, `push`, `status`, `notify_for`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Password Reset', 'support@gmail.com', 'PASSWORD_RESET', 'Reset Your Password', '{\"message\":\"message\"}', 'You are receiving this email because we received a password reset request for your account.[[message]]\n\n\nThis password reset link will expire in 60 minutes.\n\nIf you did not request a password reset, no further action is required.', '', '', '', '{\"mail\":\"1\",\"sms\":\"0\",\"in_app\":\"0\",\"push\":\"0\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(2, 1, 'Verification Code', 'support@gmail.com', 'VERIFICATION_CODE', 'Verification Code', '{\"code\":\"code\"}', 'Your Email verification Code  [[code]]', 'Your SMS verification Code  [[code]]', '', '', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"0\",\"push\":\"0\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(3, 1, 'Two Step Enabled.', 'support@gmail.com', 'TWO_STEP_ENABLED', 'Two step enabled.', '{\"action\":\"Enabled Or Disable\",\"ip\":\"Device Ip\",\"time\":\"Time\",\"code\":\"code\"}', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', 'Your verification code is: {{code}}', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(4, 1, 'Two Step Disabled', 'support@gmail.com', 'TWO_STEP_DISABLED', 'Two Step disabled', '{\"time\":\"Time\"}', 'Google two factor verification is disabled.', 'Google two factor verification is disabled.', 'Google two factor verification is disabled.', 'Google two factor verification is disabled.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(5, 1, 'Support Ticket Create', 'support@gmail.com', 'SUPPORT_TICKET_CREATE', 'Support Ticket New', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', '[[username]] create a ticket\nTicket : [[ticket_id]]', '[[username]] create a ticket\nTicket : [[ticket_id]]', '[[username]] create a ticket\nTicket : [[ticket_id]]', '[[username]] create a ticket\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(6, 1, 'Admin Replied Ticket', 'support@gmail.com', 'ADMIN_REPLIED_TICKET', 'Support Ticket Reply', '{\"ticket_id\":\"Support Ticket ID\"}', 'Your support ticket has been replied by admin\nTicket : [[ticket_id]]', 'Your support ticket has been replied by admin\nTicket : [[ticket_id]]', 'Your support ticket has been replied by admin\nTicket : [[ticket_id]]', 'Your support ticket has been replied by admin\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(7, 1, 'Payment Request to Admin', 'support@gmail.com', 'PAYMENT_REQUEST', 'Payment Request', '{\"username\":\"User\",\"amount\":\"Amount\",\"gateway\":\"Gateway\"}', '[[username]] request to payment [[amount]] by [[gateway]].', '[[username]] request to payment [[amount]] by [[gateway]].', '[[username]] request to payment [[amount]] by [[gateway]].', '[[username]] request to payment [[amount]] by [[gateway]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(9, 1, 'Payment Rejected', 'support@gmail.com', 'PAYMENT_REJECTED', 'Payment Rejected', '{\"username\":\"User\",\"amount\":\"Amount\",\"gateway\":\"Gateway\"}', '[[username]] request to payment [[amount]] by [[gateway]] is rejected.', '[[username]] request to payment [[amount]] by [[gateway]] is rejected.', '[[username]] request to payment [[amount]] by [[gateway]] is rejected.', '[[username]] request to payment [[amount]] by [[gateway]] is rejected.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(10, 1, 'Buyer Make Payment', 'support@gmail.com', 'BUYER_PAYMENT', 'Payment Complete', '{\"amount\":\"Amount\",\"currency\":\"Currency Symbol\",\"gateway\":\"Gateway\",\"transaction\":\"Trx Id\"}', 'Your [[currency]][[amount]] payment Via [[gateway]] has been completed. Trx Id: [[transaction]]', 'Your [[currency]][[amount]] payment Via [[gateway]] has been completed. Trx Id: [[transaction]]', 'Your [[currency]][[amount]] payment Via [[gateway]] has been completed. Trx Id: [[transaction]]', 'Your [[currency]][[amount]] payment Via [[gateway]] has been completed. Trx Id: [[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(11, 1, 'Buyer Make Payment To Admin', 'support@gmail.com', 'BUYER_PAYMENT_ADMIN', 'Buyer Make Payment', '{\"username\":\"username\",\"amount\":\"Amount\",\"currency\":\"Currency Symbol\",\"gateway\":\"Gateway\",\"transaction\":\"Trx Id\"}', '[[username]] make payment [[currency]][[amount]] Via [[gateway]] has been completed. Trx Id: [[transaction]]', '[[username]] make payment [[currency]][[amount]] Via [[gateway]] has been completed. Trx Id: [[transaction]]', '[[username]] make payment [[currency]][[amount]] Via [[gateway]] has been completed. Trx Id: [[transaction]]', '[[username]] make payment [[currency]][[amount]] Via [[gateway]] has been completed. Trx Id: [[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(12, 1, 'Top Up Order Complete', 'support@gmail.com', 'TOP_UP_ORDER_COMPLETE', 'Top Up Order Complete', '{\"order_id\":\"Order Id\",\"service_name\":\"Service Name\"}', 'Your [[service_name]] top up order has been completed. Order Id: [[order_id]]', 'Your [[service_name]] top up order has been completed. Order Id: [[order_id]]', 'Your [[service_name]] top up order has been completed. Order Id: [[order_id]]', 'Your [[service_name]] top up order has been completed. Order Id: [[order_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(13, 1, 'Top Up Order Cancel', 'support@gmail.com', 'TOP_UP_ORDER_CANCEL', 'Top Up Order Cancel', '{\"order_id\":\"Order Id\",\"service_name\":\"Service Name\"}', 'Your [[service_name]] top up order has been cancel. Order Id: [[order_id]]', 'Your [[service_name]] top up order has been cancel. Order Id: [[order_id]]', 'Your [[service_name]] top up order has been cancel. Order Id: [[order_id]]', 'Your [[service_name]] top up order has been cancel. Order Id: [[order_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(14, 1, 'Card Code Send', 'support@gmail.com', 'CARD_CODE_SEND', 'Card Code Send', '{\"order_id\":\"Order Id\",\"service_name\":\"Service Name\"}', 'Your order [[service_name]] card passcode has been send. Order Id: [[order_id]]', 'Your order [[service_name]] card passcode has been send. Order Id: [[order_id]]', 'Your order [[service_name]] card passcode has been send. Order Id: [[order_id]]', 'Your order [[service_name]] card passcode has been send. Order Id: [[order_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(15, 1, 'Card Order Complete', 'support@gmail.com', 'CARD_ORDER_COMPLETE', 'Card Complete', '{\"order_id\":\"Order Id\"}', 'Your card order has been completed. Order Id: [[order_id]]', 'Your card order has been completed. Order Id: [[order_id]]', 'Your card order has been completed. Order Id: [[order_id]]', 'Your card order has been completed. Order Id: [[order_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(16, 1, 'Card Order Cancel', 'support@gmail.com', 'CARD_ORDER_CANCEL', 'Card Order Cancel', '{\"order_id\":\"Order Id\"}', 'Your card order has been cancel. Order Id: [[order_id]]', 'Your card order has been cancel. Order Id: [[order_id]]', 'Your card order has been cancel. Order Id: [[order_id]]', 'Your card order has been cancel. Order Id: [[order_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(17, 1, 'Buyer Review', 'support@gmail.com', 'BUYER_REVIEW_TO_ADMIN', 'You have a new review', '{\"name\":\"Game Name\",\"rating\":\"Rating\"}', 'You have new [[rating]] review for [[name]]. ', 'You have new [[rating]] review for [[name]]. ', 'You have new [[rating]] review for [[name]]. ', 'You have new [[rating]] review for [[name]]. ', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(18, 1, 'Credited Balance', 'support@gmail.com', 'ADD_BALANCE', 'Your account is credited', '{\"amount\":\"Amount\",\"main_balance\":\"Main Balance\"}', 'Your account has been credited [[amount]]. Available balance is [[main_balance]].', 'Your account has been credited [[amount]]. Available balance is [[main_balance]].', 'Your account has been credited [[amount]]. Available balance is [[main_balance]].', 'Your account has been credited [[amount]]. Available balance is [[main_balance]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(19, 1, 'Debited Balance', 'support@gmail.com', 'DEDUCTED_BALANCE', 'Your account is debited ', '{\"amount\":\"Amount\",\"main_balance\":\"Main Balance\"}', 'Your account has been debited [[amount]]. Available balance is [[main_balance]].', 'Your account has been debited [[amount]]. Available balance is [[main_balance]].', 'Your account has been debited [[amount]]. Available balance is [[main_balance]].', 'Your account has been debited [[amount]]. Available balance is [[main_balance]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(20, 1, 'Payment Lock', 'support@gmail.com', 'PAYMENT_LOCK', 'Payment Has Been Locked', '{\"title\":\"Title\",\"amount\":\"Amount\"}', '[[title]] amount [[amount]] payment has been lock.', '[[title]] amount [[amount]] payment has been lock.', '[[title]] amount [[amount]] payment has been lock.', '[[title]] amount [[amount]] payment has been lock.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(21, 1, 'SELL RE OFFER', 'support@gmail.com', 'SELL_RE_OFFER', 'Sell Post Has Been Re Offered', '{\"title\":\"Title\",\"amount\":\"Amount\",\"description\":\"Description\",\"offer_by\":\"Offer By\"}', 'Your [[title]] sell post has been re offered by [[offer_by]] \r\nAmount: [[amount]]\r\nDescription: [[description]]', 'Your [[title]] sell post has been re offered by [[offer_by]] \r\nAmount: [[amount]]\r\nDescription: [[description]]', 'Your [[title]] sell post has been re offered by [[offer_by]] \r\nAmount: [[amount]]\r\nDescription: [[description]]', 'Your [[title]] sell post has been re offered by [[offer_by]] \r\nAmount: [[amount]]\r\nDescription: [[description]]', '{\"mail\":1,\"sms\":1,\"in_app\":1,\"push\":1}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(22, 1, 'SELL OFFER', 'support@gmail.com', 'SELL_OFFER', 'Sell Post Has Been Offered', '{\"title\":\"Title\",\"amount\":\"Amount\",\"offer_by\":\"Offer By\"}', 'Your [[title]] sell post has been offered by [[offer_by]] \r\nAmount: [[amount]]', 'Your [[title]] sell post has been offered by [[offer_by]] \r\nAmount: [[amount]]', 'Your [[title]] sell post has been offered by [[offer_by]] \r\nAmount: [[amount]]', 'Your [[title]] sell post has been offered by [[offer_by]] \r\nAmount: [[amount]]', '{\"mail\":1,\"sms\":1,\"in_app\":1,\"push\":1}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(23, 1, 'OFFER_ACCEPTED', 'support@gmail.com', 'OFFER_ACCEPTED', 'Offer Has Been Accepted', '{\"title\":\"Title\",\"amount\":\"Amount\"}', '[[title]] offer amount [[amount]] has been accepted.', '[[title]] offer amount [[amount]] has been accepted.', '[[title]] offer amount [[amount]] has been accepted.', '[[title]] offer amount [[amount]] has been accepted.', '{\"mail\":1,\"sms\":1,\"in_app\":1,\"push\":1}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(24, 1, 'Payout Request  Admin', 'support@gmail.com', 'PAYOUT_REQUEST_TO_ADMIN', 'payout Request  Admin', '{\"sender\":\"Sender Name\",\"amount\":\"Received Amount\",\"transaction\":\"Transaction Number\", \"currency\":\"Payment Currency\"}', '[[sender]] payout money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] payout money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] payout money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '[[sender]] payout money amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(25, 1, 'Payout Request Cancel', 'support@gmail.com', 'PAYOUT_CANCEL', 'Payout Request Cancel', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been cancel. Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(26, 1, 'Password Reset', 'support@gmail.com', 'PASSWORD_RESET', 'Reset Your Password', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(27, 1, 'Payout Request from', 'support@gmail.com', 'PAYOUT_REQUEST_FROM', 'Payout Request from', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13'),
(28, 1, 'Payout Request Approved', 'support@gmail.com', 'PAYOUT_APPROVED', 'Payout Request Approved', '{\"amount\":\"Received Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', 'You request for payout amount [[amount]] [[currency]] has been approved . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 'en', '2023-10-07 22:18:47', '2025-03-01 10:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL COMMENT '-1=>for wallet payment',
  `amount` double NOT NULL DEFAULT 0 COMMENT 'total order amount',
  `discount` float NOT NULL DEFAULT 0,
  `coupon_code` varchar(20) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `info` text DEFAULT NULL COMMENT 'for dynamic information store',
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>incomplete,1=>complete',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>initiate,1=>complete,2=>refund,3=>stock_short',
  `order_for` enum('topup','card') NOT NULL,
  `utr` varchar(50) DEFAULT NULL,
  `order_interface` enum('WEB','API') NOT NULL DEFAULT 'WEB',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `payment_method_id`, `amount`, `discount`, `coupon_code`, `coupon_id`, `info`, `payment_status`, `status`, `order_for`, `utr`, `order_interface`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 16000, 0, NULL, NULL, '{\"Masukan_Data\":{\"field\":\"Masukan Data\",\"value\":\"Wahytudi\"}}', 0, 0, 'topup', 'O4T6UG6O6799F', 'WEB', '2025-04-12 09:52:18', '2025-04-12 09:52:18'),
(2, 1, 1000, 400000, 0, NULL, NULL, '{\"Masukan_Data\":{\"field\":\"Masukan Data\",\"value\":\"Wahytudi\"}}', 1, 1, 'topup', 'O8GKPQ12MNBN7', 'WEB', '2025-04-12 09:54:56', '2025-04-12 10:01:54'),
(3, 1, 1000, 550000, 0, NULL, NULL, '{\"Enter_Your_Nickname\":{\"field\":\"Enter Your Nickname\",\"value\":\"xeadesta\"}}', 1, 2, 'topup', 'O2S13HJ2PK18M', 'WEB', '2025-05-28 08:56:30', '2025-09-29 04:37:07'),
(4, 1, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 'card', 'OY4KEBUV729R1', 'WEB', '2025-05-28 09:05:47', '2025-05-28 09:05:47'),
(5, 1, 1000, 550000, 0, NULL, NULL, '{\"Enter_Your_Nickname\":{\"field\":\"Enter Your Nickname\",\"value\":\"Xeadesta\"}}', 1, 1, 'topup', 'O5P9UP43WS4QP', 'WEB', '2025-11-24 10:18:17', '2025-12-05 13:45:51'),
(6, 3, NULL, 11000, 0, NULL, NULL, '{\"Enter_Your_Nickname\":{\"field\":\"Enter Your Nickname\",\"value\":\"abc123\"}}', 0, 0, 'topup', 'OB7Y6J88P12PN', 'WEB', '2025-11-29 06:58:48', '2025-11-29 06:58:48'),
(7, 3, NULL, 11000, 0, NULL, NULL, '{\"Enter_Your_Nickname\":{\"field\":\"Enter Your Nickname\",\"value\":\"abc123\"}}', 0, 0, 'topup', 'O8YEJ9WMW1K6Q', 'WEB', '2025-11-29 06:59:08', '2025-11-29 06:59:08'),
(8, 3, NULL, 11000, 0, NULL, NULL, '{\"Enter_Your_Nickname\":{\"field\":\"Enter Your Nickname\",\"value\":\"abc123\"}}', 0, 0, 'topup', 'OEJHEU7XX2JEA', 'WEB', '2025-11-30 10:02:10', '2025-11-30 10:02:10'),
(9, 3, NULL, 11000, 0, NULL, NULL, '{\"Enter_Your_Nickname\":{\"field\":\"Enter Your Nickname\",\"value\":\"avc\"}}', 0, 0, 'topup', 'OQ1D9MXFJOBXQ', 'WEB', '2025-11-30 11:03:36', '2025-11-30 11:03:36'),
(10, 1, -1, 257000, 0, NULL, NULL, '{\"User_Id\":{\"field\":\"User ID\",\"value\":\"1234\"}}', 1, 0, 'topup', 'OKR7UEEUP3F97', 'WEB', '2025-12-05 16:19:56', '2025-12-05 16:20:02'),
(11, 1, NULL, 11000, 0, NULL, NULL, '{\"Enter_Your_Nickname\":{\"field\":\"Enter Your Nickname\",\"value\":\"AAA\"}}', 0, 0, 'topup', 'ORHUD1MQGFNWA', 'WEB', '2025-12-05 16:27:47', '2025-12-05 16:27:47'),
(12, 1, NULL, 1000000, 0, NULL, NULL, NULL, 0, 0, 'card', 'OM127FCBPPUPZ', 'WEB', '2025-12-05 16:37:51', '2025-12-05 16:37:51'),
(13, 1, NULL, 16000, 0, NULL, NULL, '{\"Masukan_Data\":{\"field\":\"Masukan Data\",\"value\":\"zzz\"}}', 0, 0, 'topup', 'OXDN2TTUMZ3CB', 'WEB', '2025-12-05 16:40:23', '2025-12-05 16:40:23'),
(14, 1, NULL, 1000000, 0, NULL, NULL, NULL, 0, 0, 'card', 'O23JPGGPMEJWA', 'WEB', '2025-12-05 16:40:36', '2025-12-05 16:40:36'),
(15, 1, NULL, 1000000, 0, NULL, NULL, NULL, 0, 0, 'card', 'OB7HM5UJEJUGC', 'WEB', '2025-12-05 16:42:37', '2025-12-05 16:42:37'),
(16, 1, -1, 100000, 0, NULL, NULL, NULL, 1, 0, 'card', 'OXZZWT9DWFDBE', 'WEB', '2025-12-07 15:38:39', '2025-12-07 15:38:45'),
(17, 1, 1000, 100000, 0, NULL, NULL, NULL, 1, 0, 'card', 'OA6OW8RKPNQBX', 'WEB', '2025-12-07 15:40:30', '2025-12-07 15:42:45'),
(18, 1, NULL, 130000, 0, NULL, NULL, NULL, 0, 0, 'card', 'OCMCXANFHKJWP', 'WEB', '2025-12-07 15:51:40', '2025-12-07 15:51:40'),
(19, 1, NULL, 130000, 0, NULL, NULL, NULL, 0, 0, 'card', 'O1BE5ONBU5HC4', 'WEB', '2025-12-07 15:51:40', '2025-12-07 15:51:40'),
(20, 1, -1, 130000, 0, NULL, NULL, NULL, 1, 0, 'card', 'OEOWRMN3MUFTY', 'WEB', '2025-12-07 15:51:40', '2025-12-07 15:51:50'),
(21, 3, NULL, 11000, 0, NULL, NULL, '{\"Enter_Your_Nickname\":{\"field\":\"Enter Your Nickname\",\"value\":\"abc\"}}', 0, 0, 'topup', 'OPGXSKMCNPHH5', 'WEB', '2025-12-08 03:21:09', '2025-12-08 03:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT 'top up or card id',
  `detailable_type` varchar(255) NOT NULL,
  `detailable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_driver` varchar(255) DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 1 COMMENT 'how many code order',
  `stock_short` int(11) NOT NULL DEFAULT 0 COMMENT 'how many code do not get buyer',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>initiate,1=>complete,2=>refund,3=>stock_short',
  `card_codes` text DEFAULT NULL COMMENT 'buyer card service code',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `user_id`, `order_id`, `parent_id`, `detailable_type`, `detailable_id`, `name`, `image`, `image_driver`, `price`, `discount`, `qty`, `stock_short`, `status`, `card_codes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'App\\Models\\TopUpService', 1, '1 + 2 Orb', 'top-up-service/IxQD1FMG178tQI4yW4q6dACjmzNKSb.webp', 'local', 16000, 0, 1, 0, 0, NULL, '2025-04-12 09:52:18', '2025-04-12 09:52:18'),
(2, 1, 2, 1, 'App\\Models\\TopUpService', 6, '50 + 10 Orb', 'top-up-service/NMsKPa961JrWGN3dq7GGS3TIHlCIGQ.webp', 'local', 400000, 0, 1, 0, 1, NULL, '2025-04-12 09:54:56', '2025-04-12 10:01:54'),
(3, 1, 3, 2, 'App\\Models\\TopUpService', 11, '5000 Robux', 'top-up-service/84uCEzRD6OJdRBLrVl5C0erzo9gprb.webp', 'local', 550000, 0, 1, 0, 2, NULL, '2025-05-28 08:56:30', '2025-09-29 04:37:07'),
(4, 1, 5, 2, 'App\\Models\\TopUpService', 11, '5000 Robux', 'top-up-service/84uCEzRD6OJdRBLrVl5C0erzo9gprb.webp', 'local', 550000, 0, 1, 0, 1, NULL, '2025-11-24 10:18:17', '2025-12-05 13:45:51'),
(5, 3, 6, 2, 'App\\Models\\TopUpService', 8, '100 Robux', 'top-up-service/SYFt2vGHlGA0Ju0RQEOhTwcQIafRPh.webp', 'local', 11000, 0, 1, 0, 0, NULL, '2025-11-29 06:58:48', '2025-11-29 06:58:48'),
(6, 3, 7, 2, 'App\\Models\\TopUpService', 8, '100 Robux', 'top-up-service/SYFt2vGHlGA0Ju0RQEOhTwcQIafRPh.webp', 'local', 11000, 0, 1, 0, 0, NULL, '2025-11-29 06:59:08', '2025-11-29 06:59:08'),
(7, 3, 8, 2, 'App\\Models\\TopUpService', 8, '100 Robux', 'top-up-service/SYFt2vGHlGA0Ju0RQEOhTwcQIafRPh.webp', 'local', 11000, 0, 1, 0, 0, NULL, '2025-11-30 10:02:10', '2025-11-30 10:02:10'),
(8, 3, 9, 2, 'App\\Models\\TopUpService', 8, '100 Robux', 'top-up-service/SYFt2vGHlGA0Ju0RQEOhTwcQIafRPh.webp', 'local', 11000, 0, 1, 0, 0, NULL, '2025-11-30 11:03:36', '2025-11-30 11:03:36'),
(9, 1, 10, 6, 'App\\Models\\TopUpService', 38, '2000 💎', 'top-up-service/q5bNiQ4xwQYdu9ZoIYOoSTz8FrDZeN.webp', 'local', 257000, 0, 1, 0, 0, NULL, '2025-12-05 16:19:56', '2025-12-05 16:19:56'),
(10, 1, 11, 2, 'App\\Models\\TopUpService', 8, '100 Robux', 'top-up-service/SYFt2vGHlGA0Ju0RQEOhTwcQIafRPh.webp', 'local', 11000, 0, 1, 0, 0, NULL, '2025-12-05 16:27:47', '2025-12-05 16:27:47'),
(11, 1, 12, 2, 'App\\Models\\CardService', 5, 'Roblox Gift Card 200000', 'card-service/pZVqm6iHFVvnDbdvFR61h6BtOxBF6s.webp', 'local', 200000, 0, 5, 0, 0, NULL, '2025-12-05 16:37:51', '2025-12-05 16:37:51'),
(12, 1, 13, 1, 'App\\Models\\TopUpService', 1, '1 + 2 Orb', 'top-up-service/IxQD1FMG178tQI4yW4q6dACjmzNKSb.webp', 'local', 16000, 0, 1, 0, 0, NULL, '2025-12-05 16:40:23', '2025-12-05 16:40:23'),
(13, 1, 14, 2, 'App\\Models\\CardService', 5, 'Roblox Gift Card 200000', 'card-service/pZVqm6iHFVvnDbdvFR61h6BtOxBF6s.webp', 'local', 200000, 0, 5, 0, 0, NULL, '2025-12-05 16:40:36', '2025-12-05 16:40:36'),
(14, 1, 15, 2, 'App\\Models\\CardService', 5, 'Roblox Gift Card 200000', 'card-service/pZVqm6iHFVvnDbdvFR61h6BtOxBF6s.webp', 'local', 200000, 0, 5, 0, 0, NULL, '2025-12-05 16:42:37', '2025-12-05 16:42:37'),
(15, 1, 16, 2, 'App\\Models\\CardService', 2, 'Roblox Gift Card 50000', 'card-service/fB120lRjSfRWjoZJuJPdTz9WFqAyOK.webp', 'local', 50000, 0, 2, 0, 0, NULL, '2025-12-07 15:38:39', '2025-12-07 15:38:39'),
(16, 1, 17, 2, 'App\\Models\\CardService', 2, 'Roblox Gift Card 50000', 'card-service/fB120lRjSfRWjoZJuJPdTz9WFqAyOK.webp', 'local', 50000, 0, 2, 0, 0, NULL, '2025-12-07 15:40:30', '2025-12-07 15:40:30'),
(17, 1, 18, 2, 'App\\Models\\CardService', 3, 'Roblox Gift Card 65000', 'card-service/WXcEBWmHe64oYh4ebKlld9vnUmPMQM.webp', 'local', 65000, 0, 2, 0, 0, NULL, '2025-12-07 15:51:40', '2025-12-07 15:51:40'),
(18, 1, 19, 2, 'App\\Models\\CardService', 3, 'Roblox Gift Card 65000', 'card-service/WXcEBWmHe64oYh4ebKlld9vnUmPMQM.webp', 'local', 65000, 0, 2, 0, 0, NULL, '2025-12-07 15:51:40', '2025-12-07 15:51:40'),
(19, 1, 20, 2, 'App\\Models\\CardService', 3, 'Roblox Gift Card 65000', 'card-service/WXcEBWmHe64oYh4ebKlld9vnUmPMQM.webp', 'local', 65000, 0, 2, 0, 0, NULL, '2025-12-07 15:51:40', '2025-12-07 15:51:40'),
(20, 3, 21, 2, 'App\\Models\\TopUpService', 8, '100 Robux', 'top-up-service/SYFt2vGHlGA0Ju0RQEOhTwcQIafRPh.webp', 'local', 11000, 0, 1, 0, 0, NULL, '2025-12-08 03:21:09', '2025-12-08 03:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `template_name` varchar(191) DEFAULT NULL,
  `custom_link` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `meta_robots` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_image_driver` varchar(50) DEFAULT NULL,
  `breadcrumb_image` varchar(255) DEFAULT NULL,
  `breadcrumb_image_driver` varchar(50) DEFAULT NULL,
  `breadcrumb_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 => inactive, 1 => active',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 => unpublish, 1 => publish',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => admin create, 1 => developer create, 2 => create for menus',
  `is_breadcrumb_img` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `template_name`, `custom_link`, `page_title`, `meta_title`, `meta_keywords`, `meta_description`, `og_description`, `meta_robots`, `meta_image`, `meta_image_driver`, `breadcrumb_image`, `breadcrumb_image_driver`, `breadcrumb_status`, `status`, `type`, `is_breadcrumb_img`, `created_at`, `updated_at`) VALUES
(1, 'home', '/', 'light', NULL, 'Home', 'Home meta', '[\"home\",\"meta\"]', 'this is demo meta description', 'this is demo og description', 'noindex', 'seo/bjHgBsxpCpVq81YkAWD8UrNzrXdhkZ.webp', 'local', NULL, 'local', 0, 1, 0, 1, '2024-10-30 11:50:33', '2024-11-14 11:32:21'),
(2, 'Blog', 'blog', 'light', NULL, 'Blogs', 'Blogs Meta Title', '[\"Blogs Meta\"]', 'Blogs Meta Description', 'Blogs Meta Description', 'index,noindex', 'seo/ZQdB5VRSpNT1S6RXuXhiMmflnqWXuC.webp', 'local', NULL, 'local', 0, 1, 0, 1, '2024-10-30 13:13:51', '2025-01-02 11:48:53'),
(3, 'contact', 'contact', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-10-30 13:14:10', '2024-10-30 13:14:10'),
(4, 'privacy &amp; policy', 'privacy-and-policy', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-10-30 13:18:19', '2024-10-30 13:18:19'),
(5, 'terms &amp; conditions', 'terms-and-conditions', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-10-30 13:18:48', '2024-10-30 13:18:48'),
(6, 'developer', 'developer', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-11-13 05:07:02', '2024-11-13 05:07:02'),
(7, 'home', '/', 'dark', NULL, 'Home', 'Home', '[\"gamers\",\"topup\",\"voucher\",\"giftcard\",\"Digital Online\"]', 'Most gamer wants to buy game top up, voucher &amp; virtual card. But they don’t have international card. they want to get it by local currency', 'Tempat Top Up murah dan Terpecaya', 'noindex,follow', 'seo/TaD8xD4oFYNs1vTTONNCfTzhBNeRTs.webp', 'local', NULL, 'local', 0, 1, 0, 1, '2024-12-08 11:44:19', '2025-12-05 13:51:52'),
(8, 'contact', 'contact', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-12-12 10:38:21', '2024-12-12 10:38:21'),
(9, 'Card', 'cards', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, '2024-12-18 11:22:54', '2024-12-18 11:22:54'),
(10, 'Top Up', 'top-ups', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, '2024-12-18 11:22:54', '2024-12-18 11:22:54'),
(13, 'Blog', 'blog', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, '2024-12-12 11:26:40', '2024-12-12 11:26:40'),
(14, 'privacy and policy', 'privacy-and-policy', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-12-12 12:50:20', '2024-12-12 12:50:20'),
(15, 'terms and conditions', 'terms-and-conditions', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-12-14 04:46:17', '2024-12-14 04:46:17'),
(16, 'developer', 'developer', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-12-15 12:08:09', '2024-12-15 12:08:09'),
(18, 'Card', 'cards', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, '2024-12-18 11:22:54', '2024-12-18 11:22:54'),
(19, 'Top Up', 'top-ups', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, '2024-12-18 11:22:54', '2024-12-18 11:22:54'),
(20, 'cookie policy', 'cookie-policy', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-12-21 10:35:04', '2024-12-21 10:35:04'),
(21, 'cookie policy', 'cookie-policy', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, 1, 0, 1, '2024-12-21 11:08:52', '2024-12-21 11:08:52'),
(22, 'Buy', 'buy', 'dark', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, '2024-12-29 07:09:20', '2024-12-29 07:09:20'),
(23, 'Buy', 'buy', 'light', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, '2024-12-29 07:09:20', '2024-12-29 07:11:28'),
(26, 'google', NULL, 'dark', 'https://www.google.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 1, '2025-01-06 12:22:49', '2025-01-06 12:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `page_details`
--

CREATE TABLE `page_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `sections` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_details`
--

INSERT INTO `page_details` (`id`, `page_id`, `language_id`, `name`, `content`, `sections`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Home', '<p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_hero]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_exclusive_card]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_brand]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_about]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_campaign]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_top_up]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_why_chose_us]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_buy_game_id]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_testimonial]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_blog]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"light_hero\",\"light_exclusive_card\",\"light_brand\",\"light_about\",\"light_campaign\",\"light_top_up\",\"light_why_chose_us\",\"light_buy_game_id\",\"light_testimonial\",\"light_blog\"]', '2024-10-30 11:50:33', '2025-04-12 09:30:23'),
(2, 2, 1, 'Blog', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_blog]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"light_blog\"]', '2024-10-30 13:13:51', '2025-04-12 09:32:38'),
(3, 3, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"light_contact\"]', '2024-10-30 13:14:10', '2024-12-18 06:04:25'),
(4, 4, 1, 'Privacy &amp; Policy', '<h3>Our Privacy Policy</h3><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, and share your personal information when you visit or make a purchase from our website.</p><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\"><br></p><h5>Personal Information We Collect</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">When you visit our website, we collect certain information about your device, including your IP address, browser type, and operating system. We also collect information about the pages you visit on our website, the links you click, and the products you view or purchase. We collect this information using cookies and other tracking technologies. For more information about cookies, please see the \"Cookies\" section below.</p><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\"><br></p><h5>How We Use Your Personal Information</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">We use the information we collect from you to:</p><ul><li>Process your orders and fulfill your requests</li><li>Communicate with you about your orders, products, and services</li><li>Provide you with targeted advertising and marketing</li><li>Improve our website and products</li><li>Comply with applicable laws and regulations</li></ul><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\"><br><br></p><h5>Sharing Your Personal Information</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">We share your personal information with third parties to help us with the purposes listed above. For example, we use Shopify to power our online store. You can read more about how Shopify uses your personal information here: https://www.shopify.com/legal/privacy. We also use Google Analytics to track website traffic. You can read more about how Google uses your personal information You can opt-out of Google Analytics tracking. Finally, we may share your personal information to comply with applicable laws and regulations, to respond to a subpoena, search warrant or other lawful request for information we receive, or to protect our rights.</p><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\"><br><br></p><h5>Contact Us</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">If you have any questions about this Privacy Policy, please contact us at [email protected]</p>', NULL, '2024-10-30 13:18:19', '2024-10-30 13:18:19'),
(5, 5, 1, 'Terms &amp; Conditions', '<h3>Our Terms &amp; Conditions</h3><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">By accessing or using TalkWave, you agree to these Terms &amp; Conditions and our Privacy Policy. If you do not agree, do not use our platform.</p><p style=\"color:rgb(26,26,26);font-family:\'DM Sans\', sans-serif;font-size:16px;\"><br></p><h5>Use of Service</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">You must create an account to use TalkWave. Provide accurate information and keep your login credentials secure. You agree not to misuse TalkWave, including spamming, hacking, or violating any laws.</p><h5><br></h5><h5>Communication of Service</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">Use TalkWave for lawful communication purposes only. We do not monitor your messages but may act if violations are reported. You are responsible for the content you share. Do not infringe on copyrights or distribute harmful material.</p><h5><br></h5><h5>Data Privacy</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">We collect and use personal information as outlined in our Privacy Policy. Your data security is important to us. Integrations with third-party services may require sharing information as per their terms.</p><h5><br></h5><h5>How We Use Your Personal Information</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">We use the information we collect from you to:</p><ul><li>Process your orders and fulfill your requests</li><li>Communicate with you about your orders, products, and services</li><li>Provide you with targeted advertising and marketing</li><li>Improve our website and products</li><li>Comply with applicable laws and regulations</li></ul><p style=\"color:rgb(26,26,26);font-family:\'DM Sans\', sans-serif;font-size:16px;\"><br><br></p><h5>Sharing Your Personal Information</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">We share your personal information with third parties to help us with the purposes listed above. For example, we use Shopify to power our online store. You can read more about how Shopify uses your personal information here: https://www.shopify.com/legal/privacy. We also use Google Analytics to track website traffic. You can read more about how Google uses your personal information You can opt-out of Google Analytics tracking. Finally, we may share your personal information to comply with applicable laws and regulations, to respond to a subpoena, search warrant or other lawful request for information we receive, or to protect our rights.</p><p style=\"color:rgb(26,26,26);font-family:\'DM Sans\', sans-serif;font-size:16px;\"><br><br></p><h5>Contact Us</h5><h3></h3><p style=\"color:rgb(105,105,105);font-family:\'DM Sans\', sans-serif;font-size:15px;\">If you have any questions about this Privacy Policy, please contact us at [email protected]</p>', NULL, '2024-10-30 13:18:48', '2024-10-30 13:18:48'),
(6, 6, 1, 'Developer', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[light_docx]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"light_docx\"]', '2024-11-13 05:07:02', '2024-12-18 12:47:55'),
(8, 7, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_hero]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_exclusive_card]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_about]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_campaign]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_top_up]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_why_chose_us]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_buy_game_id]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_testimonial]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_blog]]</div>\n                    <span class=\"delete-block\">×</span>\n                    <span class=\"up-block\">↑</span>\n                    <span class=\"down-block\">↓</span></div><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', '[\"dark_hero\",\"dark_exclusive_card\",\"dark_about\",\"dark_campaign\",\"dark_top_up\",\"dark_why_chose_us\",\"dark_buy_game_id\",\"dark_testimonial\",\"dark_blog\"]', '2024-12-08 11:44:19', '2025-12-05 13:50:44'),
(9, 8, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"dark_contact\"]', '2024-12-12 10:38:21', '2024-12-15 06:27:40'),
(10, 9, 1, 'Card', NULL, NULL, '2024-12-12 10:53:41', '2024-12-12 10:53:41'),
(11, 10, 1, 'Top Up', NULL, NULL, '2024-12-12 10:53:49', '2024-12-12 10:53:49'),
(12, 13, 1, 'Blogs', NULL, NULL, '2024-12-12 11:28:41', '2024-12-12 11:28:41'),
(13, 11, 1, 'Cards', NULL, NULL, '2024-12-12 11:28:54', '2024-12-12 11:28:54'),
(14, 14, 1, 'Privacy And Policy', '<h1>Privacy Policy</h1><p><br></p><p>Effective Date: 14-12-2024</p><p>At Gamers Arena, your privacy is important to us. This Privacy Policy outlines the types of information we collect, how we use it, and the measures we take to protect your data.</p><h2>1. Information We Collect</h2><h3>a. Personal Information</h3><p>We may collect personal information such as:</p><ul><li>Name</li><li>Email address</li><li>Date of birth</li><li>Payment information (for purchases or subscriptions)</li></ul><h3>b. Non-Personal Information</h3><p>We collect non-personal information, including:</p><ul><li>IP address</li><li>Browser type</li><li>Operating system</li><li>Device information</li><li>Game preferences and interaction data</li></ul><h3>c. Cookies and Tracking Technologies</h3><p>We use cookies, web beacons, and similar technologies to:</p><ul><li>Enhance your experience</li><li>Analyze website traffic</li><li>Personalize content and ads</li></ul><h2>2. How We Use Your Information</h2><p>The information we collect is used to:</p><ul><li>Provide and improve our services</li><li>Process transactions</li><li>Communicate updates, promotions, or notifications</li><li>Customize user experiences</li><li>Ensure security and prevent fraud</li></ul><h2>3. Sharing Your Information</h2><p>We do not sell your personal information. However, we may share your data:</p><ul><li>With trusted partners who assist in providing our services</li><li>For legal compliance or to protect our rights</li><li>In case of a merger, acquisition, or asset sale</li></ul><h2>4. Third-Party Services</h2><p>Our website may include links to third-party services or games. We are not responsible for the privacy practices of these external websites.</p><h2>5. Data Security</h2><p>We implement robust security measures to protect your data from unauthorized access, alteration, or disclosure. However, no method of electronic transmission is completely secure.</p><h2>6. Your Rights</h2><p>Depending on your location, you may have the following rights:</p><ul><li>Access your personal information</li><li>Request correction of inaccurate data</li><li>Delete your data</li><li>Opt-out of marketing communications</li><li>Restrict or object to certain processing activities</li></ul><p>To exercise these rights, contact us at [Insert Contact Email].</p><h2>7. Children’s Privacy</h2><p>Gamers Arena is not directed toward children under 13, and we do not knowingly collect personal information from them. If we discover that we have inadvertently collected data from a child, we will delete it promptly.</p><h2>8. Changes to This Policy</h2><p>We may update this Privacy Policy from time to time. The revised policy will be effective immediately upon posting. Please review it periodically.</p><h2>9. Contact Us</h2><p>If you have any questions about this Privacy Policy or our data practices, please contact us at:</p><ul><li><strong>Email:</strong> [Insert Email Address]</li><li><strong>Address:</strong> [Insert Physical Address]</li></ul>', NULL, '2024-12-12 12:50:20', '2024-12-14 04:58:09'),
(15, 15, 1, 'Terms And Conditions', '<h1><span style=\"font-size:24px;\">Terms and Conditions</span></h1><p>Effective Date: 14-12-2024</p><p>Welcome to Gamers Arena! These Terms and Conditions (\"Terms\") govern your use of our website and services. By accessing or using Gamers Arena, you agree to be bound by these Terms. If you do not agree, please refrain from using our platform.</p><h2><span style=\"font-size:18px;\">1. Acceptance of Terms</span></h2><p>By accessing Gamers Arena, you:</p><ul><li>Confirm that you have read, understood, and agree to these Terms.</li><li>Agree to comply with all applicable laws and regulations.</li><li>Understand that these Terms constitute a legally binding agreement.</li></ul><h2><span style=\"font-size:18px;\">2. Eligibility</span></h2><p>To use Gamers Arena, you must:</p><ul><li>Be at least 13 years old. If you are under 18, you must have parental or guardian consent.</li><li>Ensure that your use of the platform does not violate any laws applicable to you.</li></ul><h2><span style=\"font-size:18px;\">3. User Accounts</span></h2><h3><span style=\"font-size:18px;\">a. Account Creation</span></h3><p>You may need to register for an account to access certain features. You agree to:</p><ul><li>Provide accurate and truthful information.</li><li>Keep your login credentials secure and confidential.</li></ul><h3><span style=\"font-size:18px;\">b. Account Suspension or Termination</span></h3><p>We reserve the right to suspend or terminate your account for:</p><ul><li>Breach of these Terms.</li><li>Engaging in prohibited activities.</li><li>Providing false information during registration.</li></ul><h2><span style=\"font-size:18px;\">4. Use of Services</span></h2><p>You agree to use Gamers Arena for lawful purposes only. You are prohibited from:</p><ul><li>Uploading harmful, offensive, or illegal content.</li><li>Attempting to disrupt the functionality of the platform.</li><li>Impersonating other users or entities.</li><li>Engaging in spamming, phishing, or other fraudulent activities.</li></ul><h2><span style=\"font-size:18px;\">5. Intellectual Property</span></h2><ul><li>All content, trademarks, and materials on Gamers Arena are owned by or licensed to us.</li><li>You may not reproduce, distribute, or modify our content without prior written permission.</li><li>Any content you submit (e.g., comments or posts) grants us a non-exclusive, royalty-free license to use it.</li></ul><h2><span style=\"font-size:18px;\">6. Purchases and Payments</span></h2><p>If you make purchases on Gamers Arena, you agree to:</p><ul><li>Provide valid and up-to-date payment information.</li><li>Abide by any specific terms related to transactions.</li><li>Accept that all purchases are subject to our refund policy.</li></ul><h2><span style=\"font-size:18px;\">7. Content and Community Guidelines</span></h2><p>You agree that:</p><ul><li>Any content you post or share does not violate third-party rights, laws, or our guidelines.</li><li>We reserve the right to remove or edit content deemed inappropriate or in violation of these Terms.</li></ul><h2><span style=\"font-size:18px;\">8. Limitation of Liability</span></h2><p>To the maximum extent permitted by law:</p><ul><li>Gamers Arena is provided \"as is\" without warranties of any kind.</li><li>We are not liable for any damages, including loss of data, revenue, or opportunities arising from your use of our platform.</li></ul><h2><span style=\"font-size:18px;\">9. Privacy Policy</span></h2><p>Your use of Gamers Arena is also governed by our <a href=\"#\">Privacy Policy</a>, which explains how we collect, use, and protect your data.</p><h2><span style=\"font-size:18px;\">10. Modifications to Terms</span></h2><p>We may update these Terms periodically. By continuing to use the platform after updates, you accept the revised Terms.</p><h2><span style=\"font-size:18px;\">11. Governing Law</span></h2><p>These Terms are governed by the laws of [Your Country/Region]. Any disputes will be resolved exclusively in the courts of [Your Jurisdiction].</p><h2><span style=\"font-size:18px;\">12. Contact Information</span></h2><p>If you have questions or concerns regarding these Terms, please contact us at:</p><ul><li><strong>Email:</strong> [Insert Email Address]</li><li><strong>Address:</strong> [Insert Physical Address]</li></ul>', NULL, '2024-12-14 04:46:17', '2024-12-14 04:59:43'),
(16, 16, 1, 'Developer', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[dark_docx]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"dark_docx\"]', '2024-12-15 12:08:09', '2024-12-15 12:08:09'),
(17, 18, 1, 'Cards', NULL, NULL, '2024-12-18 11:27:47', '2024-12-18 11:27:47'),
(18, 19, 1, 'Top Up', NULL, NULL, '2024-12-18 11:27:59', '2024-12-18 11:27:59'),
(19, 20, 1, 'Cookie Policy', '<p><span style=\"font-weight:bolder;\"><span style=\"font-size:24px;\">Cookie Policy for Gemars Haven</span></span></p><p>Last Updated: 21-12-2024</p><h3>1. Introduction</h3><p><span style=\"font-size:14px;\"><b>Gemars Haven</b></span>(\"we\", \"us\", or \"our\") uses cookies and similar tracking technologies on our website [<a href=\"http://www.adzilla.com/\">www.gamers.com</a>] (\"Site\"). This Cookie Policy explains what cookies are, how we use them, the types of cookies we use, and your choices regarding cookies.</p><p>By using our Site, you agree to the use of cookies as outlined in this policy. If you do not agree, you may disable cookies through your browser settings.</p><h3>2. What are Cookies?</h3><p>Cookies are small text files stored on your device (computer, tablet, or mobile) by your web browser. They help websites remember information about your visit, such as your preferences and other settings, so that your next visit can be more efficient and personalized.</p><h3>3. How We Use Cookies</h3><p>We use cookies to:</p><ul><li><span style=\"font-weight:bolder;\">Enhance User Experience</span>: Remember your preferences and settings.</li><li><span style=\"font-weight:bolder;\">Analytics</span>: Collect information about how visitors use our Site to improve its functionality.</li><li><span style=\"font-weight:bolder;\">Advertising</span>: Deliver personalized ads based on your interests and browsing behavior.</li><li><span style=\"font-weight:bolder;\">Security and Authentication</span>: Ensure the security of our Site and verify your login credentials.</li></ul><h3>4. Types of Cookies We Use</h3><p>We use both <span style=\"font-weight:bolder;\">session cookies</span> (which expire when you close your browser) and <span style=\"font-weight:bolder;\">persistent cookies</span> (which remain on your device for a set period or until you delete them). The types of cookies we may use include:</p><ul><li><span style=\"font-weight:bolder;\">Essential Cookies</span>: Necessary for the Site to function properly (e.g., enabling navigation and access to secure areas).</li><li><span style=\"font-weight:bolder;\">Performance Cookies</span>: Collect information about how visitors interact with our Site (e.g., pages visited, time spent, and errors encountered).</li><li><span style=\"font-weight:bolder;\">Functionality Cookies</span>: Remember your choices (e.g., language preferences) to provide a more personalized experience.</li><li><span style=\"font-weight:bolder;\">Targeting/Advertising Cookies</span>: Track your online activity to help deliver relevant advertisements or limit the number of times you see an ad.</li></ul><h3>5. Third-Party Cookies</h3><p>We may allow third-party service providers to place cookies on your device for advertising, analytics, and other purposes. These third parties may use cookies to collect information about your online activities across different websites.</p><p>Some of our key third-party providers include:</p><ul><li><span style=\"font-weight:bolder;\">Google Analytics</span></li><li><span style=\"font-weight:bolder;\">Facebook Pixel</span></li><li><span style=\"font-weight:bolder;\">DoubleClick</span></li></ul><p>Please review their respective privacy policies for more details on how they use your data.</p><h3>6. Your Choices Regarding Cookies</h3><p>You have the following options to manage cookies:</p><ul><li><span style=\"font-weight:bolder;\">Browser Settings</span>: You can set your browser to refuse cookies or alert you when cookies are being sent. However, some features of our Site may not function properly without cookies.</li><li><span style=\"font-weight:bolder;\">Opt-Out Tools</span>: You can opt-out of targeted advertising through tools like the <a>Network Advertising Initiative</a> or <a href=\"https://www.youronlinechoices.com/\">Your Online Choices</a>.</li></ul><h3>7. Changes to this Cookie Policy</h3><p>We may update this Cookie Policy from time to time. Any changes will be posted on this page with an updated \"Last Updated\" date. Your continued use of our Site after changes have been made signifies your acceptance of the revised policy.</p><h3>8. Contact Us</h3><p>If you have any questions or concerns about our use of cookies, please contact us at:</p><p><span style=\"font-weight:bolder;\">Gamers Haven Support Team</span><br>Email: <a>support@gamersHaven.com</a><br>Phone: [Your Phone Number]<br>Address: [Your Company Address]</p>', NULL, '2024-12-21 10:35:04', '2024-12-21 10:35:04'),
(20, 21, 1, 'Cookie Policy', '<p><span style=\"font-weight:bolder;\"><span style=\"font-size:24px;\">Cookie Policy for Gemars Haven</span></span></p><p>Last Updated: 21-12-2024</p><h3>1. Introduction</h3><p><span style=\"font-weight:bolder;\">Gemars Haven</span>(\"we\", \"us\", or \"our\") uses cookies and similar tracking technologies on our website [<a href=\"http://www.adzilla.com/\">www.gamers.com</a>] (\"Site\"). This Cookie Policy explains what cookies are, how we use them, the types of cookies we use, and your choices regarding cookies.</p><p>By using our Site, you agree to the use of cookies as outlined in this policy. If you do not agree, you may disable cookies through your browser settings.</p><h3>2. What are Cookies?</h3><p>Cookies are small text files stored on your device (computer, tablet, or mobile) by your web browser. They help websites remember information about your visit, such as your preferences and other settings, so that your next visit can be more efficient and personalized.</p><h3>3. How We Use Cookies</h3><p>We use cookies to:</p><ul><li><span style=\"font-weight:bolder;\">Enhance User Experience</span>: Remember your preferences and settings.</li><li><span style=\"font-weight:bolder;\">Analytics</span>: Collect information about how visitors use our Site to improve its functionality.</li><li><span style=\"font-weight:bolder;\">Advertising</span>: Deliver personalized ads based on your interests and browsing behavior.</li><li><span style=\"font-weight:bolder;\">Security and Authentication</span>: Ensure the security of our Site and verify your login credentials.</li></ul><h3>4. Types of Cookies We Use</h3><p>We use both <span style=\"font-weight:bolder;\">session cookies</span> (which expire when you close your browser) and <span style=\"font-weight:bolder;\">persistent cookies</span> (which remain on your device for a set period or until you delete them). The types of cookies we may use include:</p><ul><li><span style=\"font-weight:bolder;\">Essential Cookies</span>: Necessary for the Site to function properly (e.g., enabling navigation and access to secure areas).</li><li><span style=\"font-weight:bolder;\">Performance Cookies</span>: Collect information about how visitors interact with our Site (e.g., pages visited, time spent, and errors encountered).</li><li><span style=\"font-weight:bolder;\">Functionality Cookies</span>: Remember your choices (e.g., language preferences) to provide a more personalized experience.</li><li><span style=\"font-weight:bolder;\">Targeting/Advertising Cookies</span>: Track your online activity to help deliver relevant advertisements or limit the number of times you see an ad.</li></ul><h3>5. Third-Party Cookies</h3><p>We may allow third-party service providers to place cookies on your device for advertising, analytics, and other purposes. These third parties may use cookies to collect information about your online activities across different websites.</p><p>Some of our key third-party providers include:</p><ul><li><span style=\"font-weight:bolder;\">Google Analytics</span></li><li><span style=\"font-weight:bolder;\">Facebook Pixel</span></li><li><span style=\"font-weight:bolder;\">DoubleClick</span></li></ul><p>Please review their respective privacy policies for more details on how they use your data.</p><h3>6. Your Choices Regarding Cookies</h3><p>You have the following options to manage cookies:</p><ul><li><span style=\"font-weight:bolder;\">Browser Settings</span>: You can set your browser to refuse cookies or alert you when cookies are being sent. However, some features of our Site may not function properly without cookies.</li><li><span style=\"font-weight:bolder;\">Opt-Out Tools</span>: You can opt-out of targeted advertising through tools like the <a>Network Advertising Initiative</a> or <a href=\"https://www.youronlinechoices.com/\">Your Online Choices</a>.</li></ul><h3>7. Changes to this Cookie Policy</h3><p>We may update this Cookie Policy from time to time. Any changes will be posted on this page with an updated \"Last Updated\" date. Your continued use of our Site after changes have been made signifies your acceptance of the revised policy.</p><h3>8. Contact Us</h3><p>If you have any questions or concerns about our use of cookies, please contact us at:</p><p><span style=\"font-weight:bolder;\">Gamers Haven Support Team</span><br>Email: <a>support@gamersHaven.com</a><br>Phone: [Your Phone Number]<br>Address: [Your Company Address]</p>', NULL, '2024-12-21 11:08:53', '2024-12-21 11:08:53'),
(21, 23, 1, 'Buy ID', NULL, NULL, '2024-12-29 07:11:28', '2024-12-29 10:29:25'),
(22, 22, 1, 'Buy ID', NULL, NULL, '2024-12-29 10:29:09', '2024-12-29 10:29:09'),
(43, 25, 1, 'Google', NULL, NULL, '2025-01-06 12:16:59', '2025-01-06 12:16:59'),
(44, 26, 1, 'Google', NULL, NULL, '2025-01-06 12:22:49', '2025-01-06 12:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `payout_method_id` int(10) UNSIGNED DEFAULT NULL,
  `payout_currency_code` varchar(50) DEFAULT NULL,
  `amount` decimal(18,8) DEFAULT 0.00000000,
  `charge` decimal(18,8) DEFAULT 0.00000000,
  `net_amount` decimal(18,8) DEFAULT 0.00000000,
  `amount_in_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge_in_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `net_amount_in_base_currency` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `response_id` varchar(255) DEFAULT NULL,
  `last_error` varchar(255) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `meta_field` varchar(255) NOT NULL COMMENT 'for fullerwave',
  `feedback` text DEFAULT NULL,
  `trx_id` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '0=> pending, 1=> generated, 2=>success 3=> cancel,',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payouts`
--

INSERT INTO `payouts` (`id`, `user_id`, `payout_method_id`, `payout_currency_code`, `amount`, `charge`, `net_amount`, `amount_in_base_currency`, `charge_in_base_currency`, `net_amount_in_base_currency`, `response_id`, `last_error`, `information`, `meta_field`, `feedback`, `trx_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'IDR', 200000.00000000, 9000.00000000, 209000.00000000, 200000.00000000, 9000.00000000, 209000.00000000, NULL, NULL, NULL, '', NULL, 'P338500487441', 0, '2025-12-07 15:38:03', '2025-12-07 15:38:03');

-- --------------------------------------------------------

--
-- Table structure for table `payout_methods`
--

CREATE TABLE `payout_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bank_name` text DEFAULT NULL COMMENT 'automatic payment for bank name',
  `banks` text DEFAULT NULL COMMENT 'admin bank permission',
  `parameters` text DEFAULT NULL COMMENT 'api parameters',
  `extra_parameters` text DEFAULT NULL,
  `inputForm` text DEFAULT NULL,
  `currency_lists` text DEFAULT NULL,
  `supported_currency` text DEFAULT NULL,
  `payout_currencies` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `is_automatic` tinyint(4) NOT NULL DEFAULT 0,
  `is_sandbox` tinyint(4) NOT NULL DEFAULT 0,
  `environment` enum('test','live') NOT NULL DEFAULT 'live',
  `confirm_payout` tinyint(1) NOT NULL DEFAULT 1,
  `is_auto_update` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'currency rate auto update',
  `currency_type` tinyint(1) NOT NULL DEFAULT 1,
  `logo` varchar(255) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_methods`
--

INSERT INTO `payout_methods` (`id`, `name`, `code`, `description`, `bank_name`, `banks`, `parameters`, `extra_parameters`, `inputForm`, `currency_lists`, `supported_currency`, `payout_currencies`, `is_active`, `is_automatic`, `is_sandbox`, `environment`, `confirm_payout`, `is_auto_update`, `currency_type`, `logo`, `driver`, `created_at`, `updated_at`) VALUES
(2, 'Wire Transfer', 'paypal-manual', 'Payment will receive within 9 hours', NULL, NULL, '[]', NULL, '{\"account_name\":{\"field_name\":\"account_name\",\"field_label\":\"Account Name\",\"type\":\"text\",\"validation\":\"required\"},\"account_details\":{\"field_name\":\"account_details\",\"field_label\":\"Account Details\",\"type\":\"textarea\",\"validation\":\"required\"},\"n_i_d\":{\"field_name\":\"n_i_d\",\"field_label\":\"NID\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, '[\"EUR\",\"CAD\"]', '[{\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.93\",\"min_limit\":\"1\",\"max_limit\":\"10000000\",\"percentage_charge\":\"1\",\"fixed_charge\":\"0.5\"},{\"currency_symbol\":\"CAD\",\"conversion_rate\":\"1.13\",\"min_limit\":\"1\",\"max_limit\":\"10000000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 0, 0, 'test', 1, 0, 1, 'payoutMethod/XBBAl0sufa0cCQNvbigsJYuYrvtQ7J.webp', 'local', '2020-12-23 13:40:51', '2025-12-05 16:19:04'),
(3, 'Bank', 'bank', 'Payment will receive within 8 days', NULL, NULL, '[]', NULL, '{\"account_number\":{\"field_name\":\"account_number\",\"field_label\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"account_name\":{\"field_name\":\"account_name\",\"field_label\":\"Account Name\",\"type\":\"text\",\"validation\":\"required\"}}', NULL, '[\"IDR\"]', '[{\"currency_symbol\":\"IDR\",\"conversion_rate\":\"1\",\"min_limit\":\"0.01\",\"max_limit\":\"99999999999999999999\",\"percentage_charge\":\"2\",\"fixed_charge\":\"5000\"}]', 1, 0, 0, 'test', 1, 0, 1, 'payoutMethod/GfDP920pCPR2aXBQHEzwMxwUOCeOXf.webp', 'local', '2020-12-27 13:23:36', '2025-12-07 15:37:34'),
(9, 'Flutterwave', 'flutterwave', 'Payment will receive within 1 days', '{\"0\":{\"NGN BANK\":\"NGN BANK\",\"NGN DOM\":\"NGN DOM\",\"GHS BANK\":\"GHS BANK\",\"KES BANK\":\"KES BANK\",\"ZAR BANK\":\"ZAR BANK\",\"INTL EUR & GBP\":\"INTL EUR & GBP\",\"INTL USD\":\"INTL USD\",\"INTL OTHERS\":\"INTL OTHERS\",\"FRANCOPGONE\":\"FRANCOPGONE\",\"XAF/XOF MOMO\":\"XAF/XOF MOMO\",\"mPesa\":\"mPesa\",\"Rwanda Momo\":\"Rwanda Momo\",\"Uganda Momo\":\"Uganda Momo\",\"Zambia Momo\":\"Zambia Momo\",\"Barter\":\"Barter\",\"FLW\":\"FLW\"}}', '[\"NGN BANK\",\"NGN DOM\",\"GHS BANK\"]', '{\"Public_Key\":\"FLWPUBK_TEST-5003321b93b251536fd2e7e05232004f-X\",\"Secret_Key\":\"FLWSECK_TEST-d604361e2d4962f4bb2a400c5afefab1-X\",\"Encryption_Key\":\"FLWSECK_TEST817a365e142b\"}', NULL, '[]', '{\"USD\":\"USD\",\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}', '[\"USD\",\"NGN\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0081\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"12.64\",\"min_limit\":\"10\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.2\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/iHzqdwIH1o7bRg7sv3FpD0z9iSYvo9.webp', 'local', '2020-12-27 13:23:36', '2025-12-05 16:18:40'),
(10, 'Razorpay', 'razorpay', 'Payment will receive within 1 days', '', NULL, '{\"account_number\":\"7878780080316316\",\"Key_Id\":\"rzp_test_kiOtejPbRZU90E\",\"Key_Secret\":\"osRDebzEqbsE1kbyQJ4y0re7\"}', '{\"webhook\":\"payoutIpn\"}', '[]', '{\"INR\":\"INR\"}', '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"10\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/LSxqmJA9WXUJlgvBWR7i8yCOjkemgt.webp', 'local', '2020-12-27 13:23:36', '2025-12-05 16:18:43'),
(11, 'Paystack', 'paystack', 'Payment will receive within 1 days', '', NULL, '{\"Public_key\":\"pk_test_60368e68f65e34c4c3076334de0350fdb78c942b\",\"Secret_key\":\"sk_test_afe163363398a752b856d01e2b7be2554d9a2330\"}', '{\"webhook\":\"payoutIpn\"}', '[]', '{\"NGN\":\"NGN\",\"GHS\":\"GHS\",\"ZAR\":\"ZAR\"}', '[\"NGN\",\"GHS\",\"ZAR\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"50\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"GHS\",\"currency_symbol\":\"GHS\",\"conversion_rate\":\"0.11\",\"min_limit\":\"50\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ZAR\",\"currency_symbol\":\"ZAR\",\"conversion_rate\":\"0.17\",\"min_limit\":\"50\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 1, 1, 'payoutMethod/kKfCIKhfxYKsXLEKWDVSCmimJ7Mx9F.webp', 'local', '2020-12-27 13:23:36', '2025-12-05 16:18:45'),
(12, 'Coinbase', 'coinbase', 'Payment will receive within 1 days', '', NULL, '{\"API_Key\":\"5328e8ff2f7fe0bbc7fd6ea593038b08\",\"API_Secret\":\"ACWAncjv2fbMdvPfeJq9U\\/blqEx1FiItqbUGn+kEPCLbKGP4\\/iJlPIQDzMmJHHz\\/Inv1jYANsWDnh3RhHi6HLw==\",\"Api_Passphrase\":\"23xe3opufifi\"}', '{\"webhook\":\"payoutIpn\"}', '[]', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '[\"BNB\"]', '[{\"name\":\"BNB\",\"currency_symbol\":\"BNB\",\"conversion_rate\":\"0.068\",\"min_limit\":\"1000\",\"max_limit\":\"1000000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/gWdg971iv032D4oST044YNkV8voAgj.webp', 'local', '2020-12-27 13:23:36', '2025-12-05 16:18:49'),
(14, 'Perfect Money', 'perfectmoney', 'Payment will receive within 1 days', '', NULL, '{\"Passphrase\":\"45P7GN1T8TlRfMRAPCqLArVHz\",\"Account_ID\":\"90016052\",\"Payer_Account\":\"U41722458\"}', '', '[]', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0081\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 0, 1, 0, 'test', 1, 0, 1, 'payoutMethod/QPrYjeUxMX2M7KYNmDGrfmyZkf5QOy.webp', 'local', '2020-12-27 13:23:36', '2025-12-05 16:18:52'),
(15, 'Paypal', 'paypal', 'Payment will receive within 1 days', '', NULL, '{\"cleint_id\":\"AUrvcotEVWZkksiGir6Ih4PyalQcguQgGN-7We5O1wBny3tg1w6srbQzi6GQEO8lP3yJVha2C6lyivK9\",\"secret\":\"EPx-YEgvjKDRFFu3FAsMue_iUMbMH6jHu408rHdn4iGrUCM8M12t7mX8hghUBAWwvWErBOa4Uppfp0Eh\"}', '{\"webhook\":\"payoutIpn\"}', '[]', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}', '[\"EUR\",\"USD\"]', '[{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0081\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 0, 1, 1, 'test', 1, 0, 1, 'payoutMethod/G8L93dajF8y9g1N62Ir7AGlgRLQRyT.webp', 'local', '2020-12-27 13:23:36', '2025-12-05 16:18:55'),
(16, 'Binance', 'binance', 'Payment will receive within 1 days', '', NULL, '{\"API_Key\":\"u7UxJbqJvYKlhygtR0wlC5xOfWWIuNMUHqZrPXkwLC0neRRrC5HHq7CnbdKWacBI\",\"KEY_Secret\":\"5Z00Ecib1MBnGoHs2LxdqPCE4c4UvQ4vZKEweLmySWhvw5jM4BV2nnk0sWL9gNEL\"}', '', '[]', '{\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"XRP\":\"XRP\",\"ETH\":\"ETH\",\"ETH2\":\"ETH2\",\"USDT\":\"USDT\",\"BCH\":\"BCH\",\"LTC\":\"LTC\",\"XMR\":\"XMR\",\"TON\":\"TON\"}', '[\"BNB\"]', '[{\"name\":\"BNB\",\"currency_symbol\":\"BNB\",\"conversion_rate\":\"0.0043\",\"min_limit\":\"10\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 0, 1, 1, 'test', 1, 0, 1, 'payoutMethod/qWemV55N0De5GtPKTxelnysPhKQwuc.webp', 'local', '2020-12-27 13:23:36', '2025-12-05 16:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_contacts`
--

CREATE TABLE `razorpay_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(255) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reviewable_type` varchar(255) NOT NULL,
  `reviewable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive,1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `permission` text NOT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '0=>deactive,1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `user_id`, `name`, `permission`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Owner', '[\"Dashboard\",\"Manage_Staff\",\"Card\",\"Direct_Top_Up\",\"All_Orders\",\"All_Transactions\",\"All_Marketing\",\"Support_Ticket\",\"User_Management\",\"Control_Panel\",\"Payment_Methods\",\"Website_Management\"]', 1, '2025-12-05 05:16:23', '2025-12-05 05:16:29'),
(2, 1, 'HR', '[\"Dashboard\",\"Manage_Staff\",\"Support_Ticket\",\"User_Management\",\"Payment_Methods\"]', 1, '2025-12-05 05:16:58', '2025-12-05 05:18:31'),
(3, 1, 'Staff', '[\"Dashboard\",\"Card\",\"Direct_Top_Up\",\"All_Orders\",\"All_Transactions\",\"All_Marketing\",\"Support_Ticket\"]', 1, '2025-12-05 05:17:29', '2025-12-05 05:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `sell_posts`
--

CREATE TABLE `sell_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `details` longtext NOT NULL,
  `comments` mediumtext NOT NULL,
  `credential` longtext NOT NULL,
  `post_specification_form` text NOT NULL,
  `sell_charge` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'coloum carry percentage value',
  `image` text DEFAULT NULL,
  `image_driver` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0=> not approve, 1=>approve, 2=>Re submission, 3=>hold, 4=>soft Rejected, 5=>hard Rejected\r\n ',
  `lock_for` int(11) DEFAULT NULL COMMENT 'buyer id',
  `lock_at` timestamp NULL DEFAULT NULL,
  `payment_lock` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 1=> payment complete, 2=> Reject, 3 => Pending',
  `payment_uuid` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `meta_robots` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_image_driver` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_post_categories`
--

CREATE TABLE `sell_post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_driver` varchar(20) DEFAULT NULL,
  `form_field` text NOT NULL,
  `post_specification_form` text NOT NULL,
  `sell_charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_post_category_details`
--

CREATE TABLE `sell_post_category_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_post_category_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_post_chats`
--

CREATE TABLE `sell_post_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_post_id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` int(11) NOT NULL,
  `chatable_type` varchar(255) NOT NULL,
  `chatable_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `is_read_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_post_offers`
--

CREATE TABLE `sell_post_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Proposed by\r\n',
  `author_id` int(11) NOT NULL COMMENT 'Post author id',
  `sell_post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>pending, 1=>accept, 2=>reject, 3=>Resubmission\r\n',
  `uuid` varchar(191) DEFAULT NULL,
  `attempt_at` datetime DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_post_payments`
--

CREATE TABLE `sell_post_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'Payment By',
  `sell_post_id` int(11) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'seller will receive amount',
  `admin_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'admin will receive amount',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=> Complete',
  `payment_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=> active, 2=> rejected, 3=> pending',
  `payment_release` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => released, 2 =>Hold',
  `released_at` timestamp NULL DEFAULT NULL COMMENT 'Payment release to user',
  `transaction` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Open, 1 => Answered, 2 => Replied, 3 => Closed	',
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_attachments`
--

CREATE TABLE `support_ticket_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_message_id` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `driver` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_messages`
--

CREATE TABLE `support_ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `top_ups`
--

CREATE TABLE `top_ups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive,1=>active',
  `instant_delivery` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>inactive,1=>active',
  `image` text DEFAULT NULL,
  `order_information` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `guide` longtext DEFAULT NULL,
  `total_review` int(11) NOT NULL DEFAULT 0,
  `avg_rating` float NOT NULL DEFAULT 0,
  `sort_by` int(11) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `meta_robots` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_image_driver` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `top_ups`
--

INSERT INTO `top_ups` (`id`, `category_id`, `name`, `slug`, `region`, `note`, `status`, `instant_delivery`, `image`, `order_information`, `description`, `guide`, `total_review`, `avg_rating`, `sort_by`, `deleted_at`, `created_at`, `updated_at`, `meta_title`, `meta_keywords`, `meta_description`, `og_description`, `meta_robots`, `meta_image`, `meta_image_driver`) VALUES
(1, 2, 'Toram Online', 'toram-online', 'Global', 'Proses Cepat,Layanan Chat 24/7 ,Pembayaran Aman!', 1, 0, '{\"image\":\"top-up\\/GBt4BHrsI8xR7ig3L3A5GOYCgG9K02.webp\",\"image_driver\":\"local\",\"preview\":\"top-up\\/vYm0crEnrzgCLR5Vq8mn2vU3L92ZMi.webp\",\"preview_driver\":\"local\"}', '{\"1\":{\"field_value\":\"Masukan Data\",\"field_name\":\"Masukan_Data\",\"field_placeholder\":\"Masukan IGN\",\"field_note\":\"Harap masukan dengan benar\",\"field_type\":\"text\"}}', '<p>Top up&nbsp;<strong>Toram Online</strong> 100% Legal.aman, cepat, dan Terpercaya! banyak pilihan produk dan metode pembayaran terlengkap Hanya di <strong>Gamify</strong>.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Harap Dibaca Sebelum Order :</strong></p>\r\n<p>Pesanan Diproses Manual Pukul 12.00 - 00.00 WIB / Jam ONLINE<br>Jika Ingin Order Via WhatsApp Silahkan Hubungi Admin<strong>&nbsp;</strong><a href=\"https://wa.me/6283807914090\" target=\"_blank\" rel=\"noopener\"><strong>083807914090</strong></a></p>', '<p>Cara topup:<br>1) Masukkan Data Akun<br>2) Pilih Nominal<br>3) Tentukan Jumlah Pembelian<br>4) Pilih Pembayaran<br>5) Masukkan Kode Promo (jika ada)<br>6) Isi Detail Kontak<br>7) Klik Pesan Sekarang dan lakukan Pembayaran<br>8) Selesai</p>', 0, 0, 1, NULL, '2025-04-01 12:57:50', '2025-12-05 13:28:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 4, 'Robux Roblox', 'robux-roblox', 'Global', 'Proses Cepat,Layanan Chat 24/7 ,Pembayaran Aman!', 1, 0, '{\"image\":\"top-up\\/zfdLuRtLukoDGlCl7WgAlredfgLF5S.webp\",\"image_driver\":\"local\",\"preview\":\"top-up\\/a5rc1GRKgoqMf7s1Tob0zCXE8c7uyF.webp\",\"preview_driver\":\"local\"}', '{\"1\":{\"field_value\":\"Enter Your Nickname\",\"field_name\":\"Enter_Your_Nickname\",\"field_placeholder\":\"your nickname\",\"field_note\":\"\",\"field_type\":\"text\"}}', '<p>Top up <strong>Robux</strong>100% Legal.aman, cepat, dan Terpercaya! banyak pilihan produk dan metode pembayaran terlengkap Hanya di <strong>Gamify</strong>.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Harap Dibaca Sebelum Order :</strong></p>\r\n<p>Pesanan Diproses Manual Pukul 12.00 - 00.00 WIB / Jam ONLINE<br>Jika Ingin Order Via WhatsApp Silahkan Hubungi Admin<strong>&nbsp;</strong><a href=\"https://wa.me/6283807914090\" target=\"_blank\" rel=\"noopener\"><strong>083807914090</strong></a></p>', '<p>Cara topup:<br>1) Masukkan Data Akun<br>2) Pilih Nominal<br>3) Tentukan Jumlah Pembelian<br>4) Pilih Pembayaran<br>5) Masukkan Kode Promo (jika ada)<br>6) Isi Detail Kontak<br>7) Klik Pesan Sekarang dan lakukan Pembayaran<br>8) Selesai</p>', 0, 0, 1, NULL, '2025-05-28 08:39:25', '2025-12-05 13:29:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 13, 'Mobile Legends Diamonds', 'mobile-legends-diamonds', 'Global', 'Mohon pastikan akun berasal dari Indonesia.', 1, 0, '{\"image\":\"top-up\\/ROHluMi9jK9eMe0ypkBEyp8ZbgwwH9.webp\",\"image_driver\":\"local\",\"preview\":\"top-up\\/WQ7FdrXYoq8MOFEsY4uAJvnyrs7hVJ.webp\",\"preview_driver\":\"local\"}', '{\"1\":{\"field_value\":\"User ID\",\"field_name\":\"User_Id\",\"field_placeholder\":\"Masukan user id\",\"field_note\":\"\",\"field_type\":\"text\"},\"2\":{\"field_value\":\"ZONE ID\",\"field_name\":\"Zone_Id\",\"field_placeholder\":\"Masukan zona\",\"field_note\":\"\",\"field_type\":\"text\"}}', '<p>Top up <strong>Mobile Legends: Bang Bang</strong><strong>&nbsp;</strong>100% Legal.aman, cepat, dan Terpercaya! banyak pilihan produk dan metode pembayaran terlengkap Hanya di <strong>Gamify</strong>.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Harap Dibaca Sebelum Order :</strong></p>\r\n<p>Pesanan Diproses Manual Pukul 12.00 - 00.00 WIB / Jam ONLINE<br>Jika Ingin Order Via WhatsApp Silahkan Hubungi Admin<strong>&nbsp;</strong><a href=\"https://wa.me/6283807914090\" target=\"_blank\" rel=\"noopener\"><strong>083807914090</strong></a></p>', '<p>Cara topup:<br>1) Masukkan Data Akun<br>2) Pilih Nominal<br>3) Tentukan Jumlah Pembelian<br>4) Pilih Pembayaran<br>5) Masukkan Kode Promo (jika ada)<br>6) Isi Detail Kontak<br>7) Klik Pesan Sekarang dan lakukan Pembayaran<br>8) Selesai</p>', 0, 0, 1, NULL, '2025-12-05 13:21:35', '2025-12-05 13:31:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 11, 'Free Fire', 'free-fire', 'Global', 'Top Up Free Fire Diamonds', 1, 0, '{\"image\":\"top-up\\/QH2GCespQgRrBKskytUJkFz9gwvv6t.webp\",\"image_driver\":\"local\",\"preview\":\"top-up\\/cEJ6TW812ZjHrFLYwyfSb4GrNMJWzV.webp\",\"preview_driver\":\"local\"}', '{\"1\":{\"field_value\":\"User ID\",\"field_name\":\"User_Id\",\"field_placeholder\":\"Masukan User ID\",\"field_note\":\"\",\"field_type\":\"text\"}}', '<p>Top up <strong>Free Fire</strong><strong>&nbsp;</strong>100% Legal.aman, cepat, dan Terpercaya! banyak pilihan produk dan metode pembayaran terlengkap Hanya di <strong>Gamify</strong>.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Harap Dibaca Sebelum Order :</strong></p>\r\n<p>Pesanan Diproses Manual Pukul 12.00 - 00.00 WIB / Jam ONLINE<br>Jika Ingin Order Via WhatsApp Silahkan Hubungi Admin<strong>&nbsp;</strong><a href=\"https://wa.me/6283807914090\" target=\"_blank\" rel=\"noopener\"><strong>083807914090</strong></a></p>', '<p>Cara topup:<br>1) Masukkan Data Akun<br>2) Pilih Nominal<br>3) Tentukan Jumlah Pembelian<br>4) Pilih Pembayaran<br>5) Masukkan Kode Promo (jika ada)<br>6) Isi Detail Kontak<br>7) Klik Pesan Sekarang dan lakukan Pembayaran<br>8) Selesai</p>', 0, 0, 1, NULL, '2025-12-05 13:32:02', '2025-12-05 13:32:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 2, 'Genshin Impact', 'genshin-impact', 'Global', 'Top Up Genshin Impact Genesis Crystals', 0, 0, '{\"image\":\"top-up\\/HL7pafHe638fzUbQDAKr1o9dCNpmGf.webp\",\"image_driver\":\"local\",\"preview\":\"top-up\\/W56QadguGCoF2ZmizHfQEtNkCr4Poy.webp\",\"preview_driver\":\"local\"}', '{\"1\":{\"field_value\":\"UID\",\"field_name\":\"Uid\",\"field_placeholder\":\"Masukan UID\",\"field_note\":\"\",\"field_type\":\"text\"},\"2\":{\"field_value\":\"Server\",\"field_name\":\"Server\",\"field_placeholder\":\"Choose Server\",\"field_note\":\"\",\"field_type\":\"select\",\"option\":{\"America\":\"America\",\"Asia\":\"Asia\",\"Europe\":\"Europe\",\"TW_HK_MO\":\"TW_HK_MO\"}}}', '<p>Top up <strong>Genshin Impact</strong><strong>&nbsp;</strong>100% Legal.aman, cepat, dan Terpercaya! banyak pilihan produk dan metode pembayaran terlengkap Hanya di <strong>Gamify</strong>.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Harap Dibaca Sebelum Order :</strong></p>\r\n<p>Pesanan Diproses Manual Pukul 12.00 - 00.00 WIB / Jam ONLINE<br>Jika Ingin Order Via WhatsApp Silahkan Hubungi Admin<strong>&nbsp;</strong><a href=\"https://wa.me/6283807914090\" target=\"_blank\" rel=\"noopener\"><strong>083807914090</strong></a></p>', '<p>Cara topup:<br>1) Masukkan Data Akun<br>2) Pilih Nominal<br>3) Tentukan Jumlah Pembelian<br>4) Pilih Pembayaran<br>5) Masukkan Kode Promo (jika ada)<br>6) Isi Detail Kontak<br>7) Klik Pesan Sekarang dan lakukan Pembayaran<br>8) Selesai</p>', 0, 0, 1, NULL, '2025-12-05 13:40:11', '2025-12-05 13:40:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2, 'Zenless Zone Zero', 'zenless-zone-zero', 'Global', 'Top Up Zenless Zone Zero Murah, Aman, Cepat, dan Terpercaya', 0, 0, '{\"image\":\"top-up\\/h0ORjZNY02D3j5LK3pAaaWRyWgzOLX.webp\",\"image_driver\":\"local\",\"preview\":\"top-up\\/2Ayljuy1WYKjRZycnPD6mkymKmoZr3.webp\",\"preview_driver\":\"local\"}', '{\"1\":{\"field_value\":\"UID\",\"field_name\":\"Uid\",\"field_placeholder\":\"User ID\",\"field_note\":\"\",\"field_type\":\"text\"},\"2\":{\"field_value\":\"Server\",\"field_name\":\"Server\",\"field_placeholder\":\"Choose Server\",\"field_note\":\"\",\"field_type\":\"select\",\"option\":{\"America\":\"America\",\"Asia\":\"Asia\",\"Europe\":\"Europe\",\"TW_HK_MO\":\"TW_HK_MO\"}}}', '<p>Top up <strong>Zenless Zone Zero&nbsp;</strong>100% Legal.aman, cepat, dan Terpercaya! banyak pilihan produk dan metode pembayaran terlengkap Hanya di <strong>Gamify</strong>.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Harap Dibaca Sebelum Order :</strong></p>\r\n<p>Pesanan Diproses Manual Pukul 12.00 - 00.00 WIB / Jam ONLINE<br>Jika Ingin Order Via WhatsApp Silahkan Hubungi Admin<strong>&nbsp;</strong><a href=\"https://wa.me/6283807914090\" target=\"_blank\" rel=\"noopener\"><strong>083807914090</strong></a></p>', '<p>Cara topup:<br>1) Masukkan Data Akun<br>2) Pilih Nominal<br>3) Tentukan Jumlah Pembelian<br>4) Pilih Pembayaran<br>5) Masukkan Kode Promo (jika ada)<br>6) Isi Detail Kontak<br>7) Klik Pesan Sekarang dan lakukan Pembayaran<br>8) Selesai</p>', 0, 0, 1, NULL, '2025-12-05 13:43:11', '2025-12-05 13:43:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 2, 'Honkai: Star Rail', 'honkai-star-rail', 'Global', 'Top Up Honkai: Star Rail Shard Murah, Aman, Cepat, dan Terpercaya', 0, 0, '{\"image\":\"top-up\\/JwAzu40WkyUI0af8msDr3HnDosGT5J.webp\",\"image_driver\":\"local\",\"preview\":\"top-up\\/xxpF4A4p1wVV08zFvqbNyHw620OLV0.webp\",\"preview_driver\":\"local\"}', '{\"1\":{\"field_value\":\"UID\",\"field_name\":\"Uid\",\"field_placeholder\":\"User ID\",\"field_note\":\"\",\"field_type\":\"text\"},\"2\":{\"field_value\":\"Server\",\"field_name\":\"Server\",\"field_placeholder\":\"Choose Server\",\"field_note\":\"\",\"field_type\":\"select\",\"option\":{\"America\":\"America\",\"Asia\":\"Asia\",\"Europe\":\"Europe\",\"TW_HK_MO\":\"TW_HK_MO\"}}}', '<p>Top up <strong>Honkai: Star Rail&nbsp;</strong>100% Legal.aman, cepat, dan Terpercaya! banyak pilihan produk dan metode pembayaran terlengkap Hanya di <strong>Gamify</strong>.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Harap Dibaca Sebelum Order :</strong></p>\r\n<p>Pesanan Diproses Manual Pukul 12.00 - 00.00 WIB / Jam ONLINE<br>Jika Ingin Order Via WhatsApp Silahkan Hubungi Admin<strong>&nbsp;</strong><a href=\"https://wa.me/6283807914090\" target=\"_blank\" rel=\"noopener\"><strong>083807914090</strong></a></p>', '<p>Cara topup:<br>1) Masukkan Data Akun<br>2) Pilih Nominal<br>3) Tentukan Jumlah Pembelian<br>4) Pilih Pembayaran<br>5) Masukkan Kode Promo (jika ada)<br>6) Isi Detail Kontak<br>7) Klik Pesan Sekarang dan lakukan Pembayaran<br>8) Selesai</p>', 0, 0, 1, NULL, '2025-12-05 13:45:08', '2025-12-05 13:45:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `top_up_services`
--

CREATE TABLE `top_up_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `top_up_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `image_driver` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `discount_type` enum('flat','percentage') NOT NULL DEFAULT 'flat',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>off,1=>on',
  `is_offered` tinyint(1) NOT NULL DEFAULT 0,
  `offered_sell` int(11) NOT NULL DEFAULT 0 COMMENT 'how many sell at the campaign',
  `max_sell` int(11) NOT NULL DEFAULT 0 COMMENT 'max limit of sell in campaign',
  `sort_by` int(11) NOT NULL DEFAULT 1,
  `old_data` text DEFAULT NULL,
  `campaign_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `top_up_services`
--

INSERT INTO `top_up_services` (`id`, `top_up_id`, `name`, `image`, `image_driver`, `price`, `discount`, `discount_type`, `status`, `is_offered`, `offered_sell`, `max_sell`, `sort_by`, `old_data`, `campaign_data`, `created_at`, `updated_at`) VALUES
(1, 1, '1 + 2 Orb', 'top-up-service/IxQD1FMG178tQI4yW4q6dACjmzNKSb.webp', 'local', 16000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-04-12 09:17:14', '2025-04-12 09:17:14'),
(2, 1, '6 + 4 Orb', 'top-up-service/JjMMNAkGECjAAMBQ4Q7yhsEFGsHeBQ.webp', 'local', 65000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-04-12 09:17:37', '2025-04-12 09:17:49'),
(3, 1, '17 + 5 Orb', 'top-up-service/9HZQbmh9RPLKFPEzIxCPMJAijRFwgx.webp', 'local', 120000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-04-12 09:18:18', '2025-04-12 09:24:52'),
(4, 1, '26 + 4 Orb', 'top-up-service/RXG8Hk1t9eStPoB9VzbyvZXXRae3pU.webp', 'local', 170000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-04-12 09:24:39', '2025-04-12 09:24:39'),
(5, 1, '40 + 5 Orb', 'top-up-service/m4ejM90ES5vI0Gd2J6ZRfPAEYxGa4O.webp', 'local', 250000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-04-12 09:25:14', '2025-04-12 09:25:14'),
(6, 1, '50 + 10 Orb', 'top-up-service/NMsKPa961JrWGN3dq7GGS3TIHlCIGQ.webp', 'local', 400000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-04-12 09:25:42', '2025-04-12 09:25:42'),
(7, 1, '152 + 8 Orb', 'top-up-service/qDEosCRmO5t8I95XeefwwteQzOwJZD.webp', 'local', 800000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-04-12 09:26:05', '2025-04-12 09:26:05'),
(8, 2, '100 Robux', 'top-up-service/SYFt2vGHlGA0Ju0RQEOhTwcQIafRPh.webp', 'local', 11000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-05-28 08:42:39', '2025-05-28 08:42:49'),
(9, 2, '500 Robux', 'top-up-service/5eWijoXhKk2kFimYBxDUZxpN6oHNBa.webp', 'local', 54000, 0, 'flat', 1, 0, 0, 0, 1, NULL, NULL, '2025-05-28 08:43:17', '2025-05-28 08:43:17'),
(10, 2, '1000 Robux', 'top-up-service/pdEycC13PdMbjNnckB2vbjDtazofPH.webp', 'local', 110000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-05-28 08:43:43', '2025-05-28 08:43:43'),
(11, 2, '5000 Robux', 'top-up-service/84uCEzRD6OJdRBLrVl5C0erzo9gprb.webp', 'local', 550000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-05-28 08:44:05', '2025-05-28 08:44:05'),
(12, 3, 'Ponsel', 'top-up-service/AneEFT06H7rdhEsB0LZHd4eHm9knsW.webp', 'local', 55000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-05-28 08:48:42', '2025-05-28 08:48:42'),
(13, 3, 'Dasar (360p)', 'top-up-service/DQdebDVjWEZeIiuyXgeOhVLlujdl4n.webp', 'local', 125000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-05-28 08:49:19', '2025-05-28 08:49:19'),
(14, 3, 'Standart (720P)', 'top-up-service/lNwBVVs7V7wlY2sXolhUA0vz3gMjJl.webp', 'local', 155000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-05-28 08:49:37', '2025-05-28 08:50:12'),
(15, 3, 'Premium (4K)', 'top-up-service/XKkSqTF8t1GpwkpBhelHWXAdBWxUGy.webp', 'local', 190000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-05-28 08:49:59', '2025-05-28 08:49:59'),
(16, 4, 'Super Kaget 7GB 14 Hari', 'top-up-service/BJ1y4miEcVQNbsOrHMviM9e6dQineA.webp', 'local', 15000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-11-24 02:16:18', '2025-11-24 02:16:18'),
(17, 4, 'Super Kaget 11 GB 14 Hari', 'top-up-service/HQ4B6XF02rZKzl0Dz2FNZlT3K7Vsek.webp', 'local', 25000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-11-24 02:17:06', '2025-11-24 02:17:06'),
(18, 5, '86 💎', 'top-up-service/M0zU7mDz70uiI6SE9sGrB3cc3ad8xD.webp', 'local', 20000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:24:01', '2025-12-05 13:24:01'),
(19, 5, '172 💎', 'top-up-service/WWY22REl6pTmWXSTGQvRcuxj81XsYi.webp', 'local', 41000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:24:23', '2025-12-05 13:24:23'),
(20, 5, '257 💎', 'top-up-service/ulGD9xl4Fi6i3ZYyfV2VUnV5ulGvZT.webp', 'local', 60000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:24:45', '2025-12-05 13:24:45'),
(21, 5, '344 💎', 'top-up-service/3SqHzGJjDCHkPD5rrvGwsDa4cXJCgI.webp', 'local', 70000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:25:26', '2025-12-05 13:25:26'),
(22, 5, '430 💎', 'top-up-service/txILRPN8RvTzFb1M1ERr6Klq1dyh01.webp', 'local', 88000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:25:50', '2025-12-05 13:25:50'),
(23, 5, '514 💎', 'top-up-service/emSBTjKCNrycbsybmY2dfWYI7ZM8UN.webp', 'local', 105000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:26:13', '2025-12-05 13:26:13'),
(24, 5, '600 💎', 'top-up-service/1fjHFZSUnItoh35u07TERYWBMGMfP6.webp', 'local', 120000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:26:34', '2025-12-05 13:26:34'),
(25, 5, '706 💎', 'top-up-service/Jk0XzuQIsRSd387D1mCGo23ddzrjkn.webp', 'local', 145000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:26:54', '2025-12-05 13:26:54'),
(26, 5, '878 💎', 'top-up-service/q27wnEifNoWSZbkGZGYIq0ms97MH9Z.webp', 'local', 180000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:27:21', '2025-12-05 13:27:21'),
(27, 5, '963 💎', 'top-up-service/hjhIugH2nfH83F06O6Z2zzhVfWNMLf.webp', 'local', 200000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:27:43', '2025-12-05 13:27:43'),
(28, 5, '1050 💎', 'top-up-service/wexiiPK600Uvo93yAkZhZm87eWN4WP.webp', 'local', 215000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:28:12', '2025-12-05 13:28:12'),
(29, 6, '100 💎', 'top-up-service/j6WE4eHIFETL5i5qd6pAAiidoHWdae.webp', 'local', 14500, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:33:11', '2025-12-05 13:33:11'),
(30, 6, '210 💎', 'top-up-service/Ez0tJbo4uvYBymlDrENuHu2W52dv3u.webp', 'local', 28500, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:33:30', '2025-12-05 13:33:30'),
(31, 6, '355 💎', 'top-up-service/Ei1Phb0XJCbDC5MBvtClwLbxBaMUNW.webp', 'local', 47000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:33:46', '2025-12-05 13:33:46'),
(32, 6, '515 💎', 'top-up-service/lHnAL0NdtghIgGRbVB0PbxYPvegTCP.webp', 'local', 69000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:34:05', '2025-12-05 13:34:05'),
(33, 6, '635 💎', 'top-up-service/gntwPjtNUPLQF1DPW3lIKUrUrDIJVz.webp', 'local', 85000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:34:22', '2025-12-05 13:34:22'),
(34, 6, '720 💎', 'top-up-service/vMqhFkDuWuXJmrx3kH650ncIauxjQR.webp', 'local', 94000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:34:38', '2025-12-05 13:34:38'),
(35, 6, '860 💎', 'top-up-service/sp6EAwsAHogrRhWpD4e077UjVCNbhv.webp', 'local', 113000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:34:55', '2025-12-05 13:34:55'),
(36, 6, '1075 💎', 'top-up-service/zWSIkO2kIuEIhBkavrNGpM7DIw29lg.webp', 'local', 141000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:35:11', '2025-12-05 13:35:11'),
(37, 6, '1440 💎', 'top-up-service/ZIbe9C1nxY1jfi2RtUJQ6QQifFCbcY.webp', 'local', 188000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:35:46', '2025-12-05 13:35:46'),
(38, 6, '2000 💎', 'top-up-service/q5bNiQ4xwQYdu9ZoIYOoSTz8FrDZeN.webp', 'local', 257000, 0, 'percentage', 1, 0, 0, 0, 1, NULL, NULL, '2025-12-05 13:36:01', '2025-12-05 13:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transactional_id` int(11) DEFAULT NULL,
  `transactional_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount_in_base` double DEFAULT 0,
  `trx_type` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `trx_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transactional_id`, `transactional_type`, `user_id`, `amount_in_base`, `trx_type`, `remarks`, `trx_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'App\\Models\\Order', 1, 400000, '-', 'Payment For Direct Top Up Via Bank Transfer', 'WZDVBE6AEZ46', '2025-04-12 10:00:02', '2025-04-12 10:00:02'),
(2, 3, 'App\\Models\\Order', 1, 550000, '-', 'Payment For Direct Top Up Via Bank Transfer', '87FBV3MX88MS', '2025-05-28 08:59:37', '2025-05-28 08:59:37'),
(3, 3, 'App\\Models\\Order', 1, 550000, '+', 'Order Refund For TopUp', 'E65KTQRDZXKP', '2025-09-29 04:37:07', '2025-09-29 04:37:07'),
(4, 5, 'App\\Models\\Order', 1, 550000, '-', 'Payment For Direct Top Up Via Bank Transfer', 'G1S3X8F2HRGD', '2025-11-24 10:20:22', '2025-11-24 10:20:22'),
(5, 10, 'App\\Models\\Order', 1, 257000, '-', 'Payment For Direct Top Up Via Wallet', '7ZANF3CV4S4E', '2025-12-05 16:20:02', '2025-12-05 16:20:02'),
(6, 16, 'App\\Models\\Order', 1, 100000, '-', 'Payment For Card Via Wallet', 'K9T42PECNJJ1', '2025-12-07 15:38:45', '2025-12-07 15:38:45'),
(7, 17, 'App\\Models\\Order', 1, 100000, '-', 'Payment For Card Via DANA', '167C9T2DUB4K', '2025-12-07 15:42:45', '2025-12-07 15:42:45'),
(8, 20, 'App\\Models\\Order', 1, 130000, '-', 'Payment For Card Via Wallet', 'MBX7FWNP26SB', '2025-12-07 15:51:50', '2025-12-07 15:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `referral_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `address_one` text DEFAULT NULL,
  `address_two` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `identity_verify` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected	',
  `address_verify` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Not Applied, 1=> Applied, 2=> Approved, 3 => Rejected',
  `two_fa` tinyint(1) NOT NULL DEFAULT 0,
  `two_fa_verify` tinyint(1) NOT NULL DEFAULT 1,
  `two_fa_code` varchar(255) DEFAULT NULL,
  `email_verification` tinyint(1) NOT NULL DEFAULT 1,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 1,
  `verify_code` varchar(255) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `active_dashboard` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `github_id` text DEFAULT NULL,
  `google_id` text DEFAULT NULL,
  `facebook_id` text DEFAULT NULL,
  `update_password_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `balance`, `referral_id`, `language_id`, `email`, `country_code`, `country`, `phone_code`, `phone`, `image`, `image_driver`, `state`, `city`, `zip_code`, `address_one`, `address_two`, `status`, `identity_verify`, `address_verify`, `two_fa`, `two_fa_verify`, `two_fa_code`, `email_verification`, `sms_verification`, `verify_code`, `sent_at`, `last_login`, `last_seen`, `time_zone`, `password`, `email_verified_at`, `deleted_at`, `timezone`, `remember_token`, `public_key`, `secret_key`, `active_dashboard`, `created_at`, `updated_at`, `github_id`, `google_id`, `facebook_id`, `update_password_token`) VALUES
(1, 'Xead', 'Desta', 'xeadesta', 63000, NULL, 1, 'xeaddx10@gmail.com', 'ID', 'Indonesia', '+62', '83807914090', 'userProfile/wDj5wvAPpRhliwl1U07N1a6pCgKy4K.webp', 'local', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 'RBQBV7S7YRPVYJPY', 1, 1, NULL, NULL, '2025-12-07 22:35:19', '2025-12-07 22:53:24', 'Asia/Jakarta', '$2y$10$gZ2VC/YrV.HR6Xx6dQ2DBelSmU68XUPsJIaULfRp2l47Z8acSHyum', NULL, NULL, 'UTC', NULL, 'pka13c34b5c151fafb9d767585e2155920ceceb693', 'ska041e50831bbcd9d8f7986f2b10ab9dc711ab050', 'nightfall', '2025-03-29 23:20:10', '2025-12-07 15:53:24', NULL, NULL, NULL, NULL),
(2, 'Dimas', 'Kartiko Aji', 'furrrina', 0, NULL, 1, 'kartikoajid@gmail.com', 'ID', 'Indonesia', '+62', '82247634043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, NULL, NULL, '2025-04-16 10:22:07', '2025-04-16 10:23:08', NULL, '$2y$10$UWqiGH3BV2KGQsHyECzCmuO5hgJRY1y2RRylM6konK35vFUu8Jh7K', NULL, NULL, 'Asia/Jakarta', NULL, NULL, NULL, 'nightfall', '2025-04-16 03:22:07', '2025-04-16 03:23:08', NULL, NULL, NULL, NULL),
(3, 'abc', 'abc', 'abc123', 0, NULL, 1, 'abc1234@gmail.com', 'BD', 'Bangladesh (বাংলাদেশ)', '+880', '1234567891', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, 1, 1, NULL, NULL, '2025-12-08 10:16:30', '2025-12-08 10:24:33', NULL, '$2y$10$adfca8Wt2t.XsWbn.hpDpOF2W/TpZpCGmkry6md9NiBxfLN27mWb.', NULL, NULL, 'Asia/Jakarta', NULL, 'pk291f6e8be6fab2df55b493c8e3cdb50818280506', 'skf25209003ba6a67e7c76fbf594dcab4555e65a44', 'nightfall', '2025-11-29 06:57:32', '2025-12-08 03:24:33', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_kycs`
--

CREATE TABLE `user_kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kyc_id` int(11) DEFAULT NULL,
  `kyc_type` varchar(191) DEFAULT NULL,
  `kyc_info` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending , 1=> verified, 2=>rejected',
  `reason` longtext DEFAULT NULL COMMENT 'rejected reason',
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `get_device` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `longitude`, `latitude`, `country_code`, `location`, `country`, `ip_address`, `browser`, `os`, `get_device`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, '2a09:bac5:3a03:2723::3e6:58', 'Chrome', 'Windows 10', 'Computer', '2025-03-29 23:20:11', '2025-03-29 23:20:11'),
(2, 1, '106.6284', '-6.177', 'ID', 'Tangerang - - Indonesia - ID ', 'Indonesia', '114.124.205.20', 'Safari Browser', 'Android', 'Mobile', '2025-04-01 13:01:52', '2025-04-01 13:01:52'),
(3, 1, '106.9726', '-6.2244', 'ID', 'Bekasi - - Indonesia - ID ', 'Indonesia', '2a09:bac5:3a09:88c::da:fc', 'Chrome', 'Windows 10', 'Computer', '2025-04-12 09:52:11', '2025-04-12 09:52:11'),
(4, 2, '106.6284', '-6.177', 'ID', 'Tangerang - - Indonesia - ID ', 'Indonesia', '180.254.64.223', 'Chrome', 'Windows 10', 'Computer', '2025-04-16 03:22:08', '2025-04-16 03:22:08'),
(5, 1, '106.8403', '-6.2208', 'ID', 'Jakarta - - Indonesia - ID ', 'Indonesia', '2a09:bac5:3a23:15f::23:46f', 'Chrome', 'Windows 10', 'Computer', '2025-05-28 08:56:23', '2025-05-28 08:56:23'),
(6, 1, NULL, NULL, NULL, NULL, NULL, '2a09:bac5:3a23:18c8::278:57', 'Chrome', 'Windows 10', 'Computer', '2025-05-29 09:02:36', '2025-05-29 09:02:36'),
(7, 1, '106.7774', '-6.4012', 'ID', 'Depok - - Indonesia - ID ', 'Indonesia', '103.224.124.62', 'Safari Browser', 'Android', 'Mobile', '2025-06-13 06:53:06', '2025-06-13 06:53:06'),
(8, 1, NULL, NULL, NULL, NULL, NULL, '103.224.124.62', 'Safari Browser', 'Android', 'Mobile', '2025-11-24 10:17:28', '2025-11-24 10:17:28'),
(9, 3, NULL, NULL, NULL, NULL, NULL, '103.3.222.135', 'Chrome', 'Windows 10', 'Computer', '2025-11-29 06:57:32', '2025-11-29 06:57:32'),
(10, 3, NULL, NULL, NULL, NULL, NULL, '103.3.222.135', 'Chrome', 'Windows 10', 'Computer', '2025-11-30 10:01:35', '2025-11-30 10:01:35'),
(11, 1, NULL, NULL, NULL, NULL, NULL, '103.224.124.62', 'Chrome', 'Windows 10', 'Computer', '2025-12-05 14:55:57', '2025-12-05 14:55:57'),
(12, 1, NULL, NULL, NULL, NULL, NULL, '103.224.124.62', 'Chrome', 'Windows 10', 'Computer', '2025-12-07 15:35:20', '2025-12-07 15:35:20'),
(13, 3, NULL, NULL, NULL, NULL, NULL, '114.8.206.101', 'Chrome', 'Windows 10', 'Computer', '2025-12-08 03:16:31', '2025-12-08 03:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_trackings`
--

CREATE TABLE `user_trackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `region_name` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_sell_post_id_foreign` (`sell_post_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `basic_controls`
--
ALTER TABLE `basic_controls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_details`
--
ALTER TABLE `blog_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cards_category_id_index` (`category_id`);

--
-- Indexes for table `card_services`
--
ALTER TABLE `card_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_services_card_id_index` (`card_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codes_codeable_type_codeable_id_index` (`codeable_type`,`codeable_id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_details`
--
ALTER TABLE `content_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_details_content_id_index` (`content_id`),
  ADD KEY `content_details_language_id_index` (`language_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_index` (`user_id`),
  ADD KEY `deposits_payment_method_id_index` (`payment_method_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_storages`
--
ALTER TABLE `file_storages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gateways_code_unique` (`code`);

--
-- Indexes for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_menus`
--
ALTER TABLE `manage_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_templates_language_id_index` (`language_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_index` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_detailable_type_detailable_id_index` (`detailable_type`,`detailable_id`),
  ADD KEY `order_details_user_id_index` (`user_id`),
  ADD KEY `order_details_order_id_index` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_details`
--
ALTER TABLE `page_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_methods`
--
ALTER TABLE `payout_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  ADD KEY `reviews_user_id_index` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sell_posts`
--
ALTER TABLE `sell_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_sells_category_id_foreign` (`category_id`);

--
-- Indexes for table `sell_post_categories`
--
ALTER TABLE `sell_post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sell_post_category_details`
--
ALTER TABLE `sell_post_category_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_post_category_details_sell_post_category_id_foreign` (`sell_post_category_id`);

--
-- Indexes for table `sell_post_chats`
--
ALTER TABLE `sell_post_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_post_chats_sell_post_id_foreign` (`sell_post_id`),
  ADD KEY `sell_post_chats_chat_type_chat_id_index` (`chatable_type`,`chatable_id`);

--
-- Indexes for table `sell_post_offers`
--
ALTER TABLE `sell_post_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sell_post_payments`
--
ALTER TABLE `sell_post_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_tickets_user_id_index` (`user_id`);

--
-- Indexes for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_messages_support_ticket_id_index` (`support_ticket_id`),
  ADD KEY `support_ticket_messages_admin_id_index` (`admin_id`);

--
-- Indexes for table `top_ups`
--
ALTER TABLE `top_ups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `top_up_services`
--
ALTER TABLE `top_up_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `top_up_services_top_up_id_index` (`top_up_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_kycs`
--
ALTER TABLE `user_kycs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_kycs_user_id_index` (`user_id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_logins_user_id_index` (`user_id`);

--
-- Indexes for table `user_trackings`
--
ALTER TABLE `user_trackings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_index` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `basic_controls`
--
ALTER TABLE `basic_controls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_details`
--
ALTER TABLE `blog_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `card_services`
--
ALTER TABLE `card_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `content_details`
--
ALTER TABLE `content_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_storages`
--
ALTER TABLE `file_storages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manage_menus`
--
ALTER TABLE `manage_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `page_details`
--
ALTER TABLE `page_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payout_methods`
--
ALTER TABLE `payout_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sell_posts`
--
ALTER TABLE `sell_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_post_categories`
--
ALTER TABLE `sell_post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_post_category_details`
--
ALTER TABLE `sell_post_category_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_post_chats`
--
ALTER TABLE `sell_post_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_post_offers`
--
ALTER TABLE `sell_post_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_post_payments`
--
ALTER TABLE `sell_post_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `top_ups`
--
ALTER TABLE `top_ups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `top_up_services`
--
ALTER TABLE `top_up_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_kycs`
--
ALTER TABLE `user_kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_trackings`
--
ALTER TABLE `user_trackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
