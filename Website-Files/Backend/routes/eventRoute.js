// backend/routes/adminRoute.js
import EventController from '../controllers/eventController.js';

function eventRoute(req, res, path, method) {
  if (path === '/api/events' && method === 'GET') {
    EventController.getAllEvents(req, res);
  } else if (path === '/api/events' && method === 'POST') {
    const eventData = JSON.parse(req.body);
    EventController.updateEvent(req, res, eventData);  // Assuming this is to update
  } else if (path === '/api/events/:id' && method === 'DELETE') {
    EventController.deleteEvent(req, res);
  } else {
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}

export default eventRoute;
