import fs from 'fs';
import {db} from './db.js';
import {createDatabase} from './mutations.js'

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

export const makeDB = (_, res) => {
  res.send({ok: true});
}
