const fs = require("fs");
const db = require("./db");
// const mutations = require("./mutations");

const getIndex = (_, res) => {
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

const makeDB = (_, res) => {
    res.send({ok: true});
}

module.exports = { getIndex, makeDB };