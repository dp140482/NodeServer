const express = require("express");
const app = express();
const cors = require("cors");
const handlers = require("./handlers");

// const path = __dirname + "/db/";

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

app.get("/", handlers.getIndex);
app.get("/makeDB", handlers.makeDB);

/*
app.get("/get/:date", (req, res) => {
  handler(req, res, {todo: "get", path});
});
app.get("/save/:date", (req, res) => {
  handler(req, res, {todo: "save", path, htmlPath: html});
});
app.put("/set/:date", (req, res) => {
  handler(req, res, {todo: "set", path});
});
app.post("/add/:date", (req, res) => {
  handler(req, res, {todo: "add", path});
});
*/

const port = process.env.PORT || 3003;
app.listen(port, () => console.log(`Сервер работает на порту ${port}...`));