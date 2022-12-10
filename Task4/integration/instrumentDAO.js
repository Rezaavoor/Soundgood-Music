//pulic methods that run SQL queries

// first step: create a connection to the database

// TODO: turn off autocommit


// ex: getStudentRentingInstruments(int studentId) ...


import PG from 'pg'
const Pool = PG.Pool;
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'sgm',
    password: '12345',
    port: 5432,
})
let client = await pool.connect();


export const getInstrumentStocks = async () => {
    client = await pool.connect();
    let res;
    try {
        await client.query('BEGIN')
        const queryText = `select * from instrument_stock`
        res = await client.query(queryText)
        await client.query('COMMIT')
    } catch (error) {
        res = error
        await client.query('ROLLBACK')
    }
    finally{
        client.release()
        return res
    }
}

export const getRentingInstruments = async () => {
    client = await pool.connect();
    let res;
    try {
        await client.query('BEGIN')
        const queryText = `select * from renting_instrument`
        res = await client.query(queryText)
        await client.query('COMMIT')
    } catch (error) {
        res = error
        await client.query('ROLLBACK')
    }
    finally{
        client.release()
        return res
    }
}

export const getStudents = async () => {
    client = await pool.connect();
    let res;
    try {
        await client.query('BEGIN')
        const queryText = `select * from student`
        res = await client.query(queryText)
        await client.query('COMMIT')
    } catch (error) {
        res = error
        await client.query('ROLLBACK')
    }
    finally{
        client.release()
        return res
    }
}

export const getInstrumentTypes = async () => {
    client = await pool.connect();
    let res;
    try {
        await client.query('BEGIN')
        const queryText = `select * from instrument`
        res = await client.query(queryText)
        await client.query('COMMIT')
    } catch (error) {
        res = error
        await client.query('ROLLBACK')
    }
    finally{
        client.release()
        return res
    }
}

export const insertIntoRentingInstruments = async (instrumentId, studentId) => {
    client = await pool.connect();
    let res;
    try {
        await client.query('BEGIN')
        const queryText = `insert into renting_instrument(
            student_id, instrument_stock_id, renting_start_time, 
            is_terminated, max_renting_time_length
          )
          values
            (${studentId}, ${instrumentId}, now()::timestamp(0), false, 12)`
        res = await client.query(queryText)
        await client.query('COMMIT')
    } catch (error) {
        res = error
        await client.query('ROLLBACK')
    }
    finally{
        client.release()
        return res
    }
}