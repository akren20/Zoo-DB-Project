// backend/routes/adminRoute.js include admin controller file down below
const EventController = require('../controllers/eventController.js');

function eventRoute(req, res, path, method) {
  if (path === '/api/admin/event' && method === 'GET') {
    EventController.getAllEvents(req,res);
  } 
  else if (path === '/api/event' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    EventController.createItem(req,res,itemData);
  } 
  else if (path === '/api/event' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    EventController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
module.exports.default = eventRoute;