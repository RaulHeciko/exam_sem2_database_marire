create extension if not exists postgis;

create table if not exists complex_sportiv(
	fid serial not null primary key,
	nume varchar(100) not null,
	adresa varchar(100) not null,
	geom geometry(MultiPolygon, 4326) not null
);

create table if not exists evenimente(
	id serial not null primary key,
	tip_eveniment varchar(100) not null,
	date date not null,
	descriere varchar(100) not null
);

create table if not exists evenimente_complex(
	id serial not null primary key,
	complex_sportiv_fid integer not null,
	evenimente_id integer not null,
	foreign key (complex_sportiv_fid) references complex_sportiv(fid),
	foreign key (evenimente_id) references evenimente(id)
 );

 create table if not exists terenuri(
	fid serial not null primary key,
	tip_teren varchar(100) not null,
	orar_acces varchar(100) not null,
	geom geometry(MultiPolygon, 4326) not null,
	complex_sportiv_fid integer not null,
	foreign key (complex_sportiv_fid) references complex_sportiv(fid)
 );

 create table if not exists cladiri(
	fid serial not null primary key,
	functie varchar(100) not null,
	capacitate integer not null,
	geom geometry(MultiPolygon, 4326) not null,
	complex_sportiv_fid integer not null,
	foreign key (complex_sportiv_fid) references complex_sportiv(fid)
 );

 create table if not exists retea_utilitati(
	fid serial not null primary key,
	tip_utilitate varchar(100) not null,
	geom geometry(MultiLineString, 4326) not null,
	complex_sportiv_fid integer not null,
	foreign key (complex_sportiv_fid) references complex_sportiv(fid)
 );

 create table if not exists info_complex(
	fid serial not null primary key,
	tip_resursa varchar(100) not null,
	contra_cost boolean,
	geom geometry(Point, 4326) not null,
	complex_sportiv_fid integer not null,
	foreign key (complex_sportiv_fid) references complex_sportiv(fid)
 );

 create table if not exists piste_alergat(
	fid serial not null primary key,
	numar_piste integer not null,
	latime_piste integer not null,
	geom geometry(LineString, 4326) not null,
	complex_sportiv_fid integer not null,
	foreign key (complex_sportiv_fid) references complex_sportiv(fid)
 );

create table if not exists muzeu(
	id serial not null primary key,
	nume_competitie varchar(100) not null,
	sport_copetitie varchar(100) not null,
	loc integer not null,
	complex_sportiv_fid integer not null unique,
	foreign key (complex_sportiv_fid) references complex_sportiv(fid)
);