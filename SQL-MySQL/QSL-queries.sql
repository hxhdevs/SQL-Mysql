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

MariaDB [appsalon]>