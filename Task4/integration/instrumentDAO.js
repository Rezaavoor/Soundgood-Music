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


export const getAvailableInstruments = async () => {
    client = await pool.connect();
    let res;
    try {
        await client.query('BEGIN')
        const queryText = `select * from instrument_stock as iss
        left join renting_instrument as ri on iss.id=ri.instrument_stock_id
        where ri.instrument_stock_id is null or ri.is_terminated is true`
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


export const testDB = async () => {
    return await client.query('SELECT * FROM student');
}