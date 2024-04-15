// backend/models/itemsModel.js
import pool from '../zoodb.js';

class MedicalsModel {
  static async findAllMedicals() {
    try {
      const [result] = await pool.query(`SELECT * FROM medical;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

export default MedicalsModel;