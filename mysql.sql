-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Ноя 18 2019 г., 11:23
-- Версия сервера: 5.7.25
-- Версия PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `laravelKurs`
--
CREATE DATABASE IF NOT EXISTS `laravelKurs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `laravelKurs`;

-- --------------------------------------------------------

--
-- Структура таблицы `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_raw` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_04_10_131530_create_blog_categories_table', 1),
(4, '2019_04_10_131546_create_blog_posts_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Индексы таблицы `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_posts_slug_unique` (`slug`),
  ADD KEY `blog_posts_user_id_foreign` (`user_id`),
  ADD KEY `blog_posts_category_id_foreign` (`category_id`),
  ADD KEY `blog_posts_is_published_index` (`is_published`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`),
  ADD CONSTRAINT `blog_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- База данных: `laravelvue`
--
CREATE DATABASE IF NOT EXISTS `laravelvue` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `laravelvue`;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'artemlein', 'artem_Reshetnik@mail.ru', NULL, '$2y$10$WeeAFrcRTsU1GRS1UrK72ujFDR9FXl6dewyny6db6oigelUvr3Ob6', NULL, '2019-07-16 06:13:56', '2019-07-16 06:13:56');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- База данных: `moderation`
--
CREATE DATABASE IF NOT EXISTS `moderation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `moderation`;

-- --------------------------------------------------------

--
-- Структура таблицы `mems`
--

CREATE TABLE `mems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` int(11) NOT NULL DEFAULT '0',
  `dont_use` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_04_27_1110_create_users_table', 1),
