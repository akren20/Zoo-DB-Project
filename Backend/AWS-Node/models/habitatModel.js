// backend/models/habitatsModel.js
import pool from '../zoodb.js';

class HabitatsModel {
  static async findAllHabitats() {
    try {
      const [results, _] = await pool.query(`SELECT * FROM habitat;`);
      return results;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all habitats');
    }
  }
}

export default HabitatsModel;
