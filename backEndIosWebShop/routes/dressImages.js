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
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'images/')
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now() + '.jpg')
  }
})

var upload = multer({ storage: storage })

// upload images
router.post('/upload', upload.single('image'), function(req, res, next) {
    const file = req.file
  if (!file) {
    const error = new Error('Please upload a file')
    error.httpStatusCode = 400
    return next(error)
  }

  let sql = `INSERT INTO dressImages (url,dressId) VALUES (?)`;
  let values = [
    '/' + req.file.filename,
    req.body.dressId
  ];
  db.query(sql, [values], function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      message: "New image added successfully"
    })
    
  })

});

module.exports = router;
