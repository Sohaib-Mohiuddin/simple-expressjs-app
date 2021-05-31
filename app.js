// Constants - express init
const express = require('express');
const path = require('path')
const app = express()

// Constants - connection spec
const PORT = 3000;
const HOST = '0.0.0.0';

// Simple hello world response
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Hello World REST API running on http://${HOST}:${PORT}`)
});
