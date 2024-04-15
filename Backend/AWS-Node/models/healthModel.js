// backend/models/itemsModel.js
import pool from '../zoodb.js';

class HealthsModel {
  static async findAllHealths() {
    try {
      const [result] = await pool.query(`SELECT * FROM health;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

export default HealthsModel;