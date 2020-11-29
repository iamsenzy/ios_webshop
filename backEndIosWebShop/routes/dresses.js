const express = require('express'),
  router = express.Router();

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

router.get('', async function(req, res) {

  var category = req.query.category;
  var latest = req.query.latest;
  let isCategory = typeof category !== "undefined"
  let isLatest = typeof latest !== "undefined"
  var sql;

  if (isCategory) {
    sql = `SELECT * FROM dress where category = ${category}`;
  } else if (isLatest) {
      sql = `SELECT * FROM dress order by id desc limit ${latest}`;
  } else {
    sql = `SELECT * FROM dress`;
  }

  db.query(sql, async function(err, data, fields) {
    if (err) throw err;

    for (var i = 0; i < data.length; i++) {
      data[i]["images"] = await getImages(data[i].id);
    }
    res.json({
      status: 200,
      data,
      message: "Dresses lists retrieved successfully"
    })
  })
});

router.get('/:id', async function(req, res) {
  let sql = `SELECT * FROM dress where id = ${req.params.id}`;
  db.query(sql, async function(err, data, fields) {
    if (err) throw err;

    for (var i = 0; i < data.length; i++) {
      data[i]["images"] = await getImages(data[i].id);
    }

    if (data.length <= 0) {
      res.json({
        status: 400,
        message: "Dress not found :("
      })
    } else {
      res.json({
        status: 200,
        data,
        message: "One Dress retrieved successfully"
      })
    }
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
});

router.delete('/:id', async function(req, res) {
  let sql = `Delete FROM dress where id = ${req.params.id}`;
  db.query(sql, async function(err, data, fields) {
    if (err) throw err;

    let sql = `DELETE FROM dressImages WHERE dressId = ${req.params.id}`;
    db.query(sql, async function(err, data, fields) {
      if (err) throw err;
    })

      res.json({
        status: 200,
        message: "Dress deleted successfully"
      })
    })
});

router.put('/:id', function (req, res) {
  let sql = `UPDATE dress SET ? WHERE id = ${req.params.id}`;
  db.query(sql, req.body, function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      message: "One dress successfully updated"
    })
  })
});

module.exports = router;
