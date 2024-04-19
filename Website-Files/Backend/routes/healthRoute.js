// backend/routes/habitatRoute.js
import HabitatController from '../controllers/habitatsController.js';

function habitatRoute(req, res, path, method) {
  if (path === '/api/admin/habitat' && method === 'GET') {
    HabitatController.getAllHabitats(req, res);
  } else if (path === '/api/habitat' && method === 'POST') {
    const habitatData = JSON.parse(req.body);
    HabitatController.createHabitat(req, res, habitatData);  // Assuming a createHabitat method exists
  } else if (path === '/api/habitat/:id' && method === 'DELETE') {
    HabitatController.deleteHabitat(req, res);
  } else {
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}

export default habitatRoute;
