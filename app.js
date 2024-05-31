require('dotenv').config()
const express = require('express');
const notFoundMiddleware = require('./middleware/not-found');
const errorHandlerMiddleware = require('./middleware/error-handler');
const notFoundCustomError = require('./errors/not-found');
const { isDBConnected, dbQueryHandler } = require('./dbConfig/connect');

// const { DBPool, connectDB } = require('./dbConfig/connect');




const app = express();
const port = process.env.PORT || 5000
app.use(express.json()) // to prase a incoming request with json payload and is based on body-parser. 
app.use(express.static("./public")) // to save file in a given path.
app.get('/', (req, res) => {

    res.send('<h1><a href="/api-docs">Api Documentation</a></h1>')
})

// error handler
app.use(notFoundMiddleware)
app.use(errorHandlerMiddleware)

const startServer = async () => {

    try {
        // write a code to connect DB

        await isDBConnected()
        app.listen(port, () => {
            console.log(`server is successfully running on localhost:${port} or 127.0.0.1:${port}`)
        })

    } catch (err) {
        console.error(err);
    }
    try {

        const dbResult = await dbQueryHandler('SELECT * FROM users').then()
        console.log('dbResult', dbResult);
    }
    catch (err) {
        console.log(err)
    }
};

startServer()