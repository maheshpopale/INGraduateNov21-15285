const express=require('express');
const port=3000;

const app=express();
app.get('/',(req,res)=>{
    const method=req.method;//GET/PUT/POST/DELETE

    const url=req.baseUrl;

    // resp.setHeader('Content-Type','text/html');

    res.setHeader('Content-Type','application/json');
    
    const message={"Method":method,"URL":url};//JSON object 

    res.send("msg "+url);
});
app.listen(port,()=>{
    console.log(`Server started at port${port}`);
});