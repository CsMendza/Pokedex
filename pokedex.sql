CREATE DATABASE PokedexDB;
use PokedexDB;

CREATE TABLE Pokedex (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    altura FLOAT NOT NULL,
    peso FLOAT NOT NULL,
    categoria VARCHAR(50),
    habilidad VARCHAR(50),
    tipo VARCHAR(50),
    imagen_url VARCHAR(255)
);
