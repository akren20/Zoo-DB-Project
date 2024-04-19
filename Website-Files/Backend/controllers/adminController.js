// backend/controllers/adminsController.js
import AdminsModel from '../models/adminModel.js';
import pool from '../zoodb.js'; // Make sure your database connection is properly set up

class AdminsController {
  // Gets All Employees
  static async getAllEmployees(req, res) {
    try {
      const employees = await AdminsModel.findAllEmployees();
      res.status(200).json(employees);
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  }

  // Add a new employee
  static async addEmployee(req, res) {
    try {
      const { employee_name, employee_age, employee_gender, employee_dob, employee_ssn, employee_hours_worked, employee_salary, hourly_rate, overtime_hours, employee_dept, employee_type, employee_role, employee_phone, employee_email, employee_address } = req.body;
      const sql = `INSERT INTO employee (employee_name, employee_age, employee_gender, employee_dob, employee_ssn, employee_hours_worked, employee_salary, hourly_rate, overtime_hours, employee_dept, employee_type, employee_role, employee_phone, employee_email, employee_address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
      const result = await pool.query(sql, [employee_name, employee_age, employee_gender, employee_dob, employee_ssn, employee_hours_worked, employee_salary, hourly_rate, overtime_hours, employee_dept, employee_type, employee_role, employee_phone, employee_email, employee_address]);
      res.status(201).json({ message: "Employee added successfully", employeeId: result.insertId });
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  }

  // Delete an employee
  static async deleteEmployee(req, res) {
    try {
      const { employeeId } = req.params; // Make sure this matches with the route parameter name
      const sql = `DELETE FROM employee WHERE employee_id = ?`;
      await pool.query(sql, [employeeId]);
      res.status(200).json({ message: "Employee deleted successfully" });
    } catch (err) {
      res.status(500).json({ message: err.message });
    }
  }
}

export default AdminsController;