(3, '2019_04_28_1100_create_reasons_table', 1),
(4, '2019_04_29_1090_create_reports_table', 1),
(5, '2019_07_23_1070_create_mems_table', 1),
(6, '2019_08_01_165735_create_promos_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `promos`
--

CREATE TABLE `promos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activated` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `reasons`
--

CREATE TABLE `reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason_id` int(10) UNSIGNED NOT NULL,
  `muted_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moderate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `access_moderation` int(11) NOT NULL DEFAULT '0',
  `access_mems` int(11) NOT NULL DEFAULT '0',
  `access_admin` int(11) NOT NULL DEFAULT '0',
  `accept_post` int(11) NOT NULL DEFAULT '0',
  `decline_post` int(11) NOT NULL DEFAULT '0',
  `all_post` int(11) NOT NULL DEFAULT '0',
  `use_promo` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `password`, `user_id`, `access_moderation`, `access_mems`, `access_admin`, `accept_post`, `decline_post`, `all_post`, `use_promo`, `remember_token`, `updated_at`, `created_at`) VALUES
(1, 'Артём Решетник', NULL, 'https://sun9-34.userapi.com/c845122/v845122947/c06de/d_3-2nfnhhI.jpg?ava=1', NULL, 188345502, 1, 1, 0, 0, 0, 0, 0, 'rNIY2YTsOegwu41aeiKkP5f0CmpNZvelfIwcKuWX05lWpsHfSURmmdOPVd3Z', '2019-09-30 10:42:43', '2019-09-30 10:42:43');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `mems`
--
ALTER TABLE `mems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mems_author_id_foreign` (`author_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_reason_id_foreign` (`reason_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_id_unique` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `mems`
--
ALTER TABLE `mems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `promos`
--
ALTER TABLE `promos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `mems`
--
ALTER TABLE `mems`
  ADD CONSTRAINT `mems_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_reason_id_foreign` FOREIGN KEY (`reason_id`) REFERENCES `reasons` (`id`);
--
-- База данных: `python`
--
CREATE DATABASE IF NOT EXISTS `python` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `python`;

-- --------------------------------------------------------

--
-- Структура таблицы `rasp`
--

CREATE TABLE `rasp` (
  `id` int(10) NOT NULL,
  `lesson` varchar(25) NOT NULL,
  `teacher` varchar(25) NOT NULL,
  `group_kurs` int(3) NOT NULL,
  `kurs` varchar(10) NOT NULL,
  `time` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `rasp`
--
ALTER TABLE `rasp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `rasp`
--
ALTER TABLE `rasp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- База данных: `reklama`
--
CREATE DATABASE IF NOT EXISTS `reklama` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `reklama`;

-- --------------------------------------------------------

--
-- Структура таблицы `buyChannels`
--

CREATE TABLE `buyChannels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_vk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_vk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `note` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `buyChannels`
--

INSERT INTO `buyChannels` (`id`, `name_channel`, `url_channel`, `name_vk`, `url_vk`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Quantum Games', 'None', 'Александр Охват', 'https://vk.com/pullson', 2, 'Это тебе заметка', '2019-09-29 12:02:22', '2019-11-15 09:34:09'),
(2, 'Барт', 'None', 'Ярослав Васильев', 'https://vk.com/bartyt', 1, 'Этому ебало разбей', '2019-09-30 13:46:46', '2019-11-14 13:07:29'),
(3, 'Coffi Channel', 'None', 'Дима Мельников', 'https://vk.com/id328758285', 1, 'Этот вообще хуесос дорогой', '2019-10-05 07:17:39', '2019-11-14 13:07:34'),
(4, 'SHIMOROSHOW', 'None', 'None', 'shimoroshow@gmail.com', 1, '', '2019-10-05 07:18:19', '2019-11-14 13:07:35'),
(5, 'creative7play', 'None', 'None', 'slefanov@gmail.com', 1, '', '2019-10-05 07:18:21', '2019-10-05 07:18:21'),
(6, 'Канал Шока', 'None', 'Эрик Шоков', 'https://vk.com/shokee', 1, '', '2019-10-05 07:18:23', '2019-10-05 07:18:23'),
(7, 'Делайт', 'None', 'Maksim Saenko', 'https://vk.com/thran', 1, '', '2019-10-19 13:57:57', '2019-10-19 13:57:57');

-- --------------------------------------------------------

--
-- Структура таблицы `channels`
--

CREATE TABLE `channels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_video` int(10) NOT NULL,
  `price_int` int(10) NOT NULL,
  `name_vk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_vk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `channels`
--

INSERT INTO `channels` (`id`, `name_channel`, `url_channel`, `subscribe`, `description`, `price_video`, `price_int`, `name_vk`, `url_vk`, `created_at`, `updated_at`) VALUES
(1393, 'Coffi Channel', 'None', '6,159,732', 'Разный контент', 100, 1000, 'Дима Мельников', 'https://vk.com/id328758285', NULL, NULL),
(1394, 'Quantum Games', 'None', '3.541,558', 'Ролики по кс', 0, 0, 'Александр Охват', 'https://vk.com/pullson', NULL, NULL),
(1395, 'SHIMOROSHOW', 'None', '3,105,133', 'Контент по играм', 0, 0, 'None', 'shimoroshow@gmail.com', NULL, NULL),
(1396, 'Dumbazz', 'None', '3,057,551', 'Открытие кейсов', 0, 0, 'Владислав Карнаух', 'https://vk.com/karnauhh', NULL, NULL),
(1397, 'Dmitrii Landstop', 'None', '2,331,570', 'Кейсы и кс го ', 0, 0, 'None', 'landstoppr@gmail.com', NULL, NULL),
(1398, 'creative7play', 'None', '1,555,305', 'Контент по кс го', 0, 0, 'None', 'slefanov@gmail.com', NULL, NULL),
(1399, 'ADAMSON', 'None', '1,410,597', '', 0, 0, 'None', ': adamsonmoney@gmail.com', NULL, NULL),
(1400, 'Muxakep Михакер', 'None', '1,310,341', 'Ролики по кс', 0, 0, 'Михаил Иванов', 'https://vk.com/muxakep', NULL, NULL),
(1401, 'Канал Шока', 'None', '1,151,220', 'Контент по кс', 0, 0, 'Эрик Шоков', 'https://vk.com/shokee', NULL, NULL),
(1402, 'Alermo', 'None', '1,148,155', 'Открыл кейсы', 0, 0, 'None', '', NULL, NULL),
(1403, 'Zernovka', 'None', '1,108,455', 'Донаты стримерам', 0, 0, 'Артём Белкин', 'https://vk.com/id508748984', NULL, NULL),
(1404, 'MoreGames', 'None', '1,059,971', 'Ролики по кс', 0, 0, 'Яков Олегович', 'https://vk.com/chizbot', NULL, NULL),
(1405, 'Joe Spoeen', 'None', '867.357', 'Ролики кс +гта5', 0, 0, 'Игорь Баландин', 'https://vk.com/unicorntixo', NULL, NULL),
(1406, 'Локос', 'None', '861', 'Игра на сайтах', 0, 0, 'None', 'https://vk.com/zeyttt', NULL, NULL),
(1407, 'Justie', 'None', '753.858', 'ролики по кс', 0, 0, 'Advertising Justie', 'https://vk.com/justieadverts', NULL, NULL),
(1408, 'KomatozZz', 'None', '710.731', 'Ролики по кс', 0, 0, 'Алексей Маханько', 'https://vk.com/kamatoziq(https://vk.com/chizbot)', NULL, NULL),
(1409, 'Барт', 'None', '690.711', 'Ролики кс+гта5', 0, 0, 'Ярослав Васильев', 'https://vk.com/bartyt', NULL, NULL),
(1410, 'MrSilent', 'None', '638.727', 'ролики по кс', 0, 0, 'Daniil Silent', 'https://vk.com/id244728298', NULL, NULL),
(1411, 'YOGURT', 'None', '578.282', 'Контент по кс го', 0, 0, 'Никита Шестопалов', 'https://vk.com/n_shestopalov', NULL, NULL),
(1412, 'Kratos Play', 'None', '575.324', 'Иногда открывает кейсы', 0, 0, 'Антон Черемисин', 'https://vk.com/kratosplay', NULL, NULL),
(1413, 'Fenya', 'None', '571.931', 'Ролики по кс', 0, 0, 'Артём Харебин', 'https://vk.com/fenyasha', NULL, NULL),
(1414, 'UFOBIRNE', 'None', '567.368', 'Контент по кс', 0, 0, 'Егор Харло', 'https://vk.com/yegor48', NULL, NULL),
(1415, 'Klash', 'None', '554.804', 'Ролики по кс', 0, 0, 'Ilya Klash', 'https://vk.com/klashchannel', NULL, NULL),
(1416, 'зэ ТАЙЛЕР', 'None', '553.598', 'Ролики по кс', 0, 0, 'Владимир Мелихов', 'https://vk.com/thetylerx', NULL, NULL),
(1417, 'Айдар', 'None', '538.239', 'ролики по кс', 0, 0, 'None', '', NULL, NULL),
(1418, 'Animan', 'None', '517.341', 'ролики по кс', 0, 0, 'Антон Суднев', 'https://vk.com/animan', NULL, NULL),
(1419, 'Делайт', 'None', '509.399', 'Контент по кс го', 0, 0, 'Maksim Saenko', 'https://vk.com/thran', NULL, NULL),
(1420, 'Степаша', 'None', '482.693', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/d1mylbka', NULL, NULL),
(1421, 'BEST OF CS GO', 'None', '480.851', 'Открытие кейсов', 0, 0, 'None', 'https://vk.com/abraydon', NULL, NULL),
(1422, 'Tenderlybae КАЖДЫЙ ДЕНЬ', 'None', '436.076', '', 0, 0, 'None', '', NULL, NULL),
(1423, 'Tanko', 'None', '425.771', 'ролики по кс', 0, 0, 'None', 'https://vk.com/tanko3d', NULL, NULL),
(1424, 'DruShLakTV', 'None', '404.239', 'Контент по кс го', 0, 0, 'None', 'https://vk.com/drushlakvk', NULL, NULL),
(1425, 'Chelovek Cheloved', 'None', '371.961', 'Проверка сайтов', 0, 0, 'None', 'https://vk.com/cheloved', NULL, NULL),
(1426, 'GETLIGHT', 'None', '348.228', 'Блогер по кс', 0, 0, 'None', 'https://vk.com/fen1ksoff', NULL, NULL),
(1427, 'GERO', 'None', '343.855', 'Разный контент', 0, 0, 'None', 'https://vk.com/geroshow', NULL, NULL),
(1428, 'Pala4', 'None', '339.561', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/pala4_adverts', NULL, NULL),
(1429, 'Vika Pisareva', 'None', '332.078', 'Контент по кс', 0, 0, 'None', 'https://vk.com/tawerinzeghetto', NULL, NULL),
(1430, 'ДОГИ', 'None', '320.324', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/doge_yt', NULL, NULL),
(1431, 'MANIAC', 'None', '309.042', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/id404095944', NULL, NULL),
(1432, 'БРЭД', 'None', '297.732', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/bredovuybread', NULL, NULL),
(1433, 'ZLOY', 'None', '287.831', 'Разный контент', 0, 0, 'None', '', NULL, NULL),
(1434, 'БОГ', 'None', '274.779', 'Открытие кейсов', 0, 0, 'None', 'https://vk.com/id542105294', NULL, NULL),
(1435, 'Куз', 'None', '251.649', 'Ролики кс+гта5', 0, 0, 'None', 'https://vk.com/kyz_channel', NULL, NULL),
(1436, 'Murzofix', 'None', '238.101', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/murzikfix', NULL, NULL),
(1437, 'EnergyDess', 'None', '222.528', 'Контент по сайтам', 0, 0, 'None', 'https://vk.com/energy_dess', NULL, NULL),
(1438, 'MatveyS', 'None', '200.077', 'Нарезки со стримов', 0, 0, 'None', 'https://vk.com/lebedevmatvey', NULL, NULL),
(1439, 'ИгОрЁк TV', 'None', '198.905', 'Контент по сайтам', 0, 0, 'None', 'https://vk.com/marinasim90', NULL, NULL),
(1440, 'Froksay', 'None', '196.006', 'Контент по кс', 0, 0, 'None', 'https://vk.com/manager_yt', NULL, NULL),
(1441, 'Сквизи', 'None', '194.399', 'Нарезки HardPlay', 0, 0, 'None', 'https://vk.com/richergang', NULL, NULL),
(1442, 'MG', 'None', '183.507', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/chizbot', NULL, NULL),
(1443, 'Deposit', 'None', '178.918', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/id305198495', NULL, NULL),
(1444, 'TrixGoldGames', 'None', '163.407', 'Новости кс', 0, 0, 'None', 'https://vk.com/trixgg', NULL, NULL),
(1445, 'banany', 'None', '159.172', 'Контент по кс го', 0, 0, 'None', 'https://vk.com/hummles', NULL, NULL),
(1446, 'Quadmft', 'None', '158.637', 'Контент на англ по кс', 0, 0, 'None', 'quadmft@gmail.com', NULL, NULL),
(1447, 'Priliv CSGO', 'None', '148.584', 'Открытие кейсов', 0, 0, 'None', 'https://vk.com/reklamacsgososkinami', NULL, NULL),
(1448, 'ШАРФ', 'None', '145.706', 'ролики по кс', 0, 0, 'None', 'https://vk.com/warfetskiy', NULL, NULL),
(1449, 'Jenny', 'None', '132.25', 'Контекнт по кс и сайтам', 0, 0, 'None', 'https://vk.com/manager_yt', NULL, NULL),
(1450, 'MegaRush', 'None', '113.211', 'ролики по кс', 0, 0, 'None', 'https://vk.com/koglos', NULL, NULL),
(1451, 'TheBogt', 'None', '110.169', 'Бесплатное получение чего-либо', 0, 0, 'None', 'https://vk.com/thebogt', NULL, NULL),
(1452, 'Aquamarine', 'None', '109.911', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/adv_aqua', NULL, NULL),
(1453, 'INSIDE 1337', 'None', '108.093', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/dimagritsevich', NULL, NULL),
(1454, 'TheDenGames', 'None', '99.823', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/manager_yt', NULL, NULL),
(1455, 'JUST FUN!Mialista', 'None', '98.077', 'Ролики', 0, 0, 'None', '', NULL, NULL),
(1456, 'ФЕНТЕЙЗИК( STANDOFF2)', 'None', '95.848', 'STANDOFF 2', 0, 0, 'None', 'https://vk.com/id446235262', NULL, NULL),
(1457, 'Омлет', 'None', '86.666', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/moder_omleta', NULL, NULL),
(1458, 'Моджик', 'None', '84.119', 'Разный контент', 0, 0, 'None', 'https://vk.com/modjiik', NULL, NULL),
(1459, 'Банди', 'None', '76.118', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/bandi771', NULL, NULL),
(1460, 'KLM_Gamer', 'None', '74.992', 'Игра на сайтах', 0, 0, 'None', 'https://vk.com/stepashik93', NULL, NULL),
(1461, 'Danludan', 'None', '72.115', 'Казино', 0, 0, 'None', 'https://vk.com/danludan777', NULL, NULL),
(1462, 'zernovkaxd', 'None', '71.057', ' Открытие кейсов', 0, 0, 'None', 'https://vk.com/id508748984', NULL, NULL),
(1463, 'Money Time', 'None', '66.825', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/id228256130', NULL, NULL),
(1464, 'KomandiRTV', 'None', '66.075', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/komandir163', NULL, NULL),
(1465, 'ВЭЙС :3', 'None', '65.048', 'проверки кейсов Мобильной кс', 0, 0, 'None', 'https://vk.com/id195054349', NULL, NULL),
(1466, 'Fargo', 'None', '63.725', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/futoramatut', NULL, NULL),
(1467, 'HOT AREA', 'None', '61.574', 'Играет на сайтах', 0, 0, 'None', '', NULL, NULL),
(1468, 'Brisk Brain', 'None', '61.332', 'Контент по кс', 0, 0, 'None', 'https://vk.com/id488237370', NULL, NULL),
(1469, 'МОЛЕКУРЯТНИК', 'None', '60.933', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/prom_with_love', NULL, NULL),
(1470, 'ГРИБ', 'None', '58.521', 'Как заработать', 0, 0, 'None', 'https://vk.com/d.litvinoff', NULL, NULL),
(1471, 'IgorFOX', 'None', '58.521', 'Проверка магазинов', 0, 0, 'None', 'https://vk.com/ira.kukharenko', NULL, NULL),
(1472, 'RAIN Standoff 2', 'None', '54.045', 'Standoff 2', 0, 0, 'None', 'https://vk.com/nasakin71', NULL, NULL),
(1473, 'ФОКС', 'None', '47.936', 'Открытие кейсов', 0, 0, 'None', 'https://vk.com/fedunna', NULL, NULL),
(1474, 'MAVR BOX', 'None', '47.407', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/mavrbox', NULL, NULL),
(1475, 'Канал Тигра', 'None', '43.572', 'ролики по кс', 0, 0, 'None', 'https://vk.com/t1gerss', NULL, NULL),
(1476, 'НЕДОХАКЕРЫ', 'None', '39.732', 'Разный контент', 0, 0, 'None', 'https://vk.com/prostak7777', NULL, NULL),
(1477, ' SV CS:GO', 'None', '37.938', 'Открытие кейсов', 0, 0, 'None', '', NULL, NULL),
(1478, 'Mostka', 'None', '37.545', 'Игра на сайтов', 0, 0, 'None', 'https://vk.com/sashamostkovoi', NULL, NULL),
(1479, 'Global CSGO', 'None', '37.186', 'Стримы по кс', 0, 0, 'None', 'https://vk.com/clash_line', NULL, NULL),
(1480, 'ЕВРЕЙ ШОУ', 'None', '37.052', 'топ сайтов с халявой', 0, 0, 'None', '-', NULL, NULL),
(1481, 'ГАРТИ', 'None', '36.575', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/ad.gart1', NULL, NULL),
(1482, 'ХАЛЯВНЫЙ БУМА', 'None', '33.943', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/pompa6', NULL, NULL),
(1483, 'Aik', 'None', '33.617', 'ролики по кс', 0, 0, 'None', 'https://vk.com/officialaik', NULL, NULL),
(1484, 'RAIN', 'None', '33.438', 'Standoff 2', 0, 0, 'None', 'https://vk.com/nasakin71', NULL, NULL),
(1485, 'Mister Maxim Mixer', 'None', '32.197', 'Тактики игры на сайте', 0, 0, 'None', 'https://vk.com/maxim_mixer', NULL, NULL),
(1486, 'ХАЙП', 'None', '30.434', 'Standoff 2', 0, 0, 'None', 'https://vk.com/id506370333', NULL, NULL),
(1487, 'EverOn', 'None', '29.612', 'Открытие кейсов', 0, 0, 'None', 'РЕКЛАМЫ НЕТ', NULL, NULL),
(1488, 'SystemPlay', 'None', '29.033', 'Стримы по кс', 0, 0, 'None', 'https://vk.com/clash_line', NULL, NULL),
(1489, 'EXTRIM LIVE', 'None', '26.61', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/beskosny', NULL, NULL),
(1490, 'FLYER', 'None', '22.535', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/id443995942', NULL, NULL),
(1491, 'DEATHSHOW', 'None', '21.994', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/deathshow1', NULL, NULL),
(1492, 'The Kost9 2', 'None', '21.148', 'Ролики по кс + сайты', 0, 0, 'None', 'kost9re@gmail.com(https://vk.com/kost99)', NULL, NULL),
(1493, 'СЛОУПОЧ- Standoff2', 'None', '20.828', 'Standoff 2', 0, 0, 'None', 'https://vk.com/leonid_linberg', NULL, NULL),
(1494, 'Kay Di', 'None', '19.521', 'Ролики по кс ', 0, 0, 'None', 'https://vk.com/id54247464', NULL, NULL),
(1495, 'Asya Lebedeva', 'None', '19.454', 'Открытие кейсов', 0, 0, 'None', 'https://vk.com/id367475050', NULL, NULL),
(1496, 'Свигги', 'None', '18.907', 'Стримы, ролики', 0, 0, 'None', 'https://vk.com/janelan13', NULL, NULL),
(1497, 'Дупло хомяка', 'None', '18.291', 'Ролики по кс ', 0, 0, 'None', '', NULL, NULL),
(1498, 'Djakarti', 'None', '18.208', 'Казино ', 0, 0, 'None', 'https://vk.com/id404511810', NULL, NULL),
(1499, 'Nikon Show', 'None', '14.449', 'Мало просмотров', 0, 0, 'None', 'https://vk.com/niknoff', NULL, NULL),
(1500, 'Вреднуля', 'None', '14.111', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/id_eeveli4estvo', NULL, NULL),
(1501, 'STEPAN BOLOBANOV', 'None', '14.025', 'Казик', 0, 0, 'None', '', NULL, NULL),
(1502, 'MaksOne', 'None', '12.841', 'Игры на сайтах', 0, 0, 'None', 'https://vk.com/id411042055', NULL, NULL),
(1503, 'SweetHoneyDew', 'None', '12.525', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/sweethoneydew', NULL, NULL),
(1504, 'Bordyuga', 'None', '12.321', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/bordyugov_denis', NULL, NULL),
(1505, 'CHESS1K', 'None', '11.121', 'Стримы по сайтам', 0, 0, 'None', 'https://vk.com/chess1k', NULL, NULL),
(1506, 'SouthCruse LIVE', 'None', '11.099', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/paulokopyl', NULL, NULL),
(1507, 'Filipok', 'None', '11.091', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/pbalabanov2013', NULL, NULL),
(1508, 'ФАРТОВЫЙ • ГАРТИ', 'None', '11.009', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/ad.gart1', NULL, NULL),
(1509, 'SPIRIT SHOW', 'None', '9.275', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/artem23456', NULL, NULL),
(1510, 'Granatka', 'None', '8.821', 'Контент по кс', 0, 0, 'None', 'https://vk.com/granatka94', NULL, NULL),
(1511, 'Бабломания', 'None', '8.719', 'Играет на сайтах', 0, 0, 'None', '', NULL, NULL),
(1512, 'Double Dragon - CS:GO', 'None', '8.702', 'Контент по кс', 0, 0, 'None', 'https://vk.com/ddragonmark', NULL, NULL),
(1513, 'Gan4ik', 'None', '7.372', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/id474113815', NULL, NULL),
(1514, 'Karla MAN', 'None', '7.201', 'Сайты с халявой', 0, 0, 'None', 'https://vk.com/id98962171', NULL, NULL),
(1515, ' FIEN', 'None', '7.042', 'Standoff 2 ', 0, 0, 'None', 'https://vk.com/offfien', NULL, NULL),
(1516, 'GreenPlay', 'None', '6.958', '', 0, 0, 'None', '', NULL, NULL),
(1517, '1337 ShucarZ', 'None', '6.893', 'ролики по кс', 0, 0, 'None', 'https://vk.com/shucarz', NULL, NULL),
(1518, 'НОЖ', 'None', '6.708', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/manager_yt', NULL, NULL),
(1519, '1337 ShucarZ', 'None', '6.684', 'Ролики по кс', 0, 0, 'None', 'https://vk.com/shucarz', NULL, NULL),
(1520, 'DenOla GG', 'None', '6.154', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/id360306266', NULL, NULL),
(1521, 'DELON', 'None', '5.989', 'Контент по моб. кс', 0, 0, 'None', '', NULL, NULL),
(1522, 'Форка', 'None', '5.943', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/rus.ishkaev', NULL, NULL),
(1523, 'ALISHER', 'None', '5.831', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/alisheryoutuber', NULL, NULL),
(1524, 'Famous SHOw', 'None', '5.758', 'Открытие кейсов', 0, 0, 'None', 'https://vk.com/id194926423', NULL, NULL),
(1525, 'Maloy is Back', 'None', '4.693', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/maksim.vengel', NULL, NULL),
(1526, 'Зейт', 'None', '4.535', 'Игра на сайтах', 0, 0, 'None', 'https://vk.com/zeyttt', NULL, NULL),
(1527, 'Гром', 'None', '3.773', 'Контент по сайтам', 0, 0, 'None', 'https://vk.com/marinasim90', NULL, NULL),
(1528, 'Fucker', 'None', '3.613', 'Открывает кейсы', 0, 0, 'None', 'https://vk.com/kalinkin91', NULL, NULL),
(1529, 'BIG BOGDIK2.0', 'None', '3.448', 'Играет на казике', 0, 0, 'None', '', NULL, NULL),
(1530, 'All In', 'None', '3.439', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/mvpro573', NULL, NULL),
(1531, 'ФЛИК', 'None', '3.391', 'Standoff', 0, 0, 'None', 'https://vk.com/id321402791', NULL, NULL),
(1532, 'DIFENZ', 'None', '2.966', 'Игра на сайтах', 0, 0, 'None', 'https://vk.com/id512177231', NULL, NULL),
(1533, 'Просто Трепутин', 'None', '2.842', 'Ролики по сайтам', 0, 0, 'None', '', NULL, NULL),
(1534, 'Листочик', 'None', '2.684', '\"КАК ПОДНЯТЬ\"', 0, 0, 'None', 'https://vk.com/id176217400', NULL, NULL),
(1535, 'Den Stifler SHOW', 'None', '2.433', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/den_stifler', NULL, NULL),
(1536, 'ЛАЙВ КАНАЛ', 'None', '2.379', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/id234060830', NULL, NULL),
(1537, 'ИГРОВЫЕ АВТОМАТЫ', 'None', '2.353', 'Казино ', 0, 0, 'None', 'https://vk.com/id382043139', NULL, NULL),
(1538, 'Corvus', 'None', '2.246', 'Игры на сайтах', 0, 0, 'None', 'https://vk.com/id529763888', NULL, NULL),
(1539, 'Вечный GLC', 'None', '2.197', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/tishechkov', NULL, NULL),
(1540, 'SLOTVIVER', 'None', '2.034', 'Контент по казику', 0, 0, 'None', '', NULL, NULL),
(1541, 'RickShyGuy', 'None', '1.701', 'Нарезки HardPlay', 0, 0, 'None', 'https://vk.com/vladislav__zykov', NULL, NULL),
(1542, 'Lobastov Play', 'None', '1.653', 'Открывает кейсы в кс ', 0, 0, 'None', 'https://vk.com/lobastov_pavel', NULL, NULL),
(1543, 'zhekBY', 'None', '1.554', 'Стримы', 0, 0, 'None', 'https://vk.com/zhekby', NULL, NULL),
(1544, 'Lets`playshik Danek', 'None', '1.419', 'Стримы по казикам/сайтам', 0, 0, 'None', 'https://vk.com/pytigorsk126rus', NULL, NULL),
(1545, 'luzyecnhont', 'None', '1.394', 'Играет на сайтах', 0, 0, 'None', '', NULL, NULL),
(1546, 'Sardarov ЗАРАБОТОК В ИНТЕРНЕТЕ', 'None', '1.291', 'Как заработать в интернете', 0, 0, 'None', 'https://vk.com/ilgizsardarov', NULL, NULL),
(1547, 'Зубрийцкий', 'None', '1.215', 'Ролики по сайтам', 0, 0, 'None', 'https://vk.com/tzubritsky2016', NULL, NULL),
(1548, 'Channel Strelok', 'None', '1.169', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/strelokf_a', NULL, NULL),
(1549, 'ТОП ЗАНОСЫ В КАЗИНО', 'None', '1.152', 'Играет на Казике', 0, 0, 'None', 'https://vk.com/id375057103', NULL, NULL),
(1550, 'Школьник', 'None', '1.096', '', 0, 0, 'None', '', NULL, NULL),
(1551, 'JAMAL', 'None', '1.053', 'Проверка сайтов/КС ГО', 0, 0, 'None', 'https://vk.com/id95465252', NULL, NULL),
(1552, 'JOSKIY', 'None', '1', 'Контент по кс', 0, 0, 'None', 'https://vk.com/tawerinzeghetto', NULL, NULL),
(1553, 'Folvmi', 'None', '0.804', 'Standoff 2', 0, 0, 'None', 'https://vk.com/id283379040', NULL, NULL),
(1554, 'inpover`s', 'None', '0.783', 'Открытие кейсов', 0, 0, 'None', 'https://vk.com/inpovers', NULL, NULL),
(1555, 'Sartolio', 'None', '0.766', 'Халявные скины и игры', 0, 0, 'None', 'https://vk.com/sartolio', NULL, NULL),
(1556, 'Skadi Tv', 'None', '0.737', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/lekha.zbs1999', NULL, NULL),
(1557, 'LeFive', 'None', '0.676', 'Открытие кейсов', 0, 0, 'None', 'https://vk.com/fan_far', NULL, NULL),
(1558, 'Minework', 'None', '0.657', 'Игра на сайтах', 0, 0, 'None', 'https://vk.com/minework3', NULL, NULL),
(1559, 'FortynaTv', 'None', '0.487', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/id272105327', NULL, NULL),
(1560, 'KloS Se', 'None', '0.424', 'Игры на сайтах', 0, 0, 'None', 'https://vk.com/id427931235', NULL, NULL),
(1561, 'Хэллстон', 'None', '0.363', 'Играет на сайтах', 0, 0, 'None', 'https://vk.com/id404361478', NULL, NULL),
(1562, 'Хелин 3.0', 'None', '0.358', 'Игра на сайтах', 0, 0, 'None', 'https://vk.com/vlad_yemets322', NULL, NULL),
(1563, 'NeYTRush', 'None', '0.283', 'Контент по кс го', 0, 0, 'None', 'https://vk.com/kirillgogol16', NULL, NULL),
(1564, 'DIMONBRIGHT', 'None', '', '', 0, 0, 'None', '', NULL, NULL),
(1565, 'daNyagRn', 'None', '', '', 0, 0, 'None', '', NULL, NULL),
(1566, 'Bloody', 'None', '537', 'Контент по кс го', 0, 0, 'None', 'https://vk.com/7bloody7', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `money` float NOT NULL,
  `buy_video` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `counters`
--

INSERT INTO `counters` (`id`, `money`, `buy_video`, `created_at`, `updated_at`) VALUES
(1, 213.04, 72, NULL, '2019-09-28 05:33:43');

-- --------------------------------------------------------

--
-- Структура таблицы `historyBuyChannels`
--

CREATE TABLE `historyBuyChannels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_publication` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `_token` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `historyBuyChannels`
--

INSERT INTO `historyBuyChannels` (`id`, `name_channel`, `price`, `date_publication`, `url_video`, `wallet`, `status`, `created_at`, `updated_at`, `_token`) VALUES
(1, 'DELON', '650р', '12 08 2019', 'https://youtu.be/l5qlgZx-60c', '0', '1', NULL, NULL, ''),
(2, 'Double Dragon - CS:GO', '1 000р', '12 08 2019', 'Просрали и вернули весь балик', '0', '1', NULL, NULL, ''),
(3, 'ФАРТОВЫЙ • ГАРТИ', '2 000р', '12 08 2019', 'https://youtu.be/Gn9uPr_NnWA', '0', '1', NULL, NULL, ''),
(4, 'DenOla GG', '1 000р', '16 08 2019', 'https://youtu.be/uBPu158kqXU', '0', '1', NULL, NULL, ''),
(5, 'Filipok', '700р', '13 08 2019', 'https://youtu.be/AGsi_2Ua4A4', '0', '1', NULL, NULL, ''),
(6, 'ВЕЙС', '3 500р', '11-12 08 2019', 'https://youtu.be/gLODZs6hA18', '0', '1', NULL, NULL, ''),
(7, 'luzyecnhont', '1 000р', '12 08 2019', 'https://youtu.be/cp1EWLXdAjQ', '0', '1', NULL, NULL, ''),
(8, 'FortynaTv', '300р', '12 08 2019', 'https://youtu.be/HE9kJ45GuhE', '0', '1', NULL, NULL, ''),
(9, 'Банди', '8 000р', '12 08 2019', 'https://youtu.be/v3S-qg66UrE', '79039228875', '1', NULL, NULL, ''),
(10, 'EXTRIM LIVE', '1 000р', '12-14 08 2019', 'https://youtu.be/KsYOFnmaYN4', '0', '1', NULL, NULL, ''),
(11, 'RAIN Standoff 2', '700p', '12 08 2019', 'https://youtu.be/_k5x8Kj-kDk', '0', '1', NULL, NULL, ''),
(12, 'RAIN', '500р', '12 08 2019', 'https://youtu.be/oSz4Mj73gss', '0', '1', NULL, NULL, ''),
(13, 'Вечный GLC', '850p', '18 08 2019', 'https://www.youtube.com/watch?v=uGfdSKpWWdM', 'с 12', '1', NULL, NULL, ''),
(14, 'FortynaTv', '200р', '13 08 2019', 'https://youtu.be/32A06YypaJA', '0', '1', NULL, NULL, ''),
(15, 'Листочик', '500p', '14 08 2019', 'https://www.youtube.com/watch?v=aWPCs4EIHog', '0', '1', NULL, NULL, ''),
(16, 'Minework', '150р', '13 08 2019', 'https://youtu.be/BBTfGyQqd68', '0', '1', NULL, NULL, ''),
(17, 'Fargo', '6000р', '14 08 2019', 'https://youtu.be/6E5_zqw_e4g', '0', '1', NULL, NULL, ''),
(18, 'All In', '9300р', '13 08 2019', 'https://youtu.be/NgtD0YX0R_Q', '0', '1', NULL, NULL, ''),
(19, 'LeFive', '700р', '14-15-16 08 2019', 'https://youtu.be/PugIv80QSkk', '0', '1', NULL, NULL, ''),
(20, 'katka_-_play', '300р', '13 08 2019', 'https://www.youtube.com/watch?v=SKyuVn64_gk', '0', '1', NULL, NULL, ''),
(21, 'FortynaTv', '200р', '14 08 2019', 'https://youtu.be/m4iu1z5Vq2s', '0', '1', NULL, NULL, ''),
(22, 'KomandiRTV', '1 000р', '14 08 2019', 'https://youtu.be/if8BKZVNC_4', '0', '1', NULL, NULL, ''),
(23, 'Банди', '8000р', '14 08 2019', 'https://www.youtube.com/watch?v=pru6arQkk4M', '79039228875', '1', NULL, NULL, ''),
(24, 'Froksay', '8000р', '15-16 08 2019', 'https://youtu.be/WjOJwq1oLTI', '0', '1', NULL, NULL, ''),
(25, 'БОГ', '7000р', '15 08 2019', 'https://youtu.be/IlTy3BLLTD8', '0', '1', NULL, NULL, ''),
(26, 'TheDenGames', '8000р', '15-18 08 2019', 'https://youtu.be/-JuAEKZWyPc', '0', '1', NULL, NULL, ''),
(27, 'FortynaTv', '177р', '15 08 2019', 'https://youtu.be/MSQh_hSJzCc', '0', '1', NULL, NULL, ''),
(28, 'JAMAL', '100р', '16 08 2019', 'https://www.youtube.com/watch?v=dtHQytePOnU&t=8s', '0', '1', NULL, NULL, ''),
(29, 'Klos Se', '120p', '15 08 2019', 'https://www.youtube.com/watch?v=SicDOH4DSZ4', '0', '1', NULL, NULL, ''),
(30, 'Minework', '125р', '20 08 2019', 'https://youtu.be/G2JioMUQpKs', '0', '1', NULL, NULL, ''),
(31, 'NeYTRush', '100р', '17 08 2019', 'https://youtu.be/gXGq3U1_Ejo', '0', '1', NULL, NULL, ''),
(32, 'ФОКС', '8000р', '15 08 2019', 'https://www.youtube.com/watch?v=rs_Re3kfyX4', '0', '1', NULL, NULL, ''),
(33, 'MatveyS', '1500р', '15 08 2019', 'https://youtu.be/LsPrz4D92aM', '79062751544', '1', NULL, NULL, ''),
(34, 'UFOBIRNE', '25000р', '20 08 2019', 'https://youtu.be/fVrqmZ0Hrio', '0', '1', NULL, NULL, ''),
(35, 'ЛАЙВ КАНАЛ', '700р', '15 08 2019', 'https://www.youtube.com/watch?v=5mvxrIyu5YA', '0', '1', NULL, NULL, ''),
(36, 'Школьник', '100', '15 08 2019', 'https://youtu.be/ZLfMDTUO_wQ', '0', '1', NULL, NULL, ''),
(37, 'FortynaTv', '85р', '16 08 2019', 'https://www.youtube.com/watch?v=EsfAHLyZb5Y&feature=youtu.be', '0', '1', NULL, NULL, ''),
(38, 'Хелин 3.0', '100р', '16 08 2019', 'https://www.youtube.com/watch?v=fEGxR1vUTPU', '0', '1', NULL, NULL, ''),
(39, 'Банди', '8000', '18 08 2019', 'https://www.youtube.com/watch?v=CGfL6CXk8Dk', '79039228875', '1', NULL, NULL, ''),
(40, 'CHANNEL STRELOK', '100р', '21 08 2019', 'https://www.youtube.com/watch?v=RLnnnva4EDs', '0', '1', NULL, NULL, ''),
(41, 'DruShLakTV', '15000р', '21 08 2019', 'https://youtu.be/EOkCURDN8i0', '0', '1', NULL, NULL, ''),
(42, 'FortynaTv', '100р', '16 08 2019', 'https://www.youtube.com/watch?v=KrM0KQz2_Cw&feature=youtu.be', '0', '1', NULL, NULL, ''),
(43, 'ХАЛЯВНЫЙ БУМА', '5000р', '19 08 2019', 'https://www.youtube.com/watch?v=Y98bfGEjw7E', '0', '1', NULL, NULL, ''),
(44, 'Зейт', '150р', '17 08 2019', 'https://youtu.be/QWTLdwudJBo', '0', '1', NULL, NULL, ''),
(45, 'Sardarov ЗАРАБОТОК В ИНТЕРНЕТЕ', '300р', '18-19 08 2019', 'https://www.youtube.com/watch?v=xOEfgtL-kwc&t', '0', '1', NULL, NULL, ''),
(46, 'Локос', '150р', '17 08 2019', 'https://www.youtube.com/watch?v=b-fAzqQAiBc', '0', '1', NULL, NULL, ''),
(47, 'FortynaTv', '150р', '17 08 2019', 'https://www.youtube.com/watch?v=wI2gd84nioo', '0', '1', NULL, NULL, ''),
(48, 'zhekBY', '200', '19-20 08 2019', 'https://www.youtube.com/watch?v=CgtADV8FHz0', '0', '1', NULL, NULL, ''),
(49, 'Famous Show', '1200р', '18 08 2019', 'https://www.youtube.com/watch?v=8NpNep-IrS4', '0', '1', NULL, NULL, ''),
(50, 'Fargo', '5000р', '28-31 08 2019', 'https://www.youtube.com/watch?v=PphlH99XQzE', '0', '1', NULL, NULL, ''),
(51, 'Вреднуля', '800р', '18 08 2019', 'https://youtu.be/M5iFxU2O6os', '79829824804', '1', NULL, NULL, ''),
(52, 'ШАРФ', '50 000р', '08 09 2019', 'https://www.youtube.com/watch?v=LPP0jx4WCW0&t=162s', '79992206082', '1', NULL, NULL, ''),
(53, 'FortynaTv', '75р', '19 08 2019', 'https://www.youtube.com/watch?v=wI2gd84nioo&t=8s', '0', '1', NULL, NULL, ''),
(54, 'Просто Трепутин', '800р', '20-23 08 2019', 'https://www.youtube.com/watch?v=gVIut01Y-hQ', '0', '1', NULL, NULL, ''),
(55, 'FortynaTv', '110р', '20 08 2019', 'https://www.youtube.com/watch?v=V4nSiJvRyc4', '0', '1', NULL, NULL, ''),
(56, 'FortynaTv', '100р', '21 08 2019', 'https://www.youtube.com/watch?v=MFwxCKepxDU', '0', '1', NULL, NULL, ''),
(57, 'UFOBIRNE', '25000р', '31 08 2019', 'https://www.youtube.com/watch?v=jXODx2fqGWk&t=4s', '0', '1', NULL, NULL, ''),
(58, 'Minework', '200р', '25 08 2019', 'https://www.youtube.com/watch?v=fJkAyolmxcw', '0', '1', NULL, NULL, ''),
(59, 'Lets`playshik Danek', '100р', '26 08 2019', 'https://www.youtube.com/watch?v=s8od7ZzMjaA', '0', '1', NULL, NULL, ''),
(60, 'Minework', '100р', '25 08 2019', 'https://youtu.be/8MlTQbUQP8I', '0', '1', NULL, NULL, ''),
(61, 'Lets`playshik Danek', '100р', '27 08 2019', 'Провёл стрим', '0', '1', NULL, NULL, ''),
(62, 'Зубрийцкий', '100р', '27 08 2019', 'https://www.youtube.com/watch?v=jrODr4qncgM&t=34s', '0', '1', NULL, NULL, ''),
(63, 'Minework', '100р', '29 08 2019', 'https://youtu.be/fJkAyolmxcw', '0', '1', NULL, NULL, ''),
(64, 'Просто Трепутин', '800р', '29 08 2019', 'https://www.youtube.com/watch?v=8kX2f5XV_aU&t=715s', '0', '1', NULL, NULL, ''),
(65, 'FortynaTv', '70р', '30 08 2019', 'https://www.youtube.com/watch?v=iRcX0D95LWU', '0', '1', NULL, NULL, ''),
(66, 'KomandiRTV', '1000р', '31 08 2019', 'https://youtu.be/q0oWqeCV19Q', '0', '1', NULL, NULL, ''),
(67, 'Банди', '8000р', '07 09 2019', 'https://www.youtube.com/watch?v=-YlrScn7dbQ&t=22s', '0', '1', NULL, NULL, ''),
(68, 'Омлет', '25000р', '05 09 2019', 'https://www.youtube.com/watch?v=NxWxiAoWBjQ', '0', '1', NULL, NULL, ''),
(69, 'Mostka', '1500р', '08 09 2019', 'https://www.youtube.com/watch?v=OKjLBX5Yl8M', '0', '1', NULL, NULL, ''),
(70, 'ХАЛЯВНЫЙ БУМА', '5 000', '08 09 2019', 'https://www.youtube.com/watch?v=HUXt9bxEiMg', '0', '1', NULL, NULL, ''),
(71, 'UFOBIRNE', '25000р', '20 08 2019', 'https://www.youtube.com/watch?v=5elyRFdI5_o&t=343s', '0', '1', NULL, NULL, ''),
(72, 'EXTRIM LIVE', '500р', '10-11 09 2019', 'https://www.youtube.com/watch?v=2Ao-yacXIVY', '0', '1', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_07_211640_create_reklama_table', 1),
(5, '2014_10_12_000000_create_users_table', 2),
(6, '2014_10_12_100000_create_password_resets_table', 2),
(7, '2019_09_25_053335_create_channels_table', 2),
(12, '2019_09_26_172513_create_counters_table', 4),
(13, '2019_09_26_055523_create_historyBuyChannels_table', 4),
(14, '2019_09_29_125804_create_buyChannels_table', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `reklama`
--

CREATE TABLE `reklama` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_vk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `like` int(11) NOT NULL,
  `shows` int(11) NOT NULL,
  `vkId` int(11) NOT NULL,
  `updateVideo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reklama`
--

INSERT INTO `reklama` (`id`, `name`, `price`, `url`, `url_vk`, `subscribe`, `like`, `shows`, `vkId`, `updateVideo`, `status`, `message`, `created_at`, `updated_at`) VALUES
(1, 'qwerwqer', '1324123', '4werqwer', 'https://vk.com/artemlein', '0 - 1.000', 341234, 234123412, 188345502, '7 видео в неделю', 1, 'qwerqwrq', NULL, NULL),
(2, 'Лох пузатый', '124124', 'http://localhost:8888/reklama/create', 'https://vk.com/artemlein', '10 000 - 25 000', 1234124, 24124124, 188345502, '7 видео в неделю', 0, 'qweqwe', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `remember_token`, `created_at`, `updated_at`, `avatar`, `user_id`, `admin`) VALUES
(1, 'Артём', NULL, '2019-09-30 10:56:07', '2019-09-30 10:56:07', '', '', 0),
(2, 'Артём Решетник', 'xEYflLAiVmTTAVYm7gY6PIgvp5E4JaYF5ozvW2jm2bNklJAcr3kx4NDMD7RV', '2019-11-15 13:20:32', '2019-11-15 13:20:32', 'https://sun9-62.userapi.com/c858032/v858032652/e39e9/PcSfix7sdGw.jpg?ava=1', '188345502', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `buyChannels`
--
ALTER TABLE `buyChannels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `historyBuyChannels`
--
ALTER TABLE `historyBuyChannels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `reklama`
--
ALTER TABLE `reklama`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `buyChannels`
--
ALTER TABLE `buyChannels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `channels`
--
ALTER TABLE `channels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1567;

--
-- AUTO_INCREMENT для таблицы `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `historyBuyChannels`
--
ALTER TABLE `historyBuyChannels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `reklama`
--
ALTER TABLE `reklama`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- База данных: `tri`
--
CREATE DATABASE IF NOT EXISTS `tri` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tri`;

-- --------------------------------------------------------

--
-- Структура таблицы `lesson`
--

CREATE TABLE `lesson` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dates` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_kurs` int(11) NOT NULL,
  `kurs` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `week` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lesson`
--

INSERT INTO `lesson` (`id`, `lesson`, `dates`, `teacher`, `group_kurs`, `kurs`, `time`, `day`, `week`) VALUES
(118, 'Математика', 'All', 'доц.Каримова Т.И.', 1, '1', '8.10 - 9.40', 'monday', 'down'),
(119, 'Математика', 'All', 'доц.Каримова Т.И.', 1, '1', '9.50-11.20', 'monday', 'up'),
(120, 'ТЭЦ', 'All', '2/316 Вабищевич', 1, '1', '9.50-11.20', 'monday', 'down'),
(121, 'МС и С в РЭ', 'All', '409 Маркевич', 1, '1', '11.30-13.00', 'monday', 'up'),
(122, 'Теория электрических цепей', 'All', '2/216 доц.Вабищевич Л.И. ', 1, '1', '11.30-13.00', 'monday', 'down'),
(123, 'М С и С в Р Э', 'All', '310 ст.пр.Маркевич К.М.', 1, '1', '13.30-15.00', 'monday', 'up'),
(124, 'Англ.яз. ', 'All', '513 Рахуба В.И.', 1, '1', '13.30-15.00', 'monday', 'down'),
(125, 'Англ.яз. ', 'All', '513 Рахуба В.И.', 1, '1', '15.10-16.40', 'monday', 'up'),
(126, 'Англ.яз.', 'All', '512a Зозуля О.Л. , 516 Ступина М.О. 513 Рахуба В.И. ', 1, '1', '16.50-18.20', 'tuesday', 'down'),
(127, 'Англ.яз.', 'All', '512a Зозуля О.Л. , 516 Ступина М.О. 513 Рахуба В.И. ', 1, '1', '8.10 - 9.40', 'tuesday', 'up'),
(128, 'Основы защиты информации', 'All', ' 2/103 ст.пр.Петров Д.О.', 1, '1', '8.10 - 9.40', 'tuesday', 'down'),
(129, 'Основы защиты информации', 'All', ' 2/103 ст.пр.Петров Д.О.', 1, '1', '9.50-11.20', 'tuesday', 'up'),
(130, 'Нету', 'D 10.9, 8.10,5.11, 3.12', '2/300 Петров', 1, '1', '9.50-11.20', 'tuesday', 'down'),
(131, 'ОЗИ', 'All', '2/300 Петров', 1, '1', '11.30-13.00', 'tuesday', 'down'),
(132, 'Электронные приборы', 'All', 'Буслюк', 1, '1', '15.10-16.40', 'tuesday', 'up'),
(133, 'Филиал', 'All', 'Филиал', 1, '1', '15.10-16.40', 'tuesday', 'down'),
(134, 'Б Ж Ч  пр.', 'D 23.10 - 4.12', '138 ст.пр.Лешко Г.В.', 1, '1', '15.10-16.40', 'wednesday', 'down'),
(135, 'Теория электрических цепей   пр.', 'All', '138 доц.Вабищевич Л.И.', 1, '1', '16.50-18.20', 'wednesday', 'up'),
(136, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 1, '1', '16.50-18.20', 'wednesday', 'down'),
(137, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 1, '1', '8.10 - 9.40', 'wednesday', 'up'),
(138, 'Физическая культура', 'All', 'Нету', 1, '1', '8.10 - 9.40', 'wednesday', 'down'),
(139, 'Физическая культура', 'All', 'Нету', 1, '1', '9.50-11.20', 'wednesday', 'up'),
(140, 'Физика  пр.', 'All', '313 асс.Савчук О.Ф.', 1, '1', '9.50-11.20', 'wednesday', 'down'),
(141, 'Б Ж Ч  пр.', 'All', '416 доц.Левчук Н.В.', 1, '1', '13.30-15.00', 'thurstay', 'down'),
(142, 'Физические основы электронной техники', 'All', '402 ст.пр.Янусик И.С.', 1, '1', '15.10-16.40', 'thurstay', 'down'),
(143, 'Физические основы электронной техники', 'All', '402 ст.пр.Янусик И.С.', 1, '1', '16.50-18.20', 'thurstay', 'up'),
(144, 'Англ.яз.', 'All', '512а Зозуля О.Л., 516  Ступина М.О., 515  Рахуба В.И. ', 1, '1', '16.50-18.20', 'thurstay', 'down'),
(145, 'Англ.яз.', 'All', '512а Зозуля О.Л., 516  Ступина М.О., 515  Рахуба В.И. ', 1, '1', '8.10 - 9.40', 'thurstay', 'up'),
(146, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 1, '1', '9.50-11.20', 'thurstay', 'up'),
(147, 'ФОЭТ', 'All', '410 Янусик', 1, '1', '8.10 - 9.40', 'friday', 'up'),
(148, 'Физика', 'All', '401 ст.пр.Борушко В.В.', 1, '1', '8.10 - 9.40', 'friday', 'down'),
(149, 'Физика', 'All', '401 ст.пр.Борушко В.В.', 1, '1', '8.10 - 9.40', 'friday', 'up'),
(150, 'БЖЧ', 'All', '401 ст.пр.Лешко Г.В. (6.09 13.09), доц Барковская М.М.(20.09 27.09 4.10), доц.Левчук Н.В. (c 11.10)', 1, '1', '8.10 - 9.40', 'friday', 'down'),
(151, 'БЖЧ', 'All', '401 ст.пр.Лешко Г.В. (6.09, 13.09), доц Барковская М.М.(20.09 27.09 4.10), доц.Левчук Н.В. (c 11.10)', 1, '1', '8.10 - 9.40', 'friday', 'up'),
(152, 'БЖЧ', 'All', '412 Савчук', 1, '1', '8.10 - 9.40', 'friday', 'down'),
(153, 'БЖЧ', 'D 6.09', '512 Лешко', 1, '1', '8.10 - 9.40', 'friday', 'up'),
(154, 'Физика  по 22.11', 'All', '404 Савчук', 1, '1', '8.10 - 9.40', 'friday', 'down'),
(155, 'Математика', 'All', 'доц.Каримова Т.И.', 2, '0', '8.10 - 9.40', 'monday', 'down'),
(156, 'Математика', 'All', 'доц.Каримова Т.И.', 2, '0', '9.50-11.20', 'monday', 'up'),
(157, 'МС и С в РЭ', 'All', '409 Маркевич', 2, '0', '9.50-11.20', 'monday', 'down'),
(158, 'ТЭЦ', 'All', '2/316  Вабищевич', 2, '0', '11.30-13.00', 'monday', 'up'),
(159, 'Теория электрических цепей', 'All', '2/216 доц.Вабищевич Л.И. ', 2, '0', '11.30-13.00', 'monday', 'down'),
(160, 'М С и С в Р Э', 'All', '310 ст.пр.Маркевич К.М.', 2, '0', '13.30-15.00', 'monday', 'up'),
(161, 'Англ.яз. ', 'All', '513 Рахуба В.И.', 2, '0', '13.30-15.00', 'monday', 'down'),
(162, 'Англ.яз. ', 'All', '513 Рахуба В.И.', 2, '0', '15.10-16.40', 'monday', 'up'),
(163, 'Англ.яз.', 'All', '512a Зозуля О.Л. , 516 Ступина М.О. 513 Рахуба В.И. ', 2, '0', '16.50-18.20', 'tuesday', 'down'),
(164, 'Англ.яз.', 'All', '512a Зозуля О.Л. , 516 Ступина М.О. 513 Рахуба В.И. ', 2, '0', '8.10 - 9.40', 'tuesday', 'up'),
(165, 'Основы защиты информации', 'All', ' 2/103 ст.пр.Петров Д.О.', 2, '0', '8.10 - 9.40', 'tuesday', 'down'),
(166, 'Основы защиты информации', 'All', ' 2/103 ст.пр.Петров Д.О.', 2, '0', '9.50-11.20', 'tuesday', 'up'),
(167, 'Предмет', 'D 10.9, 8.10,5.11, 3.12', '2/300 Петров', 2, '0', '11.30-13.00', 'tuesday', 'up'),
(168, 'ОЗИ', 'All', '2/300 Петров', 2, '0', '13.30-15.00', 'tuesday', 'up'),
(169, 'Электронные приборы', 'All', 'Буслюк', 2, '0', '15.10-16.40', 'tuesday', 'up'),
(170, 'Филиал', 'All', 'Филиал', 2, '0', '15.10-16.40', 'tuesday', 'down'),
(171, 'Б Ж Ч  пр.', 'All', '138 ст.пр.Лешко Г.В.', 2, '0', '15.10-16.40', 'wednesday', 'down'),
(172, 'Теория электрических цепей   пр.', 'All', '138 доц.Вабищевич Л.И.', 2, '0', '16.50-18.20', 'wednesday', 'up'),
(173, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 2, '0', '16.50-18.20', 'wednesday', 'down'),
(174, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 2, '0', '8.10 - 9.40', 'wednesday', 'up'),
(175, 'Физическая культура', 'All', 'Нету', 2, '0', '8.10 - 9.40', 'wednesday', 'down'),
(176, 'Физическая культура', 'All', 'Нету', 2, '0', '9.50-11.20', 'wednesday', 'up'),
(177, 'Физика  пр.', 'All', '313 асс.Савчук О.Ф.', 2, '0', '9.50-11.20', 'wednesday', 'down'),
(178, 'Б Ж Ч  пр.', 'All', '416 доц.Левчук Н.В.', 2, '0', '13.30-15.00', 'thurstay', 'down'),
(179, 'Физические основы электронной техники', 'All', '402 ст.пр.Янусик И.С.', 2, '0', '15.10-16.40', 'thurstay', 'down'),
(180, 'Физические основы электронной техники', 'All', '402 ст.пр.Янусик И.С.', 2, '0', '16.50-18.20', 'thurstay', 'up'),
(181, 'Англ.яз.', 'All', '512а Зозуля О.Л., 516  Ступина М.О., 515  Рахуба В.И. ', 2, '0', '16.50-18.20', 'thurstay', 'down'),
(182, 'Англ.яз.', 'All', '512а Зозуля О.Л., 516  Ступина М.О., 515  Рахуба В.И. ', 2, '0', '8.10 - 9.40', 'thurstay', 'up'),
(183, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 2, '0', '9.50-11.20', 'thurstay', 'up'),
(184, 'ФОЭТ', 'All', '410 Янусик', 2, '0', '8.10 - 9.40', 'friday', 'down'),
(185, 'Физика', 'All', '401 ст.пр.Борушко В.В.', 2, '0', '8.10 - 9.40', 'friday', 'down'),
(186, 'Физика', 'All', '401 ст.пр.Борушко В.В.', 2, '0', '8.10 - 9.40', 'friday', 'up'),
(187, 'БЖЧ', 'All', '401 ст.пр.Лешко Г.В. (6.09, 13.09), доц Барковская М.М.(20.09 27.09 4.10), доц.Левчук Н.В. (c 11.10)', 2, '0', '8.10 - 9.40', 'friday', 'down'),
(188, 'БЖЧ', 'All', '401 ст.пр.Лешко Г.В. (6.09, 13.09), доц Барковская М.М.(20.09 27.09 4.10), доц.Левчук Н.В. (c 11.10)', 2, '0', '8.10 - 9.40', 'friday', 'up'),
(189, '13.09        БЖЧ', 'All', '512 Лешко', 2, '0', '8.10 - 9.40', 'friday', 'down'),
(190, 'БЖЧ', 'All', '412 Савчук ', 2, '0', '8.10 - 9.40', 'friday', 'up');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2019_09_20_120030_create_lesson_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rasp`
--

CREATE TABLE `rasp` (
  `id` int(100) NOT NULL,
  `lesson` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dates` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_kurs` int(3) NOT NULL,
  `kurs` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `week` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rasp`
--

INSERT INTO `rasp` (`id`, `lesson`, `dates`, `teacher`, `group_kurs`, `kurs`, `time`, `day`, `week`) VALUES
(4191, 'Математика', 'All', 'доц.Каримова Т.И.', 2, 'ПЭ-19', '8.10 - 9.40', 'monday', 'up'),
(4192, 'Математика', 'All', 'доц.Каримова Т.И.', 2, 'ПЭ-19', '8.10 - 9.40', 'monday', 'down'),
(4193, 'МС и С в РЭ', 'All', '409 Маркевич', 2, 'ПЭ-19', '9.50-11.20', 'monday', 'up'),
(4194, 'ТЭЦ', 'All', '2/316  Вабищевич', 2, 'ПЭ-19', '9.50-11.20', 'monday', 'down'),
(4195, 'Теория электрических цепей', 'All', '2/216 доц.Вабищевич Л.И. ', 2, 'ПЭ-19', '11.30-13.00', 'monday', 'up'),
(4196, 'М С и С в Р Э', 'All', '310 ст.пр.Маркевич К.М.', 2, 'ПЭ-19', '11.30-13.00', 'monday', 'down'),
(4197, 'Англ.яз. ', 'All', '513 Рахуба В.И.', 2, 'ПЭ-19', '13.30-15.00', 'monday', 'up'),
(4198, 'Англ.яз. ', 'All', '513 Рахуба В.И.', 2, 'ПЭ-19', '13.30-15.00', 'monday', 'down'),
(4199, 'Англ.яз.', 'All', '512a Зозуля О.Л. , 516 Ступина М.О. 513 Рахуба В.И. ', 2, 'ПЭ-19', '8.10 - 9.40', 'tuesday', 'up'),
(4200, 'Англ.яз.', 'All', '512a Зозуля О.Л. , 516 Ступина М.О. 513 Рахуба В.И. ', 2, 'ПЭ-19', '8.10 - 9.40', 'tuesday', 'down'),
(4201, 'Основы защиты информации', 'All', ' 2/103 ст.пр.Петров Д.О.', 2, 'ПЭ-19', '9.50-11.20', 'tuesday', 'up'),
(4202, 'Основы защиты информации', 'All', ' 2/103 ст.пр.Петров Д.О.', 2, 'ПЭ-19', '9.50-11.20', 'tuesday', 'down'),
(4203, 'Предмет', 'D 10.9, 8.10,5.11, 3.12', '2/300 Петров', 2, 'ПЭ-19', '11.30-13.00', 'tuesday', 'down'),
(4204, 'ОЗИ', 'All', '2/300 Петров', 2, 'ПЭ-19', '13.30-15.00', 'tuesday', 'down'),
(4205, 'Электронные приборы', 'All', 'Буслюк', 2, 'ПЭ-19', '15.10-16.40', 'tuesday', 'down'),
(4206, 'Филиал', 'All', 'Филиал', 2, 'ПЭ-19', '16.50-18.20', 'tuesday', 'up'),
(4207, 'Б Ж Ч  пр.', 'All', '138 ст.пр.Лешко Г.В.', 2, 'ПЭ-19', '8.10 - 9.40', 'wednesday', 'up'),
(4208, 'Теория электрических цепей   пр.', 'All', '138 доц.Вабищевич Л.И.', 2, 'ПЭ-19', '8.10 - 9.40', 'wednesday', 'down'),
(4209, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 2, 'ПЭ-19', '9.50-11.20', 'wednesday', 'up'),
(4210, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 2, 'ПЭ-19', '9.50-11.20', 'wednesday', 'down'),
(4211, 'Физическая культура', 'All', 'Нету', 2, 'ПЭ-19', '11.30-13.00', 'wednesday', 'up'),
(4212, 'Физическая культура', 'All', 'Нету', 2, 'ПЭ-19', '11.30-13.00', 'wednesday', 'down'),
(4213, 'Физика  пр.', 'All', '313 асс.Савчук О.Ф.', 2, 'ПЭ-19', '13.30-15.00', 'wednesday', 'up'),
(4214, 'Б Ж Ч  пр.', 'All', '416 доц.Левчук Н.В.', 2, 'ПЭ-19', '8.10 - 9.40', 'thursday', 'up'),
(4215, 'Физические основы электронной техники', 'All', '402 ст.пр.Янусик И.С.', 2, 'ПЭ-19', '9.50-11.20', 'thursday', 'up'),
(4216, 'Физические основы электронной техники', 'All', '402 ст.пр.Янусик И.С.', 2, 'ПЭ-19', '9.50-11.20', 'thursday', 'down'),
(4217, 'Англ.яз.', 'All', '512а Зозуля О.Л., 516  Ступина М.О., 515  Рахуба В.И. ', 2, 'ПЭ-19', '11.30-13.00', 'thursday', 'up'),
(4218, 'Англ.яз.', 'All', '512а Зозуля О.Л., 516  Ступина М.О., 515  Рахуба В.И. ', 2, 'ПЭ-19', '11.30-13.00', 'thursday', 'down'),
(4219, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 2, 'ПЭ-19', '13.30-15.00', 'thursday', 'down'),
(4220, 'ФОЭТ', 'All', '410 Янусик', 2, 'ПЭ-19', '8.10 - 9.40', 'friday', 'up'),
(4221, 'Физика', 'All', '401 ст.пр.Борушко В.В.', 2, 'ПЭ-19', '9.50-11.20', 'friday', 'up'),
(4222, 'Физика', 'All', '401 ст.пр.Борушко В.В.', 2, 'ПЭ-19', '9.50-11.20', 'friday', 'down'),
(4223, 'БЖЧ', 'All', '401 ст.пр.Лешко Г.В. (6.09, 13.09), доц Барковская М.М.(20.09 27.09 4.10), доц.Левчук Н.В. (c 11.10)', 2, 'ПЭ-19', '11.30-13.00', 'friday', 'up'),
(4224, 'БЖЧ', 'All', '401 ст.пр.Лешко Г.В. (6.09, 13.09), доц Барковская М.М.(20.09 27.09 4.10), доц.Левчук Н.В. (c 11.10)', 2, 'ПЭ-19', '11.30-13.00', 'friday', 'down'),
(4225, '13.09        БЖЧ', 'All', '512 Лешко', 2, 'ПЭ-19', '13.30-15.00', 'friday', 'up'),
(4226, 'БЖЧ', 'All', '412 Савчук ', 2, 'ПЭ-19', '13.30-15.00', 'friday', 'down'),
(4227, 'Физика по 15.11', 'All', '404 Савчук', 2, 'ПЭ-19', '15.10-16.40', 'friday', 'down'),
(4228, 'Физическая культура', 'All', 'Физическая культура', 2, 'ПЭ-19', '8.10 - 9.40', 'saturday', 'up'),
(4229, 'Физическая культура', 'All', 'Физическая культура', 2, 'ПЭ-19', '8.10 - 9.40', 'saturday', 'down'),
(4230, 'Электронные приборы  пр.', 'All', '2/216 доц.Буслюк В.В.', 2, 'ПЭ-19', '9.50-11.20', 'saturday', 'up'),
(4231, 'Ф О Э Т пр.', 'All', '310 ст.пр.Янусик И.С.', 2, 'ПЭ-19', '9.50-11.20', 'saturday', 'down'),
(4232, 'Электронные приборы', 'All', '2/216 доц Буслюк В.В.', 2, 'ПЭ-19', '11.30-13.00', 'saturday', 'up'),
(4233, 'Электронные приборы', 'All', '2/216 доц Буслюк В.В.', 2, 'ПЭ-19', '11.30-13.00', 'saturday', 'down'),
(4234, 'Англ.яз.', 'All', '512а Зозуля О.Л., 515 Ступина М.О.', 2, 'ПЭ-19', '13.30-15.00', 'saturday', 'up'),
(4235, 'Англ.яз.', 'All', '512а Зозуля О.Л., 515 Ступина М.О.', 2, 'ПЭ-19', '13.30-15.00', 'saturday', 'down'),
(4236, 'Математика', 'All', 'доц.Каримова Т.И.', 1, 'ПЭ-19', '8.10 - 9.40', 'monday', 'up'),
(4237, 'Математика', 'All', 'доц.Каримова Т.И.', 1, 'ПЭ-19', '8.10 - 9.40', 'monday', 'down'),
(4238, 'ТЭЦ', 'All', '2/316 Вабищевич', 1, 'ПЭ-19', '9.50-11.20', 'monday', 'up'),
(4239, 'МС и С в РЭ', 'All', '409 Маркевич', 1, 'ПЭ-19', '9.50-11.20', 'monday', 'down'),
(4240, 'Теория электрических цепей', 'All', '2/216 доц.Вабищевич Л.И. ', 1, 'ПЭ-19', '11.30-13.00', 'monday', 'up'),
(4241, 'М С и С в Р Э', 'All', '310 ст.пр.Маркевич К.М.', 1, 'ПЭ-19', '11.30-13.00', 'monday', 'down'),
(4242, 'Англ.яз. ', 'All', '513 Рахуба В.И.', 1, 'ПЭ-19', '13.30-15.00', 'monday', 'up'),
(4243, 'Англ.яз. ', 'All', '513 Рахуба В.И.', 1, 'ПЭ-19', '13.30-15.00', 'monday', 'down'),
(4244, 'Англ.яз.', 'All', '512a Зозуля О.Л. , 516 Ступина М.О. 513 Рахуба В.И. ', 1, 'ПЭ-19', '8.10 - 9.40', 'tuesday', 'up'),
(4245, 'Англ.яз.', 'All', '512a Зозуля О.Л. , 516 Ступина М.О. 513 Рахуба В.И. ', 1, 'ПЭ-19', '8.10 - 9.40', 'tuesday', 'down'),
(4246, 'Основы защиты информации', 'All', ' 2/103 ст.пр.Петров Д.О.', 1, 'ПЭ-19', '9.50-11.20', 'tuesday', 'up'),
(4247, 'Основы защиты информации', 'All', ' 2/103 ст.пр.Петров Д.О.', 1, 'ПЭ-19', '9.50-11.20', 'tuesday', 'down'),
(4248, 'Нету', 'D 10.9, 8.10,5.11, 3.12', '2/300 Петров', 1, 'ПЭ-19', '11.30-13.00', 'tuesday', 'up'),
(4249, 'ОЗИ', 'All', '2/300 Петров', 1, 'ПЭ-19', '13.30-15.00', 'tuesday', 'up'),
(4250, 'Электронные приборы', 'All', 'Буслюк', 1, 'ПЭ-19', '15.10-16.40', 'tuesday', 'down'),
(4251, 'Филиал', 'All', 'Филиал', 1, 'ПЭ-19', '16.50-18.20', 'tuesday', 'up'),
(4252, 'Б Ж Ч  пр.', 'D 23.10 - 4.12', '138 ст.пр.Лешко Г.В.', 1, 'ПЭ-19', '8.10 - 9.40', 'wednesday', 'up'),
(4253, 'Теория электрических цепей   пр.', 'All', '138 доц.Вабищевич Л.И.', 1, 'ПЭ-19', '8.10 - 9.40', 'wednesday', 'down'),
(4254, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 1, 'ПЭ-19', '9.50-11.20', 'wednesday', 'up'),
(4255, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 1, 'ПЭ-19', '9.50-11.20', 'wednesday', 'down'),
(4256, 'Физическая культура', 'All', 'Нету', 1, 'ПЭ-19', '11.30-13.00', 'wednesday', 'up'),
(4257, 'Физическая культура', 'All', 'Нету', 1, 'ПЭ-19', '11.30-13.00', 'wednesday', 'down'),
(4258, 'Физика  пр.', 'All', '313 асс.Савчук О.Ф.', 1, 'ПЭ-19', '13.30-15.00', 'wednesday', 'up'),
(4259, 'Б Ж Ч  пр.', 'All', '416 доц.Левчук Н.В.', 1, 'ПЭ-19', '8.10 - 9.40', 'thursday', 'up'),
(4260, 'Физические основы электронной техники', 'All', '402 ст.пр.Янусик И.С.', 1, 'ПЭ-19', '9.50-11.20', 'thursday', 'up'),
(4261, 'Физические основы электронной техники', 'All', '402 ст.пр.Янусик И.С.', 1, 'ПЭ-19', '9.50-11.20', 'thursday', 'down'),
(4262, 'Англ.яз.', 'All', '512а Зозуля О.Л., 516  Ступина М.О., 515  Рахуба В.И. ', 1, 'ПЭ-19', '11.30-13.00', 'thursday', 'up'),
(4263, 'Англ.яз.', 'All', '512а Зозуля О.Л., 516  Ступина М.О., 515  Рахуба В.И. ', 1, 'ПЭ-19', '11.30-13.00', 'thursday', 'down'),
(4264, 'Математика  пр.', 'All', '511 ст.пр.Юхимук М.М.', 1, 'ПЭ-19', '13.30-15.00', 'thursday', 'down'),
(4265, 'ФОЭТ', 'All', '410 Янусик', 1, 'ПЭ-19', '8.10 - 9.40', 'friday', 'down'),
(4266, 'Физика', 'All', '401 ст.пр.Борушко В.В.', 1, 'ПЭ-19', '9.50-11.20', 'friday', 'up'),
(4267, 'Физика', 'All', '401 ст.пр.Борушко В.В.', 1, 'ПЭ-19', '9.50-11.20', 'friday', 'down'),
(4268, 'БЖЧ', 'All', '401 ст.пр.Лешко Г.В. (6.09 13.09), доц Барковская М.М.(20.09 27.09 4.10), доц.Левчук Н.В. (c 11.10)', 1, 'ПЭ-19', '11.30-13.00', 'friday', 'up'),
(4269, 'БЖЧ', 'All', '401 ст.пр.Лешко Г.В. (6.09, 13.09), доц Барковская М.М.(20.09 27.09 4.10), доц.Левчук Н.В. (c 11.10)', 1, 'ПЭ-19', '11.30-13.00', 'friday', 'down'),
(4270, 'БЖЧ', 'All', '412 Савчук', 1, 'ПЭ-19', '13.30-15.00', 'friday', 'up'),
(4271, 'БЖЧ', 'D 6.09', '512 Лешко', 1, 'ПЭ-19', '13.30-15.00', 'friday', 'down'),
(4272, 'Физика  по 22.11', 'All', '404 Савчук', 1, 'ПЭ-19', '15.10-16.40', 'friday', 'up'),
(4273, 'Физическая культура', 'All', 'Физическая культура', 1, 'ПЭ-19', '8.10 - 9.40', 'saturday', 'up'),
(4274, 'Физическая культура', 'All', 'Физическая культура', 1, 'ПЭ-19', '8.10 - 9.40', 'saturday', 'down'),
(4275, 'Электронные приборы  пр.', 'All', '2/216 доц.Буслюк В.В.', 1, 'ПЭ-19', '9.50-11.20', 'saturday', 'up'),
(4276, 'Ф О Э Т пр.', 'All', '310 ст.пр.Янусик И.С.', 1, 'ПЭ-19', '9.50-11.20', 'saturday', 'down'),
(4277, 'Электронные приборы', 'All', '2/216 доц Буслюк В.В.', 1, 'ПЭ-19', '11.30-13.00', 'saturday', 'up'),
(4278, 'Электронные приборы', 'All', '2/216 доц Буслюк В.В.', 1, 'ПЭ-19', '11.30-13.00', 'saturday', 'down'),
(4279, 'Англ.яз.', 'All', '512а Зозуля О.Л., 515 Ступина М.О.', 1, 'ПЭ-19', '13.30-15.00', 'saturday', 'up'),
(4280, 'Англ.яз..', 'D 142345152', '512а Зозуля О.Л., 515 Ступина М.О.', 1, 'ПЭ-19', '13.30-15.00', 'saturday', 'down');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_teacher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_kurs` int(11) DEFAULT NULL,
  `kurs` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `name_teacher`, `email`, `email_verified_at`, `password`, `group_kurs`, `kurs`, `teacher`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Lane4s', NULL, 'lane.artemleine@gmail.com', NULL, '1', 2, 'ПЭ-19', 0, NULL, '2019-09-21 15:04:13', '2019-09-21 15:04:13'),
(4, 'asdasda', 'Янусик', 'lane.artemlein@gmail.com', NULL, '2', 1, 'ПЭ-19', 0, NULL, '2019-09-22 06:01:54', '2019-09-22 06:01:54'),
(5, 'asdasdas', 'Маркевич', 'asdasdweq@gmail.com', NULL, '2', 1, 'ПЭ-19', 1, NULL, '2019-09-22 10:58:50', '2019-09-22 10:58:50'),
(6, 'sdfsdf', NULL, 'lane.artemlein22@gmail.com', NULL, '1', NULL, 'ПЭ-19', 0, NULL, '2019-09-23 07:35:54', '2019-09-23 07:35:54'),
(7, 'asdaweq', 'Маркевич', 'lane.artemleiqqn@gmail.com', NULL, 'yh4-9Jd-W6c-WQv', 1, 'ПЭ-19', 0, NULL, '2019-09-23 07:38:08', '2019-09-23 07:38:08');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `rasp`
--
ALTER TABLE `rasp`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `rasp`
--
ALTER TABLE `rasp`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4281;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- База данных: `trynew`
--
CREATE DATABASE IF NOT EXISTS `trynew` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `trynew`;

-- --------------------------------------------------------

--
-- Структура таблицы `rasp`
--

CREATE TABLE `rasp` (
  `id` int(10) NOT NULL,
  `teacher` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lesson` int(20) NOT NULL,
  `kurs` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `rasp`
--
ALTER TABLE `rasp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `rasp`
--
ALTER TABLE `rasp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- База данных: `vue-test`
--
CREATE DATABASE IF NOT EXISTS `vue-test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vue-test`;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Артём', 'lane.artemlein@gmail.com', NULL, '$2y$10$NZJYqvHwm3i65k/K.40gRu./9lVemq0.JUe2vmZe1xBn5p8F4KRY2', NULL, '2019-09-30 10:49:18', '2019-09-30 10:49:18');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
