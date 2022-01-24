const express=require('express');
const server=express();
const port=3000;
const cors=require('cors');
const { nextTick } = require('process');
const corsOptions={
    origin:"http://localhost:4200",
    optionsSuccessStatus:200
};
server.use(express.json());
server.use(express.urlencoded({extended:true}));
server.use(cors(corsOptions));

const USERS=[
    {id:101,name:'Mahesh'},
    {id:102,name:'Yugandhara'},
    {id:103,name:'Rupali'},
    {id:104,name:'ABC'},
    
];
server.get('/',(req,res)=>{
    res.setHeader("Content-Type","application/json");
    res.send("Welcome");
});
server.get('/users',(req,res)=>{
    res.setHeader("Content-Type","application/json");
    res.send(USERS);
});
server.post('/user/',(req,res)=>{
    res.setHeader("Content-Type","application/json");
    const user=req.body;
    books.push(user);
 res.send(JSON.stringify(user)+" added in book list");
});

server.listen(port,()=>{
    console.log(`Server Started on Port${port}`);

});