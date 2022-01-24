const express=require('express');
const port=3000;
const app=express();
var bodyParser=require('body-parser');
const { response } = require('express');
var urlencodedParser=bodyParser.urlencoded({extended:false});
app.use(express.static('public'));
app.get('/',(req,res)=>{
    res.sendFile(__dirname +'/'+"index.html");
});

app.post('/process_post',urlencodedParser,(req,res)=>{
    //json Object of values
    var response={
        firstName:req.body.firstName,
        lastName:req.body.lastName
    };
    console.log(response);
    res.end(JSON.stringify(response));
});

app.listen(port,()=>{
    console.log(`Server Started width port no${port}`);
});