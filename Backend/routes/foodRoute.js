// backend/routes/adminRoute.js include admin controller file down below
const FoodController =  require('../controllers/foodController.js');

function foodRoute(req, res, path, method) {
  if (path === '/api/admin/food' && method === 'GET') {
    FoodController.getAllAnimals(req,res);
  } 
  else if (path === '/api/food' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    FoodController.createItem(req,res,itemData);
  } 
  else if (path === '/api/food' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    FoodController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
module.exports.default = foodRoute;