// backend/routes/adminRoute.js include admin controller file down below
import EmployeeController from  '../controllers/employeeController.js';

function employeeRoute(req, res, path, method) {
  if (path === '/api/admin/employee' && method === 'GET') {
    EmployeeController.getAllEmployees(req,res);
  } 
  else if (path === '/api/employee' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    EmployeeController.createItem(req,res,itemData);
  } 
  else if (path === '/api/employee' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    EmployeeController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
export default employeeRoute;