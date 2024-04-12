// backend/server.js
import http from 'http';
import url from 'url';
//const cors = require('cors');

import animalRoute from './routes/animalRoute.js';
import customerRoute from './routes/customerRoute.js';
import employeeRoute from './routes/employeeRoute.js';
import eventRoute from './routes/eventRoute.js';
import foodRoute from './routes/foodRoute.js';
import giftRoute from './routes/giftRoute.js';
import habitatRoute from './routes/habitatRoute.js';
import healthRoute from './routes/healthRoute.js';
import medicalRoute from './routes/medicalRoute.js';
import transactionRoute from './routes/transactionRoute.js';
import fadminRoute from './routes/adminRoute.js';
import AnimalsController from './controllers/animalController.js';

//const corsMiddleware = cors();
const server = http.createServer(async (req, res) => {
  //corsMiddleware(req, res, () => {
  const path = url.parse(req.url, true).path;
  const method = req.method;

  // Set CORS headers
  res.setHeader('Access-Control-Allow-Origin', '*'); // Allows all origins
  res.setHeader('Access-Control-Allow-Methods', 'OPTIONS, GET, POST'); // Specifies the methods allowed when accessing the resource
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type', 'Authorization'); // Indicates which headers can be used during the actual request

  console.log(`Route hit: ${path}`);
  console.log(method);

  if (method === 'OPTIONS') {
    res.writeHead(200);
    res.end();
    return;

  } else if (path.includes('/api/admin')) {
    ItemsRoute(req, res, path, method);

    // add books, ebooks, dvds, and more items


    // add printers, laptops, and more ultilies



  } else if (path.includes('/api/animals')) {
    if(method=='GET') AnimalsController.getAllAnimals(req,res);

  } else if (path.includes('/api/closure')) {

  } else if (path.includes('/api/customer')) {

  } else if (path.includes('/api/customer')) {

  }

    else if (path.includes('/api/employee')) {

    
      } 
    else if (path.includes('/api/event')) {
    }
    else if (path.includes('/api/food')) {

    }
    else if (path.includes('/api/gift')) {

    }
    else if (path.includes('/api/habitat')) {

    }
    else if (path.includes('/api/health')) {

    }
    else if (path.includes('/api/medical')) {

    }
    else if (path.includes('/api/transaction')) {

    }
    else {
        res.writeHead(404, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ message: 'Route Not Found' }));

    }
});

//});

const PORT = process.env.PORT || 5000;

server.listen(PORT, () => console.log(`Server running on port ${PORT}`));



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