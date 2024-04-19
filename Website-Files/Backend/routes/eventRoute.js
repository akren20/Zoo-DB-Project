// backend/routes/adminRoute.js
import EventsController from '../controllers/eventsController.js';

function eventRoute(req, res, path, method) {
  if (path === '/api/events' && method === 'GET') {
    EventsController.getAllEvents(req, res);
  } else if (path === '/api/events' && method === 'POST') {
    const eventData = JSON.parse(req.body);
    EventsController.updateEvent(req, res, eventData);  // Assuming this is to update
  } else if (path === '/api/events/:id' && method === 'DELETE') {
    EventsController.deleteEvent(req, res);
  } else {
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}

export default eventRoute;
