CREATE DATABASE pokedex;
USE pokedex;

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
(1, 'Bulbasaur', 0.7, 6.9, 'Semilla', 'Espesura', 'Planta, Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/001.png'),
(2, 'Ivysaur', 1.0, 13.0, 'Semilla', 'Espesura', 'Planta, Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/002.png'),
(3, 'Venusaur', 2.0, 100.0, 'Semilla', 'Espesura', 'Planta, Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/003.png'),
(4, 'Charmander', 0.6, 8.5, 'Lagartija', 'Mar Llamas', 'Fuego', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/004.png'),
(5, 'Charmeleon', 1.1, 19.0, 'Flama', 'Mar Llamas', 'Fuego', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/005.png'),
(6, 'Charizard', 1.7, 90.5, 'Llama', 'Mar Llamas', 'Fuego, Volador', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/006.png'),
(7, 'Squirtle', 0.5, 9.0, 'Tortuguita', 'Torrente', 'Agua', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/007.png'),
(8, 'Wartortle', 1.0, 22.5, 'Tortuga', 'Torrente', 'Agua', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/008.png'),
(9, 'Blastoise', 1.6, 85.5, 'Marisco', 'Torrente', 'Agua', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/009.png'),
(10, 'Caterpie', 0.3, 2.9, 'Gusano', 'Polvo Escudo', 'Bicho', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/010.png'),
(11, 'Metapod', 0.7, 9.9, 'Capullo', 'Mudar', 'Bicho', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/011.png'),
(12, 'Butterfree', 1.1, 32.0, 'Mariposa', 'Ojo Compuesto', 'Bicho, Volador', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/012.png'),
(13, 'Weedle', 0.3, 3.2, 'Oruga', 'Polvo Escudo', 'Bicho, Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/013.png'),
(14, 'Kakuna', 0.6, 10.0, 'Capullo', 'Mudar', 'Bicho, Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/014.png'),
(15, 'Beedrill', 1.0, 29.5, 'Abeja Veneno', 'Enjambre', 'Bicho, Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/015.png'),
(16, 'Pidgey', 0.3, 1.8, 'Pajarito', 'Vista Lince', 'Normal, Volador', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/016.png'),
(17, 'Pidgeotto', 1.1, 30.0, 'Pájaro', 'Vista Lince', 'Normal, Volador', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/017.png'),
(18, 'Pidgeot', 1.5, 39.5, 'Pájaro', 'Vista Lince', 'Normal, Volador', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/018.png'),
(19, 'Rattata', 0.3, 3.5, 'Ratón', 'Fuga', 'Normal', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/019.png'),
(20, 'Raticate', 0.7, 18.5, 'Ratón', 'Fuga', 'Normal', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/020.png'),
(21, 'Spearow', 0.3, 2.0, 'Pajarito', 'Foco Interno', 'Normal, Volador', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/021.png'),
(22, 'Fearow', 1.2, 38.0, 'Pájaro', 'Foco Interno', 'Normal, Volador', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/022.png'),
(23, 'Ekans', 2.0, 6.9, 'Serpiente', 'Mudar', 'Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/023.png'),
(24, 'Arbok', 3.5, 65.0, 'Cobra', 'Mudar', 'Veneno', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/024.png'),
(25, 'Pikachu', 0.4, 6.0, 'Ratón', 'Electricidad Estática', 'Eléctrico', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png');
