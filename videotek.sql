DROP TABLE IF EXISTS films;
CREATE TABLE films (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    image TEXT,
    route TEXT,
    title TEXT NOT NULL,
    rating REAL,
    trailer TEXT,
    agelimit INTEGER,
    description TEXT,
    country TEXT,
    release_year INTEGER,
    video TEXT
);

DROP TABLE IF EXISTS videos;
CREATE TABLE videos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    image TEXT,
    route TEXT,
    title TEXT NOT NULL,
    rating REAL,
    trailer TEXT,
    agelimit INTEGER,
    description TEXT,
    country TEXT,
    release_year INTEGER,
    video TEXT
);

DROP TABLE IF EXISTS serials;
CREATE TABLE serials (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    image TEXT,
    route TEXT,
    title TEXT NOT NULL,
    rating REAL,
    trailer TEXT,
    agelimit INTEGER,
    description TEXT,
    country TEXT,
    release_year INTEGER
);

DROP TABLE IF EXISTS episodes;
CREATE TABLE episodes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    episode_number INTEGER NOT NULL,
    season_number INTEGER NOT NULL,
    serial_id INTEGER NOT NULL
);

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    genre TEXT NOT NULL
);

DROP TABLE IF EXISTS film_genre;
CREATE TABLE film_genre (
    film_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL
);
CREATE INDEX film_genre_index ON film_genre (film_id, genre_id);

DROP TABLE IF EXISTS persona;
CREATE TABLE persona (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    route TEXT NOT NULL,
    name TEXT NOT NULL,
    biography TEXT,
    birthday TEXT,
    birthplace TEXT,
    deathday TEXT,
    deathplace TEXT
);

DROP TABLE IF EXISTS film_director;
CREATE TABLE film_director (
    film_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL
);
CREATE INDEX film_director_index
ON film_director (film_id, person_id);

DROP TABLE IF EXISTS film_actor;
CREATE TABLE film_actor (
    film_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL
);
CREATE INDEX film_actor_index
ON film_actor (film_id, person_id);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    film_id INTEGER NOT NULL,
    username TEXT NOT NULL,
    message TEXT,
    datetime TEXT
);

DROP TABLE IF EXISTS scores;
CREATE TABLE scores (
    film_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    score INTEGER
);
CREATE INDEX scores_index
ON scores (film_id, user_id);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL
);