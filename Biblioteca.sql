/*insert into biblioteca.libro values (idlibro,'El alquimista', 'Paulo Coelho', 1988, 'HarperCollins'),
    (idlibro,'La chica del tren', 'Paula Hawkins', 2015, 'Riverhead Books'),
    (idlibro,'Bajo la misma estrella', 'John Green', 2012, 'Dutton Books'),
    (idlibro,'El código Da Vinci', 'Dan Brown', 2003, 'Doubleday'),
    (idlibro,'Cazadores de sombras: Ciudad de hueso', 'Cassandra Clare', 2007, 'Margaret K. McElderry Books'),
    (idlibro,'Cazadores de sombras: Ciudad de hueso', 'Cassandra Clare', 2007, 'Margaret K. McElderry Books'),
    (idlibro,'Cien años de soledad', 'Gabriel García Márquez', 1967, 'Sudamericana'),
    (idlibro,'1984', 'George Orwell', 1949, 'Secker & Warburg'),
    (idlibro,'El nombre del viento', 'Patrick Rothfuss', 2007, 'Daw Books'),
    (idlibro,'El señor de los anillos', 'J.R.R. Tolkien', 1954, 'Allen & Unwin'),
    (idlibro,'Harry Potter y la piedra filosofal', 'J.K. Rowling', 1997, 'Bloomsbury')*/
    
#Eliminar el libro mas antiguo de la tabla libro    
DELETE FROM biblioteca.libro WHERE
anopublicacion = (SELECT min(anopublicacion) FROM biblioteca.libro);

#Agregar al menos dos libros más a la tabla
INSERT INTO biblioteca.libro values (idlibro, 'El poder del ahora', 'Eckhart Tolle', 2011, 'Grijalbo'),
									(idlibro, 'Azabache', 'Anna Sewell', 1975, 'Aniversario');
                                    
# Mostrar los libros escritos por un autor específico y publicados después de cierto año (por ejemplo, "AutorElegido" y después de 2015)
SELECT * FROM biblioteca.libro
WHERE autor LIKE 'Dan%' AND anopublicacion > 2000;

# Mostrar el título y el año de publicación de los libros escritos por autores cuyos nombres comiencen con la letra "A"
SELECT titulo, anopublicacion FROM biblioteca.libro	
WHERE autor LIKE 'A%';

#Mostrar los títulos de los libros y sus autores, ordenados alfabéticamente por autor y luego por título
SELECT titulo, autor FROM biblioteca.libro
order by autor, titulo ASC;

#Contar cuántos libros fueron publicados por cada editorial
SELECT COUNT(titulo), editorial FROM biblioteca.libro
group by editorial;

#Encontrar el autor que ha escrito la mayor cantidad de libros
SELECT count(titulo), autor FROM biblioteca.libro 
group by autor DESC
LIMIT 1;

#Calcular el año promedio de publicación de los libros en la tabla
SELECT ROUND(AVG(anopublicacion)) FROM biblioteca.libro;

#Mostrar los libros que tienen títulos que contienen la palabra "aventura" y fueron publicados después de 2010
SELECT * FROM biblioteca.libro
WHERE titulo LIKE '%aventura%' AND anopublicacion > 2010;

#Mostrar los libros agrupados por década de publicación, junto con la cantidad de libros publicados en cada década
select  round(anoPublicacion/10) as decada,count(round(anoPublicacion/10)) as cantidad from biblioteca.libro 
group by round(anoPublicacion/10);

#Encontrar el autor con el título del libro más largo
SELECT autor, titulo, length(titulo) AS count_letter FROM biblioteca.libro
ORDER BY length(titulo) DESC
LIMIT 1;

#Mostrar los títulos de los libros y el número de palabras en cada título, ordenados de forma descendente por el número de palabras
SELECT titulo, LENGTH(titulo) - LENGTH(REPLACE(titulo, ' ', '')) + 1 AS numero_de_palabras
FROM biblioteca.libro
ORDER BY LENGTH(titulo) - LENGTH(REPLACE(titulo, ' ', '')) + 1 DESC;

#Calcular la diferencia de años entre el año de publicación del libro más reciente y el año de publicación del libro más antiguo
SELECT max(anopublicacion) AS anoreciente, min(anopublicacion) AS anoantiguo,
(max(anopublicacion))-(min(anopublicacion)) AS diferencia
FROM biblioteca.libro;

SELECT Alias.anoreciente - Alias.anoantiguo FROM (SELECT max(anopublicacion) AS anoreciente, min(anopublicacion) AS anoantiguo
FROM biblioteca.libro) AS Alias
    
    