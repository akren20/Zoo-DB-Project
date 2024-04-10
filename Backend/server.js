const express = require('express')
const app = express()
const port = 8383

app.use[express.static('public')]

app.get('/', (req,res) => {
    res.status(200).send('Hello')
})

app.listen(port,() => console.log(`Server has started on port: ${port}`))



// const http = require('http')
// const mysql2=require('mysql2');
// const {getMedicals,getMedical, createMedical} = require('./controllers/')

// const db=mysql2.createPool({
    
// });

// function setCors(res){
//     res.setHeader('Access-Control-Request-Headers','*');
//     res.setHeader('Access-Control-Request-Origin','*');
//     res.setHeader('Access-Control-Request-Method','*');
// }

// const server = http.createServer((req, res) => {
//     setCors(res);
//     if(req.url == '/api/medicals') {
//         getMedicals(req,res)
//     } 
//     else if(req.url.match(/\/api\/medicals\/([0-9]+)/) && req.method == 'GET') {
//         const id = req.url.split('/')
//         getMedicals(req,res,id)
//     }

//     else if(req.url === '/api/medicals' && req.method === 'POST') {
//         createMedical(req,res)
//     }
    
//     else{
//         res.writeHead(404, {'Content-Type': 'application/json' })
//         res.end(JSON.stringify({message:'Route Not Found'}))
//     }

//     map[req.url][req.method](req,res,db);

//     switch(req.method){
//     case 'POST':
//         switch(req.url){
//         case 'api/medical':
//             post_medical(req,res);
            
//             break;
//         }
//         break;
//     case 'GET':
//         break;
//     case 'OPTIONS':
//         res.statusCode=204;
//         res.end();
//     }
// })



// const PORT = process.env.PORT || 5000

// server.listen(PORT, () => console.log(`Server running on port ${PORT}`))

/*
set cors headers
use switch statements
npm install mysql2
create pool/queries
search cors
utility fucntions to compress
*/