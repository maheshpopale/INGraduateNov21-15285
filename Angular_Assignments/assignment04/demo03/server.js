const { response } = require('express');
const express=require('express');
const port=3000;

const app=express();
app.get('/',(req,res)=>{
    res.sendFile(__dirname +'/'+"index.html");

});
app.get('/process_get', function (req, res) {  
     var response = {  
           first_name:req.query.firstName,  
           last_name:req.query.lastName  
       };  
    console.log(response);
    res.end(JSON.stringify(response));
})
app.listen(port,()=>{
    console.log(`Server started at port${port}`);
});