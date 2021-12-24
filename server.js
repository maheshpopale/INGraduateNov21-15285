const express=require('express');
const port=3000;

const app=express();
app.get('/',(req,res)=>{
res.sendFile(__dirname +'/'+"index.html");
});

app.post('/register',(req,res)=>{
    res.sendFile(__dirname +'/'+"success.html");

});
app.listen(port,()=>{
    console.log(`Server started at${port}`);
});