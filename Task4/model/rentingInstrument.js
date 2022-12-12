// here we define properties of a renting instrument. Our Controller and DAO uses this

import { getRentingInstruments, insertIntoRentingInstruments, setRentingInstrumentToTerminated } from "../integration/instrumentDAO.js"

export const RentingInstrument = {}

// get
RentingInstrument.getAll = async () => {
    const res = await getRentingInstruments();
    const rentingInstruments = res.rows.map((e)=>{
        return {
            id: e.id,
            student_id: e.student_id,
            instrument_stock_id: e.instrument_stock_id,
            renting_start_time: e.renting_start_time,
            is_terminated: e.is_terminated,
            max_renting_time_length: e.max_renting_time_length
        }
    })
    return rentingInstruments;
}

// create
RentingInstrument.create = async (instrumentId, studentId) => {
    const res = await insertIntoRentingInstruments(instrumentId, studentId);
    return res;
}


// update
RentingInstrument.update = async (instrumentId, studentId) => {
    const res = await setRentingInstrumentToTerminated(instrumentId)
    return res;
}

// delete
