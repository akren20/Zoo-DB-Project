// backend/models/itemsModel.js
import pool from '../zoodb.js';

class TransactionsModel {
  static async findAllTransactions() {
    try {
      const [result] = await pool.query(`SELECT * FROM transaction;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

export default TransactionsModel;