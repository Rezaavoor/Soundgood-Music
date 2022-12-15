// methods that come from View

import { InstrumentStock } from "../model/instrumentStock.js";
import { InstrumentType } from "../model/instrumentType.js";
import { RentingInstrument } from "../model/rentingInstrument.js";
import { Student } from "../model/student.js";


export const getAvailableInstruments = async (studentId, instrumentTypeId) => {

    const availableInstruments = await InstrumentStock.getAllAvailableByTypeId(instrumentTypeId);
    
    availableInstruments.forEach(instrument => {
        instrument.rentThis = `/rentInstrument/${studentId}/${instrument.id}`
    });

    return {
        "List of all available instruments of this type:":
        availableInstruments
    };    
}

export const getInstrumentTypes = async (studentId) => {
    const instrumentTypes = await InstrumentType.getAll();
    const results = instrumentTypes.map(i => {
        return {
            name: i.name,
            rentThisTypeOfInstrument: `/instruments/${studentId}/${i.id}`
        }
    })
    return { "List of all available instruments that you can rent":results}
}


export const rentInstrument = async (instrumentId, studentId) => {
    const res = await RentingInstrument.create(instrumentId, studentId)
    return {
        "The rental is sucessfully done": {
            "studentId":studentId,
            "instrumentId":instrumentId,
            "goToProfile": `/students/${studentId}`
        }
    };
}

export const getStudentInformation = async (studentId) => {
    const student = await Student.get(studentId);
    
    return student;
    
}

export const getStudentsInformatin = async () => {
    const students = await Student.getAll();
    const results = students.map(s=>{
        return {
            name: s.name,
            linkToProfile: `/students/${s.id}`
        }
    })
    return {
        "list of all students:": results
    }
}

export const terminateRental = async (instrumentId, studentId) => {
    const res = RentingInstrument.update(instrumentId);
    return {
        "The rental is sucessfully terminated": {
            "studentId":studentId,
            "instrumentId":instrumentId,
            "goToProfile": `/students/${studentId}`
        }
    };
}