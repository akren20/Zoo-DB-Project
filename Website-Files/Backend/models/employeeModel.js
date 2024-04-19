// backend/models/employeesModel.js
import pool from '../zoodb.js';

class EmployeesModel {
  static async findAllEmployees() {
    const [results] = await pool.query('SELECT * FROM employee;');
    return results;
  }

  static async updateEmployee(id, employeeData) {
    const { name, position, salary } = employeeData; // Assuming these fields for simplification
    const sql = 'UPDATE employee SET name = ?, position = ?, salary = ? WHERE id = ?';
    const [result] = await pool.execute(sql, [name, position, salary, id]);
    return { id, ...employeeData };
  }

  static async deleteEmployee(id) {
    const sql = 'DELETE FROM employee WHERE id = ?';
    await pool.execute(sql, [id]);
  }
}

export default EmployeesModel;
