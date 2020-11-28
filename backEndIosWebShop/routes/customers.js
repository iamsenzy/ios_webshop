const express = require('express'),
  router = express.Router();

  router.post('', function (req, res) {
    let sql = `INSERT INTO customer (name,email,phoneNumber,postNumber,city,address) VALUES (?)`;
    let values = [
      req.body.name,
      req.body.email,
      req.body.phoneNumber,
      req.body.postNumber,
      req.body.city,
      req.body.address
    ];
    db.query(sql, [values], function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        data: data.insertId,
        message: "New customer added successfully"
      })
    })
  });

  router.get('', async function(req, res) {

    let sql = `SELECT * FROM customer`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;

      res.json({
        status: 200,
        data,
        message: "Customer lists retrieved successfully"
      })
    })
  });

  router.post('/email', async function(req, res) {

    let email = req.body.email;
    console.log(email);
    let sql = `SELECT * FROM customer where email = ${email}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        data,
        message: "Customer lists retrieved successfully"
      })
    })
  });

  router.get('/:id', async function(req, res) {
    let sql = `SELECT * FROM customer where id = ${req.params.id}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;

      if (data.length <= 0) {
        res.json({
          status: 400,
          message: "Customer not found :("
        })
      } else {
        res.json({
          status: 200,
          data,
          message: "One customer retrieved successfully"
        })
      }
    })
  });

  router.delete('/:id', async function(req, res) {
    let sql = `Delete FROM customer where id = ${req.params.id}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;

        res.json({
          status: 200,
          message: "Customer deleted successfully"
        })
      })
  });

  router.put('/:id', function (req, res) {
    let sql = `UPDATE customer SET ? WHERE id = ${req.params.id}`;
    db.query(sql, req.body, function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        message: "One customer successfully updated"
      })
    })
  });

module.exports = router;
