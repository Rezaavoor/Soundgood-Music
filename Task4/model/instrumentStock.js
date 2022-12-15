// here we define properties of an instrument. Our Controller and DAO uses this

import { getInstrumentStocks, getAvailableInstrumentsByTypeId } from "../integration/DAO.js"
import { InstrumentType } from "./instrumentType.js";

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

InstrumentStock.getAllAvailableByTypeId = async (typeId) => {
    const typeName = (await InstrumentType.get(typeId)).name;
    if(typeName){
        const res = await getAvailableInstrumentsByTypeId(typeId);
        const availableInstruments = res.rows.map((e)=>{
            return{
                ...e,
                type: typeName
            }
        })
        return availableInstruments
    }
}


// create

// update

// delete

