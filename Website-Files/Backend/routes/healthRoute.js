// backend/routes/healthRoute.js
import HealthsController from '../controllers/HealthController.js';

function healthRoute(req, res, path, method) {
  if (path === '/api/health' && method === 'GET') {
    HealthsController.getAllHealths(req, res);
  } else if (path.match(/^\/api\/health\/\d+$/) && method === 'PUT') {
    const healthId = path.split('/')[3]; // Assuming the health ID is in the URL
    req.body.healthId = healthId; // Add the healthId to the request body for the controller
    HealthsController.updateHealth(req, res);
  } else if (path.match(/^\/api\/health\/\d+$/) && method === 'DELETE') {
    const healthId = path.split('/')[3]; // Assuming the health ID is in the URL
    req.params.healthId = healthId; // Add the healthId to the request params for the controller
    HealthsController.deleteHealth(req, res);
  } else {
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}

export default healthRoute;
