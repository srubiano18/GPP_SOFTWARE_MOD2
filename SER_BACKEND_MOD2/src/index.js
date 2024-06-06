const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const port = 3001;
const routes = require("./api/endPoints");
const cors = require("cors");
const { initDB } = require("./models/db");
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.json({ limit: "100mb" }));
app.use(bodyParser.urlencoded({ limit: "100mb", extended: true }));
app.use(
  cors({
    origin: ["http://localhost:5173"],
    methods: ["GET", "POST"],
    allowedHeaders: ["Content-Type", "Authorization"],
    exposedHeaders: ["Access-Control-Allow-Origin"],
  })
);
app.use("/", routes);
app.listen(port, () => {
  console.log(`Aplicación corriendo correctamente en el puerto: ${port}`);
});
app.options("*", cors());

initDB();
