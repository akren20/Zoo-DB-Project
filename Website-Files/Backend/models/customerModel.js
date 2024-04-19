// backend/models/customersModel.js
import pool from '../zoodb.js';

class CustomersModel {
  static async findAllCustomers() {
    try {
      const [results] = await pool.query('SELECT * FROM customer;');
      return results;
    } catch(err) {
      console.error('Error retrieving customers:', err);
      throw new Error('Failed to retrieve customers');
    }
  }

  static async updateCustomer(customerId, updatedData) {
    const sql = `UPDATE customer SET ? WHERE customer_id = ?`;
    await pool.query(sql, [updatedData, customerId]);
  }

  static async deleteCustomer(customerId) {
    const sql = `DELETE FROM customer WHERE customer_id = ?`;
    await pool.query(sql, [customerId]);
  }
}

export default CustomersModel;
