// Constants - express init
const express = require('express');
const app = express()

// Constants - connection spec
const PORT = 3000;
const HOST = '0.0.0.0';

// Simple hello world response
app.get('/', (req, res) => res.send('hello world'));

app.listen(PORT, () => {
  console.log(`Hello World REST API running on http://${HOST}:${PORT}`)
});
