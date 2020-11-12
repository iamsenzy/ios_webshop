const express = require('express'),
  router = express.Router();

  router.post('', function (req, res) {
    let sql = `INSERT INTO dressSize (dressId,size) VALUES (?)`;
    let values = [
      req.body.dressId,
      req.body.size
    ];
    db.query(sql, [values], function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        message: "New size added successfully"
      })
    })
  });

  router.get('', async function(req, res) {

    let sql = `SELECT * FROM dressSize`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;

      res.json({
        status: 200,
        data,
        message: "DressSize lists retrieved successfully"
      })
    })
  });

  router.delete('/:id', async function(req, res) {
    let sql = `Delete FROM dressSize where id = ${req.params.id}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;

        res.json({
          status: 200,
          message: "DressSize deleted successfully"
        })
      })
  });

  router.put('/:id', function (req, res) {
    let sql = `UPDATE dressSize SET ? WHERE id = ${req.params.id}`;
    db.query(sql, req.body, function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        message: "One DressSize successfully updated"
      })
    })
  });

  module.exports = router;
