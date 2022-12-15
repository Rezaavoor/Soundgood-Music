//pulic methods that run SQL queries


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

export const getStudentById = async (id) => {
    client = await pool.connect();
    let res;
    try {
        await client.query('BEGIN')
        const queryText = `select * from student where id=${id}`
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

export const getRentedInstrumentsByStudentId = async (id) => {
    client = await pool.connect();
    let res;
    try {
        await client.query('BEGIN')
        const queryText = `select * from renting_instrument where student_id=${id} and is_terminated=false`
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

export const createRentingInstruments = async (instrumentId, studentId) => {
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

    export const updateRentingInstrumentToTerminated = async (id) => {
        client = await pool.connect();
        let res;
        try {
            await client.query('BEGIN')
            let queryText = `update renting_instrument set is_terminated = true where id=${id}`
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

    export const getAvailableInstrumentsByTypeId = async (typeId) => {
        client = await pool.connect();
        let res;
        try {
            await client.query('BEGIN')
            let queryText = `select iss.id, iss.type, iss.brand, iss.renting_price from instrument_stock as iss
            left join
            (select * from renting_instrument where is_terminated is false) as ri 
            on iss.id=ri.instrument_stock_id where ri.instrument_stock_id is null and type=${typeId}`
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