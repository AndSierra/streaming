-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2023 a las 15:33:16
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
-- Base de datos: `streamingapp`
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_09_04_154744_qrcodes1', 1),
(7, '2023_09_04_154928_qrcodes1_table', 1),
(8, '2023_09_04_184633_create_roles_table', 1),
(9, '2023_09_04_191223_create_qrcodes_table', 1),
(10, '2023_09_04_191848_create_transactions_table', 1);

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
  `product_url_image_path` varchar(250) DEFAULT NULL,
  `callback_url` varchar(255) NOT NULL,
  `qrcode_path` varchar(255) DEFAULT NULL,
  `amount` double(10,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `qrcodes`
--

INSERT INTO `qrcodes` (`id`, `user_id`, `website`, `company_name`, `product_name`, `product_url`, `product_url_image_path`, `callback_url`, `qrcode_path`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'Compesnar', 'Sapa', 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'selected_product_Images/1_6503a676b3e24_doggy.jpg', 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'test', 4.0000, '2023-09-15 05:33:58', '2023-09-15 05:45:00', '2023-09-15 05:45:00'),
(2, 2, 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'Compesnar', 'Sapa', 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'selected_product_Images/2_6503a7567c984_doggy.jpg', 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'generated_qrcodes/2.png', 4.0000, '2023-09-15 05:37:42', '2023-09-15 05:37:43', NULL),
(3, 2, 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'vv', 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'selected_product_Images/3_6503a971c685e_Screenshot_3w.png', 'https://www.google.com/search?q=spiderman&oq=spiderman&aqs=chrome..69i57.7227j0j7&sourceid=chrome&ie=UTF-8', 'generated_qrcodes/3.png', 2312.0000, '2023-09-15 05:46:41', '2023-09-15 05:46:42', NULL),
(4, 1, 'https://ucompensar.edu.co/', 'ucompensa', 'Ucompensar', 'https://ucompensar.edu.co/', 'selected_product_Images/4_650b8db117f64_IMG_3833.JPG', 'https://ucompensar.edu.co/', 'generated_qrcodes/4.png', 4.0000, '2023-09-21 04:37:56', '2023-09-21 05:26:25', NULL),
(5, 1, 'https://github.com/AndSierra/streaming_App', 'streaming_App', 'streaming_App', 'https://github.com/AndSierra/streaming_App', 'selected_product_Images/5_650b8466a8378_Sin título.png', 'https://github.com/AndSierra/streaming_App', 'generated_qrcodes/5.png', 1.0000, '2023-09-21 04:46:46', '2023-09-21 04:46:47', NULL),
(6, 1, 'https://github.com/AndSierra/streaming/blob/main/resources/views/qrcodes/edit.blade.php', 'algo', 'algo2', 'https://github.com/AndSierra/streaming/blob/main/resources/views/qrcodes/edit.blade.php', 'selected_product_Images/6_650b8e0a921df_IMG_4733.PNG', 'https://github.com/AndSierra/streaming/blob/main/resources/views/qrcodes/edit.blade.php', 'generated_qrcodes/6.png', 2.0000, '2023-09-21 05:27:40', '2023-09-21 05:27:54', NULL);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'andsierra', 'pasierra@ucompensar.edu.co', NULL, '$2y$10$ioS/7gVJ0K0C8BVEQkCDA.z9wF2MThHEAgXwx1ILLUH6pN7T5Tkpe', 'rmAYLdnOxVvpRyS8oegJI3N6qICWOaFnq7S6bZ7p7tEnDYwbe16OXnKBcf9W', '2023-09-05 02:58:29', '2023-09-15 10:28:12'),
(2, 'Nicolas Gutierrez', 'ngutierrez@ucompensar.edu.co', NULL, '$2y$10$0F/OlB1EajzxVinX7ontr.drH8v.SjT1Iq79B8cJLlh/j/tD92NhK', NULL, '2023-09-15 05:31:56', '2023-09-15 05:31:56');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `qrcodes`
--
ALTER TABLE `qrcodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
