
// -------------------------------------        STARTUP         ----------------------------------------------
// express app starts here


import express from 'express';
import bodyParser from 'body-parser';
import { router } from './view/api.js';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({ extended: false}));
app.use(bodyParser.json());
app.use('/', router)




app.listen(PORT, console.log('Server started in port: ' + PORT));