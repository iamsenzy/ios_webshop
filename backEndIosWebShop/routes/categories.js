const express = require('express'),
  router = express.Router();

// get user lists
router.get('', function(req, res) {
  let sql = `SELECT * FROM categories`;
  db.query(sql, function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      data,
      message: "Categories lists retrieved successfully"
    })
  })
});

// create new user
router.post('/new', function(req, res) {
  let sql = `INSERT INTO categories(name) VALUES (?)`;
  let values = [
    req.body.name
  ];
  db.query(sql, [values], function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      message: "New categorie added successfully"
    })
  })
});

router.delete('/:id', async function(req, res) {
    let sql = `Delete FROM categories where id = ${req.params.id}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;

        res.json({
          status: 200,
          message: "Categorie deleted successfully"
        })
      })
  });

module.exports = router;