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
    add_at TEXT,
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
    image TEXT,
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

INSERT INTO films (title, route, description, release_year, country, agelimit, image, trailer, add_at)
VALUES ('Матрица', 'matrix', 'Фильм изображает будущее, в котором реальность, существующая для большинства людей, в действительности является симуляцией, созданной разумными машинами, чтобы подчинить и усмирить человечество, в то время как тепло и электрическая активность их тел используются машинами в качестве источника энергии. Немногие люди, высвободившиеся из «мира снов» и выбравшиеся в реальность, вступают в партизанскую войну против машин…', 1999, 'США, Австралия', 16, 'matrica.jpeg', 'https://www.film.ru/sites/default/files/trailers/1622170/Matrix-TrailerRus.mp4', '2022-05-29 11:45:00');

INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Киану Ривз', 'keanu_reeves', 'a_keanu_reeves.webp', '1964-09-02', 'Бейрут, Ливан', 'Полное имя — Киану Чарльз Ривз (Keanu Charles Reeves). По-гавайски имя Keanu означает «прохладный ветер над горами». Отец Киану — Сэмуэль Ноулин Ривз — наполовину гаваец, наполовину китаец, а мать — Патрисия Тэйлор — англичанка. Киану — левша. У Киану никогда не было собственного компьютера. Если ему приходится все же общаться с компьютером — он играет в шахматы. Киану не раз утверждал, что его больше интересуют отношения человека и компьютера, нежели сам компьютер как таковой. Киану боится иметь детей, потому что этот мир его часто пугает. Однако он считает, что способен влюбиться до такой степени, когда уже станет все равно, что тебя ждет впереди.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Кэрри-Энн Мосс', 'carrie-anne_moss', 'a_carrie-anne_moss.webp', '1967-08-21', 'Ванкувер, Британская Колумбия, Канада', 'По семейной легенде, она получила свое имя в честь песни группы «Hollies» «Carrie Anne», которая была большим хитом в год ее рождения. Перед тем как стать актрисой, Мосс несколько лет работала официанткой, а потом — моделью. У Кэрри-Энн Мосс есть трое детей от брака со Стивеном Ройем, два сына и дочь — Оуэн Рой (род. в сентябре 2003), Джейден Рой (род. в ноябре 2005) и Фрэнсис Беатрис Рой (род. в июне 2009).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Лана Вачовски', 'lana_wachowski', 'a_lana_wachowski.webp', '1965-06-21', 'Чикаго, Иллинойс, США', 'Трансгендерная женщина. Имя при рождении — Лоуренс Вачовски (Laurence Wachowski). Ещё 20 октября 2012 года Лоуренс Вачовски получил награду «За смелость» от американской организации Human Rights Campaign (HRC), которые занимаются защитой прав представителей сексуальных меньшинств и трансгендеров.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Лилли Вачовски', 'lilly_wachowski', 'a_lilly_wachowski.webp', '1967-12-29', 'Чикаго, Иллинойс, США', 'Трансгендерная женщина. Имя при рождении — Эндрю Пол Вачовски (Andrew Paul Wachowski).');

INSERT INTO genres (id, genre) VALUES (1, 'Фантастика');
INSERT INTO genres (id, genre) VALUES (2, 'Фэнтези');
INSERT INTO genres (id, genre) VALUES (3, 'Боевик');
INSERT INTO genres (id, genre) VALUES (4, 'Приключения');
INSERT INTO genres (id, genre) VALUES (5, 'Семейный');
INSERT INTO genres (id, genre) VALUES (6, 'Драма');
INSERT INTO genres (id, genre) VALUES (7, 'Мелодрама');
INSERT INTO genres (id, genre) VALUES (8, 'Триллер');
INSERT INTO genres (id, genre) VALUES (9, 'Биографический');
INSERT INTO genres (id, genre) VALUES (10, 'Комедия');
INSERT INTO genres (id, genre) VALUES (11, 'Ужасы');
INSERT INTO genres (id, genre) VALUES (12, 'Мультфильм');
INSERT INTO genres (id, genre) VALUES (13, 'Детектив');
INSERT INTO genres (id, genre) VALUES (14, 'Военный');
INSERT INTO genres (id, genre) VALUES (15, 'Аниме');
INSERT INTO genres (id, genre) VALUES (16, 'Исторический');
INSERT INTO genres (id, genre) VALUES (17, 'Документальный');
INSERT INTO genres (id, genre) VALUES (18, 'Криминал');
INSERT INTO genres (id, genre) VALUES (19, 'Вестерн');
INSERT INTO genres (id, genre) VALUES (20, 'Нуар');
INSERT INTO genres (id, genre) VALUES (21, 'Спортивный');
INSERT INTO genres (id, genre) VALUES (22, 'Короткометражный');
INSERT INTO genres (id, genre) VALUES (23, 'Музыкальный');
INSERT INTO genres (id, genre) VALUES (24, 'Мюзикл');