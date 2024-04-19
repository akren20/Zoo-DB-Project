// backend/models/adminModel.js
import pool from '../zoodb.js';

class AdminsModel {
  // Method to fetch all employees
  static async findAllEmployees() {
    try {
      // Execute the query safely using parameterized statements
      const [results] = await pool.query('SELECT * FROM employee;');
      return results;
    } catch (err) {
      console.error("Error retrieving employees from database:", err);
      // Rethrow the error or handle it depending on your error handling strategy
      throw new Error('Failed to retrieve employees');
    }
  }
}

export default AdminsModel;
