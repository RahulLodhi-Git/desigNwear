require("dotenv").config();
require("express-async-errors");
const express = require("express");
const notFoundMiddleware = require("./middleware/not-found");
const errorHandlerMiddleware = require("./middleware/error-handler");
const { isDBConnected } = require("./dbConfig/connect");
const morgan = require("morgan");
const { log } = require("./utils/helper");
const cookieParser = require('cookie-parser');
const version = "v1";
const authRouter = require("./routes/authRouter");
const userRouter = require("./routes/userRouter")
global.log = log; // adding our custom  console log function in global object of js for colorizing the console.

const app = express();
const port = process.env.PORT || 5000;
app.use(express.json()); // to prase a incoming request with json payload and is based on body-parser.
app.use(express.static("./public")); // to save file in a given path.
app.get("/", (req, res) => {
    res.send('<h1><a href="/api-docs">Api Documentation</a></h1>');
});

app.use(morgan("tiny"));
app.use(cookieParser(process.env.JWT_SECRET))
// routes
app.use(`/api/${version}/auth`, authRouter);
app.use(`/api/${version}/users`, userRouter);


// error handler
app.use(notFoundMiddleware);
app.use(errorHandlerMiddleware);

const startServer = async () => {
    try {
        // write a code to connect DB
        await isDBConnected();
        app.listen(port, () => {
            console.log(
                `server is successfully running on localhost:${port} or 127.0.0.1:${port}`
            );
        });
    } catch (err) {
        console.error(err);
    }
};

startServer();
