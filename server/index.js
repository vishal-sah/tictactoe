const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require('socket.io')(server);

// Middleware
app.use(express.json());

const DB = "mongodb+srv://Vishal_Sah:VishalSah123@cluster0.ccxvdm9.mongodb.net/?retryWrites=true&w=majority";

io.on('connection', (socket) => {
    console.log('User Connected');
});

mongoose.connect(DB).then(() => {
    console.log('DB Connected');
}).catch((err) => {
    console.log(err);
});

server.listen(port, "0.0.0.0", () => {
    console.log(`Server Started and running on port ${port}`);
});