CREATE DATABASE pokedex;
use pokedex;

CREATE TABLE pokedex (
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


INSERT INTO pokedex (numero, nombre, altura, peso, categoria, habilidad, tipo, imagen_url) VALUES
(0001, 'Bulbasaur', 0.7, 6.9, 'Semilla', 'Espesura', 'Planta, Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/001.png'),
(0002, 'Ivysaur', 1.0, 13.0, 'Semilla', 'Espesura', 'Planta, Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/002.png'),
(0003, 'Venusaur', 2.0, 100.0, 'Semilla', 'Espesura', 'Planta, Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/003.png');
