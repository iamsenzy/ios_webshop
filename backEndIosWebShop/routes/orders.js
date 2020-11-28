const express = require('express'),
  router = express.Router();

  router.post('', function (req, res) {
    let sql = `INSERT INTO orders (quantity,dressId,cartId) VALUES (?)`;
    let values = [
      req.body.quantity,
      req.body.dressId,
      req.body.cartId
    ];
    db.query(sql, [values], function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        message: "Dress added to orders successfully"
      })
    })
  });

  router.delete('/:id', async function(req, res) {
    let sql = `Delete FROM orders where id = ${req.params.id}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;
        res.json({
          status: 200,
          message: "Dress deleted from orders successfully"
        })
      })
  });

  router.put('/:id', function (req, res) {
    let sql = `UPDATE orders SET ? WHERE id = ${req.params.id}`;
    db.query(sql, req.body, function(err, data, fields) {
      if (err) throw err;
      res.json({
        status: 200,
        message: "Order has changed successfully"
      })
    })
  });

module.exports = router;
