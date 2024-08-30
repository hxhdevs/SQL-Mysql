-- Muestra las bases de datos
SHOW DATABASES;
-- Con el siguiente creamos una base de datos
CREATE DATABASE appsalon;
-- Podemos volver a tipear show databases para mostrar las dbs existentes y debe mostrar appsalon
-- despues aplicamos USE seguido de database para pocisioanrnos sobre la DB
USE appsalon

-- # entramos a cmd al directorin del bin y tipeamos lo siguiente mysql -u root -p 
-- una vez ahi tipea SHOW DATBASES; para obtener los esquemas como ejemplo lo siguiente
C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 12
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database appsalon;
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> use appsalon;
Database changed
MariaDB [appsalon]> create table servicios(
    -> id INT(11) NOT NULL AUTO_INCREMENT,
    -> nombre varchar(60) not null,
    -> precio decimal(6,2)not null,
    -> primary key(id)6,2)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '6,2)
)' at line 5
MariaDB [appsalon]> create table servicios(
    -> id INT(11) NOT NULL AUTO_INCREMENT,
    -> nombre varchar(60) not null,
    -> precio decimal(6,2)not null,
    -> primary key(id)
    -> );
Query OK, 0 rows affected (0.010 sec)

MariaDB [appsalon]> describe servicios;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| nombre | varchar(60)  | NO   |     | NULL    |                |
| precio | decimal(6,2) | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
3 rows in set (0.015 sec)

MariaDB [appsalon]> INSERT INTO servicios (nombre,precio)values("Corte de cabello de adulto",80);
Query OK, 1 row affected (0.068 sec)

MariaDB [appsalon]> INSERT INTO servicios (nombre,precio)values("Corte de cabello niño",60);
Query OK, 1 row affected (0.003 sec)

MariaDB [appsalon]> describe servicios;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| nombre | varchar(60)  | NO   |     | NULL    |                |
| precio | decimal(6,2) | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
3 rows in set (0.018 sec)

MariaDB [appsalon]> INSERT INTO servicios (nombre,precio)values
    -> ('Peinado mujer',80),
    -> ('Peinado hombre',80);
Query OK, 2 rows affected (0.003 sec)
Records: 2  Duplicates: 0  Warnings: 0
-- ## Seleccionando elementos de la tabla
MariaDB [appsalon]> select * from servicios;
+----+----------------------------+--------+
| id | nombre                     | precio |
+----+----------------------------+--------+
|  1 | Corte de cabello de adulto |  80.00 |
|  2 | Corte de cabello niño      |  60.00 |
|  3 | Peinado mujer              |  80.00 |
|  4 | Peinado hombre             |  80.00 |
+----+----------------------------+--------+
4 rows in set (0.000 sec)

MariaDB [appsalon]> SELECT nombre FROM servicios;
+----------------------------+
| nombre                     |
+----------------------------+
| Corte de cabello de adulto |
| Corte de cabello niño      |
| Peinado mujer              |
| Peinado hombre             |
+----------------------------+
4 rows in set (0.000 sec)

MariaDB [appsalon]> SELECT nombre,precio FROM servicios;
+----------------------------+--------+
| nombre                     | precio |
+----------------------------+--------+
| Corte de cabello de adulto |  80.00 |
| Corte de cabello niño      |  60.00 |
| Peinado mujer              |  80.00 |
| Peinado hombre             |  80.00 |
+----------------------------+--------+
4 rows in set (0.000 sec)

MariaDB [appsalon]> SELECT id,nombre,precio FROM servicios;
+----+----------------------------+--------+
| id | nombre                     | precio |
+----+----------------------------+--------+
|  1 | Corte de cabello de adulto |  80.00 |
|  2 | Corte de cabello niño      |  60.00 |
|  3 | Peinado mujer              |  80.00 |
|  4 | Peinado hombre             |  80.00 |
+----+----------------------------+--------+
4 rows in set (0.000 sec)

