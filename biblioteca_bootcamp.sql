#select * from biblioteca.libro
#select * from biblioteca.libro where añoPublicacion >1990 
#select * from biblioteca.libro where autor like 'Patrick%'
#select * from biblioteca.libro where editorial like 'Blooms%'
#delete from biblioteca.libro where id = 6
/*insert into biblioteca.libro values (id,'El alquimista', 'Paulo Coelho', 1988, 'HarperCollins'),
    (id,'La chica del tren', 'Paula Hawkins', 2015, 'Riverhead Books'),
    (id,'Bajo la misma estrella', 'John Green', 2012, 'Dutton Books'),
    (id,'El código Da Vinci', 'Dan Brown', 2003, 'Doubleday'),
    (id,'Cazadores de sombras: Ciudad de hueso', 'Cassandra Clare', 2007, 'Margaret K. McElderry Books'),
    ('Cien años de soledad', 'Gabriel García Márquez', 1967, 'Sudamericana'),
    ('1984', 'George Orwell', 1949, 'Secker & Warburg'),
    ('El nombre del viento', 'Patrick Rothfuss', 2007, 'Daw Books'),
    ('El señor de los anillos', 'J.R.R. Tolkien', 1954, 'Allen & Unwin'),
    ('Harry Potter y la piedra filosofal', 'J.K. Rowling', 1997, 'Bloomsbury')*/
#select * from biblioteca.libro where añoPublicacion >2000 and autor like "%i%"
#select * from biblioteca.libro where titulo like "El%" or titulo like "La%"