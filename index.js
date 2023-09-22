
const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "arena"
});

db.connect();

getAll = (req, res) => {
    const result = db.query("SELECT * FROM users;", (err, result) => {

        if (err) {
            res.status(500).send(err); 
            throw err;
        }

        //console.log("type " + result[0].dateOfBirth.getFullYear());
        //res.json("ok");
        res.status(200).send(result);  
    }); 
};

addUser = (req, res) => {

    const query = "INSERT INTO users (firstName, surnames, dateOfBirth, sex) VALUES (?,?,?,?)";

    const { firstName, surnames, dateOfBirth, sex } = req.body;

    const result = db.query(query, [firstName, surnames, dateOfBirth, sex ], (err, result) => {
        if (err) {
            res.status(500).send(err); 
            throw err;
        }

        res.status(200).send(result);
    });
}

app.use(cors({ origin: "http://localhost:5500" }))
app.use(bodyParser.json());

app.get("/users", getAll);
app.post("/users", addUser);

app.listen(4005);