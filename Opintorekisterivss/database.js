const mysql = require('mysql2');
const connection = mysql.createPool({
   host: 'localhost',
   user: 'Testi_Teemu',
   password: 'xxx',
   database: 'testi_db2'
});
module.exports = connection;
