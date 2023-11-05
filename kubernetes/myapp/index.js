const express = require('express')
const app = express()
app.get('/', (req,res) => res.send('Hello world - first kube container'))
app.listen(8083, '0.0.0.0', () => console.log('Example app listening on port something 8083'))