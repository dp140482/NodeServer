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
  getGenres
} from './handlers.js';
// import { fileURLToPath } from 'url';
// import { dirname } from 'path';

const app = express();
// const __dirname = dirname(fileURLToPath(import.meta.url));// без этого __dirname не работает в ESM
// const path = __dirname + '/db/';

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
app.get("/get-videocontent", getVideoContent); // -- Вернуть все фильмы, сериалы и видео
app.post("/get-films", getFilms); // -- Вернуть первые arrayLength фильмов в порядке order
app.post("/get-videos", getVideos); // -- Вернуть первые arrayLength видео в порядке order
app.get("/get-serials", getSerials); // -- Вернуть все сериалы
app.get("/get-genres", getGenres); // -- Вернуть все используемые жанры
/* Вернуть подробную информацию о фильме, сериале или видео: */
app.get("/get-videocontent-info/:route", getInfo);
app.post("/get-episodes", () => {}); // -- Вернуть список эпизодов сезона сериала
app.get("/get-person/:route", getPerson); // -- Вернуть подробную информацию о человеке
app.get("/get-comments/:route", getComments); // -- Вернуть список комментариев
app.post("/post-comment", postComment); // -- Отправить комментарий
app.get("/refresh-rating/:route", () => {}); // -- Обновить рейтинг фильма
app.post("/login", () => {}); // -- Вход пользователя
app.get("/logout", () => {}); // -- Выход зарегистрированного
app.post("/signin", () => {}); // -- Регистрация пользователя

const port = process.env.PORT || 3003;
app.listen(port, () => console.log(`Сервер работает на порте ${port}...`));
