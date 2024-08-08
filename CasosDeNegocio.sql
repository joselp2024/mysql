---¿Qué nacionalidades hay?
SELECT nationality 
FROM authors 
GROUP BY nationality;

---¿Cuantos escritores hay de cada nacionalidad?
SELECT nationality, COUNT(author_id) AS EscritoresNacionalidad
FROM authors 
GROUP BY nationality
ORDER BY EscritoresNacionalidad DESC;


---¿Cuantos libros hay de cada nacionalidad?
SELECT a.nationality, COUNT(b.author_id) AS NAcionalidadLibros
FROM authors AS a
JOIN books AS b
    On a.author_id=b.author_id 
GROUP BY a.nationality;


---¿Cual es el promedio/desviacion standard del precio de los libros?

SELECT AVG(price) as avg_price, STDDEV(price) as stddev_price FROM books;

--promeio/desviacion standar de precio de libros por nacionalidad

Select nationality, 
    avg(price) as prom, 
    stddev(price)as std
from books as b
join authors as a
    on a.author_id=b.author_id
group by nationality;

---¿Cual es el precio maximo/minimo de un libro?

Select MAX(price) AS Max_Price, MIN(price) AS Min_Price
FROM  books; 


--precio maximo y minimo de libro por paise

Select a.nationality, 
    MAX(price) AS Max_Price, 
    MIN(price) AS Min_Price
FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
GROUP BY a.nationality

---¿Cual es el precio maximo/minimo de un libro?

Select c.name,
    t.type,
    b.title,
    a.name,
    a.nationality
from transactions as t
LEFT JOIN clients as c
    on c.client_id = t.client_id
LEFT join books as b
    on b.book_id = t.book_id
LEFT JOIN authors as a
    on b.author_id=a.author_id

Select c.name,
    t.type,
    b.title,
    CONCAT(a.name,"(",a.nationality,")") as autor,
    To_days
from transactions as t
LEFT JOIN clients as c
    on c.client_id = t.client_id
LEFT join books as b
    on b.book_id = t.book_id
LEFT JOIN authors as a
    on b.author_id=a.author_id




----------------------------------------------------
--UPDATES
update clients
set active= 0 
where client_id=80
limit 1;

update clients
set email= 'mariadoloressssss@gmail.com' 
where client_id=1
limit 1;  

TRUNCATE TABLE nombre_de_la_tabla;
