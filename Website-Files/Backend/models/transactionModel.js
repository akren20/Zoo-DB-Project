// backend/models/transactionModel.js
import pool from '../zoodb.js';

class TransactionModel {
  static async findAllTransactions() {
    try {
      const [results, _] = await pool.query(`SELECT * FROM transaction;`);
      return results;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all transactions');
    }
  }

  static async insertTransaction(transactionData) {
    try {
      const sql = `INSERT INTO transaction SET ?;`;
      const [result] = await pool.query(sql, transactionData);
      return result.insertId;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to insert transaction');
    }
  }

  static async updateTransaction(transactionId, updatedData) {
    try {
      const sql = `UPDATE transaction SET ? WHERE transaction_id = ?;`;
      await pool.query(sql, [updatedData, transactionId]);
    } catch(err) {
      console.log(err);
      throw new Error('Failed to update transaction');
    }
  }

  static async deleteTransaction(transactionId) {
    try {
      const sql = `DELETE FROM transaction WHERE transaction_id = ?;`;
      await pool.query(sql, [transactionId]);
    } catch(err) {
      console.log(err);
      throw new Error('Failed to delete transaction');
    }
  }
}

export default TransactionModel;