MariaDB [appsalon]> SELECT id,nombre,precio FROM servicios ORDER BY precio;
+----+----------------------------+--------+
| id | nombre                     | precio |
+----+----------------------------+--------+
|  2 | Corte de cabello niño      |  60.00 |
|  1 | Corte de cabello de adulto |  80.00 |
|  3 | Peinado mujer              |  80.00 |
|  4 | Peinado hombre             |  80.00 |
+----+----------------------------+--------+
4 rows in set (0.000 sec)

MariaDB [appsalon]> SELECT id,nombre,precio FROM servicios ORDER BY precio ASC;
+----+----------------------------+--------+
| id | nombre                     | precio |
+----+----------------------------+--------+
|  2 | Corte de cabello niño      |  60.00 |
|  1 | Corte de cabello de adulto |  80.00 |
|  3 | Peinado mujer              |  80.00 |
|  4 | Peinado hombre             |  80.00 |
+----+----------------------------+--------+
4 rows in set (0.000 sec)

MariaDB [appsalon]> SELECT id,nombre,precio FROM servicios LIMIT 2;
+----+----------------------------+--------+
| id | nombre                     | precio |
+----+----------------------------+--------+
|  1 | Corte de cabello de adulto |  80.00 |
|  2 | Corte de cabello niño      |  60.00 |
+----+----------------------------+--------+
2 rows in set (0.000 sec)

MariaDB [appsalon]> SELECT id,nombre,precio FROM servicios ORDER BY id DESC LIMIT 2;
+----+----------------+--------+
| id | nombre         | precio |
+----+----------------+--------+
|  4 | Peinado hombre |  80.00 |
|  3 | Peinado mujer  |  80.00 |
+----+----------------+--------+
2 rows in set (0.000 sec)

MariaDB [appsalon]> SELECT id,nombre,precio FROM servicios WHERE id=1;
+----+----------------------------+--------+
| id | nombre                     | precio |
+----+----------------------------+--------+
|  1 | Corte de cabello de adulto |  80.00 |
+----+----------------------------+--------+
1 row in set (0.000 sec)

MariaDB [appsalon]> UPDATE servicios SET precio = 70 WHERE id = 2;
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [appsalon]> SELECT * FROM servicios;
+----+----------------------------+--------+
| id | nombre                     | precio |
+----+----------------------------+--------+
|  1 | Corte de cabello de adulto |  80.00 |
|  2 | Corte de cabello niño      |  70.00 |
|  3 | Peinado mujer              |  80.00 |
|  4 | Peinado hombre             |  80.00 |
+----+----------------------------+--------+
4 rows in set (0.000 sec)

