-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2025 a las 03:50:50
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
-- Base de datos: `medicos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipouser`
--

CREATE TABLE `tipouser` (
  `id_tuser` int(11) NOT NULL,
  `nombretuser` varchar(55) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipouser`
--

INSERT INTO `tipouser` (`id_tuser`, `nombretuser`, `descripcion`) VALUES
(1, 'sistemas', 'el que esta al pendiente y crea la base de datos'),
(2, 'medico', 'el que revisa a los pacientes y trata de curarlos'),
(3, 'paciente', 'el que llega enfermo o herido y necesita la ayuda del medico'),
(4, 'visitante', 'el que visita al paciente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `AP` varchar(55) NOT NULL,
  `AM` varchar(55) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_has` varchar(255) NOT NULL,
  `id_tuser` int(11) NOT NULL,
  `f_registro` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `AP`, `AM`, `email`, `password_has`, `id_tuser`, `f_registro`) VALUES
(1, 'Jurgen', 'Sanchez', 'Tello', 'sanchez@gamil.com', '1e01ba3e07ac48cbdab2d3284d1dd0fa', 1, '2025-11-19'),
(2, 'Gabriela', 'Sanchez', 'Mendez', 'gaby@email.com', 'b1eb96657b983d6e9c04bca5b975d374', 2, '2025-11-19'),
(3, 'Jorge', 'Alberto', 'Senchez', 'jorge@email.com', '662a366703cf1c96ef1f0c032efea5f7', 3, '2025-11-19'),
(4, 'Ulises', 'Marco', 'Mendez', 'ulises@email.com', '25f9e794323b453885f5181f1b624d0b', 4, '2025-11-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tipouser`
--
ALTER TABLE `tipouser`
  ADD PRIMARY KEY (`id_tuser`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_tuser` (`id_tuser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipouser`
--
ALTER TABLE `tipouser`
  MODIFY `id_tuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tuser`) REFERENCES `tipouser` (`id_tuser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
