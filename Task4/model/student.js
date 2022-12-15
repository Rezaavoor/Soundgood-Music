// here we define properties of a student. Our Controller and DAO uses this

import { getStudents, getStudentById, getRentedInstrumentsByStudentId } from "../integration/DAO.js"

export const Student = {}

// get
Student.getAll = async () => {
    const res = await getStudents();
    const students = res.rows.map((e)=>{
        return {
            id: e.id,
            name: e.first_name + " " + e.last_name,
            max_number_of_renting_instruments: e.max_number_of_renting_instruments
        }
    })
    return students;
}

Student.get = async (id) => {
    const resStudent = await getStudentById(id);
    const resInstruments = await getRentedInstrumentsByStudentId(id);
    const instruments = resInstruments.rows.map(e=>{
        return {
            ...e,
            terminateThisRental: `/terminateRental/${id}/${e.id}`
        }

    })
   
    const student = {
        id: resStudent.rows[0].id,
        name: resStudent.rows[0].first_name + " " + resStudent.rows[0].last_name,
        maxNumberOfRentingInstruments: resStudent.rows[0].max_number_of_renting_instruments,
        canRentInstruments: instruments.length >= resStudent.rows[0].max_number_of_renting_instruments ? false : true,
        linkToRentalPage: `/instruments/${id}/instrumentTypes`,
        rentedInstruments: instruments
    }
    return student;
}


// create

// update

// delete

