// backend/routes/adminRoute.js include admin controller file down below
import AdminController from '../controllers/adminController.js';

function AdminRoute(req, res, path, method) {
  if (path === '/api/admin/employee' && method === 'GET') {
    AdminController.getAllEmployees(req,res);
  } 
  else if (path === '/api/admin' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    AdminController.createItem(req,res,itemData);
  } 
  else if (path === '/api/admin' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    AdminController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
export default AdminRoute;