// methods that come from View

import { InstrumentStock } from "../model/instrumentStock.js";
import { InstrumentType } from "../model/instrumentType.js";
import { RentingInstrument } from "../model/rentingInstrument.js";
import { Student } from "../model/student.js";


export const getAvailableInstruments = async (studentId, instrymentTypeId) => {
    const instrumentStocks = await InstrumentStock.getAll();
    const rentingInstruments = await RentingInstrument.getAll();
    const instrumentType = await InstrumentType.get(instrymentTypeId);

    if(instrumentType){
        // instruments that have never been rented or their rental is terminated
        const availableInstruments = instrumentStocks.map((instrument)=>{
            if(!rentingInstruments.find((ri)=>(instrument.id==ri.instrument_stock_id) && (ri.is_terminated == false))){
                return instrument;
            }
            else return null
        }).filter(e => (e !== null) && (e.type == instrymentTypeId)); // return only available instruments of a specific type
        
        availableInstruments.forEach(instrument => {
            instrument.type = instrumentType.name;
            instrument.rentThis = `/rentInstrument/${studentId}/${instrument.id}`
        });
    
        return {
            "List of all available instruments of type:": instrumentType.name,
            "instruments:": availableInstruments
        };
    }
    else {
        return {
            "This instrument type does not exist:": instrymentTypeId
        }
    }
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
    const student = await Student.get(studentId);
    if(student){
        let countOfRentedInstruments = 0;
        const rentingInstruments = await RentingInstrument.getAll();
        rentingInstruments.forEach(e => {
           if(e.student_id == studentId && !e.is_terminated)
            countOfRentedInstruments++;
        });
        if(countOfRentedInstruments < 2){
            let isInstrumentAvailable = false;
            
            // see if the instrument exists in our stock
            const instrumentStocks = await InstrumentStock.getAll();
            instrumentStocks.forEach(e => {
                if(e.id == instrumentId){
                    isInstrumentAvailable = true;
                }
            })

            // see if instrument is available
            await rentingInstruments.forEach(e => {
                if(e.instrument_stock_id == instrumentId && !e.is_terminated){
                    isInstrumentAvailable = false;
                }
            });
            if(isInstrumentAvailable){
                const res = await RentingInstrument.create(instrumentId, studentId)
                return {
                    "The rental is sucessfully done": {
                        "studentId":studentId,
                        "instrumentId":instrumentId,
                        "goToProfile": `/students/${studentId}`
                    }
                };
            }
            else {
            return {
                "This instrument does not exist or is not available:": instrumentId
            }
        } 
            
        }
        else {
            return {
                "This student cannot rent any more instruments:": studentId
            }
        } 
    }
    else {
        return {
            "This student does not exist:": studentId
        }
    }
}

export const getStudentInformation = async (studentId) => {
    const student = await Student.get(studentId);
    const rentedInstruments = []
    if(student){
        const rentingInstruments = await RentingInstrument.getAll();
        rentingInstruments.forEach(e => {
           if(e.student_id == studentId && !e.is_terminated){
            e.terminateThisRental = `/terminateRental/${studentId}/${e.id}`      
            rentedInstruments.push(e)
           }
        });
        student.canRentInstrument = rentedInstruments.length >= student.maxNumberOfRentingInstruments ? false : true;
        student.linkToRentalPage = `/instruments/${studentId}/instrumentTypes`;
        student.rentedInstruments = rentedInstruments;
        return student;
    }
    else {
        return {
            "This student does not exist:": studentId
        }
    }
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