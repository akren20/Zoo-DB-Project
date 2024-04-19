// backend/models/foodsModel.js
import pool from '../zoodb.js';

class FoodsModel {
  static async findAllFoods() {
    try {
      const [results, _] = await pool.query(`SELECT * FROM food_shop;`);
      return results;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all foods');
    }
  }
}

export default FoodsModel;
