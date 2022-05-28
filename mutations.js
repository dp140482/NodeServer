const sqlite3 = require('sqlite3');
const dbName = './base.db';

const createDatabase = () => {
    console.log('Создание новой базы данных…');
    new sqlite3.Database(dbName, (err) => {
        if (err) {
            console.error("Ошибка " + err);
        }
    });
}

module.exports = { createDatabase };