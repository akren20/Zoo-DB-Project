// backend/models/itemsModel.js
const pool = require( '../zoodb.js');

class AnimalModel {
  static async findAllAnimals() {
    try {
      const [result] = await pool.query(`SELECT * FROM animal;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

module.exports.default  = AnimalModel;