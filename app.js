document.getElementById('createForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const data = {
        numero: document.getElementById('createNumero').value,
        nombre: document.getElementById('createNombre').value,
        altura: document.getElementById('createAltura').value,
        peso: document.getElementById('createPeso').value,
        categoria: document.getElementById('createCategoria').value,
        habilidad: document.getElementById('createHabilidad').value,
        tipo: document.getElementById('createTipo').value,
        imagen_url: document.getElementById('createImagenUrl').value
    };
    
    fetch('http://your-ec2-instance-public-ip:3000/pokemon', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.text())
    .then(data => alert(data))
    .catch(error => console.error('Error:', error));
});

document.getElementById('readForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const id = document.getElementById('readId').value;
    
    fetch(`http://your-ec2-instance-public-ip:3000/pokemon/${id}`)
        .then(response => response.json())
        .then(data => {
            const resultDiv = document.getElementById('readResult');
            resultDiv.innerHTML = '';
            if (data.length) {
                const pokemon = data[0];
                resultDiv.innerHTML = `
                    <div class="pokemon">
                        <p>ID: ${pokemon.id}</p>
                        <p>Numero: ${pokemon.numero}</p>
                        <p>Nombre: ${pokemon.nombre}</p>
                        <p>Altura: ${pokemon.altura}</p>
                        <p>Peso: ${pokemon.peso}</p>
                        <p>Categoria: ${pokemon.categoria}</p>
                        <p>Habilidad: ${pokemon.habilidad}</p>
                        <p>Tipo: ${pokemon.tipo}</p>
                        <p>Imagen URL: ${pokemon.imagen_url}</p>
                    </div>
                `;
            } else {
                resultDiv.innerHTML = 'No Pokemon found with that ID';
            }
        })
        .catch(error => console.error('Error:', error));
});

document.getElementById('updateForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const id = document.getElementById('updateId').value;
    const data = {
        numero: document.getElementById('updateNumero').value,
        nombre: document.getElementById('updateNombre').value,
        altura: document.getElementById('updateAltura').value,
        peso: document.getElementById('updatePeso').value,
        categoria: document.getElementById('updateCategoria').value,
        habilidad: document.getElementById('updateHabilidad').value,
        tipo: document.getElementById('updateTipo').value,
        imagen_url: document.getElementById('updateImagenUrl').value
    };
    
    fetch(`http://your-ec2-instance-public-ip:3000/pokemon/${id}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.text())
    .then(data => alert(data))
    .catch(error => console.error('Error:', error));
});

document.getElementById('deleteForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const id = document.getElementById('deleteId').value;
    
    fetch(`http://your-ec2-instance-public-ip:3000/pokemon/${id}`, {
        method: 'DELETE'
    })
    .then(response => response.text())
    .then(data => {
        alert(data);
        document.getElementById('deleteResult').innerHTML = data;
    })
    .catch(error => console.error('Error:', error));
});

document.getElementById('getAllPokemonsButton').addEventListener('click', function() {
    fetch('http://your-ec2-instance-public-ip:3000/pokemon')
        .then(response => response.json())
        .then(data => {
            const resultDiv = document.getElementById('allPokemonsResult');
            resultDiv.innerHTML = '';
            data.forEach(pokemon => {
                resultDiv.innerHTML += `
                    <div class="pokemon">
                        <p>ID: ${pokemon.id}</p>
                        <p>Numero: ${pokemon.numero}</p>
                        <p>Nombre: ${pokemon.nombre}</p>
                        <p>Altura: ${pokemon.altura}</p>
                        <p>Peso: ${pokemon.peso}</p>
                        <p>Categoria: ${pokemon.categoria}</p>
                        <p>Habilidad: ${pokemon.habilidad}</p>
                        <p>Tipo: ${pokemon.tipo}</p>
                        <p>Imagen URL: ${pokemon.imagen_url}</p>
                    </div>
                `;
            });
        })
        .catch(error => console.error('Error:', error));
});
