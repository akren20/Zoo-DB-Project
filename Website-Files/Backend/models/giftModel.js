// backend/models/giftsModel.js
import pool from '../zoodb.js';

class GiftsModel {
  static async findAllGifts() {
    try {
      const [results, _] = await pool.query(`SELECT * FROM gift_shop;`);
      return results;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all gifts');
    }
  }

  // Assuming update and delete methods
  static async updateGiftShopItem(id, itemData) {
    // SQL to update an item
  }

  static async deleteGiftShopItem(id) {
    // SQL to delete an item
  }
}

export default GiftsModel;
