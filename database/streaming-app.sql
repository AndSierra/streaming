-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2023 a las 23:44:49
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `streaming-app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(11, '2014_10_12_100000_create_password_resets_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(14, '2023_09_06_210444_create_roles_table', 1),
(15, '2023_09_06_211326_create_qrcodes_table', 1),
(16, '2023_09_06_212732_create_transactions_table', 1),
(18, '2014_10_12_000000_create_users_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
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
-- Estructura de tabla para la tabla `qrcodes`
--

CREATE TABLE `qrcodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_url` varchar(255) DEFAULT NULL,
  `callback_url` varchar(255) NOT NULL,
  `qrcode_path` varchar(255) DEFAULT NULL,
  `amount` double(10,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `product_url_image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `qrcodes`
--

INSERT INTO `qrcodes` (`id`, `user_id`, `website`, `company_name`, `product_name`, `product_url`, `callback_url`, `qrcode_path`, `amount`, `created_at`, `updated_at`, `deleted_at`, `product_url_image_path`) VALUES
(1, 1, 'cfvga', 'dfgds', 'sdfg', 'sfdg', 'sdfgs', 'sdfg', -3.0000, '2023-09-07 04:50:50', '2023-09-07 04:50:56', '2023-09-07 04:50:56', NULL),
(2, 1, 'ASDFA', 'ADSFA', 'ASDF', 'SDF', 'dfSAD', NULL, 5.0000, '2023-09-07 05:05:30', '2023-09-07 05:33:42', '2023-09-07 05:33:42', NULL),
(3, 1, 'sxfs', 'sdf', 'sda', 'asdf', 'asdf', 'generated_qrcodes/3.png', 5.0000, '2023-09-07 05:23:49', '2023-09-14 05:01:29', '2023-09-14 05:01:29', NULL),
(4, 1, 'asdfg', 'asdfa', 'aghajs', 'aadfaf', 'adsfa', 'generated_qrcodes/4.png', 2.0000, '2023-09-07 05:33:54', '2023-09-14 05:01:32', '2023-09-14 05:01:32', NULL),
(5, 1, 'asdfg', 'asdfa', 'aghajs', 'aadfaf', 'adsfa', 'generated_qrcodes/5.png', 2.0000, '2023-09-07 05:34:42', '2023-09-07 05:38:57', '2023-09-07 05:38:57', NULL),
(6, 1, 'asdfasdf', 'asdfsa', 'asdfas', 'asdfas', 'asdfas', 'generated_qrcodes/6.png', 1.0000, '2023-09-08 05:15:03', '2023-09-14 05:01:36', '2023-09-14 05:01:36', NULL),
(9, 1, 'https://github.com/AndSierra/streaming/blob/main/resources/views/users/show_fields.blade.php', 'Fagor', 'Halo', 'halo2.com', 'halo2.com/callback', 'generated_qrcodes/9.png', 4.0000, '2023-10-12 01:59:14', '2023-10-12 02:16:15', NULL, 'selected_product_Images/9_65270ca242067_7_65270459d0070_9_650254af0aed6_halo.jpg'),
(10, 2, 'https://web.whatsapp.com/', 'Compensar', 'Producto', 'producto.com', 'producto.com/callback', 'generated_qrcodes/10.png', 9.0000, '2023-10-12 02:41:58', '2023-10-12 02:41:59', NULL, 'selected_product_Images/10_652716a625cb8_3_6503a971c685e_Screenshot_3w.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'juan manuel avila', '2023-09-07 04:51:06', '2023-09-07 05:04:58', '2023-09-07 05:04:58'),
(2, 'sfs', '2023-09-07 05:33:29', '2023-10-06 02:34:54', '2023-10-06 02:34:54'),
(3, 'Super admin', '2023-10-06 02:35:05', '2023-10-06 02:35:05', NULL),
(4, 'Cliente', '2023-10-06 02:37:42', '2023-10-06 02:38:04', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `qrcode_owner_id` int(11) DEFAULT NULL,
  `qrcode_id` int(11) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `amount` double(10,4) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'initiated',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `qrcode_owner_id`, `qrcode_id`, `payment_method`, `message`, `amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 9, 'PSE', 'Sapo', 4.0000, 'No se sabe', '2023-10-12 02:00:04', '2023-10-12 02:27:12', NULL),
(2, 1, 9, 9, 'Especie', 'Sapito', 8966.0000, 'Ya pregunto', '2023-10-12 02:24:52', '2023-10-12 02:24:52', NULL),
(3, 2, 1, 10, 'Que mi Dios le pague', 'La proxima le pago', 1.0000, 'Ahorita le digo', '2023-10-12 02:43:10', '2023-10-12 02:43:10', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `roles_id` int(11) NOT NULL DEFAULT 4,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `roles_id`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nicolas', 'ngutierrezb@ucompensar.edu.co', NULL, 4, '$2y$10$F0yJjt5UjUYqK8rcQ/4jZO/k0b6i5VLUyCgesyxb.MSpOf2LVGBOy', NULL, '2023-10-12 01:46:11', '2023-10-12 01:46:11', NULL),
(2, 'DANTE', 'nicolasgutierrez1109@gmail.com', NULL, 4, '$2y$10$84jdkAGSondIBrl81T./MO.APCQRnoa.1JU.rFavQJxqdGIOK/AyC', NULL, '2023-10-12 02:40:06', '2023-10-12 02:40:06', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `qrcodes`
--
ALTER TABLE `qrcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `qrcodes`
--
ALTER TABLE `qrcodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
