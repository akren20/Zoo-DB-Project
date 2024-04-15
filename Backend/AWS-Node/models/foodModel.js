// backend/models/itemsModel.js
import pool from '../zoodb.js';

class FoodsModel {
  static async findAllFoods() {
    try {
      const [result] = await pool.query(`SELECT * FROM food_shop;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

export default FoodsModel;