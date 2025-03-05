const express = require("express");
const app = express();
const port = 3000;
const hugeData = require("./large-file.json");

app.use(express.json());

app.get("/simple", (req, res) => {
  res.send("Hello World!");
});

app.get("/hugeData", (req, res) => {
  res.send(hugeData);
});

app.get("/slow", (req, res) => {
  setTimeout(() => {
    res.send("hello again");
  }, 3000);
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
