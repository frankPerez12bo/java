-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3309
-- Tiempo de generación: 11-12-2024 a las 00:28:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actualizaciones_libro`
--

CREATE TABLE `actualizaciones_libro` (
  `ISBNAnterior` varchar(20) NOT NULL,
  `TituloAnterior` varchar(65) NOT NULL,
  `NumeroEjemplaresAnterior` tinyint(4) NOT NULL,
  `ISBNNuevo` varchar(20) NOT NULL,
  `TituloNuevo` varchar(65) NOT NULL,
  `NumeroEjemplaresNuevo` tinyint(4) NOT NULL,
  `Usuario` varchar(15) NOT NULL,
  `FechaModificacion` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL,
  `NombreAutor` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`idAutor`, `NombreAutor`) VALUES
(1, 'Fernando López Segura'),
(2, 'Eduardo Cruz Ruiz'),
(3, 'Lilian Valecia Carrillo'),
(4, 'Juan Carlos Segundo Elias'),
(5, 'Jair Cuellar Artega'),
(6, 'Karla Rojas García'),
(7, 'bIll Gates'),
(8, 'Fernando López Segura'),
(9, 'Eduardo Cruz Ruiz'),
(10, 'Lilian Valecia Carrillo'),
(11, 'Juan Carlos Segundo Elias'),
(12, 'Jair Cuellar Artega'),
(13, 'Karla Rojas García'),
(14, 'ke ffhg fff'),
(15, 'Jose Maria Arguedas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `idEditorial` int(11) NOT NULL,
  `NombreEditorial` varchar(30) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`idEditorial`, `NombreEditorial`, `Direccion`, `Telefono`) VALUES
(1, 'Trillas', 'AV. 20 DE NOVIEMBRE #61 Col. Centro', '23456789'),
(2, 'Pearson', 'AV. INDEPENDENCIA #956 COL. PIRAGUA', '56565655'),
(3, 'McGrawHill', 'AV. 5 DE MAYO #67 COL. TUXTEPEC', '32222224'),
(4, 'AlfaOmega', 'BLVD. BENITO JUAREZ #78 COL. TUXTEPEC', '87876887'),
(5, 'Thomsomp', 'ADOLFO LOPEZ MATEOS #12 COL. TUXTEPEC', '12345678'),
(6, 'Libertad', 'AV. MANCILLA ESQ. ALDAMA COL. LAZARO CARDENAS', '98654332'),
(7, 'Trillas', 'AV. 20 DE NOVIEMBRE #61 Col. Centro', '23456789'),
(8, 'Pearson', 'AV. INDEPENDENCIA #956 COL. PIRAGUA', '56565655'),
(9, 'McGrawHill', 'AV. 5 DE MAYO #67 COL. TUXTEPEC', '32222224'),
(10, 'AlfaOmega', 'BLVD. BENITO JUAREZ #78 COL. TUXTEPEC', '87876887'),
(11, 'Thomsomp', 'ADOLFO LOPEZ MATEOS #12 COL. TUXTEPEC', '12345678'),
(12, 'Libertad', 'AV. MANCILLA ESQ. ALDAMA COL. LAZARO CARDENAS', '98654332'),
(13, 'Leonardojo', 'Jr. Los Pinos', 'nullsadsa'),
(14, '', '', ''),
(15, 'iguana', 'real11111', '78451218'),
(16, 'iguana', 'real11111', '78451218'),
(17, 'iguana', 'real11111', '78451218'),
(18, '', '', ''),
(19, '', '', ''),
(20, '', '', ''),
(21, 'popeye', 'av nicolas', '123'),
(22, 'popeye', 'av nicolas', '123'),
(23, 'popeye', 'av nicolas', '123'),
(24, 'popeye', 'av nicolas', '123'),
(25, 'popeye', 'av nicolas', '123'),
(26, 'popeye', 'av nicolas', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `idLibro` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Titulo` varchar(65) NOT NULL,
  `NumeroEjemplares` tinyint(4) NOT NULL,
  `idAutor` int(11) NOT NULL,
  `idEditorial` int(11) NOT NULL,
  `idTema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`idLibro`, `ISBN`, `Titulo`, `NumeroEjemplares`, `idAutor`, `idEditorial`, `idTema`) VALUES
(1, '123456789', 'Redes Inalambricas', 27, 1, 4, 1),
(2, '1357935799', 'Fundamentos de Programación', 12, 1, 6, 1),
(3, '1010345655', 'The Book of Ruby', 9, 1, 5, 1),
(4, '3456789212', 'Programación en C/C++', 25, 1, 3, 1),
(5, '7578799145', 'Introducción a la teoría general de la administración', 45, 6, 2, 4),
(6, '3238845533', 'Administración Moderna', 12, 6, 1, 4),
(7, '5267174899', 'Generación de Modelos de Negocio', 16, 6, 1, 4),
(8, '2456789011', 'Fundamentos de Administración Financiera', 99, 6, 1, 4),
(9, '3454565890', 'Invitación a la Biología', 11, 3, 1, 2),
(10, '2224579900', 'Biología molecular de la célula', 14, 3, 1, 2),
(11, '0988277777', 'Biología: ciencia y naturaleza', 22, 3, 1, 2),
(12, '6372653847', 'Atlas de Biología', 1, 3, 1, 2),
(13, '9823525255', 'Sistemas de Control para Ingeniería', 5, 4, 1, 6),
(14, '2324611234', 'Circuitos Eléctricos', 10, 4, 1, 6),
(15, '7774828288', 'Sismas de Comunicaciones', 7, 4, 1, 6),
(16, '2343454577', 'Química General', 2, 5, 1, 5),
(17, '5568883333', 'Química Orgánica', 3, 5, 1, 5),
(18, '1111166988', 'Principios de Economía', 1, 2, 1, 3),
(19, '0044523255', 'La riqueza de las naciones', 4, 2, 1, 3),
(20, '5767676722', 'Economía y Sociedad', 17, 2, 1, 3),
(21, '3235567986', 'Marketi de Guerra', 1, 2, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `idPrestamo` int(11) NOT NULL,
  `FechaPrestamo` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `idSocio` int(11) NOT NULL,
  `idLibro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`idPrestamo`, `FechaPrestamo`, `FechaEntrega`, `idSocio`, `idLibro`) VALUES
