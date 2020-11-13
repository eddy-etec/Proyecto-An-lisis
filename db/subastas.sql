-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2020 a las 08:12:55
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `subastas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`, `descripcion`) VALUES
(1, 'Autos Deportivos', 'Atos de estilos deportivos'),
(8, 'Autos Clásicos', 'Automóviles clásicos '),
(7, 'Automóviles', 'Automóviles de todo tipo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cesta`
--

CREATE TABLE `cesta` (
  `id_cesta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_subasta` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cesta`
--

INSERT INTO `cesta` (`id_cesta`, `id_usuario`, `id_subasta`) VALUES
(1, 7, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

CREATE TABLE `oferta` (
  `id_oferta` int(11) NOT NULL,
  `oferta` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_subasta` int(11) NOT NULL,
  `comprador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `oferta`
--

INSERT INTO `oferta` (`id_oferta`, `oferta`, `estado`, `fecha`, `id_subasta`, `comprador`) VALUES
(4, 40000, 0, '2020-11-06 19:50:42', 11, 3),
(3, 30000, 0, '2020-11-06 19:47:16', 11, 15),
(5, 90000, 1, '2020-11-10 03:49:19', 13, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subasta`
--

CREATE TABLE `subasta` (
  `id_subasta` int(11) NOT NULL,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `tiempo_ini` datetime NOT NULL,
  `tiempo_fin` datetime NOT NULL,
  `estado` int(11) NOT NULL,
  `comprador` int(11) DEFAULT NULL,
  `subastador` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `subasta`
--

INSERT INTO `subasta` (`id_subasta`, `min`, `max`, `tiempo_ini`, `tiempo_fin`, `estado`, `comprador`, `subastador`, `id_vehiculo`) VALUES
(14, 60000, 90000, '2020-11-11 08:35:29', '2020-11-20 18:35:00', 0, NULL, 7, 17),
(13, 50000, 90000, '2020-11-06 20:57:01', '2020-11-17 18:56:00', 1, 7, 15, 14),
(12, 15000, 28000, '2020-11-06 20:00:58', '2020-11-09 19:00:00', 1, NULL, 15, 13),
(11, 20000, 60000, '2020-11-06 19:42:58', '2020-11-19 12:28:00', 0, 3, 7, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundo_apellido` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `edad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `foto` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `user` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `primer_apellido`, `segundo_apellido`, `edad`, `foto`, `correo`, `user`, `pass`) VALUES
(7, 'Eddy', 'Etec', 'Ajcet', '25', 'perfil.jpg', 'eeteca@miumg.edu.gt', 'Eddy', '1234'),
(3, 'Angel Alejandro', 'Garcia', 'Rivera', '30', '', '1330469@upv.edu.mx', 'angel', 'angel'),
(16, 'Oscar', 'Lopez', 'Morales', '34', NULL, 'oscar@gmail.com', 'oscarito', '12345'),
(15, 'Heyli', 'Marroquin', 'Etec', '27', NULL, 'heyli@gmail.com', 'yeyi', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `marca` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado_v` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `marca`, `modelo`, `estado_v`, `descripcion`, `imagen`, `id_categoria`) VALUES
(14, 'Hyundai Tucson', '', NULL, 'Modelo 2012', 'tucson.jpg', 1),
(13, 'Suzuki Grand Vitara', '', NULL, 'Modelo 2001', 'suziki.png', 7),
(12, 'Toyota RAV4 ', '', NULL, 'Modelo 2015', '2015.png', 7),
(15, 'Honda', 'Civic', '0', 'Vehículo en óptimas condiciones', 'hc.jpg', 7),
(16, 'Honda Civic', '2017', '0', 'Vehículo full equipo', 'hc2.jpg', 1),
(17, 'Mitsubishi Lancer', '2018', 'Nuevo', 'Vehículo full equipo', 'lancer.png', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cesta`
--
ALTER TABLE `cesta`
  ADD PRIMARY KEY (`id_cesta`);

--
-- Indices de la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`id_oferta`);

--
-- Indices de la tabla `subasta`
--
ALTER TABLE `subasta`
  ADD PRIMARY KEY (`id_subasta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cesta`
--
ALTER TABLE `cesta`
  MODIFY `id_cesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `oferta`
--
ALTER TABLE `oferta`
  MODIFY `id_oferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subasta`
--
ALTER TABLE `subasta`
  MODIFY `id_subasta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
