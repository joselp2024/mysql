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
update authors set nationality = 'GBR' where nationality
= 'ENG';



----------------------------------------------------
--EXTRAS

--contar libros mayores para 1950 y los menores

select count(book_id), sum(if(year<1950,1,0)) as '<1950' from books;

select count(book_id), 
    sum(if(year<1950,1,0)) as '<1950',
    sum(if(year<1950,0,1)) as '>1950'
from books;

-- dividir los libros totales segun periodo e este caso 1950 a 1990 a 2200 y hoy
select count(book_id), 
    sum(if(year<1950,1,0)) as '<1950',
    sum(if(year >= 1950 and year <1990,1,0)) as '<1990',
    sum(if(year >= 1990 and year <2000,1,0)) as '<2000',
    sum(if(year >= 2000,1,0)) as '<hoy'
from books;

--Seleccionar libros por periodos de años, pero segun su nacionalidad

select nationality, count(book_id), 
    sum(if(year<1950,1,0)) as '<1950',
    sum(if(year >= 1950 and year <1990,1,0)) as '<1990',
    sum(if(year >= 1990 and year <2000,1,0)) as '<2000',
    sum(if(year >= 2000,1,0)) as '<hoy'
from books as b
Join authors as a
    on a.author_id = b.author_id
where
    a.nationality is not null
group by a.nationality;



-----------------------------------------------
--alter tables

alter table authors add column birthyear integer default 1930 after name;


mysql> alter table authors modify column birthyear
 year default 1920;


 alter table authors drop column birthyear;


 -------------------------------------------------
 --mysqldump

--es para hacer backup y debe de hacerse fuera de mysql, recomendable en la carpeta donde se guardara el backup.

 mysqldump -u root -p pruebaplatzi

 mysqldump -u root -p -d pruebaplatzi | more

 --una vez creamos el esquema para exportarlo seria el siguiente comando, y debemos de estar en la carpeta donde estara el documento

mysqldump -u root -p -d pruebaplatzi > esquema.sql


