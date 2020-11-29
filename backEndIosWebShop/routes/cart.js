const express = require('express'),
  router = express.Router();

  router.get('/:id', async function(req, res) {
    let sql = `select customer.name, dress.*, orders.quantity, orders.id as orderId from dress,orders,cart,customer where cart.id = orders.cartId and dress.id = orders.dressId and customer.id = cart.customerId and cart.date is null and customer.id = ${req.params.id}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;

      for (var i = 0; i < data.length; i++) {
        data[i]["images"] = await getImages(data[i].id);
      }

      if (data.length <= 0) {
        res.json({
          status: 400,
          data: [],
          message: "Not found :("
        })
      } else {
        res.json({
          status: 200,
          data,
          message: "Cart retrieved successfully"
        })
      }
    })
  });

  const getImages = async ( id ) => {
      return new Promise(async(resolve, reject) => {
    var images = [];
    sql = `SELECT url FROM dressImages where dressId=${id}`;

    await db.query(sql ,function(err, data, fields) {
        Object.keys(data).forEach(function(key) {
        images.push(data[key].url);
   });
   return resolve(images);
    });
  })
  };

  router.post('/:id', async function(req, res) {

    let sql = `SELECT * FROM cart where customerId = ${req.params.id}`;
    db.query(sql,async function(err, data, fields) {
      if (err) throw err;
      let cartId = data.length > 0 ? data[0]["id"] : null;

      if (cartId == null || data[0]["date"] != null) {
        cartId = await createCart(req.params.id);
      }

      res.json({
        status: 200,
        cartId: cartId,
        message: "Customer lists retrieved successfully"
      })
    })
  });

  const createCart = async ( id ) => {
      return new Promise(async(resolve, reject) => {
    let insertSql = `INSERT INTO cart (customerId) VALUES (${id})`;
    await db.query(insertSql ,function(err, data, fields) {
      return resolve(data.insertId);
    });
  })
  };

  router.put('/:id', async function (req, res) {
    let sql = `UPDATE cart SET date = NOW() WHERE customerId = ${req.params.id}`;
    db.query(sql, req.body, async function(err, data, fields) {
      if (err) throw err;

      var cartId = await createCart(req.params.id);

      res.json({
        status: 200,
        cartId: cartId,
        message: "Cart successfully updated"
      })
    })
  });


  module.exports = router;
