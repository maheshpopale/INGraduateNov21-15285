const { response } = require('express');
const express=require('express');
const port=3000;
const app=express();
app.get('/',(req,res)=>{
    console.log("Got a get request for the homepage");
    res.send("Welcome to the Express Routing");
});
app.post('/',(req,res)=>{
    console.log("Got a post request for the homepage");
    res.send("I aM not executable");
});
app.delete('/delete_std',(req,res)=>{
    console.log("Got a Delete request for /delete_std");
    res.send("i am deleted");
});
app.get('/enrolled_std',(req,res)=>{
    console.log("Got a get request for enrolled_std");
    res.send("I am an enrolled std");
});

app.listen(port,()=>{
    console.log(`Server Started on port${port}`);
});