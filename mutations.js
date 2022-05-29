import sqlite3 from 'sqlite3'

const dbName = './base.db';

export const createDatabase = () => {
  console.log("Создание новой базы данных…");
  new sqlite3.Database(dbName, (err) => {
    if (err) {
      console.error("Ошибка " + err);
    }
  });
}
