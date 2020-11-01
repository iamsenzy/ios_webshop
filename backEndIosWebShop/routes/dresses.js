const express = require('express'),
  router = express.Router();

const Dress = function(dress) {
  this.name = dress.name;
  this.description = dress.description;
  this.category = dress.category;
  this.price = dress.price;
};

router.get('', function(req, res) {
  let sql = `SELECT d.id,d.name,d.description,d.category,d.price,i.url FROM dress d left outer join dressImages i on d.id = i.dressId`;
  db.query(sql, function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      data,
      message: "Dresses lists retrieved successfully"
    })
  })
});

router.post('', function (req, res) {
  let sql = `INSERT INTO dress (name,description,category,price) VALUES (?)`;
  let values = [
    req.body.name,
    req.body.description,
    req.body.category,
    req.body.price
  ];
  db.query(sql, [values], function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      message: "New dress added successfully"
    })
  })
})

module.exports = router;