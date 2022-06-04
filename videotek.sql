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
    add_at TEXT,
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
    release_year INTEGER,
    last_year INTEGER,
    add_at TEXT
);

DROP TABLE IF EXISTS episodes;
CREATE TABLE episodes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    ep INTEGER NOT NULL,
    season INTEGER NOT NULL,
    serial_route INTEGER NOT NULL,
    video TEXT
);

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
    id INTEGER PRIMARY KEY,
    genre TEXT NOT NULL
);

DROP TABLE IF EXISTS film_genre;
CREATE TABLE film_genre (
    route TEXT NOT NULL,
    genre_id INTEGER NOT NULL
);

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
    film_route TEXT NOT NULL,
    person_route TEXT NOT NULL
);

DROP TABLE IF EXISTS film_actor;
CREATE TABLE film_actor (
    film_route TEXT NOT NULL,
    person_route TEXT NOT NULL
);

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
VALUES ('Матрица: Воскрешение', 'matrix-reborn', 'Четвёртый фильм про Матрицу. Начало картины отсылает к вступительной сцене первого фильма: агенты гонятся за молодой Тринити, но… что-то идёт не так, и Тринити задерживают. Томас Андерсон — всемирно известный геймдизайнер, проживающий в Сан-Франциско. В своё время он руководил разработкой трилогии видеоигр «Матрица». Ныне его фирма Deus Machina приобретена корпорацией Warner Bros. Новые владельцы распоряжаются перезапустить проект и выпустить продолжение. Томас неохотно включается в работу, его мучают видения и кошмары, словно бы мир, в котором он живёт, нереален. Он посещает психоаналитика, который выписывает ему некие синие пилюли. В любимой кофейне Simulatte Томас встречает Тиффани, которая в итоге рассказывает Андерсону, что он находится в виртуальном мире, созданном искусственным интеллектом, в Матрице, и что его зовут Нео. Со времени последней версии Матрицы, той где Нео спас жителей Зиона, прошло 60 лет…', 2021, 'США', 16, 'matrix_resurrection.jpg', 9.0,'https://www.film.ru/sites/default/files/trailers/47996050/The_Matrix_Resurrections_-_The_Game_Awards_Clip_0.mp4', '2022-05-29 11:46:00');
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

