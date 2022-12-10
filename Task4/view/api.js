// here we have all express api endpoints that interact with the user

// NO BUSINESS LOGIC HERE

// ex: /getAllInstruments


import { Router } from 'express';
import { getAvailableInstruments, rentInstrument } from '../controller/controller.js';

export const router = Router();
router.get('/', (req, res) => res.send('The app is running properly'));

router.post('/listInstruments', async (req, res) => {
    const {instrumentTypeId} = req.body;
    const results = await getAvailableInstruments(instrumentTypeId)
    res.json( results )
})

router.post('/rentInstrument', async (req, res) => {
    const {instrumentId, studentId} = req.body;
    const respons = await rentInstrument(instrumentId, studentId);
    res.json( respons )
})

router.post('/terminateRental', (req, res) => {
    console.log(req.body);
    res.json(req.body)
})