const express = require('express'),
  router = express.Router();

const Dress = function(dress) {
  this.name = dress.name;
  this.description = dress.description;
  this.category = dress.category;
  this.price = dress.price;
};


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

  let sql = `SELECT * FROM dress`;
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
