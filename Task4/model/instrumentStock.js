// here we define properties of an instrument. Our Controller and DAO uses this

import { getInstrumentStocks } from "../integration/instrumentDAO.js"

export const InstrumentStock = {}

// get
InstrumentStock.getAll = async () => {
    const res = await getInstrumentStocks();
    const instrumentStocks = res.rows.map((e)=>{
        return {
            id: e.id,
            type: e.type,
            brand: e.brand,
            renting_price: e.renting_price
        }
    })
    return instrumentStocks;
}


// create

// update

// delete

