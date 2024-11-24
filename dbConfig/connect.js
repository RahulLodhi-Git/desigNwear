const mysql = require('mysql2');
const DBSingleConnection = mysql.createConnection({
    host: 'mysqldb',
    user: 'root',
    password: '',
    database: 'desigNwear',
    port: 3306
})

// For pool connection
const DBPool = mysql.createPool({
    host: 'mysqldb',
    user: 'root',
    password: '',
    database: 'desigNwear',
    port: 3306,
    connectionLimit: 10,
    idleTimeoutMillis: 30000, // how long a client is allowed to remain idle before being closed
    connectionTimeoutMillis: 2000, // how long to wait for a connection to be established
})

// check DB is successfully connected 
const isDBConnected = () => {
    return new Promise((resolve, reject) => {
        DBPool.getConnection((err, connection) => {
            if (err) {
                reject(err)
                if (err.code === 'PROTOCOL_CONNECTION_LOST') {
                    console.error('Database connection was closed.')
                }
                if (err.code === 'ER_CON_COUNT_ERROR') {
                    console.error('Database has too many connections.')
                }
                if (err.code === 'ECONNREFUSED') {
                    console.error('Database connection was refused.')
                }
            }
            if (connection) {
                resolve()
                console.log('Database connection was successfully connected.')
                connection.release()
            }

        })
    })
}

/**  
 * Take sql query as a string and return a results.
 * @param {string} queryString
 * @returns {object} return a object which contain two array {result, fields}
*/
const dbQueryHandler = (queryString) => {
    return new Promise((resolve, reject) => {
        DBPool.query(queryString, function (err, result, fields) {
            if (err) reject(err)
            resolve({ result, fields })
            // Do something with result.
        })
    })
}

module.exports = { DBSingleConnection, DBPool, isDBConnected, dbQueryHandler }
