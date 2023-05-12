-- ------------------PARTE 1--------------------

CREATE USER 'usuarioTEST'@'localhost' IDENTIFIED BY 'sadkjlad4654';
GRANT ALL PRIVILEGES ON * . * TO 'usuarioTEST'@'localhost';
FLUSH PRIVILEGES;


CREATE DATABASE ae5abpro;
use ae5abpro;


-- ------------------PARTE 2--------------------

CREATE TABLE `usuario` (
  `id_usuario` int(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `contraseña` varchar(30) NOT NULL,
  `zona_horaria` varchar(6) DEFAULT 'UTC-3',
  `genero` varchar(10) NOT NULL,
  `telefono` varchar(12) NOT NULL
);

SET time_zone = '-03:00';

CREATE TABLE `ingreso` (
  `id_ingreso` int(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_usuario` int(8) NOT NULL,
  `fechaHora_ingreso` timestamp NOT NULL DEFAULT current_timestamp(),
  FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id_usuario`)
);



-- ------------------PARTE 3--------------------
ALTER TABLE `usuario` MODIFY zona_horaria VARCHAR(6) DEFAULT 'UTC-2';
SET time_zone = '-02:00';





-- ------------------PARTE 4--------------------
INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `contraseña`, `zona_horaria`, `genero`, `telefono`) VALUES 
(NULL, 'José', 'Villanueva', 'maslkjjvncljans543', 'UTC-3', 'Masculino', '+5694112145'), 
(NULL, 'Julio', 'Bravo', 'a6sd4sa52d', 'UTC-3', 'Masculino', '+56948854125'), 
(NULL, 'Antonio', 'Rodriguez', '4as6f34as3d2as', 'UTC-3', 'Masculino', '+56932155144'), 
(NULL, 'Antonia', 'Moraga', 'as54ds3adas', 'UTC-3', 'Femenino', '+56998546877'), 
(NULL, 'Mirta', 'Muñoz', 'aksdñlaf54ksjbdvn', 'UTC-3', 'Femenino', '+56988645211'), 
(NULL, 'Michael', 'Faundes', '5asd4ad55', 'UTC-3', 'Masculino', '+56955411214'), 
(NULL, 'Francisca', 'Tobee', 'afasdsad4fsw3', 'UTC-3', 'Femenino', '+5632125411'), 
(NULL, 'Olinda', 'Valderrama', '809gf8h09dg', 'UTC-3', 'Femenino', '+56254455103');


INSERT INTO `ingreso` (`id_ingreso`, `id_usuario`, `fechaHora_ingreso`) VALUES 
(NULL, '1', current_timestamp()), 
(NULL, '2', '2023-05-09 20:40:14'), 
(NULL, '3', '2023-05-10 20:40:14'), 
(NULL, '4', '2023-05-06 20:40:14'), 
(NULL, '5', '2023-05-03 20:40:14'), 
(NULL, '7', '2023-05-02 20:40:14'), 
(NULL, '8', '2023-05-01 20:40:14'), 
(NULL, '6', current_timestamp());


-- ------------------PARTE 5--------------------
-- Si ya que las pk en este caso al establecerlas como autoincrementales las dejamos como de tipo int.
-- En el caso de los valores que son de tipo texto se definieron como varchar y se estableció una longitud acorde al tipo de variable siendo correo el mas largo, seguido de contraseña.
-- El teléfono se estableció como un varchar ya que este debe de contener el sigo +


-- ------------------PARTE 6--------------------

CREATE TABLE `contactos` (
  `id_contacto` int(8) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_usuario` int(8) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo` varchar(40) NOT NULL,
  FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id_usuario`)
);

-- ------------------PARTE 7--------------------

ALTER TABLE `usuario` DROP `telefono`;