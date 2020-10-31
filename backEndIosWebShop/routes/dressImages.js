const express = require('express'),
multer = require('multer'),
router = express.Router();

// get images
router.get('', function(req, res) {
  let sql = `SELECT * FROM dressImages`;
  db.query(sql, function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      data,
      message: "images lists retrieved successfully"
    })
  })
});

//multer options
const upload = multer({
dest: 'images'
})

// upload images
router.post('/upload', upload.single('upload'), function(req, res) {
    res.send()
});

module.exports = router;
