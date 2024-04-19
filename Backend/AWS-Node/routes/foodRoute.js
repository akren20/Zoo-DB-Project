// backend/routes/adminRoute.js
import FoodController from '../controllers/foodController.js';

function foodRoute(req, res, path, method) {
  if (path === '/api/admin/food' && method === 'GET') {
    FoodController.getAllFoods(req, res);  // Corrected method name
  } else if (path === '/api/food' && method === 'POST') {
    const foodData = JSON.parse(req.body);
    FoodController.createFood(req, res, foodData);  // Assuming there is a 'createFood' method
  } else if (path === '/api/food/:id' && method === 'DELETE') {
    const { id } = req.params;
    FoodController.deleteFoodShopItem(req, res, id);  // Corrected to handle deletion with ID
  } else {
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}

export default foodRoute;
