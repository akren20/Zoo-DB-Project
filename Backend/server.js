// backend/server.js

import express from 'express'
const app = express()
const port = 5000

// import http from 'http';
// import url from 'url';
// import cors from 'cors';

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
import adminRoute from './routes/adminRoute.js';

import AnimalsController from './controllers/animalController.js';
import CustomersController from './controllers/customerController.js';
import AdminsController from './controllers/adminController.js';
import EmployeesController from './controllers/employeeController.js';
import EventsController from './controllers/eventController.js';
import HabitatsController from './controllers/habitatController.js';
import HealthsController from './controllers/healthController.js';
import MedicalsController from './controllers/medicalController.js';
import GiftsController from './controllers/giftController.js';
import TransactionsController from './controllers/transactionController.js' ;
import FoodsController from './controllers/foodController.js';


app.get('/', (req, res) => {
  res.send('Hello World!')
  // if (method === 'OPTIONS') {
  //   res.writeHead(200);
  //   res.end();
  //   return;

  // } 
  if (path.includes('/api/admin')) {
    if(method =='GET') {AdminsController.getAllAdmins(req,res)};

  } 
  else if (path.includes('/api/animals')) {
    if(method =='GET') AnimalsController.getAllAnimals(req,res);

  } 

  else if (path.includes('/api/customer')) {
    if(method =='GET') CustomersController.getAllCustomers(req,res);
  }

  else if (path.includes('/api/employee')) {
    if(method =='GET') EmployeesController.getAllEmployees(req,res);
    
    } 
  else if (path.includes('/api/event')) {
    if(method =='GET') EventsController.getAllEvents(req,res);
  }
  else if (path.includes('/api/food')) {
    if(method =='GET') FoodsController.getAllFoods(req,res);
  }
  else if (path.includes('/api/gift')) {
    if(method =='GET') GiftsController.getAllGifts(req,res);
  }
  else if (path.includes('/api/habitat')) {
    if(method =='GET') HabitatsController.getAllHabitats(req,res);
  }
  else if (path.includes('/api/health')) {
    if(method =='GET') HealthsController.getAllHealths(req,res);
  }
  else if (path.includes('/api/medical')) {
    if(method =='GET') MedicalsController.getAllMedicals(req,res);
  }
  else if (path.includes('/api/transaction')) {
    if(method =='GET') TransactionsController.getAllTransactions(req,res);
  }
  else {
        res.writeHead(404, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ message: 'Route Not Found' }));

    }
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

app
  .route("api/animals")
  .get((req,res) => {AnimalsController.getAllAnimals(req,res)})
  .put((req,res) => {AnimalsController.getAllAnimals(req,res)});


// app.delete('/api/customers/:id', Class.deleteTuple);


//const corsMiddleware = cors();
// const server = http.createServer(async (req, res) => {
//   //corsMiddleware(req, res, () => {
//   const path = url.parse(req.url, true).path;
//   const method = req.method;

//   // Set CORS headers
//   res.setHeader('Access-Control-Allow-Origin', '*'); // Allows all origins
//   res.setHeader('Access-Control-Allow-Methods', 'OPTIONS, GET, POST, DELETE'); // Specifies the methods allowed when accessing the resource
//   res.setHeader('Access-Control-Allow-Headers', 'Content-Type', 'Authorization'); // Indicates which headers can be used during the actual request

//   console.log(`Route hit: ${path}`);
//   console.log(method);

  // if (method === 'OPTIONS') {
  //   res.writeHead(200);
  //   res.end();
  //   return;

  // } else if (path.includes('/api/admin')) {
  //   if(method =='GET') AdminsController.getAllAdmins(req,res);

  // } 
  // else if (path.includes('/api/animals')) {
  //   if(method =='GET') AnimalsController.getAllAnimals(req,res);

  // } 

  // else if (path.includes('/api/customer')) {
  //   if(method =='GET') CustomersController.getAllCustomers(req,res);
  // }

  // else if (path.includes('/api/employee')) {
  //   if(method =='GET') EmployeesController.getAllEmployees(req,res);
    
  //   } 
  // else if (path.includes('/api/event')) {
  //   if(method =='GET') EventsController.getAllEvents(req,res);
  // }
  // else if (path.includes('/api/food')) {
  //   if(method =='GET') FoodsController.getAllFoods(req,res);
  // }
  // else if (path.includes('/api/gift')) {
  //   if(method =='GET') GiftsController.getAllGifts(req,res);
  // }
  // else if (path.includes('/api/habitat')) {
  //   if(method =='GET') HabitatsController.getAllHabitats(req,res);
  // }
  // else if (path.includes('/api/health')) {
  //   if(method =='GET') HealthsController.getAllHealths(req,res);
  // }
  // else if (path.includes('/api/medical')) {
  //   if(method =='GET') MedicalsController.getAllMedicals(req,res);
  // }
  // else if (path.includes('/api/transaction')) {
  //   if(method =='GET') TransactionsController.getAllTransactions(req,res);
  // }
  // else {
  //       res.writeHead(404, { 'Content-Type': 'application/json' });
  //       res.end(JSON.stringify({ message: 'Route Not Found' }));

  //   }
// });


// const PORT = process.env.PORT || 5000;

// server.listen(PORT, () => console.log(`Server running on port ${PORT}`));



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