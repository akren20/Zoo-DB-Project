// backend/models/itemsModel.js
const pool = require( '../zoodb.js');

class EventsModel {
  static async findAllAnimals() {
    try {
      const [result] = await pool.query(`SELECT * FROM event;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

module.exports.default  = EventsModel;