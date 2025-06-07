const express = require('express');
const router = express.Router();
const { luoUusiKurssi } = require('../models/kurssiModel');

router.post('/', async (req, res) => {
  const { N, L, K } = req.body;

  if (!N || !L || !K) {
    return res.status(400).json({ error: 'Puuttuva parametri' });
  }

  try {
    const tulos = await luoUusiKurssi(N, L, K);
    res.json(tulos);
  } catch (error) {
    console.error('Tietokantavirhe:', error);
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;