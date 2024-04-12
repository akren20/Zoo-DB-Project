// backend/models/itemsModel.js
const pool = require( '../zoodb.js');

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

module.exports.default  = HealthsModel;