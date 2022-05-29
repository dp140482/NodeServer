import {db} from './db.js';
import { handleErrors } from './handlers.js';

export function sGetFilmsByRating(response, recvd) {
  db.all(
    `SELECT * FROM films ORDER BY rating DESC LIMIT ?`, recvd.arrayLength,
    (err, rows) => {
      handleErrors(err);
      response.send(rows);
    }
  );
};

export function sGetFilmsByAdding(response, recvd) {
  db.all(
    `SELECT * FROM films ORDER BY add_at DESC LIMIT ?`, recvd.arrayLength,
    (err, rows) => {
      handleErrors(err);
      response.send(rows);
    }
  );
};
