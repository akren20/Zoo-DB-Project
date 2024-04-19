// backend/models/eventsModel.js
import pool from '../zoodb.js';

class EventsModel {
  static async findAllEvents() {
    try {
      const [results, _] = await pool.query(`SELECT * FROM events;`);
      return results;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all events');
    }
  }

  static async updateEvent(id, eventData) {
    try {
      const result = await pool.query(`UPDATE events SET ? WHERE id = ?`, [eventData, id]);
      return result[0];
    } catch(err) {
      console.log(err);
      throw new Error('Failed to update event');
    }
  }

  static async deleteEvent(id) {
    try {
      await pool.query(`DELETE FROM events WHERE id = ?`, [id]);
    } catch(err) {
      console.log(err);
      throw new Error('Failed to delete event');
    }
  }
}

export default EventsModel;
