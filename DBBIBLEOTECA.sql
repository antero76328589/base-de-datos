
drop database DB_BIBLIOTECA;
CREATE DATABASE DB_BIBLIOTECA;
USE DB_BIBLIOTECA;

CREATE TABLE author (
    id_author INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NULL,
    last_name VARCHAR(50) NULL,
    email VARCHAR(50) NULL,
    phone VARCHAR(11) NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE libros (
    id_book INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_author INT NOT NULL,
    cod_book VARCHAR(10) NOT NULL,
    name VARCHAR(50) NOT NULL,
    title VARCHAR(100) NOT NULL,
    publisher DATE NOT NULL,
    isbn CHAR(13) NULL,
    FOREIGN KEY (id_author) REFERENCES author(id_author),
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(8) NOT NULL UNIQUE,
    direccion VARCHAR(100) NULL,
    telefono VARCHAR(11) NULL,
    email VARCHAR(50) NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE prestamo (
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_book INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NULL,
    estado ENUM('prestado', 'devuelto') NOT NULL DEFAULT 'prestado',
    FOREIGN KEY (id_book) REFERENCES libros(id_book) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);