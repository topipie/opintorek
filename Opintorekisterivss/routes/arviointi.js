const express = require('express');
const router = express.Router();
const arviointi = require('../models/arviointi_model');

router.get('/', function (request, response) {
    arviointi.getAll(function (err, dbResult) {
        if (err) {
            response.json(err);
        } else {
            dbResult.forEach(item => {
                if (item.Päiväys) {
                    const date = new Date(item.Päiväys);
                    // Muodostetaan muoto YYYY-MM-DD
                    const year = date.getFullYear();
                    const month = String(date.getMonth() + 1).padStart(2, '0'); 
                    const day = String(date.getDate()).padStart(2, '0');
                    item.Päiväys = `${year}-${month}-${day}`;
                }
            });
            response.json(dbResult);
        }
    });
});

router.get('/:id', function (request, response) {
    arviointi.getOne(request.params.id, function (err, dbResult) {
        if (err) {
            return response.status(500).json(err);
        }

        // Jos getOne palauttaa arrayn esim: [{ ... }]
        const result = Array.isArray(dbResult) ? dbResult[0] : dbResult;

        if (result && result.Päiväys instanceof Date) {
            const date = result.Päiväys;
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            // Muutetaan päivämäärä merkkijonoksi (eikä Date-objektiksi!)
            result.Päiväys = `${year}-${month}-${day}`;
        }

        // Tarkistetaan tulosteessa, että muoto on oikea
        console.log('Palautettava objekti:', result);
        response.json(result);
    });
});


router.post('/', 
function(request, response) {

  console.log("POST body:", request.body); 

  arviointi.add(request.body, function(err, dbResult) {
    if (err) {
      response.json(err);
    } else {
      response.json(dbResult);
    }
  });
});


router.delete('/:id', 
function(request, response) {
  arviointi.delete(request.params.id, function(err, dbResult) {
    if (err) {
      response.json(err);
    } else {
      response.json(dbResult);
    }
  });
});


router.put('/:id', 
function(request, response) {
  arviointi.update(request.params.id, request.body, function(err, dbResult) {
    if (err) {
      response.json(err);
    } else {
      response.json(dbResult);
    }
  });
});


module.exports = router;