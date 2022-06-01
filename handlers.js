import fs from 'fs';
import {db} from './db.js';
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
    `SELECT image, route, title, rating, agelimit
    FROM videos
    ORDER BY rating DESC
    LIMIT ?`,
    req.params.arrayLength ? req.params.arrayLength : 12,
    (err, rows) => {
      handleErrors(err);
      response.send(rows);
    }
  );
};

export const getSerials = (_, response) => {
  db.all(
    `SELECT image, route, title, rating, agelimit
    FROM serials
    ORDER BY rating DESC`,
    (err, rows) => {
      handleErrors(err);
      response.send(rows);
    }
  );
};

export const getFilms = (req, response) => {
  const order = req.body.order;
  let criterium = order ? order : "rating";
  if (order === "newest") criterium = "add_at";
  let query = `SELECT image, route, title, rating, agelimit
  FROM films ORDER BY ${ criterium } DESC`;
  if (req.body.arrayLength && req.body.arrayLength > 0) {
    query +=  ` LIMIT ${ req.body.arrayLength };`;
  } else {
    query += ';';
  }
  db.all(query, (err, rows) => {
      handleErrors(err);
      response.send(rows);
  });
};

export const getVideoContent = (_, response) => {
  db.all(
    `SELECT image, route, title, rating, agelimit FROM films
    UNION
    SELECT image, route, title, rating, agelimit FROM videos
    UNION
    SELECT image, route, title, rating, agelimit FROM serials
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
  db.all(
    `SELECT * FROM comments WHERE film_route = ?`, req.params.route,
    (err, rows) => {
      handleErrors(err);
      response.send(rows);
    }
  );
};

export const  getImage = (req, response) => {
    const filePath = './media/' + req.params.file;
    fs.access(filePath, fs.constants.R_OK, (err) => {
      if (err) {
        response.statusCode = 404;
        response.end('File not found');
      } else {
        fs.createReadStream(filePath).pipe(response);
      }
    })
};
