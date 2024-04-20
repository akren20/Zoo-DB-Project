// backend/controllers/eventsController.js
import EventsModel from '../models/eventModel.js';

class EventController {
  static async getAllEvents(req, res) {
    try {
      const events = await EventModel.findAllEvents();
      res.status(200).json(events);
    } catch(err) {
      res.status(500).json({ message: err.message });
    }
  }

  static async updateEvent(req, res) {
    try {
      const { id } = req.params;
      const updatedEvent = await EventModel.updateEvent(id, req.body);
      res.status(200).json(updatedEvent);
    } catch(err) {
      res.status(500).json({ message: err.message });
    }
  }

  static async deleteEvent(req, res) {
    try {
      const { id } = req.params;
      await EventModel.deleteEvent(id);
      res.status(200).json({ message: "Event deleted successfully" });
    } catch(err) {
      res.status(500).json({ message: err.message });
    }
  }
}

export default EventController;
