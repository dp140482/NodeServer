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

export const getSerials = (_, response) => {
  db.all(
    `SELECT * FROM serials ORDER BY rating DESC`,
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

export const getVideoContent = (_, response) => {
  db.all(
    `SELECT id, image, route, title, rating, agelimit FROM films
    UNION
    SELECT id, image, route, title, rating, agelimit FROM videos
    UNION
    SELECT id, image, route, title, rating, agelimit FROM serials
    ORDER BY rating DESC`,
    (err, rows) => {
      handleErrors(err);
      response.send(rows);
    }
  );
};

export const postComment = (req, response) => {
  const query = `INSERT INTO comments (film_route, username, message, datetime) VALUES (\'${ req.body.route }\', \'${ req.body.username }\', \'${ req.body.message }\', \'${ req.body.datetime }\');`;
  db.all( query,
    (err) => {
      handleErrors(err);
      response.send({"recieved": "ok"});
    }
  );
};

export const  getComments = (req, response) => {
  console.log(req.params.route);
  db.all(
    `SELECT * FROM comments WHERE film_route = ?`, req.params.route,
    (err, rows) => {
      handleErrors(err);
      response.send(rows);
    }
  );
};
