// backend/routes/medicalRoute.js
import MedicalController from '../controllers/medicalsController.js';

function medicalRoute(req, res, path, method) {
  if (path.match(/^\/api\/medical\/?$/) && method === 'GET') {
    MedicalController.getAllMedicals(req, res);
  } else if (path.match(/^\/api\/medical\/?$/) && method === 'POST') {
    let body = '';
    req.on('data', chunk => {
      body += chunk.toString();
    });
    req.on('end', () => {
      const medicalData = JSON.parse(body);
      MedicalController.createMedical(req, res, medicalData);
    });
  } else if (path.match(/^\/api\/medical\/(\d+)\/?$/) && method === 'DELETE') {
    const matches = path.match(/^\/api\/medical\/(\d+)\/?$/);
    const medicalId = matches[1];  // Extract ID from path
    MedicalController.deleteMedical(req, res, medicalId);
  } else if (path.match(/^\/api\/medical\/(\d+)\/?$/) && method === 'PATCH') {
    const matches = path.match(/^\/api\/medical\/(\d+)\/?$/);
    const medicalId = matches[1];  // Extract ID from path
    let body = '';
    req.on('data', chunk => {
      body += chunk.toString();
    });
    req.on('end', () => {
      const updatedData = JSON.parse(body);
      MedicalController.updateMedical(req, res, { medicalId, updatedData });
    });
  } else {
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}

export default medicalRoute;
