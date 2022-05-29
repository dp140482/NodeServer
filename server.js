import express from 'express';
import cors from 'cors';
import {getIndex, makeDB} from './handlers.js';
// import { fileURLToPath } from 'url';
// import { dirname } from 'path';

const app = express();
// const __dirname = dirname(fileURLToPath(import.meta.url));// без этого __dirname не работает в ESM
// const path = __dirname + '/db/';

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

app.get("/", getIndex);
app.post("/get-videocontent", () => {});
app.post("/get-films", () => {});
app.post("/get-videos", () => {});
app.post("/get-serials", () => {});
app.get("/get-info/:route", () => {});
app.post("/get-episodes", () => {});
app.get("/get-comments/:route", () => {});
app.get("/refresh-rating/:route", () => {});
app.post("/login", () => {});
app.get("/logout", () => {});
app.post("/signin", () => {});

const port = process.env.PORT || 3003;
app.listen(port, () => console.log(`Сервер работает на порту ${port}...`));
