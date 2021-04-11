-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 10 2021 г., 13:30
-- Версия сервера: 10.4.17-MariaDB
-- Версия PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `imdb_queries`
--

-- --------------------------------------------------------

--
-- Структура таблицы `imdb_queries`
--

CREATE TABLE `imdb_queries` (
  `id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `imdb_queries`
--

INSERT INTO `imdb_queries` (`id`, `query`) VALUES
(1, 'SELECT `name` FROM `movies` WHERE `year` = 1995;'),
(2, 'SELECT COUNT(role) FROM `roles` where `movie_id` = 194874;'),
(3, 'SELECT `first_name`,`last_name` FROM `actors`,`movies`,`roles` WHERE actors.id = roles.actor_id AND roles.movie_id = 194874;'),
(4, 'SELECT `first_name`, `last_name` FROM `directors`,`movies_directors` WHERE directors.id = movies_directors.director_id AND movies_directors.movie_id = 112290;'),
(5, 'SELECT COUNT(`movie_id`) FROM `directors`, `movies_directors` WHERE directors.id =22104 and directors.id = movies_directors.director_id;'),
(6, 'SELECT `name` FROM `movies`, `movies_directors` WHERE movies_directors.director_id= 22104 AND movies.id = movies_directors.movie_id;'),
(7, 'SELECT `first_name`, `last_name` FROM `directors`, `movies_directors` , `movies_genres` WHERE directors.id = movies_directors.director_id AND movies_directors.movie_id = movies_genres.movie_id AND movies_genres.genre = \'Horror\';'),
(8, 'SELECT actors.first_name, actors.last_name FROM `actors` , `directors`, `movies_directors`, `roles` WHERE directors.id = 58201 AND directors.id = movies_directors.director_id AND actors.id = roles.actor_id AND movies_directors.movie_id = roles.movie_id;');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `imdb_queries`
--
ALTER TABLE `imdb_queries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `imdb_queries`
--
ALTER TABLE `imdb_queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
