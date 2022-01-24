const express=require('express');
const port=3000;

const app=express();
app.get('/',(req,res)=>{
    res.sendFile(__dirname+'/'+"index.html");

});
app.get('/process_get',(req,res)=>{
    res.send('<p>FirstName:'+req.query['firstName'] +'</p> <p>LastName:'+req.query['lastName']+'</p> <p>Password:'+req.query['password']+'</p> <p>Gender:'+req.query['sex']);
});
app.listen(port,()=>{
    console.log(`Server started with port no${port}`);
});