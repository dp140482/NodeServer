import express from 'express';
import cors from 'cors';
import {
  getIndex,
  getPerson,
  getFilms,
  getVideos,
  getSerials,
  getVideoContent,
  postComment,
  getComments,
  getImage,
  getInfo,
  getGenres,
  getFilmGenres,
  getNumOfFilms,
  getDirectors,
  getActors,
  getNews,
  goSearch,
} from './handlers.js';

const app = express();

app.use(express.json());
app.use(cors());

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Content-Type");
  if (req.method === "OPTIONS") {
    res.header(("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE"));
    return res.status(200).json({});
  }
  next();
});

app.get("/", getIndex); // -- Вернуть  index.html (фронт)
app.get("/images/:file", getImage) // -- Вернуть картинку из папки media по имени файла
app.post("/get-videocontent", getVideoContent); // -- Вернуть все фильмы, сериалы и видео
app.post("/get-films", getFilms); // -- Вернуть первые arrayLength фильмов в порядке order
app.post("/get-videos", getVideos); // -- Вернуть первые arrayLength видео в порядке order
app.get("/get-serials", getSerials); // -- Вернуть все сериалы
app.post("/get-genres", getGenres); // -- Вернуть все используемые жанры
app.get("/get-genres/:route", getFilmGenres); // -- Вернуть все жанры видеозаписи
app.get("/get-number-of-films", getNumOfFilms); // -- Вернуть число фильмов в базе
app.get("/get-number-of-films/:genre_id", getNumOfFilms); // -- Вернуть число фильмов в базе
/* Вернуть подробную информацию о фильме, сериале или видео: */
app.get("/get-videocontent-info/:route", getInfo);
app.get("/get-directors/:route", getDirectors);  // -- Вернуть список директоров фильма
app.get("/get-actors/:route", getActors);  // -- Вернуть список актёров фильма
app.get("/get-seasons-number", () => {}); // -- Вернуть число сезонов сериала
app.post("/get-episodes", () => {}); // -- Вернуть список эпизодов сезона сериала
app.get("/get-person/:route", getPerson); // -- Вернуть подробную информацию о человеке
app.get("/get-comments/:route", getComments); // -- Вернуть список комментариев
app.post("/post-comment", postComment); // -- Отправить комментарий
app.post("/go-search", goSearch); // -- Поиск видеозаписи по названию
app.get("/refresh-rating/:route", () => {}); // -- Обновить рейтинг фильма
app.post("/login", () => {}); // -- Вход пользователя
app.get("/logout", () => {}); // -- Выход зарегистрированного
app.post("/signin", () => {}); // -- Регистрация пользователя
app.get("/get-news", getNews); // -- Вернуть все новости

const port = process.env.PORT || 3003;
app.listen(port, () => console.log(`Сервер работает на порте ${port}...`));
