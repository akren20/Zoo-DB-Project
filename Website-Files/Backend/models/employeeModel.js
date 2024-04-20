import pool from '../zoodb.js';

class EmployeesModel {
  static async findAllEmployees() {
    const [results] = await pool.query('SELECT * FROM employee;');
    return results;
  }

  static async createEmployee(employeeData) {
    const { name, position, salary, employee_age, employee_gender, employee_dob, employee_ssn } = employeeData;
    const sql = `INSERT INTO employee (name, position, salary, employee_age, employee_gender, employee_dob, employee_ssn) VALUES (?, ?, ?, ?, ?, ?, ?)`;
    const [result] = await pool.execute(sql, [name, position, salary, employee_age, employee_gender, employee_dob, employee_ssn]);
    return { id: result.insertId, ...employeeData };
  }

  static async updateEmployee(id, employeeData) {
    const { name, position, salary } = employeeData;
    const sql = 'UPDATE employee SET name = ?, position = ?, salary = ? WHERE employee_id = ?';
    await pool.execute(sql, [name, position, salary, id]);
    return { id, ...employeeData };
  }

  static async deleteEmployee(id) {
    const sql = 'DELETE FROM employee WHERE employee_id = ?';
    await pool.execute(sql, [id]);
  }
}

export default EmployeesModel;
