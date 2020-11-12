const express = require('express'),
router = express.Router();

router.get('/:id', async function(req, res) {
  let sql = `SELECT * FROM purchase where id = ${req.params.id}`;
  db.query(sql, async function(err, data, fields) {
    if (err) throw err;


    if (data.length <= 0) {
      res.json({
        status: 400,
        message: "Purchase not found :("
      })
    } else {
      res.json({
        status: 200,
        data,
        message: "One purchase retrieved successfully"
      })
    }
  })
});

router.get('', async function(req, res) {
  let sql = `SELECT * FROM purchase`;
  db.query(sql, async function(err, data, fields) {
    if (err) throw err;

    res.json({
      status: 200,
      data,
      message: "Purchase lists retrieved successfully"
    })
  })
});

router.post('', function (req, res) {
  let sql = `INSERT INTO purchase (customerId,date,cashe) VALUES (?)`;
  let values = [
    req.body.customerId,
    req.body.date,
    req.body.cashe,
  ];
  db.query(sql, [values], function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      message: "New purchase added successfully"
    })
  })
});


module.exports = router;
