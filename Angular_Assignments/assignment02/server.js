const express=require('express');
const port=3000;
const app=express();
app.get('/',(req,res)=>{
res.send("Called :GET");
});
app.post('/post',(req,res)=>{
    res.send("Called:POST");
});
app.put('/put',(req,res)=>{
    res.send("Called:PUT");
});
app.delete('/delete',(req,res)=>{
    res.send("Called:DELETE");
})
app.listen(port,()=>{
    console.log(`Server started${port}`);
});
