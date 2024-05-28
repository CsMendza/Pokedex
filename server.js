const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

// Configurar conexión a la base de datos
const db = mysql.createConnection({
    host: 'pokedex.cbesw00i88cu.us-east-1.rds.amazonaws.com',
    user: 'sebas',
    password: 'mcdonald',
    database: 'pokedex'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to database');
});

app.use(bodyParser.json());

// Rutas CRUD en la ruta principal '/'
app.post('/', (req, res) => {
    const { numero, nombre, altura, peso, categoria, habilidad, tipo, imagen_url } = req.body;
    const query = 'INSERT INTO Pokedex (numero, nombre, altura, peso, categoria, habilidad, tipo, imagen_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
    db.query(query, [numero, nombre, altura, peso, categoria, habilidad, tipo, imagen_url], (err, result) => {
        if (err) throw err;
        res.send('Pokemon added');
    });
});

app.get('/:id', (req, res) => {
    const { id } = req.params;
    const query = 'SELECT * FROM Pokedex WHERE id = ?';
    db.query(query, [id], (err, result) => {
        if (err) throw err;
        res.json(result);
    });
});

app.put('/:id', (req, res) => {
    const { id } = req.params;
    const { numero, nombre, altura, peso, categoria, habilidad, tipo, imagen_url } = req.body;
    const query = 'UPDATE Pokedex SET numero = ?, nombre = ?, altura = ?, peso = ?, categoria = ?, habilidad = ?, tipo = ?, imagen_url = ? WHERE id = ?';
    db.query(query, [numero, nombre, altura, peso, categoria, habilidad, tipo, imagen_url, id], (err, result) => {
        if (err) throw err;
        res.send('Pokemon updated');
    });
});

app.delete('/:id', (req, res) => {
    const { id } = req.params;
    const query = 'DELETE FROM Pokedex WHERE id = ?';
    db.query(query, [id], (err, result) => {
        if (err) throw err;
        res.send('Pokemon deleted');
    });
});

app.listen(port, () => {
    console.log(`Server running at http://44.213.127.173:3000/`);
});
