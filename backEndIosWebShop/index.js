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
  insecureAuth : true
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


const categoriesRouter = require('./routes/categories');
const dressImagesRouter = require('./routes/dressImages');
const dressesRouter = require('./routes/dresses');
const customersRouter = require('./routes/customers');
const dressSizesRouter = require('./routes/dressSize');
const purchaseRouter = require('./routes/purchase');
const purchaseDetailsRouter = require('./routes/purchaseDetails');

// use the modules
app.use(cors())
app.use(bodyParser.json());

// use router
app.use('/categories', categoriesRouter);
app.use('/dressImages', dressImagesRouter);
app.use('/dresses', dressesRouter);
app.use('/customers', customersRouter);
app.use('/dressSizes', dressSizesRouter);
app.use('/purchase', purchaseRouter);
app.use('/purchaseDetails', purchaseDetailsRouter);
app.use(express.static('images'));

// starting the server
app.listen( server.port , () => console.log(`Server started, listening port: ${server.port}`));
