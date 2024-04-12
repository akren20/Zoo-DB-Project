// backend/routes/adminRoute.js include admin controller file down below
const HealthController = require('../controllers/healthController.js');

function healthRoute(req, res, path, method) {
  if (path === '/api/admin/health' && method === 'GET') {
    HealthController.getAllHealths(req,res);
  } 
  else if (path === '/api/health' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    HealthController.createItem(req,res,itemData);
  } 
  else if (path === '/api/health' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    HealthController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
module.exports.default  = healthRoute;