INSERT INTO videos (title, route, description, release_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Как Уилл Смит пришел к Оскару', 'how_will_smith_came_to_oscar', 'С чего Уилл Смит начинал карьеру в шоу-бизнесе? Как он справлялся с провалами? Почему Смит не просто суперзвезда Голливуда, но и важная фигура в общественной жизни США? И какие культовые роли он мог сыграть, но отказался?', 2022, 'США', 6, 'smit.jpg', 5.5, 'https://www.film.ru/sites/default/files/trailers/4221101/A-Mans-Story-Trailer.mp4', '2022-05-12 17:30:36');
INSERT INTO videos (title, route, description, release_year, country, agelimit, image, trailer, add_at)
VALUES ('Рецензия на фильм «Прожигатели жизни»','review_prozhigateli','Милейшее кино без всяких закидонов, не «ах», но и не «на любителя», «Прожигатели жизни» (2006) напрасно названы кинокомедией. Одна из старейшин нашего цеха Ирина Михайловна Шилова до сих пор утверждает, что единственным преимуществом советского кино был жанр, которого больше не было нигде — «киноповесть». И в этом плане Майк Байндер - вполне советский режиссер. Присутствие звезд, отсутствие спецэффектов, нормальные диалоги, ровный нескучный ритм и как бы мерцающую в каждом кадре иронию над Америкой он действительно свел к вполне законченному жанру.<br/>Киноповести не получилось бы у Спилберга, поначалу запавшего на байндеровский сценарий. Был бы очередной плакатный «Терминал» (2004) с «эффектной» слезливостью, и ничего смешного. Но, хотя Том Хэнкс – актер получше Бена Эффлека, об которого только ленивый еще не вытер ноги, он в этом недорогом кино ничего для себя не открыл бы. А столь дорогостоящий Эффлек открыл, что хотя бы способен вписываться в ансамбль.', 2006, NULL, 16, 'review_prozhigateli.jpg', 'https://www.film.ru/sites/default/files/trailers/1611653/Man-About-Town.mp4', '2022-05-12 11:30:30');

INSERT INTO serials (title, route, description, release_year, last_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Игра престолов','game_of_thrones','Действие «Игры престолов», основанный на цикле романов «Песнь льда и огня» Джорджа Р. Р. Мартина, происходит в вымышленном мире, напоминающем средневековую Европу. В самом масштабном и обсуждаемом телесериале 2010-х одновременно развиваются три основные истории: борьба нескольких влиятельных домов за Железный Трон Семи Королевств либо за независимость от него; история потомка свергнутой династии правителей, принцессы-изгнанницы, планирующей вернуть престол; сага о древнем братстве, охраняющем государство от угроз с севера. В сериале поднимаются вопросы насилия и гражданской войны, положения женщин и сексуальных меньшинств в обществе, роли Церкви и семьи в системе социальных отношений…', 2011, 2019, 'США, Великобритания', 18, 'got.jpg', 9.0, 'https://www.film.ru/sites/default/files/trailers/1631897/trailer.mp4', '2022-06-04 08:30:00');
INSERT INTO serials (title, route, description, release_year, last_year, country, agelimit, image, rating, trailer, add_at)
VALUES ('Доктор Хаус','doctor_house', 'Сериал повествует о выдающемся враче-диагносте Грегори Хаусе и его команде, являясь одним из самых популярных произведений в жанре медицинский детектив. Главный герой замкнут, резок и циничен, при этом склонен к бунтарству и не обременяет себя соблюдением правил хорошего тона. Любимое утверждение доктора — «Все лгут». Однако, такого доктора не проведёшь…', 2004, 2012, 'США', 16, 'doctor_house.webp', 7.3, 'https://www.film.ru/sites/default/files/trailers/1627265/House-M-D-Trailer.mp4', '2022-06-04 08:40:00');

INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Киану Ривз', 'keanu_reeves', 'a_keanu_reeves.webp', '1964-09-02', 'Бейрут, Ливан', 'Полное имя — Киану Чарльз Ривз (Keanu Charles Reeves). По-гавайски имя Keanu означает «прохладный ветер над горами». Отец Киану — Сэмуэль Ноулин Ривз — наполовину гаваец, наполовину китаец, а мать — Патрисия Тэйлор — англичанка. Киану — левша. У Киану никогда не было собственного компьютера. Если ему приходится все же общаться с компьютером — он играет в шахматы. Киану не раз утверждал, что его больше интересуют отношения человека и компьютера, нежели сам компьютер как таковой. Киану боится иметь детей, потому что этот мир его часто пугает. Однако он считает, что способен влюбиться до такой степени, когда уже станет все равно, что тебя ждет впереди.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Лоренс Фишбёрн','laurence_fishburne','a_laurence_fishburne.webp','1961-07-30','Огаста, Джорджия, США','Полное имя — Лоренс Фишбёрн III (Laurence J. Fishburne III). Лоренс — левша.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Кэрри-Энн Мосс', 'carrie-anne_moss', 'a_carrie-anne_moss.webp', '1967-08-21', 'Ванкувер, Британская Колумбия, Канада', 'По семейной легенде, она получила свое имя в честь песни группы «Hollies» «Carrie Anne», которая была большим хитом в год ее рождения. Перед тем как стать актрисой, Мосс несколько лет работала официанткой, а потом — моделью. У Кэрри-Энн Мосс есть трое детей от брака со Стивеном Ройем, два сына и дочь — Оуэн Рой (род. в сентябре 2003), Джейден Рой (род. в ноябре 2005) и Фрэнсис Беатрис Рой (род. в июне 2009).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Хьюго Уивинг', 'hugo_weaving', 'a_hugo_weaving.webp', '1960-04-04', 'Ибадан, Нигерия', 'Полное имя — Хьюго Уоллес Уивинг. Высшее образование получал в Национальном Институте Драматического Искусства Австралии. Закончил его в 1981 году. Пока Хьюго учился в институте, некоторое время он подрабатывал в порту, перетаскивая мешки с кофе.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Глория Фостер', 'gloria_foster', 'a_gloria_foster.webp', '1933-11-15','Чикаго, Иллинойс, США','В 1988 году получила премию «Золотая малина» в номинации «Худшая женская роль второго плана» за фильм «Леонард шестой».');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джо Пантольяно','joe_pantoliano','a_joe_pantoliano.webp','1951-09-12','Хобокен, Нью-Джерси, США','В 2003 году получил премию \"Эмми\" в номинации: лучшая мужская роль второго плана в драматическом сериале («Сопрано»).');
INSERT INTO persona (name, route, image, birthday, birthplace)
VALUES ('Маркус Чонг', 'marcus_chong', 'a_marcus_chong.webp','1967-07-08','Сиэтл, Вашингтон, США');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Тоби Магуайр','tobey_maguire','a_tobey_maguire.webp','1975-06-27','Санта-Моника, Колифорния, США','Полное имя — Тобиас Винсент Магуайр (Tobias Vincent Maguire). Его родители, Винсент и Венди, были не женаты и очень молоды, им было соответственно 20 и 18 лет. Отец Тоби работал поваром и строителем, мать была секретарем. Спустя два года они поженились, но в том же 1977 году разошлись. После развода Тоби с матерью жили на небольшую зарплату Венди и социальное пособие. Жизнь его отца сложилась не лучшим образом — в 1993 году он ограбил банк и на два года отправился в тюрьму. Тоби Магуайр хотел стать поваром, но по настоянию матери записался на курсы драматического искусства.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Уиллем Дефо','willem_dafoe','a_willem_dafoe.webp','1955-07-22','Эпплтон, Висконсин, США','Седьмой ребенок в семье с восемью детьми, лишь он один решил избрать артистическую стезю — остальные стали адвокатами или медиками. Недолго изучал драматическое искусство в университете Милуоки (University of Wisconsin-Milwaukee). У Уиллема есть сын, рожденный от театрального режиссера Элизабет ЛеКомпт, с которой Дефо прожил 27 лет, не состоя в браке.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Кирстен Данст','kirsten_dunst','a_kirsten_dunst.webp','1982-04-30','Пойнт-Плезант, Нью-Джерси, США','Полное имя — Кирстен Кэролайн Данст (Kirsten Caroline Dunst). Отец Кирстен, Клаус Данст, был служащим в медицинской компании. Инез Данст, её мать, была художницей, а также создателем и владельцем художественной галереи. До девяти лет Кирстен вместе со своей семьей жила в Пойнт Плезант. После развода родителей Кирстен с матерью и братом переехали в Южную Калифорнию. В жилах Кирстен течет шведская и немецкая кровь.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джеймс Франко','james_franco','a_james_franco.webp','1978-04-19','Пало-Альто, Калифорния, США','Полное имя — Джеймс Эдвард Франко (James Edward Franco). Отец Джеймса — наполовину португалец, наполовину швед. Мать — из еврейской семьи, проживавшей в России, Германии, Польше и Литве. В интервью Терри Гроссу Джеймс рассказал, что в старших классах был арестован за мелкое воровство: они с друзьями воровали в магазине одеколон и продавали его в школе. В 2008 году Франко получил степень бакалавра по английскому языку в Калифорнийском университете в Лос-Анджелесе. Дипломную работу писал под руководством писательницы Моны Симпсон.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Клифф Робертсон','cliff_robertson','a_cliff_robertson.webp','1923-09-09','Ла Хойя, Калифорния, США','В 1969 году получил премию \"Оскар\" в номинации: лучшая мужская роль («Чарли»)');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Розмари Харрис','rosemary_harris','a_rosemary_harris.webp','1927-09-19','Ашби, Саффолк, Англия, Великобритания','У Розмари Харрис есть дочь от второго брака с Джоном Элем — Дженнифер Энн Эль (29.12.69).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Дж.К. Симмонс','j_k_simmons','a_simmons.webp','1955-01-09','Детройт, Мичиган, США','Полное имя — Джонатан Кимбл Симмонс (Jonathan Kimble Simmons). Симмонс родился в 1955 году в семье администратора Патрисии Кимбл и преподавателя колледжа Дональда Симмонса, кроме него у супругов было ещё двое детей.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Дэниэл Рэдклифф','daniel_radcliffe','a_deniel.webp','1989-07-23','Фулхэм, Лондон, Англия, Великобритания','Полное имя — Дэниэл Джейкоб Рэдклифф. Его родители — литературный агент Алан Рэдклифф и работающая на телевидении директор по кастингу Марсия Грэшем. Страдает редким нарушением функций мозга — диспраксией. Из-за этой болезни актер не может самостоятельно завязывать шнурки. Диспраксия — неизлечимое хроническое заболевание, характеризующееся неспособностью к правильному выполнению целенаправленных движений. Болезнь может влиять на любые области развития человека: физическую, интеллектуальную или языковую.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Руперт Гринт','rupert_grint','a_rupert_grint.webp','1988-08-24','Стивенэйдж, Хардфордшир, Англия, Великобритания','Полное имя — Руперт Александер Ллойд Гринт. Руперт — самый старший из 5 детей в семье. У него есть младший брат Джеймс и три младших сестры: Джорджия, Саманта, Шарлота. Родители Руперта — Джо и Найджел Гринт. В данный момент в разводе. Свой интерес к актерскому мастерству Руперт начал проявлять еще в детстве, играя в школьных театральных постановках и в любительском театре. В возрасте 16 лет бросил школу, чтобы сосредоточиться на своей актёрской карьере.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Эмма Уотсон','emma_watson','a_emma_watson.webp','1990-04-15','Париж, Франция','Полное имя — Эмма Шарлотта Дьюерре Уотсон (Emma Charlotte Duerre Watson). Родилась в семье английских адвокатов. Ее мать родом из Франции, а отец — англичанин. Эмма родилась в Париже, где жила до пяти лет. Затем переехала с мамой в Оксфорд. Самая юная в истории героиня обложки журнала Vogue. На съемочной площадке получила прозвище «Уотсон – один дубль», так как обычно делает свою сцену за один дубль. В 2009 году была занесена в Книгу рекордов Гиннеса как самая высокооплачиваемая актриса десятилетия.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Дэвид Тьюлис','david_thewlis','a_david_thewlis.webp','1963-03-20','Блэкпул, Ланкашир, Англия, Великобритания','Настоящее имя — David Wheeler. Актерскому мастерству он учился в Гилдхольской Школе Музыки и Драмы (Guildhall School of Music and Drama, The Baricon) в Лондоне и окончил её в 1984-ом. Как и большинство британских актёров, он приобрёл опыт сценической работы, играя в театре, в основном – в областных театрах Лондона.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Робби Колтрейн','robbie_coltrane','a_robbie_coltrane.webp','1950-03-30','Гутерглен, Южный Ланаркшир, Шотландия, Великобритания','Настоящее имя — Энтони Роберт МакМиллан (Anthony Robert McMillan). На роль Хагрида Робби Колтрейна выбрала лично автор книг про Гарри Поттера, Дж. К. Роулинг. Свой псевдоним Колтрейн взял в честь джазового саксофониста Джона Колтрейна.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Гари Олдман','gary_oldman','a_gary_oldman.webp','1958-03-21','Лондон, Англия, Великобритания','Полное имя — Гари Леонард Олдман (Gary Leonard Oldman). В 14 лет вступил в труппу гринвичского Молодежного театра, в 16 ушел из школы, чтобы работать продавцом спортивного снаряжения. В 1975 году, вдохновленный игрой Малкольма МакДауэлла в «Бешеная луна» (1971), Гари Олдман пытался поступить в престижную Королевскую академию драматического искусства, но его не приняли, намекнув, что лучше ему подобрать другую профессию. Но Олдман отправился в Кент, где добился стипендии в колледже сценической речи и драмы Роуз Бруфорд, который и закончил с отличием в 1979 году.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Майкл Гэмбон','michael_gambon','a_michael_gambon.webp','1940-10-19','Дублин, Ирландия','Полное имя — Майкл Джон Гэмбон. В 2007 году у Майкла Гэмбона родился сын Майкл от подруги Филиппы. 23 июня 2009 года Майкл снова стал отцом. Его подруга Филиппа, которая на 25 лет моложе, родила мальчика.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Сэм Уортингтон','sam_worthington','a_sam_worthington.webp','1976-08-02','Годалминг, Суррей, Англия, Великобритания','Окончил Национальный институт драматического искусства (НИДА), расположенный в Австралии, г. Сидней. Сэм Уортингтон — левша. До того как стать актером, Сэм работал каменщиком.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Зои Салдана','zoe_saldana','a_zoi.jpg','1978-06-19','Пассаик, Нью-Джерси, США','Настоящее имя — Зоё Ядира Салданья Назарио (Zoë Yadira Zaldaña Nazario). Зои — левша. Зои родилась в семье доминиканских эмигрантов. В мае 2018 получила звезду на Голливудской «Аллее славы».');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Сигурни Уивер','sigourney_weaver','a_sigourney_weaver.webp','1949-10-08','Манхэттен, Нью-Йорк, США','Настоящее имя — Сьюзан Александра Уивер. Отец актрисы занимал высокий пост на канале «NBC». По семейной легенде, сменила имя в честь одной из героинь романа Френсиса Скотта Фитцжеральда «Великий Гэтсби». Будущая звезда вымахала до 180 см ростом, еще учась в школе! Параметры ее фигуры: 87-61-89. У звезды жуткая фобия на лифты и эскалаторы. Уивер в совершенстве изъясняется на испанском и французском языках. Актриса счастлива в своем единственном за жизнь браке с Джимом Симпсоном (с 1984 года). У супругов есть дочь Шарлотта, 1990 года рождения.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Стивен Лэнг','stephen_lang','a_stephen_lang.webp','1952-07-11','Нью-Йорк, США','Стивен имеет немецкие и ирландские корни по матери, а его бабушка и дедушка по отцовской линии были еврейскими эмигрантами из Венгрии и России.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Мишель Родригес','michelle_rodriguez','a_michelle_rodriguez.webp','1978-07-12','Сан-Антонио, Техас, США','Полное имя — Майте Мишель Родригес (Mayte Michelle Rodriguez). Отец — пуэрториканец Рафаэль Родригес, мать — Кармен Милади Пэйред, уроженка Доминиканской Республики. Родители развелись, когда Мишель было 8 лет. В 2002 году Мишель Родригес предстала перед судом по обвинению в избиении своей соседки по квартире. Мишель одно время работала в магазине игрушек, но вскоре была уволена за то, что все время играла с детьми. Была приговорена к 48 часам тюрьмы и общественным работам за нарушения дорожных правил в июне 2004 года. В октябре 2013 года в интервью журналу Entertainment Weekly Мишель объявила о своей бисексуальности. Заняла 34 место в списке «100 самых горячих девушек» по версии журнала «Maxim» в 2002 году. Играет на пианино. У Мишель есть два старших брата-близнеца Рауль и Омар.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джованни Рибизи','giovanni_ribisi','a_giovanni_ribisi.webp','1974-12-17','Лос-Анджелес, Калифорния, США','Полное имя — Антонино Джованни Рибизи. Джованни — итальянец по происхождению. У Джованни есть сестра-близнец Марисса.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джоэль Мур','joel_moore','a_joel_moore.webp','1977-09-25','Портленд, Орегон, США','Полное имя — Джоэль Дэвид Мур (Joel David Moore).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Питер Динклэйдж','peter_dinklage','a_peter_dinklage.webp','1969-06-11','Морристаун, Нью-Джерси, США','Динклэйдж родился с наследственным заболеванием — ахондроплазией, приводящей к карликовости. Оба его родителя среднего роста, так же как и его брат Джонатан.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Лина Хиди','lena_headey','a_lena_headey.webp','1973-10-03','Бермуды, Великобритания','19 мая 2007 года Лина вышла замуж за музыканта Питера Пола Лаурена (Peter Paul Loughran). В этом браке 31 марта 2010 года Хиди родила своего первенца — сына Уайли Эллиота Лаурена (Wylie Elliot Loughran). В 2012 году супруги расстались, а годом позже оформили развод официально. Лина Хиди — вегетарианка. Имеет ирландское происхождение. В 1994 году на съёмках фильма «Книга джунглей» Лина познакомилась с актёром Джейсоном Флемингом и встречалась с ним девять лет. Она даже сделала себе татуировку «Jason» на руке на тайском языке. 10 июля 2015 года Лина родила дочь от своего бойфренда Дэна Кадана.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Эмилия Кларк','emilia-clarke','a_emilia_clarke.webp','1986-10-23','Лондон, Англия, Великобритания','Обучалась актерскому искусству в Drama Centre London, который закончила в 2009 году. Весной 2013 года Эмилии был поставлен диагноз — аневризма сосудов головного мозга. Актриса прошла курс лечения в New York Presbyterian/Weill Cornell Medical Center. На съемках фильма «До встречи с тобой» Эмилия сломала бедро. В ее честь назван морской слизень. Говорит на французском, немецком и хинди.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Кит Харингтон','kit_harington','a_kit_harington.webp','1986-12-26','Лондон, Англия, Великобритания','Полное имя — Кристофер Кейтсби Харингтон (Christopher Catesby Harington). Окончил Центральную школу сценической речи и драматического искусства в Лондоне. Дядя Кита по отцу — сэр Николас Джон Харингтон, 14-й баронет Харингтон. 23 июня 2018 года вступил в брак с актрисой Роуз Лесли. Пара познакомилась на съёмках сериала «Игра престолов». Кит подвержен фобиям. Минимум четыре явления вызывают у актёра панический ужас: пауки, общественный транспорт, уколы, перелёты на самолёте.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Софи Тёрнер','sophie_turner','a_sophie_turner.webp','1996-02-21','Нортгемптон, Нортгемптоншир, Англия, Великобритания','Софи — астматик, и у нее аллергия на лошадей. Долгое время занималась балетом, однако ей пришлось забросить свое увлечение ради развития актерской карьеры. Полное имя — Софи Белинда Тернер (Sophie Belinda Turner).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Мэйси Уильямс','maisie_williams','a_maisie_williams.webp','1997-04-15','Бристоль, Англия, Великобритания','Полное имя — Маргарет Констанс Уильямс (Margaret Constance Williams).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Николай Костер-Вальдау','nikolaj_coster-waldau','a_nik_coster-waldau.webp','1970-07-27','Рудкобинг, Дания','У Николая Костер-Вальдау и его жены Нукаки две дочери — Саффина и Филиппа. Хотя устоявшимся вариантом произношения фамилии актера является «Костер-Вальдау», правильный вариант — «Ko-ster Wall-dow» (Ко-стер Уолл-дау). В 1989-1993 годах обучался в Национальной театральной школе в Копенгагене. В театре дебютировал в роли Лаэрта в постановке трагедии Шекспира «Гамлет».');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Иэн Глен','iain_glen','a_iain_glen.webp','1961-06-24','Эдинбург, Шотландия, Великобритания','В разные годы вместе с другими актерами сериала получил 7 премий Гильдии актеров в номинации: лучший актерский состав драматического сериала («Игра престолов»).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Алфи Аллен','alfie_allen','a_alfie_allen.webp','1986-09-12','Хаммерсмит, Лондон, Англия, Великобритания','Алфи — сын английского актёра Кита Аллена и родной брат певицы Лили Аллен.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джон Брэдли','john_bradley','a_john_bradley.webp','1988-09-15','Англия, Великобритания','В разные годы вместе с другими актерами сериала получил 5 премий Гильдии актеров в номинации: лучший актерский состав драматического сериала («Игра престолов»).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джек Глисон','jack_gleeson','a_jack_gleeson.webp','1992-05-20','Корк, Ирландия','В разные годы вместе с другими актерами сериала получил 2 премии Гильдии актеров в номинации: лучший актерский состав драматического сериала («Игра престолов»). Также получил премию Сатурн в номинации: лучший молодой актер/актриса в телесериале («Игра престолов»)');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Натали Эммануэль','nathalie_emmanuel','a_nathalie_emmanuel.webp','1989-03-02','Саутенд-он-Си, Эссекс, Англия, Великобритания','Отец Натали Эммануэль наполовину сент-люсиец, наполовину англичанин, а мать — доминиканка. Полное имя — Натали Джоанн Эммануэль (Nathalie Joanne Emmanuel). Натали является веганом. Она посещала Школу Святой Хильды (St Hildas School) в Уэстклиффе-он-Си с трёх до одиннадцати лет, а с двенадцати лет училась в Старшей школе Уэстклиффа для девочек (Westcliff High School).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Кристен Стюарт','kristen_stewart','a_kristen_stewart.webp','1990-04-09','Лос-Анджелес, Калифорния, США','Полное имя — Кристен Джеймс Стюарт (Kristen Jaymes Stewart). Отец Кристен, Джон Стюарт, работал ассистентом режиссера, продюсером и директором многочисленных шоу на канале «Fox». Кристен Стюарт — первая актриса в истории страны, удостоенная французской премии «Сезар» (за роль второго плана в драме «Зильс-Мария», 2014).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Крис Хемсворт','chris_hemsworth','a_chris_hemsworth.webp','1983-08-11','Мельбурн, Виктория, Австралия','11 мая 2012 года у Криса Хемсворта и его жены Эльзы Патаки родилась дочь. Девочку зовут Индия Роуз Хемсворт (India Rose Hemsworth). 18 марта 2014 года у Криса и Эльзы родились двойняшки.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Шарлиз Терон','charlize_theron','a_charlize_theron.webp','1975-08-07','Бенони, Южная Африка','По материнской линии актриса имеет немецкие, а по отцовской — французские и голландские корни. Когда актрисе было 15 лет, её мать застрелила отца. Суд оправдал Герду Терон, прийдя к выводу, что это была самооборона. Сама актриса долго скрывала этот факт. Ради участия в фильме «Сладкий ноябрь» (2001), Шарлиз отказалась от главной роли в «Перл Харборе» (2001).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Сэм Клафлин','sam_claflin','a_sam_claflin.webp','1986-06-27','Ипсвич, Саффолк, Англия, Великобритания','Сэм окончил среднюю школу Costessey High School в Костесси (Норфолк), старшую школу City College Norwich в Норидже (Норфолк) и в 2009 году Лондонскую академию музыкального и драматического искусства в Лондоне, получив актерское образование.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Иэн МакШейн','ian_mcShane','a_ian_mc-shane.webp','1942-09-29','Блэкберн, Ланкашир, Англия, Великобритания','В 2005 году американский журнал People назвал его «самым сексапильным телезлодеем».');
INSERT INTO persona (name, route, image, birthday, birthplace)
VALUES ('Сэм Спруэлл','sam_spruell','a_sam_spruell.webp','1977-01-01','Лондон, Великобритания');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Боб Хоскинс','bob_hoskins','a_bob_hoskins.webp','1942-10-26','Бэри Санкт Эдмундс, Саффолк, Англия, Великобритания','В детстве страдал дислексией. Окончил Центральную школу речи и драмы в Лондоне.');
INSERT INTO persona (name, route, image, birthday, birthplace)
VALUES ('Джейсон Кларк','jason_clarke','a_jason_clarke.webp','1969-07-17','Уинтон, Квинсленд, Австралия');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джош Бролин','josh_brolin','a_josh_brolin.webp','1968-02-12','Лос-Анджелес, Калифорния, США','Настоящее имя — Джош Брудерлин (Josh Bruderlin). Джош Бролин — сын актёра Джеймса Бролина и пасынок Барбры Стрейзанд.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джейк Джилленхол','jake_gyllenhaal','a_jake_gyllenhaal.webp','1980-12-19','Лос-Анджелес, Калифорния, США','Джейк родился в семье известного режиссера Стивена Джилленхола и сценариста Наоми Фонер. Его сестра Мэгги Джилленхол также известная актриса. У Джейка шведские и русско-еврейские корни.');
INSERT INTO persona (name, route, image, birthday, birthplace)
VALUES ('Джон Хоукс','john_hawkes','a_john_hawkes.webp','1959-09-11','Алегзандрия, Миннесота, США');
INSERT INTO persona (name, route, image, birthday, birthplace)
VALUES ('Майкл Келли','michael_kelly','a_michael_kelly.webp','1969-05-22','Филадельфия, Пенсильвания, США');
INSERT INTO persona (name, route, image, birthday, birthplace)
VALUES ('Ингвар Эггерт Сигюрдссон','ingvar_sigurdsson','a_ingvar_sigurdsson.webp','1963-11-22','Рейкьявик, Исландия');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Кира Найтли','keira_knightley','a_keira_knightley.webp','1985-03-26','Теддингтон, Мидлсекс, Англия, Великобритания','Полное имя — Кира Кристина Найтли. Кира Найтли в юности страдала дислексией. Бабушка и прабабушка Киры страдали анорексией. Тем не менее, актриса настаивает, что ее худоба абсолютно естественного происхождения. Кира родилась в результате пари. Суть пари состояла в следующем: если Шерман, мать актрисы, к тому времени оставившая карьеру артистки и решившая заняться драматургией, продаст свою первую пьесу, то в семействе Найтли появится второй ребенок.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Уилл Смит','will_smith','a_will_smith.webp','1968-09-25','Филадельфия, Пенсильвания, США','В детстве Уилл заработал себе прозвище «Принц» своей способностью выбираться из любых неприятностей при помощи хорошо подвешенного языка и своего обаяния. Еще со школьной скамьи Уилл увлекался рэпом, и это увлечение плавно приобрело формы профессиональной деятельности, когда Уилл вместе со своим другом — рэппером Джеффом Таунсом организовали рэп-дуэт и стали выступать под псевдонимами DJ Jazzy Jeff and The Fresh Prince. Свободно говорит по-испански. По опросу журнала Peоple в 1998 году Уилл Смит был признан одним из пятидесяти самых красивых людей мира.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Хью Лори','hugh_laurie','a_hugh_laurie.webp','1959-06-11','Оксфорд, Англия, Великобритания','Родители Хью Лори — шотландцы. У Хью есть две сестры и брат Чарлз, который работает адвокатом/фермером в Шотландии.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Роберт Шон Леонард','robert_sean_leonard','a_robert_sean_leonard.webp','1969-02-28','Вествуд, Нью-Джерси, США','Актёр играет на сцене с 12 лет. Роберт — левша. Роберт был первым актёром, которого утвердили на роль в сериале «Доктор Хаус».');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Лиза Эдельштейн','lisa_edelstein','a_lisa_edelstein.webp','1966-05-21','Бостон, Массачусетс, США','Лиза — вегетарианка, также она занимается йогой. В свободное время пишет, сочиняет музыку и рисует. Лиза — левша.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Омар Эппс','omar_epps','a_omar_epps.webp','1973-07-20','Бруклин, Нью-Йорк, США','С детства дружит с актером Марлоном Уайансом. Омар — левша.');

INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Лана Вачовски', 'lana_wachowski', 'a_lana_wachowski.webp', '1965-06-21', 'Чикаго, Иллинойс, США', 'Трансгендерная женщина. Имя при рождении — Лоуренс Вачовски (Laurence Wachowski). Ещё 20 октября 2012 года Лоуренс Вачовски получил награду «За смелость» от американской организации Human Rights Campaign (HRC), которые занимаются защитой прав представителей сексуальных меньшинств и трансгендеров.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Сэм Рэйми','sam_raimi','a_sam_raimi.webp','1959-10-23','Ройал-Оак, Мичиган, США','Полное имя режиссера — Сэмюэл Маршалл Рэйми. Родился в консервативной еврейской семье выходцев из Венгрии и Российской Империи.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Альфонсо Куарон', 'alfonso_cuaron', 'a_alfons.jpeg', '1961-11-28','Мехико, Мексика','Куарон изучал философию и кинематографическое искусство в Национальном Университете Мехико. У Альфонсо есть сын Хонас, который также является сценаристом и режиссером.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джеймс Кэмерон','james_cameron','a_cameron.webp','1954-08-16','Капускасинг, Онтарио, Канада','Отец Джеймса был инженером-электриком, а мать — художницей. Джеймс был старшим из пяти детей. Кэмерон учился искусству кино у Роджера Кормана, нанявшего его в 1977 году для съемок спецэффектов и постановки декораций для своих фильмов. Первый режиссер в истории кинематографа, который получил бюджеты в 100 и 200 миллионов долларов для своих фильмов. Режиссер является членом Американского общества монтажеров. Кэмерону принадлежит компания Lightstorm Entertainment вместе с партнером Ларри Казаноффым, создателем и исполнительным директором студии Vestron. Режиссер впервые в истории кино использовал компьютерный спецэффект под названием morphing, который на короткое время появился в его картине «Бездна», но расцвел пышным цветом в фильме «Терминатор-2», где Роберт Патрик многократно плавно трансформируется в терминатора Т-1000. Кэмерон является первым режиссером, два фильма которого подряд зарабатывали в мировом прокате более 1,5 миллиарда долларов. Дизайн матки чужих сделал сам Джеймс Кэмерон. Он также подробно нарисовал голову и другие анатомические детали «королевы». Вместе с оператором Винсом Пэйсом разработал HD-видеосистему, которую они впоследствии использовали в «Призраках бездны» (2003). Кроме того, Кэмерон разработал стереокамеру нового поколения под названием «FUSION 3D».');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Дэвид Наттер','david_nutter','a_david_nutter.webp','1959-11-30','США','Учился в Университете Майами. В первую очередь Дэвид известен как режиссёр пилотных серий многочисленных сериалов. В частности, он снял пилотные эпизоды сериалов «Сверхъестественное», «Терминатор: Битва за будущее», «Город пришельцев», «Тёмный ангел» и ещё двенадцати проектов. В 2001 году снял эпизод «Пополнение» сериала «Братья по оружию» телеканала HBO. Также он принимал участие в создании таких сериалов, как «Бесстыдники», «Красавцы» и «Секретные материалы». К съёмочной группе телесериала «Игра престолов» Наттер примкнул во втором сезоне.');
INSERT INTO persona (name, route, image, birthday, birthplace)
VALUES ('Руперт Сандерс', 'rupert_sanders', 'a_rupert_sanders.webp', '1971-03-16', 'Вестминстер, Лондон, Англия, Великобритания');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Бальтасар Кормакур', 'baltasar_kormakur', 'a_baltasar_kormakur.webp', '1966-02-27', 'Рейкьявик, Исландия', 'Закончил Исландскую национальную академию изящных искусств. Его отец — испанский художник Бальтасар Сампер, переехавший в Исландию в 1963 году. Есть сын — актер Балтазар Бреки Балтазарссон.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Лилли Вачовски', 'lilly_wachowski', 'a_lilly_wachowski.webp', '1967-12-29', 'Чикаго, Иллинойс, США', 'Трансгендерная женщина. Имя при рождении — Эндрю Пол Вачовски (Andrew Paul Wachowski).');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Алан Тейлор', 'alan_taylor', 'a_alan_taylor.webp', '1965-01-13', 'США', 'В 2012 году получил Эмми в номинации: лучший драматический сериал («Игра престолов»)');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Алекс Грейвз','alex_graves','a_alex_graves.webp','1965-07-23','Канзас-Сити, Миссури, США','Его отец, Уильям Грейвз, был репортёром газеты «The Kansas City Star», а его мать, Александра «Сэнди» Грейвз, работала на сенатора Соединённых Штатов Нэнси Кассенбаум в Канзасе. Он поступил в Канзасский университет и Университет Южной Калифорнии, где получил степень бакалавра в кинопроизводстве. Грейвз известен тем, что снял 34 эпизода сериала-хита «Западное крыло». Он выиграл две прайм-тайм премии «Эмми» за создание этого сериала. Грейвз был нанят Стивеном Спилбергом, чтобы быть режиссёром и исполнительным продюсером пилотной серии приключенческого сериала «Terra Nova».');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Мигель Сапочник','miguel_sapochnik','a_miguel_sapochnik.webp','1974-07-01','Лондон, Англия, Великобритания','Наиболее известен как режиссёр полнометражного фильма «Потрошители» и телесериала HBO «Игра престолов», за который он выиграл премию «Эмми» за лучшую режиссуру драматического сериала на 68-й церемонии вручения премии.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Марк Майлод','mark_mylod','a_mark_mylod.webp','1956-01-01','Великобритания','Майлод был режиссёром нескольких телешоу США и Великобритании, большинство из них для BBC. Майлод также был сопродюсером сериала телеканала HBO «Красавцы», где он также выступал регулярным режиссёром.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Джереми Подесва','jeremy_podeswa','a_jeremy_podeswa.webp','1962-11-05','Торонто, Онтарио, Канада','Он известен как режиссёр фильмов «Пять чувств» (1999) и «Осколки» (2007). Он также работал режиссёром таких телесериалов «Клиент всегда мёртв», «Части тела», «Тюдоры», «Близкие друзья» и мини-сериала канала HBO о Второй мировой войне «Тихий океан». Он также написал сценарии к нескольким фильмам.');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Даниэль Минахан', 'daniel_minahan', 'a_daniel_minahan.webp', '1962-11-30', 'США', 'Минэхэн снял несколько эпизодов для телесериалов канала HBO, таких как «Клиент всегда мёртв», «Дедвуд», «Настоящая кровь», «Новости» и «Игра престолов», а также «Секс в другом городе» на Showtime и «Анатомия страсти» на ABC. Он также написал сценарий и снял по нему независимый фильм «Серия 7: Претенденты».');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Грег Яйтанс', 'greg_yaitanes', 'a_greg_yaitanes.webp', '1970-06-18', 'Уэллсли, Массачусетс, США', 'Он также снимал сериалы: «Побег», «Остаться в живых», «Банши».');
INSERT INTO persona (name, route, image, birthday, birthplace, biography)
VALUES ('Деран Сарафян', 'deran_sarafian', 'a_deran_sarafian.webp', '1958-01-17', 'Лос-Анджелес, Калифорния, США', 'Он снимал и другие сериалы, например «Ад на колесах».');

