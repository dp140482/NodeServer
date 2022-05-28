const sqlite3 = require('sqlite3');
const dbName = './base.db';

const db = new sqlite3.Database(dbName, sqlite3.OPEN_READWRITE, (err) => {
    if (err && err.code == "SQLITE_CANTOPEN") {
        console.error("Ошибка сервера: нет базы данных");
        return;
    } else if (err) {
        console.error("Ошибка сервера – ошибка базы данных:");
        console.error(err);
        return;
    }
});

module.exports = { db }