// backend/controllers/animalController.js
import EventsModel from '../models/eventModel.js';

class EventsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllEvents(req, res) {
    try {
      const items = await AnimalsModel.findAllEvents();

      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      
      res.end(JSON.stringify(items));

    } catch(err) {
      // set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // send error
      res.end(JSON.stringify({ message: err.message }));

    }
  }
  static async updateEvent(req, res) {
    try {
      const { id } = req.params;
      const updatedEvent = await EventsModel.updateEvent(id, req.body);

      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      
      res.end(JSON.stringify(updatedEvent));

    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error message
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  // @desc  Delete Event
  // @route DELETE /api/events/:id
  static async deleteEvent(req, res) {
    try {
      const { id } = req.params;
      const deletedEvent = await EventsModel.deleteEvent(id);

      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      
      res.end(JSON.stringify(deletedEvent));

    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error message
      res.end(JSON.stringify({ message: err.message }));
    }
  }

}

export default EventsController;