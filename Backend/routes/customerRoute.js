// backend/routes/adminRoute.js include admin controller file down below
const CustomerController =  require('../controllers/customerController.js');

function customerRoute(req, res, path, method) {
  if (path === '/api/admin/customer' && method === 'GET') {
    CustomerController.getAllCustomers(req,res);
  } 
  else if (path === '/api/customer' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    CustomerController.createItem(req,res,itemData);
  } 
  else if (path === '/api/customer' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    CustomerController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
module.exports.default = customerRoute;