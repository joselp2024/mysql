---¿Qué nacionalidades hay?
SELECT nationality 
FROM authors 
GROUP BY nationality;

---¿Cuantos escritores hay de cada nacionalidad?
SELECT nationality, COUNT(author_id) AS EscritoresNacionalidad
FROM authors 
GROUP BY nationality;


---¿Cuantos libros hay de cada nacionalidad?
SELECT a.nationality, COUNT(b.author_id) AS NAcionalidadLibros
FROM authors AS a
JOIN books AS b
    On a.author_id=b.author_id 
GROUP BY a.nationality;


---¿Cual es el promedio/desviacion standard del precio de los libros?

SELECT AVG(price) as avg_price, STDDEV(price) as stddev_price FROM books;

---¿Cual es el precio maximo/minimo de un libro?

Select MAX(price) AS Max_Price, MIN(price) AS Min_Price
FROM  books; 


---¿Cual es el precio maximo/minimo de un libro?

