-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 18-07-2025 a las 01:44:18
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
-- Base de datos: `panel_servicios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apis`
--

CREATE TABLE `apis` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `apis`
--

INSERT INTO `apis` (`id`, `nombre`, `descripcion`, `url`) VALUES
(1, 'API de Clima', 'Obtén información meteorológica actualizada para cualquier ubicación.', 'https://openweathermap.org/api'),
(2, 'API de Noticias', 'Accede a las últimas noticias de fuentes globales confiables.', 'https://newsapi.org/'),
(3, 'API de Geolocalización', 'Detecta la ubicación geográfica de los usuarios para mejorar la experiencia.', 'https://ipgeolocation.io/'),
(4, 'API de Traducción', 'Traduce textos en múltiples idiomas de manera rápida y precisa.', 'https://cloud.google.com/translate'),
(5, 'API de Pagos', 'Integra pagos seguros en tu sitio con múltiples métodos y monedas.', 'https://developer.paypal.com/docs/api/overview/'),
(6, 'API Clima', 'Proporciona datos meteorológicos actuales y pronósticos confiables.', 'https://www.q2bstudio.com/nuestro-blog/350/apis-salud-innovacion-desafios'),
(7, 'API Pagos', 'Permite gestionar pagos y transacciones seguras.', 'https://developer.paypal.com/api/rest/'),
(8, 'API Usuarios', 'Gestión y autenticación de usuarios.', 'https://www.ibm.com/docs/es/cloud-pak-system-software/2.3.3?topic=sm-users'),
(9, 'API Noticias', 'Acceso a noticias y artículos de actualidad.', 'https://apitube.io/es'),
(10, 'API Geolocalización', 'Obten información geográfica y mapas.', 'https://developer.mozilla.org/es/docs/Web/API/Geolocation_API'),
(11, 'API Calendario', 'Sincroniza eventos y agendas.', 'https://developers.google.com/workspace/calendar/api/guides/overview?hl=es-419'),
(12, 'API Mensajería', 'Envía y recibe mensajes SMS y notificaciones.', 'https://www.twilio.com/es-mx/messaging/programmable-messaging-api'),
(13, 'API Video', 'Procesa y gestiona contenido de video.', 'https://api.video/features/'),
(14, 'API E-commerce', 'Herramientas para tiendas en línea.', 'https://codster.io/blog/integraciones-api/ecommerce-api-integraciones/'),
(15, 'API Salud', 'Datos y consultas médicas seguras.', 'https://www.q2bstudio.com/nuestro-blog/350/apis-salud-innovacion-desafios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tipo` enum('servicio','api','personalizado') NOT NULL,
  `item_id` int(11) NOT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  `api_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `user_id`, `tipo`, `item_id`, `servicio_id`, `api_id`) VALUES
(4, 1, 'servicio', 0, NULL, 11),
(5, 1, 'servicio', 0, NULL, 4),
(6, 1, 'servicio', 0, 1, NULL),
(7, 1, 'servicio', 0, 2, NULL),
(8, 1, 'servicio', 0, 3, NULL),
(9, 1, 'servicio', 0, 4, NULL),
(10, 1, 'servicio', 0, NULL, 2),
(11, 1, 'personalizado', 7, NULL, NULL),
(12, 1, 'personalizado', 9, NULL, NULL),
(13, 1, 'servicio', 7, NULL, NULL),
(14, 1, 'servicio', 0, NULL, 6),
(15, 1, 'api', 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos_api`
--

CREATE TABLE `contratos_api` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `fecha_contrato` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalizados`
--

CREATE TABLE `personalizados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `precio` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personalizados`
--

INSERT INTO `personalizados` (`id`, `nombre`, `descripcion`, `fecha`, `precio`) VALUES
(1, 'Sitio web para consultorio', 'Un sistema de agendamiento y consulta médica para una clínica privada.', '2024-11-15 00:00:00', 0.00),
(2, 'Sistema de pedidos', 'Aplicación web para administrar pedidos en línea con control de stock.', '2025-02-10 00:00:00', 0.00),
(3, 'Portal interno de empleados', 'Panel personalizado para seguimiento de desempeño y asistencia.', '2025-03-25 00:00:00', 0.00),
(4, 'Sitio web para consultorio', 'Sistema de agendamiento y consulta médica para una clínica privada.', '2025-07-02 20:42:22', 5000.00),
(5, 'App móvil para pacientes', 'Aplicación para que pacientes puedan reservar citas y recibir notificaciones.', '2025-07-02 20:42:22', 8000.00),
(6, 'Sistema de gestión de pacientes', 'Software para controlar expedientes médicos y citas.', '2025-07-02 20:42:22', 7000.00),
(7, 'Portal web para resultados médicos', 'Plataforma para que pacientes consulten sus resultados en línea.', '2025-07-02 20:42:22', 6000.00),
(8, 'Agenda médica avanzada', 'Herramienta con recordatorios automáticos y gestión de especialidades.', '2025-07-02 20:42:22', 4500.00),
(9, 'Consultas online con video', 'Sistema que permite consultas médicas por videollamada.', '2025-07-02 20:42:22', 9000.00),
(10, 'Gestión de facturación médica', 'Software para facturación y cobros en clínicas.', '2025-07-02 20:42:22', 6500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Diseño Web Básico', 'Página web responsive con hasta 5 secciones.', 1200.00),
(2, 'Desarrollo de API REST', 'API RESTful con autenticación y base de datos.', 2000.00),
(3, 'E-commerce Personalizado', 'Tienda en línea completa con carrito y pagos.', 3500.00),
(4, 'Mantenimiento Web', 'Actualizaciones, respaldo y seguridad mensual.', 500.00),
(5, 'Página web responsive', 'Página web responsive con hasta 5 secciones.', 2500.00),
(6, 'API RESTful', 'API RESTful con autenticación y base de datos.', 3500.00),
(7, 'Tienda en línea', 'Tienda en línea completa con carrito y pagos.', 5000.00),
(8, 'Diseño gráfico profesional', 'Creación de logos, banners y más con alta calidad.', 2000.00),
(9, 'Consultoría tecnológica', 'Asesoría para optimizar tu infraestructura TI.', 3000.00),
(10, 'Integración de chatbots', 'Implementamos chatbots para mejorar atención al cliente.', 4000.00),
(11, 'Diseño Web Básico', 'Sitio informativo con hasta 5 secciones, responsive.', 1299.00),
(12, 'Tienda en Línea', 'Comercio electrónico completo con carrito y pasarela de pagos.', 4599.00),
(13, 'API REST con JWT', 'Desarrollo de API con autenticación segura usando JSON Web Tokens.', 2499.00),
(14, 'Landing Page Profesional', 'Página de destino moderna con llamado a la acción.', 899.00),
(15, 'Web Corporativa', 'Sitio web para empresas con múltiples secciones y blog.', 3299.00),
(16, 'Mantenimiento Web', 'Actualización mensual, respaldo y seguridad web.', 499.00),
(17, 'Optimización SEO', 'Mejoramos tu posicionamiento en buscadores como Google.', 799.00),
(18, 'Integración de Pagos', 'Conectamos tu sistema con Stripe o PayPal.', 1199.00),
(19, 'Sistema de Reservas', 'Sistema personalizado para agendar citas o servicios.', 1899.00),
(20, 'Diseño de Logo', 'Creación de logotipo profesional y manual de uso.', 699.00),
(21, 'Sitio Multilenguaje', 'Tu web disponible en varios idiomas con selector dinámico.', 1799.00),
(22, 'Panel de Administración', 'Dashboard para gestionar contenido, usuarios y más.', 2899.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `email`, `password`) VALUES
(1, 'Giovana', 'juarezgiovana270@gmail.com', '$2y$10$Emla8AnkYtJhGhNs7eu5KegRKCbH5wL/V8W0oAniua5SUqETWPpPy');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apis`
--
ALTER TABLE `apis`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cart` (`user_id`,`servicio_id`,`api_id`),
  ADD KEY `servicio_id` (`servicio_id`),
  ADD KEY `api_id` (`api_id`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contratos_api`
--
ALTER TABLE `contratos_api`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personalizados`
--
ALTER TABLE `personalizados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apis`
--
ALTER TABLE `apis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contratos_api`
--
ALTER TABLE `contratos_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personalizados`
--
ALTER TABLE `personalizados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  ADD CONSTRAINT `carrito_ibfk_3` FOREIGN KEY (`api_id`) REFERENCES `apis` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
