// backend/models/itemsModel.js
import pool from '../zoodb.js';

class HabitatsModel {
  static async findAllhabitats() {
    try {
      const [result] = await pool.query(`SELECT * FROM habitat;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

export default HabitatsModel;