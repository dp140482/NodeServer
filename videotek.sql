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
    film_route TEXT NOT NULL,
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

INSERT INTO films (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Матрица', 'matrix', 'Фильм изображает будущее, в котором реальность, существующая для большинства людей, в действительности является симуляцией, созданной разумными машинами, чтобы подчинить и усмирить человечество, в то время как тепло и электрическая активность их тел используются машинами в качестве источника энергии. Немногие люди, высвободившиеся из «мира снов» и выбравшиеся в реальность, вступают в партизанскую войну против машин…', 1999, 'США, Австралия', 16, 'matrica.jpeg', 9.3, 'https://www.film.ru/sites/default/files/trailers/1622170/Matrix-TrailerRus.mp4', '2022-05-29 11:45:00');
INSERT INTO films (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Матрица: Воскрешение', 'matrica-reborn', 'Четвёртый фильм про Матрицу. Начало картины отсылает к вступительной сцене первого фильма: агенты гонятся за молодой Тринити, но… что-то идёт не так, и Тринити задерживают. Томас Андерсон — всемирно известный геймдизайнер, проживающий в Сан-Франциско. В своё время он руководил разработкой трилогии видеоигр «Матрица». Ныне его фирма Deus Machina приобретена корпорацией Warner Bros. Новые владельцы распоряжаются перезапустить проект и выпустить продолжение. Томас неохотно включается в работу, его мучают видения и кошмары, словно бы мир, в котором он живёт, нереален. Он посещает психоаналитика, который выписывает ему некие синие пилюли. В любимой кофейне Simulatte Томас встречает Тиффани, которая в итоге рассказывает Андерсону, что он находится в виртуальном мире, созданном искусственным интеллектом, в Матрице, и что его зовут Нео. Со времени последней версии Матрицы, той где Нео спас жителей Зиона, прошло 60 лет…', 2021, 'США', 16, 'matrix_resurrection.jpg', 9.0,'https://www.film.ru/sites/default/files/trailers/47996050/The_Matrix_Resurrections_-_The_Game_Awards_Clip_0.mp4', '2022-05-29 11:46:00');
INSERT INTO films (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Человек-паук', 'spiderman', 'Первый фильм трилогии Сэма Рэйми. Основан на истории одноимённого персонажа Marvel Comics. Фильм повествует о жизни Питера Паркера, студента старшей школы из Нью-Йорка, о получении им суперспособностей и первых шагах в качестве супергероя…', 2002, 'США', 16, 'chel.jpeg', 8.5, 'https://www.film.ru/sites/default/files/trailers/1610289/Spider-Man-First-Time.mp4', '2022-05-29 14:05:00');
INSERT INTO films (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Гарри Поттер и узник Азкабана', 'hurrypotter_azkaban', 'Третий фильм серии о Гарри Поттере, экранизация одноименного романа Джоан Роулинг, третьего в серии её книг. Во время описываемых событий Гарри Поттер на третьем курсе школы чародейства и волшебства Хогвартс. Вместе со своими друзьями Роном Уизли и Гермионой Грейнджер узнает историю Сириуса Блэка — бежавшего из тюрьмы Азкабан волшебника, который подозревается в работе на лорда Волан-де-Морта', 2004, 'США, Великобритания', 6, 'garri.jpeg', 8.6,'https://www.film.ru/sites/default/files/trailers/1610780/Willow.mp4','2022-05-29 14:10:00');
INSERT INTO films (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Аватар', 'avatar', 'Действие фильма разворачивается в 2154 году, когда человечество добывает ценный минерал анобтаниум на Пандоре, обитаемом спутнике газовой планеты в звёздной системе Альфы Центавра. По сюжету ресурсодобывающая корпорация угрожает существованию местного племени человекоподобных разумных существ — на’ви. Команда исследователей планеты использует аватары — генетически спроектированные тела, гибриды на’ви и людей…', 2009, 'США', 18, 'avatar.jpeg', 8.0,'https://www.film.ru/sites/default/files/trailers/1627918/Avatar-Trailer.mp4', '2022-05-29 14:15:00');
INSERT INTO films (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Белоснежка и охотник', 'snowwhite_hunter', 'Фильм снят по мотивам сказки братьев Гримм. В королевство Табор вторгается армия стеклянных солдат. Король Магнус разбивает врагов, освобождает прекрасную пленницу Равенну и женится на ней, но в первую же ночь Равенна убивает короля, открывает ворота замка перед врагом и захватывает власть над королевством. Она оказывается злой колдуньей, поддерживающей свою вечную юность высасыванием жизненных сил девушек…', 2012, 'США', 16, 'belo.jpeg', 8.0,'https://www.film.ru/sites/default/files/trailers/1629721/Snow-White-and-the-Huntsman-Trailer-rus.mp4', '2022-05-12 17:30:36');
INSERT INTO films (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Эверест', 'everest', 'В основе фильма лежат реальные события, произошедшие в Гималаях в мае 1996 года. Группа альпинистов-любителей, участников экспедиции «Консультанты по приключениям» под руководством профессионального гида Роба Холла и его помощников отправляется на покорение высочайшей вершины мира, но встречается с экспедицией «Горное безумие». Скопление людей и приближающаяся буря приводят к трагедии…', 2015, 'США, Великобритания', 18, 'everest.jpeg', 7.2,'https://www.film.ru/sites/default/files/trailers/3074966/Everest-Trailer-rus.mp4', '2022-05-29 14:30:36');
INSERT INTO films (title, route, description, release_year, country, agelimit, image, trailer, add_at)
VALUES ('Криминальное чтиво', 'kriminalnoe-chtivo', 'Знаменитая чёрная комедия Квентина Тарантино, ставшая шедевром благодаря присущей Тарантино нелинейности сюжета. Пример постмодернистского кино, настоящее культурное явление. История разделена на части, которые показаны зрителю в неправильном порядке. Бандиты Винсента Вега и Джулс Уинфилд должны забрать принадлежащий их боссу чемодан…', 1994, 'США', 18, 'crime.jpg', 'https://www.film.ru/sites/default/files/trailers/1612526/Pulp%20Fiction%20Trailer%20Rus.mp4', '2022-05-13 17:56:25');
INSERT INTO films (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Джеки', 'jackie', 'Жаклин Кеннеди, «Джеки» или Жаклин О, как ее еще называли современники, была первой леди США с 1961 по 1963 год. Одна из самых популярных женщин своего времени, законодательница моды, красоты и изящества в Америке и Западной Европе, героиня светской хроники. Фильм повествует о событиях, которые разворачивается в течение четырёх трагических ноябрьских дней после убийства президента Джона Кеннеди…', 2016, 'США', 18, 'jackie.jpg', 6.6, 'https://www.film.ru/sites/default/files/trailers/20169294/jackie.mp4', '2022-05-19 17:46:55');
INSERT INTO films (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Повелитель бури','hurtlocker','2004 год, идёт второй год войны в Ираке. Элитное подразделение сапёров армии США работает в охваченном партизанской войной Багдаде: каждый встречный – потенциальный враг, каждый предмет может быть замаскированной бомбой. При обезвреживании самодельного взрывного устройства гибнет сержант Томпсон. На замену ему прибывает опытный сапёр Уильям Джеймс. Отношения между Джеймсом и группой изначально не задаются…', 2008, 'США', 16, 'storm_lord.jpg', 7.5, 'https://www.film.ru/sites/default/files/trailers/1627638/The-Hurt-Locker-Trailer.mp4', '2022-05-13 17:56:25');

INSERT INTO videos (title, route, description, release_year, country, agelimit, image, rating, trailer)
VALUES ('Как Уилл Смит пришел к Оскару', 'how_will_smith_came_to_oscar', 'С чего Уилл Смит начинал карьеру в шоу-бизнесе? Как он справлялся с провалами? Почему Смит не просто суперзвезда Голливуда, но и важная фигура в общественной жизни США? И какие культовые роли он мог сыграть, но отказался?', 2022, 'США', 6, 'smit.jpg', 5.5, 'https://www.film.ru/sites/default/files/trailers/4221101/A-Mans-Story-Trailer.mp4');
INSERT INTO videos (title, route, description, release_year, country, agelimit, image, trailer)
VALUES ('Рецензия на фильм «Прожигатели жизни»','review_prozhigateli','Милейшее кино без всяких закидонов, не «ах», но и не «на любителя», «Прожигатели жизни» (2006) напрасно названы кинокомедией. Одна из старейшин нашего цеха Ирина Михайловна Шилова до сих пор утверждает, что единственным преимуществом советского кино был жанр, которого больше не было нигде — «киноповесть». И в этом плане Майк Байндер - вполне советский режиссер. Присутствие звезд, отсутствие спецэффектов, нормальные диалоги, ровный нескучный ритм и как бы мерцающую в каждом кадре иронию над Америкой он действительно свел к вполне законченному жанру.<br/>Киноповести не получилось бы у Спилберга, поначалу запавшего на байндеровский сценарий. Был бы очередной плакатный «Терминал» (2004) с «эффектной» слезливостью, и ничего смешного. Но, хотя Том Хэнкс – актер получше Бена Эффлека, об которого только ленивый еще не вытер ноги, он в этом недорогом кино ничего для себя не открыл бы. А столь дорогостоящий Эффлек открыл, что хотя бы способен вписываться в ансамбль.', 2006, NULL, 16, 'review_prozhigateli.jpg', 'https://www.film.ru/sites/default/files/trailers/1611653/Man-About-Town.mp4');

INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Киану Ривз', 'keanu_reeves', 'a_keanu_reeves.webp', '1964-09-02', 'Бейрут, Ливан', 'Полное имя — Киану Чарльз Ривз (Keanu Charles Reeves). По-гавайски имя Keanu означает «прохладный ветер над горами». Отец Киану — Сэмуэль Ноулин Ривз — наполовину гаваец, наполовину китаец, а мать — Патрисия Тэйлор — англичанка. Киану — левша. У Киану никогда не было собственного компьютера. Если ему приходится все же общаться с компьютером — он играет в шахматы. Киану не раз утверждал, что его больше интересуют отношения человека и компьютера, нежели сам компьютер как таковой. Киану боится иметь детей, потому что этот мир его часто пугает. Однако он считает, что способен влюбиться до такой степени, когда уже станет все равно, что тебя ждет впереди.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Кэрри-Энн Мосс', 'carrie-anne_moss', 'a_carrie-anne_moss.webp', '1967-08-21', 'Ванкувер, Британская Колумбия, Канада', 'По семейной легенде, она получила свое имя в честь песни группы «Hollies» «Carrie Anne», которая была большим хитом в год ее рождения. Перед тем как стать актрисой, Мосс несколько лет работала официанткой, а потом — моделью. У Кэрри-Энн Мосс есть трое детей от брака со Стивеном Ройем, два сына и дочь — Оуэн Рой (род. в сентябре 2003), Джейден Рой (род. в ноябре 2005) и Фрэнсис Беатрис Рой (род. в июне 2009).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Лана Вачовски', 'lana_wachowski', 'a_lana_wachowski.webp', '1965-06-21', 'Чикаго, Иллинойс, США', 'Трансгендерная женщина. Имя при рождении — Лоуренс Вачовски (Laurence Wachowski). Ещё 20 октября 2012 года Лоуренс Вачовски получил награду «За смелость» от американской организации Human Rights Campaign (HRC), которые занимаются защитой прав представителей сексуальных меньшинств и трансгендеров.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Лилли Вачовски', 'lilly_wachowski', 'a_lilly_wachowski.webp', '1967-12-29', 'Чикаго, Иллинойс, США', 'Трансгендерная женщина. Имя при рождении — Эндрю Пол Вачовски (Andrew Paul Wachowski).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Хьюго Уивинг', 'hugo_weaving', 'a_hugo_weaving.webp', '1960-04-04', 'Ибадан, Нигерия', 'Полное имя — Хьюго Уоллес Уивинг. Высшее образование получал в Национальном Институте Драматического Искусства Австралии. Закончил его в 1981 году. Пока Хьюго учился в институте, некоторое время он подрабатывал в порту, перетаскивая мешки с кофе.');

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