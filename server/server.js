const mysql = require('mysql');
const express = require('express');
const http = require('http');
const app = express();
var bodyParser = require('body-parser');



app.use(bodyParser.urlencoded({
  extended: false
}));

app.use(bodyParser.json())


const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Password",
  database: "database1",
  port: 3308


});

con.connect(function (err) {
  if (!err) {
    console.log("Database is connected");
  } else {
    console.log("Error connecting database");
  }
});
app.get("/products", function (req, res) {

  con.query('SELECT * from products', function (err, rows, fields) {

    res.send(rows);
    if (!err)
      console.log('The solution is: ', rows);
    else
      console.log('Error while performing Query.');
  });
});

app.get("/mobiles", function (req, res) {

  con.query('SELECT * from mobiles', function (err, rows, fields) {

    res.send(rows);
    if (!err)
      console.log('The solution is: ', rows);
    else
      console.log('Error while performing Query.');
  });
});
app.get("/laptops", function (req, res) {

  con.query('SELECT * from laptops', function (err, rows, fields) {

    res.send(rows);
    if (!err)
      console.log('The solution is: ', rows);
    else
      console.log('Error while performing Query.');
  });
});

app.get('/userdetails', (req, res) => {
  con.query('SELECT * FROM userdetails', (err, rows, fields) => {
    res.send(rows);
    if (!err)
      console.log('the solution is:', rows);
    else
      console.log('Error while performing Query.');
  })

});
app.get('/userdetails/:username', (req, res) => {
  var name = req.params.username;



  con.query(`SELECT * FROM userdetails where username = "${name}"`, (err, rows, fields) => {


    if (rows.length == 1)
      res.send(rows);
    //  res.send(''+rows[0].id);
    else
      res.status(401).json({ "id": 0, "username": "", "password": "", "email": " " });
    // console.log(err);
    // res.send(''+0);

  })

});


app.post('/submit', (req, res) => {


  var createUser = {
    id: req.body.id,
    username: req.body.username,
    email: req.body.email,
    password: req.body.password
  }


  let sql = 'INSERT INTO userdetails  SET ?';
  con.query(sql, createUser, (err, rows, fields) => {

    // res.send(status);
    if (!err) {
      res.send("success");
      console.log(rows);
    } else {
      res.send(null)
      console.log(err);
    }


  });

});

app.get('/cart/', (req, res) => {
  let sql = 'SELECT * FROM cart';
  con.query(sql, (err, rows, fields) => {
    res.send(rows);
    if (!err)
      console.log(rows)
    else
      console.log('Error while performing Query.');
  })

});


app.get('/cart/:userid', (req, res) => {
  var id = req.params.userid;
  let sql = 'SELECT * FROM cart WHERE userid = ?';
  con.query(sql,[id] ,(err, rows, fields) => {
    res.send(rows);
    if (!err)
      console.log(rows)
    else
      console.log('Error while performing Query.');
  })

});

app.post('/postcart', (req, res) => {

  var cartdetails = {

    userid: req.body.userid,
    prodname: req.body.prodname,
    prodprice: req.body.prodprice,
    prodimage: req.body.prodimage

  }
  let sql = 'INSERT INTO cart SET ?'
  con.query(sql, cartdetails, (err, rows, fields) => {
    res.send(rows)
    if (!err)
      console.log(rows)
    else
      console.log('Error while performing Query.', err);
  })

});

app.get('/cartcheck/:userid/:prodname', (req, res) => {
  var uid = req.params.userid;
  var pn = req.params.prodname;
  var sql = 'SELECT * FROM cart WHERE userid =? AND prodname= ? '
  con.query(sql, [uid, pn], (err, rows, fields) => {

    if (rows.length == 1)
      //res.send('' + rows[0].userid);
      res.send('' + 1)
    else
      res.send('' + 0);

  })
});



app.listen(3001, () => {
  console.log(`Server started on port `);
});


