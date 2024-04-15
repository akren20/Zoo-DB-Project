// backend/models/itemsModel.js
import pool from '../zoodb.js';

class GiftsModel {
  static async findAllGifts() {
    try {
      const [result] = await pool.query(`SELECT * FROM gift_shop;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

export default GiftsModel;