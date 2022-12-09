// here we have all express api endpoints that interact with the user

// NO BUSINESS LOGIC HERE

// ex: /getAllInstruments


import { Router } from 'express';
import  { testDB, getAvailableInstruments } from '../integration/instrumentDAO.js'

export const router = Router();
router.get('/', (req, res) => res.send('The app is running properly'));

router.get('/getAvailableInstruments', async (req, res) => {
    const results = await getAvailableInstruments()
    res.json( results )
})

router.post('/rentInstrument', (req, res) => {
    console.log(req.body);
    res.json(req.body)
})

router.post('/terminateRental', (req, res) => {
    console.log(req.body);
    res.json(req.body)
})

router.get('/testDB', async (req, res) => {
    const results = await testDB();
    res.send(results.rows);
})