(1, '2024-11-26', '2016-12-25', 1, 6),
(2, '2024-11-26', '2016-12-24', 4, 4),
(3, '2024-11-26', '2016-12-27', 5, 1),
(4, '2024-11-26', '2017-01-14', 1, 2),
(5, '2024-11-26', '2016-12-25', 3, 3),
(6, '2024-11-26', '2016-12-25', 1, 5),
(7, '2024-11-26', '2016-12-31', 4, 3),
(8, '2024-11-26', '2017-12-28', 5, 19),
(9, '2024-11-26', '2017-02-20', 4, 5),
(10, '2024-11-26', '2017-02-21', 1, 12),
(11, '2024-11-26', '2016-12-25', 1, 15),
(12, '2024-11-26', '2016-12-24', 4, 4),
(13, '2024-11-26', '2016-12-27', 5, 1),
(14, '2024-11-26', '2017-01-14', 1, 7),
(15, '2024-11-26', '2016-12-25', 3, 8),
(16, '2024-11-26', '2016-12-25', 1, 9),
(17, '2024-11-26', '2016-12-31', 4, 10),
(18, '2024-11-26', '2017-12-28', 5, 11),
(19, '2024-11-26', '2017-02-20', 4, 18),
(20, '2024-11-26', '2017-02-21', 1, 20),
(21, '2024-11-26', '2016-12-25', 1, 6),
(22, '2024-11-26', '2016-12-24', 4, 4),
(23, '2024-11-26', '2016-12-27', 5, 1),
(24, '2024-11-26', '2017-01-14', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `idSocio` int(11) NOT NULL,
  `NombreCompleto` varchar(60) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Correo` varchar(25) DEFAULT 'Sin Correo',
  `Telefono` varchar(15) NOT NULL,
  `Foto` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`idSocio`, `NombreCompleto`, `Direccion`, `Correo`, `Telefono`, `Foto`) VALUES
(1, 'Alfredo Hernández Mendoza', 'Dirección 1', 'alfred123@gmail.com', '12345678', 'Foto_1.png'),
(2, 'Juan Alberto Ramírez Sandoval', 'Dirección 2', 'juanal_66@hotmail.com', '91847567', 'Foto_2.png'),
(3, 'Enrique Alberto García Aguado', 'Dirección 3', '', '22885534', 'Foto_3.png'),
(4, 'Esmeralda López Cabrera', 'Dirección 4', 'esme27_p@yahoo.com.mx', '45263489', 'Foto_4.png'),
(5, 'Janeth Soto Cruz', 'Dirección 5', 'janeth11@hotmail.com', '64829164', 'Foto_5.png'),
(6, 'Marco Antonio Pérez Díaz', 'Dirección 6', 'makr@gmail.com', '88335522', 'Foto_6.png'),
(7, 'Alfredo Hernández Mendoza', 'Dirección 1', 'alfred123@gmail.com', '12345678', 'Foto_1.png'),
(8, 'Juan Alberto Ramírez Sandoval', 'Dirección 2', 'juanal_66@hotmail.com', '91847567', 'Foto_2.png'),
(9, 'Enrique Alberto García Aguado', 'Dirección 3', '', '22885534', 'Foto_3.png'),
(10, 'Esmeralda López Cabrera', 'Dirección 4', 'esme27_p@yahoo.com.mx', '45263489', 'Foto_4.png'),
(11, 'Janeth Soto Cruz', 'Dirección 5', 'janeth11@hotmail.com', '64829164', 'Foto_5.png'),
(12, 'Marco Antonio Pérez Díaz', 'Dirección 6', 'makr@gmail.com', '88335522', 'Foto_6.png'),
(13, 'Frank Perez Cardenas', 'AV Aranjuez 7777', 'franka@gmail.com', '974147932', 'autor.png'),
(14, 'null', 'null', 'null', 'null', 'null'),
(20, 'Leonardo', 'Jr. Los Pinos', 'leonardo@gmail.com', '941143467', 'SAUSAYUS'),
(21, 'Leonardo', 'Jr. Los Pinos', 'leonardo@gmail.com', '941143467', 'SAUSAYUS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `idTema` int(11) NOT NULL,
  `NombreTema` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`idTema`, `NombreTema`) VALUES
(1, 'Programación'),
(2, 'Biología'),
(3, 'Economía / Marketing'),
(4, 'Administracion de Empresas'),
(5, 'Química'),
(6, 'Ingeniería'),
(7, 'Programación'),
(8, 'Biología'),
(9, 'Economía / Marketing'),
(10, 'Administración de empresas'),
(11, 'Química'),
(12, 'Ingeniería');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idAutor`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`idEditorial`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`idLibro`),
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD KEY `idAutor` (`idAutor`),
  ADD KEY `idEditorial` (`idEditorial`),
  ADD KEY `idTema` (`idTema`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `idSocio` (`idSocio`),
  ADD KEY `idLibro` (`idLibro`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`idSocio`);

--
-- Indices de la tabla `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`idTema`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `idEditorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `idLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `idSocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `tema`
--
ALTER TABLE `tema`
  MODIFY `idTema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`idEditorial`) REFERENCES `editorial` (`idEditorial`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`idTema`) REFERENCES `tema` (`idTema`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`idSocio`) REFERENCES `socio` (`idSocio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`idLibro`) REFERENCES `libro` (`idLibro`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
