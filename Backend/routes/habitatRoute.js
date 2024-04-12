// backend/routes/adminRoute.js include admin controller file down below
const HabitatController = require('../controllers/habitatController.js');

function habitatRoute(req, res, path, method) {
  if (path === '/api/admin/habitat' && method === 'GET') {
    HabitatController.getAllHabitats(req,res);
  } 
  else if (path === '/api/habitat' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    HabitatController.createItem(req,res,itemData);
  } 
  else if (path === '/api/habitat' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    HabitatController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
module.exports.default = habitatRoute;