-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Kwi 2023, 15:06
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cms`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vote`
--

CREATE TABLE `vote` (
   `id` int(11) NOT NULL,
  `plus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
 `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `filename` varchar(96) NOT NULL,
  `memename` text NOT NULL,
  `userId` int(11) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`id`, `timestamp`, `filename`, `memename`, `userId`, `removed`) VALUES
(15, '2023-04-29 17:01:42', 'img/47854ce2b981db24a2f240c75e5f150af6755814dbef42cffbcba050098e54a82249582072000.webp', 'lalalaa', 2, 0),
(16, '2023-04-29 17:03:11', 'img/4da4c51ad215333786b48247c399a4cd02031075fb33843937313abbf8534277.webp', 'lalalaa', 2, 0),
(17, '2023-04-29 17:28:50', 'img/fb2f6fda6c954d1f0dd6bf5affc4d5c6f0a7361d73035bc6b1e1385d88e5ea90.webp', 'chuj1', 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
 `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `vote_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `vote_id`) VALUES
(1, 'llala@xd.pl', '$argon2i$v=19$m=64456,t=4,p=1$Z0piZW1WdHFQVDdzTkl3Zg$LpA0s84YNhqWpIl4WgYhHaoaXF7bnEGMaWISzPOFxXA', NULL),
(2, 'kurwa@oo.com', '$argon2i$v=19$m=64456,t=4,p=1$YXNhZHNkYXNkYXNkZGFz$ta99NBEnDcPjZODM9T/ncyTCLfvaoWY4ZG0O1KPuMHMUO', NULL),
(3, 'ebebebe@ulala.net', '$argon2i$v=19$m=64456,t=4,p=1$YXNkZ2hpcXV5ZnZhc2Rhcw$FieoJDV/94e8yX9rqpGebkWZHW8oecVq/cxM0edCqV4', NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote_id` (`vote_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`vote_id`) REFERENCES `vote` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
