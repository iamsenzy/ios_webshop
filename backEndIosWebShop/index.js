const express = require('express'),
  multer = require('multer'),
  app = express(),
  mysql = require('mysql'), // import mysql module
  cors = require('cors'),
  bodyParser = require('body-parser');

// setup database
db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'bertalan1',
  database: 'webshop',
  insecureAuth: true
})

// make server object that contain port property and the value for our server.
var server = {
  port: 4040
};

db.connect(function(err) {
  if (err) {
    return console.error('error: ' + err.message);
  }

  console.log('Connected to the MySQL server.');
});

let createCart = `create table if not exists cart(
  id int primary key auto_increment,
  customerId int not null,
  date date
)`;

db.query(createCart, function(err, results, fields) {
  if (err) {
    console.log(err.message);
  }
});

let createCategories = `create table if not exists categories(
  id int auto_increment,
  name varchar(255) not null,
  primary key (id, name)
)`;

db.query(createCategories, function(err, results, fields) {
  if (err) {
    console.log(err.message);
  }
});

let createCustomer = `create table if not exists customer(
  id int primary key auto_increment,
  name varchar(255),
  email varchar(255) unique,
  phoneNumber varchar(12),
  postNumber int,
  city varchar(255),
  address varchar(255)
)`;

db.query(createCustomer, function(err, results, fields) {
  if (err) {
    console.log(err.message);
  }
});

let createDress = `create table if not exists dress(
  id int primary key auto_increment,
  name varchar(255),
  description varchar(255),
  category int not null,
  price double
)`;

db.query(createDress, function(err, results, fields) {
  if (err) {
    console.log(err.message);
  }
});

let createDressImages = `create table if not exists dressImages(
  id int primary key auto_increment,
  url varchar(255),
  dressId int not null
)`;

db.query(createDressImages, function(err, results, fields) {
  if (err) {
    console.log(err.message);
  }
});

let createOrders = `create table if not exists orders(
  id int primary key auto_increment,
  quantity int,
  dressId int not null,
  cartId int not null
)`;

db.query(createOrders, function(err, results, fields) {
  if (err) {
    console.log(err.message);
  }
});


const categoriesRouter = require('./routes/categories');
const dressImagesRouter = require('./routes/dressImages');
const dressesRouter = require('./routes/dresses');
const customersRouter = require('./routes/customers');
const cartRouter = require('./routes/cart');
const ordersRouter = require('./routes/orders');

// use the modules
app.use(cors())
app.use(bodyParser.json());

// use router
app.use('/categories', categoriesRouter);
app.use('/dressImages', dressImagesRouter);
app.use('/dresses', dressesRouter);
app.use('/customers', customersRouter);
app.use('/cart', cartRouter);
app.use('/orders', ordersRouter);
app.use(express.static('images'));

// starting the server
app.listen(server.port, () => console.log(`Server started, listening port: ${server.port}`));
