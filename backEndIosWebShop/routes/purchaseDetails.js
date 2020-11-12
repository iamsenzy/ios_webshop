const express = require('express'),
  router = express.Router();

  router.post('', function (req, res) {
    let sql = `INSERT INTO purchaseDetails (dressId,pieces,purchaseId) VALUES (?)`;
    let values = [
      req.body.dressId,
      req.body.pieces,
      req.body.purchaseId
    ];
    db.query(sql, [values], function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        message: "New Purchase Details added successfully"
      })
    })
  });

  router.get('', async function(req, res) {
    let sql = `SELECT * FROM purchaseDetails`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;

      res.json({
        status: 200,
        data,
        message: "Purchase Details lists retrieved successfully"
      })
    })
  });

  router.get('/:id', async function(req, res) {
    let sql = `SELECT * FROM purchaseDetails where id = ${req.params.id}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        data,
        message: "Purchase Details lists retrieved successfully"
      })
    })
  });

  router.delete('/:id', async function(req, res) {
    let sql = `Delete FROM purchaseDetails where id = ${req.params.id}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;
        res.json({
          status: 200,
          message: "Purchase Details deleted successfully"
        })
      })
  });

  router.put('/:id', function (req, res) {
    let sql = `UPDATE purchaseDetails SET ? WHERE id = ${req.params.id}`;
    db.query(sql, req.body, function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        message: "One Purchase Details successfully updated"
      })
    })
  });

  module.exports = router;
