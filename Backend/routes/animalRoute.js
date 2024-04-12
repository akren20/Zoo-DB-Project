// backend/routes/adminRoute.js include admin controller file down below
import AnimalController from '../controllers/animalController.js';

function animalRoute(req, res, path, method) {
  res.writeHead(200, {
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": "*"
  });
  
  if (path === '/api/admin/animal' && method === 'GET') {
    AnimalController.getAllAnimals(req,res);
  } 
  else if (path === '/api/animal' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    AnimalController.createItem(req,res,itemData);
  } 
  else if (path === '/api/animal' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    AnimalController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
export default animalRoute;