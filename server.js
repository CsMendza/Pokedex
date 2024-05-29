const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const path = require('path');
const app = express();
const port = 3000;

// Configurar conexión a la base de datos
const db = mysql.createConnection({
    host: 'pokedex.cvx3mgu5vzra.us-east-1.rds.amazonaws.com',
    user: 'sebas',
    password: 'mcdonald',
    database: 'pokedex'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Conectado a la base de datos');
});

app.use(bodyParser.json());

app.use(express.static(path.join(__dirname, 'public')));

// Rutas CRUD en la ruta principal '/'

app.get('/pokemons', (req, res) => {
    const query = 'SELECT * FROM pokedex';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.post('/', (req, res) => {
    const { numero, nombre, altura, peso, categoria, habilidad, tipo, imagen_url } = req.body;
    const query = 'INSERT INTO pokedex (numero, nombre, altura, peso, categoria, habilidad, tipo, imagen_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
    db.query(query, [numero, nombre, parseFloat(altura), parseFloat(peso), categoria, habilidad, tipo, imagen_url], (err, result) => {
        if (err) throw err;
        res.send('Pokemon added');
    });
});

app.get('/:id', (req, res) => {
    const { id } = req.params;
    const query = 'SELECT * FROM pokedex WHERE id = ?';
    db.query(query, [id], (err, result) => {
        if (err) throw err;
        res.json(result);
    });
});

app.put('/:id', (req, res) => {
    const { id } = req.params;
    const { numero, nombre, altura, peso, categoria, habilidad, tipo, imagen_url } = req.body;
    const query = 'UPDATE pokedex SET numero = ?, nombre = ?, altura = ?, peso = ?, categoria = ?, habilidad = ?, tipo = ?, imagen_url = ? WHERE id = ?';
    db.query(query, [numero, nombre, parseFloat(altura), parseFloat(peso), categoria, habilidad, tipo, imagen_url, id], (err, result) => {
        if (err) throw err;
        res.send('Pokemon updated');
    });
});

app.delete('/:id', (req, res) => {
    const { id } = req.params;
    const query = 'DELETE FROM pokedex WHERE id = ?';
    db.query(query, [id], (err, result) => {
        if (err) throw err;
        res.send('Pokemon deleted');
    });
});

app.listen(port, () => {
    console.log(`Server running at http://34.229.123.176:3000/`);
});