MariaDB [appsalon]> UPDATE servicios SET nombre = "Corte cabello HxH", precio = 120 WHERE id=1;
Query OK, 1 row affected (0.003 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [appsalon]> SELECT * FROM servicios;
+----+-----------------------+--------+
| id | nombre                | precio |
+----+-----------------------+--------+
|  1 | Corte cabello HxH     | 120.00 |
|  2 | Corte de cabello niño |  70.00 |
|  3 | Peinado mujer         |  80.00 |
|  4 | Peinado hombre        |  80.00 |
+----+-----------------------+--------+
4 rows in set (0.000 sec)
-- # Eliminando un registro
MariaDB [appsalon]> DELETE FROM servicios WHERE id = 4;
Query OK, 1 row affected (0.003 sec)

MariaDB [appsalon]> SELECT * FROM servicios;
+----+-----------------------+--------+
| id | nombre                | precio |
+----+-----------------------+--------+
|  1 | Corte cabello HxH     | 120.00 |
|  2 | Corte de cabello niño |  70.00 |
|  3 | Peinado mujer         |  80.00 |
+----+-----------------------+--------+
3 rows in set (0.001 sec)

MariaDB [appsalon]> ALTER TABLE servicios ADD descripcion VARCHAR(100) NOT NULL;
Query OK, 0 rows affected (0.009 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [appsalon]> DESCRIBE servicios;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| nombre      | varchar(60)  | NO   |     | NULL    |                |
| precio      | decimal(6,2) | NO   |     | NULL    |                |
| descripcion | varchar(100) | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
4 rows in set (0.016 sec)
MariaDB [appsalon]> SELECT * FROM servicios;
+----+-----------------------+--------+-------------+
| id | nombre                | precio | descripcion |
+----+-----------------------+--------+-------------+
|  1 | Corte cabello HxH     | 120.00 |             |
|  2 | Corte de cabello niño |  70.00 |             |
|  3 | Peinado mujer         |  80.00 |             |
+----+-----------------------+--------+-------------+
3 rows in set (0.001 sec)

MariaDB [appsalon]> ALTER TABLE servicios CHANGE descripcion nuevonombre VARCHAR(20) NOT NULL;
Query OK, 3 rows affected (0.053 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [appsalon]> DESCRIBE servicios;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| nombre      | varchar(60)  | NO   |     | NULL    |                |
| precio      | decimal(6,2) | NO   |     | NULL    |                |
| nuevonombre | varchar(20)  | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
4 rows in set (0.017 sec)

MariaDB [appsalon]> ALTER TABLE servicios CHANGE nuevonombre descripcion VARCHAR(20) NOT NULL;
Query OK, 0 rows affected (0.008 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [appsalon]> SELECT * FROM servicios;
+----+-----------------------+--------+-------------+
| id | nombre                | precio | descripcion |
+----+-----------------------+--------+-------------+
|  1 | Corte cabello HxH     | 120.00 |             |
|  2 | Corte de cabello niño |  70.00 |             |
|  3 | Peinado mujer         |  80.00 |             |
|  5 | Peinado               | 100.00 | Hola        |
+----+-----------------------+--------+-------------+
4 rows in set (0.000 sec)

MariaDB [appsalon]> ALTER TABLE servicios DROP COLUMN descripcion;
Query OK, 0 rows affected (0.009 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [appsalon]> SELECT * FROM servicios;
+----+-----------------------+--------+
| id | nombre                | precio |
+----+-----------------------+--------+
|  1 | Corte cabello HxH     | 120.00 |
|  2 | Corte de cabello niño |  70.00 |
|  3 | Peinado mujer         |  80.00 |
|  5 | Peinado               | 100.00 |
+----+-----------------------+--------+
4 rows in set (0.000 sec)
-- Eliminando tablas
MariaDB [appsalon]> DROP TABLE servicios;

Query OK, 0 rows affected (0.008 sec)
MariaDB [appsalon]> CREATE TABLE servicios(
    -> id INT NOT NULL AUTO_INCREMENT,
    -> nombre VARCHAR(60) not null,
    -> precio DECIMAL(6,2)not null,
    -> PRIMARY KEY(id)
    -> );
Query OK, 0 rows affected (0.011 sec)

MariaDB [appsalon]> CREATE TABLE reservaciones(
    -> id INT(11) NOT NULL AUTO_INCREMENT,
    -> nombre varchar(60) not null,
    -> apellido varchar(60) not null,
    -> hora time default null,
    -> fecha date default null,
    -> servicios varchar(255)not null,
    -> primary key (id)
    -> );
Query OK, 0 rows affected (0.011 sec)
	
	INSERT INTO reservaciones (nombre, apellido, hora, fecha, servicios) VALUES
        ('Juan', 'De la torre', '10:30:00', '2021-06-28', 'Corte de Cabello Adulto, Corte de Barba' ),
        ('Antonio', 'Hernandez', '14:00:00', '2021-07-30', 'Corte de Cabello Niño'),
        ('Pedro', 'Juarez', '20:00:00', '2021-06-25', 'Corte de Cabello Adulto'),
        ('Mireya', 'Perez', '19:00:00', '2021-06-25', 'Peinado Mujer'),
        ('Jose', 'Castillo', '14:00:00', '2021-07-30', 'Peinado Hombre'),
        ('Maria', 'Diaz', '14:30:00', '2021-06-25', 'Tinte'),
        ('Clara', 'Duran', '10:00:00', '2021-07-01', 'Uñas, Tinte, Corte de Cabello Mujer'),
        ('Miriam', 'Ibañez', '09:00:00', '2021-07-01', 'Tinte'),
        ('Samuel', 'Reyes', '10:00:00', '2021-07-02', 'Tratamiento Capilar'),
        ('Joaquin', 'Muñoz', '19:00:00', '2021-06-28', 'Tratamiento Capilar'),
        ('Julia', 'Lopez', '08:00:00', '2021-06-25', 'Tinte'),
        ('Carmen', 'Ruiz', '20:00:00', '2021-07-01', 'Uñas'),
        ('Isaac', 'Sala', '09:00:00', '2021-07-30', 'Corte de Cabello Adulto'),
        ('Ana', 'Preciado', '14:30:00', '2021-06-28', 'Corte de Cabello Mujer'),
        ('Sergio', 'Iglesias', '10:00:00', '2021-07-02', 'Corte de Cabello Adulto'),
        ('Aina', 'Acosta', '14:00:00', '2021-07-30', 'Uñas'),
        ('Carlos', 'Ortiz', '20:00:00', '2021-06-25', 'Corte de Cabello Niño'),
        ('Roberto', 'Serrano', '10:00:00', '2021-07-30', 'Corte de Cabello Niño'),
        ('Carlota', 'Perez', '14:00:00', '2021-07-01', 'Uñas'),
        ('Ana Maria', 'Igleias', '14:00:00', '2021-07-02', 'Uñas, Tinte'),
        ('Jaime', 'Jimenez', '14:00:00', '2021-07-01', 'Corte de Cabello Niño'),
        ('Roberto', 'Torres', '10:00:00', '2021-07-02', 'Corte de Cabello Adulto'),
        ('Juan', 'Cano', '09:00:00', '2021-07-02', 'Corte de Cabello Niño'),
        ('Santiago', 'Hernandez', '19:00:00', '2021-06-28', 'Corte de Cabello Niño'),
        ('Berta', 'Gomez', '09:00:00', '2021-07-01', 'Uñas'),
        ('Miriam', 'Dominguez', '19:00:00', '2021-06-28', 'Corte de Cabello Niño'),
        ('Antonio', 'Castro', '14:30:00', '2021-07-02', 'Corte de Cabello Adulti'),
        ('Hugo', 'Alonso', '09:00:00', '2021-06-28', 'Corte de Barba'),
        ('Victoria', 'Perez', '10:00:00', '2021-07-02', 'Uñas, Tinte'),
        ('Jimena', 'Leon', '10:30:00', '2021-07-30', 'Uñas, Corte de Cabello Mujer'),
        ('Raquel' ,'Peña', '20:30:00', '2021-06-25', 'Corte de Cabello Mujer');
        
  INSERT INTO servicios ( nombre, precio ) VALUES
        ('Corte de Cabello Niño', 60),
        ('Corte de Cabello Hombre', 80),
        ('Corte de Barba', 60),
        ('Peinado Mujer', 80),
        ('Peinado Hombre', 60),
        ('Tinte',300),
        ('Uñas', 400),
        ('Lavado de Cabello', 50),
        ('Tratamiento Capilar', 150);
-- Selecionamos segun sea el precio puede ser igual mayor o menor que el monto fijado        
MariaDB [appsalon]> SELECT * FROM servicios WHERE precio >90;
+----+---------------------+--------+
| id | nombre              | precio |
+----+---------------------+--------+
|  6 | Tinte               | 300.00 |
|  7 | Uñas                | 400.00 |
|  9 | Tratamiento Capilar | 150.00 |
+----+---------------------+--------+
3 rows in set (0.000 sec)
-- HAciendo uso del BETWEEN
MariaDB [appsalon]> SELECT * FROM servicios WHERE precio BETWEEN 100 AND 200;
+----+---------------------+--------+
| id | nombre              | precio |
+----+---------------------+--------+
|  9 | Tratamiento Capilar | 150.00 |
+----+---------------------+--------+
1 row in set (0.000 sec)

-- Aplicando otros selectores en MYSQL.

-- Contando cantidad de reservaciones por fecha
MariaDB [appsalon]> SELECT COUNT(id), fecha
    -> FROM reservaciones
    -> GROUP BY fecha
    -> ORDER BY COUNT(id) DESC;
+-----------+------------+
| COUNT(id) | fecha      |
+-----------+------------+
|         7 | 2021-07-02 |
|         6 | 2021-06-28 |
|         6 | 2021-07-30 |
|         6 | 2021-06-25 |
|         6 | 2021-07-01 |
+-----------+------------+
5 rows in set (0.001 sec)
-- Aplicando sumatoria al costo total de los servicios
MariaDB [appsalon]> SELECT SUM(precio) AS totalServicios FROM servicios;
+----------------+
| totalServicios |
+----------------+
|        1240.00 |
+----------------+
1 row in set (0.000 sec)

-- Obtendiendo el costo mayor y menor de los servicios
MariaDB [appsalon]> SELECT MIN(precio) AS precioMenor FROM servicios;
+-------------+
| precioMenor |
+-------------+
|       50.00 |
+-------------+
1 row in set (0.000 sec)

MariaDB [appsalon]> SELECT MAX(precio) AS precioMayor FROM servicios;
+-------------+
| precioMayor |
+-------------+
|      400.00 |
+-------------+
1 row in set (0.000 sec)

--Como hacer una busqueda en MYSQL

-- Aqui solo busca resultados que inicien con la palabra a buscar
MariaDB [appsalon]> SELECT * FROM servicios WHERE nombre LIKE 'Corte%';
+----+-------------------------+--------+
| id | nombre                  | precio |
+----+-------------------------+--------+
|  1 | Corte de Cabello Niño   |  60.00 |
|  2 | Corte de Cabello Hombre |  80.00 |
|  3 | Corte de Barba          |  60.00 |
+----+-------------------------+--------+
3 rows in set (0.000 sec)
-- Aqui solo busca resultados que terminen con la palabra a buscar
MariaDB [appsalon]> SELECT * FROM servicios WHERE nombre LIKE '%Cabello';
+----+-------------------+--------+
| id | nombre            | precio |
+----+-------------------+--------+
|  8 | Lavado de Cabello |  50.00 |
+----+-------------------+--------+
1 row in set (0.000 sec)
-- Aqui solo busca resultados que contengan en algun punto de su cuerpo la palabra a buscar
MariaDB [appsalon]> SELECT * FROM servicios WHERE nombre LIKE '%orte%';
+----+-------------------------+--------+
| id | nombre                  | precio |
+----+-------------------------+--------+
|  1 | Corte de Cabello Niño   |  60.00 |
|  2 | Corte de Cabello Hombre |  80.00 |
|  3 | Corte de Barba          |  60.00 |
+----+-------------------------+--------+
3 rows in set (0.000 sec)
-- Como concatenar dos columnas
MariaDB [appsalon]> SELECT CONCAT(nombre,' ',apellido) AS nombreCompleto FROM reservaciones;
+--------------------+
| nombreCompleto     |
+--------------------+
| Juan De la torre   |
| Antonio Hernandez  |
| Pedro Juarez       |
| Mireya Perez       |
| Jose Castillo      |
| Maria Diaz         |
| Clara Duran        |
| Miriam Ibañez      |
| Samuel Reyes       |
| Joaquin Muñoz      |
| Julia Lopez        |
| Carmen Ruiz        |
| Isaac Sala         |
| Ana Preciado       |
| Sergio Iglesias    |
| Aina Acosta        |
| Carlos Ortiz       |
| Roberto Serrano    |
| Carlota Perez      |
| Ana Maria Igleias  |
| Jaime Jimenez      |
| Roberto Torres     |
| Juan Cano          |
| Santiago Hernandez |
| Berta Gomez        |
| Miriam Dominguez   |
| Antonio Castro     |
| Hugo Alonso        |
| Victoria Perez     |
| Jimena Leon        |
| Raquel Peña        |
+--------------------+
31 rows in set (0.000 sec)
-- Buscando con mas especificidad
MariaDB [appsalon]> SELECT * FROM reservaciones WHERE CONCAT(nombre, " ",apellido) LIKE '%Ana Preciado%';
+----+--------+----------+----------+------------+------------------------+
| id | nombre | apellido | hora     | fecha      | servicios              |
+----+--------+----------+----------+------------+------------------------+
| 14 | Ana    | Preciado | 14:30:00 | 2021-06-28 | Corte de Cabello Mujer |
+----+--------+----------+----------+------------+------------------------+
1 row in set (0.001 sec)

MariaDB [appsalon]> SELECT hora, fecha, CONCAT(nombre," ",apellido) as 'Nombre Completo'
    -> FROM reservaciones
    -> WHERE CONCAT(nombre," ",apellido)
    -> LIKE '%Ana Preciado%';
+----------+------------+-----------------+
| hora     | fecha      | Nombre Completo |
+----------+------------+-----------------+
| 14:30:00 | 2021-06-28 | Ana Preciado    |
+----------+------------+-----------------+
1 row in set (0.000 sec)

--Revision multiple con IN y AND
MariaDB [appsalon]> SELECT * FROM reservaciones WHERE id IN(1,3);
+----+--------+-------------+----------+------------+-----------------------------------------+
| id | nombre | apellido    | hora     | fecha      | servicios                               |
+----+--------+-------------+----------+------------+-----------------------------------------+
|  1 | Juan   | De la torre | 10:30:00 | 2021-06-28 | Corte de Cabello Adulto, Corte de Barba |
|  3 | Pedro  | Juarez      | 20:00:00 | 2021-06-25 | Corte de Cabello Adulto                 |
+----+--------+-------------+----------+------------+-----------------------------------------+
2 rows in set (0.000 sec)

MariaDB [appsalon]> SELECT * FROM reservaciones WHERE fecha="2021-06-28" AND id IN(1,10);
+----+---------+-------------+----------+------------+-----------------------------------------+
| id | nombre  | apellido    | hora     | fecha      | servicios                               |
+----+---------+-------------+----------+------------+-----------------------------------------+
|  1 | Juan    | De la torre | 10:30:00 | 2021-06-28 | Corte de Cabello Adulto, Corte de Barba |
| 10 | Joaquin | Muñoz       | 19:00:00 | 2021-06-28 | Tratamiento Capilar                     |
+----+---------+-------------+----------+------------+-----------------------------------------+
2 rows in set (0.001 sec)

--Creando tabla normalizada
MariaDB [appsalon]> CREATE TABLE clientes(
    -> id INT(11)NOT NULL AUTO_INCREMENT,
    -> nombre VARCHAR(60) NOT NULL,
    -> apellido VARCHAR(60) NOT NULL,
    -> telefono VARCHAR(10) NOT NULL,
    -> email VARCHAR(30) NOT NULL UNIQUE,
    -> PRIMARY KEY(id)
    -> );
Query OK, 0 rows affected (0.032 sec)

MariaDB [appsalon]> show tables;
+--------------------+
| Tables_in_appsalon |
+--------------------+
| clientes           |
| reservaciones      |
| servicios          |
+--------------------+
3 rows in set (0.001 sec)

MariaDB [appsalon]> INSERT INTO clientes(nombre, apellido, telefono,email) VALUES
    -> ("Elih","Freecs","9531226488","hxh@mail.com");
Query OK, 1 row affected (0.004 sec)
MariaDB [appsalon]> SELECT * FROM clientes;
+----+--------+----------+------------+--------------+
| id | nombre | apellido | telefono   | email        |
+----+--------+----------+------------+--------------+
|  1 | Elih   | Freecs   | 9531226488 | hxh@mail.com |
+----+--------+----------+------------+--------------+
1 row in set (0.000 sec)

--Relacionando 2 tablas
MariaDB [appsalon]> CREATE TABLE citas(
    -> id INT(11) not null auto_increment,
    -> fecha date not null,
    -> hora time not null,
    -> clienteId int(11) not null,
    -> primary key (id),
    -> key clienteId (clienteId),
    -> constraint cliente_FK
    -> foreign key(clienteId)
    -> references clientes(id)
    -> );
Query OK, 0 rows affected (0.032 sec)
-- Cuando se relacionan dos tablas ambas columnas deben tener el mismo tipo de valor y longitud y al agregar previamente CONSTRAINT limitamos a que solo acepte valores que 
-- estan en la tabla relacionado
MariaDB [appsalon]> describe citas;
+-----------+---------+------+-----+---------+----------------+
| Field     | Type    | Null | Key | Default | Extra          |
+-----------+---------+------+-----+---------+----------------+
| id        | int(11) | NO   | PRI | NULL    | auto_increment |
| fecha     | date    | NO   |     | NULL    |                |
| hora      | time    | NO   |     | NULL    |                |
| clienteId | int(11) | NO   | MUL | NULL    |                |
+-----------+---------+------+-----+---------+----------------+
4 rows in set (0.015 sec)

MariaDB [appsalon]> describe clientes;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int(11)     | NO   | PRI | NULL    | auto_increment |
| nombre   | varchar(60) | NO   |     | NULL    |                |
| apellido | varchar(60) | NO   |     | NULL    |                |
| telefono | varchar(10) | NO   |     | NULL    |                |
| email    | varchar(30) | NO   | UNI | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
5 rows in set (0.014 sec)

-- Uniendo tablas con JOIN
MariaDB [appsalon]> SELECT * FROM citas
    -> INNER JOIN clientes ON clientes.id=citas.clienteId;
+----+------------+----------+-----------+----+--------+----------+------------+--------------+
| id | fecha      | hora     | clienteId | id | nombre | apellido | telefono   | email        |
+----+------------+----------+-----------+----+--------+----------+------------+--------------+
|  1 | 2024-08-29 | 00:00:00 |         1 |  1 | Elih   | Freecs   | 9531226488 | hxh@mail.com |
+----+------------+----------+-----------+----+--------+----------+------------+--------------+
1 row in set (0.000 sec)

-- Al hacer uso de LEFT se trae los resultados de la tabla izquierda en la condicione del igualado
-- Con RIGHT se trae los resultados en comun con la tabla de lado derecho en la igualacion

-- Creando una tabla pivote
MariaDB [appsalon]> CREATE TABLE citasServicios(
    -> id INT(11) AUTO_INCREMENT,
    -> citaId int(11) NOT NULL,
    -> servicioId INT(11)NOT NULL,
    -> PRIMARY KEY(id),
    -> KEY citaId(citaId),
    -> CONSTRAINT citas_FK
    -> FOREIGN KEY(citaId)
    -> REFERENCES citas(id),
    -> KEY servicioId(servicioId),
    -> CONSTRAINT servicios_FK
    -> FOREIGN KEY(servicioId)
    -> REFERENCES servicios(id)
    -> );
Query OK, 0 rows affected (0.032 sec)

MariaDB [appsalon]> show tables;
+--------------------+
| Tables_in_appsalon |
+--------------------+
| citas              |
| citasservicios     |
| clientes           |
| reservaciones      |
| servicios          |
+--------------------+
5 rows in set (0.001 sec)
-- Insertando valores a la pivote
MariaDB [appsalon]> INSERT INTO citasservicios(citaId, servicioId) VALUES (1,8);
Query OK, 1 row affected (0.003 sec)

-- Consultando la informacion de una tabla pivote con m,ultiples JOIN
MariaDB [appsalon]> SELECT * FROM citasservicios
    -> LEFT JOIN citas ON citas.id = citasservicios.citaId
    -> LEFT JOIN servicios on servicios.id =citasservicios.servicioId;
+----+--------+------------+------+------------+----------+-----------+------+-----------------------+--------+
| id | citaId | servicioId | id   | fecha      | hora     | clienteId | id   | nombre                | precio |
+----+--------+------------+------+------------+----------+-----------+------+-----------------------+--------+
|  1 |      1 |          1 |    1 | 2024-08-29 | 00:00:00 |         1 |    1 | Corte de Cabello Niño |  60.00 |
|  2 |      1 |          8 |    1 | 2024-08-29 | 00:00:00 |         1 |    8 | Lavado de Cabello     |  50.00 |
|  3 |      1 |          8 |    1 | 2024-08-29 | 00:00:00 |         1 |    8 | Lavado de Cabello     |  50.00 |
+----+--------+------------+------+------------+----------+-----------+------+-----------------------+--------+
3 rows in set (0.000 sec)