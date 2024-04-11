// backend/models/itemsModel.js
import pool from '../zoodb.js';

class CustomersModel {
  static async findAllCustomers() {
    try {
      const [result] = await pool.query(`SELECT * FROM customer;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

export default CustomersModel;