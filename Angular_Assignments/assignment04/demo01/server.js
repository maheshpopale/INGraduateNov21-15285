const express=require('express');
const port=3000;

const app=express();
app.get('/',(req,res)=>{
    res.send("Welcome in Express js Tutorial");
});

app.listen(port,()=>{
    console.log(`Server Started at${port}`);
});