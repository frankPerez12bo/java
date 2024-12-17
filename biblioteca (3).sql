-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3309
-- Tiempo de generación: 17-12-2024 a las 23:04:20
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL,
  `NombreAutor` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(7, 'ke ffhg fff');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `idEditorial` int(11) NOT NULL,
  `NombreEditorial` varchar(30) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`idEditorial`, `NombreEditorial`, `Direccion`, `Telefono`) VALUES
(2, 'Pearson abc', 'AV. INDEPENDENCIA ', '987412357'),
(3, 'McGrawHill', 'AV. 5 DE MAYO #67 COL. TUXTEPEC', '32222224'),
(4, 'AlfaOmega', 'BLVD. BENITO JUAREZ #78 COL. TUXTEPEC', '87876887'),
(5, 'Thomsomp', 'ADOLFO LOPEZ MATEOS #12 COL. TUXTEPEC', '12345678'),
(7, 'Santillana', 'Av Navarrete s/n', '935190658'),
(8, 'Grupo eidos', 'Huancayo', '987456147');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`idLibro`, `ISBN`, `Titulo`, `NumeroEjemplares`, `idAutor`, `idEditorial`, `idTema`) VALUES
(1, '1234567891', 'El Lengu de Prgramación C', 27, 1, 4, 1),
(3, '1010345655', 'The Book of Ruby', 9, 1, 5, 1),
(4, '3456789212', 'Programación en C/C++', 25, 1, 3, 1),
(5, '7578799145', 'Introducción a la teoría general de la administración', 45, 6, 2, 4);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`idPrestamo`, `FechaPrestamo`, `FechaEntrega`, `idSocio`, `idLibro`) VALUES
(2, '2024-10-29', '2016-12-24', 4, 4),
(3, '2024-10-29', '2016-12-27', 5, 1),
(5, '2024-10-29', '2016-12-25', 3, 3),
(6, '2024-10-29', '2016-12-25', 1, 5),
(7, '2024-10-29', '2016-12-31', 4, 3),
(9, '2024-10-29', '2017-02-20', 4, 5),
(12, '2024-10-29', '2016-12-24', 4, 4),
(13, '2024-10-29', '2016-12-27', 5, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`idSocio`, `NombreCompleto`, `Direccion`, `Correo`, `Telefono`, `Foto`) VALUES
(1, 'Alfredo Hernández Mendoza', 'Dirección 1', 'alfred123@gmail.com', '12345678', 'Foto_1.png'),
(2, 'Juan Alberto Ramírez Sandoval', 'Dirección 2', 'juanal_66@hotmail.com', '91847567', 'Foto_2.png'),
(3, 'Enrique Alberto García Aguado', 'Dirección 3', '', '22885534', 'Foto_3.png'),
(4, 'Esmeralda López Cabrera', 'Dirección 4', 'esme27_p@yahoo.com.mx', '45263489', 'Foto_4.png'),
(5, 'Janeth Soto Cruz', 'Dirección 5', 'janeth11@hotmail.com', '64829164', 'Foto_5.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `idTema` int(11) NOT NULL,
  `NombreTema` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`idTema`, `NombreTema`) VALUES
(1, 'Programación'),
(2, 'Biología'),
(3, 'Economía / Marketing'),
(4, 'Administración de empresas'),
(5, 'Química'),
(6, 'Ingeniería');

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
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `idEditorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `idLibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `idSocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tema`
--
ALTER TABLE `tema`
  MODIFY `idTema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
