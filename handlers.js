import fs from 'fs';
import {db} from './db.js';
import { sGetFilmsByRating, sGetFilmsByAdding } from './services.js';
// import {createDatabase} from './mutations.js'

export const getIndex = (_, res) => {
  fs.readFile("index.html", "utf-8", (error, data) => {
    if (error) {
      const errorMsg = "Ошибка сервера: нет корневого index.html";
      console.error(errorMsg);
      res.send(errorMsg);
    } else {
      res.send(data);
    }
  });
};

export const handleErrors = (err) => {
    if (err) console.error('Ошибка базы данных: ' + err);
};

export const getPerson = (req, response) => {
  db.all(
    `SELECT * FROM persona WHERE route = ?`,
    req.params.route,
    (err, rows) => {
      handleErrors(err);
      response.send(rows);
    }
  );
};

export const getVideos = (req, response) => {
  db.all(
    `SELECT * FROM videos ORDER BY rating DESC LIMIT ?`,
    req.params.arrayLength ? req.params.arrayLength : 12,
    (err, rows) => {
      handleErrors(err);
      response.send(rows);
    }
  );
};

export const onGetFilms = (req, response) => {
  const recvd = req.body;
  if (recvd.order === 'rating') sGetFilmsByRating(response, recvd);
  if (recvd.order === 'newest') sGetFilmsByAdding(response, recvd);
};
