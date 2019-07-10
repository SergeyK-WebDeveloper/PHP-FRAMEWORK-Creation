-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 21 2019 г., 13:06
-- Версия сервера: 5.5.41-log
-- Версия PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `fw`
--
CREATE DATABASE IF NOT EXISTS `fw` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fw`;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=896 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `parent`, `alias`) VALUES
(685, 'Комплектующие к Apple', 0, 'komplektuyuschie-k-apple'),
(691, 'Запчасти iPad', 685, 'zapchasti-ipad'),
(692, 'Запчасти iPhone', 685, 'zapchasti-iphone'),
(693, 'Запчасти iPod', 685, 'zapchasti-ipod'),
(694, 'Запчасти Mac', 685, 'zapchasti-mac'),
(695, 'iPad', 691, 'ipad'),
(696, 'iPad 2', 691, 'ipad-2'),
(697, 'iPad NEW (iPad 3)', 691, 'ipad-new-ipad-3'),
(698, 'iPad 4', 691, 'ipad-4'),
(699, 'iPad mini', 691, 'ipad-mini'),
(700, 'iPhone', 692, 'iphone'),
(701, 'iPhone 3G/3GS', 692, 'iphone-3g-3gs'),
(702, 'iPhone 4', 692, 'iphone-4'),
(703, 'iPhone 4S', 692, 'iphone-4s'),
(704, 'iPhone 5', 692, 'iphone-5'),
(705, 'Микросхемы Apple', 685, 'mikroshemy-apple'),
(836, 'Защитные плёнки на Apple', 0, 'zaschitnye-plenki-na-apple'),
(840, 'iPad', 836, 'ipad-840'),
(841, 'iPhone', 836, 'iphone-841'),
(842, 'iPod', 836, 'ipod'),
(843, 'Mac', 836, 'mac'),
(853, 'Оборудование для ремонта Apple', 0, 'oborudovanie-dlya-remonta-apple'),
(876, 'Аксессуары для Apple', 0, 'aksessuary-dlya-apple'),
(877, 'Аксессуары iPad', 876, 'aksessuary-ipad'),
(878, 'Аксессуары iPhone', 876, 'aksessuary-iphone'),
(879, 'Аксессуары iPod', 876, 'aksessuary-ipod'),
(880, 'Аксессуары Mac', 876, 'aksessuary-mac'),
(881, 'iPad', 877, 'ipad-881'),
(882, 'iPad 2', 877, 'ipad-2-882'),
(883, 'iPad NEW 3 / iPad 4', 877, 'ipad-new-3-ipad-4'),
(884, 'iPad mini', 877, 'ipad-mini-884'),
(885, 'iPhone 3G / 3GS', 878, 'iphone-3g-3gs-885'),
(886, 'iPhone 4 / 4S', 878, 'iphone-4-4s'),
(887, 'iPhone 5', 878, 'iphone-5-887'),
(888, 'Аксессуары для Apple', 876, 'aksessuary-dlya-apple-888'),
(895, 'iPhone 5 Lamborghini', 878, 'iphone-5-lamborghini');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Категория 1'),
(2, 'Category 2'),
(3, 'Категория 3'),
(4, 'Category 3'),
(5, 'Категория 3'),
(6, 'Категория 3');

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `base` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `languages`
--

INSERT INTO `languages` (`id`, `code`, `title`, `base`) VALUES
(1, 'ru', 'Русский', '1'),
(2, 'en', 'English', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `lang_code`, `category_id`, `title`, `excerpt`, `text`, `keywords`, `description`) VALUES
(1, 'ru', 2, 'Адаптивный дизайн сайта и основные стратегии по его внедрению', 'RU. Адаптивный дизайн сайта — это совершенно новый подход к дизайну, который привлекает к себе все больше внимания, но, учитывая, насколько сильно он отличается от традиционных методов разработки, вначале он может показаться заоблачно сложным для начинающ', '<p>RU. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', 'адаптивный дизайн', 'Адаптивный дизайн сайта и основные стратегии по его внедрению'),
(2, 'ru', 2, 'Советы по выравниванию иконок в тексте', 'RU. Иконки сейчас очень популярны, они дополняют контент (в большинстве случаев). Но с другой стороны они могут доставить немало хлопот. Если вы определились с форматом (SVG или шрифты-иконки?) и создали сами иконки, все равно по мере разработки будут всп', '<p>RU. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', 'ключевики', 'мета-описание'),
(3, 'ru', 1, 'Редко используемые селекторы JQuery', 'RU. Селекторы в JQuery играют главенствующую роль. Большинство методов в JQuery работают только на каких-то элементах, поэтому перед их использованием необходимо выбрать какой-либо тег. К примеру, чтобы прикрепить событие click к кнопке, эту кнопку сначал', '<p>RU. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', NULL, NULL),
(4, 'ru', 4, 'Тестовый пост', 'RU. lorem ipsum...', '<p>RU. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', '', ''),
(5, 'ru', 4, 'Тестовый пост 2', 'RU. Краткое описание статьи "Тестовый пост"', '42342', '', ''),
(6, 'en', 2, 'Adaptive site design and basic strategies for its implementation', 'EN. Адаптивный дизайн сайта — это совершенно новый подход к дизайну, который привлекает к себе все больше внимания, но, учитывая, насколько сильно он отличается от традиционных методов разработки, вначале он может показаться заоблачно сложным для начинающ', '<p>EN. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia optio odit unde quam dolore vel vitae in! Obcaecati velit rem alias exercitationem error eveniet autem, voluptatibus esse ab placeat blanditiis omnis! Necessitatibus, officia velit, laboriosam deleniti quis aperiam? Nesciunt inventore consequuntur dolores, excepturi magnam illum modi unde quis sit deserunt.</p>', 'adaptive design', 'Adaptive site design and basic strategies for its implementation');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `name`, `role`) VALUES
(2, 'user1', '$2y$10$vv1DsfTic/kfr4gvEBv//eE5bvPivwhSEGNjU0Schv.RM.qtSE24u', '1@1.com', 'User1', 'user'),
(4, 'user2', '$2y$10$cR5wSs51sFjvmj.5dfuiaOJ5/YJSRLHV3h7bkfGaemkWno8HPNEXG', '2@1.com', 'User2', 'user'),
(5, 'user3', '$2y$10$4LEj9TCvP6tMg.jNKJ8/E.nObJCjcX0JXLHBR0yZFrUcfTnZ.SxXK', '3@1.com', 'User3', 'user');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
