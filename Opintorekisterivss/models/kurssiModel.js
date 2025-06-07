const connection = require('../database');

function luoUusiKurssi(N, L, K) {
  return new Promise((resolve, reject) => {
    connection.query('CALL UusiKurssi(?, ?, ?)', [N, L, K], (err, results) => {
      if (err) {
        return reject(err);
      }
      resolve(results[0]);
    });
  });
}

module.exports = {
  luoUusiKurssi,
};