INSERT INTO genres (id, genre) VALUES (0, 'Все');
INSERT INTO genres (id, genre) VALUES (1, 'Фантастика');
INSERT INTO genres (id, genre) VALUES (2, 'Фэнтези');
INSERT INTO genres (id, genre) VALUES (3, 'Боевик');
INSERT INTO genres (id, genre) VALUES (4, 'Приключения');
INSERT INTO genres (id, genre) VALUES (5, 'Семейный');
INSERT INTO genres (id, genre) VALUES (6, 'Драма');
INSERT INTO genres (id, genre) VALUES (7, 'Мелодрама');
INSERT INTO genres (id, genre) VALUES (8, 'Триллер');
INSERT INTO genres (id, genre) VALUES (9, 'Биография');
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
INSERT INTO genres (id, genre) VALUES (25, 'Фильм-катастрофа');
INSERT INTO genres (id, genre) VALUES (26, 'Медицинский');

INSERT INTO film_genre (route, genre_id) VALUES ('matrix', 1);
INSERT INTO film_genre (route, genre_id) VALUES ('matrix', 3);
INSERT INTO film_genre (route, genre_id) VALUES ('matrix-reborn', 1);
INSERT INTO film_genre (route, genre_id) VALUES ('matrix-reborn', 3);
INSERT INTO film_genre (route, genre_id) VALUES ('spiderman', 1);
INSERT INTO film_genre (route, genre_id) VALUES ('spiderman', 3);
INSERT INTO film_genre (route, genre_id) VALUES ('spiderman', 6);
INSERT INTO film_genre (route, genre_id) VALUES ('spiderman', 20);
INSERT INTO film_genre (route, genre_id) VALUES ('hurrypotter_azkaban', 2);
INSERT INTO film_genre (route, genre_id) VALUES ('hurrypotter_azkaban', 4);
INSERT INTO film_genre (route, genre_id) VALUES ('avatar', 1);
INSERT INTO film_genre (route, genre_id) VALUES ('avatar', 3);
INSERT INTO film_genre (route, genre_id) VALUES ('avatar', 4);
INSERT INTO film_genre (route, genre_id) VALUES ('avatar', 6);
INSERT INTO film_genre (route, genre_id) VALUES ('snowwhite_hunter', 2);
INSERT INTO film_genre (route, genre_id) VALUES ('snowwhite_hunter', 3);
INSERT INTO film_genre (route, genre_id) VALUES ('snowwhite_hunter', 4);
INSERT INTO film_genre (route, genre_id) VALUES ('snowwhite_hunter', 6);
INSERT INTO film_genre (route, genre_id) VALUES ('everest', 6);
INSERT INTO film_genre (route, genre_id) VALUES ('everest', 8);
INSERT INTO film_genre (route, genre_id) VALUES ('everest', 25);
INSERT INTO film_genre (route, genre_id) VALUES ('kriminalnoe-chtivo', 10);
INSERT INTO film_genre (route, genre_id) VALUES ('kriminalnoe-chtivo', 18);
INSERT INTO film_genre (route, genre_id) VALUES ('jackie', 6);
INSERT INTO film_genre (route, genre_id) VALUES ('jackie', 9);
INSERT INTO film_genre (route, genre_id) VALUES ('hurtlocker', 6);
INSERT INTO film_genre (route, genre_id) VALUES ('hurtlocker', 14);
INSERT INTO film_genre (route, genre_id) VALUES ('game_of_thrones', 2);
INSERT INTO film_genre (route, genre_id) VALUES ('game_of_thrones', 6);
INSERT INTO film_genre (route, genre_id) VALUES ('game_of_thrones', 4);
INSERT INTO film_genre (route, genre_id) VALUES ('doctor_house', 6);
INSERT INTO film_genre (route, genre_id) VALUES ('doctor_house', 26);

INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 1, 1, 'Зима близко');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 1, 2, 'Королевский тракт');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 1, 3, 'Лорд Сноу');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 1, 4, 'Калеки, бастарды и сломанные вещи');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 1, 5, 'Волк и лев');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 1, 6, 'Золотая корона');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 1, 7, 'Ты побеждаешь или погибаешь');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 1, 8, 'Острый конец');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 1, 9, 'Бейелор');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 1, 10, 'Пламя и кровь');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 2, 1, 'Север помнит');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 2, 2, 'Ночные земли');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 2, 3, 'То, что мертво, умереть не может');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 2, 4, 'Сад костей');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 2, 5, 'Призрак Харренхола');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 2, 6, 'Боги старые и новые');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 2, 7, 'Человек без чести');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 2, 8, 'Принц Винтерфелла');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 2, 9, 'Черноводная');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 2, 10, 'Валар Моргулис');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 3, 1, 'Валар Дохаэрис');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 3, 2, 'Чёрные крылья, чёрные вести');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 3, 3, 'Стезя страданий');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 3, 4, 'Теперь его дозор окончен');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 3, 5, 'Поцелованная огнём');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 3, 6, 'Подъём');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 3, 7, 'Медведь и прекрасная дева');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 3, 8, 'Младшие Сыны');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 3, 9, 'Рейны из Кастамере');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 3, 10, 'Миса');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 4, 1, 'Два меча');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 4, 2, 'Лев и Роза');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 4, 3, 'Разрушительница оков');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 4, 4, 'Верный клятве');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 4, 5, 'Первый этого имени');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 4, 6, 'Законы Богов и Людей');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 4, 7, 'Пересмешник');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 4, 8, 'Гора и змей');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 4, 9, 'Дозорные на стене');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 4, 10, 'Дети');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 5, 1, 'Грядущие войны');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 5, 2, 'Чёрно-белый дом');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 5, 3, 'Его Воробейшество');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 5, 4, 'Сыны Гарпии');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 5, 5, 'Убей мальчишку');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 5, 6, 'Непокорны, несгибаемы, не сломлены');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 5, 7, 'Дар');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 5, 8, 'Суровый дом');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 5, 9, 'Танец Драконов');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 5, 10, 'Милосердие матери');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 6, 1, 'Красная женщина');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 6, 2, 'Дом');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 6, 3, 'Клятвопреступник');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 6, 4, 'Книга неведомого');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 6, 5, 'Дверь');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 6, 6, 'Кровь моей крови');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 6, 7, 'Сломленный');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 6, 8, 'Никто');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 6, 9, 'Битва бастардов');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 6, 10, 'Ветра зимы');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 7, 1, 'Драконий камень');
INSERT INTO episodes (serial_route, season, ep, title)
VALUES ('game_of_thrones', 7, 2, 'Бурерожденная');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 7, 3, 'Правосудие королевы');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 7, 4, 'Трофеи войны');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 7, 5, 'Восточный дозор');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 7, 6, 'За стеной');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 7, 7, 'Дракон и волк');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 8, 1, 'Винтерфелл');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 8, 2, 'Рыцарь Семи Королевств');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 8, 3, 'Долгая ночь');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 8, 4, 'Последние из Старков');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 8, 5, 'Колокола');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('game_of_thrones', 8, 6, 'Железный Трон');

INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 1, 1, 'Пилотная серия');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 1, 2, 'Отцовство');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 1, 3, 'Бритва Оккама');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 1, 4, 'Материнство');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 1, 5, 'Будь ты проклят, если сделаешь это');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 2, 1, 'Смирение');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 2, 2, 'Аутопсия');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 2, 3, 'Шалтай-Болтай');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 2, 4, 'Туберкулёз или не туберкулёз?');
INSERT INTO episodes (serial_route, season, ep, title) 
VALUES ('doctor_house', 2, 5, 'Папенькин сынок');

INSERT INTO film_director (film_route, person_route) VALUES ('matrix', 'lana_wachowski');
INSERT INTO film_director (film_route, person_route) VALUES ('matrix', 'lilly_wachowski');
INSERT INTO film_director (film_route, person_route) VALUES ('spiderman', 'sam_raimi');
INSERT INTO film_director (film_route, person_route) VALUES ('hurrypotter_azkaban', 'alfonso_cuaron');
INSERT INTO film_director (film_route, person_route) VALUES ('avatar', 'james_cameron');
INSERT INTO film_director (film_route, person_route) VALUES ('snowwhite_hunter', 'rupert_sanders');
INSERT INTO film_director (film_route, person_route) VALUES ('everest', 'baltasar_kormakur');
INSERT INTO film_director (film_route, person_route) VALUES ('game_of_thrones', 'david_nutter');
INSERT INTO film_director (film_route, person_route) VALUES ('game_of_thrones', 'alan_taylor');
INSERT INTO film_director (film_route, person_route) VALUES ('game_of_thrones', 'alex_graves');
INSERT INTO film_director (film_route, person_route) VALUES ('game_of_thrones', 'miguel_sapochnik');
INSERT INTO film_director (film_route, person_route) VALUES ('game_of_thrones', 'jeremy_podeswa');
INSERT INTO film_director (film_route, person_route) VALUES ('game_of_thrones', 'daniel_minahan');
INSERT INTO film_director (film_route, person_route) VALUES ('doctor_house', 'greg_yaitanes');
INSERT INTO film_director (film_route, person_route) VALUES ('doctor_house', 'deran_sarafian');

