// backend/models/itemsModel.js
const pool = require( '../zoodb.js');

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