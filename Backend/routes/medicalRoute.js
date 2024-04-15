// backend/routes/adminRoute.js include admin controller file down below
import MedicalController from'../controllers/medicalController.js';

function medicalRoute(req, res, path, method) {
  res.writeHead(200, {
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": "*"
  });
  
  if (path === '/api/admin/medical' && method === 'GET') {
    MedicalController.getAllMedicals(req,res);
  } 
  else if (path === '/api/medical' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    MedicalController.createItem(req,res,itemData);
  } 
  else if (path === '/api/medical' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    MedicalController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
export default medicalRoute;