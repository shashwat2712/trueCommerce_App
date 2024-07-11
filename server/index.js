const express = require('express')
const mongoose = require('mongoose')
//it is analogous to import/package:express.dart as express


//Imports from other files
const authRouter = require('./routes/auth');

//INIT
const PORT = 5010;
const app = express();
const DB = "mongodb+srv://shashwatsaivyas:9827591825a@cluster0.ecndkbx.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"


//middleware
app.use(express.json());
app.use(authRouter);



//connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successful')
}).catch((e)=>{
    console.log(e);
})


app.listen(PORT, "0.0.0.0",() =>{
    console.log(`connected at port ${PORT} hello`);
});



//when you call the app.listen() method, 
//you are instructing the Express application to start
//a server and listen for incoming HTTP requests on a 
//specified port
// the app.listen() function is used to start the
//  server and make it listen on a specified port
//   (in this case, port 3000).
//  The optional callback function is executed once
//   the server is successfully started.

//creating an api
//Get Push Post Delete update
//http://<youripaddress>/hello-world
//app.get("/",(req ,res)=>{
//    res.json({name:"this is shashwat sai vyas"});
//});
//app.get("/shash",(req,res)=>{
//    res.json({name: "Shashwat Sai Vyas"});
//})


 
