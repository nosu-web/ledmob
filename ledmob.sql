-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 19 2022 г., 10:32
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ledmob`
--

-- --------------------------------------------------------

--
-- Структура таблицы `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `deviceid` varchar(200) NOT NULL,
  `is_author` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `member`
--

INSERT INTO `member` (`id`, `room_id`, `deviceid`, `is_author`) VALUES
(3, 1, '00000000-54b3-e7c7-0000-000046bffd97', 1),
(4, 2, '00000000-54b3-e7c7-0000-000046bffd97', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `scenario_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time_start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`id`, `name`, `code`, `scenario_id`, `status`, `time_start`) VALUES
(1, 'СОГУ', '62624624', 2, 1, '2022-05-19 08:27:52'),
(2, 'Тест', '96456524652', 1, 0, '2022-05-19 08:27:40');

-- --------------------------------------------------------

--
-- Структура таблицы `scenario`
--

CREATE TABLE `scenario` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `scenario`
--

INSERT INTO `scenario` (`id`, `name`, `description`) VALUES
(1, 'Горит', 'Вспышки всех устройств горят постоянно'),
(2, 'Мигает', 'Вспышки всех устройств мигают с определенным промежутком');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `scenario`
--
ALTER TABLE `scenario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `scenario`
--
ALTER TABLE `scenario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
