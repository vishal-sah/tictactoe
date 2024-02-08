const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require('./models/room');

var io = require("socket.io")(server);

// Middleware
app.use(express.json());

const DB = "mongodb+srv://Vishal_Sah:VishalSah123@cluster0.ccxvdm9.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
    console.log("connected!");

    socket.on("createRoom", async ({nickname}) => {
        console.log("Nickname:", nickname);

        try {
            let room = new Room();
            let player = {
                nickname,
                socketId: socket.id,
                playerType: 'X',
            };

            room.players.push(player);
            room.turn = player;

            console.log(room);
            room = await room.save();

            const roomId = room._id.toString();

            socket.join(roomId);

            io.to(roomId).emit("createRoomSuccess", room);
        } catch (error) {
            console.log(error);
        }
    });

    socket.on("joinRoom", async ({nickname, roomId}) => {
        try {
            if(!roomId.match(/^[0-9a-fA-F]{24}$/)) {
                socket.emit('errorOccurred', 'Please enter a valid room ID.');
                return;
            }

            let room = await Room.findById(roomId);
            if(room.isJoin) {
                let player = {
                    nickname,
                    socketId: socket.id,
                    playerType: 'O',
                };
                socket.join(roomId);
                room.players.push(player);
                room.isJoin = false;
                room = await room.save();
                io.to(roomId).emit("joinRoomSuccess", room);
                io.to(roomId).emit("updatePlayers", room.players);
            }
            else {
                socket.emit('errorOccurred', 'The game is in progress, try again later.');
            }
        } catch (error) {
            console.log(error);
        }
    });
    
});

  

mongoose.connect(DB).then(() => {
    console.log('DB Connected');
}).catch((err) => {
    console.log(err);
});

server.listen(port, "0.0.0.0", () => {
    console.log(`Server Started and running on port ${port}`);
});