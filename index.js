
const express = require("express");
const app = express();

app.use("/ok", (req, res) => {

    res.json({
        name: "Matheus Reis",
        age: 28
    });
});

app.listen(4005);