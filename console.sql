-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3308
-- Время создания: Июн 21 2020 г., 08:54
-- Версия сервера: 8.0.18
-- Версия PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `console`
--

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `name`) VALUES
(1, 'John'),
(2, 'Jane'),
(3, 'Alex'),
(4, 'Tom');

-- --------------------------------------------------------

--
-- Структура таблицы `time_reports`
--

DROP TABLE IF EXISTS `time_reports`;
CREATE TABLE IF NOT EXISTS `time_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `hours` float NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `time_reports`
--

INSERT INTO `time_reports` (`id`, `employee_id`, `hours`, `date`) VALUES
(1, 1, 4.5, '2020-05-01'),
(2, 1, 5.7, '2020-05-02'),
(3, 1, 6.3, '2020-05-03'),
(4, 1, 6.5, '2020-05-03'),
(5, 1, 7.5, '2020-05-04'),
(6, 1, 7.1, '2020-05-05'),
(7, 1, 5.1, '2020-05-06'),
(8, 1, 5.9, '2020-05-07'),
(9, 1, 5.7, '2020-05-08'),
(10, 1, 6.2, '2020-05-09'),
(11, 1, 6.8, '2020-05-10'),
(12, 2, 5.5, '2020-05-01'),
(13, 2, 5.4, '2020-05-02'),
(14, 2, 5.5, '2020-05-03'),
(15, 2, 7.2, '2020-05-04'),
(16, 2, 8.1, '2020-05-05'),
(17, 2, 7.1, '2020-05-06'),
(18, 2, 6.6, '2020-05-07'),
(19, 2, 6.5, '2020-05-08'),
(20, 2, 7.3, '2020-05-09'),
(21, 2, 7.3, '2020-05-10'),
(22, 3, 7.3, '2020-05-01'),
(23, 3, 7.3, '2020-05-02'),
(24, 3, 7.9, '2020-05-03'),
(25, 3, 7.7, '2020-05-04'),
(26, 3, 7.2, '2020-05-05'),
(27, 3, 5.2, '2020-05-06'),
(28, 3, 5.1, '2020-05-07'),
(29, 3, 5.3, '2020-05-08'),
(30, 3, 5.8, '2020-05-09'),
(31, 3, 5.8, '2020-05-10'),
(32, 4, 6.9, '2020-05-01'),
(33, 4, 6.9, '2020-05-02'),
(34, 4, 7.8, '2020-05-03'),
(35, 4, 7.7, '2020-05-04'),
(36, 4, 3, '2020-05-05'),
(37, 4, 3, '2020-05-06'),
(38, 4, 6, '2020-05-07'),
(39, 4, 6.2, '2020-05-08'),
(40, 4, 6.1, '2020-05-09'),
(41, 4, 9, '2020-05-10');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `time_reports`
--
ALTER TABLE `time_reports`
  ADD CONSTRAINT `time_reports_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
