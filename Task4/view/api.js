// here we have all express api endpoints that interact with the user

// NO BUSINESS LOGIC HERE

// ex: /getAllInstruments


import { Router } from 'express';
import { getAvailableInstruments, 
    rentInstrument, getStudentInformation,
    getStudentsInformatin, getInstrumentTypes,
    terminateRental } from '../controller/controller.js';

export const router = Router();
router.get('/', (req, res) => res.send('The app is running properly'));


router.get('/students', async (req, res) => {
    const results = await getStudentsInformatin()
    res.json(results)
})

router.get('/students/:studentId', async (req,res)=>{
    const {studentId} = req.params;
    const results = await getStudentInformation(studentId)
    res.json(results)
})

router.get('/instruments/:studentId/instrumentTypes', async (req, res) => {
    const {studentId} = req.params;
    const results = await getInstrumentTypes(studentId)
    res.json( results )
})

router.get('/instruments/:studentId/:instrumentTypeId', async (req, res) => {
    const {studentId, instrumentTypeId} = req.params;
    const results = await getAvailableInstruments(studentId, instrumentTypeId)
    res.json( results )
})

router.get('/rentInstrument/:studentId/:instrumentId', async (req, res) => {
    const {instrumentId, studentId} = req.params;
    const respons = await rentInstrument(instrumentId, studentId);
    res.json( respons )
})

router.get('/terminateRental/:studentId/:instrumentId', async (req, res) => {
    const {instrumentId, studentId} = req.params; 
    const respons = await terminateRental(instrumentId, studentId)
    res.json( respons )
})

