// here we define properties of a student. Our Controller and DAO uses this


import { getStudents } from "../integration/instrumentDAO.js"

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
    const res = await getStudents();
    const students = res.rows.map((e)=>{
        return {
            id: e.id,
            name: e.first_name + " " + e.last_name,
            maxNumberOfRentingInstruments: e.max_number_of_renting_instruments
        }
    })
    
    return students.find(t => t.id == id);
}


// create

// update

// delete

