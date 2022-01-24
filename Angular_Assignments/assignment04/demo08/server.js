const express = require('express');  
const port=3000;
const cookieParser = require('cookie-parser');  
var app = express();  
app.use(cookieParser());  
app.get('/cookieset',function(req, res){  
res.cookie('cookie_name', 'cookie_value');   
res.cookie('name', 'Mahesh');  
res.status(200).send('Cookie is set');  
});  
app.get('/cookieget', function(req, res) {  
  res.status(200).send(req.cookies);  
});  
app.get('/', function (req, res) {  
  res.status(200).send('Welcome to Cookie section in express');  
});  
app.listen(port,()=>{
    console.log(`Server Started on port${port}`);
});