// backend/routes/adminRoute.js include admin controller file down below
const GiftController =  require('../controllers/giftController.js');

function giftRoute(req, res, path, method) {
  if (path === '/api/admin/gift' && method === 'GET') {
    GiftController.getAllGifts(req,res);
  } 
  else if (path === '/api/gift' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    AnimalController.createItem(req,res,itemData);
  } 
  else if (path === '/api/gift' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    AnimalController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
module.exports.default  = giftRoute;