INSERT INTO film_actor (film_route, person_route) VALUES ('matrix', 'keanu_reeves');
INSERT INTO film_actor (film_route, person_route) VALUES ('matrix', 'laurence_fishburne');
INSERT INTO film_actor (film_route, person_route) VALUES ('matrix', 'carrie-anne_moss');
INSERT INTO film_actor (film_route, person_route) VALUES ('matrix', 'hugo_weaving');
INSERT INTO film_actor (film_route, person_route) VALUES ('matrix', 'gloria_foster');
INSERT INTO film_actor (film_route, person_route) VALUES ('matrix', 'joe_pantoliano');
INSERT INTO film_actor (film_route, person_route) VALUES ('matrix', 'marcus_chong');
INSERT INTO film_actor (film_route, person_route) VALUES ('spiderman', 'tobey_maguire');
INSERT INTO film_actor (film_route, person_route) VALUES ('spiderman', 'willem_dafoe');
INSERT INTO film_actor (film_route, person_route) VALUES ('spiderman', 'kirsten_dunst');
INSERT INTO film_actor (film_route, person_route) VALUES ('spiderman', 'james_franco');
INSERT INTO film_actor (film_route, person_route) VALUES ('spiderman', 'cliff_robertson');
INSERT INTO film_actor (film_route, person_route) VALUES ('spiderman', 'rosemary_harris');
INSERT INTO film_actor (film_route, person_route) VALUES ('spiderman', 'j_k_simmons');
INSERT INTO film_actor (film_route, person_route) VALUES ('hurrypotter_azkaban', 'daniel_radcliffe');
INSERT INTO film_actor (film_route, person_route) VALUES ('hurrypotter_azkaban', 'rupert_grint');
INSERT INTO film_actor (film_route, person_route) VALUES ('hurrypotter_azkaban', 'emma_watson');
INSERT INTO film_actor (film_route, person_route) VALUES ('hurrypotter_azkaban', 'david_thewlis');
INSERT INTO film_actor (film_route, person_route) VALUES ('hurrypotter_azkaban', 'robbie_coltrane');
INSERT INTO film_actor (film_route, person_route) VALUES ('hurrypotter_azkaban', 'gary_oldman');
INSERT INTO film_actor (film_route, person_route) VALUES ('hurrypotter_azkaban', 'michael_gambon');
INSERT INTO film_actor (film_route, person_route) VALUES ('avatar', 'sam_worthington');
INSERT INTO film_actor (film_route, person_route) VALUES ('avatar', 'zoe_saldana');
INSERT INTO film_actor (film_route, person_route) VALUES ('avatar', 'sigourney_weaver');
INSERT INTO film_actor (film_route, person_route) VALUES ('avatar', 'stephen_lang');
INSERT INTO film_actor (film_route, person_route) VALUES ('avatar', 'michelle_rodriguez');
INSERT INTO film_actor (film_route, person_route) VALUES ('avatar', 'giovanni_ribisi');
INSERT INTO film_actor (film_route, person_route) VALUES ('avatar', 'joel_moore');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'peter_dinklage');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'lena_headey');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'emilia-clarke');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'kit_harington');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'sophie_turner');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'maisie_williams');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'nikolaj_coster-waldau');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'iain_glen');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'alfie_allen');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'john_bradley');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'jack_gleeson');
INSERT INTO film_actor (film_route, person_route) VALUES ('game_of_thrones', 'nathalie_emmanuel');
INSERT INTO film_actor (film_route, person_route) VALUES ('snowwhite_hunter', 'kristen_stewart');
INSERT INTO film_actor (film_route, person_route) VALUES ('snowwhite_hunter', 'chris_hemsworth');
INSERT INTO film_actor (film_route, person_route) VALUES ('snowwhite_hunter', 'charlize_theron');
INSERT INTO film_actor (film_route, person_route) VALUES ('snowwhite_hunter', 'sam_claflin');
INSERT INTO film_actor (film_route, person_route) VALUES ('snowwhite_hunter', 'ian_mcShane');
INSERT INTO film_actor (film_route, person_route) VALUES ('snowwhite_hunter', 'sam_spruell');
INSERT INTO film_actor (film_route, person_route) VALUES ('snowwhite_hunter', 'bob_hoskins');
INSERT INTO film_actor (film_route, person_route) VALUES ('everest', 'jason_clarke');
INSERT INTO film_actor (film_route, person_route) VALUES ('everest', 'josh_brolin');
INSERT INTO film_actor (film_route, person_route) VALUES ('everest', 'jake_gyllenhaal');
INSERT INTO film_actor (film_route, person_route) VALUES ('everest', 'john_hawkes');
INSERT INTO film_actor (film_route, person_route) VALUES ('everest', 'michael_kelly');
INSERT INTO film_actor (film_route, person_route) VALUES ('everest', 'ingvar_sigurdsson');
INSERT INTO film_actor (film_route, person_route) VALUES ('everest', 'sam_worthington');
INSERT INTO film_actor (film_route, person_route) VALUES ('everest', 'keira_knightley');
INSERT INTO film_actor (film_route, person_route) VALUES ('how_will_smith_came_to_oscar', 'will_smith');
INSERT INTO film_actor (film_route, person_route) VALUES ('doctor_house', 'hugh_laurie');
INSERT INTO film_actor (film_route, person_route) VALUES ('doctor_house', 'robert_sean_leonard');
INSERT INTO film_actor (film_route, person_route) VALUES ('doctor_house', 'lisa_edelstein');
INSERT INTO film_actor (film_route, person_route) VALUES ('doctor_house', 'omar_epps');