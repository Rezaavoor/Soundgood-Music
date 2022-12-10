// here we define properties of an instrument type. Our Controller and DAO uses this

import { getInstrumentTypes } from "../integration/instrumentDAO.js"

export const InstrumentType = {}

// get
InstrumentType.getAll = async () => {
    const res = await getInstrumentTypes();
    const instrumentTypes = res.rows.map((e)=>{
        return {
            id: e.id,
            name: e.name,
        }
    })
    return instrumentTypes;
}

InstrumentType.get = async (id) => {
    const res = await getInstrumentTypes();
    const instrumentTypes = res.rows.map((e)=>{
        return {
            id: e.id,
            name: e.name,
        }
    })
    
    return instrumentTypes.find(t => t.id == id);
}


// create

// update

// delete

