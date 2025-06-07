var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');


var opintojaksoRouter = require('./routes/opintojakso');
var opiskelijaRouter = require('./routes/opiskelija');
var suoritusRouter = require('./routes/suoritus');
var arviointiRouter = require('./routes/arviointi');
var kurssiRouter = require('./routes/kurssi');



var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/opintojakso', opintojaksoRouter);
app.use('/opiskelija', opiskelijaRouter);
app.use('/suoritus', suoritusRouter);
app.use('/arviointi', arviointiRouter);
app.use('/kurssi', kurssiRouter);


module.exports = app;
