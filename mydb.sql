

CREATE DATABASE IF NOT EXISTS base_peliculas;
USE base_peliculas;

CREATE TABLE IF NOT EXISTS peliculas(
 id_pelicula INT NOT NULL,
    titulo VARCHAR(45) NOT NULL,
    año DATE,
    nacionalidad VARCHAR(20),
    idioma VARCHAR(120),
    formato ENUM('BLANCO Y NEGRO', 'COLOR'),
    descripcion VARCHAR(120),
    resumen VARCHAR(255),
    observaciones VARCHAR(255),
    PRIMARY KEY(id_pelicula)

)ENGINE=INNODB;

create table if not exists actores(
 id_actor int not null,
    nombre varchar(45) not null,
    nacionalidad varchar(45),
    nombre_personaje varchar(45),
    primary key(id_actor)

)engine=innodb;

create table if not exists directores(
 id_director int not null,
    nombre varchar(120) not null,
    fecha_nacimiento date,
    pais_origen varchar(120),
    primary key(id_director),
    peliculas_id_pelicula int not null,
    constraint fkdirector_peliculas
    foreign key(peliculas_id_pelicula)
    references peliculas(id_pelicula)

)engine=innodb;

create table if not exists actores_peliculas(
 peliculas_id_pelicula int not null,
    actores_id_actor int not null,
    primary key(peliculas_id_pelicula, actores_id_actor),
    constraint fkactor_peliculas
    foreign key(actores_id_actor)
    references actores(id_actor),
    constraint fkactor_actor_peliculas
    foreign key(peliculas_id_pelicula)
    references peliculas(id_pelicula)
)engine=innodb;