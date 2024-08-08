-- Listar todas la tuplas de la tabla clients
SELECT * FROM clients;

-- Listar todos los nombres de la tabla clients
SELECT name FROM clients;

-- Listar todos los nombres, email y género de la tabla clients
SELECT name, email, gender FROM clients;

-- Listar los 10 primeros resultados de la tabla clients
SELECT name, email, gender FROM clients LIMIT 10;

-- Listar todos los clientes de género Masculino
SELECT name, email, gender FROM clients WHERE gender = 'M';

-- Listar el año de nacimientos de los clientes, con la función YEAR()
SELECT YEAR(birthdate) FROM clients;

-- Mostrar el año actual
SELECT YEAR(NOW());

-- Listar los 10 primeros resultados de las edades de los clientes
SELECT YEAR(NOW()) - YEAR(birthdate) FROM clients LIMIT 10;

-- Listar nombre y edad de los 10 primeros clientes
SELECT name, YEAR(NOW()) - YEAR(birthdate) FROM clients LIMIT 10;

-- Listar clientes que coincidan con el nombre de %Saave%;
SELECT * FROM clients WHERE name LIKE '%Saave%';

-- Listar clientes (nombre, email, edad y género). con filtro de genero = F y nombre que coincida con 'Lop'

--Usando alias para nombrar la función como 'edad'
SELECT name, email, YEAR(NOW()) - YEAR(birthdate) AS edad, gender FROM clients WHERE gender = 'F' AND name LIKE '%Lop%';
